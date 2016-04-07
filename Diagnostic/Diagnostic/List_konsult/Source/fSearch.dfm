object frmSearch: TfrmSearch
  Left = 126
  Top = 84
  BorderIcons = [biMinimize, biMaximize]
  Caption = #1055#1086#1080#1089#1082' '#1087#1072#1094#1080#1077#1085#1090#1072
  ClientHeight = 614
  ClientWidth = 1129
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object paMain: TPanel
    Left = 0
    Top = 0
    Width = 1129
    Height = 614
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 1123
      Height = 64
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object p: TPanel
        Left = 2
        Top = 2
        Width = 1024
        Height = 60
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object cxLabel1: TcxLabel
          Left = 10
          Top = 11
          Caption = #1060#1048#1054':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Book Antiqua'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Transparent = True
        end
        object sFIO: TcxTextEdit
          Left = 48
          Top = 5
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
          Style.IsFontAssigned = True
          TabOrder = 1
          OnClick = sFIOClick
          OnEnter = sFIOEnter
          OnKeyDown = sFIOKeyDown
          Height = 33
          Width = 385
        end
        object bSearch: TcxButton
          Left = 440
          Top = 5
          Width = 33
          Height = 33
          Action = aSearch
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          LookAndFeel.Kind = lfOffice11
        end
        object bClear: TcxButton
          Left = 479
          Top = 5
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
        end
        object cxLabel2: TcxLabel
          Left = 48
          Top = 36
          Caption = #1055#1086#1083':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Book Antiqua'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Transparent = True
        end
        object lbSex: TcxLabel
          Left = 87
          Top = 37
          Caption = '--'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Book Antiqua'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel3: TcxLabel
          Left = 236
          Top = 36
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Book Antiqua'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Transparent = True
        end
        object lbRojd: TcxLabel
          Left = 320
          Top = 37
          Caption = '--'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Book Antiqua'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel4: TcxLabel
          Left = 739
          Top = 0
          Align = alRight
          Caption = #1042#1080#1076' '#1087#1072#1094#1080#1077#1085#1090#1072':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Book Antiqua'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          ExplicitLeft = 718
          AnchorY = 30
        end
        object cxGroupBox1: TcxGroupBox
          Left = 839
          Top = 0
          Align = alRight
          Style.BorderStyle = ebsOffice11
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 9
          Height = 60
          Width = 185
          object rbAmb: TcxRadioButton
            Left = 4
            Top = 7
            Width = 169
            Height = 17
            Caption = #1040#1084#1073#1091#1083#1072#1090#1086#1088#1085#1099#1077' '#1087#1072#1094#1080#1077#1085#1090#1099
            TabOrder = 0
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.SkinName = 'Office2007Green'
            Transparent = True
          end
          object rbStac: TcxRadioButton
            Tag = 1
            Left = 4
            Top = 23
            Width = 161
            Height = 17
            Caption = #1057#1090#1072#1094#1080#1086#1085#1072#1088#1085#1099#1077' '#1087#1072#1094#1080#1077#1085#1090#1099
            TabOrder = 1
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.SkinName = 'Office2007Green'
            Transparent = True
          end
          object rbAll: TcxRadioButton
            Tag = 2
            Left = 4
            Top = 40
            Width = 148
            Height = 17
            Caption = #1042#1089#1077' '#1087#1072#1094#1080#1077#1085#1090#1099
            TabOrder = 2
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.SkinName = 'Office2007Green'
            Transparent = True
          end
        end
      end
      object bClose: TcxButton
        AlignWithMargins = True
        Left = 1028
        Top = 4
        Width = 91
        Height = 56
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Action = aClose
        Align = alRight
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        LookAndFeel.Kind = lfOffice11
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 70
      Width = 1129
      Height = 544
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel2'
      TabOrder = 1
      object paPac: TPanel
        Left = 0
        Top = 0
        Width = 760
        Height = 544
        Align = alClient
        BevelOuter = bvNone
        Constraints.MinWidth = 200
        TabOrder = 0
        object cxGr: TcxGrid
          Left = 0
          Top = 31
          Width = 760
          Height = 513
          Align = alClient
          PopupMenu = pmTV
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          object TVPAC: TcxGridDBTableView
            OnKeyDown = TVPACKeyDown
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
            OptionsView.Indicator = True
            object VFIO: TcxGridDBColumn
              Caption = #1060#1048#1054
              DataBinding.FieldName = 'FIO'
              VisibleForCustomization = False
              Width = 153
            end
            object VROJD: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
              DataBinding.FieldName = 'FD_ROJD'
              VisibleForCustomization = False
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
          end
          object cxGrLevel1: TcxGridLevel
            GridView = TVPAC
          end
        end
        object dxBarDockControl1: TdxBarDockControl
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 754
          Height = 28
          Margins.Top = 0
          Align = dalTop
          BarManager = BM
          SunkenBorder = True
          UseOwnSunkenBorder = True
        end
      end
      object paNazWizard: TPanel
        Left = 768
        Top = 0
        Width = 361
        Height = 544
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 361
          Height = 31
          Align = alTop
          AutoSize = True
          BevelOuter = bvNone
          Caption = 'Panel3'
          TabOrder = 0
          object dxBarDockControl2: TdxBarDockControl
            AlignWithMargins = True
            Left = 3
            Top = 0
            Width = 355
            Height = 28
            Margins.Top = 0
            Align = dalTop
            BarManager = BM
            SunkenBorder = True
            UseOwnSunkenBorder = True
          end
        end
        object paLoad: TPanel
          Left = 0
          Top = 31
          Width = 361
          Height = 454
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          OnResize = paLoadResize
          object cxGrid2: TcxGrid
            Left = 0
            Top = 0
            Width = 361
            Height = 388
            Align = alClient
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object TVISSL: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              OnCellDblClick = TVISSLCellDblClick
              OnCustomDrawCell = TVISSLCustomDrawCell
              OnFocusedRecordChanged = TVISSLFocusedRecordChanged
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
                Width = 50
              end
              object VDATE: TcxGridDBColumn
                Caption = #1044#1072#1090#1072' '#1074#1099#1087'.'
                DataBinding.FieldName = 'FD_RUN'
                Width = 51
              end
              object VNAMEISSL: TcxGridDBColumn
                Caption = #1050#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1103
                DataBinding.FieldName = 'NAMEISSL'
                Width = 166
              end
              object VSOSID: TcxGridDBColumn
                Caption = 'SOS_ID'
                DataBinding.FieldName = 'FK_NAZSOSID'
                Visible = False
                VisibleForCustomization = False
              end
              object VKTO: TcxGridDBColumn
                Caption = #1053#1072#1079#1085#1072#1095#1080#1074#1096#1080#1081
                DataBinding.FieldName = 'VRACHFIO'
                Width = 80
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = TVISSL
            end
          end
          object memParam: TcxMemo
            Left = 0
            Top = 388
            Hint = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
            Align = alBottom
            ParentShowHint = False
            Properties.ReadOnly = True
            Properties.ScrollBars = ssVertical
            ShowHint = True
            Style.BorderStyle = ebsOffice11
            Style.LookAndFeel.SkinName = 'Office2007Green'
            StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
            StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
            StyleHot.LookAndFeel.SkinName = 'Office2007Green'
            TabOrder = 1
            Visible = False
            Height = 66
            Width = 361
          end
        end
        object vgParam: TcxVerticalGrid
          Left = 0
          Top = 485
          Width = 361
          Height = 59
          Align = alBottom
          LookAndFeel.Kind = lfUltraFlat
          OptionsView.RowHeaderWidth = 81
          TabOrder = 2
          object catParam: TcxCategoryRow
            Options.Focusing = False
            Options.Moving = False
            Options.TabStop = False
            Properties.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
          end
          object rowType: TcxEditorRow
            Properties.Caption = #1058#1080#1087
            Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.DropDownSizeable = True
            Properties.EditProperties.GridMode = True
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.KeyFieldNames = 'FK_ID'
            Properties.EditProperties.ListColumns = <
              item
                FieldName = 'FC_NAME'
              end>
            Properties.EditProperties.ListOptions.ShowHeader = False
            Properties.EditProperties.ListSource = dsType
            Properties.EditProperties.PostPopupValueOnTab = True
            Properties.EditProperties.OnEditValueChanged = rowTypeEditPropertiesEditValueChanged
            Properties.DataBinding.ValueType = 'String'
            Properties.Options.ShowEditButtons = eisbAlways
            Properties.Value = Null
          end
          object rowNapr: TcxEditorRow
            Properties.Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085
            Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.DropDownSizeable = True
            Properties.EditProperties.GridMode = True
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.KeyFieldNames = 'FK_ID'
            Properties.EditProperties.ListColumns = <
              item
                FieldName = 'FC_NAME'
              end>
            Properties.EditProperties.ListOptions.ShowHeader = False
            Properties.EditProperties.ListSource = dsKem
            Properties.EditProperties.PostPopupValueOnTab = True
            Properties.EditProperties.OnEditValueChanged = rowNaprEditPropertiesEditValueChanged
            Properties.DataBinding.ValueType = 'String'
            Properties.Options.ShowEditButtons = eisbAlways
            Properties.Value = Null
          end
        end
      end
      object cxSplitter1: TcxSplitter
        Left = 760
        Top = 0
        Width = 8
        Height = 544
        HotZoneClassName = 'TcxXPTaskBarStyle'
        HotZone.SizePercent = 57
        AlignSplitter = salRight
        ResizeUpdate = True
        Control = paNazWizard
        Visible = False
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
      ImageIndex = 2
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aSearch: TAction
      Hint = #1055#1086#1080#1089#1082' '#1087#1072#1094#1080#1077#1085#1090#1072
      ImageIndex = 11
      ShortCut = 16397
      OnExecute = aSearchExecute
    end
    object aInfo: TAction
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1072#1094#1080#1077#1085#1090#1077
      ImageIndex = 10
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
    object actLoadNaz: TAction
      Caption = #1050#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1080
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1082#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1081
      ImageIndex = 19
      ShortCut = 16460
      OnExecute = actLoadNazExecute
    end
    object actRefreshNaz: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1082#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1081
      ImageIndex = 12
      ShortCut = 116
      OnExecute = actRefreshNazExecute
    end
    object actCloseNaz: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1082#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1081
      ImageIndex = 2
      OnExecute = actCloseNazExecute
    end
    object aClearSearch: TAction
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1087#1086#1080#1089#1082#1072
      ShortCut = 119
      OnExecute = aClearSearchExecute
    end
    object aFill: TAction
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
      Hint = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1087#1088#1086#1090#1086#1082#1086#1083' '#1082#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1080
      ImageIndex = 1
      OnExecute = aFillExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1087#1072#1094#1080#1077#1085#1090#1086#1074
      ImageIndex = 8
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 4
      OnExecute = aTextExecute
    end
    object aWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 5
      OnExecute = aWebExecute
    end
    object aXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 6
      OnExecute = aXMLExecute
    end
    object aXLS: TAction
      Caption = 'Excel '#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel '#1092#1072#1081#1083
      ImageIndex = 7
      OnExecute = aXLSExecute
    end
    object aOtmena: TAction
      Hint = 
        #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1085#1077#1103#1074#1082#1091'.'#13#10#1042#1085#1080#1084#1072#1085#1080#1077'! '#1054#1090#1084#1077#1085#1103#1090#1100' '#1084#1086#1078#1085#1086' '#1090#1086#1083#1100#1082#1086' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103' ' +
        #1089#1086' '#1089#1090#1072#1090#1091#1089#1086#1084' '#39#1053#1045' '#1042#1067#1055'.'#39' '#1080#1083#1080' '#39#1056#1045#1050#1054#1052#1045#1053#1044#1054#1042#1040#1053#1054#39'('#1073#1077#1083#1099#1081' '#1094#1074#1077#1090')'
      OnExecute = aOtmenaExecute
    end
    object aProsmotr: TAction
      Hint = 
        #1055#1088#1086#1089#1084#1086#1090#1088' '#1087#1088#1086#1090#1086#1082#1086#1083#1072' '#1082#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1080'.'#13#10#1042#1085#1080#1084#1072#1085#1080#1077'! '#1055#1088#1086#1089#1084#1072#1090#1088#1080#1074#1072#1090#1100' '#1084#1086#1078#1085#1086' ' +
        #1090#1086#1083#1100#1082#1086' '#1082#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1080' '#13#10'                  '#1089#1086' '#1089#1090#1072#1090#1091#1089#1086#1084' '#39#1042#1067#1055#1054#1051#1053#1045#1053#1054#39' ' +
        '('#1079#1077#1083#1077#1085#1099#1081' '#1094#1074#1077#1090').'#13#10
      ImageIndex = 9
      ShortCut = 118
      OnExecute = aProsmotrExecute
    end
    object aNew: TAction
      Caption = #1053#1086#1074#1099#1081
      Hint = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1087#1072#1094#1080#1077#1085#1090#1072
      ImageIndex = 16
      ShortCut = 16462
      OnExecute = aNewExecute
    end
    object actNaz: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1102
      ImageIndex = 18
      OnExecute = actNazExecute
    end
  end
  object dsPac: TDataSource
    DataSet = odsPac
    Left = 121
    Top = 282
  end
  object odsPac: TOracleDataSet
    SQL.Strings = (
      'SELECT TPEOPLES.FK_ID, TKARTA.FK_ID AS PACID,'
      
        '       TPEOPLES.FC_FAM||'#39' '#39'||TPEOPLES.FC_IM||'#39' '#39'|| TPEOPLES.FC_O' +
        'TCH FIO, '
      '       TPEOPLES.FD_ROJD,  '
      '       PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TPEOPLES.FK_ID) SEX,'
      '       TPEOPLES.FC_DOCSER, '
      '       TPEOPLES.FC_DOCNUM, '
      '       TPEOPLES.FD_DOCDATE, '
      '       ASU.GET_IB(TKARTA.FK_ID) AS NIB, TKARTA.FK_ID AS PACID,'
      
        '       DECODE(TKARTA.FP_TEK_COC,3,'#39#1042#1067#1055#1048#1057#1040#1053#39',2,'#39#1042' '#1057#1058#1040#1062#1048#1054#1053#1040#1056#1045#39',-2,' +
        #39#1053#1040' '#1054#1060#1054#1056#1052#1051#1045#1053#1048#1048' '#1055#1054#39','#39#39') STEK_COC,'
      '       0 AS IS_AMBULANCE,'
      '       TUSLVID.FC_NAME'
      ''
      '  FROM TPEOPLES, TKARTA, TPERESEL, TDOCOBSL, TUSLVID'
      ' WHERE TKARTA.FK_PEPLID=TPEOPLES.FK_ID'
      '   AND GET_MAXPERESELID(TKARTA.FK_ID) = TPERESEL.FK_ID '
      '   AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID '
      '   AND TDOCOBSL.FK_VIDDOCID = TUSLVID.FK_ID')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000D00000005000000464B5F49440100000000000300000046494F0100
      000000000700000046445F524F4A440100000000000900000046435F444F4353
      45520100000000000900000046435F444F434E554D0100000000000A00000046
      445F444F4344415445010000000000030000004E494201000000000008000000
      5354454B5F434F43010000000000030000005345580100000000000500000050
      414349440100000000000700000050414349445F310100000000000C00000049
      535F414D42554C414E43450100000000000700000046435F4E414D4501000000
      0000}
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
          ItemName = 'bbNew'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbLoad'
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
      Caption = 'Issl'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 95
      FloatTop = 55
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbNaz'
        end
        item
          Visible = True
          ItemName = 'bbFill'
        end
        item
          Visible = True
          ItemName = 'bbOtmena'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          Visible = True
          ItemName = 'bbProsmotr'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cxCheckMK'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton3'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
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
    object bbLoad: TdxBarButton
      Action = actLoadNaz
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton2: TdxBarButton
      Action = actRefreshNaz
      Category = 0
    end
    object cxCheckMK: TcxBarEditItem
      Caption = #1055#1086' '#1090#1077#1082#1091#1097#1077#1081' '#1052#1050
      Category = 0
      Hint = #1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1082#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1080' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1081' '#1052#1050
      Visible = ivNever
      ShowCaption = True
      Width = 25
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
      Properties.OnChange = cxCheckMKPropertiesChange
      InternalEditValue = '1'
    end
    object dxBarButton3: TdxBarButton
      Action = actCloseNaz
      Category = 0
    end
    object bbFill: TdxBarButton
      Action = aFill
      Category = 0
    end
    object bbOtmena: TdxBarButton
      Action = aOtmena
      Category = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000A40206B0030AAE0000A600009800000000
        00000000000000000000A700009A0000A70000000000000000000000000000A9
        1844F6194DF81031D20102AB0000B60000000000000000B10928D7092ED70313
        B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
        00B00000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
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
        B80000B500007700000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object bbProsmotr: TdxBarButton
      Action = aProsmotr
      Category = 0
    end
    object bbNew: TdxBarButton
      Action = aNew
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbNaz: TdxBarButton
      Action = actNaz
      Category = 0
      ButtonStyle = bsChecked
    end
  end
  object pmTV: TPopupMenu
    Images = frmMain.ilMain
    Left = 280
    Top = 170
    object N1: TMenuItem
      Action = aPrint
    end
    object N3: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 3
      object N4: TMenuItem
        Action = aText
      end
      object Web1: TMenuItem
        Action = aWeb
      end
      object Excel1: TMenuItem
        Action = aXML
      end
      object Excel2: TMenuItem
        Action = aXLS
      end
    end
    object N2: TMenuItem
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
      ImageIndex = 13
      OnClick = N2Click
    end
  end
  object dsNaz: TDataSource
    DataSet = odsNaz
    Left = 917
    Top = 270
  end
  object odsNaz: TOracleDataSet
    SQL.Strings = (
      'SELECT VNAZ.FK_ID, '
      '       VNAZ.FK_SMID,'
      '       ASU.GET_OWNER_FROM_SMID(VNAZ.FK_SMID) AS OWNER,'
      '       VNAZ.FD_NAZ,'
      '       VNAZ.FD_RUN AS RUN_DATE,'
      
        '       DECODE(VNAZ.FK_NAZSOSID, ASU.GET_LABVIP, TO_CHAR(VNAZ.FD_' +
        'RUN, '#39'DD.MM.YYYY HH24:MI'#39'), ASU.GET_VIPNAZ, TO_CHAR(VNAZ.FD_RUN,' +
        ' '#39'DD.MM.YYYY HH24:MI'#39'), NULL) AS FD_RUN,'
      '       VNAZ.FK_PACID,'
      '       VNAZ.FK_ROOMID,'
      '       VNAZ.FK_NAZSOSID,'
      '       VNAZ.FK_DOCID,'
      '       VNAZ.FK_NAZTYPEID,'
      '       ASU.GET_FULLPATH_SHA(VNAZ.FK_SMID) AS NAMEISSL,'
      '       ASU.PKG_NAZ.GET_NAZPARAM(VNAZ.FK_ID) PARAM,'
      '       asu.do_vrachfio(vnaz.fk_vrachid) as vrachfio'
      '      '
      '  FROM ASU.VNAZ, ASU.TAMBULANCE '
      ' WHERE VNAZ.FK_PACID = TAMBULANCE.FK_ID'
      '   AND TAMBULANCE.FK_PEPLID = :PFK_PACID'
      '   AND FK_SMID IN (SELECT FK_ID '
      '                     FROM asu.TSMID '
      '                    WHERE FL_SHOWANAL = 1'
      '                   start with FC_SYNONIM = '#39'KONS_SPEC'#39
      '                   connect by prior fk_id = fk_owner)'
      '   AND VNAZ.FK_NAZSOSID <> ASU.GET_PASS_REGISTRATOR'
      '                  '
      'UNION ALL'
      ''
      'SELECT VNAZ.FK_ID, '
      '       VNAZ.FK_SMID,'
      '       ASU.GET_OWNER_FROM_SMID(VNAZ.FK_SMID) AS OWNER,'
      '       VNAZ.FD_NAZ,'
      '       VNAZ.FD_RUN AS RUN_DATE,'
      
        '       DECODE(VNAZ.FK_NAZSOSID, ASU.GET_LABVIP, TO_CHAR(VNAZ.FD_' +
        'RUN, '#39'DD.MM.YYYY HH24:MI'#39'), ASU.GET_VIPNAZ, TO_CHAR(VNAZ.FD_RUN,' +
        ' '#39'DD.MM.YYYY HH24:MI'#39'), NULL) AS FD_RUN,'
      '       VNAZ.FK_PACID,'
      '       VNAZ.FK_ROOMID,'
      '       VNAZ.FK_NAZSOSID,'
      '       VNAZ.FK_DOCID,'
      '       VNAZ.FK_NAZTYPEID,'
      '       ASU.GET_FULLPATH_SHA(VNAZ.FK_SMID) AS NAMEISSL,'
      '       ASU.PKG_NAZ.GET_NAZPARAM(VNAZ.FK_ID) PARAM,'
      '       asu.do_vrachfio(vnaz.fk_vrachid) as vrachfio '
      '        '
      '  FROM ASU.VNAZ, ASU.TKARTA '
      ' WHERE VNAZ.FK_PACID = TKARTA.FK_ID'
      '   AND TKARTA.FK_PEPLID = :PFK_PACID'
      '   AND FK_SMID IN (SELECT FK_ID '
      '                     FROM asu.TSMID '
      '                    WHERE FL_SHOWANAL = 1'
      '                   start with FC_SYNONIM = '#39'KONS_SPEC'#39
      
        '                   connect by prior fk_id = fk_owner)           ' +
        '    '
      '   AND VNAZ.FK_NAZSOSID <> ASU.GET_PASS_REGISTRATOR'
      '                  '
      'ORDER BY FD_RUN DESC'
      ''
      ''
      ''
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464B5F504143494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000D00000005000000464B5F494401000000000007000000464B5F534D
      49440100000000000600000046445F4E415A010000000000080000004E414D45
      4953534C0100000000000600000046445F52554E01000000000008000000464B
      5F5041434944010000000000050000004F574E45520100000000000900000046
      4B5F524F4F4D49440100000000000B000000464B5F4E415A534F534944010000
      0000000800000052554E5F4441544501000000000008000000464B5F444F4349
      4401000000000005000000504152414D0100000000000C000000464B5F4E415A
      545950454944010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsNazBeforeOpen
    AfterOpen = odsNazAfterOpen
    Left = 917
    Top = 223
    object odsNazFK_ID: TFloatField
      FieldName = 'FK_ID'
    end
    object odsNazFK_SMID: TFloatField
      FieldName = 'FK_SMID'
    end
    object odsNazOWNER: TFloatField
      FieldName = 'OWNER'
    end
    object odsNazFD_NAZ: TDateTimeField
      FieldName = 'FD_NAZ'
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
    object odsNazFK_DOCID: TFloatField
      FieldName = 'FK_DOCID'
    end
    object odsNazNAMEISSL: TStringField
      FieldName = 'NAMEISSL'
      Size = 4000
    end
    object odsNazPARAM: TStringField
      FieldName = 'PARAM'
      Size = 4000
    end
    object odsNazFK_NAZTYPEID: TFloatField
      FieldName = 'FK_NAZTYPEID'
    end
    object odsNazVRACHFIO: TStringField
      FieldName = 'VRACHFIO'
      Size = 100
    end
  end
  object sdPopUp: TSaveDialog
    Left = 393
    Top = 241
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
    ReportOptions.LastChange = 40040.595505960650000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepSearchGetValue
    Left = 465
    Top = 162
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
        Height = 113.385900000000000000
        Top = 18.897650000000000000
        Width = 1084.725110000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Width = 1077.166050000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]'
            '[OTDELNAME]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 41.574830000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#160#1056#181#1056#183#1057#1107#1056#187#1057#1034#1057#8218#1056#176#1057#8218#1057#8249' '#1056#1111#1056#1109#1056#1105#1057#1027#1056#1108#1056#176' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#1109#1056#1030)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 64.252010000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1032#1057#1027#1056#187#1056#1109#1056#1030#1056#1105#1056#181' '#1056#1111#1056#1109#1056#1105#1057#1027#1056#1108#1056#176': ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 120.944960000000000000
          Top = 64.252010000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[USLOVIE]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 94.488250000000000000
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
          Top = 94.488250000000000000
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
          Top = 94.488250000000000000
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
          Top = 94.488250000000000000
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
          Top = 94.488250000000000000
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
        object Memo19: TfrxMemoView
          Left = 793.701300000000000000
          Top = 41.574830000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1056#1109#1057#8218#1057#1026#1057#1107#1056#1169#1056#1029#1056#1105#1056#1108': [SOTRNAME] ')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 793.701300000000000000
          Top = 64.252010000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[DATESYS]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 34.015770000000000000
        Top = 272.126160000000000000
        Width = 1084.725110000000000000
        object Memo21: TfrxMemoView
          Left = 3.779530000000000000
          Width = 1077.166050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          AutoWidth = True
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
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 192.756030000000000000
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
      end
    end
  end
  object frxDBSearch: TfrxDBDataset
    UserName = 'frxDBSearch'
    CloseDataSource = False
    DataSet = odsPac
    BCDToCurrency = False
    Left = 465
    Top = 218
  end
  object frxRepProsmotr: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39745.714799513890000000
    ReportOptions.LastChange = 40040.595762187500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepProsmotrGetValue
    Left = 625
    Top = 312
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
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object PageFooter1: TfrxPageFooter
        Height = 35.015770000000000000
        Top = 325.039580000000000000
        Width = 755.906000000000000000
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.000000000000000000
          Width = 748.346940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 3.779530000000000000
          Top = 19.897650000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          AutoWidth = True
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
      object ReportTitle1: TfrxReportTitle
        Height = 245.669450000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        AllowSplit = True
        StartNewPage = True
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Width = 748.346940000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]'
            '[OTDELNAME]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 41.574830000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218':')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 64.252010000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8217#1056#1109#1056#183#1057#1026#1056#176#1057#1027#1057#8218':')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 75.590600000000000000
          Top = 41.574830000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[PACFIO]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 75.590600000000000000
          Top = 64.252010000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[PACAGE]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 26.456710000000000000
          Top = 166.299320000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176':')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 75.590600000000000000
          Top = 167.299320000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[RUNDATE]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Top = 102.047310000000000000
          Width = 748.346940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[ISSLNAME]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 3.779530000000000000
          Top = 124.724490000000000000
          Width = 748.346940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haBlock
          Memo.UTF8 = (
            '[ISSLTEXT]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 26.456710000000000000
          Top = 188.976500000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#176#1057#8225':'#31)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 75.590600000000000000
          Top = 188.976500000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[SOTRNAME]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 555.590910000000000000
          Top = 41.574830000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1114#1056#1113':')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 608.504330000000000000
          Top = 41.574830000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[NUMMK]')
          ParentFont = False
        end
      end
    end
  end
  object dsKem: TDataSource
    DataSet = odsKem
    Left = 600
    Top = 419
  end
  object odsKem: TOracleDataSet
    SQL.Strings = (
      'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FK_OWNER, 0 AS FN_ORDER'
      '  FROM DUAL'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FK_OWNER, FN_ORDER'
      '  FROM ASU.TSMID'
      'WHERE FL_SHOWPRINT = 1'
      '  AND LEVEL <> 1  '
      'START WITH FC_SYNONIM = '#39'PD_NAPRAVIV_YCH'#39
      'CONNECT BY PRIOR FK_ID = FK_OWNER '
      'ORDER BY FC_NAME '
      ''
      '/*'
      'SELECT FK_ID, FC_SHORT AS FC_NAME, FK_OWNER, 1000 as FN_ORDER'
      '  FROM ASU.TCOMPANY'
      
        'WHERE FK_ID <> (SELECT FK_ID FROM ASU.TCOMPANY WHERE FC_SYNONIM ' +
        '= '#39'ROOT_LPU'#39')'
      'START WITH FC_SYNONIM = '#39'ROOT_LPU'#39
      'CONNECT BY PRIOR FK_ID = FK_OWNER '
      'ORDER BY FN_ORDER '
      '*/ --commented 04.08.2010')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464B5F4F574E455201000000000008000000464E
      5F4F52444552010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 560
    Top = 419
  end
  object odsType: TOracleDataSet
    SQL.Strings = (
      
        'select rownum, FK_ID, FC_NAME, FN_ORDER, FK_DEFAULT, FL_SHOWPRIN' +
        'T '
      'from tsmid '
      
        'where FK_OWNER = (select fk_id from tsmid where FC_SYNONIM = '#39'NA' +
        'ZN_TYPES'#39') '
      'and fl_showprint = 1'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464B5F4F574E455201000000000008000000464E
      5F4F52444552010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 824
    Top = 387
  end
  object dsType: TDataSource
    DataSet = odsType
    Left = 880
    Top = 387
  end
  object tmrCheckApplication: TTimer
    Interval = 500
    OnTimer = tmrCheckApplicationTimer
    Left = 592
    Top = 148
  end
  object jvFrmStor: TJvFormStorage
    AppStorage = frmMain.AppStorage
    AppStoragePath = 'frmSearch\'
    StoredValues = <>
    Left = 286
    Top = 350
  end
end
