object frmMain: TfrmMain
  Left = 190
  Top = 28
  Caption = #1057#1087#1080#1089#1086#1082' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1081' WORKLIST'
  ClientHeight = 573
  ClientWidth = 1128
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 250
    Height = 573
    Align = alLeft
    BevelOuter = bvNone
    Constraints.MaxWidth = 250
    Constraints.MinWidth = 250
    TabOrder = 0
    Visible = False
    object cxGroupBox1: TcxGroupBox
      Left = 0
      Top = 0
      Align = alClient
      Caption = #1059#1089#1083#1086#1074#1080#1103' '#1087#1086#1080#1089#1082#1072'...'
      ParentFont = False
      Style.BorderStyle = ebsOffice11
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'Book Antiqua'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.SkinName = 'Black'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 0
      Height = 573
      Width = 250
      object bClearFilter: TcxButton
        Left = 2
        Top = 526
        Width = 246
        Height = 40
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
        Align = alBottom
        Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1092#1080#1083#1100#1090#1088#1072
        TabOrder = 0
        OnClick = bClearFilterClick
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Black'
        ExplicitTop = 531
      end
      object cxPageControl1: TcxPageControl
        Left = 2
        Top = 22
        Width = 246
        Height = 504
        ActivePage = cxTabSheet3
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 1
        ExplicitTop = 16
        ClientRectBottom = 504
        ClientRectRight = 246
        ClientRectTop = 29
        object cxTabSheet1: TcxTabSheet
          Caption = #1055#1072#1094#1080#1077#1085#1090
          ImageIndex = 0
          object cbSex: TcxComboBox
            Left = 117
            Top = 115
            ParentShowHint = False
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
            Properties.DropDownListStyle = lsFixedList
            Properties.DropDownSizeable = True
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Items.Strings = (
              ''
              #1052#1091#1078#1089#1082#1086#1081
              #1046#1077#1085#1089#1082#1080#1081)
            Properties.PostPopupValueOnTab = True
            ShowHint = True
            Style.LookAndFeel.Kind = lfOffice11
            Style.LookAndFeel.SkinName = 'Black'
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleDisabled.LookAndFeel.SkinName = 'Black'
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.SkinName = 'Black'
            StyleHot.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.SkinName = 'Black'
            TabOrder = 0
            Width = 90
          end
          object cxLabel17: TcxLabel
            Left = 3
            Top = 145
            Caption = 'N '#1052#1050':'
            Transparent = True
          end
          object cxLabel2: TcxLabel
            Left = 3
            Top = 19
            Caption = #1060#1072#1084#1080#1083#1080#1103':'
            Transparent = True
          end
          object cxLabel3: TcxLabel
            Left = 78
            Top = 116
            Caption = #1055#1086#1083':'
            Transparent = True
          end
          object cxLabel7: TcxLabel
            Left = 3
            Top = 85
            Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
            Transparent = True
          end
          object deBorn: TcxDateEdit
            Left = 117
            Top = 85
            ParentShowHint = False
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
            Properties.DateButtons = [btnToday]
            Properties.DateOnError = deToday
            Properties.ImmediatePost = True
            Properties.PostPopupValueOnTab = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            ShowHint = True
            Style.BorderStyle = ebsOffice11
            Style.LookAndFeel.Kind = lfOffice11
            Style.LookAndFeel.SkinName = 'Black'
            Style.ButtonStyle = btsOffice11
            Style.ButtonTransparency = ebtNone
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleDisabled.LookAndFeel.SkinName = 'Black'
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.SkinName = 'Black'
            StyleHot.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.SkinName = 'Black'
            TabOrder = 5
            Width = 90
          end
          object teFam: TcxTextEdit
            Left = 3
            Top = 47
            Properties.CharCase = ecUpperCase
            Style.LookAndFeel.Kind = lfOffice11
            Style.LookAndFeel.SkinName = 'Black'
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleDisabled.LookAndFeel.SkinName = 'Black'
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.SkinName = 'Black'
            StyleHot.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.SkinName = 'Black'
            TabOrder = 6
            OnClick = teFamClick
            OnEnter = teFamEnter
            OnKeyDown = teFamKeyDown
            Width = 237
          end
          object teNum: TcxTextEdit
            Left = 3
            Top = 173
            Style.LookAndFeel.Kind = lfOffice11
            Style.LookAndFeel.SkinName = 'Black'
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleDisabled.LookAndFeel.SkinName = 'Black'
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.SkinName = 'Black'
            StyleHot.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.SkinName = 'Black'
            TabOrder = 7
            OnKeyDown = teNumKeyDown
            Width = 238
          end
        end
        object cxTabSheet2: TcxTabSheet
          Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
          ImageIndex = 1
          object cxLabel16: TcxLabel
            Left = 3
            Top = 288
            Caption = 'N '#1087#1088#1086#1090#1086#1082#1086#1083#1072':'
            Transparent = True
          end
          object cxTextEdit1: TcxTextEdit
            Left = 3
            Top = 316
            Properties.CharCase = ecUpperCase
            Style.LookAndFeel.Kind = lfOffice11
            Style.LookAndFeel.SkinName = 'Black'
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleDisabled.LookAndFeel.SkinName = 'Black'
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.SkinName = 'Black'
            StyleHot.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.SkinName = 'Black'
            TabOrder = 1
            OnClick = teFamClick
            OnEnter = teFamEnter
            OnKeyDown = teFamKeyDown
            Width = 238
          end
          object cbDates: TcxCheckBox
            Left = 3
            Top = 157
            Caption = #1055#1086' '#1076#1072#1090#1072#1084
            ParentShowHint = False
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Properties.OnEditValueChanged = cbDatesPropertiesEditValueChanged
            ShowHint = True
            State = cbsGrayed
            Style.LookAndFeel.Kind = lfOffice11
            Style.LookAndFeel.SkinName = 'Black'
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleDisabled.LookAndFeel.SkinName = 'Black'
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.SkinName = 'Black'
            StyleHot.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.SkinName = 'Black'
            TabOrder = 2
            Transparent = True
            Width = 121
          end
          object cbType: TcxComboBox
            Left = 102
            Top = 12
            ParentShowHint = False
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
            Properties.DropDownListStyle = lsFixedList
            Properties.DropDownSizeable = True
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Items.Strings = (
              ''
              'CT'
              'CR'
              'DR'
              'OT'
              'US'
              'XA'
              'VR'
              'MR'
              'MG'
              'NM'
              'SC'
              'DX')
            Properties.PostPopupValueOnTab = True
            ShowHint = True
            Style.LookAndFeel.Kind = lfOffice11
            Style.LookAndFeel.SkinName = 'Black'
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleDisabled.LookAndFeel.SkinName = 'Black'
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.SkinName = 'Black'
            StyleHot.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.SkinName = 'Black'
            TabOrder = 3
            Width = 139
          end
          object cxLabel10: TcxLabel
            Left = 3
            Top = 41
            Caption = #1042#1088#1072#1095':'
            Transparent = True
          end
          object cxLabel4: TcxLabel
            Left = 3
            Top = 13
            Caption = #1052#1086#1076#1072#1083#1100#1085#1086#1089#1090#1100':'
            Transparent = True
          end
          object cxLabel8: TcxLabel
            Left = 3
            Top = 99
            Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
            Transparent = True
          end
          object paDates: TPanel
            Left = 3
            Top = 178
            Width = 238
            Height = 106
            BevelInner = bvLowered
            TabOrder = 7
            object deBegin: TcxDateEdit
              Left = 61
              Top = 10
              ParentShowHint = False
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
              Properties.DateButtons = [btnToday]
              Properties.DateOnError = deToday
              Properties.ImmediatePost = True
              Properties.PostPopupValueOnTab = True
              Properties.ShowTime = False
              ShowHint = True
              Style.BorderStyle = ebsOffice11
              Style.LookAndFeel.Kind = lfOffice11
              Style.LookAndFeel.SkinName = 'Black'
              Style.ButtonStyle = btsOffice11
              Style.ButtonTransparency = ebtNone
              StyleDisabled.LookAndFeel.Kind = lfOffice11
              StyleDisabled.LookAndFeel.SkinName = 'Black'
              StyleFocused.LookAndFeel.Kind = lfOffice11
              StyleFocused.LookAndFeel.SkinName = 'Black'
              StyleHot.LookAndFeel.Kind = lfOffice11
              StyleHot.LookAndFeel.SkinName = 'Black'
              TabOrder = 0
              Width = 90
            end
            object cxLabel6: TcxLabel
              Left = 30
              Top = 40
              Caption = #1055#1086':'
              Transparent = True
            end
            object deEnd: TcxDateEdit
              Left = 61
              Top = 40
              ParentShowHint = False
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
              Properties.DateButtons = [btnToday]
              Properties.DateOnError = deToday
              Properties.ImmediatePost = True
              Properties.PostPopupValueOnTab = True
              Properties.ShowTime = False
              ShowHint = True
              Style.BorderStyle = ebsOffice11
              Style.LookAndFeel.Kind = lfOffice11
              Style.LookAndFeel.SkinName = 'Black'
              Style.ButtonStyle = btsOffice11
              Style.ButtonTransparency = ebtNone
              StyleDisabled.LookAndFeel.Kind = lfOffice11
              StyleDisabled.LookAndFeel.SkinName = 'Black'
              StyleFocused.LookAndFeel.Kind = lfOffice11
              StyleFocused.LookAndFeel.SkinName = 'Black'
              StyleHot.LookAndFeel.Kind = lfOffice11
              StyleHot.LookAndFeel.SkinName = 'Black'
              TabOrder = 2
              Width = 90
            end
            object bPeriod: TcxButton
              Left = 157
              Top = 70
              Width = 71
              Height = 24
              Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
              Caption = #1055#1077#1088#1080#1086#1076
              TabOrder = 3
              OnClick = bPeriodClick
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.SkinName = 'Black'
            end
            object cxLabel5: TcxLabel
              Left = 39
              Top = 10
              Caption = #1057':'
              Transparent = True
            end
            object cxLabel11: TcxLabel
              Left = 2
              Top = 71
              Caption = #1055#1077#1088#1080#1086#1076':'
            end
            object cbPeriod: TcxComboBox
              Left = 61
              Top = 70
              ParentShowHint = False
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
              Properties.OnEditValueChanged = cbPeriodPropertiesEditValueChanged
              ShowHint = True
              Style.LookAndFeel.Kind = lfOffice11
              Style.LookAndFeel.SkinName = 'Black'
              StyleDisabled.LookAndFeel.Kind = lfOffice11
              StyleDisabled.LookAndFeel.SkinName = 'Black'
              StyleFocused.LookAndFeel.Kind = lfOffice11
              StyleFocused.LookAndFeel.SkinName = 'Black'
              StyleHot.LookAndFeel.Kind = lfOffice11
              StyleHot.LookAndFeel.SkinName = 'Black'
              TabOrder = 6
              Width = 90
            end
            object bToday: TcxButton
              Left = 157
              Top = 10
              Width = 71
              Height = 24
              Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
              Caption = #1057#1077#1075#1086#1076#1085#1103
              TabOrder = 7
              OnClick = bTodayClick
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.SkinName = 'Black'
            end
            object bYesterday: TcxButton
              Left = 157
              Top = 40
              Width = 71
              Height = 24
              Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
              Caption = #1042#1095#1077#1088#1072
              TabOrder = 8
              OnClick = bYesterdayClick
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.SkinName = 'Black'
            end
          end
          object teDesc: TcxTextEdit
            Left = 3
            Top = 127
            Properties.CharCase = ecUpperCase
            Style.LookAndFeel.Kind = lfOffice11
            Style.LookAndFeel.SkinName = 'Black'
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleDisabled.LookAndFeel.SkinName = 'Black'
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.SkinName = 'Black'
            StyleHot.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.SkinName = 'Black'
            TabOrder = 8
            OnKeyDown = teDescKeyDown
            Width = 238
          end
          object teSotr: TcxTextEdit
            Left = 3
            Top = 69
            Properties.CharCase = ecUpperCase
            Style.LookAndFeel.Kind = lfOffice11
            Style.LookAndFeel.SkinName = 'Black'
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleDisabled.LookAndFeel.SkinName = 'Black'
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.SkinName = 'Black'
            StyleHot.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.SkinName = 'Black'
            TabOrder = 9
            OnClick = teSotrClick
            OnEnter = teSotrEnter
            OnKeyDown = teSotrKeyDown
            Width = 238
          end
        end
        object cxTabSheet3: TcxTabSheet
          Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077
          ImageIndex = 2
          ExplicitHeight = 480
          object cxECHO: TcxButton
            Left = 98
            Top = 312
            Width = 82
            Height = 24
            Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
            Caption = 'ECHO'
            TabOrder = 0
            OnClick = cxECHOClick
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.SkinName = 'Black'
          end
          object cxLabel12: TcxLabel
            Left = 3
            Top = 70
            Caption = #1055#1086#1088#1090' QUERY:'
            Transparent = True
          end
          object cxLabel13: TcxLabel
            Left = 3
            Top = 133
            Caption = 'Called AE Title:'
            Transparent = True
          end
          object cxLabel14: TcxLabel
            Left = 3
            Top = 192
            Caption = 'Calling AE Title:'
            Transparent = True
          end
          object cxLabel15: TcxLabel
            Left = 3
            Top = 252
            Caption = #1051#1086#1082#1072#1083#1100#1085#1099#1081' '#1087#1086#1088#1090':'
            Transparent = True
          end
          object cxLabel18: TcxLabel
            Left = 3
            Top = 102
            Caption = #1055#1086#1088#1090' STORE:'
            Transparent = True
          end
          object cxLabel9: TcxLabel
            Left = 3
            Top = 9
            Caption = #1057#1077#1088#1074#1077#1088':'
            Transparent = True
          end
          object teCalled: TcxTextEdit
            Left = 3
            Top = 160
            TabOrder = 7
            Width = 238
          end
          object teCalling: TcxTextEdit
            Left = 3
            Top = 220
            TabOrder = 8
            Width = 238
          end
          object teHost: TcxTextEdit
            Left = 3
            Top = 37
            TabOrder = 9
            Width = 238
          end
          object teLocalPort: TcxTextEdit
            Left = 3
            Top = 280
            TabOrder = 10
            Width = 238
          end
          object tePort: TcxTextEdit
            Left = 99
            Top = 69
            TabOrder = 11
            Width = 82
          end
          object tePortStore: TcxTextEdit
            Left = 98
            Top = 101
            TabOrder = 12
            Width = 82
          end
        end
        object cxTabSheet4: TcxTabSheet
          Caption = 'WorkList'
          ImageIndex = 3
          object cxLabel1: TcxLabel
            Left = 3
            Top = 9
            Caption = #1057#1077#1088#1074#1077#1088':'
            Transparent = True
          end
          object teWLHost: TcxTextEdit
            Left = 3
            Top = 37
            TabOrder = 1
            Width = 238
          end
          object cxLabel19: TcxLabel
            Left = 3
            Top = 70
            Caption = #1055#1086#1088#1090':'
            Transparent = True
          end
          object teWLPort: TcxTextEdit
            Left = 49
            Top = 69
            TabOrder = 3
            Width = 82
          end
          object cxLabel20: TcxLabel
            Left = 3
            Top = 100
            Caption = 'Called AE Title:'
            Transparent = True
          end
          object teWLCalled: TcxTextEdit
            Left = 3
            Top = 127
            TabOrder = 5
            Width = 238
          end
          object cxLabel21: TcxLabel
            Left = 3
            Top = 159
            Caption = 'Calling AE Title:'
            Transparent = True
          end
          object teWLCalling: TcxTextEdit
            Left = 3
            Top = 187
            TabOrder = 7
            Width = 238
          end
          object cxButton1: TcxButton
            Left = 49
            Top = 228
            Width = 82
            Height = 24
            Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
            Caption = 'ECHO'
            TabOrder = 8
            OnClick = cxButton1Click
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.SkinName = 'Black'
          end
        end
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 250
    Top = 0
    Width = 8
    Height = 573
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 61
    Control = Panel1
    OnBeforeOpen = cxSplitter1BeforeOpen
    OnBeforeClose = cxSplitter1BeforeClose
    Visible = False
    ExplicitLeft = 100
  end
  object Panel2: TPanel
    Left = 394
    Top = 0
    Width = 734
    Height = 573
    Align = alRight
    Caption = 'Panel2'
    TabOrder = 6
    Visible = False
    object dxBarDockControl1: TdxBarDockControl
      Left = 1
      Top = 1
      Width = 732
      Height = 28
      Align = dalTop
      BarManager = BM
      SunkenBorder = True
      UseOwnSunkenBorder = True
      ExplicitWidth = 532
    end
    object cxGr: TcxGrid
      Left = 1
      Top = 29
      Width = 732
      Height = 543
      Align = alClient
      PopupMenu = pmTV
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Black'
      ExplicitWidth = 532
      object TV: TcxGridTableView
        NavigatorButtons.ConfirmDelete = False
        OnCellDblClick = TVCellDblClick
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = VPAC
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
        object VPAC: TcxGridColumn
          Caption = #1055#1072#1094#1080#1077#1085#1090
          Width = 61
        end
        object VNUMBER: TcxGridColumn
          Caption = 'PatientID'
          Width = 61
        end
        object VDATE: TcxGridColumn
          Caption = #1044#1072#1090#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
          Width = 60
        end
        object VSTUDYID: TcxGridColumn
          Caption = 'ID '#1080#1089#1089#1083'. (StudyID)'
          Width = 64
        end
        object VACNUMBER: TcxGridColumn
          Caption = 'AccessionNumber'
          Width = 87
        end
        object VMODALITY: TcxGridColumn
          Caption = #1052#1086#1076#1072#1083#1100#1085#1086#1089#1090#1100
          Width = 52
        end
        object VDESC: TcxGridColumn
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          Width = 50
        end
        object VSTUDYUID: TcxGridColumn
          Caption = 'UID '#1080#1089#1089#1083'. (StudyUID)'
          Width = 51
        end
        object SERIESUID: TcxGridColumn
          Visible = False
        end
      end
      object cxGrLevel1: TcxGridLevel
        GridView = TV
      end
    end
  end
  object Panel3: TPanel
    Left = 258
    Top = 0
    Width = 136
    Height = 573
    Align = alClient
    TabOrder = 7
    ExplicitLeft = 288
    ExplicitTop = 184
    ExplicitWidth = 185
    ExplicitHeight = 41
    object cxGrid2: TcxGrid
      Left = 1
      Top = 49
      Width = 134
      Height = 523
      Align = alClient
      TabOrder = 0
      ExplicitLeft = -2
      ExplicitTop = 134
      ExplicitWidth = 753
      ExplicitHeight = 431
      object cxGrid2DBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.GroupByBox = False
        object cxFld_P_ENAME: TcxGridDBColumn
          Caption = #1060#1048#1054
          DataBinding.FieldName = 'P_ENAME'
          Width = 261
        end
        object cxFld_P_DATEBORN: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
          DataBinding.FieldName = 'P_DATEBORN'
          Width = 73
        end
        object cxFld_Modality: TcxGridDBColumn
          Caption = #1052#1086#1076#1072#1083#1100#1085#1086#1089#1090#1100
          DataBinding.FieldName = 'Modality'
          Width = 79
        end
        object cxFld_StationAETitle: TcxGridDBColumn
          Caption = 'AETitle'
          DataBinding.FieldName = 'STATIONAETITLE'
          Width = 120
        end
        object cxFld_StartDateWorklist: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
          DataBinding.FieldName = 'StartDateWorklist'
          Width = 100
        end
        object cxFld_StepStartTime: TcxGridDBColumn
          Caption = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072
          DataBinding.FieldName = 'StepStartTime'
          Width = 100
        end
        object cxFld_StudyUID: TcxGridDBColumn
          DataBinding.FieldName = 'STUDYUID'
          Visible = False
          VisibleForCustomization = False
        end
        object cxFld_P_PID: TcxGridDBColumn
          DataBinding.FieldName = 'P_PID'
          Visible = False
          VisibleForCustomization = False
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxGrid2DBTableView1
      end
    end
    object cxGroupBox6: TcxGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 1
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Caption = #1060#1080#1083#1100#1090#1088
      Style.LookAndFeel.SkinName = 'Black'
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 1
      ExplicitWidth = 750
      Height = 48
      Width = 128
      object cxLabel22: TcxLabel
        Left = 10
        Top = 18
        Caption = #1044#1072#1090#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103' '#1089':'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Transparent = True
      end
      object deStartDateWorklist: TcxDateEdit
        Left = 128
        Top = 18
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 1
        Width = 129
      end
      object cxLabel23: TcxLabel
        Left = 263
        Top = 19
        Caption = #1087#1086
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Transparent = True
      end
      object deEndDateWorklist: TcxDateEdit
        Left = 284
        Top = 18
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 2
        Width = 127
      end
    end
  end
  object AL: TActionList
    Images = IL
    Left = 696
    Top = 296
    object aClose: TAction
      Caption = #1042#1099#1093#1086#1076
      Hint = #1042#1099#1081#1090#1080' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      ImageIndex = 8
      ShortCut = 32883
      OnExecute = aCloseExecute
    end
    object aFind: TAction
      Caption = #1055#1086#1080#1089#1082'...'
      Hint = #1048#1089#1082#1072#1090#1100' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      ShortCut = 16454
      OnExecute = aFindExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1086#1080#1089#1082#1072
      ImageIndex = 1
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1086#1080#1089#1082#1072
      ImageIndex = 7
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aSnimok: TAction
      Caption = #1057#1085#1080#1084#1086#1082
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1089#1085#1080#1084#1082#1080
      ImageIndex = 0
      OnExecute = aSnimokExecute
    end
    object aText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 3
      OnExecute = aTextExecute
    end
    object aWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 4
      OnExecute = aWebExecute
    end
    object aXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 5
      OnExecute = aXMLExecute
    end
    object aExcel: TAction
      Caption = 'Excel-'#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel-'#1092#1072#1081#1083
      ImageIndex = 6
      OnExecute = aExcelExecute
    end
    object AVideoCapt: TAction
      Caption = #1047#1072#1093#1074#1072#1090' '#1074#1080#1076#1077#1086
      OnExecute = AVideoCaptExecute
    end
    object actMAH1: TAction
      Caption = 'actMAH1'
      Visible = False
      OnExecute = actMAH1Execute
    end
    object aKIN: TAction
      Caption = 'KIN'
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1082#1083#1102#1095#1077#1074#1099#1077' '#1089#1085#1080#1084#1082#1080
      OnExecute = aKINExecute
    end
    object aCD: TAction
      Caption = 'CD'
      Hint = #1047#1072#1087#1080#1089#1072#1090#1100' DICOM CD'
      ImageIndex = 10
      OnExecute = aCDExecute
    end
  end
  object dxMemData1: TdxMemData
    Indexes = <>
    Persistent.Option = poLoad
    SortOptions = []
    Left = 568
    Top = 280
    object dxMemData1Patient: TStringField
      FieldName = 'Patient'
      Size = 1000
    end
    object dxMemData1Number: TStringField
      FieldName = 'Number'
      Size = 100
    end
    object dxMemData1Date: TDateField
      FieldName = 'Date'
    end
    object dxMemData1StudyID: TStringField
      FieldName = 'StudyID'
    end
    object dxMemData1AcNumber: TStringField
      FieldName = 'AcNumber'
    end
    object dxMemData1Modality: TStringField
      FieldName = 'Modality'
      Size = 10
    end
    object dxMemData1Desc: TStringField
      FieldName = 'Desc'
      Size = 200
    end
    object dxMemData1STUDYUID: TStringField
      FieldName = 'STUDYUID'
      Size = 100
    end
    object dxMemData1SERIESUID: TStringField
      FieldName = 'SERIESUID'
      Size = 64
    end
  end
  object BM: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clBtnFace
    ImageOptions.Images = IL
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Black'
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 696
    Top = 368
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
      Caption = 'Issl'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 212
      FloatTop = 27
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton8'
        end
        item
          Visible = False
          ItemName = 'dxBarButton12'
        end
        item
          Visible = False
          ItemName = 'dxBarButton4'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          Visible = True
          ItemName = 'dxBarButton10'
        end
        item
          Visible = True
          ItemName = 'dxBarButton11'
        end
        item
          Visible = True
          ItemName = 'dxBarButton15'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton14'
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
    object dxBarButton1: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton3: TdxBarButton
      Action = aPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbClose: TdxBarButton
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton4: TdxBarButton
      Caption = #1057#1085#1080#1084#1082#1080
      Category = 0
      Hint = #1057#1085#1080#1084#1082#1080
      Visible = ivNever
      ButtonStyle = bsDropDown
      DropDownMenu = dxBarPopupMenu1
    end
    object dxBarButton5: TdxBarButton
      Caption = #1055#1040#1062#1048#1045#1053#1058
      Category = 0
      Hint = #1055#1040#1062#1048#1045#1053#1058
      Visible = ivAlways
      OnClick = dxBarButton5Click
    end
    object dxBarButton6: TdxBarButton
      Caption = #1057#1045#1056#1048#1071
      Category = 0
      Hint = #1057#1045#1056#1048#1071
      Visible = ivAlways
      OnClick = dxBarButton6Click
    end
    object dxBarButton7: TdxBarButton
      Caption = #1048#1057#1057#1051#1045#1044#1054#1042#1040#1053#1048#1045
      Category = 0
      Hint = #1048#1057#1057#1051#1045#1044#1054#1042#1040#1053#1048#1045
      Visible = ivAlways
      OnClick = dxBarButton7Click
    end
    object dxBarButton8: TdxBarButton
      Action = aSnimok
      Caption = #1057#1085#1080#1084#1086#1082' '
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton2: TdxBarButton
      Caption = 'TEST'
      Category = 0
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = #1053#1086#1074#1099#1081' '#1087#1086#1076'-'#1101#1083#1077#1084#1077#1085#1090
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton9: TdxBarButton
      Action = AVideoCapt
      Category = 0
    end
    object dxBarButton10: TdxBarButton
      Action = AVideoCapt
      Category = 0
    end
    object dxBarButton11: TdxBarButton
      Action = actMAH1
      Caption = 'TEST'
      Category = 0
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton12: TdxBarButton
      Action = aKIN
      Category = 0
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton13: TdxBarButton
      Caption = 'DICOM tags'
      Category = 0
      Hint = 'DICOM tags'
      Visible = ivAlways
    end
    object dxBarButton14: TdxBarButton
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      Category = 0
      Hint = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      Visible = ivAlways
      OnClick = dxBarButton14Click
    end
    object dxBarButton15: TdxBarButton
      Action = aCD
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object IL: TImageList
    Left = 598
    Top = 152
    Bitmap = {
      494C01010B00A801A80110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B009C4B4C00B64B4C009F4B4C004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6F5F500C0BABB00A39B9A00A19B99009D989700B8B6B600007500000070
      0000006D00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B009A4D
      4E00AF4E4F00C04D4E00BF4C4D009F4B4C004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E4DC
      DC00B6A7A200EDEBD400FFFFF500FFFFFD000000000000000000007D000044DD
      7700007200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00CC57
      5800CB565700C9545500C7535400A34E4F004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B000000000000000000959696006C6F6F00AE86
      8600A67979006F5F5F006E707000000000000000000062626200535353009899
      9900ADAFAF006A6A6A005A5A5A00000000000000000000000000E7DDDE00CDB9
      A800FFFBD300FFFFE000FFFFE800FFFFF60000870000008500000081000048E1
      7B00007A00000075000000700000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00D05A
      5B00CF595A00CC575800CB565700A55050004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B00000000000000000075767600AE9A9A00C590
      9000B17D7D007F4D4D006C7070006F6F6F006464640056565600707070007167
      67003D232300B9BABA00656565000000000000000000F7F4F500C9AEA200FFE5
      B400FFE8C000FFF5D200FFFFE200FFFFF500008D00005EF791005AF38D0053EC
      860048E17B0045DE780000780000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00D962
      6300D8606200D55E5F00D45D5E00A95354004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B000000000000000000D3BABA00CCA8A800C28E
      8E00AF7C7C007E464600828383005C5C5C008B8B8B00AAAAAA00757676005A28
      280073404000431818009FA1A1000000000000000000D4C5C700F9C89B00FFD3
      A100FFDAAC00FFE7BC00FFFFE800FDFEFB0000910000008D0000008B00005AF3
      8D000083000000810000007D0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00DD65
      6600DC646500D9626300D8606200AB5555004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B000000000000000000D2B7B700CCA6A600C28F
      8F00AF7C7C007E4646007B7A7A0071717100B4B4B400D4D4D400747575006B34
      3400E2AFAF004B1E1E00888686000000000000000000D2B4AE00FFD09900FFCC
      9900FFCB9700FFE4C300E8E8ED00E5E3E400EBEAEA00ECECEE00008F00005EF7
      910000890000FFE8C400B7B3B100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00E66C
      6D00E56B6C00EEA6A700FFFFFF00AF5859004E1E1F00B7EBAA005ED3770045CA
      670045CA6700F7B5B600824B4B000000000000000000D0AFAF00CCA0A000C18E
      8E00AF7C7C007E4646007575750088888800F3F3F300F1F1F100E5E5E5003636
      360042272700545050007D7E7E000000000000000000DAB4A400FFCE9900FFCC
      9900FFCA9300FFF4EB00E2E3E4000000000000000000ECEDEE00009300000091
      0000008D0000FFE1BC009C8B7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00EA6F
      7000E96E6F00F2A9AA00FFFFFF00B15A5A004E1E1F00FFFFD300FFFFD300FFFF
      D300D9F6BD00F7B5B600824B4B000000000000000000D0ABAB00CB9C9C00CF9A
      9A00BC8888007C44440078777700A3A3A300EAEAEA007E7E7E00FDFDFD006C6D
      6D005B5D5D007A7B7B006D6D6D000000000000000000DFB7A700FFCD9800FFCB
      9800FFCA9200FDF4EC00E3E4E5000000000000000000E9EAEB00FCF8F400FFDB
      B700FFDDBB00FFDAAC009E8E8200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00F377
      7800F2767700EF747500EE737400B55D5D004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B000000000000000000F8C3C300F5C1C100C18B
      8B0093626200D9A9A9007373730075757500ADADAD0098989800989898007676
      76007F7F7F0000000000000000000000000000000000E2BEB800FFD4A100FFD7
      A800FFDCAF00FFF3D900E5E7EA00E5E5E500E5E5E600E3E4E800FFE8CA00FFCB
      9600FFCC9900FFD39B00A2979300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00F77A
      7B00F6797A00F3777800F2767700B75F5F004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B000000000000000000A5A6A600BDAAAA00E4AD
      AD00D6ABAB00C1C5C500D0D1D10076767600797979007E7E7E00868686009898
      98009191910000000000000000000000000000000000E8D2D400FCDCB300FFE6
      BC00FFEFC900FFFDDA00FFFFF400FBFBFB00FBFAF900FFFFEC00FFE8BC00FFDA
      AC00FFD2A100F0C29600BEB8BB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00FF81
      8200FE808100FC7F8000FB7E7F00BB6363004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B0000000000000000000000000000000000A7A7
      A700A4A5A500DDDDDD00CBCBCB0063636300717171007D7D7D00A4A4A4009494
      94009B9B9B0000000000000000000000000000000000FDF8F800ECC8C000FFF8
      D100FFFFDB00FFFFE500FFFFF000FFFFFD00FFFFF000FFFFE300FFF5D200FFE8
      C000FFE6B500B4A09600F6F5F500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00FF81
      8200FF818200FF818200FE808100BD6565004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000000000000000000000000000000
      000000000000D8D8D800C6C6C600A3A3A300A1A1A1007C7C7C009F9F9F000000
      0000000000000000000000000000000000000000000000000000FFEEEF00F1D9
      CA00FFFFE700FFFFED00FFFFF400FEFEFD00FFFFF300FFFFE800FFFFDF00FFFA
      D300CBB5A500E4DEDF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00AF5E
      5F00D56F7000FF818200FF818200BF6666004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000929292009393930000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFEE
      EF00EBCDC700F9F4E6000000000000000000FFFFF900FFFFF200F3EED600C7B5
      AD00EAE2E2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B00B6626300EE7A7B00BF6666004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEF9F900ECD6D700E2C5C500DFC5C500D9C1BF00D3BBBB00DCCDCE00FAF8
      F800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
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
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007777
      7700555555005555550055555500555555005555550055555500555555005555
      55005555550055555500555555000000000086868600FFFFFF00F1F1F100FFFF
      FF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFF
      FF00F1F1F100FFFFFF0000000000FF00FF000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000007777
      7700CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00555555000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1
      F100FFFFFF00F1F1F10000000000FF00FF000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000CC3333007777
      7700FFFFFF00EAEAEA00EAEAEA00D6E7E700D6E7E700EAEAEA00D6E7E700D6E7
      E700D6E7E700CCCCCC00555555000000000086868600FFFFFF00F1F1F1009966
      3300996633009966330099663300996633009966330099663300996633009966
      3300F1F1F100FFFFFF0000000000FF00FF000000000000000000000000008484
      8400FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CC333300000000000404
      040004040400996600009966000099660000EAEAEA00D6E7E700EAEAEA00D6E7
      E700D6E7E700CCCCCC00555555000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1
      F100FFFFFF00F1F1F10000000000FF00FF000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000808000CC33330066333300CC33
      3300FF663300FF663300FF663300FF66330099660000EAEAEA00D6E7E700EAEA
      EA00D6E7E700CCCCCC00555555000000000086868600FFFFFF00F1F1F1009966
      3300996633009966330099663300996633009966330099663300996633009966
      3300F1F1F100FFFFFF0000000000FF00FF0000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000848484000000FF0084848400000000000000
      0000848484000000000084848400000000005F5F5F006699990099330000FF66
      3300FF663300C0C0C000C0C0C000CC333300FF66330099660000EAEAEA00D6E7
      E700D6E7E700CCCCCC00555555000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1
      F100FFFFFF00F1F1F10000000000FF00FF0000840000FFFFFF00008400000084
      0000008400000084000000840000008400000084000000840000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400848484000000000000000000777777006699CC00CC663300FF66
      3300CC660000F0FBFF00F0FBFF00F1F1F100F0FBFF00EAEAEA00D6E7E700EAEA
      EA00D6E7E700CCCCCC00555555000000000086868600FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF00800000008000000080000000FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF0000000000FF00FF0000840000FFFFFF00008400000084
      000000840000C6C6C60000840000008400000084000000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000848484000000000000000000000000007777770099CCFF00FF66
      3300CC660000CC660000CC660000CC660000CC660000CC660000EAEAEA00D6E7
      E700D6E7E700CCCCCC00555555000000000086868600FFFFFF00F0CAA6009900
      0000FFFFFF00FF663300FF99330000993300FF00000080000000FFFFFF009900
      0000F0CAA600F1F1F10000000000FF00FF0000840000FFFFFF00FFFFFF000084
      0000C6C6C600008400000084000000840000FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000000000000000000000000000800000006699990099FF
      FF00CC660000F0FBFF00F0FBFF00CC333300FFCC0000CC660000F1F1F100EAEA
      EA00D6E7E700CCCCCC00555555000000000086868600F0CAA60099000000FFFF
      FF00F1F1F10080800000FFFF3300FFCC33000099330080000000F1F1F100FFFF
      FF0099000000F0CAA60000000000FF00FF0000840000FFFFFF0000840000C6C6
      C600008400000084000000840000FFFFFF00FFFFFF0000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000000000000000000000000000800000009999
      6600CCCC9900CC333300CC333300FFFF6600CC660000F1F1F100F0FBFF00EAEA
      EA00CCCCCC0099999900555555000000000086868600FFFFFF00F0CAA6009900
      0000FFFFFF0080800000FFFFFF00FFFF3300FF99330080000000FFFFFF009900
      0000F0CAA600F1F1F10000000000FF00FF0000840000FFFFFF00C6C6C6000084
      000000840000008400000084000000840000FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000CC660000CC660000CC660000CC660000F0FBFF00FF663300F1F1F100CCCC
      CC009999990077777700555555000000000086868600FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF008080000080800000FF663300FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF0000000000FF00FF0000840000FFFFFF00008400000084
      0000FFFFFF00FFFFFF000084000000840000FFFFFF0000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008686
      8600FFFFFF00F0FBFF00F0FBFF00CC660000CC660000F0FBFF00F0FBFF005555
      55003333330033333300333333000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF000000
      0000000000000000000000000000FF00FF0000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008686
      8600FFFFFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF009999
      9900FFFFFF0055555500000000000000000086868600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F100FFFFFF00F1F1F100C0C0
      C000FFFFFF0086868600FF00FF00FF00FF000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000FFFFFF00FFFF
      FF0084848400FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000008686
      8600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009999
      99005555550000000000000000000000000086868600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00086868600FF00FF00FF00FF00FF00FF000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008686
      8600868686008686860086868600868686008686860086868600868686008686
      8600000000000000000000000000000000008686860086868600868686008686
      8600868686008686860086868600868686008686860086868600868686008686
      8600FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE8400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000008484840084848400000000000000000000000000000000008484
      84008484840084848400FFCE8400FF0000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF0000000000000000008484840084848400000000000000000084848400FF00
      0000FF000000FF000000FF000000FF000000FF00000084848400848484000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000FFDEAD00FF000000FF00
      0000FFCE8400FFCE8400FF000000FF000000FF000000FF000000848484000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000FFDEAD00FF000000FF000000FF00
      00000000000000000000FFCE8400FF000000FF00000084848400000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C0000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFDEAD00FF000000848484000000
      00000000000000000000FFCE8400FF000000848484000000000000000000FF00
      0000848484000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000080800000808000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400FFDEAD00FF000000848484000000
      00000000000000000000FFCE840084848400000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000848484008484
      840084848400848484008484840000000000FFDEAD00FF000000848484000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000848484008484
      840084848400000000000000000000000000FFDEAD00FF000000848484000000
      00000000000000000000FF00000084848400000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00000000000000000000000000000000000FFFFFF000000000000000000FFFF
      FF00000000000000000000000000848484008484840084848400848484008484
      84000000000000000000000000000000000000000000FFA5A500FF0000000000
      000000000000FF000000FF000000848484000000000000000000FF000000FF00
      0000848484000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000808000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00C0C0
      C00000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000848484008484840084848400FF000000FF00
      0000848484000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00000000000000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      8400FF000000FF000000FF000000FF000000FF000000FF000000FF0000008484
      8400000000000000000000000000000000000000000000000000008080000000
      0000000000000000000080800000000000008080000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000FFCE8400FF000000FF000000FFCE8400FFCE8400FFCE8400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080800000FFFFFF00000000000000000080800000000000000000
      00000000000000000000000000000000000080808000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF000000000000000000000000000000000084848400FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000008484840084848400848484000000000000000000000000000000
      000000000000FFCE8400FF000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080800000FFFFFF00FFFFFF00000000000000000080800000808000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      8000FFFFFF0080808000FFFFFF0080808000FFFFFF0080808000FFFFFF000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      00000000000000000000FFCE8400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FE7FFFFFFFFF0000E07FFFFFF0070000
      C001FFFFE0C70000C0018181C0010000C001800180010000C001800180010000
      C001800180010000C001800181810000C001800181810000C001800780010000
      C001800780010000C001E00780010000C001F81FC0030000C001FE7FE3070000
      E001FFFFF00F0000FE7FFFFFFFFF0000FFFFFFFEE000C00FE0010002E000C007
      E0010002E0008003C0010002E000BFF3A00100020000BFF3000100020000BE31
      00010002000080010001000200008001800100020000C001800100020000E001
      C00100020000F003E00100020000F00FE001001E0000F00FE00300000001F00F
      E0070000E003F007E00F0000E007F807FE0FFFFFC001800FCFE7FC7F80310007
      F001E03F803100078000C01F803100078000801F80010007C0000C3F80010007
      80001C6780010007C0001CE38FF1000781C11FE38FF10007C1C71CE38C710007
      660F98C78C71000773FEF0078C71000771FCE00F893500073870F03F81810007
      1C00F8FFE18F800F8FC0FCFFE00FD55F00000000000000000000000000000000
      000000000000}
  end
  object pmTV: TPopupMenu
    Images = IL
    Left = 822
    Top = 152
    object N1: TMenuItem
      Action = aPrint
    end
    object N2: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 2
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
        Action = aExcel
      end
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
  object sdPopUp: TSaveDialog
    Left = 825
    Top = 203
  end
  object frxRep: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40004.483481446760000000
    ReportOptions.LastChange = 40004.562644108800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepGetValue
    Left = 590
    Top = 328
    Datasets = <
      item
        DataSet = frxDB
        DataSetName = 'frxDB'
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
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 56.692950000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 60.472480000000000000
          Top = 56.692950000000000000
          Width = 370.393940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 430.866420000000000000
          Top = 56.692950000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 604.724800000000000000
          Top = 56.692950000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1038#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' '#1056#1109#1057#8218#1056#1109#1056#177#1057#1026#1056#176#1056#1029#1056#1029#1057#8249#1057#8230' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#8470)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 657.638220000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
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
        object Memo13: TfrxMemoView
          Left = 3.779530000000000000
          Top = 26.456710000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109': [KOLVO]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 154.960730000000000000
        Width = 755.906000000000000000
        DataSet = frxDB
        DataSetName = 'frxDB'
        RowCount = 0
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Width = 56.692950000000000000
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
            '[Line]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 60.472480000000000000
          Width = 370.393940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDB."Patient"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 430.866420000000000000
          Width = 173.858380000000000000
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
            '[frxDB."Number"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 604.724800000000000000
          Width = 147.401670000000000000
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
            '[frxDB."Date"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 234.330860000000000000
        Width = 755.906000000000000000
        object Memo9: TfrxMemoView
          Left = 3.779530000000000000
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
      end
    end
  end
  object frxDB: TfrxDBDataset
    UserName = 'frxDB'
    CloseDataSource = False
    DataSet = dxMemData1
    BCDToCurrency = False
    Left = 590
    Top = 376
  end
  object PopupMenu1: TPopupMenu
    Left = 216
    Top = 416
  end
  object dxBarPopupMenu1: TdxBarPopupMenu
    BarManager = BM
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton5'
      end
      item
        Visible = True
        ItemName = 'dxBarButton7'
      end
      item
        Visible = True
        ItemName = 'dxBarButton6'
      end>
    UseOwnFont = False
    Left = 696
    Top = 152
  end
  object bsSeparator11: TdxBarSeparator
    Category = -1
    Visible = ivAlways
  end
  object DicomServerCore1: TDicomServerCore
    ServerPort = 1115
    ForceCheckTableBeforeOpen = False
    SynchronousCMove = False
    OnDicomImage = DicomServerCore1DicomImage
    Left = 522
    Top = 159
  end
end
