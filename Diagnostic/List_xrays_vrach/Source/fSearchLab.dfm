object frmSearchLab: TfrmSearchLab
  Left = 305
  Top = 124
  Caption = #1055#1086#1080#1089#1082
  ClientHeight = 482
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 906
      Height = 74
      Margins.Right = 0
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object cxLabel1: TcxLabel
        Left = 10
        Top = 10
        Caption = #1060#1048#1054':'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object sFIO: TcxTextEdit
        Left = 48
        Top = 4
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsOffice11
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clMaroon
        Style.Font.Height = -19
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 1
        OnClick = sFIOClick
        OnEnter = sFIOEnter
        Height = 33
        Width = 385
      end
      object bEnter: TcxButton
        Left = 439
        Top = 4
        Width = 34
        Height = 33
        Action = aSearch
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
      end
      object bClear: TcxButton
        Left = 479
        Top = 4
        Width = 34
        Height = 33
        Action = aClearSearch
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000F00A0000F00A00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000007CB1006397
          00639700609600629300659300639200669B005B880000000000000000000000
          000000000000000000000000000000000072CE0080B9007DB8007AB50076B000
          78AE0075A5007DA70086AC008EB10091B3007E9B00758D006A8B00659B0071B2
          0000000000000000000000000000000000000000000000000074A7007FAA0083
          AC008BB10097BC009EC400B2DD00ABD500B4E000B5E200B1DC00A5CD0098BF00
          94B600728D0066990075BC000000000000000000000000000000000000000000
          0084BD0098C900A3C900B7E400B0DC00BEEE00B5E200BCEB00CBFD00B8E700C5
          F600B7E400A8D20096BC008EB2007A9B00699F00A19600000000000000000000
          00000000000000000000000085BE00BDEC00BFEF00BDED00C2F200B2E000D0FF
          00BDEC00D0FF00BEEE00BDED00ADD900A4CE008EB40087A9006F960077BB0000
          000000000000000000000000000000000000000094D8009FD300C2F100BFEE00
          BFEE00CCFF00BFEE00C8FB00C6F800C0F200C2F500B1E100A0CC0093BB0086A7
          007592007AB40000000000000000000000000000000000000000000000000089
          C200C7F900C6F700C4F600C1F300C2F300C4F700C0F300C3F600BDEF00B3E200
          A0CB008CB3007BA30070A01778A18A898A000000000000000000000000000000
          000000000000009EDA00A4D900C6F700C2F200C0F300C1F400BEF200BFF000BE
          F100BCEE00A5D40088BA0078AB4787A48A8D918D837F7B7E7C919C9C00000000
          00000000000000000000000000000000000092CD00C3F600C0F300BEEF00BDF0
          00BAEC00B4E500A7DB008AC31E84AE7597A6B2A49EA7A19D999E9E8791957254
          5564060600000000000000000000000000000000000000000000A4E500A9DD00
          BFF100B8EA00B0E20099CF0088BD4D94B4A9ACAFBFB1ABB0AFAEA7B0B39A989A
          7F4745770D009525006F07000000000000000000000000000000000000000000
          00000000009ED700A7DA0094CB1D91BE85AEC0D2C3BDC8C0BDBABEBFB2BDC49C
          807B8230218B1900A63A00AF4700B04A00771000000000000000000000000000
          00000000000000000000000000ACF64193AFAAB2B7E5D5CFD2CFCFC5CED4B8B9
          BE9A66578D2300A23200BA5000B95200B44E00B44E009D3800700D0000000000
          0000000000000000000000000000000000000000000000A89E9AACAEB0C9D6DF
          B9A29B9C4D2CA02C00BA4D00C75F00C15B00BC5600BA5400B953009A31008617
          00920000000000000000000000000000000000000000000000000000000000A8
          AFB2A06F52A43A00B74600CF6400CF6600CA6300C65E00C35D00C05A00BD5700
          9026009B1F000000000000000000000000000000000000000000000000000000
          00000000000000000000BA4500CE6900F2B96FE8A95FE0923CDD8E37DA8732CD
          7012C861009C3600931F00000000000000000000000000000000000000000000
          000000000000000000000000000000000000D50000B94A00B64C00BC5905B74F
          00B54300A63C00C3610BCF6801AD47009E2A0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          D04100B94A00B73A00000000A24100A83F00D36E02CF6800A53C00AD2D000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000AE3C00D76F00D87F21
          D67B18A33A00B031000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000000B5
          4000CF6800BD5600D3720BD16C02A73500000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000B44C00C36100B14B00AB4400D46F03AF4700A7360000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000FF0000AA4D00DA7400B95300DE7800B046
          00B63B0000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000BE4E00AB4500
          B54F00AE4600B140000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
      end
      object cxLabel2: TcxLabel
        Left = 48
        Top = 42
        Caption = #1055#1086#1083':'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object lbSex: TcxLabel
        Left = 87
        Top = 43
        Caption = '--'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel3: TcxLabel
        Left = 236
        Top = 42
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object lbRojd: TcxLabel
        Left = 320
        Top = 43
        Caption = '--'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object pnlTub: TPanel
        Left = 661
        Top = 2
        Width = 243
        Height = 70
        Align = alRight
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 8
        Visible = False
        object cxLabel4: TcxLabel
          Left = 5
          Top = 1
          Caption = #1058'-'#1091#1095#1105#1090
        end
        object cxLabel5: TcxLabel
          Left = 5
          Top = 24
          Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080' '#1085#1072' '#1091#1095#1105#1090':'
        end
        object cxLabel6: TcxLabel
          Left = 29
          Top = 47
          Caption = #1044#1072#1090#1072' '#1089#1085#1103#1090#1080#1103' '#1089' '#1091#1095#1105#1090#1072':'
        end
        object lbBegin: TcxLabel
          Left = 145
          Top = 24
          Caption = #1085#1077#1090
        end
        object lbEnd: TcxLabel
          Left = 145
          Top = 47
          Caption = #1085#1077#1090
        end
      end
    end
    object bClose: TcxButton
      AlignWithMargins = True
      Left = 912
      Top = 3
      Width = 85
      Height = 74
      Action = aClose
      Align = alRight
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 80
    Width = 1000
    Height = 402
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 998
      Height = 400
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object cxGr: TcxGrid
        Left = 0
        Top = 33
        Width = 694
        Height = 367
        Align = alClient
        PopupMenu = pmTV
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object TVPAC: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnFocusedRecordChanged = TVPACFocusedRecordChanged
          DataController.DataSource = dsPac
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.Appending = True
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object VPACCNTTUB: TcxGridDBColumn
            Caption = #1058'-'#1091#1095#1077#1090
            DataBinding.FieldName = 'CNTTUB'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = ilCntTub
            Properties.Items = <
              item
                ImageIndex = 0
                Value = '0'
              end
              item
                ImageIndex = 1
                Value = '1'
              end>
          end
          object VRGPLUS: TcxGridDBColumn
            Caption = '+'
            DataBinding.FieldName = 'CNTRGPLUS'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = ilRgPlus
            Properties.Items = <
              item
                ImageIndex = 0
                Value = '0'
              end
              item
                ImageIndex = 1
                Value = '1'
              end>
            HeaderAlignmentVert = vaCenter
            Width = 34
          end
          object VFIO: TcxGridDBColumn
            Caption = #1060#1048#1054
            DataBinding.FieldName = 'FIO'
            VisibleForCustomization = False
            Width = 153
          end
          object VROJD: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
            DataBinding.FieldName = 'FD_ROJD'
            Width = 185
          end
          object VNUMBER: TcxGridDBColumn
            Caption = #8470' '#1076#1086#1082'.'
            DataBinding.FieldName = 'NIB'
            Width = 181
          end
          object VTYPEDOC: TcxGridDBColumn
            Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'FC_NAME'
          end
          object VSOS: TcxGridDBColumn
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
            DataBinding.FieldName = 'STEK_COC'
            Width = 179
          end
          object VLASTFLU: TcxGridDBColumn
            Caption = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1092#1083#1102#1086#1088'.'
            DataBinding.FieldName = 'LASTFLU'
            Width = 166
          end
        end
        object cxGrLevel1: TcxGridLevel
          GridView = TVPAC
        end
      end
      object dxBarDockControl1: TdxBarDockControl
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 992
        Height = 30
        Margins.Top = 0
        Align = dalTop
        BarManager = BM
        SunkenBorder = True
        UseOwnSunkenBorder = True
      end
      object pnlNaz: TPanel
        Left = 702
        Top = 33
        Width = 296
        Height = 367
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
        object cxGrid2: TcxGrid
          Left = 0
          Top = 36
          Width = 296
          Height = 331
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          object TVISSL: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            OnCellDblClick = TVISSLCellDblClick
            OnCustomDrawCell = TVISSLCustomDrawCell
            DataController.DataSource = dsNaz
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'NAMEISSL'
                Column = VNAMEISSL
              end
              item
                Kind = skSum
                Column = VDOZA
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CellHints = True
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnFiltering = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object STATE: TcxGridDBColumn
              Caption = #1057#1090#1072#1090#1091#1089
              DataBinding.FieldName = 'STATE'
              Visible = False
              Width = 30
            end
            object VDATENAZ: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1085#1072#1079'.'
              DataBinding.FieldName = 'FD_NAZ'
              Width = 38
            end
            object VDATE: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1074#1099#1087'.'
              DataBinding.FieldName = 'FD_RUN'
              Width = 36
            end
            object VNAMEISSL: TcxGridDBColumn
              Caption = #1052#1077#1090#1086#1076#1080#1082#1072
              DataBinding.FieldName = 'NAMEISSL'
              Width = 143
            end
            object VSOSID: TcxGridDBColumn
              Caption = 'SOS_ID'
              DataBinding.FieldName = 'FK_NAZSOSID'
              Visible = False
              VisibleForCustomization = False
            end
            object VDOZA: TcxGridDBColumn
              Caption = #1044#1086#1079#1072
              DataBinding.FieldName = 'DOZA'
              Width = 35
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = TVISSL
          end
        end
        object dxBarDockControl2: TdxBarDockControl
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 290
          Height = 30
          Align = dalTop
          BarManager = BM
          SunkenBorder = True
          UseOwnSunkenBorder = True
        end
      end
      object cxSplitter1: TcxSplitter
        Left = 694
        Top = 33
        Width = 8
        Height = 367
        HotZoneClassName = 'TcxXPTaskBarStyle'
        HotZone.SizePercent = 44
        AlignSplitter = salRight
        Control = pnlNaz
      end
    end
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 281
    Top = 226
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091' '#1087#1086#1080#1089#1082#1072
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aSearch: TAction
      Hint = #1055#1086#1080#1089#1082' '#1087#1072#1094#1080#1077#1085#1090#1072
      ImageIndex = 39
      ShortCut = 13
      OnExecute = aSearchExecute
    end
    object aHistory: TAction
      Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
      Hint = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1087#1086' '#1087#1072#1094#1080#1077#1085#1090#1091
      ShortCut = 16450
      OnExecute = aHistoryExecute
    end
    object aInfo: TAction
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1072#1094#1080#1077#1085#1090#1077
      ImageIndex = 14
      ShortCut = 16457
      OnExecute = aInfoExecute
    end
    object aOpenMK: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1052#1050
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1052#1050
      ImageIndex = 0
      ShortCut = 114
      OnExecute = aOpenMKExecute
    end
    object actCloseNaz: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1085#1077#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 3
      OnExecute = actCloseNazExecute
    end
    object actEditNaz: TAction
      Caption = #1053#1072#1079#1085#1072#1095#1080#1090#1100
      Hint = 
        #1053#1072#1079#1085#1072#1095#1080#1090#1100' '#1082#1072#1073#1080#1085#1077#1090', '#1076#1072#1090#1091', '#1074#1088#1077#1084#1103'.'#13#10#1042#1085#1080#1084#1072#1085#1080#1077'! '#1053#1072#1079#1085#1072#1095#1072#1090#1100' '#1082#1072#1073#1080#1085#1077#1090', '#1076#1072 +
        #1090#1091' '#1080' '#1074#1088#1077#1084#1103' '#1088#1072#1079#1088#1077#1096#1072#1077#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103#1084', '#13#10#1080#1084#1077#1102#1097#1080#1084' '#1089#1090#1072#1090#1091#1089' "'#1053 +
        #1045' '#1042#1067#1055'.". '#13#10' '
      ImageIndex = 16
      OnExecute = actEditNazExecute
    end
    object actRefreshNaz: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1085#1077#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 25
      OnExecute = actRefreshNazExecute
    end
    object actLoadNaz: TAction
      Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1085#1077#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 21
      ShortCut = 16460
      OnExecute = actLoadNazExecute
    end
    object aClearSearch: TAction
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1087#1086#1080#1089#1082#1072
      ShortCut = 119
      OnExecute = aClearSearchExecute
    end
    object aPrintSearch: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1087#1086#1080#1089#1082#1072
      ImageIndex = 10
      OnExecute = aPrintSearchExecute
    end
    object aText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 6
      OnExecute = aTextExecute
    end
    object aWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 7
      OnExecute = aWebExecute
    end
    object aXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 8
      OnExecute = aXMLExecute
    end
    object aXLS: TAction
      Caption = 'Excel '#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel '#1092#1072#1081#1083
      ImageIndex = 9
      OnExecute = aXLSExecute
    end
    object aFill: TAction
      Hint = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1087#1088#1086#1090#1086#1082#1086#1083
      ImageIndex = 1
      OnExecute = aFillExecute
    end
    object aSysInfo: TAction
      Caption = #1057#1080#1089#1090#1077#1084#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ShortCut = 32890
      OnExecute = aSysInfoExecute
    end
    object aSnimki: TAction
      Hint = #1055#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1089#1085#1080#1084#1082#1080
      OnExecute = aSnimkiExecute
    end
    object aPrintLuchNagrList: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1083#1080#1089#1090#1072' '#1083#1091#1095#1077#1074#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080
      Hint = #1055#1077#1095#1072#1090#1100' '#1083#1080#1089#1090#1072' '#1083#1091#1095#1077#1074#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080
      ImageIndex = 6
      OnExecute = aPrintLuchNagrListExecute
    end
  end
  object dsPac: TDataSource
    DataSet = odsPac
    Left = 121
    Top = 282
  end
  object odsPac: TOracleDataSet
    SQL.Strings = (
      'SELECT TKARTA.FK_PEPLID AS FK_ID,'
      '       TKARTA.FP_TEK_COC,  '
      '       TKARTA.FK_ID AS PACID,'
      
        '       TKARTA.FC_FAM||'#39' '#39'||TKARTA.FC_IM||'#39' '#39'||TKARTA.FC_OTCH FIO' +
        ', '
      '       TKARTA.FD_ROJD,  '
      
        '       ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TKARTA.FK_PEPLID) SE' +
        'X,'
      '       ASU.GET_IB(TKARTA.FK_ID) AS NIB, '
      '       TKARTA.FK_ID AS PACID,'
      
        '       DECODE(TKARTA.FP_TEK_COC,3,'#39#1042#1067#1055#1048#1057#1040#1053#39',2,'#39#1042' '#1057#1058#1040#1062#1048#1054#1053#1040#1056#1045#39',-2,' +
        #39#1053#1040' '#1054#1060#1054#1056#1052#1051#1045#1053#1048#1048' '#1055#1054#39','#39#39') STEK_COC,'
      '       ASU.GET_LAST_FLUORO(TKARTA.FK_PEPLID) AS LASTFLU,'
      '       0 AS IS_AMBULANCE,'
      '       TUSLVID.FC_NAME,'
      '       (SELECT COUNT(*) FROM asu.TNAZIS '
      '         WHERE FK_PACID = ASU.GET_PEPLID(TKARTA.FK_ID) '
      '           AND FK_SMID = ASU.GET_XRAY_TUBDISPANCER '
      '           AND SYSDATE >= FD_NAZ '
      
        '           AND (SYSDATE < TO_DATE(FD_RUN)+1 OR FD_RUN IS NULL)) ' +
        'AS CNTTUB,'
      
        '       (SELECT COUNT(*) FROM asu.TNAZIS WHERE FK_PACID = ASU.GET' +
        '_PEPLID(TKARTA.FK_ID) AND FK_SMID = ASU.GET_XRAY_TUBDISPANCER) A' +
        'S CNTTUB_ALL,'
      '       (select count(*) '
      '          from asu.tib '
      
        '         where fk_pacid = tkarta.fk_peplid and fk_smid = (select' +
        ' fk_id from asu.tsmid where fc_synonim = '#39'XRAY_RG_PLUS'#39')) as cnt' +
        'RgPlus'
      ' '
      ''
      '  FROM ASU.TKARTA, ASU.TPERESEL, ASU.TDOCOBSL, ASU.TUSLVID'
      ' WHERE asu.GET_MAXPERESELID(TKARTA.FK_ID) = TPERESEL.FK_ID '
      '   AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID '
      '   AND TDOCOBSL.FK_VIDDOCID = TUSLVID.FK_ID')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000F00000005000000464B5F49440100000000000300000046494F0100
      000000000700000046445F524F4A44010000000000030000004E494201000000
      0000080000005354454B5F434F43010000000000030000005345580100000000
      00070000004C415354464C550100000000000500000050414349440100000000
      000700000050414349445F310100000000000C00000049535F414D42554C414E
      43450100000000000700000046435F4E414D4501000000000006000000434E54
      5455420100000000000A000000434E545455425F414C4C0100000000000A0000
      0046505F54454B5F434F4301000000000009000000434E545247504C55530100
      00000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsPacAfterOpen
    AfterScroll = odsPacAfterScroll
    Left = 121
    Top = 330
  end
  object BM: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 545
    Top = 266
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
      Caption = 'Spisok'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 404
      FloatTop = 232
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbHistory'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbOpenMK'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbInfo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bb1'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrintLuchNagrList'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Spisok'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BMBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Naz'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 404
      FloatTop = 232
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbEditNaz'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbFillNaz'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefreshNaz'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbSnimki'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cxCheckMK'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbCloseNaz'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Naz'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbHistory: TdxBarButton
      Action = aHistory
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000A56E6E
        9B67679A6666976565A16E6E0000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000008C
        0000A77676C59292C99797B27F7FAA7676A06E6EA16B6BA46D6DA56E6EA46E6E
        0000000000000000000000000000000000000000000000000000000000000000
        00000000DD9393A07272CA9B9BFFDFDFCA9797C39A9AD3B0B0C08F8FB37E7EAF
        7A7AA773739F6A6AA26A6AA26C6CA66D6D000000000000000000000000000000
        000000000000000000B26868A26E6ED1A6A6FFDFDFFFD9D9CB9A9ACFAEAEFFFF
        FFFFFBFBFEEEEEE7CACAD4ACACC29090B58080AC797998646400000000000000
        0000000000000000000000000000C88484A67272DAB3B3FFE3E3FFD8D8FFD9D9
        CF9C9CCDADADFFFDFDFFF6F6FFF6F6FFF7F7FFF8F8FFF8F8FEE3E3B27D7D9864
        64000000000000000000000000000000000000BA7F7FAA7575E2BFBFFFE7E7FF
        DCDCFFD9D9FFD8D8D0A2A2CCABABFFFFFFFFF8F8FFFBFBFFFAFAFFF7F7FFF5F5
        FFEEEEB07C7C966464000000000000000000000000000000000000AE7A7AE5C5
        C5FFEAEAFFE1E1FFDCDCFFD9D9FFD8D8D4A5A5CAAAAAFFFFFFFFFFFFC1A4A4D5
        BCBCF3E2E2FFF7F7FFF1F1B37D7D996666000000000000000000000000000000
        000000AD7878F9DBDBFFE4E4FFE0E0FFDBDBFFD8D8FFD8D8D8AAAACBACACFFFF
        FFFFFFFF794949B09191A98787FFFEFEFFF6F6B37D7D9A676700000000000000
        0000000000000000000000AF7979F8DBDBFFE0E0FFDCDCFFD9D9FFD6D6FFD6D6
        DBAFAFBD8F8FD5BABAE7DADACDBBBBFFFFFFBC9F9FFFFFFFFFFDFDB480809B69
        69000000000000000000000000000000000000AF7B7BFBD9D9FFDDDDFFDADAFF
        D7D7FFD5D5FFD5D5DEB2B2C59191C28B8BC18989BA8383BE8F8FCEACACDBC1C1
        F1E3E3B783839E6A6A000000000000000000000000000000000000B27E7EFDD9
        D9FFDADAFFD7D7FFD5D5FFD2D2FFD2D2E0B5B5DBBDBDFFFBFBF1DCDCE4C5C5DA
        AEAECD9999C28C8CBD8686C18E8E9E6D6D000000000000000000000000000000
        000000B28080FED6D6FFD5D5FFD4D4FFD2D2FFD0D0FFCECEE4BBBBD7BABAFFFB
        FBFFF7F7FFF8F8FFF8F8FFF7F7FFEEEEF7D9D9C896969F6D6D00000000000000
        0000000000000000000000B68181FFD3D3FFD3D3FFD0D0FFCFCFFECDCDFFCCCC
        E6BFBFD7B9B9FFFDFDFFF7F7FFF8F8FFF6F6FFF4F4FFF3F3FFF6F6CA9696A36F
        6F000000000000000000000000000000000000B68282FFD1D1FFCECEFECDCDFF
        CDCDFCC9C9FBC7C7E9C2C2D6B8B8FFFFFFFFFCFCEDDEDEFCEFEFFFFDFDFFF5F5
        FFF7F7CA9595A47171000000000000000000000000000000000000BB8686FFCF
        CFFECCCCFCC9C9FAC7C7F8C5C5F7C4C4EDC7C7D5B8B8FFFFFFFFFFFF90686885
        5959B69696FFF5F5FFFAFAC89494A67373000000000000000000000000000000
        000000BB8A8AFECBCBFAC6C6F7C5C5F6C3C3F4C1C1F2C1C1EFCBCBCFB2B2FFFF
        FFFFFFFF906868FFFFFFAA8686FDF4F4FFFFFFC89494AA777700000000000000
        0000000000000000000000BF8C8CF8C7C7F4C1C1F3C0C0F1BEBEEFBCBCEEBDBD
        F6DADAD7A5A5C68F8FCB9D9DD4B2B2D9BFBFDAC4C4F2E7E7FFFFFFC79595AC79
        79000000000000000000000000000000000000C19090F4C0C0EFBCBCEEBBBBEC
        B7B7F3CECEFDE8E8FFE5E5FFE8E8FFE6E6FBD9D9F4CCCCEAC0C0DFB0B0CC9898
        C08A8AC99696AD7A7A000000000000000000000000000000000000C69393EEBA
        BAE9B4B4EFC3C3FBE6E6FFEAEAFFE4E4FFE2E2FFE0E0FFDEDEFFDCDCFFDBDBFF
        DADAFFDCDCFFDEDEF4C7C7C69595B17C7C000000000000000000000000000000
        000000C89494ECBDBDF9E2E2FFF3F3FFECECFFE9E9FFE6E6FFE4E4FFE2E2FFDF
        DFFFDFDFFFE0E0FAD3D3DBADADC08B8BB98282C3868698747400000000000000
        0000000000000000000000C69494D9B1B1DEBBBBE5C3C3EBCCCCF3D6D6F9E0E0
        FFE7E7FFE8E8FFE0E0E4BDBDCA9A9AC08989C38A8AD290900000000000000000
        00000000000000000000000000000000000000C99191C29393C38E8EC49191C1
        8C8CBF8C8CBE8989BE8888C29090BD8888B88585C88F8F000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
    object bbInfo: TdxBarButton
      Action = aInfo
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbOpenMK: TdxBarButton
      Action = aOpenMK
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bb1: TdxBarButton
      Action = actLoadNaz
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEditNaz: TdxBarButton
      Action = actEditNaz
      Category = 0
    end
    object bbCloseNaz: TdxBarButton
      Action = actCloseNaz
      Category = 0
    end
    object bbRefreshNaz: TdxBarButton
      Action = actRefreshNaz
      Category = 0
    end
    object cxCheckMK: TcxBarEditItem
      Caption = #1055#1086' '#1090#1077#1082#1091#1097#1077#1081' '#1052#1050
      Category = 0
      Hint = #1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1081' '#1052#1050
      Visible = ivAlways
      ShowCaption = True
      Width = 25
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
      Properties.OnChange = cxCheckMKPropertiesChange
      InternalEditValue = 0
    end
    object bbFillNaz: TdxBarButton
      Action = aFill
      Category = 0
    end
    object bbSnimki: TdxBarButton
      Action = aSnimki
      Category = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFEFFA6A699B1B0ACDADADAFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF6D97FF4392
        F6EEE9DFB0ADABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFDFDFF6C95FF439AFF6ADAFF5DADF5A8A091FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7F66089FD469FFF6FDAFF50AC
        FF5485FFF5F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E3E4C7C8CAD3D3D4FA
        FAFABFBBB77091B261D3FF4EAAFF5B88FFF8F9FFFFFFFFFFFFFFFFFFFFFFFFFF
        EBEBEC979A9BB3A081D2B689C3AB84908E88737478FFF7F06B93BD5583FEF9FA
        FFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F398958EF5CB84F5CB84F1C885F5CE8EFC
        D08CAE9E8577787BC0BAB0F7F8FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFB1B4
        ECCB8EF3D192EECE92EDCC8EECC784EDC687FDD28F98958EFEFEFEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFA4A199FEDFA1F2DAA5F2DBA7F1D79FEFD097EC
        C886F6D298C1A987E3E3E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABA596
        FFEBB9F8ECC6F7EBC0F5E3B2F2DAA3EECF94F4D093CFB68DD5D6D7FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFACA9A6FFF7CBFDFAE6FDF9E7F8EDC5F4E0B0F0
        D49BFAD594AF9F85EFEFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D6D8
        D5CCB1FFFFF2FFFFF2FBF3D2F6E2B4F7D99EF6D393A1A1A4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEBBBBBCD6CFB6FFFFDCFFF6CAFFEBB1ED
        D49C989590EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCFCFD1A4A5A0A8A3979D9A93AAACB0F2F2F2FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      ImageIndex = 6
      PaintStyle = psCaptionGlyph
    end
    object bbPrintLuchNagrList: TdxBarButton
      Action = aPrintLuchNagrList
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object pmTV: TPopupMenu
    Images = frmMain.ilMain
    Left = 280
    Top = 170
    object N1: TMenuItem
      Action = aPrintSearch
    end
    object N3: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 5
      object N4: TMenuItem
        Action = aText
      end
      object Web1: TMenuItem
        Action = aWeb
      end
      object XML1: TMenuItem
        Action = aXML
      end
      object Excel1: TMenuItem
        Action = aXLS
      end
    end
    object N2: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 27
      OnClick = N2Click
    end
  end
  object odsNaz: TOracleDataSet
    SQL.Strings = (
      'select tnazis.fk_id, '
      '       tnazis.fk_smid,'
      '       tnazis.fk_resultid, '
      '       tnazis.fc_type,'
      '       asu.get_owner_from_smid(tnazis.fk_smid) as owner,'
      '       tnazis.fd_naz,'
      
        '       to_char(tnazis.fd_naz, '#39'dd.mm.yyyy hh24:mi'#39')||'#39'-'#39'||to_cha' +
        'r(tnazis.fd_run, '#39'dd.mm.yyyy hh24:mi'#39') as fd_naz_run,'
      '       tnazis.fd_run as run_date,'
      '       to_char(tnazis.fd_run, '#39'dd.mm.yyyy hh24:mi'#39') as fd_run,'
      '       tnazis.fk_pacid,'
      '       tnazis.fk_roomid,'
      '       tnazis.fk_nazsosid,'
      '       asu.get_name_rgissl(tnazis.fk_smid) as nameissl, '
      
        '       asu.pkg_lists.get_pac_kontrol(tnazis.fk_pacid) as is_rean' +
        'im,'
      '       asu.get_smidorder(tnazis.fk_smid) as smidorder,'
      '       asu.is_ambulance(tnazis.fk_pacid) as is_ambulance,'
      
        '       (select max(fn_num) from asu.tib where fk_pacid = tnazis.' +
        'fk_id and fk_smid = -1 and fk_smeditid = -1) as doza,'
      '       0 as fp_tek_coc,'
      '       tnazis.FC_accessionnumber,'
      '       DECODE(tnazis.FK_NAZSOSID, '
      '              2, '#39#1053#1045' '#1042#1067#1055'.'#39', '
      
        '              1, '#39#1042#1067#1055'.'#39'||'#39': '#39'||ASU.DO_VRACHFIO(tnazis.FK_ISPOLID' +
        '),'
      '              3, '#39#1053#1045#1071#1042#1050#1040#39', '
      
        '             -11, '#39#1042#1067#1055'. '#1056#1051#39'||'#39': '#39'||ASU.DO_VRACHFIO(tnazis.FK_ISP' +
        'OLID), '
      '              89, '#39#1056#1045#1050#1054#1052#1045#1053#1044#1054#1042#1040#1053#1054#39', '
      
        '              23, '#39#1054#1058#1052#1045#1053#1045#1053#1054#39'||'#39': '#39'||ASU.DO_VRACHFIO(tnazis.FK_IS' +
        'POLID)) STATE'
      '        '
      '  from asu.tnazis, asu.tambulance '
      ' where tnazis.fk_pacid = tambulance.fk_id '
      '   and tambulance.fk_peplid = :pfk_pacid'
      '   and tnazis.fk_nazsosid <> asu.get_pass_registrator'
      
        '   and tnazis.fk_smid in (select fk_smid from asu.tnazvrach wher' +
        'e fk_sotrid = :psotrid)'
      '/*   and tnazis.fk_smid in (select fk_id from asu.tsmid'
      '                           where fl_showanal = 1'
      '                             and fl_del = 0'
      '                          start with fk_id = asu.get_rg_issl'
      '                          connect by prior fk_id = fk_owner) */'
      '                  '
      'union all'
      ''
      'select tnazis.fk_id, '
      '       tnazis.fk_smid,'
      '       tnazis.fk_resultid,  '
      '       tnazis.fc_type,'
      '       asu.get_owner_from_smid(tnazis.fk_smid) as owner,'
      '       tnazis.fd_naz,'
      
        '       to_char(tnazis.fd_naz, '#39'dd.mm.yyyy hh24:mi'#39')||'#39'-'#39'||to_cha' +
        'r(tnazis.fd_run, '#39'dd.mm.yyyy hh24:mi'#39') as fd_naz_run,'
      '       tnazis.fd_run as run_date,'
      '       to_char(tnazis.fd_run, '#39'dd.mm.yyyy hh24:mi'#39') as fd_run,'
      '       tnazis.fk_pacid,'
      '       tnazis.fk_roomid,'
      '       tnazis.fk_nazsosid,'
      '       asu.get_name_rgissl(tnazis.fk_smid) as nameissl, '
      
        '       asu.pkg_lists.get_pac_kontrol(tnazis.fk_pacid) as is_rean' +
        'im,'
      '       asu.get_smidorder(tnazis.fk_smid) as smidorder,'
      '       asu.is_ambulance(tnazis.fk_pacid) as is_ambulance,'
      
        '       (select max(fn_num) from asu.tib where fk_pacid = tnazis.' +
        'fk_id and fk_smid = -1 and fk_smeditid = -1) as doza,'
      '       tkarta.fp_tek_coc,'
      '       tnazis.FC_accessionnumber,'
      '       DECODE(tnazis.FK_NAZSOSID, '
      '              2, '#39#1053#1045' '#1042#1067#1055'.'#39', '
      
        '              1, '#39#1042#1067#1055'.'#39'||'#39': '#39'||ASU.DO_VRACHFIO(tnazis.FK_ISPOLID' +
        '),'
      '              3, '#39#1053#1045#1071#1042#1050#1040#39', '
      
        '             -11, '#39#1042#1067#1055'. '#1056#1051#39'||'#39': '#39'||ASU.DO_VRACHFIO(tnazis.FK_ISP' +
        'OLID), '
      '              89, '#39#1056#1045#1050#1054#1052#1045#1053#1044#1054#1042#1040#1053#1054#39', '
      
        '              23, '#39#1054#1058#1052#1045#1053#1045#1053#1054#39'||'#39': '#39'||ASU.DO_VRACHFIO(tnazis.FK_IS' +
        'POLID)) STATE'
      '        '
      '  from asu.tnazis, asu.tkarta '
      ' where tnazis.fk_pacid = tkarta.fk_id '
      '   and tkarta.fk_peplid = :pfk_pacid'
      '   and tnazis.fk_nazsosid <> asu.get_pass_registrator'
      
        '   and tnazis.fk_smid in (select fk_smid from asu.tnazvrach wher' +
        'e fk_sotrid = :psotrid)'
      '/*   and tnazis.fk_smid in (select fk_id from asu.tsmid'
      '                           where fl_showanal = 1'
      '                             and fl_del = 0'
      '                          start with fk_id = asu.get_rg_issl'
      '                          connect by prior fk_id = fk_owner) */'
      '                  '
      'order by smidorder, fd_naz')
    Optimize = False
    Variables.Data = {
      03000000020000000A0000003A50464B5F504143494403000000000000000000
      0000080000003A50534F54524944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001200000005000000464B5F494401000000000007000000464B5F534D
      49440100000000000600000046445F4E415A010000000000080000004E414D45
      4953534C0100000000000600000046445F52554E01000000000008000000464B
      5F504143494401000000000009000000464B5F524F4F4D49440100000000000B
      000000464B5F4E415A534F534944010000000000050000004F574E4552010000
      0000000A00000046445F4E415A5F52554E0100000000000800000052554E5F44
      4154450100000000000900000049535F5245414E494D01000000000009000000
      534D49444F524445520100000000000C00000049535F414D42554C414E434501
      000000000004000000444F5A410100000000000B000000464B5F524553554C54
      49440100000000000700000046435F545950450100000000000A00000046505F
      54454B5F434F43010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsNazBeforeOpen
    AfterOpen = odsNazAfterOpen
    AfterScroll = odsNazAfterScroll
    Left = 685
    Top = 318
    object odsNazFK_RESULTID: TFloatField
      FieldName = 'FK_RESULTID'
    end
    object odsNazFK_ID: TFloatField
      FieldName = 'FK_ID'
    end
    object odsNazFK_SMID: TFloatField
      FieldName = 'FK_SMID'
    end
    object odsNazFC_TYPE: TStringField
      FieldName = 'FC_TYPE'
      Size = 50
    end
    object odsNazOWNER: TFloatField
      FieldName = 'OWNER'
    end
    object odsNazFD_NAZ: TDateTimeField
      FieldName = 'FD_NAZ'
    end
    object odsNazFD_NAZ_RUN: TStringField
      FieldName = 'FD_NAZ_RUN'
      Size = 33
    end
    object odsNazRUN_DATE: TDateTimeField
      FieldName = 'RUN_DATE'
    end
    object odsNazFD_RUN: TStringField
      FieldName = 'FD_RUN'
      Size = 16
    end
    object odsNazFK_PACID: TFloatField
      FieldName = 'FK_PACID'
    end
    object odsNazFK_ROOMID: TIntegerField
      FieldName = 'FK_ROOMID'
    end
    object odsNazFK_NAZSOSID: TFloatField
      FieldName = 'FK_NAZSOSID'
    end
    object odsNazNAMEISSL: TStringField
      FieldName = 'NAMEISSL'
      Size = 4000
    end
    object odsNazIS_REANIM: TFloatField
      FieldName = 'IS_REANIM'
    end
    object odsNazSMIDORDER: TFloatField
      FieldName = 'SMIDORDER'
    end
    object odsNazIS_AMBULANCE: TFloatField
      FieldName = 'IS_AMBULANCE'
    end
    object odsNazDOZA: TFloatField
      FieldName = 'DOZA'
    end
    object odsNazFP_TEK_COC: TFloatField
      FieldName = 'FP_TEK_COC'
    end
    object odsNazstate: TStringField
      FieldName = 'state'
      Size = 50
    end
    object odsNazFC_accessionnumber: TStringField
      FieldName = 'FC_accessionnumber'
      Size = 50
    end
  end
  object dsNaz: TDataSource
    DataSet = odsNaz
    Left = 685
    Top = 366
  end
  object frxRepSearch: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39819.565526863430000000
    ReportOptions.LastChange = 41214.471800497680000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepSearchGetValue
    Left = 393
    Top = 186
    Datasets = <
      item
        DataSet = frxDBSearch
        DataSetName = 'frxDBSearch'
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
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Width = 1084.725110000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 1084.725110000000000000
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
          Align = baWidth
          Top = 34.574830000000000000
          Width = 1084.725110000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            
              #1056#160#1056#181#1056#183#1057#1107#1056#187#1057#1034#1057#8218#1056#176#1057#8218#1057#8249' '#1056#1111#1056#1109#1056#1105#1057#1027#1056#1108#1056#176' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#1109#1056#1030'. '#1056#1032#1057#1027#1056#187#1056#1109#1056#1030 +
              #1056#1105#1056#181' '#1056#1111#1056#1109#1056#1105#1057#1027#1056#1108#1056#176': [USLOVIE]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 60.472480000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
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
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 52.913420000000000000
          Top = 60.472480000000000000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
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
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 377.953000000000000000
          Top = 60.472480000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 487.559370000000000000
          Top = 60.472480000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#1105#1056#1111' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 680.315400000000000000
          Top = 60.472480000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1109#1057#1027#1057#8218#1056#1109#1057#1039#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 925.984850000000000000
          Top = 60.472480000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1057#1027#1056#187#1056#181#1056#1169#1056#1029#1057#1039#1057#1039' '#1057#8222#1056#187#1057#1035#1056#1109#1057#1026'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Align = baWidth
          Top = 16.118120000000000000
          Width = 1084.725110000000000000
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
      object PageFooter1: TfrxPageFooter
        Height = 15.118120000000000000
        Top = 238.110390000000000000
        Width = 1084.725110000000000000
        object Memo21: TfrxMemoView
          Left = 869.291900000000000000
          Width = 211.653680000000000000
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
        object Memo11: TfrxMemoView
          Left = 3.779530000000000000
          Width = 865.512370000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADESIGN], [DATESYS] [SOTRNAME]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 158.740260000000000000
        Width = 1084.725110000000000000
        DataSet = frxDBSearch
        DataSetName = 'frxDBSearch'
        RowCount = 0
        Stretched = True
        object Memo12: TfrxMemoView
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
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 52.913420000000000000
          Width = 325.039580000000000000
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
            '[frxDBSearch."FIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 377.953000000000000000
          Width = 109.606370000000000000
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
            '[frxDBSearch."NIB"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 487.559370000000000000
          Width = 192.756030000000000000
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
            '[frxDBSearch."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 680.315400000000000000
          Width = 245.669450000000000000
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
            '[frxDBSearch."STEK_COC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 925.984850000000000000
          Width = 154.960730000000000000
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
            '[frxDBSearch."LASTFLU"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBSearch: TfrxDBDataset
    UserName = 'frxDBSearch'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FK_ID=FK_ID'
      'FP_TEK_COC=FP_TEK_COC'
      'PACID=PACID'
      'FIO=FIO'
      'FD_ROJD=FD_ROJD'
      'SEX=SEX'
      'NIB=NIB'
      'PACID_1=PACID_1'
      'STEK_COC=STEK_COC'
      'LASTFLU=LASTFLU'
      'IS_AMBULANCE=IS_AMBULANCE'
      'FC_NAME=FC_NAME'
      'CNTTUB=CNTTUB'
      'CNTTUB_ALL=CNTTUB_ALL'
      'CNTRGPLUS=CNTRGPLUS')
    DataSet = odsPac
    BCDToCurrency = False
    Left = 393
    Top = 242
  end
  object sdPopUp: TSaveDialog
    Left = 393
    Top = 299
  end
  object odsTubDates: TOracleDataSet
    SQL.Strings = (
      'SELECT TO_CHAR(FD_NAZ, '#39'DD.MM.YYYY'#39') AS FD_NAZSTR,'
      '       TO_CHAR(FD_RUN, '#39'DD.MM.YYYY'#39') AS FD_RUNSTR,'
      '       FD_NAZ, FD_RUN  '
      '  FROM ASU.TNAZIS '
      ' WHERE FK_PACID = :PFK_PEPLID'
      '   AND FK_SMID = ASU.GET_XRAY_TUBDISPANCER'
      'ORDER BY FK_ID ASC')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F5045504C4944030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000001100000005000000464B5F49440100000000000300000046494F0100
      000000000700000046445F524F4A440100000000000900000046435F444F4353
      45520100000000000900000046435F444F434E554D0100000000000A00000046
      445F444F4344415445010000000000030000004E494201000000000008000000
      5354454B5F434F4301000000000003000000534558010000000000070000004C
      415354464C550100000000000500000050414349440100000000000700000050
      414349445F310100000000000C00000049535F414D42554C414E434501000000
      00000700000046435F4E414D450100000000000A00000046505F54454B5F434F
      430100000000000500000055534C494401000000000006000000434E54545542
      010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 121
    Top = 378
  end
  object ilCntTub: TImageList
    Left = 280
    Top = 336
    Bitmap = {
      494C010102000400840010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA000000CC000000CC000000CC000000CC00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA000000CC000000CC00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA000000CC000000CC00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA000000CC000000CC00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA000000CC000000CC00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA000000CC000000CC00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA000000CC000000CC00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA000000CC000000CC00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA000000CC000000CC00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA000000CC000000CC00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00EAEAEA000000CC00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA000000CC000000CC00EAEAEA00EAEAEA00EAEA
      EA000000CC00EAEAEA00EAEAEA00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00EAEAEA000000CC000000
      CC000000CC000000CC000000CC000000CC000000CC000000CC000000CC000000
      CC000000CC00EAEAEA00EAEAEA00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00EAEAEA000000CC000000
      CC000000CC000000CC000000CC000000CC000000CC000000CC000000CC000000
      CC000000CC00EAEAEA00EAEAEA00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00EAEAEA000000CC00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEA
      EA000000CC00EAEAEA00EAEAEA00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object tmrCheckApplication: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrCheckApplicationTimer
    Left = 112
    Top = 164
  end
  object ilRgPlus: TImageList
    Left = 328
    Top = 336
    Bitmap = {
      494C010102000400840010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241CED00241CED000000
      0000000000000000000000000000241CED00241CED0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241CED00241CED000000
      0000000000000000000000000000241CED00241CED0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241CED00241CED000000
      00000000000000000000241CED00241CED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241CED00241CED000000
      00000000000000000000241CED00241CED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241CED00241CED000000
      000000000000241CED00241CED0000000000000000000000000000000000241C
      ED00241CED000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241CED00241CED00241C
      ED00241CED00241CED00241CED0000000000000000000000000000000000241C
      ED00241CED000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED0000000000241CED00241CED00241C
      ED00241CED00241CED00241CED00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241CED00241CED000000
      00000000000000000000241CED00241CED00000000000000000000000000241C
      ED00241CED000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241CED00241CED000000
      00000000000000000000241CED00241CED00000000000000000000000000241C
      ED00241CED000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241CED00241CED000000
      00000000000000000000241CED00241CED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241CED00241CED00241C
      ED00241CED00241CED00241CED00000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      FFFF9E7F00000000FFFF9E7F00000000FFFF9CFF00000000FFFF9CFF00000000
      FFFF99E700000000FFFF81E700000000FFFF808100000000FFFF9CE700000000
      FFFF9CE700000000FFFF9CFF00000000FFFF80FF00000000FFFF81FF00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object odsLuchNagrList: TOracleDataSet
    SQL.Strings = (
      'SELECT VRES.FK_NAZID,'
      '       to_char(VRES.FD_INS, '#39'dd.mm.yyyy'#39') AS fd_ins,'
      '       FK_SMID,'
      '       asu.get_luchnagr_issl_name(vres.fk_nazid) NM,'
      
        '       NVL(ASU.GET_DOZA(VRES.FK_NAZID), STAT.PKG_HANT.GET_DOZA(V' +
        'RES.FK_NAZID, VRES.FK_SMID)) D'
      '  FROM asu.VRES,'
      '       (SELECT FK_ID'
      '          FROM asu.TSMID'
      '       CONNECT BY PRIOR FK_ID = FK_OWNER'
      
        '         START WITH FC_SYNONIM IN ('#39'ISL_RENTGN'#39', '#39'RENTGENXIR_OPE' +
        'R'#39', '#39'RENTGENXIR_ISSLED'#39')'
      '       ) TSMID'
      ' WHERE VRES.FK_PACID = :PFK_PACID'
      '   AND VRES.FK_SMID = TSMID.FK_ID'
      '   AND VRES.FK_SOS = asu.GET_VYPNAZSOSID'
      
        '   AND NVL(ASU.GET_DOZA(VRES.FK_NAZID), STAT.PKG_HANT.GET_DOZA(V' +
        'RES.FK_NAZID, VRES.FK_SMID)) > 0'
      ' ORDER BY FD_INS'
      '             ')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464B5F504143494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000008000000464B5F4E415A4944010000000000060000004644
      5F494E5301000000000007000000464B5F534D4944010000000000020000004E
      4D0100000000000100000044010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsPacAfterOpen
    AfterScroll = odsPacAfterScroll
    Left = 713
    Top = 178
  end
  object frxDBLuchNagrList: TfrxDBDataset
    UserName = 'frxDBLuchNagrList'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FK_NAZID=FK_NAZID'
      'FD_INS=FD_INS'
      'FK_SMID=FK_SMID'
      'NM=NM'
      'D=D')
    DataSet = odsLuchNagrList
    BCDToCurrency = False
    Left = 800
    Top = 176
  end
  object frxRepLuchNagrList: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41542.343457256900000000
    ReportOptions.LastChange = 41542.357771631940000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 896
    Top = 176
    Datasets = <
      item
        DataSet = frxDBLPU
        DataSetName = 'frxDBLPU'
      end
      item
        DataSet = frxDBLuchNagrList
        DataSetName = 'frxDBLuchNagrList'
      end>
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
        Height = 131.527644000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBLPU."FC_LPU"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baWidth
          Top = 29.858287000000000000
          Width = 718.110700000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8250#1056#1105#1057#1027#1057#8218' '#1056#187#1057#1107#1057#8225#1056#181#1056#1030#1056#1109#1056#8470' '#1056#1029#1056#176#1056#1110#1057#1026#1057#1107#1056#183#1056#1108#1056#1105' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baWidth
          Top = 75.590551180000000000
          Width = 718.110700000000000000
          Height = 18.897637800000000000
          ShowHint = False
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218': <b>[frxDBLPU."FC_FIO"]</b>')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baWidth
          Top = 98.267780000000000000
          Width = 718.110700000000000000
          Height = 18.897637800000000000
          ShowHint = False
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039': [frxDBLPU."FD_BITH"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677165350000000000
        Top = 256.252134000000000000
        Width = 718.110700000000000000
        AllowSplit = True
        DataSet = frxDBLuchNagrList
        DataSetName = 'frxDBLuchNagrList'
        KeepTogether = True
        RowCount = 0
        Stretched = True
        object Memo8: TfrxMemoView
          Width = 94.488188980000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBLuchNagrList."FD_INS"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 604.724409450000000000
          Width = 113.385826770000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataField = 'D'
          DataSet = frxDBLuchNagrList
          DataSetName = 'frxDBLuchNagrList'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBLuchNagrList."D"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 94.488188980000000000
          Width = 510.236220470000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataField = 'NM'
          DataSet = frxDBLuchNagrList
          DataSetName = 'frxDBLuchNagrList'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[frxDBLuchNagrList."NM"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 30.236220472440900000
        Top = 207.118244000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          ShowHint = False
          AllowHTMLTags = True
          Color = 10218495
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 604.724409450000000000
          Width = 113.385826770000000000
          Height = 30.236220470000000000
          ShowHint = False
          AllowHTMLTags = True
          Color = 10218495
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#183#1056#176' ('#1056#1114#1056#8212#1056#8217')')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 94.488188980000000000
          Width = 510.236220470000000000
          Height = 30.236220470000000000
          ShowHint = False
          AllowHTMLTags = True
          Color = 10218495
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1056#1105#1056#1169' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 65.007916000000000000
        Top = 297.826964000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Left = 604.724409450000000000
          Width = 113.385826770000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = frxDBLuchNagrList
          DataSetName = 'frxDBLuchNagrList'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBLuchNagrList."D">,MasterData1)]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 94.488188980000000000
          Width = 510.236220470000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataSet = frxDBLuchNagrList
          DataSetName = 'frxDBLuchNagrList'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#173#1056#173#1056#8221' ('#1056#1114#1056#8212#1056#8217')')
          ParentFont = False
        end
      end
    end
  end
  object odsLPU: TOracleDataSet
    SQL.Strings = (
      
        'select (select max(i.fc_value) from asu.tsmini i where i.fc_sect' +
        'ion = '#39'CONFIG'#39' and i.fc_key = '#39'S_NAME'#39') AS fc_lpu,'
      
        '       asu.pkg_regist_pacfunc.get_pac_fullfio(:pfk_pacid) AS fc_' +
        'fio,'
      
        '       asu.pkg_regist_pacfunc.get_pac_bith(:pfk_pacid) AS fd_bit' +
        'h'
      '  from dual')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464B5F504143494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000600000046435F4C50550100000000000600000046435F46
      494F0100000000000700000046445F42495448010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsPacAfterOpen
    AfterScroll = odsPacAfterScroll
    Left = 713
    Top = 226
  end
  object frxDBLPU: TfrxDBDataset
    UserName = 'frxDBLPU'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FC_LPU=FC_LPU'
      'FC_FIO=FC_FIO'
      'FD_BITH=FD_BITH')
    DataSet = odsLPU
    BCDToCurrency = False
    Left = 800
    Top = 224
  end
  object mshSQL: TJvMultiStringHolder
    MultipleStrings = <
      item
        Name = 'default'
        Strings.Strings = (
          'SELECT TAMBULANCE.FK_PEPLID AS FK_ID, '
          
            '        TAMBULANCE.FC_FAM||'#39' '#39'||TAMBULANCE.FC_IM||'#39' '#39'|| TAMBULAN' +
            'CE.FC_OTCH FIO, '
          
            '        DECODE(TO_CHAR(TAMBULANCE.FD_ROJD, '#39'dd.mm.yyyy hh24:mi:s' +
            's'#39'), '#39'00.00.0000 00:00:00'#39', TRUNC(SYSDATE), TAMBULANCE.FD_ROJD) ' +
            'FD_ROJD, '
          '        TUSLVID.FC_NAME, '
          
            '        ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TAMBULANCE.FK_PEPLI' +
            'D) SEX, '
          '        ASU.GET_IB(TAMBULANCE.FK_ID) AS NIB, '
          '        '#39#1040#1084#1073#1091#1083#1072#1090#1086#1088#1085#1086#1077' '#1083#1077#1095#1077#1085#1080#1077#39' STEK_COC, '
          '        TAMBULANCE.FK_ID PACID, '
          '        ASU.GET_LAST_FLUORO(TAMBULANCE.FK_PEPLID) AS LASTFLU, '
          '        1 AS IS_AMBULANCE, '
          '        0 AS FP_TEK_COC, '
          '        (SELECT max(1) FROM ASU.TNAZIS '
          
            '          WHERE FK_PACID = TAMBULANCE.FK_PEPLID AND FK_SMID = AS' +
            'U.GET_XRAY_TUBDISPANCER'
          '            AND SYSDATE >= FD_NAZ '
          
            '            AND (SYSDATE < TO_DATE(FD_RUN)+1 OR FD_RUN IS NULL))' +
            ' AS CNTTUB, '
          
            '        (SELECT max(1) FROM ASU.TNAZIS WHERE FK_PACID = TAMBULAN' +
            'CE.FK_PEPLID AND FK_SMID = ASU.GET_XRAY_TUBDISPANCER) AS CNTTUB_' +
            'ALL, '
          
            '        (select count(*) from asu.tib where fk_pacid = tambulanc' +
            'e.fk_peplid and fk_smid = (select fk_id from asu.tsmid where fc_' +
            'synonim = '#39'XRAY_RG_PLUS'#39')) as cntRgPlus '
          '   FROM ASU.TAMBULANCE, ASU.TDOCOBSL, ASU.TUSLVID '
          '  WHERE TAMBULANCE.FC_FAM LIKE :pFAM'
          '    AND NVL(TAMBULANCE.FC_IM,'#39' '#39') LIKE :pIM'
          '    AND NVL(TAMBULANCE.FC_OTCH,'#39' '#39') LIKE :pOTCH'
          '    AND TAMBULANCE.FK_DOCOBSL = TDOCOBSL.FK_ID '
          '    AND TDOCOBSL.FK_VIDDOCID = TUSLVID.FK_ID '
          '  UNION ALL '
          '  SELECT TKARTA.FK_PEPLID AS FK_ID, '
          
            '        TKARTA.FC_FAM||'#39' '#39'||TKARTA.FC_IM||'#39' '#39'||TKARTA.FC_OTCH FI' +
            'O, '
          
            '        DECODE(TO_CHAR(TKARTA.FD_ROJD, '#39'dd.mm.yyyy hh24:mi:ss'#39'),' +
            ' '#39'00.00.0000 00:00:00'#39', TRUNC(SYSDATE), TKARTA.FD_ROJD) FD_ROJD,' +
            ' '
          '        TUSLVID.FC_NAME, '
          
            '        ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TKARTA.FK_PEPLID) S' +
            'EX, '
          '        ASU.GET_IB(TKARTA.FK_ID) AS NIB, '
          
            '        DECODE(TKARTA.FP_TEK_COC,3,'#39#1042#1099#1087#1080#1089#1072#1085#39',2,'#39#1042' '#1089#1090#1072#1094#1080#1086#1085#1072#1088#1077#39',-2' +
            ','#39#1053#1072' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1080' '#1055#1054#39','#39#39') STEK_COC, '
          '        TKARTA.FK_ID PACID, '
          '        ASU.GET_LAST_FLUORO(TKARTA.FK_PEPLID) AS LASTFLU, '
          '        0 AS IS_AMBULANCE, '
          '        TKARTA.FP_TEK_COC, '
          '        (SELECT max(1) FROM ASU.TNAZIS '
          
            '          WHERE FK_PACID = TKARTA.FK_PEPLID AND FK_SMID = ASU.GE' +
            'T_XRAY_TUBDISPANCER '
          '            AND SYSDATE >= FD_NAZ '
          
            '            AND (SYSDATE < TO_DATE(FD_RUN)+1 OR FD_RUN IS NULL))' +
            ' AS CNTTUB, '
          
            '        (SELECT max(1) FROM ASU.TNAZIS WHERE FK_PACID = TKARTA.F' +
            'K_PEPLID AND FK_SMID = ASU.GET_XRAY_TUBDISPANCER) AS CNTTUB_ALL,' +
            ' '
          
            '        (select count(*) from asu.tib where fk_pacid = tkarta.fk' +
            '_peplid and fk_smid = (select fk_id from asu.tsmid where fc_syno' +
            'nim = '#39'XRAY_RG_PLUS'#39')) as cntRgPlus '
          '   FROM ASU.TKARTA, ASU.TUSLVID '
          '  WHERE TKARTA.FC_FAM LIKE :pFAM'
          '    AND NVL(TKARTA.FC_IM,'#39' '#39') LIKE :pIM'
          '    AND NVL(TKARTA.FC_OTCH,'#39' '#39') LIKE :pOTCH'
          '    AND TKARTA.FK_USLVIDID = TUSLVID.FK_ID '
          '  ORDER BY FIO ')
      end
      item
        Name = 'un_fluoro'
        Strings.Strings = (
          
            '/*WITH cVN AS (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM IN (' +
            #39'XRAY_VRACH_RESUME'#39', '#39'OTMETKI_FLU_RESUME2'#39')),'
          
            'cSmid AS (SELECT FK_ID FROM ASU.TSMID WHERE FL_SHOWANAL = 1 AND ' +
            'FL_DEL = 0 START WITH FC_SYNONIM = '#39'ISSLED_FLUROGR'#39' CONNECT BY P' +
            'RIOR FK_ID = FK_OWNER)'
          '*/'
          
            'select fk_id,fio,fd_rojd,fc_name,sex,nib,stek_coc,pacid,case whe' +
            'n is_norm > 0 then lastflu else null end lastflu,is_ambulance,'
          'fp_tek_coc,cnttub,cnttub_all,cntrgplus from ( '
          'SELECT TAMBULANCE.FK_PEPLID AS FK_ID, '
          
            '        TAMBULANCE.FC_FAM||'#39' '#39'||TAMBULANCE.FC_IM||'#39' '#39'|| TAMBULAN' +
            'CE.FC_OTCH FIO, '
          
            '        DECODE(TO_CHAR(TAMBULANCE.FD_ROJD, '#39'dd.mm.yyyy hh24:mi:s' +
            's'#39'), '#39'00.00.0000 00:00:00'#39', TRUNC(SYSDATE), TAMBULANCE.FD_ROJD) ' +
            'FD_ROJD, '
          '        TUSLVID.FC_NAME, '
          
            '        ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TAMBULANCE.FK_PEPLI' +
            'D) SEX, '
          '        ASU.GET_IB(TAMBULANCE.FK_ID) AS NIB, '
          '        '#39#1040#1084#1073#1091#1083#1072#1090#1086#1088#1085#1086#1077' '#1083#1077#1095#1077#1085#1080#1077#39' STEK_COC, '
          '        TAMBULANCE.FK_ID PACID, '
          '        ASU.GET_LAST_FLUORO(TAMBULANCE.FK_PEPLID) AS LASTFLU, '
          '        1 AS IS_AMBULANCE, '
          '        0 AS FP_TEK_COC, '
          '        (SELECT max(1) FROM ASU.TNAZIS '
          
            '          WHERE FK_PACID = TAMBULANCE.FK_PEPLID AND FK_SMID = AS' +
            'U.GET_XRAY_TUBDISPANCER'
          '            AND SYSDATE >= FD_NAZ '
          
            '            AND (SYSDATE < TO_DATE(FD_RUN)+1 OR FD_RUN IS NULL))' +
            ' AS CNTTUB, '
          
            '        (SELECT max(1) FROM ASU.TNAZIS WHERE FK_PACID = TAMBULAN' +
            'CE.FK_PEPLID AND FK_SMID = ASU.GET_XRAY_TUBDISPANCER) AS CNTTUB_' +
            'ALL, '
          
            '        (select count(*) from asu.tib where fk_pacid = tambulanc' +
            'e.fk_peplid and fk_smid = (select fk_id from asu.tsmid where fc_' +
            'synonim = '#39'XRAY_RG_PLUS'#39')) as cntRgPlus , '
          'asu.NAZ_FLUORO_IS_NORM(tambulance.fk_id) is_norm '
          '   FROM ASU.TAMBULANCE, ASU.TDOCOBSL, ASU.TUSLVID '
          '  WHERE TAMBULANCE.FC_FAM LIKE :pFAM'
          '    AND NVL(TAMBULANCE.FC_IM,'#39' '#39') LIKE :pIM'
          '    AND NVL(TAMBULANCE.FC_OTCH,'#39' '#39') LIKE :pOTCH'
          '    AND TAMBULANCE.FK_DOCOBSL = TDOCOBSL.FK_ID '
          '    AND TDOCOBSL.FK_VIDDOCID = TUSLVID.FK_ID '
          '  UNION ALL '
          '  SELECT TKARTA.FK_PEPLID AS FK_ID, '
          
            '        TKARTA.FC_FAM||'#39' '#39'||TKARTA.FC_IM||'#39' '#39'||TKARTA.FC_OTCH FI' +
            'O, '
          
            '        DECODE(TO_CHAR(TKARTA.FD_ROJD, '#39'dd.mm.yyyy hh24:mi:ss'#39'),' +
            ' '#39'00.00.0000 00:00:00'#39', TRUNC(SYSDATE), TKARTA.FD_ROJD) FD_ROJD,' +
            ' '
          '        TUSLVID.FC_NAME, '
          
            '        ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TKARTA.FK_PEPLID) S' +
            'EX, '
          '        ASU.GET_IB(TKARTA.FK_ID) AS NIB, '
          
            '        DECODE(TKARTA.FP_TEK_COC,3,'#39#1042#1099#1087#1080#1089#1072#1085#39',2,'#39#1042' '#1089#1090#1072#1094#1080#1086#1085#1072#1088#1077#39',-2' +
            ','#39#1053#1072' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1080' '#1055#1054#39','#39#39') STEK_COC, '
          '        TKARTA.FK_ID PACID, '
          '        ASU.GET_LAST_FLUORO(TKARTA.FK_PEPLID) AS LASTFLU, '
          '        0 AS IS_AMBULANCE, '
          '        TKARTA.FP_TEK_COC, '
          '        (SELECT max(1) FROM ASU.TNAZIS '
          
            '          WHERE FK_PACID = TKARTA.FK_PEPLID AND FK_SMID = ASU.GE' +
            'T_XRAY_TUBDISPANCER '
          '            AND SYSDATE >= FD_NAZ '
          
            '            AND (SYSDATE < TO_DATE(FD_RUN)+1 OR FD_RUN IS NULL))' +
            ' AS CNTTUB, '
          
            '        (SELECT max(1) FROM ASU.TNAZIS WHERE FK_PACID = TKARTA.F' +
            'K_PEPLID AND FK_SMID = ASU.GET_XRAY_TUBDISPANCER) AS CNTTUB_ALL,' +
            ' '
          
            '        (select count(*) from asu.tib where fk_pacid = tkarta.fk' +
            '_peplid and fk_smid = (select fk_id from asu.tsmid where fc_syno' +
            'nim = '#39'XRAY_RG_PLUS'#39')) as cntRgPlus , '
          'asu.NAZ_FLUORO_IS_NORM(tkarta.fk_id) is_norm '
          '   FROM ASU.TKARTA, ASU.TUSLVID '
          '  WHERE TKARTA.FC_FAM LIKE :pFAM'
          '    AND NVL(TKARTA.FC_IM,'#39' '#39') LIKE :pIM'
          '    AND NVL(TKARTA.FC_OTCH,'#39' '#39') LIKE :pOTCH'
          '    AND TKARTA.FK_USLVIDID = TUSLVID.FK_ID '
          '  ORDER BY FIO  )'
          ' order by fio ')
      end>
    Left = 120
    Top = 424
  end
end
