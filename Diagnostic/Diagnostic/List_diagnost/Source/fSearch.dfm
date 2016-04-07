object frmSearch: TfrmSearch
  Left = 241
  Top = 98
  BorderIcons = [biMinimize, biMaximize]
  Caption = #1055#1086#1080#1089#1082' '#1087#1072#1094#1080#1077#1085#1090#1072
  ClientHeight = 611
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
    Height = 611
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 1129
      Height = 70
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object p: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1026
        Height = 64
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
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
          Left = 439
          Top = 5
          Width = 34
          Height = 33
          Action = aSearch
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
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
          Top = 2
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
          AnchorY = 32
        end
        object cxGroupBox1: TcxGroupBox
          Left = 839
          Top = 2
          Align = alRight
          Style.BorderStyle = ebsFlat
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
            Transparent = True
          end
        end
      end
      object bClose: TcxButton
        AlignWithMargins = True
        Left = 1035
        Top = 3
        Width = 91
        Height = 64
        Action = aClose
        Align = alRight
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 70
      Width = 1129
      Height = 541
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel2'
      TabOrder = 1
      object paPac: TPanel
        Left = 0
        Top = 0
        Width = 760
        Height = 541
        Align = alClient
        BevelOuter = bvNone
        Constraints.MinWidth = 200
        TabOrder = 0
        object cxGr: TcxGrid
          Left = 0
          Top = 31
          Width = 760
          Height = 510
          Align = alClient
          PopupMenu = pmTV
          TabOrder = 0
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
        Height = 541
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 361
          Height = 33
          Align = alTop
          AutoSize = True
          Caption = 'Panel3'
          TabOrder = 0
          object dxBarDockControl2: TdxBarDockControl
            AlignWithMargins = True
            Left = 4
            Top = 1
            Width = 353
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
          Top = 33
          Width = 361
          Height = 449
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          OnResize = paLoadResize
          object cxGrid2: TcxGrid
            Left = 0
            Top = 0
            Width = 361
            Height = 383
            Align = alClient
            PopupMenu = PopupMenu1
            TabOrder = 0
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
              OptionsCustomize.ColumnsQuickCustomization = True
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              OptionsView.Indicator = True
              object VISSLCNTIMAGE: TcxGridDBColumn
                Caption = '_'
                DataBinding.FieldName = 'FK_RESULTID'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Images = frmMain.ilCntImage
                Properties.Items = <
                  item
                    ImageIndex = 0
                  end
                  item
                    ImageIndex = 1
                    Value = '1'
                  end>
                Options.Moving = False
                Width = 31
              end
              object VDATENAZ: TcxGridDBColumn
                Caption = #1044#1072#1090#1072' '#1085#1072#1079'.'
                DataBinding.FieldName = 'FD_NAZ'
                VisibleForCustomization = False
                Width = 45
              end
              object VDATE: TcxGridDBColumn
                Caption = #1044#1072#1090#1072' '#1074#1099#1087'.'
                DataBinding.FieldName = 'FD_RUN'
                VisibleForCustomization = False
                Width = 47
              end
              object VNAMEISSL: TcxGridDBColumn
                Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'NAMEISSL'
                VisibleForCustomization = False
                Width = 139
              end
              object VSOSID: TcxGridDBColumn
                Caption = 'SOS_ID'
                DataBinding.FieldName = 'FK_NAZSOSID'
                Visible = False
                VisibleForCustomization = False
              end
              object VVRACH: TcxGridDBColumn
                Caption = #1053#1072#1079#1085#1072#1095#1080#1074#1096#1080#1081
                DataBinding.FieldName = 'VRACHFIO'
                Width = 85
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = TVISSL
            end
          end
          object memParam: TcxMemo
            Left = 0
            Top = 383
            Hint = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
            Align = alBottom
            ParentShowHint = False
            Properties.ReadOnly = True
            Properties.ScrollBars = ssVertical
            ShowHint = True
            Style.BorderStyle = ebsFlat
            TabOrder = 1
            Visible = False
            Height = 66
            Width = 361
          end
        end
        object vgParam: TcxVerticalGrid
          Left = 0
          Top = 482
          Width = 361
          Height = 59
          Align = alBottom
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
        Height = 541
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
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aSearch: TAction
      Hint = #1055#1086#1080#1089#1082' '#1087#1072#1094#1080#1077#1085#1090#1072
      ImageIndex = 18
      ShortCut = 16397
      OnExecute = aSearchExecute
    end
    object aNew: TAction
      Caption = #1053#1086#1074#1099#1081
      Hint = #1053#1086#1074#1099#1081' '#1087#1072#1094#1080#1077#1085#1090
      ImageIndex = 23
      OnExecute = aNewExecute
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
    object actNaz: TAction
      Caption = #1053#1072#1079#1085#1072#1095#1080#1090#1100
      Hint = #1053#1072#1079#1085#1072#1095#1080#1090#1100' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
      ImageIndex = 22
      OnExecute = actNazExecute
    end
    object actLoadNaz: TAction
      Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 24
      ShortCut = 16460
      OnExecute = actLoadNazExecute
    end
    object actEditNaz: TAction
      Caption = #1053#1072#1079#1085#1072#1095#1080#1090#1100
      Hint = #1053#1072#1079#1085#1072#1095#1080#1090#1100' '#1082#1072#1073#1080#1085#1077#1090', '#1076#1072#1090#1091', '#1074#1088#1077#1084#1103
      ImageIndex = 16
      OnExecute = actEditNazExecute
    end
    object actRefreshNaz: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 19
      ShortCut = 116
      OnExecute = actRefreshNazExecute
    end
    object actCloseNaz: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 3
      OnExecute = actCloseNazExecute
    end
    object aClearSearch: TAction
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1087#1086#1080#1089#1082#1072
      ShortCut = 119
      OnExecute = aClearSearchExecute
    end
    object aFill: TAction
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
      Hint = #1047#1072#1087#1086#1083#1085#1080#1090#1100
      ImageIndex = 1
      OnExecute = aFillExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1087#1072#1094#1080#1077#1085#1090#1086#1074
      ImageIndex = 10
      ShortCut = 16464
      OnExecute = aPrintExecute
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
    object aOtmena: TAction
      Hint = 
        #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077'.'#13#10#1042#1085#1080#1084#1072#1085#1080#1077'! '#1054#1090#1084#1077#1085#1103#1090#1100' '#1084#1086#1078#1085#1086' '#1090#1086#1083#1100#1082#1086' '#1080#1089#1089#1083#1077#1076#1086#1074 +
        #1072#1085#1080#1103' '#1089#1086' '#1089#1090#1072#1090#1091#1089#1086#1084' '#39#1053#1045' '#1042#1067#1055'.'#39' '#1080#1083#1080' '#39#1056#1045#1050#1054#1052#1045#1053#1044#1054#1042#1040#1053#1054#39
      OnExecute = aOtmenaExecute
    end
    object aProsmotr: TAction
      Hint = 
        #1055#1088#1086#1089#1084#1086#1090#1088' '#1087#1088#1086#1090#1086#1082#1086#1083#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103'.'#13#10#1042#1085#1080#1084#1072#1085#1080#1077'! '#1055#1088#1086#1089#1084#1072#1090#1088#1080#1074#1072#1090#1100' '#1084#1086#1078#1085#1086' ' +
        #1090#1086#1083#1100#1082#1086' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103' '#13#10'                  '#1089#1086' '#1089#1090#1072#1090#1091#1089#1086#1084' '#39#1042#1067#1055#1054#1051#1053#1045#1053#1054#39' ' +
        '('#1079#1077#1083#1077#1085#1099#1081' '#1094#1074#1077#1090').'#13#10
      ImageIndex = 13
      ShortCut = 118
      OnExecute = aProsmotrExecute
    end
    object aSysInfo: TAction
      Caption = #1057#1080#1089#1090#1077#1084#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ShortCut = 32890
      OnExecute = aSysInfoExecute
    end
    object aSnimok: TAction
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1085#1080#1084#1082#1080
      OnExecute = aSnimokExecute
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
      '       ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TPEOPLES.FK_ID) SEX,'
      '       TPEOPLES.FC_DOCSER, '
      '       TPEOPLES.FC_DOCNUM, '
      '       TPEOPLES.FD_DOCDATE, '
      '       ASU.GET_IB(TKARTA.FK_ID) AS NIB, '
      '       TKARTA.FK_ID AS PACID,'
      
        '       DECODE(TKARTA.FP_TEK_COC,3,'#39#1042#1067#1055#1048#1057#1040#1053#39',2,'#39#1042' '#1057#1058#1040#1062#1048#1054#1053#1040#1056#1045#39',-2,' +
        #39#1053#1040' '#1054#1060#1054#1056#1052#1051#1045#1053#1048#1048' '#1055#1054#39','#39#39') STEK_COC,'
      '       0 AS IS_AMBULANCE,'
      '       TUSLVID.FC_NAME'
      ''
      
        '  FROM ASU.TPEOPLES, ASU.TKARTA, ASU.TPERESEL, ASU.TDOCOBSL, ASU' +
        '.TUSLVID'
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
          ItemName = 'bbNew'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbInfo'
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
          ItemName = 'dxBarButton1'
        end
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
          Visible = True
          ItemName = 'bbSnimok'
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
    object bbNew: TdxBarButton
      Action = aNew
      Category = 0
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
    object bbNaz: TdxBarButton
      Action = actNaz
      Category = 0
      ButtonStyle = bsChecked
    end
    object bbLoad: TdxBarButton
      Action = actLoadNaz
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton1: TdxBarButton
      Action = actEditNaz
      Category = 0
    end
    object dxBarButton2: TdxBarButton
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
      Properties.OnChange = cxBarEditItem1PropertiesChange
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
    object bbSnimok: TdxBarButton
      Action = aSnimok
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
      ImageIndex = 5
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
      ImageIndex = 20
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
      'SELECT TNAZIS.FK_ID, '
      '       TNAZIS.FK_SMID, tnazis.fk_resultid,'
      '       ASU.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID) AS OWNER,'
      '       TNAZIS.FD_NAZ,'
      '       TNAZIS.FD_RUN AS RUN_DATE,'
      
        '       DECODE(TNAZIS.FK_NAZSOSID, ASU.GET_LABVIP, TO_CHAR(TNAZIS' +
        '.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39'), ASU.GET_VIPNAZ, TO_CHAR(TNAZIS.F' +
        'D_RUN, '#39'DD.MM.YYYY HH24:MI'#39'), NULL) AS FD_RUN,'
      '       TNAZIS.FK_PACID,'
      '       TNAZIS.FK_ROOMID,'
      '       TNAZIS.FK_NAZSOSID,'
      '       TNAZIS.FK_DOCID,'
      '       TNAZIS.FK_NAZTYPEID,'
      '       ASU.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS NAMEISSL,'
      '       ASU.PKG_NAZ.GET_NAZPARAM(TNAZIS.FK_ID) PARAM,'
      '       ASU.DO_VRACHFIO(FK_VRACHID) AS VRACHFIO'
      '      '
      '  FROM ASU.TNAZIS, ASU.TAMBULANCE '
      ' WHERE TNAZIS.FK_PACID = TAMBULANCE.FK_ID'
      '   AND TAMBULANCE.FK_PEPLID = :PFK_PACID'
      
        '   AND TNAZIS.FK_SMID IN (SELECT FK_SMID FROM ASU.TNAZVRACH WHER' +
        'E FK_SOTRID = :PSOTRID)'
      '   AND TNAZIS.FK_NAZSOSID <> ASU.GET_PASS_REGISTRATOR'
      '                  '
      'UNION ALL'
      ''
      'SELECT TNAZIS.FK_ID, '
      '       TNAZIS.FK_SMID, tnazis.fk_resultid,'
      '       ASU.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID) AS OWNER,'
      '       TNAZIS.FD_NAZ,'
      '       TNAZIS.FD_RUN AS RUN_DATE,'
      
        '       DECODE(TNAZIS.FK_NAZSOSID, ASU.GET_LABVIP, TO_CHAR(TNAZIS' +
        '.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39'), ASU.GET_VIPNAZ, TO_CHAR(TNAZIS.F' +
        'D_RUN, '#39'DD.MM.YYYY HH24:MI'#39'), NULL) AS FD_RUN,'
      '       TNAZIS.FK_PACID,'
      '       TNAZIS.FK_ROOMID,'
      '       TNAZIS.FK_NAZSOSID,'
      '       TNAZIS.FK_DOCID,'
      '       TNAZIS.FK_NAZTYPEID,'
      '       ASU.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS NAMEISSL,'
      '       ASU.PKG_NAZ.GET_NAZPARAM(TNAZIS.FK_ID) PARAM,'
      '       ASU.DO_VRACHFIO(FK_VRACHID) AS VRACHFIO '
      '        '
      '  FROM ASU.TNAZIS, ASU.TKARTA '
      ' WHERE TNAZIS.FK_PACID = TKARTA.FK_ID'
      '   AND TKARTA.FK_PEPLID = :PFK_PACID'
      
        '   AND TNAZIS.FK_SMID IN (SELECT FK_SMID FROM ASU.TNAZVRACH WHER' +
        'E FK_SOTRID = :PSOTRID)                  '
      '   AND TNAZIS.FK_NAZSOSID <> ASU.GET_PASS_REGISTRATOR'
      '                  '
      'ORDER BY FD_RUN DESC'
      ''
      ''
      ''
      '')
    Optimize = False
    Variables.Data = {
      03000000020000000A0000003A50464B5F504143494403000000000000000000
      0000080000003A50534F54524944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000F00000005000000464B5F494401000000000007000000464B5F534D
      49440100000000000600000046445F4E415A010000000000080000004E414D45
      4953534C0100000000000600000046445F52554E01000000000008000000464B
      5F5041434944010000000000050000004F574E45520100000000000900000046
      4B5F524F4F4D49440100000000000B000000464B5F4E415A534F534944010000
      0000000800000052554E5F4441544501000000000008000000464B5F444F4349
      4401000000000005000000504152414D0100000000000C000000464B5F4E415A
      5459504549440100000000000B000000464B5F524553554C5449440100000000
      0008000000565241434846494F010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsNazBeforeOpen
    AfterOpen = odsNazAfterOpen
    AfterScroll = odsNazAfterScroll
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
      Size = 255
    end
    object odsNazFK_RESULTID: TFloatField
      FieldName = 'FK_RESULTID'
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
    PreviewOptions.Zoom = 0.999999984306749100
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39819.566078178100000000
    ReportOptions.LastChange = 40040.588531204100000000
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
      Height = 999.999984306749400000
      Width = 999.999984306749400000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 4.999999921533747000
      RightMargin = 4.999999921533747000
      TopMargin = 4.999999921533747000
      BottomMargin = 4.999999921533747000
      object ReportTitle1: TfrxReportTitle
        Height = 113.385899663818800000
        Top = 18.897649943969790000
        Width = 1084.725086168023000000
        object Memo1: TfrxMemoView
          Left = 3.779529988793958000
          Width = 1077.166029626409000000
          Height = 37.795299887939580000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 1.999999968613499000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]'
            '[OTDELNAME]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779529988793958000
          Top = 41.574829876733540000
          Width = 215.433205925281800000
          Height = 18.897649943969790000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            #1056#160#1056#181#1056#183#1057#1107#1056#187#1057#1034#1057#8218#1056#176#1057#8218#1057#8249' '#1056#1111#1056#1109#1056#1105#1057#1027#1056#1108#1056#176' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#1109#1056#1030)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779529988793958000
          Top = 64.252009809497290000
          Width = 113.385899663818800000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1032#1057#1027#1056#187#1056#1109#1056#1030#1056#1105#1056#181' '#1056#1111#1056#1109#1056#1105#1057#1027#1056#1108#1056#176': ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 120.944956205432800000
          Top = 64.252009809497290000
          Width = 94.488249719848960000
          Height = 18.897649943969790000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            '[USLOVIE]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 3.779529988793958000
          Top = 94.488249719848960000
          Width = 49.133889854321460000
          Height = 18.897649943969790000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.999999968613499000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 52.913419843115420000
          Top = 94.488249719848960000
          Width = 325.039585908228100000
          Height = 18.897649943969790000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.999999968613499000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#152#1056#1115' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 377.952998879395800000
          Top = 94.488249719848960000
          Width = 109.606371393011700000
          Height = 18.897649943969790000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.999999968613499000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 487.559361682473000000
          Top = 94.488249719848960000
          Width = 170.078849495728100000
          Height = 18.897649943969790000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.999999968613499000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#1105#1056#1111' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 657.638245537939500000
          Top = 94.488249719848960000
          Width = 188.976499439697900000
          Height = 18.897649943969790000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.999999968613499000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1109#1057#1027#1057#8218#1056#1109#1057#1039#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 793.701297646731300000
          Top = 41.574829876733540000
          Width = 287.244286020288500000
          Height = 18.897649943969790000
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
          Left = 793.701297646731300000
          Top = 64.252009809497290000
          Width = 287.244286020288500000
          Height = 18.897649943969790000
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
        Height = 34.015769899145630000
        Top = 272.126155757191200000
        Width = 1084.725086168023000000
        object Memo21: TfrxMemoView
          Left = 3.779529988793958000
          Width = 1077.166029626409000000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 1.999999968613499000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 3.779529988793958000
          Top = 18.897649943969790000
          Width = 94.488249719848960000
          Height = 15.118119955175830000
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
        Height = 18.897649943969790000
        Top = 192.756036300439600000
        Width = 1084.725086168023000000
        DataSet = frxDBSearch
        DataSetName = 'frxDBSearch'
        RowCount = 0
        Stretched = True
        object Memo12: TfrxMemoView
          Left = 3.779529988793958000
          Width = 49.133889854321460000
          Height = 18.897649943969790000
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
          Left = 52.913419843115420000
          Width = 325.039585908228100000
          Height = 18.897649943969790000
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
          Left = 377.952998879395800000
          Width = 109.606371393011700000
          Height = 18.897649943969790000
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
          Left = 487.559361682473000000
          Width = 170.078849495728100000
          Height = 18.897649943969790000
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
          Left = 657.638245537939500000
          Width = 188.976499439697900000
          Height = 18.897649943969790000
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
    PreviewOptions.Zoom = 0.999999984306749100
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39745.713256529920000000
    ReportOptions.LastChange = 40040.588531204100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepProsmotrGetValue
    Left = 681
    Top = 232
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 999.999984306749400000
      Width = 999.999984306749400000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 4.999999921533747000
      RightMargin = 7.000000233744630000
      TopMargin = 4.999999921533747000
      BottomMargin = 4.999999921533747000
      object PageHeader1: TfrxPageHeader
        Height = 389.291575101882400000
        Top = 18.897649943969790000
        Width = 748.346924037308400000
        object Memo1: TfrxMemoView
          Left = 3.779529988793958000
          Width = 740.787850315825200000
          Height = 37.795299887939580000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 1.999999968613499000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]'
            '[OTDELNAME]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779529988793958000
          Top = 41.574829876733540000
          Width = 68.031539798291250000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218':')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779529988793958000
          Top = 64.252009809497290000
          Width = 68.031539798291250000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8217#1056#1109#1056#183#1057#1026#1056#176#1057#1027#1057#8218':')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 75.590599775879170000
          Top = 41.574829876733540000
          Width = 302.362399103516700000
          Height = 18.897649943969790000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            '[PACFIO]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 75.590599775879170000
          Top = 64.252009809497290000
          Width = 83.149659753467080000
          Height = 18.897649943969790000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            '[PACAGE]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 521.575124709670900000
          Top = 41.574829876733540000
          Width = 45.354359865527500000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176':')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 570.709035179835400000
          Top = 41.574829876733540000
          Width = 173.858386356469800000
          Height = 18.897649943969790000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            '[RUNDATE]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 3.779529988793958000
          Top = 102.047306261463000000
          Width = 740.787850315825200000
          Height = 18.897649943969790000
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
          Left = 3.779529988793958000
          Top = 128.504021336981500000
          Width = 740.787850315825200000
          Height = 18.897649943969790000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Frame.Width = 1.999999968613499000
          HAlign = haBlock
          Memo.UTF8 = (
            '[ISSLTEXT]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 3.779529988793958000
          Top = 211.653686244409300000
          Width = 253.228505813221400000
          Height = 18.897649943969790000
          ShowHint = False
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#176#1057#8225':'#31'__________________[SOTRNAME]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 570.709035179835400000
          Top = 64.252009809497290000
          Width = 173.858386356469800000
          Height = 18.897649943969790000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[PHONE]')
          ParentFont = False
        end
        object MemTel: TfrxMemoView
          Left = 521.575124709670900000
          Top = 64.252009809497290000
          Width = 45.354359865527500000
          Height = 18.897649943969790000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1057#8218#1056#181#1056#187'.')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 34.015769899145630000
        Top = 468.661711738503200000
        Width = 748.346924037308400000
        object Memo10: TfrxMemoView
          Left = 3.779529988793958000
          Width = 740.787850315825200000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 1.999999968613499000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 3.779529988793958000
          Top = 18.897649943969790000
          Width = 94.488249719848960000
          Height = 15.118119955175830000
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
    end
  end
  object dsKem: TDataSource
    DataSet = odsKem
    Left = 616
    Top = 419
  end
  object odsKem: TOracleDataSet
    SQL.Strings = (
      'SELECT 0 AS FK_ID, '#39' '#39' AS FC_NAME, 0 AS FK_OWNER, 0 AS FN_ORDER'
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
      'ORDER BY FN_ORDER '
      ''
      '/*'
      'SELECT FK_ID, FC_SHORT AS FC_NAME, FK_OWNER, 1000 as FN_ORDER'
      '  FROM ASU.TCOMPANY'
      
        'WHERE FK_ID <> (SELECT FK_ID FROM ASU.TCOMPANY WHERE FC_SYNONIM ' +
        '= '#39'ROOT_LPU'#39')'
      'START WITH FC_SYNONIM = '#39'ROOT_LPU'#39
      'CONNECT BY PRIOR FK_ID = FK_OWNER '
      'ORDER BY FC_NAME */ -- commented 04.08.2010')
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
    Enabled = False
    Interval = 500
    OnTimer = tmrCheckApplicationTimer
    Left = 576
    Top = 164
  end
  object jvFrmStor: TJvFormStorage
    AppStorage = frmMain.AppStorage
    AppStoragePath = 'frmSearch\'
    StoredValues = <>
    Left = 286
    Top = 350
  end
  object frxRepProsmotr_Travma: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 0.999999984306749100
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39745.713256529920000000
    ReportOptions.LastChange = 40732.463094929820000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepProsmotr_TravmaGetValue
    Left = 681
    Top = 280
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 999.999984306749400000
      Width = 999.999984306749400000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 29.999999529202480000
      RightMargin = 7.000000233744630000
      TopMargin = 4.999999921533747000
      BottomMargin = 4.999999921533747000
      object PageFooter1: TfrxPageFooter
        Height = 15.118119955175830000
        Top = 260.787562354835500000
        Width = 653.858674317459500000
        object Memo10: TfrxMemoView
          Left = 419.527835628077100000
          Width = 234.330855869251600000
          Height = 15.118119955175830000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 1.999999968613499000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Width = 419.527835628077100000
          Height = 15.118119955175830000
          ShowHint = False
          Color = 15000804
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
        Height = 181.417442898083800000
        Top = 18.897649943969790000
        Width = 653.858674317459500000
        AllowSplit = True
        StartNewPage = True
        Stretched = True
        object Memo7: TfrxMemoView
          Left = 544.252311514382300000
          Top = 34.015769899145630000
          Width = 94.488249719848960000
          Height = 18.897649943969790000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            '[RUNDATE]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 7.559059977587917000
          Top = 143.622143010144300000
          Width = 298.582862242775000000
          Height = 18.897649943969790000
          ShowHint = False
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#176#1057#8225':'#31'__________________[SOTRNAME]')
          ParentFont = False
        end
        object memTel: TfrxMemoView
          Left = 544.252311514382300000
          Top = 56.692949831909380000
          Width = 105.826843122204700000
          Height = 18.897649943969790000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PHONEKAB]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Align = baWidth
          Width = 653.858674317459500000
          Height = 15.118119955175830000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Align = baWidth
          Top = 16.118120626677350000
          Width = 653.858674317459500000
          Height = 15.118119955175830000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[OTDELNAME]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Top = 34.015769899145630000
          Width = 75.590599775879170000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218':')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 79.370129764673130000
          Top = 34.015769899145630000
          Width = 381.732535740137500000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            '[PACFIO]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 56.692949831909380000
          Width = 75.590599775879170000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            #1056#8217#1056#1109#1056#183#1057#1026#1056#176#1057#1027#1057#8218':')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 79.370129764673130000
          Top = 56.692949831909380000
          Width = 94.488249719848960000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            '[PACAGE]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 472.441248599244800000
          Top = 34.015769899145630000
          Width = 68.031539798291250000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176':')
          ParentFont = False
        end
        object memTelCaption: TfrxMemoView
          Left = 472.441248599244800000
          Top = 56.692949831909380000
          Width = 68.031539798291250000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            #1057#8218#1056#181#1056#187'.')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Align = baWidth
          Top = 94.488249719848960000
          Width = 653.858674317459500000
          Height = 18.897649943969790000
          ShowHint = False
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            '[ISSLNAME]')
          ParentFont = False
        end
        object Rich1: TfrxRichView
          Align = baWidth
          Top = 117.165427934625800000
          Width = 653.858674317459500000
          Height = 18.897649943969790000
          ShowHint = False
          StretchMode = smActualHeight
          GapX = 1.999999968613499000
          GapY = 0.999999984306749100
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235315C64656666305C6465
            666C616E67313034397B5C666F6E7474626C7B5C66305C666E696C5C66636861
            7273657430205461686F6D613B7D7B5C66315C666E696C205461686F6D613B7D
            7D0D0A7B5C2A5C67656E657261746F72204D7366746564697420352E34312E32
            312E323531303B7D5C766965776B696E64345C7563315C706172645C6C616E67
            313033335C66305C66733230205B4953534C544558545D5C6C616E6731303439
            5C66315C667331365C7061720D0A7D0D0A00}
        end
      end
    end
  end
  object frxRepProsmotr_SOKB: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 0.999999984306749100
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39745.713256529920000000
    ReportOptions.LastChange = 40983.460983708060000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepProsmotr_SOKBGetValue
    Left = 681
    Top = 328
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 999.999984306749400000
      Width = 999.999984306749400000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 19.999999686134990000
      RightMargin = 14.999999764601240000
      TopMargin = 14.999999764601240000
      BottomMargin = 14.999999764601240000
      object PageFooter1: TfrxPageFooter
        Height = 15.118119955175830000
        Top = 411.968770000000000000
        Width = 661.417752075958900000
        object Memo10: TfrxMemoView
          Left = 453.543598655275000000
          Width = 207.874149383667700000
          Height = 15.118119955175830000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 1.999999968613499000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Width = 453.543598655275000000
          Height = 15.118119955175830000
          ShowHint = False
          Color = 15000804
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
        Height = 332.598625269973000000
        Top = 18.897650000000000000
        Width = 661.417752075958900000
        AllowSplit = True
        StartNewPage = True
        Stretched = True
        object Memo7: TfrxMemoView
          Left = 540.472774653640700000
          Top = 98.267779708642920000
          Width = 120.944956205432800000
          Height = 18.897649943969790000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            '[RUNDATE]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 3.779529988793958000
          Top = 207.874149383667700000
          Width = 298.582862242775000000
          Height = 18.897649943969790000
          ShowHint = False
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#176#1057#8225':'#31'__________________[SOTRNAME]')
          ParentFont = False
        end
        object memTel: TfrxMemoView
          Left = 540.472774653640700000
          Top = 120.944956205432800000
          Width = 120.944956205432800000
          Height = 18.897649943969790000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PHONEKAB]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 3.779529988793958000
          Top = 98.267779708642920000
          Width = 75.590599775879170000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218':')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 83.149659753467080000
          Top = 98.267779708642920000
          Width = 400.630185684107300000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            '[PACFIO]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779529988793958000
          Top = 120.944956205432800000
          Width = 75.590599775879170000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            #1056#8217#1056#1109#1056#183#1057#1026#1056#176#1057#1027#1057#8218':')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 83.149659753467080000
          Top = 120.944956205432800000
          Width = 94.488249719848960000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            '[PACAGE]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 491.338898543214600000
          Top = 98.267779708642920000
          Width = 45.354359865527500000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176':')
          ParentFont = False
        end
        object memTelCaption: TfrxMemoView
          Left = 491.338898543214600000
          Top = 120.944956205432800000
          Width = 45.354359865527500000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            #1057#8218#1056#181#1056#187'.')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Align = baWidth
          Top = 147.401662691016700000
          Width = 661.417752075958900000
          Height = 18.897649943969790000
          ShowHint = False
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            '[ISSLNAME]')
          ParentFont = False
        end
        object Rich1: TfrxRichView
          Align = baWidth
          Top = 170.078849495728100000
          Width = 661.417752075958900000
          Height = 18.897649943969790000
          ShowHint = False
          StretchMode = smActualHeight
          GapX = 1.999999968613499000
          GapY = 0.999999984306749100
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235315C64656666305C6465
            666C616E67313034397B5C666F6E7474626C7B5C66305C666E696C5C66636861
            7273657430205461686F6D613B7D7B5C66315C666E696C205461686F6D613B7D
            7D0D0A7B5C2A5C67656E657261746F72204D7366746564697420352E34312E32
            312E323531303B7D5C766965776B696E64345C7563315C706172645C6C616E67
            313033335C66305C66733230205B4953534C544558545D5C6C616E6731303439
            5C66315C667331365C7061720D0A7D0D0A00}
        end
        object Memo6: TfrxMemoView
          Left = 113.385899663818800000
          Top = 18.338589512931740000
          Width = 548.031848375124000000
          Height = 34.015769899145630000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#8216#1056#1032' '#1056#1168#1056#1106#1056#1116#1056#1118#1056#171'-'#1056#1114#1056#1106#1056#1116#1056#1038#1056#152#1056#8482#1056#1038#1056#1113#1056#1115#1056#8220#1056#1115' '#1056#1106#1056#8217#1056#1118#1056#1115#1056#1116#1056#1115#1056#1114#1056#1116#1056#1115#1056#8220#1056#1115' '#1056#1115 +
              #1056#1113#1056#160#1056#1032#1056#8220#1056#1106'-'#1056#174#1056#8220#1056#160#1056#171
            
              '"'#1056#1038#1056#1032#1056#160#1056#8220#1056#1032#1056#1118#1056#1038#1056#1113#1056#1106#1056#1031' '#1056#1115#1056#1113#1056#160#1056#1032#1056#8211#1056#1116#1056#1106#1056#1031' '#1056#1113#1056#8250#1056#152#1056#1116#1056#152#1056#167#1056#8226#1056#1038#1056#1113#1056#1106#1056#1031' '#1056#8216 +
              #1056#1115#1056#8250#1056#172#1056#1116#1056#152#1056#166#1056#1106'"')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 113.385899663818800000
          Top = 51.133891197324490000
          Width = 548.031848375124000000
          Height = 18.897649943969790000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '628408, '#1056#160#1056#1109#1057#1027#1057#1027#1056#1105#1057#1039', '#1056#1118#1057#1035#1056#1112#1056#181#1056#1029#1057#1027#1056#1108#1056#176#1057#1039' '#1056#1109#1056#177#1056#187#1056#176#1057#1027#1057#8218#1057#1034', '#1056#1168#1056#1114#1056#1106#1056 +
              #1115'-'#1056#174#1056#1110#1057#1026#1057#8249', '#1056#1110'. '#1056#1038#1057#1107#1057#1026#1056#1110#1057#1107#1057#8218', '#1057#1107#1056#187'. '#1056#173#1056#1029#1056#181#1057#1026#1056#1110#1056#181#1057#8218#1056#1105#1056#1108#1056#1109#1056#1030', 14')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          Left = 7.559059977587917000
          Top = 3.779529988793958000
          Width = 98.267779708642920000
          Height = 94.488249719848960000
          ShowHint = False
          HightQuality = True
          Transparent = False
          TransparentColor = clWhite
        end
      end
    end
  end
  object rProt_TO: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 0.999999984306749100
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39745.713256529920000000
    ReportOptions.LastChange = 41179.653030000000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = rProt_TOGetValue
    Left = 681
    Top = 384
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 999.999984306749400000
      Width = 999.999984306749400000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 389.291575100000000000
        Top = 18.897650000000000000
        Width = 691.653990000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 691.653990000000000000
          Height = 15.118119890000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779529990000000000
          Top = 37.795299880000000000
          Width = 68.031539800000000000
          Height = 18.897649940000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218':')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779529990000000000
          Top = 60.472479810000000000
          Width = 68.031539800000000000
          Height = 18.897649940000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            #1056#8217#1056#1109#1056#183#1057#1026#1056#176#1057#1027#1057#8218':')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 75.590599780000000000
          Top = 37.795299880000000000
          Width = 302.362399100000000000
          Height = 18.897649940000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            '[PACFIO]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 75.590599780000000000
          Top = 60.472479810000000000
          Width = 83.149659750000000000
          Height = 18.897649940000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            '[PACAGE]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 468.661704710000000000
          Top = 37.795299880000000000
          Width = 45.354359870000000000
          Height = 18.897649940000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176':')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 517.795615180000000000
          Top = 37.795299880000000000
          Width = 173.858386360000000000
          Height = 18.897649940000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 1.999999968613499000
          Memo.UTF8 = (
            '[RUNDATE]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Align = baWidth
          Top = 94.488246260000000000
          Width = 691.653990000000000000
          Height = 18.897649940000000000
          ShowHint = False
          StretchMode = smActualHeight
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[ISSLNAME]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baWidth
          Top = 117.165431340000000000
          Width = 691.653990000000000000
          Height = 18.897649940000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 1.999999968613499000
          HAlign = haBlock
          Memo.UTF8 = (
            '[ISSLTEXT]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 3.779529990000000000
          Top = 211.653686240000000000
          Width = 253.228505810000000000
          Height = 18.897649940000000000
          ShowHint = False
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#176#1057#8225':'#31'__________________[SOTRNAME]')
          ParentFont = False
        end
        object memTel: TfrxMemoView
          Left = 517.795615180000000000
          Top = 60.472479810000000000
          Width = 173.858386360000000000
          Height = 18.897649940000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PHONE]')
          ParentFont = False
        end
        object MemTelCaption: TfrxMemoView
          Left = 468.661704710000000000
          Top = 60.472479810000000000
          Width = 45.354359870000000000
          Height = 18.897649940000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1057#8218#1056#181#1056#187'.')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Align = baWidth
          Top = 17.118120000000000000
          Width = 691.653990000000000000
          Height = 15.118119890000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 1.999999968613500000
          HAlign = haCenter
          Memo.UTF8 = (
            '[OTDELNAME]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 15.118120000000000000
        Top = 468.661720000000000000
        Width = 691.653990000000000000
        object Memo10: TfrxMemoView
          Left = 502.677489990000000000
          Top = 0.000000059999999996
          Width = 188.976470320000000000
          Height = 15.118119940000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 1.999999968613499000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Width = 502.677489720000000000
          Height = 15.118119960000000000
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
  object PopupMenu1: TPopupMenu
    Images = frmMain.ilMain
    Left = 816
    Top = 170
    object MenuItem7: TMenuItem
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
      ImageIndex = 20
      OnClick = MenuItem7Click
    end
  end
end
