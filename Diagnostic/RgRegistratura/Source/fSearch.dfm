object frmSearch: TfrmSearch
  Left = 303
  Top = 25
  Caption = #1055#1086#1080#1089#1082' '#1087#1072#1094#1080#1077#1085#1090#1072
  ClientHeight = 672
  ClientWidth = 1153
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
    Width = 1153
    Height = 78
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 1147
      Height = 72
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object cxLabel1: TcxLabel
        Left = 7
        Top = 11
        Caption = #1060#1048#1054':'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object sFIO: TcxTextEdit
        Left = 48
        Top = 6
        AutoSize = False
        ParentFont = False
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
      object cxLabel2: TcxLabel
        Left = 48
        Top = 39
        Caption = #1055#1086#1083':'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel3: TcxLabel
        Left = 156
        Top = 39
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object pnlTub: TPanel
        Left = 815
        Top = 2
        Width = 243
        Height = 68
        Align = alRight
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 4
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
      object bEnter: TcxButton
        Left = 439
        Top = 6
        Width = 34
        Height = 33
        Action = aSearch
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
      end
      object bClear: TcxButton
        Left = 479
        Top = 6
        Width = 32
        Height = 33
        Action = aClearSearch
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
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
      object bClose: TcxButton
        Left = 1058
        Top = 2
        Width = 87
        Height = 68
        Action = aClose
        Align = alRight
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
      end
      object lbSex: TcxLabel
        Left = 87
        Top = 40
        Caption = '--'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object lbRojd: TcxLabel
        Left = 240
        Top = 40
        Caption = '--'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 78
    Width = 1153
    Height = 594
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 1151
      Height = 592
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object cxGr: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 31
        Width = 776
        Height = 558
        Margins.Top = 0
        Margins.Right = 0
        Align = alClient
        PopupMenu = pmTV
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = ''
        ExplicitTop = 33
        ExplicitHeight = 556
        object TVPAC: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnFocusedRecordChanged = TVPACFocusedRecordChanged
          DataController.DataSource = dsPac
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              FieldName = 'FIO'
              Column = VFIO
            end>
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
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          object VCNTTUB: TcxGridDBColumn
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
            MinWidth = 21
            Options.Editing = False
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Width = 21
          end
          object VRGPLUS: TcxGridDBColumn
            Caption = '+'
            DataBinding.FieldName = 'CNTRGPLUS'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.Images = ilRgPlus
            Properties.ImmediatePost = True
            Properties.Items = <
              item
                ImageIndex = 0
                Value = 0
              end
              item
                ImageIndex = 1
                Value = 1
              end>
            Properties.PostPopupValueOnTab = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            MinWidth = 21
            Options.Editing = False
            Options.HorzSizing = False
            Options.Moving = False
            VisibleForCustomization = False
            Width = 21
          end
          object VFIO: TcxGridDBColumn
            Caption = #1060#1048#1054
            DataBinding.FieldName = 'FIO'
            VisibleForCustomization = False
            Width = 62
          end
          object VROJD: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
            DataBinding.FieldName = 'FD_ROJD'
            Width = 75
          end
          object VNUMBER: TcxGridDBColumn
            Caption = #8470' '#1052#1050
            DataBinding.FieldName = 'NIB'
            VisibleForCustomization = False
            Width = 74
          end
          object VTYPEDOC: TcxGridDBColumn
            Caption = #1058#1080#1087' '#1052#1050
            DataBinding.FieldName = 'FC_NAME'
            Width = 27
          end
          object VSOS: TcxGridDBColumn
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
            DataBinding.FieldName = 'STEK_COC'
            Width = 72
          end
          object VLASTFLU: TcxGridDBColumn
            Caption = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1092#1083#1102#1086#1088'.'
            DataBinding.FieldName = 'LASTFLU'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taLeftJustify
            Width = 68
          end
          object VPACPLAN: TcxGridDBColumn
            Caption = #1055#1083#1072#1085
            DataBinding.FieldName = 'PLANDATE'
            Width = 59
          end
          object VPACDOOBSL: TcxGridDBColumn
            Caption = #1044#1086#1086#1073#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'DOOBSL'
            Width = 30
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
        Width = 1145
        Height = 28
        Margins.Top = 0
        Align = dalTop
        BarManager = BM
        SunkenBorder = True
        UseOwnSunkenBorder = True
      end
      object cxSplitter1: TcxSplitter
        Left = 779
        Top = 31
        Width = 8
        Height = 561
        HotZoneClassName = 'TcxXPTaskBarStyle'
        HotZone.SizePercent = 44
        AlignSplitter = salRight
        Control = pnlNaz
        ExplicitTop = 33
        ExplicitHeight = 559
      end
      object pnlNaz: TPanel
        Left = 787
        Top = 31
        Width = 364
        Height = 561
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 3
        object cxGrid2: TcxGrid
          AlignWithMargins = True
          Left = 0
          Top = 31
          Width = 361
          Height = 527
          Margins.Left = 0
          Margins.Top = 0
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = ''
          ExplicitTop = 33
          ExplicitHeight = 523
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
            object VDATENAZ: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1085#1072#1079'.'
              DataBinding.FieldName = 'FD_NAZ'
              Width = 75
            end
            object VDATE: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1074#1099#1087'.'
              DataBinding.FieldName = 'FD_RUN'
              Width = 71
            end
            object VNAMEISSL: TcxGridDBColumn
              Caption = #1052#1077#1090#1086#1076#1080#1082#1072
              DataBinding.FieldName = 'NAMEISSL'
              Width = 148
            end
            object VSOSID: TcxGridDBColumn
              Caption = 'ID_SOS'
              DataBinding.FieldName = 'FK_NAZSOSID'
              Visible = False
              VisibleForCustomization = False
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = TVISSL
          end
        end
        object dxBarDockControl2: TdxBarDockControl
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 361
          Height = 28
          Margins.Left = 0
          Margins.Top = 0
          Align = dalTop
          BarManager = BM
          SunkenBorder = True
          UseOwnSunkenBorder = True
        end
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
      ImageIndex = 17
      ShortCut = 13
      OnExecute = aSearchExecute
    end
    object aNew: TAction
      Caption = #1053#1086#1074#1099#1081
      Hint = #1053#1086#1074#1099#1081' '#1087#1072#1094#1080#1077#1085#1090
      ImageIndex = 23
      ShortCut = 16462
      OnExecute = aNewExecute
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
      ShortCut = 16457
      OnExecute = aInfoExecute
    end
    object aNaprav: TAction
      Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      Hint = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1085#1072' Rg-'#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
      ImageIndex = 1
      ShortCut = 115
      OnExecute = aNapravExecute
    end
    object aOpenMK: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1052#1050
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1052#1050
      ImageIndex = 0
      ShortCut = 114
      Visible = False
      OnExecute = aOpenMKExecute
    end
    object actClosenaz: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 3
      OnExecute = actClosenazExecute
    end
    object actEditNaz: TAction
      Caption = #1053#1072#1079#1085#1072#1095#1080#1090#1100
      Hint = 
        #1053#1072#1079#1085#1072#1095#1080#1090#1100' '#1082#1072#1073#1080#1085#1077#1090', '#1076#1072#1090#1091', '#1074#1088#1077#1084#1103'.'#13#10#1042#1085#1080#1084#1072#1085#1080#1077'! '#1053#1072#1079#1085#1072#1095#1072#1090#1100' '#1082#1072#1073#1080#1085#1077#1090', '#1076#1072 +
        #1090#1091' '#1080' '#1074#1088#1077#1084#1103' '#1088#1072#1079#1088#1077#1096#1072#1077#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103#1084', '#13#10#1080#1084#1077#1102#1097#1080#1084' '#1089#1090#1072#1090#1091#1089' "'#1053 +
        #1045' '#1042#1067#1055'.". '#13#10' '
      OnExecute = actEditNazExecute
    end
    object actLoadNaz: TAction
      Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 26
      ShortCut = 16460
      OnExecute = actLoadNazExecute
    end
    object actRefreshNaz: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 20
      OnExecute = actRefreshNazExecute
    end
    object actPass: TAction
      Caption = #1060#1083#1102#1086#1088#1086#1090#1077#1082#1072
      Hint = #1055#1077#1088#1077#1095#1077#1085#1100' '#1092#1083#1102#1086#1088#1086#1075#1088#1072#1092#1080#1081
      ShortCut = 16454
      OnExecute = actPassExecute
    end
    object actTub: TAction
      Caption = #1059#1095#1105#1090' '#1090#1091#1073'.'
      Hint = #1055#1086#1089#1090#1072#1074#1080#1090#1100'/'#1089#1085#1103#1090#1100' '#1089' '#1091#1095#1105#1090#1072' '#1074' '#1090#1091#1073#1076#1080#1089#1087#1072#1085#1089#1077#1088#1077
      ShortCut = 16468
      OnExecute = actTubExecute
    end
    object aClearSearch: TAction
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1087#1086#1080#1089#1082#1072
      ShortCut = 119
      OnExecute = aClearSearchExecute
    end
    object aPrintSearch: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1087#1086#1080#1089#1082#1072
      ImageIndex = 10
      ShortCut = 16464
      OnExecute = aPrintSearchExecute
    end
    object aText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
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
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1072#1094#1080#1077#1085#1090#1086#1074
      ImageIndex = 20
      OnExecute = aRefreshExecute
    end
    object aSysInfo: TAction
      Caption = #1057#1080#1089#1090#1077#1084#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ShortCut = 32890
      OnExecute = aSysInfoExecute
    end
    object aPolis: TAction
      Caption = #1055#1086#1083#1080#1089#1099
      Hint = #1055#1086#1083#1080#1089#1099' '#1087#1072#1094#1080#1077#1085#1090#1072'. '#1044#1086#1089#1090#1091#1087#1085#1086' '#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1072#1084#1073#1091#1083#1072#1090#1086#1088#1085#1099#1093' '#1087#1072#1094#1080#1077#1085#1090#1086#1074
      OnExecute = aPolisExecute
    end
  end
  object dsPac: TDataSource
    DataSet = odsPac
    Left = 121
    Top = 282
  end
  object odsPac: TOracleDataSet
    SQL.Strings = (
      'SELECT TKARTA.FK_PEPLID AS FK_ID, '
      '       TKARTA.FK_ID AS PACID,'
      
        '       TKARTA.FC_FAM||'#39' '#39'||TKARTA.FC_IM||'#39' '#39'||TKARTA.FC_OTCH FIO' +
        ', '
      '       TKARTA.FD_ROJD,  '
      
        '       ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TKARTA.FK_PEPLID) SE' +
        'X,'
      '       TKARTA.FP_TEK_COC,'
      '       ASU.GET_IB(TKARTA.FK_ID) AS NIB, '
      
        '       DECODE(TKARTA.FP_TEK_COC,3,'#39#1042#1067#1055#1048#1057#1040#1053#39',2,'#39#1042' '#1057#1058#1040#1062#1048#1054#1053#1040#1056#1045#39',-2,' +
        #39#1053#1040' '#1054#1060#1054#1056#1052#1051#1045#1053#1048#1048' '#1055#1054#39','#39#39') STEK_COC,'
      '       asu.GET_LAST_FLUORO(TKARTA.FK_PEPLID) AS LASTFLU,'
      '       0 AS IS_AMBULANCE,'
      '       TUSLVID.FC_NAME,'
      '       TUSLVID.FK_ID AS USLID,'
      '       (SELECT COUNT(*) FROM asu.TNAZIS '
      '         WHERE FK_PACID = ASU.GET_PEPLID(TKARTA.FK_ID) '
      '           AND FK_SMID = ASU.GET_XRAY_TUBDISPANCER '
      '           AND SYSDATE >= FD_NAZ '
      
        '           AND (SYSDATE < TO_DATE(FD_RUN)+1 OR FD_RUN IS NULL)) ' +
        'AS CNTTUB,'
      
        '       (SELECT COUNT(*) FROM asu.TNAZIS WHERE FK_PACID = ASU.GET' +
        '_PEPLID(TKARTA.FK_ID) AND FK_SMID = ASU.GET_XRAY_TUBDISPANCER) A' +
        'S CNTTUB_ALL,'
      '       ASU.GET_PLAN_FLUORO_DATE(TKARTA.FK_PEPLID) AS PLANDATE,'
      '       (select count(*) '
      '          from asu.tib '
      
        '         where fk_pacid = tkarta.fk_peplid and fk_smid = (select' +
        ' fk_id from asu.tsmid where fc_synonim = '#39'XRAY_RG_PLUS'#39')) as cnt' +
        'RgPlus,'
      '       asu.get_doobsledovan(tkarta.fk_peplid) as doobsl ,'
      
        '(select count(1) from asu.tnazis n where n.fk_pacid = tkarta.fk_' +
        'id and n.FK_SMID IN (SELECT FK_ID FROM ASU.TSMID'
      '                          WHERE FL_SHOWANAL = 1'
      '                            AND FL_DEL = 0'
      
        '                         START WITH FC_SYNONIM = '#39'ISSLED_FLUROGR' +
        #39
      '                         CONNECT BY PRIOR FK_ID = FK_OWNER)'
      
        '  AND n.FK_NAZSOSID IN (ASU.GET_LABVIP, ASU.GET_VIPNAZ, ASU.GET_' +
        'PASS_REGISTRATOR)'
      
        '  and n.fk_id in (select fk_pacid from asu.tib i where i.fk_smid' +
        ' in (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM in ('#39'XRAY_VRAC' +
        'H_RESUME'#39','#39'OTMETKI_FLU_RESUME2'#39') and upper(fc_char) like '#39'%'#1042#1040#1056#1048#1040 +
        #1053#1058'%'#1053#1054#1056#1052#1067'%'#39'))) is_norm'
      ''
      '  FROM ASU.TKARTA, ASU.TPERESEL, ASU.TDOCOBSL, ASU.TUSLVID'
      ' WHERE asu.GET_MAXPERESELID(TKARTA.FK_ID) = TPERESEL.FK_ID '
      '   AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID '
      '   AND TDOCOBSL.FK_VIDDOCID = TUSLVID.FK_ID')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000001100000005000000464B5F49440100000000000300000046494F0100
      000000000700000046445F524F4A44010000000000030000004E494201000000
      0000080000005354454B5F434F43010000000000030000005345580100000000
      00070000004C415354464C550100000000000500000050414349440100000000
      000C00000049535F414D42554C414E43450100000000000700000046435F4E41
      4D450100000000000A00000046505F54454B5F434F4301000000000005000000
      55534C494401000000000006000000434E545455420100000000000800000050
      4C414E444154450100000000000A000000434E545455425F414C4C0100000000
      0009000000434E545247504C555301000000000006000000444F4F42534C0100
      00000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsPacAfterOpen
    AfterScroll = odsPacAfterScroll
    Left = 121
    Top = 330
  end
  object BM: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clBtnFace
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseF10ForMenu = False
    UseSystemFont = False
    Left = 569
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
          Visible = True
          ItemName = 'bbOpenMK'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbNew'
        end
        item
          Visible = True
          ItemName = 'bbNaprav'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbInfo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPass'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbTub'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPolis'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bb1'
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
          ItemName = 'bbRefreshNaz'
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
    object bbNew: TdxBarButton
      Action = aNew
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbInfo: TdxBarButton
      Action = aInfo
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000886554997766967463967463967463967463977464
        95746295756296736394746193726094715F92725E91705F926F5E93725F7F5F
        4E0000000000000000000000000000000000009A7A69FEF2E4F9EBDDF9EBDDF9
        EBDDF9EBDDF9EBDEF9EBDCF9ECDDF9EADBF9EADCF9EBDBF8EAD8F8E7D5F7E6D2
        F7E6CFFBE7CE906F5D0000000000000000000000000000000000009B7B6BFFFD
        F3FCF6EBFCF6EBFBF6EBFCF6EBFCF5EBFCF5ECFCF5EAFCF5EBFCF4E9FCF4E8FA
        F3E8FBF3E6F9F1E2FAEFE0FBEDD98E6D5B000000000000000000000000000000
        0000009B7C6BFFFDF4FBF6ECFCF6EDFCF6EDFBF5EBD3CFC9ACAAA7A09F9E9D9D
        9BA3A19ECFCBC4F9F1E6FBF3E8FAF2E6FBF2E3FCEEDC8F6E5C00000000000000
        00000000000000000000009C7D6CFFFEF6FCF7EEFCF7EFF6F2EAB4B2B0BABABA
        CDCDCDCBCBCBC6C6C6C4C4C4AAAAAAA2A09DF4EEE2FBF3E7FAF3E6FBF1E1906F
        5E0000000000000000000000000000000000009F7E6DFFFFF8FCF8F1FBF7F0BA
        B9B7D1D1D1D5D5D5F08B00F88200F88400FB7D00C5C5C5B9B9B9A3A19EFAF3E7
        FCF4E8FDF1E491705F0000000000000000000000000000000000009F7F70FFFF
        FAFCF9F3DCDAD6CCCCCCDFDFDFDDDDDDDCE8F9E07700E17100D1D1D2CBCBCBC6
        C6C6ABABABCECAC3FBF5E9FCF3E4927160000000000000000000000000000000
        000000A38070FFFFFCFDFAF5C4C3C2E9E9E9E8E8E8E7E7E7E9F8FFCF6500D05B
        00D9DADED1D1D1CBCBCBC6C6C6A6A4A1FBF5EBFCF2E593715F00000000000000
        0000000000000000000000A38171FFFFFEFDFBF7C6C6C6F0F0F0F0F0F0F1F1F1
        EFECEBC8670BC75B00E0E0E0D8D8D8D1D1D1CBCBCBA09F9EFBF6ECFCF4E69572
        61000000000000000000000000000000000000A48372FFFFFFFDFBF9CBCBCAFA
        FAFAFBFBFBFCFCFCD38F54CD7F3FCE7D3AE5E3E2DDDDDDD4D4D4CFCFCFA3A3A2
        FBF6EDFCF3E7947360000000000000000000000000000000000000A58473FFFF
        FFFEFCFBCDCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDED0EEF1F3E3E3E3D9
        D9D9D3D3D3AFADABFDF7EEFEF5E8967362000000000000000000000000000000
        000000A88574FFFFFFFEFDFDE1E1E0ECECECFFFFFFFFFFFFFEFFFEA94200A235
        00E6D9D1E5E5E5DDDDDDC1C1C1D6D2CEFCF7EFFDF4E995736100000000000000
        0000000000000000000000A88675FFFFFFFEFEFEFFFFFFCECECEFDFDFDFFFFFF
        FDFAF9AA501EA74813E3D1C7E7E7E7D9D9D9B7B6B5FBF7F0FCF8F0FDF6EB9774
        63000000000000000000000000000000000000A98776FFFFFFFFFFFFFFFFFFFD
        FDFDCECECEECECECFFFFFFFFFFFFFCFCFCF4F4F4D4D4D4BDBCBBF8F5EFFCF8F1
        FDF8F0FDF6EB967463000000000000000000000000000000000000AC8877FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE2E2E2D0D0D0CFCFCFCCCCCCC6C6C5DFDDDBFD
        FAF5FEFAF6FDFAF3FDFAF2FDF5EC987563000000000000000000000000000000
        000000AD8978FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFEFD
        FCFFFDFBFAF8F5F6F2EDF3ECE7ECE4DFE1D6D0C9B5A98D685700000000000000
        0000000000000000000000AE8978FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFFFEFDFCFFFFFECAB5AA9C7A69AA8B78A8846AA27A5C86604F9067
        56000000000000000000000000000000000000AE8B7AFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFEFEFEFEFEFDFEFDFBFFFFFDD5C7BECCB5A3FCE9C5F0CC92
        9B745C96695C000000000000000000000000000000000000000000AF8B78FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFDFCFEFCFAFFFEFDD9CAC3C4
        A384ECC88E976F58966E5D000000000000000000000000000000000000000000
        000000AE8979FFFFFFFEFEFFFEFEFEFEFEFEFEFEFEFEFEFDFEFDFCFEFCFBFEFC
        F9FFFFFCDACCC4BB93699C745B9B6D5F00000000000000000000000000000000
        0000000000000000000000AF8C7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD1BEB48B63519D73600000000000000000000000
        000000000000000000000000000000000000009E7661B18F7FAF8C7BAF8D7BAE
        8B7CAD8C7AAC8A7BAB8979A98878A88777A98A789672619A6B58000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
    object bbNaprav: TdxBarButton
      Action = aNaprav
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbOpenMK: TdxBarButton
      Action = aOpenMK
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEditNaz: TdxBarButton
      Action = actEditNaz
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000FF9900FF9900FF9900FF9900FF9900FF9900FF
        9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900
        FF9900FF9900FF9900FF9900FF9900000000000000FF9900FFE5E5FFE6E6FFE6
        E6FFE6E6FFE6E6FFE6E6FFE5E5FFE8E8FFEDEDFFEFEFFFEEEEFFEAEAFFE2E2FF
        DADAFFD7D7FFD5D5FFD2D2FFD0D0FFCECEFFCCCCFF9900000000000000FF9900
        FFE8E8FFE9E9FFE9E9FFE9E9FFE9E9FFEAEAFEF1F1C8BEBE9492938182848182
        84939090CAC0C0FEEAEAFFDBDBFFD7D7FFD4D4FFD2D2FFCFCFFFCDCDFF990000
        0000000000FF9900FFEBEBFFECECFFECECFFECECFFEDEDF6ECEC9F9595999899
        CAB8A5E0C3A4DEC1A1C1AF9B868786949192F6E5E5FFDADAFFD6D6FFD4D4FFD1
        D1FFCECEFF9900000000000000FF9900FFEFEFFFF0F0FFF0F0FFF0F0FEF5F5A3
        9B9BBBB3AEFFDBAEFFE3B5FFE4BBFFE5C0FFE5BFFDD5A89F9890949192FEE9E9
        FFD9D9FFD5D5FFD2D2FFD0D0FF9900000000000000FF9900FFF2F2FFF3F3FFF3
        F3FFF5F5D2C7C7B4AFAFFFDEB2FFE3B9FFE3B8FFE2B7FFE0B5FFE0B7FFE8C9FF
        D7A9888887CABFBFFFE1E1FFD7D7FFD4D4FFD1D1FF9900000000000000FF9900
        FFF4F4FFF7F7FFF7F7FFFAFAB5A7A7E5D4BEFFE8BDFFE9BFFFE9C0FEE6BDF9DF
        B7FFE4B9FFE1B7FFE9C4CAB49E939091FFE9E9FFD9D9FFD5D5FFD2D2FF990000
        0000000000FF9900FFF8F8FFF9F9FFFAFAFFFCFCB4A3A5F5E0C0FFF2D6FFEDC6
        FFFACF6B6A6563615DFFEABEFFE4B9FFE8C4E6C9A67F7F82FFECECFFDADAFFD6
        D6FFD3D3FF9900000000000000FF9900FFFAFAFFFCFCFFFDFDFFFEFEBBA8AAF8
        E6C7FFF8E1FFFBD9D2C8A9464849434445A4977EF8DFB5FFE7C3EACCA9808284
        FFEDEDFFDBDBFFD7D7FFD4D4FF9900000000000000FF9900FFFDFDFFFFFFFFFF
        FFFFFFFFC7B1B2F7E8D1FFFEE9E1DCC529292BE5DEBEF8ECC7323333C0AE92FF
        EBC1D7C2A9949091FFEAEAFFDCDCFFD9D9FFD5D5FF9900000000000000FF9900
        FFFFFFFFFFFFFFFFFFFFFFFFDCCCCCE5DDDAFFFBD938393BD0CFBCFFFFDEFFF6
        D1F5E5C0FFE9C0FFE3B6A39D9CC8BDBDFFE5E5FFDCDCFFD9D9FFD5D5FF990000
        0000000000FF9900FFFFFFFFFFFFFFFFFFFFFFFFFEFDFDC9B0B1FFF6ECFEF2D2
        FFFFEDFFFCE3FFF6DBFFF0CBFFE7BAC5BBB19F9596FDEDEDFFDFDFFFDCDCFFD9
        D9FFD5D5FF9900000000000000FF9900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9
        F4F4CAB2B4EBE0DDFBEFD7FCECCDF9E8C8EBDBC3BBB5B2A79B9CF6E9E9FFE3E3
        FFDFDFFFDCDCFFD9D9FFD5D5FF9900000000000000FF9900FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFDFDDBCBCBC7B1B3BEABADB7A5A7B7A6A7D3C5C5FD
        F0F0FFE7E7FFE2E2FFDFDFFFDCDCFFD9D9FFD5D5FF9900000000000000FF9900
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFFFBFBFFFBFBFFF9
        F9FFF6F6FFF0F0FFE9E9FFE6E6FFE2E2FFDFDFFFDCDCFFD9D9FFD5D5FF990000
        0000000000FF9900CFCDCDCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCDCDCFCBCB
        CFC9C9CFC7C7CFC4C4CFC2C2CFC0C0CFBDBDCFBBBBCFB8B8CFB6B6CFB3B3CFB1
        B1CFAFAFFF9900000000000000FF9900FFAD3DFF9900FF9900FF9900FF9900FF
        9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900
        FF9900FF9900FF9900FF9900FF9900000000000000FF9900FFCC99EB8500EB85
        00EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB
        8500EB8500EB8500EB8500EB8500EB8500F79100FF9900000000000000FF9900
        FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC
        99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFAD3DFF990000
        0000000000FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900
        FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF99
        00FF9900FF990000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object bbCloseNaz: TdxBarButton
      Action = actClosenaz
      Category = 0
    end
    object bb1: TdxBarButton
      Action = actLoadNaz
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefreshNaz: TdxBarButton
      Action = actRefreshNaz
      Category = 0
    end
    object cxCheckMK: TcxBarEditItem
      Caption = #1055#1086' '#1090#1077#1082#1091#1097#1077#1081' '#1052#1050
      Category = 0
      Hint = #1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1081' '#1052#1077#1076#1080#1094#1080#1085#1089#1082#1086#1081' '#1050#1072#1088#1090#1077
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
    object bbPass: TdxBarButton
      Action = actPass
      Category = 0
      Glyph.Data = {
        36060000424D3606000000000000360000002800000015000000180000000100
        18000000000000060000130B0000130B000000000000000000001C19153F3C38
        23201B27241F0C0904120F0A110E0917140F13100B17140F0F0D0514120A1311
        090D0B0316140C14120A0E0A0516120D24201B2A26215B575200272420C6C3BF
        73706B383530312E2925221D201D18302D28322F2A221F1A211F17211F172624
        1C2F2D252A282024221A2F2B263C383354504B8C8883DAD6D100221F1AFFFFFB
        E2DFDAADAAA594918C908D889E9B9694918C5A585025231B201E161E1C142624
        1C42403849473F5B59516B6762BEBAB5E0DCD7F1EDE8FFFDF800211E19FFFEF9
        FFFFFBF7F4EFFDFAF5F3F0EBD3D0CBBFBCB765635B2220181E1C1426241C2220
        182C2A2237352D53514978746FE6E2DDF7F3EEF2EEE9EEEAE500211E19F5F2ED
        FFFCF7FFFCF7F8F5F0E2DFDABFBDB599978F65635B2B29211F1D1529271F2221
        172221172F2E24403E3687837ECFCBC6D3CFCAEBE7E2F8F4EF001D1A15F9F6F1
        F3F0EBEFECE7D7D4CFC4C1BCBFBDB57C7A725E5C54302E261E1C14201E162120
        162B2A2038372D4140367D7974BAB6B1CECAC5EDE9E4ECE8E3001E1B16F9F6F1
        D4D1CCC8C5C0DAD8D0CDCBC3ADABA377756D52504826241C2321192220182322
        182B2A202A291F43423894908BB8B4AFC6C2BDC8C4BFBAB6B1001C1914C5C3BB
        D8D5D0D3D1C9B8B6AEBBB9B1AFADA58D8B835D5B53201E1625231B211F172322
        18302F2539382E807F75A8A49FAFABA6B2AEA9ABA7A2A39F9A0016140C9A998F
        CAC8C0E5E4DACECDC3BCBBB1A7A59B99978D5B594F2C2A2026241A2321172927
        1D33312757554B918F8599938EAEA8A3B9B3AEACA6A1938D880018170D9A998F
        A8A79DC3C2B8E5E4DAE1E0D6B9B7AD8482787270662A281E26241A1C1A101917
        0D56544A858379939088BBB5B0BFB9B4BEB8B39D97927A746F0017150D76746C
        9E9C94D5D3CBEBE9E1D9D7CFD9D6CEA9A69E807D75322F272C29212320182623
        1B7E7B739E9B939E9B93BEBAB5B8B4AFB3AFAA8B87825F5B56000402005A5850
        A7A59DD8D6CEE6E4DCDFDDD5DAD7CF8E8B83848179403D352320181D1A12312E
        267C79717D7A72A6A39BC2BEB9C0BCB7B9B5B095918C55514C000A08004E4C44
        97958DB7B5ADE6E4DCF5F3EBEEECE4D1CFC7ACAAA263615929271F2220183735
        2D86847C807E76C0BEB6BDB9B4C3BFBAB6B2AD938F8A403C37000C0A02333129
        918F87C4C2BAE2E0D8E1DFD7D5D3CBCFCDC5BDBBB369675F24221A24221A2B29
        219C9A92A5A39BC7C5BDC0BCB7C2BEB9A8A49F79757028241F0014110929261E
        76736BAAA79FCBC9C1F0EEE6F4F2EAD4D2CAC3C1B973716928261E2D2B232B29
        21B8B6AECBCCC3CECFC6D4D1CCC7C4BFA19E995D5A55221F1A000F0C0425221A
        504D4595928ACBC9C1DBD9D1DEDCD4E1DFD7C2C0B87C7A72222018232119201E
        16B1AFA7C8C9C0CDCEC5C4C1BCAEABA68986813E3B36221F1A000D0A022B2820
        3A372F827F77B8B6AEE6E4DCE2E0D8C7C5BDA5A69D707168292A211B1C134344
        3B9B9C93B2B3AACDCEC5BEBBB69F9C976B68632E2B26211E190014110929261E
        28251D68655D94928AAFADA5B9B7AFAAA8A09FA0975C5D5426271E26271E4748
        3F92938AA0A198BABBB2B5B2AD7B7873423F3A23201B2A2722000B07023C3833
        2A26212F2B2677746FBBB8B3B7B4AF9C999493938D51514B3638323537313D3F
        3974767075777181837D9797915A5A542828221919132929230015110C292520
        302C27312D284D4A456A67626D6A658D8A859C9C96494943292B25252721383A
        347F817B77797361635D4E4E483A3A3431312B2D2D273838320017130E3F3B36
        433F3A423E39312E294946417C797497948F84847E41413B30322C30322C3C40
        3A75797371756F5D615B3C3E38383A343C3E383B3D37474943001C18139F9B96
        716D6866625D5A57524F4C476865605B58534747412A2A2431332D353731292D
        273B3F394C504A5C605A6B6D675C5E585E605A6A6C6683857F0026221DF7F3EE
        CECAC5AFABA6A29F9A9E9B968C8C865E5E584C4C463B3B3530322C3638323A3E
        384448425C605A7276709C9E98969892A8AAA4C1C3BDDCDED8001E1A155F5B56
        3F3B36615D584946414A474248484250504A3838324646403E403A41433D464A
        443F433D464A44494D474E504A50524C5A5C56585A545C5E5800}
      PaintStyle = psCaptionGlyph
    end
    object bbTub: TdxBarButton
      Action = actTub
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000241CED00000000000000000000000000000000
        0000000000028CBA4F6268403C36000000000000000000000000000000000000
        000000000000000000000000000000000000000000241CED0000000000000000
        00000000000000000000000000009FDCE5DFDD162DBA00009F0000A600000000
        0000000000000000000000000000000000000000000000000000000000241CED
        000000000000000000000000000000000000000000000000535FE41545FC1243
        FE020CAE00009E00000000000000000000000000000000000000000000000000
        0000000000241CED000000000000000000000000000000000000000000000000
        000FE50925D6255AFF1249FF041BCA0000920000A90000000000000000000000
        00000000000000000000000000241CED00000000000000000000000000000000
        0000000000000000000000001ADD1D45EB2356FF1248FF0526DE00008A00008E
        000000000000000000000000241CED241CED241CED241CED241CED241CED241C
        ED0000000000000000000000000000000000000000FF001DD32C5AFB2254FF12
        47FF052DEB00008E00009D000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000026
        FF0628DE3364FF2052FF1247FF0530F200009300009F00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000023FE1338E63466FF2051FF0F44FF0931E2211E583C3C
        3600000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000023F11F48EE2E61FF3757C4
        5D5A4B535045423F313636330000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000FF00
        21E63E5ED5D6D0BF8783784A55810D36E0010292000099000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000014FF79809DCFCCBF697EC1194EFF1246FF0532F900009100
        009D000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000B7B7AF7F8193275AFF2C5AF11F51
        FF1247FF0532F800009100009A00000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000007E87AA
        777888918D7B3E549C1C4FFF1247FF0531F500008F00009E0000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000A3A3A0848486959698B6B1A2364D9A1D4EFF1247FF052FF000008C
        00009C0000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000304EE2A0A2A8B5B1A72042B11F
        52FF1247FF052CE7000089000091000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000586B
        C3D3D1CA8C909B1941C22053FF1248FF0522D500009300000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000A1A1A2F6F4EE6370961B41C62052FF134AFF0212BB0000
        A200000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000008E8E8EB5B5B5FEFDF45F6E971840C0
        1D4EFB1247FF00009F0000910000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000009B9B9BB6
        B6B5D9D7D18C8E9A3C52972049D60F25B0090884000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000565656AAAAA8AEAAA1ABA696908C7DA5A3966D6D6440403F00
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000173FE32F4AD08B91B0C0C0
        BE88888852525200000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000009F9E9A9494949494945151510000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
    object bbPolis: TdxBarButton
      Action = aPolis
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF886554997766967463967463967463967463977464
        957462957562967363947461937260CAB8AF007500007300007000006D00BFAF
        A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A7A69FEF2E4F9EBDDF9EBDDF9
        EBDDF9EBDDF9EBDEF9EBDCF9ECDDF9EADBF9EADCF9EBDBFCF5EC00790041DA74
        3DD670007000C8B7AEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B7B6BFFFD
        F3FCF6EBFCF6EBFBF6EBFCF6EBFCF5EBFCF5ECFCF5EAFDF8F1FEFAF4FEFAF4FD
        F9F4007C0045DE7841DA74007300C7B6ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF9B7C6BFFFDF4FBF6ECDEC4B7DEC4B7DEC4B6DDC2B4DDC2B4DDC1B2EEE0
        D7008500008400008100007F0049E27C45DE78007800007500007200006F00FF
        FFFFFFFFFFFFFFFFFFFFFF9C7D6CFFFEF6FCF7EEDBC0B6DBC0B6DBC0B6DBC0B3
        DBBFB2DBBEB0EDDED600890055EE8852EB854FE8824CE57F4BE47E47E07A43DC
        763FD872007200FFFFFFFFFFFFFFFFFFFFFFFF9F7E6DFFFFF8FCF8F1DBC3BADB
        C3BADBC3B9DBC2B8DBC0B6DBBFB3EDDED7008B0058F18B55EE8853EC8650E983
        4DE6804BE47E47E07A43DC76007600FFFFFFFFFFFFFFFFFFFFFFFF9F7F70FFFF
        FAFCF9F3DBC5BFDBC5BFDBC5BEDBC3BBDBC2B8DBC0B5EDDFD9008E00008B0000
        890000870053EC8650E983008000007E00007C00007900FFFFFFFFFFFFFFFFFF
        FFFFFFA38070FFFFFCFDFAF5DBC8C2DBC8C3DBC7C1DBC5BDDBC3BADBC2B8EDDF
        DAEDDFD8EDDED7EDDDD4008A0057F08A53EC86008200C9B8AFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA38171FFFFFEFDFBF7DBC8C5DBC8C5DBC7C3DBC6BF
        DBC4BDDBC2B9DBC0B5DBBFB2DBBDAEEDDDD5008D005AF38D57F08A008600CAB9
        B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA48372FFFFFFFDFBF9DCC8C3DC
        C8C4DCC7C2DBC5BFDBC4BDDBC1B9DBC0B6DBBFB2DBBDAFEDDDD5008F00008E00
        008B00008900CAB9B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA58473FFFF
        FFFEFCFBDCC7C2DCC7C2DCC7C1DCC5BEDCC4BCDBC2B9DBC1B5DBBEB3DBBDAFED
        DDD6EDDCD4EFDED5FEFBF7FFFAF4CBBAB2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA88574FFFFFFFEFDFDEDE2DFEDE2DFEDE2DEEDE1DDEDE0DBEDDFD9ECDE
        D7ECDDD5ECDBD2ECDACFEBD9CDEDD9CCFCF7EFFDF4E9957361FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA88675FFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFEFEFE
        FEFDFDFEFDFBFEFCFAFDFBF8FDFAF6FDF9F4FCF8F2FCF8F1FCF8F0FDF6EB9774
        63FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA98776FFFFFFFFFFFFE0CFCEE0
        CFCEE0CECCE0CDCADFCAC6DFC8C3DFC7BEDFC5BADFC3B6DFC0B2DFBFAEE0C1AF
        FDF8F0FDF6EB967463FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC8877FFFF
        FFFFFFFFDDCBC9DDCBCADDCAC8DDC8C5DCC6C1DCC4BCDCC1B8DCC0B4DBBDB0DC
        BCACDCB9A9DFBEABFDFAF2FDF5EC987563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFAD8978FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFEFD
        FCFFFDFBFAF8F5F6F2EDF3ECE7ECE4DFE1D6D0C9B5A9957363FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFAE8978FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFFFEFDFCFFFFFECAB5AA9C7A69AA8B78A8846AA27A5C8C6757E3D8
        D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAE8B7AFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFEFEFEFEFEFDFEFDFBFFFFFDD5C7BECCB5A3FCE9C5F0CC92
        A07B64E7DDDAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF8B78FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFDFCFEFCFAFFFEFDD9CAC3C4
        A384ECC88E9C7661E5DBD7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFAE8979FFFFFFFEFEFFFEFEFEFEFEFEFEFEFEFEFEFDFEFDFCFEFCFBFEFC
        F9FFFFFCDACCC4BB9369A17B63E9DFDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFAF8C7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD1BEB4916C5BE8DED9FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E7661B18F7FAF8C7BAF8D7BAE
        8B7CAD8C7AAC8A7BAB8979A98878A88777A98A78A18071EAE0DCFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
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
      ImageIndex = 24
      OnClick = N2Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Action = aRefresh
    end
  end
  object dsNaz: TDataSource
    DataSet = odsNaz
    Left = 821
    Top = 294
  end
  object odsNaz: TOracleDataSet
    SQL.Strings = (
      'SELECT TNAZIS.FK_ID, '
      '       TNAZIS.FK_SMID,'
      '       asu.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID) AS OWNER,'
      '       TO_CHAR(TNAZIS.FD_NAZ, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_NAZ,'
      
        '       TO_CHAR(TNAZIS.FD_NAZ, '#39'DD.MM.YYYY HH24:MI'#39')||'#39'-'#39'||TO_CHA' +
        'R(TNAZIS.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_NAZ_RUN,'
      '       TNAZIS.FD_RUN AS RUN_DATE,'
      
        '       TO_CHAR(TNAZIS.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS PRED_DATE' +
        ','
      '       TO_CHAR(TNAZIS.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN,'
      '       TNAZIS.FK_PACID,'
      '       TNAZIS.FK_ROOMID,'
      '       TNAZIS.FK_NAZSOSID,'
      '       asu.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS NAMEISSL, '
      
        '       asu.GET_SMIDNAME(asu.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID))' +
        ' AS OWNERNAME,'
      '       asu.GET_NUMISSL_FOR_XRAY(TNAZIS.FK_ID) AS NUMBERISSL,'
      '       asu.GET_SMIDORDER(TNAZIS.FK_SMID) AS SMIDORDER,'
      '       asu.IS_AMBULANCE(TNAZIS.FK_PACID) AS IS_AMBULANCE '
      '        '
      '  FROM asu.TNAZIS, asu.TAMBULANCE '
      'WHERE TNAZIS.FK_PACID = TAMBULANCE.FK_ID'
      '  AND TAMBULANCE.FK_PEPLID = :PFK_PACID'
      
        '  AND TNAZIS.FK_NAZSOSID not in (ASU.GET_PASS_REGISTRATOR, asu.g' +
        'et_pass_registrator_dd)'
      
        '  and tnazis.fk_smid in (select fk_smid from asu.tnazvrach where' +
        ' fk_sotrid = :psotrid)'
      '                  '
      'UNION ALL'
      ''
      'SELECT TNAZIS.FK_ID, '
      '       TNAZIS.FK_SMID,'
      '       asu.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID) AS OWNER,'
      '       TO_CHAR(TNAZIS.FD_NAZ, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_NAZ,'
      
        '       TO_CHAR(TNAZIS.FD_NAZ, '#39'DD.MM.YYYY HH24:MI'#39')||'#39'-'#39'||TO_CHA' +
        'R(TNAZIS.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_NAZ_RUN,'
      '       TNAZIS.FD_RUN AS RUN_DATE,'
      
        '       TO_CHAR(TNAZIS.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS PRED_DATE' +
        ','
      '       TO_CHAR(TNAZIS.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN,'
      '       TNAZIS.FK_PACID,'
      '       TNAZIS.FK_ROOMID,'
      '       TNAZIS.FK_NAZSOSID,'
      '       asu.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS NAMEISSL, '
      
        '       asu.GET_SMIDNAME(asu.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID))' +
        ' AS OWNERNAME,'
      '       asu.GET_NUMISSL_FOR_XRAY(TNAZIS.FK_ID) AS NUMBERISSL,'
      '       asu.GET_SMIDORDER(TNAZIS.FK_SMID) AS SMIDORDER,'
      '       asu.IS_AMBULANCE(TNAZIS.FK_PACID) AS IS_AMBULANCE'
      '        '
      '  FROM asu.TNAZIS, asu.TKARTA'
      ' WHERE TNAZIS.FK_PACID = TKARTA.FK_ID'
      '   AND TKARTA.FK_PEPLID = :PFK_PACID'
      
        '   AND TNAZIS.FK_NAZSOSID not in (ASU.GET_PASS_REGISTRATOR, asu.' +
        'get_pass_registrator_dd)'
      
        '   and tnazis.fk_smid in (select fk_smid from asu.tnazvrach wher' +
        'e fk_sotrid = :psotrid)'
      '                  '
      'ORDER BY SMIDORDER, FD_NAZ')
    Optimize = False
    Variables.Data = {
      03000000020000000A0000003A50464B5F504143494403000000000000000000
      0000080000003A50534F54524944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001000000005000000464B5F494401000000000007000000464B5F534D
      49440100000000000600000046445F4E415A010000000000080000004E414D45
      4953534C010000000000090000004F574E45524E414D45010000000000060000
      0046445F52554E01000000000008000000464B5F504143494401000000000009
      000000464B5F524F4F4D49440100000000000B000000464B5F4E415A534F5349
      44010000000000050000004F574E45520100000000000800000052554E5F4441
      54450100000000000A0000004E554D4245524953534C01000000000009000000
      534D49444F5244455201000000000009000000505245445F4441544501000000
      00000A00000046445F4E415A5F52554E0100000000000C00000049535F414D42
      554C414E4345010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsNazBeforeOpen
    AfterOpen = odsNazAfterOpen
    AfterScroll = odsNazAfterScroll
    Left = 821
    Top = 247
    object odsNazFK_ID: TFloatField
      FieldName = 'FK_ID'
    end
    object odsNazFK_SMID: TFloatField
      FieldName = 'FK_SMID'
    end
    object odsNazOWNER: TFloatField
      FieldName = 'OWNER'
    end
    object odsNazFD_NAZ: TStringField
      FieldName = 'FD_NAZ'
      Size = 16
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
    object odsNazOWNERNAME: TStringField
      FieldName = 'OWNERNAME'
      Size = 4000
    end
    object odsNazNUMBERISSL: TStringField
      FieldName = 'NUMBERISSL'
      Size = 4000
    end
    object odsNazSMIDORDER: TFloatField
      FieldName = 'SMIDORDER'
    end
    object odsNazPRED_DATE: TStringField
      FieldName = 'PRED_DATE'
      Size = 16
    end
    object odsNazFD_NAZ_RUN: TStringField
      FieldName = 'FD_NAZ_RUN'
      Size = 33
    end
    object odsNazIS_AMBULANCE: TFloatField
      FieldName = 'IS_AMBULANCE'
    end
  end
  object ilCntTub: TImageList
    Left = 280
    Top = 336
    Bitmap = {
      494C0101020004006C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  object pmTVNAZ: TPopupMenu
    Left = 656
    Top = 234
    object MenuItem1: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      OnClick = MenuItem1Click
    end
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
    ReportOptions.LastChange = 41211.407885520840000000
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
        Height = 102.047310000000000000
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
          Top = 34.015770000000000000
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
            #1056#160#1056#181#1056#183#1057#1107#1056#187#1057#1034#1057#8218#1056#176#1057#8218#1057#8249' '#1056#1111#1056#1109#1056#1105#1057#1027#1056#1108#1056#176' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#1109#1056#1030)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 56.692950000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1032#1057#1027#1056#187#1056#1109#1056#1030#1056#1105#1056#181' '#1056#1111#1056#1109#1056#1105#1057#1027#1056#1108#1056#176': ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 113.385900000000000000
          Top = 56.692950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[USLOVIE]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 82.488250000000000000
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
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 52.913420000000000000
          Top = 82.488250000000000000
          Width = 325.039580000000000000
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
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 377.953000000000000000
          Top = 82.488250000000000000
          Width = 109.606370000000000000
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
            #1074#8222#8211' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 487.559370000000000000
          Top = 82.488250000000000000
          Width = 170.078850000000000000
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
            #1056#1118#1056#1105#1056#1111' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 657.638220000000000000
          Top = 82.488250000000000000
          Width = 188.976500000000000000
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
            #1056#1038#1056#1109#1057#1027#1057#8218#1056#1109#1057#1039#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 846.614720000000000000
          Top = 82.488250000000000000
          Width = 132.283550000000000000
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
            #1056#1119#1056#1109#1057#1027#1056#187#1056#181#1056#1169#1056#1029#1057#1039#1057#1039' '#1057#8222#1056#187#1057#1035#1056#1109#1057#1026'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 978.898270000000000000
          Top = 82.488250000000000000
          Width = 102.047310000000000000
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
            #1056#1119#1056#187#1056#176#1056#1029)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
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
        Top = 260.787570000000000000
        Width = 1084.725110000000000000
        object Memo21: TfrxMemoView
          Left = 793.701300000000000000
          Width = 287.244280000000000000
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
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 3.779530000000000000
          Width = 789.921770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADESIGN] [DATESYS] [SOTRNAME]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 181.417440000000000000
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
          Width = 170.078850000000000000
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
          Left = 657.638220000000000000
          Width = 188.976500000000000000
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
          Left = 846.614720000000000000
          Width = 132.283550000000000000
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
        object Memo18: TfrxMemoView
          Left = 978.898270000000000000
          Width = 102.047310000000000000
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
            '[frxDBSearch."PLANDATE"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBSearch: TfrxDBDataset
    UserName = 'frxDBSearch'
    CloseDataSource = False
    DataSet = odsPac
    BCDToCurrency = False
    Left = 393
    Top = 242
  end
  object sdPopUp: TSaveDialog
    Left = 465
    Top = 299
  end
  object tmrCheckApplication: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrCheckApplicationTimer
    Left = 280
    Top = 404
  end
  object ilRgPlus: TImageList
    Left = 328
    Top = 336
    Bitmap = {
      494C0101020004006C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  object mshSQL: TJvMultiStringHolder
    MultipleStrings = <
      item
        Name = 'default'
        Strings.Strings = (
          'select tambulance.fk_peplid as fk_id, '
          
            '       tambulance.fc_fam||'#39' '#39'||tambulance.fc_im||'#39' '#39'|| tambulanc' +
            'e.fc_otch fio, '
          
            '       decode(to_char(tambulance.fd_rojd, '#39'dd.mm.yyyy hh24:mi:ss' +
            #39'), '#39'00.00.0000 00:00:00'#39', trunc(sysdate), tambulance.fd_rojd) f' +
            'd_rojd, '
          
            '       asu.pkg_regist_peplfunc.get_pepl_age_now(tambulance.fk_pe' +
            'plid) as age, '
          '       tuslvid.fc_name, '
          
            '       decode(tambulance.fp_sex, 0, '#39#1046#1077#1085#1089#1082#1080#1081#39', 1, '#39#1052#1091#1078#1089#1082#1086#1081#39', -1,' +
            ' '#39#1053#1077' '#1080#1079#1074#1077#1089#1090#1077#1085#39') as sex, '
          '       asu.get_ib(tambulance.fk_id) as nib, '
          '       '#39#1040#1084#1073#1091#1083#1072#1090#1086#1088#1085#1086#1077' '#1083#1077#1095#1077#1085#1080#1077#39' as stek_coc, '
          '       tambulance.fk_id as pacid, '
          '       asu.get_last_fluoro(tambulance.fk_peplid) as lastflu, '
          '       1 as is_ambulance, '
          '       0 as fp_tek_coc, '
          '       tuslvid.fk_id as uslid, '
          '       (select max(1) from asu.tnazis '
          
            '         where tnazis.fk_pacid = tambulance.fk_peplid and fk_smi' +
            'd = asu.get_xray_tubdispancer '
          '           and sysdate >= fd_naz '
          
            '           and (sysdate < to_date(fd_run)+1 or fd_run is null)) ' +
            'as cnttub, '
          
            '       (select max(1) from asu.tnazis where fk_pacid = tambulanc' +
            'e.fk_peplid and fk_smid = asu.get_xray_tubdispancer) as cnttub_a' +
            'll, '
          
            '       asu.get_plan_fluoro_date(tambulance.fk_peplid) as plandat' +
            'e, '
          
            '       (select count(*) from asu.tib where fk_pacid = tambulance' +
            '.fk_peplid and fk_smid = (select fk_id from asu.tsmid where fc_s' +
            'ynonim = '#39'XRAY_RG_PLUS'#39')) as cntRgPlus, '
          '       asu.get_doobsledovan(tambulance.fk_peplid) as doobsl,'
          '   TAMBULANCE.FL_VYB ARCHIVED'
          '    from asu.tambulance, asu.tdocobsl, asu.tuslvid '
          '    where tambulance.fc_fam like :pfam||'#39'%'#39
          '    and nvl(tambulance.fc_im,'#39' '#39') like :pim||'#39'%'#39
          '    and nvl(tambulance.fc_otch,'#39' '#39') like :potch||'#39'%'#39
          '    and tambulance.fk_docobsl = tdocobsl.fk_id '
          '    and tdocobsl.fk_viddocid = tuslvid.fk_id '
          '    union all '
          '    select tkarta.fk_peplid as fk_id, '
          
            '       tkarta.fc_fam||'#39' '#39'||tkarta.fc_im||'#39' '#39'|| tkarta.fc_otch fi' +
            'o, '
          
            '       decode(to_char(tkarta.fd_rojd, '#39'dd.mm.yyyy hh24:mi:ss'#39'), ' +
            #39'00.00.0000 00:00:00'#39', trunc(sysdate), tkarta.fd_rojd) fd_rojd, '
          
            '       asu.pkg_regist_peplfunc.get_pepl_age_now(tkarta.fk_peplid' +
            ') as age, '
          '       tuslvid.fc_name, '
          
            '       decode(tkarta.fp_sex, 0, '#39#1046#1077#1085#1089#1082#1080#1081#39', 1, '#39#1052#1091#1078#1089#1082#1086#1081#39', -1, '#39#1053#1077 +
            ' '#1080#1079#1074#1077#1089#1090#1077#1085#39') as sex, '
          '       asu.get_ib(tkarta.fk_id) as nib, '
          
            '       decode(tkarta.fp_tek_coc, 3,'#39#1042#1099#1087#1080#1089#1072#1085#39', 2,'#39#1042' '#1089#1090#1072#1094#1080#1086#1085#1072#1088#1077#39', ' +
            '-2,'#39#1053#1072' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1080' '#1055#1054#39','#39#39') as stek_coc, '
          '       tkarta.fk_id pacid, '
          '       asu.get_last_fluoro(tkarta.fk_peplid) as lastflu, '
          '       0 as is_ambulance, '
          '       tkarta.fp_tek_coc, '
          '       tuslvid.fk_id as uslid, '
          '       (select max(1) from asu.tnazis '
          
            '         where fk_pacid = tkarta.fk_peplid and fk_smid = asu.get' +
            '_xray_tubdispancer '
          '           and sysdate >= fd_naz '
          
            '           and (sysdate < to_date(fd_run)+1 or fd_run is null)) ' +
            'as cnttub, '
          
            '       (select max(1) from asu.tnazis where fk_pacid = tkarta.fk' +
            '_peplid and fk_smid = asu.get_xray_tubdispancer) as cnttub_all, '
          '       asu.get_plan_fluoro_date(tkarta.fk_peplid) as plandate, '
          
            '       (select count(*) from asu.tib where fk_pacid = tkarta.fk_' +
            'peplid and fk_smid = (select fk_id from asu.tsmid where fc_synon' +
            'im = '#39'XRAY_RG_PLUS'#39')) as cntRgPlus, '
          '       asu.get_doobsledovan(tkarta.fk_peplid) as doobsl,'
          '  GREATEST (TKARTA.FL_VYB, TKARTA.FL_VYB2) ARCHIVED'
          '    from asu.tkarta, asu.tuslvid '
          '    where tkarta.fc_fam like :pfam||'#39'%'#39
          '    and nvl(tkarta.fc_im,'#39' '#39') like :pim||'#39'%'#39
          '    and nvl(tkarta.fc_otch,'#39' '#39') like :potch||'#39'%'#39
          '    and tkarta.fk_uslvidid = tuslvid.fk_id '
          '    order by fio ')
      end
      item
        Name = 'un_fluoro_BackUp'
        Strings.Strings = (
          
            'select fk_id,fio,fd_rojd,age,fc_name,sex,nib,stek_coc,pacid,case' +
            ' when is_norm > 0 then lastflu else null end lastflu,is_ambulanc' +
            'e,'
          
            'fp_tek_coc,uslid,cnttub,cnttub_all,case when is_norm > 0 then pl' +
            'andate else null end plandate,cntrgplus,doobsl, ARCHIVED from ( '
          ' select tambulance.fk_peplid as fk_id, '
          
            '        tambulance.fc_fam||'#39' '#39'||tambulance.fc_im||'#39' '#39'|| tambulan' +
            'ce.fc_otch fio, '
          
            '        decode(to_char(tambulance.fd_rojd, '#39'dd.mm.yyyy hh24:mi:s' +
            's'#39'), '#39'00.00.0000 00:00:00'#39', trunc(sysdate), tambulance.fd_rojd) ' +
            'fd_rojd, '
          
            '        asu.pkg_regist_peplfunc.get_pepl_age_now(tambulance.fk_p' +
            'eplid) as age, '
          '        tuslvid.fc_name, '
          
            '        decode(tambulance.fp_sex, 0, '#39#1046#1077#1085#1089#1082#1080#1081#39', 1, '#39#1052#1091#1078#1089#1082#1086#1081#39', -1' +
            ', '#39#1053#1077' '#1080#1079#1074#1077#1089#1090#1077#1085#39') as sex, '
          '        asu.get_ib(tambulance.fk_id) as nib, '
          '        '#39#1040#1084#1073#1091#1083#1072#1090#1086#1088#1085#1086#1077' '#1083#1077#1095#1077#1085#1080#1077#39' as stek_coc, '
          '        tambulance.fk_id as pacid, '
          '        asu.get_last_fluoro(tambulance.fk_peplid) as lastflu, '
          '        1 as is_ambulance, '
          '        0 as fp_tek_coc, '
          '        tuslvid.fk_id as uslid, '
          '        (select max(1) from asu.tnazis '
          
            '          where fk_pacid = tambulance.fk_peplid and fk_smid = as' +
            'u.get_xray_tubdispancer '
          '            and sysdate >= fd_naz '
          
            '            and (sysdate < to_date(fd_run)+1 or fd_run is null))' +
            ' as cnttub, '
          
            '        (select max(1) from asu.tnazis where fk_pacid = tambulan' +
            'ce.fk_peplid and fk_smid = asu.get_xray_tubdispancer) as cnttub_' +
            'all, '
          
            '        asu.get_plan_fluoro_date(tambulance.fk_peplid) as planda' +
            'te, '
          
            '        (select count(*) from asu.tib where fk_pacid = tambulanc' +
            'e.fk_peplid and fk_smid = (select fk_id from asu.tsmid where fc_' +
            'synonim = '#39'XRAY_RG_PLUS'#39')) as cntRgPlus, '
          '        asu.get_doobsledovan(tambulance.fk_peplid) as doobsl , '
          
            '       (select count(1) from asu.tnazis n where n.fk_pacid = tam' +
            'bulance.fk_id and n.FK_SMID IN '
          '                            (SELECT TSMID.FK_ID FROM ASU.TSMID'
          
            '                             WHERE TSMID.FL_SHOWANAL = 1 AND FL_' +
            'DEL = 0 '
          
            '                             START WITH TSMID.FC_SYNONIM = '#39'ISSL' +
            'ED_FLUROGR'#39
          
            '                             CONNECT BY PRIOR TSMID.FK_ID = TSMI' +
            'D.FK_OWNER)'
          
            '                         AND n.FK_NAZSOSID IN (ASU.GET_LABVIP, A' +
            'SU.GET_VIPNAZ, ASU.GET_PASS_REGISTRATOR)'
          
            '                         and exists (select 1 from asu.tib i whe' +
            're i.fk_smid in (SELECT TSMID.FK_ID FROM ASU.TSMID WHERE TSMID.F' +
            'C_SYNONIM in ('#39'XRAY_VRACH_RESUME'#39','#39'OTMETKI_FLU_RESUME2'#39'))'
          '                         and n.fk_id = I.fk_pacid '
          
            '                         and upper(i.fc_char) like '#39'%'#1042#1040#1056#1048#1040#1053#1058'%'#1053#1054#1056 +
            #1052#1067'%'#39
          '                         )'
          '       ) is_norm,'
          '    TAMBULANCE.FL_VYB ARCHIVED'
          '   from asu.tambulance, asu.tdocobsl, asu.tuslvid '
          '  where tambulance.fc_fam like :pfam||'#39'%'#39' '
          '    and nvl(tambulance.fc_im,'#39' '#39') like :pim||'#39'%'#39' '
          '    and nvl(tambulance.fc_otch,'#39' '#39') like :potch||'#39'%'#39' '
          '    and tambulance.fk_docobsl = tdocobsl.fk_id '
          '    and tdocobsl.fk_viddocid = tuslvid.fk_id '
          ' union all '
          ' select tkarta.fk_peplid as fk_id, '
          
            '        tkarta.fc_fam||'#39' '#39'||tkarta.fc_im||'#39' '#39'|| tkarta.fc_otch f' +
            'io, '
          
            '        decode(to_char(tkarta.fd_rojd, '#39'dd.mm.yyyy hh24:mi:ss'#39'),' +
            ' '#39'00.00.0000 00:00:00'#39', trunc(sysdate), tkarta.fd_rojd) fd_rojd,' +
            ' '
          
            '        asu.pkg_regist_peplfunc.get_pepl_age_now(tkarta.fk_pepli' +
            'd) as age, '
          '        tuslvid.fc_name, '
          
            '        decode(tkarta.fp_sex, 0, '#39#1046#1077#1085#1089#1082#1080#1081#39', 1, '#39#1052#1091#1078#1089#1082#1086#1081#39', -1, '#39#1053 +
            #1077' '#1080#1079#1074#1077#1089#1090#1077#1085#39') as sex, '
          '        asu.get_ib(tkarta.fk_id) as nib, '
          
            '        decode(tkarta.fp_tek_coc, 3,'#39#1042#1099#1087#1080#1089#1072#1085#39', 2,'#39#1042' '#1089#1090#1072#1094#1080#1086#1085#1072#1088#1077#39',' +
            ' -2,'#39#1053#1072' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1080' '#1055#1054#39','#39#39') as stek_coc, '
          '        tkarta.fk_id pacid, '
          '        asu.get_last_fluoro(tkarta.fk_peplid) as lastflu, '
          '        0 as is_ambulance, '
          '        tkarta.fp_tek_coc, '
          '        tuslvid.fk_id as uslid, '
          '        (select max(1) from asu.tnazis '
          
            '          where fk_pacid = tkarta.fk_peplid and fk_smid = asu.ge' +
            't_xray_tubdispancer '
          '            and sysdate >= fd_naz '
          
            '            and (sysdate < to_date(fd_run)+1 or fd_run is null))' +
            ' as cnttub, '
          
            '        (select max(1) from asu.tnazis where fk_pacid = tkarta.f' +
            'k_peplid and fk_smid = asu.get_xray_tubdispancer) as cnttub_all,' +
            ' '
          '        asu.get_plan_fluoro_date(tkarta.fk_peplid) as plandate, '
          
            '        (select count(*) from asu.tib where fk_pacid = tkarta.fk' +
            '_peplid and fk_smid = (select fk_id from asu.tsmid where fc_syno' +
            'nim = '#39'XRAY_RG_PLUS'#39')) as cntRgPlus, '
          '        asu.get_doobsledovan(tkarta.fk_peplid) as doobsl , '
          
            '(select count(1) from asu.tnazis n where n.fk_pacid = tkarta.fk_' +
            'id and n.FK_SMID IN (SELECT FK_ID FROM ASU.TSMID'
          '                          WHERE FL_SHOWANAL = 1 AND FL_DEL = 0 '
          
            '                         START WITH FC_SYNONIM = '#39'ISSLED_FLUROGR' +
            #39
          '                         CONNECT BY PRIOR FK_ID = FK_OWNER)'
          
            '  AND n.FK_NAZSOSID IN (ASU.GET_LABVIP, ASU.GET_VIPNAZ, ASU.GET_' +
            'PASS_REGISTRATOR)'
          
            '  and n.fk_id in (select fk_pacid from asu.tib i where i.fk_smid' +
            ' in (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM in ('#39'XRAY_VRAC' +
            'H_RESUME'#39','#39'OTMETKI_FLU_RESUME2'#39') and upper(fc_char) like '#39'%'#1042#1040#1056#1048#1040 +
            #1053#1058'%'#1053#1054#1056#1052#1067'%'#39'))) is_norm,'
          '  GREATEST(TKARTA.FL_VYB,TKARTA.FL_VYB2) ARCHIVED'
          '   from asu.tkarta, asu.tuslvid '
          '  where tkarta.fc_fam like :pfam||'#39'%'#39' '
          '    and nvl(tkarta.fc_im,'#39' '#39') like :pim||'#39'%'#39' '
          '    and nvl(tkarta.fc_otch,'#39' '#39') like :potch||'#39'%'#39' '
          '    and tkarta.fk_uslvidid = tuslvid.fk_id '
          ' )'
          ' order by fio ')
      end
      item
        Name = 'un_fluoro'
        Strings.Strings = (
          '/* Formatted on 2014/08/04 16:13 (Formatter Plus v4.8.7) */'
          '/*WITH cvn AS'
          '     (SELECT fk_id'
          '        FROM asu.tsmid'
          
            '       WHERE fc_synonim IN ('#39'XRAY_VRACH_RESUME'#39', '#39'OTMETKI_FLU_RE' +
            'SUME2'#39')),'
          '     csmid AS'
          '     (SELECT     fk_id'
          '            FROM asu.tsmid'
          '           WHERE fl_showanal = 1 AND fl_del = 0'
          '      START WITH fc_synonim = '#39'ISSLED_FLUROGR'#39
          '      CONNECT BY PRIOR fk_id = fk_owner)*/'
          ''
          
            'SELECT fk_id, fio, fd_rojd, age, fc_name, sex, nib, stek_coc, pa' +
            'cid,'
          '       CASE'
          '          WHEN is_norm > 0'
          '             THEN lastflu'
          '          ELSE NULL'
          
            '       END lastflu, is_ambulance, fp_tek_coc, uslid, cnttub, cnt' +
            'tub_all,'
          '       CASE'
          '          WHEN is_norm > 0'
          '             THEN plandate'
          '          ELSE NULL'
          '       END plandate, cntrgplus, doobsl, ARCHIVED'
          '  FROM (SELECT tkarta.fk_peplid AS fk_id,'
          '               tkarta.fc_fam || '#39' '#39' || tkarta.fc_im || '#39' '#39
          '               || tkarta.fc_otch fio,'
          
            '               DECODE (TO_CHAR (tkarta.fd_rojd, '#39'dd.mm.yyyy hh24' +
            ':mi:ss'#39'),'
          '                       '#39'00.00.0000 00:00:00'#39', TRUNC (SYSDATE),'
          '                       tkarta.fd_rojd'
          '                      ) fd_rojd,'
          '               asu.pkg_regist_peplfunc.get_pepl_age_now'
          
            '                                                     (tkarta.fk_' +
            'peplid)'
          
            '                                                                ' +
            '       AS age,'
          '               tuslvid.fc_name,'
          '               DECODE (tkarta.fp_sex,'
          '                       0, '#39#1046#1077#1085#1089#1082#1080#1081#39','
          '                       1, '#39#1052#1091#1078#1089#1082#1086#1081#39','
          '                       -1, '#39#1053#1077' '#1080#1079#1074#1077#1089#1090#1077#1085#39
          '                      ) AS sex,'
          '               asu.get_ib (tkarta.fk_id) AS nib,'
          '               DECODE (is_amb,'
          '                       1, '#39#1040#1084#1073#1091#1083#1072#1090#1086#1088#1085#1086#1077' '#1083#1077#1095#1077#1085#1080#1077#39','
          '                       DECODE (tkarta.fp_tek_coc,'
          '                               3, '#39#1042#1099#1087#1080#1089#1072#1085#39','
          '                               2, '#39#1042' '#1089#1090#1072#1094#1080#1086#1085#1072#1088#1077#39','
          '                               -2, '#39#1053#1072' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1080' '#1055#1054#39','
          '                               '#39#39
          '                              )'
          '                      ) AS stek_coc,'
          '               tkarta.fk_id pacid,'
          
            '               asu.get_last_fluoro (tkarta.fk_peplid) AS lastflu' +
            ','
          '               is_amb AS is_ambulance, tkarta.fp_tek_coc,'
          '               tuslvid.fk_id AS uslid,'
          '               (SELECT MAX (1)'
          '                  FROM asu.tnazis'
          '                 WHERE fk_pacid = tkarta.fk_peplid'
          '                   AND fk_smid = asu.get_xray_tubdispancer'
          '                   AND SYSDATE >= fd_naz'
          
            '                   AND (SYSDATE < TO_DATE (fd_run) + 1 OR fd_run' +
            ' IS NULL))'
          
            '                                                                ' +
            '    AS cnttub,'
          '               (SELECT MAX (1)'
          '                  FROM asu.tnazis'
          '                 WHERE fk_pacid = tkarta.fk_peplid'
          
            '                   AND fk_smid = asu.get_xray_tubdispancer) AS c' +
            'nttub_all,'
          
            '               asu.get_plan_fluoro_date (tkarta.fk_peplid) AS pl' +
            'andate,'
          '               (SELECT COUNT (*)'
          '                  FROM asu.tib'
          '                 WHERE fk_pacid = tkarta.fk_peplid'
          '                   AND fk_smid = (SELECT fk_id'
          '                                    FROM asu.tsmid'
          
            '                                   WHERE fc_synonim = '#39'XRAY_RG_P' +
            'LUS'#39'))'
          
            '                                                                ' +
            ' AS cntrgplus,'
          
            '               asu.get_doobsledovan (tkarta.fk_peplid) AS doobsl' +
            ','
          '              '
          '               asu.NAZ_FLUORO_IS_NORM(tkarta.fk_id) is_norm,'
          '                   ARCHIVED'
          
            '          FROM (SELECT k.fk_id, k.fc_fam, k.fc_im, k.fc_otch, k.' +
            'fk_ibid,'
          
            '                       k.fk_iby, k.fk_uslvidid, k.fk_peplid, k.f' +
            'p_tek_coc,'
          
            '                       k.fp_sex, k.fd_rojd, 0 is_amb, GREATEST(K' +
            '.FL_VYB, K.FL_VYB2) ARCHIVED'
          '                  FROM asu.tkarta k'
          '                 WHERE k.fc_fam LIKE :pfam || '#39'%'#39
          
            '                   AND (:pim IS NULL OR NVL (k.fc_im, '#39' '#39') LIKE ' +
            ':pim || '#39'%'#39')'
          '                   AND (:potch IS NULL'
          
            '                        OR NVL (k.fc_otch, '#39' '#39') LIKE :potch || '#39 +
            '%'#39
          '                       )'
          '                UNION ALL'
          
            '                SELECT a.fk_id, a.fc_fam, a.fc_im, a.fc_otch, a.' +
            'fk_ibid,'
          
            '                       a.fk_iby, d.fk_viddocid fk_uslvidid, a.fk' +
            '_peplid,'
          
            '                       0 fp_tek_coc, a.fp_sex, a.fd_rojd, 1 is_a' +
            'mb, a.FL_VYB ARCHIVED'
          '                  FROM asu.tambulance a, asu.tdocobsl d'
          '                 WHERE a.fk_docobsl = d.fk_id'
          '                   AND a.fc_fam LIKE :pfam || '#39'%'#39
          
            '                   AND (:pim IS NULL OR NVL (a.fc_im, '#39' '#39') LIKE ' +
            ':pim || '#39'%'#39')'
          '                   AND (:potch IS NULL'
          
            '                        OR NVL (a.fc_otch, '#39' '#39') LIKE :potch || '#39 +
            '%'#39
          '                       )) tkarta,'
          '               asu.tuslvid'
          '         WHERE tkarta.fk_uslvidid = tuslvid.fk_id)'
          '')
      end>
    Left = 120
    Top = 433
  end
end
