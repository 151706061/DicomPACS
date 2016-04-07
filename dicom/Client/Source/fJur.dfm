object frmJur: TfrmJur
  Left = 303
  Top = 56
  Caption = #1046#1091#1088#1085#1072#1083' '#1089#1086#1073#1099#1090#1080#1081' '#1089#1077#1088#1074#1077#1088#1072
  ClientHeight = 583
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object paParam: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 260
    Height = 577
    Margins.Right = 0
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Constraints.MaxWidth = 267
    Constraints.MinWidth = 257
    TabOrder = 0
    object gbPeriod: TcxGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 5
      Margins.Bottom = 0
      Align = alTop
      Caption = #1055#1077#1088#1080#1086#1076
      Constraints.MaxHeight = 279
      Constraints.MinHeight = 279
      ParentFont = False
      Style.BorderStyle = ebsOffice11
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
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
      Height = 279
      Width = 250
      object paPeriod: TJvPanel
        Left = 12
        Top = 169
        Width = 227
        Height = 88
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
        FlatBorderColor = clNavy
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Enabled = False
        TabOrder = 3
        object cxLabel5: TcxLabel
          Left = 6
          Top = 36
          Caption = #1055#1086':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.SkinName = 'Office2007Green'
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          Transparent = True
        end
        object cxLabel4: TcxLabel
          Left = 6
          Top = 11
          Caption = 'C:'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.SkinName = 'Office2007Green'
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          Transparent = True
        end
        object deBegin: TcxDateEdit
          Left = 65
          Top = 10
          ParentFont = False
          ParentShowHint = False
          Properties.DateButtons = [btnToday]
          Properties.DateOnError = deToday
          Properties.ImmediatePost = True
          Properties.PostPopupValueOnTab = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          ShowHint = True
          Style.BorderStyle = ebsOffice11
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.SkinName = 'Office2007Green'
          Style.ButtonStyle = btsOffice11
          Style.ButtonTransparency = ebtNone
          Style.IsFontAssigned = True
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
          ParentFont = False
          ParentShowHint = False
          Properties.DateButtons = [btnToday]
          Properties.DateOnError = deToday
          Properties.ImmediatePost = True
          Properties.PostPopupValueOnTab = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          ShowHint = True
          Style.BorderStyle = ebsOffice11
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.SkinName = 'Office2007Green'
          Style.ButtonStyle = btsOffice11
          Style.ButtonTransparency = ebtNone
          Style.IsFontAssigned = True
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
          Top = 57
          Width = 64
          Height = 25
          Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
          Caption = #1055#1077#1088#1080#1086#1076
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = bTodayClick
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object bYesterday: TcxButton
          Left = 157
          Top = 31
          Width = 64
          Height = 25
          Caption = #1042#1095#1077#1088#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = bYesterdayClick
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object cbDates: TcxComboBox
          Left = 65
          Top = 60
          ParentFont = False
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
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.SkinName = 'Office2007Green'
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 2
          Width = 90
        end
        object cxLabel2: TcxLabel
          Left = 6
          Top = 61
          Caption = #1055#1077#1088#1080#1086#1076':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.SkinName = 'Office2007Green'
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          Transparent = True
        end
      end
      object paDate: TPanel
        Left = 12
        Top = 50
        Width = 227
        Height = 83
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object paDateButtons: TPanel
          Left = 5
          Top = 2
          Width = 217
          Height = 38
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
          object p1: TPanel
            Left = 50
            Top = 21
            Width = 17
            Height = 17
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
            OnClick = p1Click
          end
          object p2: TPanel
            Left = 67
            Top = 21
            Width = 17
            Height = 17
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
            OnClick = p2Click
          end
          object p3: TPanel
            Left = 84
            Top = 21
            Width = 17
            Height = 17
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 2
            OnClick = p3Click
          end
          object p4: TPanel
            Left = 101
            Top = 21
            Width = 17
            Height = 17
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 3
            OnClick = p4Click
          end
          object p5: TPanel
            Left = 118
            Top = 21
            Width = 17
            Height = 17
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 4
            OnClick = p5Click
          end
          object p6: TPanel
            Left = 135
            Top = 21
            Width = 17
            Height = 17
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 5
            OnClick = p6Click
          end
          object p7: TPanel
            Left = 152
            Top = 21
            Width = 17
            Height = 17
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 6
            OnClick = p7Click
          end
          object pMonth: TPanel
            Left = 0
            Top = 0
            Width = 217
            Height = 20
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 7
          end
        end
        object deDate: TcxDateEdit
          Left = 48
          Top = 50
          ParentFont = False
          ParentShowHint = False
          Properties.DateButtons = [btnToday]
          Properties.DateOnError = deToday
          Properties.ImmediatePost = True
          Properties.PostPopupValueOnTab = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.OnEditValueChanged = deDatePropertiesEditValueChanged
          ShowHint = True
          Style.BorderStyle = ebsOffice11
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.SkinName = 'Office2007Green'
          Style.ButtonStyle = btsOffice11
          Style.ButtonTransparency = ebtNone
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 1
          Width = 91
        end
        object cxLabel1: TcxLabel
          Left = 6
          Top = 52
          Caption = #1044#1072#1090#1072':'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.SkinName = ''
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = ''
          StyleFocused.LookAndFeel.SkinName = ''
          StyleHot.LookAndFeel.SkinName = ''
          Transparent = True
        end
        object bLWeek: TcxButton
          Left = 28
          Top = 22
          Width = 23
          Height = 19
          Caption = '<'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = bLWeekClick
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object bLMon: TcxButton
          Left = 5
          Top = 22
          Width = 23
          Height = 19
          Caption = '<<'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = bLMonClick
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object bRMon: TcxButton
          Left = 199
          Top = 22
          Width = 23
          Height = 19
          Caption = '>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = bRMonClick
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object bRWeek: TcxButton
          Left = 176
          Top = 22
          Width = 23
          Height = 19
          Caption = '>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = bRWeekClick
          LookAndFeel.SkinName = 'Office2007Green'
        end
      end
      object rb1: TcxRadioButton
        Left = 12
        Top = 27
        Width = 113
        Height = 17
        Caption = #1055#1086' '#1076#1072#1090#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = rb2Click
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 2
      Top = 284
      Width = 256
      Height = 8
      HotZoneClassName = 'TcxXPTaskBarStyle'
      HotZone.SizePercent = 59
      AlignSplitter = salTop
      Control = gbPeriod
    end
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 292
      Align = alClient
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1089#1086#1073#1099#1090#1080#1103#1084
      ParentFont = False
      Style.BorderStyle = ebsOffice11
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Black'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 2
      Height = 283
      Width = 256
      object rbAll: TcxRadioButton
        Left = 16
        Top = 26
        Width = 216
        Height = 17
        Caption = #1042#1089#1077' '#1089#1086#1073#1099#1090#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object rbStart: TcxRadioButton
        Tag = 1
        Left = 16
        Top = 48
        Width = 216
        Height = 17
        Caption = #1047#1072#1087#1091#1089#1082' '#1089#1077#1088#1074#1077#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object rbStop: TcxRadioButton
        Tag = 2
        Left = 16
        Top = 71
        Width = 215
        Height = 17
        Caption = #1054#1089#1090#1072#1085#1086#1074#1082#1072' '#1089#1077#1088#1074#1077#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object rbError: TcxRadioButton
        Tag = 3
        Left = 16
        Top = 93
        Width = 216
        Height = 17
        Caption = #1054#1096#1080#1073#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object rbEvents: TcxRadioButton
        Tag = 4
        Left = 16
        Top = 116
        Width = 215
        Height = 17
        Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077' '#1089#1086#1073#1099#1090#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object rbParamEdit: TcxRadioButton
        Tag = 5
        Left = 16
        Top = 139
        Width = 216
        Height = 17
        Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1089#1077#1088#1074#1077#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
    end
  end
  object paJournal: TJvPanel
    AlignWithMargins = True
    Left = 271
    Top = 3
    Width = 638
    Height = 577
    Margins.Left = 0
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    FlatBorderColor = clGradientActiveCaption
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object memLog: TcxMemo
      Left = 0
      Top = 363
      Align = alBottom
      ParentShowHint = False
      Properties.ScrollBars = ssVertical
      ShowHint = True
      Style.HotTrack = False
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.Shadow = False
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      Height = 214
      Width = 638
    end
    object cxSplitter2: TcxSplitter
      Left = 0
      Top = 355
      Width = 638
      Height = 8
      HotZoneClassName = 'TcxXPTaskBarStyle'
      HotZone.SizePercent = 60
      AlignSplitter = salBottom
      Control = memLog
    end
    object cxGr: TcxGrid
      AlignWithMargins = True
      Left = 0
      Top = 56
      Width = 638
      Height = 299
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      TabOrder = 2
      LookAndFeel.Kind = lfFlat
      object TVLOGS: TcxGridDBTableView
        PopupMenu = pmTV
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = sLogs
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = VEVENT
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object VDATE: TcxGridDBColumn
          Caption = #1044#1072#1090#1072
          DataBinding.FieldName = 'FD_DATE'
          Width = 69
        end
        object VEVENT: TcxGridDBColumn
          Caption = #1057#1086#1073#1099#1090#1080#1077
          DataBinding.FieldName = 'FC_NAME'
          Width = 628
        end
      end
      object cxGrLevel1: TcxGridLevel
        GridView = TVLOGS
      end
    end
    object dxBarDockControl1: TdxBarDockControl
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 632
      Height = 50
      Align = dalTop
      BarManager = BM
      SunkenBorder = True
      UseOwnSunkenBorder = True
    end
  end
  object cxSplitter3: TcxSplitter
    Left = 263
    Top = 0
    Width = 8
    Height = 583
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 59
    Control = paParam
  end
  object sLogs: TDataSource
    DataSet = dsLogs
    Left = 384
    Top = 296
  end
  object dsLogs: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT FK_ID,'
      '            FC_NAME,'
      '            FN_TYPE, '
      '            FD_DATE,'
      '            FC_REMARK '
      '  FROM EVENTS'
      'WHERE FD_DATE >= :PDATE'
      '     AND FD_DATE < :PDATE + 1'
      'ORDER BY FD_DATE DESC')
    AfterScroll = dsLogsAfterScroll
    BeforeOpen = dsLogsBeforeOpen
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 424
    Top = 296
    object dsLogsFK_ID: TFIBIntegerField
      FieldName = 'FK_ID'
    end
    object dsLogsFC_NAME: TFIBStringField
      FieldName = 'FC_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object dsLogsFN_TYPE: TFIBIntegerField
      FieldName = 'FN_TYPE'
    end
    object dsLogsFD_DATE: TFIBDateTimeField
      FieldName = 'FD_DATE'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object dsLogsFC_REMARK: TFIBStringField
      FieldName = 'FC_REMARK'
      Size = 10000
      EmptyStrToNull = True
    end
  end
  object dsLogsDates: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT FK_ID,'
      '            FC_NAME,'
      '            FN_TYPE, '
      '            FD_DATE,'
      '            FC_REMARK '
      '  FROM EVENTS'
      'WHERE FD_DATE >= :FD_DATE1'
      '    AND FD_DATE <= :FD_DATE2'
      'ORDER BY FD_DATE DESC')
    AfterScroll = dsLogsDatesAfterScroll
    BeforeOpen = dsLogsDatesBeforeOpen
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 480
    Top = 296
    object FIBIntegerField1: TFIBIntegerField
      FieldName = 'FK_ID'
    end
    object FIBStringField1: TFIBStringField
      FieldName = 'FC_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object FIBIntegerField2: TFIBIntegerField
      FieldName = 'FN_TYPE'
    end
    object FIBDateTimeField1: TFIBDateTimeField
      FieldName = 'FD_DATE'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object FIBStringField2: TFIBStringField
      FieldName = 'FC_REMARK'
      Size = 10000
      EmptyStrToNull = True
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
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 582
    Top = 51
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
      FloatLeft = 261
      FloatTop = 27
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
      AutoGrayScale = False
      HotGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
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
    object bbPrint: TdxBarLargeButton
      Action = aPrint
      Category = 0
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
    object bbClose: TdxBarLargeButton
      Action = aClose
      Category = 0
      AutoGrayScale = False
      HotGlyph.Data = {
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
    end
  end
  object al: TActionList
    Left = 414
    Top = 187
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1078#1091#1088#1085#1072#1083
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1078#1091#1088#1085#1072#1083#1072
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1078#1091#1088#1085#1072#1083' '#1089#1086#1073#1099#1090#1080#1081
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      Hint = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 5
      OnExecute = aTextExecute
    end
    object aWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 6
      OnExecute = aWebExecute
    end
    object aXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 7
      OnExecute = aXMLExecute
    end
    object aXLS: TAction
      Caption = 'Excel-'#1092#1072#1081#1083
      Hint = 'Excel-'#1092#1072#1081#1083
      ImageIndex = 8
      OnExecute = aXLSExecute
    end
  end
  object frxRep: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39937.727418599530000000
    ReportOptions.LastChange = 41191.427191226850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepGetValue
    Left = 824
    Top = 163
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 45.354360000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 755.906000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8211#1057#1107#1057#1026#1056#1029#1056#176#1056#187' '#1057#1027#1056#1109#1056#177#1057#8249#1057#8218#1056#1105#1056#8470' '#1056#176#1057#1026#1057#8230#1056#1105#1056#1030#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Top = 26.456710000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 128.504020000000000000
          Top = 26.456710000000000000
          Width = 623.622450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1109#1056#177#1057#8249#1057#8218#1056#1105#1056#181)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 124.724490000000000000
        Width = 755.906000000000000000
        DataSet = frxDB
        DataSetName = 'frxDB'
        RowCount = 0
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDB."FD_DATE"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 128.504020000000000000
          Width = 623.622450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDB."FC_NAME"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 204.094620000000000000
        Width = 755.906000000000000000
        object Memo8: TfrxMemoView
          Left = 604.724800000000000000
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 1.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Width = 604.724800000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 1.500000000000000000
          Memo.UTF8 = (
            '[DATESYS]')
          ParentFont = False
        end
      end
    end
  end
  object frxDB: TfrxDBDataset
    UserName = 'frxDB'
    CloseDataSource = False
    DataSet = dsLogs
    BCDToCurrency = False
    Left = 856
    Top = 163
  end
  object pmTV: TPopupMenu
    Left = 752
    Top = 138
    object N1: TMenuItem
      Action = aPrint
      Bitmap.Data = {
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
    end
    object MenuItem1: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 4
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
      ImageIndex = 9
      OnClick = N2Click
    end
  end
  object sdPopUp: TSaveDialog
    Left = 753
    Top = 187
  end
end
