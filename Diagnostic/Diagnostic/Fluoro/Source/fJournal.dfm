object frmJournal: TfrmJournal
  Left = 87
  Top = 51
  Caption = #1046#1091#1088#1085#1072#1083' '#1076#1086#1086#1073#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
  ClientHeight = 606
  ClientWidth = 1178
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object paDates: TPanel
    Left = 0
    Top = 0
    Width = 262
    Height = 606
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object gbPeriod: TcxGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = #1055#1077#1088#1080#1086#1076
      Constraints.MaxHeight = 279
      Constraints.MinHeight = 279
      ParentFont = False
      Style.BorderStyle = ebsOffice11
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'Arial'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      Height = 279
      Width = 259
      object paPeriod: TJvPanel
        Left = 12
        Top = 169
        Width = 227
        Height = 96
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
        FlatBorderColor = clNavy
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 3
        object cxLabel3: TcxLabel
          Left = 38
          Top = 35
          Caption = #1055#1086':'
          Transparent = True
        end
        object cxLabel4: TcxLabel
          Left = 47
          Top = 5
          Caption = 'C:'
          Transparent = True
        end
        object deBegin: TcxDateEdit
          Left = 65
          Top = 5
          ParentShowHint = False
          Properties.DateButtons = [btnToday]
          Properties.DateOnError = deToday
          Properties.ImmediatePost = True
          Properties.PostPopupValueOnTab = True
          Properties.ShowTime = False
          ShowHint = True
          Style.BorderStyle = ebsOffice11
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.SkinName = 'Office2007Green'
          Style.ButtonStyle = btsOffice11
          Style.ButtonTransparency = ebtNone
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 0
          Width = 90
        end
        object deEnd: TcxDateEdit
          Left = 65
          Top = 35
          ParentShowHint = False
          Properties.DateButtons = [btnToday]
          Properties.DateOnError = deToday
          Properties.ImmediatePost = True
          Properties.PostPopupValueOnTab = True
          Properties.ShowTime = False
          ShowHint = True
          Style.BorderStyle = ebsOffice11
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.SkinName = 'Office2007Green'
          Style.ButtonStyle = btsOffice11
          Style.ButtonTransparency = ebtNone
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 1
          Width = 90
        end
        object bPeriod: TcxButton
          Left = 157
          Top = 66
          Width = 64
          Height = 25
          Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
          Caption = #1055#1077#1088#1080#1086#1076
          TabOrder = 5
          OnClick = bPeriodClick
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object bToday: TcxButton
          Left = 157
          Top = 5
          Width = 64
          Height = 25
          Caption = #1057#1077#1075#1086#1076#1085#1103
          TabOrder = 3
          OnClick = bTodayClick
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object bYesterday: TcxButton
          Left = 157
          Top = 35
          Width = 64
          Height = 25
          Caption = #1042#1095#1077#1088#1072
          TabOrder = 4
          OnClick = bYesterdayClick
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object cbDates: TcxComboBox
          Left = 65
          Top = 65
          ParentShowHint = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownSizeable = True
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items.Strings = (
            ''
            '1 '#1076#1077#1085#1100
            '3 '#1076#1085#1103
            #1053#1077#1076#1077#1083#1103
            #1052#1077#1089#1103#1094
            #1043#1086#1076)
          Properties.PostPopupValueOnTab = True
          Properties.OnEditValueChanged = cbDatesPropertiesEditValueChanged
          ShowHint = True
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 2
          Width = 90
        end
        object cxLabel2: TcxLabel
          Left = 6
          Top = 66
          Caption = #1055#1077#1088#1080#1086#1076':'
          Transparent = True
        end
      end
      object paDate: TPanel
        Left = 12
        Top = 48
        Width = 227
        Height = 57
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object paDateButtons: TPanel
          Left = 5
          Top = 2
          Width = 217
          Height = 20
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
        end
        object seYear: TcxSpinEdit
          Left = 47
          Top = 15
          Hint = #1050#1072#1083#1077#1085#1076#1072#1088#1085#1099#1081' '#1075#1086#1076
          ParentShowHint = False
          Properties.CanEdit = False
          Properties.ImmediatePost = True
          ShowHint = True
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 1
          Width = 108
        end
        object cxLabel1: TcxLabel
          Left = 17
          Top = 16
          Caption = #1043#1086#1076':'
          Transparent = True
        end
      end
      object rb1: TcxRadioButton
        Left = 12
        Top = 27
        Width = 113
        Height = 17
        Caption = #1055#1086' '#1075#1086#1076#1091
        TabOrder = 0
        OnClick = rb1Click
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object rb2: TcxRadioButton
        Left = 12
        Top = 146
        Width = 113
        Height = 17
        Caption = #1055#1086' '#1087#1077#1088#1080#1086#1076#1091
        TabOrder = 1
        OnClick = rb2Click
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
    end
    object cxGroupBox1: TcxGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 290
      Margins.Top = 0
      Margins.Right = 0
      Align = alTop
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      ParentFont = False
      Style.BorderStyle = ebsOffice11
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Arial'
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
      TabOrder = 1
      Visible = False
      Height = 179
      Width = 259
      object teFIO: TcxTextEdit
        Left = 12
        Top = 83
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clMaroon
        Style.Font.Height = -12
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
        TabOrder = 0
        Width = 213
      end
      object cxLabel5: TcxLabel
        Left = 12
        Top = 58
        Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072':'
        Style.TextStyle = []
        Transparent = True
      end
      object cxLabel6: TcxLabel
        Left = 12
        Top = 111
        Caption = #8470' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103':'
        Style.TextStyle = []
        Transparent = True
      end
      object teNum: TcxTextEdit
        Left = 12
        Top = 139
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = 'Book Antiqua'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.TextColor = clNavy
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 2
        Width = 213
      end
      object bFIO: TcxButton
        Left = 225
        Top = 79
        Width = 30
        Height = 30
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
        TabOrder = 1
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000F00A0000F00A00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000A600000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000008800008F000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000139B24159A28009A00000000000000000000000000000000000000000000
          00000000000000000000000000000000000011942046CC7D189C2B00A0000000
          000000000000000000000000000000000D811B168F2A158E27158F28178E2817
          8E27209D374FEB8549CE7A1DA03400A400000000000000000000000000000000
          16902444E27E42DD7846E07B49E37E4BE6814BE6814DE78151EE864FD58023A5
          3C00AF00000000000000000000000000148E2251E18540DA7343DD7646E07949
          E27C4CE68050E98352EC8557F38C56DF892CAB4900AD02000000000000000000
          148F2261E7913BDB7043DF7745E27A48E57D4CE88051EB8555EF885AF38D67FF
          A035C25404B0050000000000000000001693268CF5B46AEA9873EE9F77F1A37B
          F3A57EF4A767F29659F58E67FFA037D45500B400000000000000000000000000
          1394232BAB432BAB402EAD442FB1452EAF4441BD587AFAA767FFA131CB4C00AE
          0000000000000000000000000000000000000000000000000000000000000000
          000022A52E74FFB129C23F00AA00000000000000000000000000000000000000
          00000000000000000000000000000000000021B63425BF3A00A3000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000A600009D00000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000C9000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
      end
      object bNum: TcxButton
        Left = 225
        Top = 135
        Width = 30
        Height = 30
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
        TabOrder = 3
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000F00A0000F00A00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000A600000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000008800008F000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000139B24159A28009A00000000000000000000000000000000000000000000
          00000000000000000000000000000000000011942046CC7D189C2B00A0000000
          000000000000000000000000000000000D811B168F2A158E27158F28178E2817
          8E27209D374FEB8549CE7A1DA03400A400000000000000000000000000000000
          16902444E27E42DD7846E07B49E37E4BE6814BE6814DE78151EE864FD58023A5
          3C00AF00000000000000000000000000148E2251E18540DA7343DD7646E07949
          E27C4CE68050E98352EC8557F38C56DF892CAB4900AD02000000000000000000
          148F2261E7913BDB7043DF7745E27A48E57D4CE88051EB8555EF885AF38D67FF
          A035C25404B0050000000000000000001693268CF5B46AEA9873EE9F77F1A37B
          F3A57EF4A767F29659F58E67FFA037D45500B400000000000000000000000000
          1394232BAB432BAB402EAD442FB1452EAF4441BD587AFAA767FFA131CB4C00AE
          0000000000000000000000000000000000000000000000000000000000000000
          000022A52E74FFB129C23F00AA00000000000000000000000000000000000000
          00000000000000000000000000000000000021B63425BF3A00A3000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000A600009D00000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000C9000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
      end
      object chb1: TcxCheckBox
        Left = 12
        Top = 29
        Caption = #1053#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100' '#1076#1072#1090#1099
        ParentFont = False
        ParentShowHint = False
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Properties.OnEditValueChanged = chb1PropertiesEditValueChanged
        ShowHint = True
        State = cbsGrayed
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Arial'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 6
        Transparent = True
        Width = 155
      end
    end
    object cxSplitter2: TcxSplitter
      Left = 0
      Top = 282
      Width = 262
      Height = 8
      HotZoneClassName = 'TcxXPTaskBarStyle'
      HotZone.SizePercent = 59
      AlignSplitter = salTop
      Control = gbPeriod
      OnBeforeOpen = cxSplitter2BeforeOpen
      OnBeforeClose = cxSplitter2BeforeClose
      Visible = False
    end
    object cxLabel7: TcxLabel
      Left = 22
      Top = 561
      Caption = #1053#1072#1078#1084#1080#1090#1077' CTRL+Z, '#1095#1090#1086#1073#1099' '#1089#1082#1088#1099#1090#1100' '#1087#1072#1085#1077#1083#1100
    end
    object cxLabel8: TcxLabel
      Left = 22
      Top = 584
      Caption = #1053#1072#1078#1084#1080#1090#1077' CTRL+X, '#1095#1090#1086#1073#1099' '#1087#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1085#1077#1083#1100
    end
    object cxLabel9: TcxLabel
      Left = 14
      Top = 480
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1083#1080#1095#1085#1086#1089#1090#1077#1081':'
    end
    object lbKolvo: TcxLabel
      Left = 140
      Top = 480
      Caption = '--'
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 262
    Top = 0
    Width = 8
    Height = 606
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 59
    Control = paDates
    OnBeforeOpen = cxSplitter1BeforeOpen
    OnBeforeClose = cxSplitter1BeforeClose
  end
  object Panel1: TPanel
    Left = 270
    Top = 0
    Width = 908
    Height = 606
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 6
    object dxBarDockControl1: TdxBarDockControl
      AlignWithMargins = True
      Left = 0
      Top = 3
      Width = 905
      Height = 28
      Margins.Left = 0
      Align = dalTop
      BarManager = dxBM
      SunkenBorder = True
      UseOwnSunkenBorder = True
    end
    object cxGrDoobsledovan: TcxGrid
      AlignWithMargins = True
      Left = 0
      Top = 34
      Width = 905
      Height = 569
      Margins.Left = 0
      Margins.Top = 0
      Align = alClient
      PopupMenu = pmTV
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      object TVDOOBSL: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsList
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = VDOOBSLFIO
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
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.Indicator = True
        object VDOOBSLNUM: TcxGridDBColumn
          Caption = #8470' '#1087'/'#1087
          DataBinding.FieldName = 'ROWNUM'
          Width = 43
        end
        object VDOOBSLCNTTUB: TcxGridDBColumn
          Caption = #1058#1091#1073'?'
          DataBinding.FieldName = 'CNTTUB'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = frmMain.ilCntTub
          Properties.Items = <
            item
              ImageIndex = 0
              Value = '0'
            end
            item
              ImageIndex = 1
              Value = '1'
            end
            item
              ImageIndex = 1
              Value = '10'
            end
            item
              ImageIndex = 1
              Value = '2'
            end
            item
              ImageIndex = 1
              Value = '3'
            end
            item
              ImageIndex = 1
              Value = '4'
            end
            item
              ImageIndex = 1
              Value = '5'
            end
            item
              ImageIndex = 1
              Value = '6'
            end
            item
              ImageIndex = 1
              Value = '7'
            end
            item
              ImageIndex = 1
              Value = '8'
            end
            item
              ImageIndex = 1
              Value = '9'
            end>
          MinWidth = 37
          Options.Editing = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 37
        end
        object VDOOBSLRG: TcxGridDBColumn
          Caption = '+'
          DataBinding.FieldName = 'CNTRG'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = frmMain.ilRgPlus
          Properties.Items = <
            item
              ImageIndex = 0
              Value = '0'
            end
            item
              ImageIndex = 1
              Value = '1'
            end>
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 27
          Options.Editing = False
          Options.HorzSizing = False
          Options.Moving = False
          Width = 27
        end
        object VDOOBSLFIO: TcxGridDBColumn
          Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
          DataBinding.FieldName = 'PACFIO'
          Width = 119
        end
        object VDOOBSLDATEROJD: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
          DataBinding.FieldName = 'DATEROJD'
          Width = 63
        end
        object VDOOBSLADDRESS: TcxGridDBColumn
          Caption = #1040#1076#1088#1077#1089
          DataBinding.FieldName = 'ADDRESS'
          Width = 90
        end
        object VDOOBSLWORKPLACE: TcxGridDBColumn
          Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
          DataBinding.FieldName = 'WORKPLACE'
          Width = 86
        end
        object VDOOBSLDATENUM: TcxGridDBColumn
          Caption = #1044#1072#1090#1072
          DataBinding.FieldName = 'DATENUM'
          Width = 74
        end
        object VDOOBSLKUDA: TcxGridDBColumn
          Caption = #1050#1091#1076#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085
          DataBinding.FieldName = 'KUDA'
          Width = 38
        end
        object VDOOBSLPREDVZAKL: TcxGridDBColumn
          Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1086#1077' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1077
          DataBinding.FieldName = 'PR_ZAKL'
          Width = 27
        end
        object VDOOBSLFIOSOTRZAKL: TcxGridDBColumn
          Caption = #1060#1048#1054' '#1074#1088#1072#1095#1072
          DataBinding.FieldName = 'SOTR_PR_ZAKL'
          Width = 35
        end
        object VDOOBSLUCHASTOK: TcxGridDBColumn
          Caption = #1059#1095#1072#1089#1090#1086#1082
          DataBinding.FieldName = 'UCHASTOK'
          Width = 40
        end
        object VDOOBSLOKONZAKL: TcxGridDBColumn
          Caption = #1054#1082#1086#1085#1095#1072#1090'. '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1077
          DataBinding.FieldName = 'OKON_ZAKL'
          Width = 44
        end
        object VDOOBSLNUMISSL: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088' '#1080#1089#1089#1083'.'
          DataBinding.FieldName = 'NUMISSL'
          Width = 64
        end
        object VDOOBSLDOP: TcxGridDBColumn
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
          DataBinding.FieldName = 'DOP'
          Width = 52
        end
      end
      object cxGrDoobsledovanLevel1: TcxGridLevel
        GridView = TVDOOBSL
      end
    end
  end
  object dxBM: TdxBarManager
    AllowReset = False
    AutoDockColor = False
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
    DockColor = clBtnFace
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 424
    Top = 168
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBMBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Journal_custom'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 222
      FloatTop = 133
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbInfo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbFlu'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbTub'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbOkonZakl'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbBase'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrintNaprav'
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
      Action = actClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrint: TdxBarButton
      Action = actPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbOkonZakl: TdxBarButton
      Action = actOkonZakl
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000000002930400
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000007920E02930400000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000E961A32B557029404C89C927C16007B15007913
        00781100761000750E00730D00700A006F08006D07006C05006A040068010000
        00000000000481090D8E1A0C8F170D91180D9117129B204DE5852FB14F14920F
        E2BB9CD58C48D38131D2781CD47614D7770EDA7709DD7803E07A00E47E00E781
        00DA75036C06000000000000001C932C41DA7941D77644D87947DB7C48D97A4E
        E98250E48632B250199914E8C099D68738D57D21D77B17DA7B11DD7C0CE17D06
        E47F02E88301EC8803E17D06710B0000000000000020932F48E17F42DC7645DF
        794AE47D4CE7804FE98254EF8858E98C37B7571A9A14E4B488D27D28D37719D6
        7814D9790FDC7B0BE07D08E48107E88509DD7B097610000000000000001F932C
        56E5883EDD7343E17847E57C4DE98053EC8657F08B62FE9B3CC75A279E1EE2B3
        8AD08034D07720D27618D57713D87910DC7C0EE07F0DE4840EDA7A0E7A140000
        0000000000249B368CF8B67FF1A885F5AF8AF7B28DF6B363F49462FC9943DD66
        26A020E6C3A8D28F57D08543CF7C30CF7620D17519D57716D87A14DC7E14E082
        14D779127E1800000000000000058E0A0C9B150B9B140B9E160A9D141EA52A6D
        FFA643DE68209514E6C8B4D6A17BD39666D08C53CF8442CF7D33CF7926D2781E
        D57A1BD87D1ADC811CD5791A831D000000000000000000000000000000000000
        0000000016A41F49E672029704C4896CD2A183D5A281D1986FCE8E5ECD8750CC
        8143CD7D38CE7C31D07C2CD37E2AD7832CCF7A29882100000000000000000000
        000000000000000000000000099D100297040000009831009832009933009933
        00993300993100973100963000942E00932D00912B009029008D28008B260000
        0000000000000000000000000000000000000000029805000000000000000000
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
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
    object bbBase: TdxBarButton
      Action = aBase
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
    object bbRefresh: TdxBarButton
      Action = aRefresh
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
    object bbFlu: TdxBarButton
      Action = aFluoro
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
      Action = aTub
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
    object bbPrintNaprav: TdxBarButton
      Action = actPrintNaprav
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 424
    Top = 120
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 0
      ShortCut = 27
      OnExecute = actCloseExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1078#1091#1088#1085#1072#1083#1072' '#1076#1086#1086#1073#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      ImageIndex = 1
      ShortCut = 16464
      OnExecute = actPrintExecute
    end
    object actCopyFIO: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1060#1048#1054
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1060#1048#1054
      ImageIndex = 12
      OnExecute = actCopyFIOExecute
    end
    object actText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      Hint = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      ImageIndex = 14
      OnExecute = actTextExecute
    end
    object actWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 15
      OnExecute = actWebExecute
    end
    object actXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 16
      OnExecute = actXMLExecute
    end
    object actXLS: TAction
      Caption = 'XLS-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = 'XLS-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 17
      OnExecute = actXLSExecute
    end
    object actOkonZakl: TAction
      Caption = #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077
      Hint = #1042#1085#1077#1089#1090#1080' '#1086#1082#1086#1085#1095#1072#1090#1077#1083#1100#1085#1086#1077' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1077
      ImageIndex = 25
      ShortCut = 16463
      OnExecute = actOkonZaklExecute
    end
    object aBase: TAction
      Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
      Hint = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093' '#1087#1086' '#1087#1072#1094#1080#1077#1085#1090#1091
      ShortCut = 16450
      OnExecute = aBaseExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1078#1091#1088#1085#1072#1083' '#1076#1086#1086#1073#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      ImageIndex = 29
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aCloseSpl: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1089#1087#1083#1080#1090#1090#1077#1088
      ShortCut = 16474
      OnExecute = aCloseSplExecute
    end
    object aOpenSpl: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1083#1080#1090#1090#1077#1088
      ShortCut = 16472
      OnExecute = aOpenSplExecute
    end
    object aInfo: TAction
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1072#1094#1080#1077#1085#1090#1077
      ShortCut = 16457
      OnExecute = aInfoExecute
    end
    object aFluoro: TAction
      Caption = #1060#1083#1102#1086#1088#1086#1090#1077#1082#1072
      Hint = #1055#1077#1088#1077#1095#1077#1085#1100' '#1092#1083#1102#1086#1088#1086#1075#1088#1072#1092#1080#1081
      ShortCut = 16454
      OnExecute = aFluoroExecute
    end
    object aTub: TAction
      Caption = #1059#1095#1077#1090' '#1090#1091#1073'.'
      Hint = #1059#1095#1077#1090' '#1074' '#1090#1091#1073#1076#1080#1089#1087#1072#1085#1089#1077#1088#1077
      ShortCut = 16468
      OnExecute = aTubExecute
    end
    object actPrintNaprav: TAction
      Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1080' '#1087#1077#1095#1072#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103' ('#1086#1073#1084#1077#1085#1085#1086#1081' '#1082#1072#1088#1090#1099')'
      ImageIndex = 23
      OnExecute = actPrintNapravExecute
    end
    object aSetDop: TAction
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      Hint = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1082#1086#1083#1086#1085#1082#1091' "'#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086'"'
      OnExecute = aSetDopExecute
    end
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100', '#1082#1072#1090#1077#1075#1086#1088#1080#1102
      ImageIndex = 5
      OnExecute = aEditExecute
    end
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select rownum, t.* from ('
      'select distinct t1.fk_pacid, '
      '       t1.fk_id,'
      '       asu.get_peplid(t1.fk_pacid) as peplid,  '
      '       t1.fd_run as datenum,'
      '--       to_char(t1.fd_run, '#39'dd.mm.yyyy hh24:mi'#39') as datenum,'
      
        '       asu.pkg_regist_pacfunc.get_pac_fio(t1.fk_pacid) as pacfio' +
        ','
      
        '       asu.pkg_regist_pacfunc.get_pac_bith(t1.fk_pacid) as dater' +
        'ojd,'
      
        '       asu.pkg_regist_pacfunc.get_pac_adrfull(t1.fk_pacid) as ad' +
        'dress,'
      
        '       (select asu.get_paccompany(fk_companyid)||'#39' '#39'||asu.get_pa' +
        'ccompany_otdel(fk_otdel)||'#39' '#39'||fc_rabota from asu.tpeoples where' +
        ' fk_id = asu.get_peplid(t1.fk_pacid)) as workplace,'
      '       asu.get_kuda_napravlen(t1.fk_id) as kuda,'
      
        '       asu.get_area_for_xray(asu.get_peplid(t1.fk_pacid)) as uch' +
        'astok,'
      '       (select fc_char '
      #9'   from asu.tib '
      
        #9'  where fk_pacid = t1.fk_id and fk_smid = (select fk_id from as' +
        'u.tsmid where fc_synonim = '#39'FLUORO_OKON_ZAKL'#39')) as okon_zakl,'
      '       (select fc_char'
      #9'   from asu.tib '
      
        #9'  where fk_pacid = t1.fk_id and fk_smid = (select fk_id from as' +
        'u.tsmid where fc_synonim = '#39'XRAY_FLU_NUMBER'#39')) as numissl,'
      '       tib.fc_char as pr_zakl,'
      '       asu.do_vrachfio(tib.fk_vrachid) as sotr_pr_zakl,'
      '       asu.get_name_rgissl(t1.fk_smid) as nameissl,'
      
        '       (select fc_char from asu.tib where fk_pacid = t1.fk_id an' +
        'd fk_smid = (select fk_id from asu.tsmid where fc_synonim = '#39'JOU' +
        'RNAL_DOOBSL_DOP'#39')) as dop,'
      '       (select count(*) from asu.tnazis  '
      '         where fk_pacid = asu.get_peplid(t1.fk_pacid) '
      '           and fk_smid = asu.get_xray_tubdispancer'
      '           and sysdate >= fd_naz  '
      
        '           and (sysdate < to_date(fd_run)+1 or fd_run is null)) ' +
        'as cnttub,'
      '       (select count(*) from asu.tib '
      '         where fk_pacid = asu.get_peplid(t1.fk_pacid) '
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'XRAY_RG_PLUS'#39')) as cntRg'
      '          '
      '  from asu.tnazis t1, asu.tib'
      '  where t1.fk_id = tib.fk_pacid'
      '    and tib.fk_bid in (select fk_id from asu.tshablon_xray_zakl'
      
        '                       start with fk_id in (select to_number(fc_' +
        'value) from asu.tsmini where fc_section = '#39'XRAY'#39' and fc_key = '#39'D' +
        'OOBSLEDOVAN'#39')'
      '                       connect by prior fk_id = fk_owner)     '
      '    and trunc(t1.fd_run) >= &pdate1'
      '    and trunc(t1.fd_run) <= &pdate2'
      '    and t1.fk_nazsosid = asu.get_vipnaz'
      '    and t1.fk_smid in (select fk_id '
      '                         from asu.tsmid '
      '                        where fl_showanal = 1 '
      '                       start with fk_id = asu.get_xray_flu'
      '                       connect by prior fk_id = fk_owner)'
      ''
      'union all'
      ''
      'select distinct t1.fk_pacid, '
      '       t1.fk_id,'
      '       asu.get_peplid(t1.fk_pacid) as peplid,  '
      '       t1.fd_run as datenum,'
      '       --to_char(t1.fd_run, '#39'dd.mm.yyyy hh24:mi'#39') as datenum,'
      
        '       asu.pkg_regist_pacfunc.get_pac_fio(t1.fk_pacid) as pacfio' +
        ','
      
        '       asu.pkg_regist_pacfunc.get_pac_bith(t1.fk_pacid) as dater' +
        'ojd,'
      
        '       asu.pkg_regist_pacfunc.get_pac_adrfull(t1.fk_pacid) as ad' +
        'dress,'
      
        '       (select asu.get_paccompany(fk_companyid)||'#39' '#39'||asu.get_pa' +
        'ccompany_otdel(fk_otdel)||'#39' '#39'||fc_rabota from asu.tpeoples where' +
        ' fk_id = asu.get_peplid(t1.fk_pacid)) as workplace,'
      '       asu.get_kuda_napravlen(t1.fk_id) as kuda,'
      
        '       asu.get_area_for_xray(asu.get_peplid(t1.fk_pacid)) as uch' +
        'astok,'
      '       (select fc_char '
      #9'   from asu.tib '
      
        #9'  where fk_pacid = t1.fk_id and fk_smid = (select fk_id from as' +
        'u.tsmid where fc_synonim = '#39'FLUORO_OKON_ZAKL'#39')) as okon_zakl,'
      '       (select fc_char'
      #9'   from asu.tib '
      
        #9'  where fk_pacid = t1.fk_id and fk_smid = (select fk_id from as' +
        'u.tsmid where fc_synonim = '#39'NUMBER_ISSL'#39')) as numissl,'
      '       (select fc_char '
      #9'   from asu.tib '
      
        #9'  where fk_pacid = t1.fk_id and fk_smid = (select fk_id from as' +
        'u.tsmid where fc_synonim = '#39'RESUME_OTMETKI'#39')) as pr_zakl,'
      '       asu.do_vrachfio(tib.fk_vrachid) as sotr_pr_zakl,'
      '       asu.get_name_rgissl(t1.fk_smid) as nameissl,'
      
        '       (select fc_char from asu.tib where fk_pacid = t1.fk_id an' +
        'd fk_smid = (select fk_id from asu.tsmid where fc_synonim = '#39'JOU' +
        'RNAL_DOOBSL_DOP'#39')) as dop,'
      '       (select count(*) from asu.tnazis  '
      '         where fk_pacid = asu.get_peplid(t1.fk_pacid) '
      '           and fk_smid = asu.get_xray_tubdispancer'
      '           and sysdate >= fd_naz  '
      
        '           and (sysdate < to_date(fd_run)+1 or fd_run is null)) ' +
        'as cnttub,'
      '       (select count(*) from asu.tib '
      '         where fk_pacid = asu.get_peplid(t1.fk_pacid) '
      
        '           and fk_smid = (select fk_id from asu.tsmid where fc_s' +
        'ynonim = '#39'XRAY_RG_PLUS'#39')) as cntRg'
      '         '
      '  from asu.tnazis t1, asu.tib'
      '  where t1.fk_id = tib.fk_pacid'
      
        '    and tib.fk_smid in (select fk_id from asu.tsmid where fc_syn' +
        'onim in ('#39'XRAY_NAPRAVLEN_ONKOLOG'#39', '#39'XRAY_NAPRAVLEN_TUBDISPANCER'#39 +
        '))      '
      '    and trunc(t1.fd_run) >= &pdate1'
      '    and trunc(t1.fd_run) <= &pdate2'
      '    and t1.fk_nazsosid = asu.get_vipnaz'
      
        '    and t1.fk_smid not in (select fk_id from asu.tsmid where fl_' +
        'showanal = 1 start with fc_synonim = '#39'ISSLED_FLUROGR'#39' connect by' +
        ' prior fk_id = fk_owner)) t'
      ''
      ''
      '')
    Optimize = False
    Variables.Data = {
      0300000002000000070000003A5044415445310C000000000000000000000007
      0000003A5044415445320C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001000000008000000464B5F5041434944010000000000060000005041
      4346494F0100000000000800000044415445524F4A4401000000000007000000
      4144445245535301000000000009000000574F524B504C414345010000000000
      07000000444941474E4F5A01000000000007000000444154454E554D01000000
      0000040000004B5544410100000000000D0000004F544D45544B495F5A414B4C
      32010000000000080000005543484153544F4B0100000000000A000000534F54
      525F5A414B4C3201000000000005000000464B5F494401000000000009000000
      4F4B4F4E5F5A414B4C01000000000006000000524F574E554D01000000000006
      0000005045504C4944010000000000070000004E554D4953534C010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsListBeforeOpen
    AfterOpen = odsListAfterOpen
    Left = 568
    Top = 168
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 568
    Top = 120
  end
  object pmTV: TPopupMenu
    Images = frmMain.ilMain
    Left = 348
    Top = 118
    object N1: TMenuItem
      Action = actPrint
    end
    object MenuItem3: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 13
      object MenuItem4: TMenuItem
        Action = actText
      end
      object MenuItem5: TMenuItem
        Action = actWeb
      end
      object MenuItem6: TMenuItem
        Action = actXML
      end
      object MenuItem7: TMenuItem
        Action = actXLS
      end
    end
    object N3: TMenuItem
      Action = actCopyFIO
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
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Action = aSetDop
      ImageIndex = 25
    end
    object N6: TMenuItem
      Action = aEdit
    end
  end
  object dlgSavePopUp: TSaveDialog
    Left = 353
    Top = 179
  end
  object frxRepList: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39588.450587916700000000
    ReportOptions.LastChange = 40226.650538043970000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepListGetValue
    Left = 400
    Top = 288
    Datasets = <
      item
        DataSet = frxdsList
        DataSetName = 'frxdsList'
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
      RightMargin = 7.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 113.385900000000000000
        Top = 18.897650000000000000
        Width = 1077.166050000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 41.574830000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8211#1057#1107#1057#1026#1056#1029#1056#176#1056#187' '#1056#1169#1056#1109#1056#1109#1056#177#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 64.252010000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027': [DATE1] '#1056#1111#1056#1109': [DATE2] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 86.929190000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#1109#1056#1030':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 978.898270000000000000
          Top = 86.929190000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SYSDATE]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 925.984850000000000000
          Top = 64.252010000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1056#1109#1057#8218#1057#1026#1057#1107#1056#1169#1056#1029#1056#1105#1056#1108': [SOTR]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 3.779530000000000000
          Width = 1069.606990000000000000
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
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 157.519790000000000000
          Top = 87.929190000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[KOLVOPAC]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 34.015770000000000000
        Top = 321.260050000000000000
        Width = 1077.166050000000000000
        object Memo18: TfrxMemoView
          Left = 3.779530000000000000
          Width = 1069.606990000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
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
        object Memo23: TfrxMemoView
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
      object Header1: TfrxHeader
        Height = 22.677180000000000000
        Top = 192.756030000000000000
        Width = 1077.166050000000000000
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
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
        object Memo7: TfrxMemoView
          Left = 56.692950000000000000
          Top = 3.779530000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#152#1056#1115)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 200.315090000000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 275.905690000000000000
          Top = 3.779530000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1106#1056#1169#1057#1026#1056#181#1057#1027)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 502.677490000000000000
          Top = 3.779530000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#181#1057#1027#1057#8218#1056#1109' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 733.228820000000000000
          Top = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176', '#1074#8222#8211' '#1056#1169#1056#1109#1056#1108'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 846.614720000000000000
          Top = 3.779530000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1057#1107#1056#1169#1056#176' '#1056#1029#1056#176#1056#1111#1057#1026#1056#176#1056#1030#1056#187#1056#181#1056#1029)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 948.662030000000000000
          Top = 3.779530000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1056#1108#1056#1109#1056#1029#1057#8225'. '#1056#183#1056#176#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 238.110390000000000000
        Width = 1077.166050000000000000
        DataSet = frxdsList
        DataSetName = 'frxdsList'
        RowCount = 0
        Stretched = True
        object Memo12: TfrxMemoView
          Left = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Left = 56.692950000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxdsList."PACFIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 200.315090000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsList."DATEROJD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 275.905690000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxdsList."ADDRESS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 502.677490000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxdsList."WORKPLACE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 733.228820000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxdsList."DATENUM"], '#1074#8222#8211' [frxdsList."NUMISSL"] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 846.614720000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsList."KUDA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 948.662030000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsList."OKON_ZAKL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxdsList: TfrxDBDataset
    UserName = 'frxdsList'
    CloseDataSource = False
    DataSet = odsList
    Left = 400
    Top = 336
  end
  object frxRepNapr: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39595.645055150460000000
    ReportOptions.LastChange = 40234.389567222220000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepNaprGetValue
    Left = 656
    Top = 200
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 210.000000000000000000
      PaperHeight = 148.000000000000000000
      PaperSize = 11
      object ReportTitle1: TfrxReportTitle
        Height = 519.134200000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        object Memo1: TfrxMemoView
          Left = 113.385900000000000000
          Top = 35.354360000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1115#1056#177#1056#1112#1056#181#1056#1029#1056#1029#1056#176#1057#1039' '#1056#1108#1056#176#1057#1026#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 113.385900000000000000
          Top = 61.811070000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1111#1057#1026#1056#176#1056#1030#1056#187#1057#1039#1056#181#1057#8218#1057#1027#1057#1039' '#1056#1110#1057#1026'. [PACFIO]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 521.575140000000000000
          Top = 80.708720000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1169#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169'.: [DATEROJD]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 113.385900000000000000
          Top = 103.385900000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8221#1056#187#1057#1039' '#1056#1108#1056#187#1056#1105#1056#1029#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1056#1109#1056#177#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039' '#1056#1105' '#1056#187#1056#181 +
              #1057#8225#1056#181#1056#1029#1056#1105#1057#1039'.')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 113.385900000000000000
          Top = 137.401670000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1114#1056#181#1057#1027#1057#8218#1056#1109' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1057#8249' : [WORKPLACE]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 113.385900000000000000
          Top = 175.196970000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#1112#1056#176#1057#8364#1056#1029#1056#1105#1056#8470' '#1056#176#1056#1169#1057#1026#1056#181#1057#1027' : [ADDRESS]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 113.385900000000000000
          Top = 231.889920000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#8221#1056#176#1056#1029#1056#1029#1057#8249#1056#181' '#1057#1026#1056#181#1056#1029#1057#8218#1056#1110#1056#181#1056#1029#1056#1109#1056#1030#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1056#1108#1056#1109#1056#1029#1057#8218#1057#1026#1056#1109#1056#187#1057#1039)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 113.385900000000000000
          Top = 250.787570000000000000
          Width = 566.929500000000000000
          Height = 230.551330000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[ZAKL]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 113.385900000000000000
          Top = 8.897650000000000000
          Width = 566.929500000000000000
          Height = 15.118120000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[NAMEORG]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 113.385900000000000000
          Top = 492.677490000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DATESYS]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 585.827150000000000000
          Top = 492.677490000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SOTR]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 597.165740000000000000
        Width = 793.701300000000000000
      end
      object Memo24: TfrxMemoView
        Left = 30.236240000000000000
        Top = 540.472790000000000000
        Width = 94.488250000000000000
        Height = 11.338590000000000000
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
    object Page2: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 210.000000000000000000
      PaperHeight = 148.000000000000000000
      PaperSize = 11
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle2: TfrxReportTitle
        Height = 430.866420000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo14: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559059999999999000
          Width = 702.992580000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1030#1056#181#1057#8218' '#1056#187#1056#181#1057#8225#1056#181#1056#177#1056#1029#1056#1109#1056#1110#1056#1109' '#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 113.385900000000000000
          Top = 60.472479999999990000
          Width = 585.827150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8221#1056#176#1057#8218#1056#176' '#1057#1039#1056#1030#1056#1108#1056#1105' '#1056#1030' '#1056#187#1056#181#1057#8225'. '#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1056#181':______________' +
              '________________________________________')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 113.385900000000000000
          Top = 90.708720000000000000
          Width = 585.827150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8221#1056#176#1057#8218#1056#176' '#1056#1030#1056#183#1057#1039#1057#8218#1056#1105#1057#1039' '#1056#1029#1056#176' '#1057#1107#1057#8225#1056#181#1057#8218' ('#1057#8218#1057#1107#1056#177#1056#1169#1056#1105#1057#1027#1056#1111#1056#176#1056#1029#1057#1027#1056#181#1057#1026#1056#1109#1056 +
              #1112'):______________________________________________')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 113.385900000000000000
          Top = 120.944960000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#187#1056#1105#1056#1029#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1105#1056#8470' '#1056#1169#1056#1105#1056#176#1056#1110#1056#1029#1056#1109#1056#183':')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 113.385900000000000000
          Top = 245.669450000000000000
          Width = 585.827150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8220#1057#1026#1057#1107#1056#1111#1056#1111#1056#176' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176':________________________________________' +
              '___________________________')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 377.953000000000000000
          Top = 377.953000000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034':___________________________________')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 113.385900000000000000
          Top = 272.126160000000000000
          Width = 585.827150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#160#1056#181#1056#1108#1056#1109#1056#1112#1056#181#1056#1029#1056#1169#1056#176#1057#8224#1056#1105#1056#1105' ('#1056#1108#1057#1026#1056#176#1057#8218#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034' '#1056#164#1056#8220' '#1056#1109#1056#177#1057#1027#1056#187#1056#181#1056#1169#1056#1109 +
              #1056#1030#1056#176#1056#1029#1056#1105#1056#8470'): ________________________________________')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 113.385900000000000000
          Top = 294.803340000000000000
          Width = 585.827150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1057#8249' '#1057#1027':____________ '#1056#1111#1056#1109': ____________')
          ParentFont = False
        end
      end
      object Memo25: TfrxMemoView
        Left = 3.779530000000000000
        Top = 544.252320000000000000
        Width = 94.488250000000000000
        Height = 11.338590000000000000
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
      object Memo26: TfrxMemoView
        Top = 472.441250000000000000
        Width = 94.488250000000000000
        Height = 11.338590000000000000
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
  object odsCount: TOracleDataSet
    SQL.Strings = (
      'select count(distinct t.fk_pacid) as cnt from ('
      'select distinct tnazis.fk_pacid         '
      '  from asu.tnazis, asu.tib'
      '  where tnazis.fk_id = tib.fk_pacid'
      '    and tib.fk_bid in (select fk_id from asu.tshablon_xray_zakl'
      
        '                       start with fk_id in (select to_number(fc_' +
        'value) from asu.tsmini where fc_section = '#39'XRAY'#39' and fc_key = '#39'D' +
        'OOBSLEDOVAN'#39')'
      '                       connect by prior fk_id = fk_owner)     '
      '    and trunc(fd_run) >= :pdate1'
      '    and trunc(fd_run) <= :pdate2'
      '    and tnazis.fk_nazsosid = asu.get_vipnaz'
      ''
      'union all'
      ''
      'select distinct tnazis.fk_pacid '
      '  from asu.tnazis, asu.tib'
      '  where tnazis.fk_id = tib.fk_pacid'
      
        '    and tib.fk_smid in (select fk_id from asu.tsmid where fc_syn' +
        'onim in ('#39'XRAY_NAPRAVLEN_ONKOLOG'#39', '#39'XRAY_NAPRAVLEN_TUBDISPANCER'#39 +
        '))      '
      '    and trunc(fd_run) >= :pdate1'
      '    and trunc(fd_run) <= :pdate2'
      '    and tnazis.fk_nazsosid = asu.get_vipnaz'
      
        '    and tnazis.fk_smid not in (select fk_id from asu.tsmid where' +
        ' fl_showanal = 1 start with fc_synonim = '#39'ISSLED_FLUROGR'#39' '
      
        #9#9'                                                              ' +
        '               connect by prior fk_id = fk_owner)) t')
    Optimize = False
    Variables.Data = {
      0300000002000000070000003A5044415445310C000000000000000000000007
      0000003A5044415445320C0000000000000000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 670
    Top = 392
  end
  object ilCntTub: TImageList
    Left = 608
    Top = 264
    Bitmap = {
      494C010102000400100010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  object ilRgPlus: TImageList
    Left = 656
    Top = 264
    Bitmap = {
      494C010102000400100010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
end
