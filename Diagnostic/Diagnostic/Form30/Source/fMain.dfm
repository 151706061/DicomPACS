object frmMain: TfrmMain
  Left = 47
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1060#1086#1088#1084#1099' 30. '#1043#1083#1072#1074#1072' 5 ('#1056#1077#1085#1090#1075#1077#1085#1086#1083#1086#1075#1080#1103') '
  ClientHeight = 700
  ClientWidth = 1264
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
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1258
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object cxPageControl1: TcxPageControl
    Left = 237
    Top = 34
    Width = 1027
    Height = 666
    ActivePage = cxTS_5110
    Align = alClient
    Style = 10
    TabOrder = 1
    ExplicitLeft = 236
    ExplicitTop = 28
    ExplicitHeight = 676
    ClientRectBottom = 666
    ClientRectRight = 1027
    ClientRectTop = 19
    object cxTS_5110: TcxTabSheet
      Tag = 1
      Caption = '5110'
      ImageIndex = 0
      ExplicitLeft = -2
      ExplicitTop = 25
      ExplicitWidth = 0
      ExplicitHeight = 0
      object e00_5110_1_3: TcxTextEdit
        Left = 328
        Top = 115
        Cursor = crArrow
        AutoSize = False
        Enabled = False
        ParentShowHint = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        ShowHint = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        StyleFocused.TextStyle = [fsBold]
        TabOrder = 0
        Height = 30
        Width = 65
      end
      object cxMemo1: TcxMemo
        Left = 3
        Top = 3
        Enabled = False
        Lines.Strings = (
          #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1077#1085#1090#1075#1077#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1093
          #1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1080' '#1087#1088#1086#1094#1077#1076#1091#1088)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 1
        Height = 89
        Width = 262
      end
      object cxMemo2: TcxMemo
        Left = 3
        Top = 115
        Enabled = False
        Lines.Strings = (
          #1056#1077#1085#1090#1075#1077#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103' '#1074#1089#1077#1075#1086)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 2
        Height = 30
        Width = 262
      end
      object cxMemo3: TcxMemo
        Left = 3
        Top = 144
        Enabled = False
        Lines.Strings = (
          '   '#1080#1079' '#1085#1080#1093' '#1074#1099#1087#1086#1083#1085#1077#1085#1086':'
          #1088#1077#1085#1090#1075#1077#1085#1086#1089#1082#1086#1087#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 3
        Height = 33
        Width = 262
      end
      object cxMemo4: TcxMemo
        Left = 3
        Top = 176
        Enabled = False
        Lines.Strings = (
          #1088#1077#1085#1090#1075#1077#1085#1086#1075#1088#1072#1084#1084' '#1085#1072' '#1087#1083#1105#1085#1082#1077)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 4
        Height = 33
        Width = 262
      end
      object cxMemo5: TcxMemo
        Left = 3
        Top = 208
        Enabled = False
        Lines.Strings = (
          #1088#1077#1085#1090#1075#1077#1085#1086#1075#1088#1072#1084#1084' '#1094#1080#1092#1088#1086#1074#1099#1093)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 5
        Height = 33
        Width = 262
      end
      object cxMemo6: TcxMemo
        Left = 3
        Top = 240
        Enabled = False
        Lines.Strings = (
          #1092#1083#1102#1086#1088#1086#1075#1088#1072#1084#1084' '#1089' '#1076#1080#1072#1075#1085#1086#1089#1090#1080#1095#1077#1089#1082#1086#1081' '#1094#1077#1083#1100#1102)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 6
        Height = 33
        Width = 262
      end
      object cxMemo7: TcxMemo
        Left = 3
        Top = 304
        Enabled = False
        Lines.Strings = (
          #1057#1087#1077#1094#1080#1072#1083#1100#1085#1099#1093' '#1088#1077#1085#1090#1075#1077#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
          #1074#1089#1077#1075#1086' ('#1080#1079' '#1089#1090#1088'. 01)')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 7
        Height = 33
        Width = 262
      end
      object cxMemo8: TcxMemo
        Left = 3
        Top = 336
        Enabled = False
        Lines.Strings = (
          '   '#1074' '#1090#1086#1084' '#1095#1080#1089#1083#1077':'
          #1083#1080#1085#1077#1081#1085#1099#1093' '#1090#1086#1084#1086#1075#1088#1072#1092#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 8
        Height = 33
        Width = 262
      end
      object cxMemo9: TcxMemo
        Left = 3
        Top = 368
        Enabled = False
        Lines.Strings = (
          #1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081', '#1089#1074#1103#1079#1072#1085#1085#1099#1093' '#1089' '#1082#1086#1085#1090#1088#1072#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077#1084)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 9
        Height = 33
        Width = 262
      end
      object cxMemo10: TcxMemo
        Left = 3
        Top = 400
        Enabled = False
        Lines.Strings = (
          #1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1074' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1099#1093' '#1091#1082#1083#1072#1076#1082#1072#1093)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 10
        Height = 33
        Width = 262
      end
      object cxMemo11: TcxMemo
        Left = 3
        Top = 432
        Enabled = False
        Lines.Strings = (
          #1050#1086#1084#1087#1100#1102#1090#1077#1088#1085#1099#1093' '#1090#1086#1084#1086#1075#1088#1072#1092#1080#1081' ('#1050#1058') - '#1074#1089#1077#1075#1086' ('#1080#1079' '#1089#1090#1088'. '
          '1)')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 11
        Height = 33
        Width = 262
      end
      object cxMemo12: TcxMemo
        Left = 264
        Top = 3
        Enabled = False
        Lines.Strings = (
          #8470' '#1089#1090#1088#1086#1082#1080)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 12
        Height = 89
        Width = 65
      end
      object cxMemo13: TcxMemo
        Left = 3
        Top = 91
        Enabled = False
        Lines.Strings = (
          '1')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 13
        Height = 25
        Width = 262
      end
      object cxMemo14: TcxMemo
        Left = 328
        Top = 3
        Enabled = False
        Lines.Strings = (
          #1042#1089#1077#1075#1086)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 14
        Height = 89
        Width = 65
      end
      object cxMemo15: TcxMemo
        Left = 392
        Top = 46
        Enabled = False
        Lines.Strings = (
          #1086#1088#1075#1072#1085#1086#1074
          #1075#1088#1091#1076#1085#1086#1081
          #1082#1083#1077#1090#1082#1080)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 15
        Height = 46
        Width = 65
      end
      object cxMemo16: TcxMemo
        Left = 456
        Top = 46
        Enabled = False
        Lines.Strings = (
          #1086#1088#1075#1072#1085#1086#1074
          #1087#1080#1097#1077#1074#1072#1088#1077#1085#1080#1103)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 16
        Height = 46
        Width = 81
      end
      object cxMemo17: TcxMemo
        Left = 536
        Top = 46
        Enabled = False
        Lines.Strings = (
          #1082#1086#1089#1090#1085#1086'-'
          #1089#1091#1089#1090#1072#1074#1085#1086#1081
          #1089#1080#1089#1090#1077#1084#1099)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 17
        Height = 46
        Width = 65
      end
      object cxMemo18: TcxMemo
        Left = 600
        Top = 46
        Enabled = False
        Lines.Strings = (
          #1087#1088#1086#1095#1080#1093
          #1086#1088#1075#1072#1085#1086#1074' '#1080
          #1089#1080#1089#1090#1077#1084)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 18
        Height = 46
        Width = 65
      end
      object cxMemo19: TcxMemo
        Left = 392
        Top = 3
        Enabled = False
        Lines.Strings = (
          #1074' '#1090#1086#1084' '#1095#1080#1089#1083#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 19
        Height = 44
        Width = 273
      end
      object cxMemo20: TcxMemo
        Left = 747
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1074' '#1076#1085#1077#1074#1085#1086#1084' '#1089#1090#1072#1094#1080#1086#1085#1072#1088#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 20
        Height = 23
        Width = 182
      end
      object cxMemo21: TcxMemo
        Left = 832
        Top = 46
        Enabled = False
        Lines.Strings = (
          #1089#1090#1072#1094#1080#1086#1085#1072#1088#1072)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 21
        Height = 46
        Width = 97
      end
      object cxMemo22: TcxMemo
        Left = 747
        Top = 46
        Enabled = False
        Lines.Strings = (
          #1040#1055#1059)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 22
        Height = 46
        Width = 86
      end
      object cxMemo23: TcxMemo
        Left = 264
        Top = 91
        Enabled = False
        Lines.Strings = (
          '2')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 23
        Height = 25
        Width = 65
      end
      object cxMemo24: TcxMemo
        Left = 328
        Top = 91
        Enabled = False
        Lines.Strings = (
          '3')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 24
        Height = 25
        Width = 65
      end
      object cxMemo25: TcxMemo
        Left = 392
        Top = 91
        Enabled = False
        Lines.Strings = (
          '4')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 25
        Height = 25
        Width = 65
      end
      object cxMemo26: TcxMemo
        Left = 456
        Top = 91
        Enabled = False
        Lines.Strings = (
          '5')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 26
        Height = 25
        Width = 81
      end
      object cxMemo27: TcxMemo
        Left = 536
        Top = 91
        Enabled = False
        Lines.Strings = (
          '6')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 27
        Height = 25
        Width = 65
      end
      object cxMemo28: TcxMemo
        Left = 600
        Top = 91
        Enabled = False
        Lines.Strings = (
          '7')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 28
        Height = 25
        Width = 65
      end
      object cxMemo29: TcxMemo
        Left = 664
        Top = 91
        Enabled = False
        Lines.Strings = (
          '8')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 29
        Height = 25
        Width = 84
      end
      object cxMemo30: TcxMemo
        Left = 747
        Top = 91
        Enabled = False
        Lines.Strings = (
          '9')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 30
        Height = 25
        Width = 86
      end
      object e10_5110_2_3: TcxTextEdit
        Tag = 1
        Left = 328
        Top = 144
        AutoSize = False
        Enabled = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 31
        OnMouseLeave = e10_5110_2_3MouseLeave
        OnMouseMove = e10_5110_2_3MouseMove
        Height = 33
        Width = 65
      end
      object e20_5110_3_3: TcxTextEdit
        Left = 328
        Top = 176
        AutoSize = False
        Enabled = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 32
        OnMouseLeave = e20_5110_3_3MouseLeave
        OnMouseMove = e20_5110_3_3MouseMove
        Height = 33
        Width = 65
      end
      object e30_5110_4_3: TcxTextEdit
        Left = 328
        Top = 208
        AutoSize = False
        Enabled = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 33
        OnMouseLeave = e30_5110_4_3MouseLeave
        OnMouseMove = e30_5110_4_3MouseMove
        Height = 33
        Width = 65
      end
      object e40_5110_5_3: TcxTextEdit
        Left = 328
        Top = 240
        AutoSize = False
        Enabled = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 34
        OnMouseLeave = e40_5110_5_3MouseLeave
        OnMouseMove = e40_5110_5_3MouseMove
        Height = 33
        Width = 65
      end
      object e60_5110_7_3: TcxTextEdit
        Left = 328
        Top = 336
        AutoSize = False
        Enabled = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 35
        OnMouseLeave = e60_5110_7_3MouseLeave
        OnMouseMove = e60_5110_7_3MouseMove
        Height = 33
        Width = 65
      end
      object e70_5110_8_3: TcxTextEdit
        Left = 328
        Top = 368
        AutoSize = False
        Enabled = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 36
        OnMouseLeave = e70_5110_8_3MouseLeave
        OnMouseMove = e70_5110_8_3MouseMove
        Height = 33
        Width = 65
      end
      object e80_5110_9_3: TcxTextEdit
        Left = 328
        Top = 400
        AutoSize = False
        Enabled = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 37
        OnMouseLeave = e80_5110_9_3MouseLeave
        OnMouseMove = e80_5110_9_3MouseMove
        Height = 33
        Width = 65
      end
      object e90_5110_10_3: TcxTextEdit
        Left = 328
        Top = 432
        AutoSize = False
        Enabled = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 38
        OnMouseLeave = e90_5110_10_3MouseLeave
        OnMouseMove = e90_5110_10_3MouseMove
        Height = 33
        Width = 65
      end
      object cxMemo31: TcxMemo
        Left = 264
        Top = 115
        Enabled = False
        Lines.Strings = (
          '01')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 39
        Height = 30
        Width = 65
      end
      object cxMemo32: TcxMemo
        Left = 264
        Top = 144
        Enabled = False
        Lines.Strings = (
          '02')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 40
        Height = 33
        Width = 65
      end
      object cxMemo33: TcxMemo
        Left = 264
        Top = 176
        Enabled = False
        Lines.Strings = (
          '03')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 41
        Height = 33
        Width = 65
      end
      object cxMemo34: TcxMemo
        Left = 264
        Top = 208
        Enabled = False
        Lines.Strings = (
          '04')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 42
        Height = 33
        Width = 65
      end
      object cxMemo35: TcxMemo
        Left = 264
        Top = 240
        Enabled = False
        Lines.Strings = (
          '05')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 43
        Height = 33
        Width = 65
      end
      object cxMemo36: TcxMemo
        Left = 264
        Top = 304
        Enabled = False
        Lines.Strings = (
          '06')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 44
        Height = 33
        Width = 65
      end
      object cxMemo37: TcxMemo
        Left = 264
        Top = 336
        Enabled = False
        Lines.Strings = (
          '07')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 45
        Height = 33
        Width = 65
      end
      object cxMemo38: TcxMemo
        Left = 264
        Top = 368
        Enabled = False
        Lines.Strings = (
          '08')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 46
        Height = 33
        Width = 65
      end
      object cxMemo39: TcxMemo
        Left = 264
        Top = 400
        Enabled = False
        Lines.Strings = (
          '09')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 47
        Height = 33
        Width = 65
      end
      object cxMemo40: TcxMemo
        Left = 264
        Top = 432
        Enabled = False
        Lines.Strings = (
          '10')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 48
        Height = 33
        Width = 65
      end
      object e01_5110_1_4: TcxTextEdit
        Left = 392
        Top = 115
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 49
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 30
        Width = 65
      end
      object e02_5110_1_5: TcxTextEdit
        Left = 456
        Top = 115
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 50
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 30
        Width = 81
      end
      object e03_5110_1_6: TcxTextEdit
        Left = 536
        Top = 115
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 51
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 30
        Width = 65
      end
      object e04_5110_1_7: TcxTextEdit
        Left = 600
        Top = 115
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 52
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 30
        Width = 65
      end
      object e05_5110_1_8: TcxTextEdit
        Left = 664
        Top = 115
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 53
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 30
        Width = 84
      end
      object e06_5110_1_9: TcxTextEdit
        Left = 747
        Top = 115
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 54
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 30
        Width = 86
      end
      object e11_5110_2_4: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 144
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 55
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e21_5110_3_4: TcxTextEdit
        Left = 392
        Top = 176
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 56
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e31_5110_4_4: TcxTextEdit
        Left = 392
        Top = 208
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 57
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e61_5110_7_4: TcxTextEdit
        Left = 392
        Top = 336
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 58
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e71_5110_8_4: TcxTextEdit
        Left = 392
        Top = 368
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 59
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e81_5110_9_4: TcxTextEdit
        Left = 392
        Top = 400
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 60
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e41_5110_5_4: TcxTextEdit
        Left = 392
        Top = 240
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 61
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e91_5110_10_4: TcxTextEdit
        Left = 392
        Top = 432
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 62
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e12_5110_2_5: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 144
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 63
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e22_5110_3_5: TcxTextEdit
        Left = 456
        Top = 176
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 64
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e32_5110_4_5: TcxTextEdit
        Left = 456
        Top = 208
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 65
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e62_5110_7_5: TcxTextEdit
        Left = 456
        Top = 336
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 66
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e72_5110_8_5: TcxTextEdit
        Left = 456
        Top = 368
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 67
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e82_5110_9_5: TcxTextEdit
        Left = 456
        Top = 400
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 68
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e92_5110_10_5: TcxTextEdit
        Left = 456
        Top = 432
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 69
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e42_5110_5_5: TcxTextEdit
        Left = 456
        Top = 240
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 70
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e13_5110_2_6: TcxTextEdit
        Tag = 1
        Left = 536
        Top = 144
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 71
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e23_5110_3_6: TcxTextEdit
        Left = 536
        Top = 176
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 72
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e33_5110_4_6: TcxTextEdit
        Left = 536
        Top = 208
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 73
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e43_5110_5_6: TcxTextEdit
        Left = 536
        Top = 240
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 74
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e13_5110_2_7: TcxTextEdit
        Tag = 1
        Left = 600
        Top = 144
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 75
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e24_5110_3_7: TcxTextEdit
        Left = 600
        Top = 176
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 76
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e34_5110_4_7: TcxTextEdit
        Left = 600
        Top = 208
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 77
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e44_5110_5_7: TcxTextEdit
        Left = 600
        Top = 240
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 78
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e63_5110_7_6: TcxTextEdit
        Left = 536
        Top = 336
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 79
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e73_5110_8_6: TcxTextEdit
        Left = 536
        Top = 368
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 80
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e83_5110_9_6: TcxTextEdit
        Left = 536
        Top = 400
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 81
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e93_5110_10_6: TcxTextEdit
        Left = 536
        Top = 432
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 82
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e64_5110_7_7: TcxTextEdit
        Left = 600
        Top = 336
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 83
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e74_5110_8_7: TcxTextEdit
        Left = 600
        Top = 368
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 84
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e84_5110_9_7: TcxTextEdit
        Left = 600
        Top = 400
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 85
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e94_5110_10_7: TcxTextEdit
        Left = 600
        Top = 432
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 86
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e15_5110_2_8: TcxTextEdit
        Tag = 1
        Left = 664
        Top = 144
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 87
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 84
      end
      object e25_5110_3_8: TcxTextEdit
        Left = 664
        Top = 176
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 88
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 84
      end
      object e35_5110_4_8: TcxTextEdit
        Left = 664
        Top = 208
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 89
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 84
      end
      object e45_5110_5_8: TcxTextEdit
        Left = 664
        Top = 240
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 90
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 84
      end
      object e16_5110_2_9: TcxTextEdit
        Tag = 1
        Left = 747
        Top = 144
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 91
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 86
      end
      object e26_5110_3_9: TcxTextEdit
        Left = 747
        Top = 176
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 92
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 86
      end
      object e36_5110_4_9: TcxTextEdit
        Left = 747
        Top = 208
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 93
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 86
      end
      object e46_5110_5_9: TcxTextEdit
        Left = 747
        Top = 240
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 94
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 86
      end
      object e65_5110_7_8: TcxTextEdit
        Left = 664
        Top = 336
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 95
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 84
      end
      object e75_5110_8_8: TcxTextEdit
        Left = 664
        Top = 368
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 96
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 84
      end
      object e85_5110_9_8: TcxTextEdit
        Left = 664
        Top = 400
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 97
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 84
      end
      object e95_5110_10_8: TcxTextEdit
        Left = 664
        Top = 432
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 98
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 84
      end
      object e66_5110_7_9: TcxTextEdit
        Left = 747
        Top = 336
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 99
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 86
      end
      object e76_5110_8_9: TcxTextEdit
        Left = 747
        Top = 368
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 100
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 86
      end
      object e86_5110_9_9: TcxTextEdit
        Left = 747
        Top = 400
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 101
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 86
      end
      object e96_5110_10_9: TcxTextEdit
        Left = 747
        Top = 432
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 102
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 86
      end
      object e50_5110_6_3: TcxTextEdit
        Left = 328
        Top = 304
        AutoSize = False
        Enabled = False
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Style.Color = clGradientActiveCaption
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 103
        OnMouseLeave = e50_5110_6_3MouseLeave
        OnMouseMove = e50_5110_6_3MouseMove
        Height = 33
        Width = 65
      end
      object e51_5110_6_4: TcxTextEdit
        Left = 392
        Top = 304
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Style.Color = clWindow
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 104
        OnMouseLeave = e51_5110_6_4MouseLeave
        OnMouseMove = e51_5110_6_4MouseMove
        Height = 33
        Width = 65
      end
      object e53_5110_6_6: TcxTextEdit
        Left = 536
        Top = 304
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Style.Color = clWindow
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 105
        OnMouseLeave = e53_5110_6_6MouseLeave
        OnMouseMove = e53_5110_6_6MouseMove
        Height = 33
        Width = 65
      end
      object e54_5110_6_7: TcxTextEdit
        Left = 600
        Top = 304
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Style.Color = clWindow
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 106
        OnMouseLeave = e54_5110_6_7MouseLeave
        OnMouseMove = e54_5110_6_7MouseMove
        Height = 33
        Width = 65
      end
      object e52_5110_6_5: TcxTextEdit
        Left = 456
        Top = 304
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Style.Color = clWindow
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 107
        OnMouseLeave = e52_5110_6_5MouseLeave
        OnMouseMove = e52_5110_6_5MouseMove
        Height = 33
        Width = 81
      end
      object e55_5110_6_8: TcxTextEdit
        Left = 664
        Top = 304
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Style.Color = clWindow
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 108
        OnMouseLeave = e55_5110_6_8MouseLeave
        OnMouseMove = e55_5110_6_8MouseMove
        Height = 33
        Width = 84
      end
      object e56_5110_6_9: TcxTextEdit
        Left = 747
        Top = 304
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Style.Color = clWindow
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 109
        OnMouseLeave = e56_5110_6_9MouseLeave
        OnMouseMove = e56_5110_6_9MouseMove
        Height = 33
        Width = 86
      end
      object cxMemo135: TcxMemo
        Left = 3
        Top = 464
        Enabled = False
        Lines.Strings = (
          '   '#1074' '#1090#1086#1084' '#1095#1080#1089#1083#1077':'
          '   '#1089' '#1074#1085#1091#1090#1088#1080#1074#1077#1085#1085#1099#1084' '#1082#1086#1085#1090#1088#1072#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077#1084' '#1073#1077#1079
          '   '#1073#1086#1083#1102#1089#1085#1086#1075#1086' '#1074#1074#1077#1076#1077#1085#1080#1103)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 110
        Height = 49
        Width = 262
      end
      object cxMemo136: TcxMemo
        Left = 3
        Top = 512
        Enabled = False
        Lines.Strings = (
          '   '#1089' '#1074#1085#1091#1090#1088#1080#1074#1077#1085#1085#1099#1084' '#1073#1086#1083#1102#1089#1085#1099#1084' '
          '   '#1082#1086#1085#1090#1088#1072#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077#1084
          '   ')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 111
        Height = 33
        Width = 262
      end
      object cxMemo137: TcxMemo
        Left = 264
        Top = 464
        Enabled = False
        Lines.Strings = (
          '10.1')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 112
        Height = 49
        Width = 65
      end
      object cxMemo138: TcxMemo
        Left = 264
        Top = 512
        Enabled = False
        Lines.Strings = (
          '10.2')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 113
        Height = 33
        Width = 65
      end
      object cxTextEdit1: TcxTextEdit
        Left = 328
        Top = 464
        AutoSize = False
        Enabled = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 114
        OnMouseLeave = e90_5110_10_3MouseLeave
        OnMouseMove = e90_5110_10_3MouseMove
        Height = 49
        Width = 65
      end
      object e101_5110_11_4: TcxTextEdit
        Left = 392
        Top = 464
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 115
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 49
        Width = 65
      end
      object e102_5110_11_5: TcxTextEdit
        Left = 456
        Top = 464
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 116
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 49
        Width = 81
      end
      object e103_5110_11_6: TcxTextEdit
        Left = 536
        Top = 464
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 117
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 49
        Width = 65
      end
      object e104_5110_11_7: TcxTextEdit
        Left = 600
        Top = 464
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 118
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 49
        Width = 65
      end
      object e105_5110_11_8: TcxTextEdit
        Left = 664
        Top = 464
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 119
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 49
        Width = 84
      end
      object e106_5110_11_9: TcxTextEdit
        Left = 747
        Top = 464
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 120
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 49
        Width = 86
      end
      object cxTextEdit8: TcxTextEdit
        Left = 328
        Top = 512
        AutoSize = False
        Enabled = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 121
        OnMouseLeave = e90_5110_10_3MouseLeave
        OnMouseMove = e90_5110_10_3MouseMove
        Height = 33
        Width = 65
      end
      object e111_5110_12_4: TcxTextEdit
        Left = 392
        Top = 512
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 122
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e112_5110_12_5: TcxTextEdit
        Left = 456
        Top = 512
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 123
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e113_5110_12_6: TcxTextEdit
        Left = 536
        Top = 512
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 124
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e114_5110_12_7: TcxTextEdit
        Left = 600
        Top = 512
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 125
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e115_5110_12_8: TcxTextEdit
        Left = 664
        Top = 512
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 126
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 84
      end
      object e116_5110_12_9: TcxTextEdit
        Left = 747
        Top = 512
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 127
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 86
      end
      object cxMemo139: TcxMemo
        Left = 664
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1087#1088#1086#1074#1077#1076#1077#1085#1086' '#1074
          #1040#1055#1059)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 128
        Height = 68
        Width = 84
      end
      object cxMemo140: TcxMemo
        Left = 832
        Top = 91
        Enabled = False
        Lines.Strings = (
          '10')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 129
        Height = 25
        Width = 97
      end
      object e07_5110_1_10: TcxTextEdit
        Left = 832
        Top = 115
        AutoSize = False
        PopupMenu = pmSpec
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 130
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 30
        Width = 97
      end
      object e17_5110_2_10: TcxTextEdit
        Left = 832
        Top = 144
        AutoSize = False
        PopupMenu = pmSpec
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 131
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 97
      end
      object e27_5110_3_10: TcxTextEdit
        Left = 832
        Top = 176
        AutoSize = False
        PopupMenu = pmSpec
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 132
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 97
      end
      object e37_5110_4_10: TcxTextEdit
        Left = 832
        Top = 208
        AutoSize = False
        PopupMenu = pmSpec
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 133
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 97
      end
      object e47_5110_5_10: TcxTextEdit
        Left = 832
        Top = 240
        AutoSize = False
        PopupMenu = pmSpec
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 134
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 97
      end
      object e67_5110_7_10: TcxTextEdit
        Left = 832
        Top = 336
        AutoSize = False
        PopupMenu = pmSpec
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 135
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 97
      end
      object e77_5110_8_10: TcxTextEdit
        Left = 832
        Top = 368
        AutoSize = False
        PopupMenu = pmSpec
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 136
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 97
      end
      object e87_5110_9_10: TcxTextEdit
        Left = 832
        Top = 400
        AutoSize = False
        PopupMenu = pmSpec
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 137
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 97
      end
      object e97_5110_10_10: TcxTextEdit
        Left = 832
        Top = 432
        AutoSize = False
        PopupMenu = pmSpec
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 138
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 97
      end
      object e107_5110_11_10: TcxTextEdit
        Left = 832
        Top = 464
        AutoSize = False
        PopupMenu = pmSpec
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 139
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 49
        Width = 97
      end
      object e117_5110_12_10: TcxTextEdit
        Left = 832
        Top = 512
        AutoSize = False
        PopupMenu = pmSpec
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 140
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 97
      end
      object e57_5110_6_10: TcxTextEdit
        Left = 832
        Top = 304
        AutoSize = False
        PopupMenu = pmSpec
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Style.Color = clWindow
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 141
        OnMouseLeave = e56_5110_6_9MouseLeave
        OnMouseMove = e56_5110_6_9MouseMove
        Height = 33
        Width = 97
      end
      object cxMemo161: TcxMemo
        Left = 664
        Top = 3
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1086#1073#1097#1077#1075#1086' '#1095#1080#1089#1083#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' ('#1080#1079' '#1075#1088'. 3)')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 142
        Height = 23
        Width = 265
      end
      object cxMemo162: TcxMemo
        Left = 3
        Top = 544
        Enabled = False
        Lines.Strings = (
          '   '#1073#1077#1079' '#1074#1085#1091#1090#1088#1080#1074#1077#1085#1085#1086#1075#1086' '#1082#1086#1085#1090#1088#1072#1089#1090#1080#1088#1086#1074#1072#1085#1080#1103
          '   ')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 143
        Height = 33
        Width = 262
      end
      object cxMemo163: TcxMemo
        Left = 264
        Top = 544
        Enabled = False
        Lines.Strings = (
          '10.3')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 144
        Height = 33
        Width = 65
      end
      object cxTextEdit2: TcxTextEdit
        Left = 328
        Top = 544
        AutoSize = False
        Enabled = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 145
        Height = 33
        Width = 65
      end
      object e121_5110_13_4: TcxTextEdit
        Left = 392
        Top = 544
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 146
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e122_5110_13_5: TcxTextEdit
        Left = 456
        Top = 544
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 147
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e123_5110_13_6: TcxTextEdit
        Left = 536
        Top = 544
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 148
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e124_5110_13_7: TcxTextEdit
        Left = 600
        Top = 544
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 149
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e125_5110_13_8: TcxTextEdit
        Left = 664
        Top = 544
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 150
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 84
      end
      object e126_5110_13_9: TcxTextEdit
        Left = 747
        Top = 544
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 151
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 86
      end
      object e127_5110_13_10: TcxTextEdit
        Left = 832
        Top = 544
        AutoSize = False
        PopupMenu = pmSpec
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 152
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 97
      end
      object cxMemo141: TcxMemo
        Left = 3
        Top = 272
        Enabled = False
        Lines.Strings = (
          '           '#1080#1079' '#1085#1080#1093' '#1094#1080#1092#1088#1086#1074#1099#1093)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 153
        Height = 33
        Width = 262
      end
      object cxMemo148: TcxMemo
        Left = 264
        Top = 272
        Enabled = False
        Lines.Strings = (
          '05.1')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 154
        Height = 33
        Width = 65
      end
      object cxTextEdit3: TcxTextEdit
        Left = 328
        Top = 272
        AutoSize = False
        Enabled = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 155
        OnMouseLeave = e40_5110_5_3MouseLeave
        OnMouseMove = e40_5110_5_3MouseMove
        Height = 33
        Width = 65
      end
      object e131_5110_14_4: TcxTextEdit
        Left = 392
        Top = 272
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 156
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e132_5110_14_5: TcxTextEdit
        Left = 456
        Top = 272
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 157
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e133_5110_14_6: TcxTextEdit
        Left = 536
        Top = 272
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 158
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e134_5110_14_7: TcxTextEdit
        Left = 600
        Top = 272
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 159
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e135_5110_14_8: TcxTextEdit
        Left = 664
        Top = 272
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 160
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 84
      end
      object e136_5110_14_9: TcxTextEdit
        Left = 747
        Top = 272
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 161
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 86
      end
      object e137_5110_14_10: TcxTextEdit
        Left = 832
        Top = 272
        AutoSize = False
        PopupMenu = pmSpec
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 162
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 97
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = '5111'
      ImageIndex = 1
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxMemo41: TcxMemo
        Left = 3
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1048#1079' '#1095#1080#1089#1083#1072' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1080' '#1087#1088#1086#1094#1077#1076#1091#1088' ('#1080#1079' '
          #1089#1090#1088'. 06) '#1087#1088#1086#1074#1077#1076#1077#1085#1086':')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 0
        Height = 41
        Width = 278
      end
      object cxMemo42: TcxMemo
        Left = 3
        Top = 40
        Enabled = False
        Lines.Strings = (
          #1072#1085#1075#1080#1086#1082#1072#1088#1076#1080#1086#1075#1088#1072#1092#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 1
        Height = 30
        Width = 278
      end
      object cxMemo43: TcxMemo
        Left = 3
        Top = 69
        Enabled = False
        Lines.Strings = (
          #1072#1085#1075#1080#1086#1075#1088#1072#1092#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 2
        Height = 30
        Width = 278
      end
      object cxMemo44: TcxMemo
        Left = 3
        Top = 98
        Enabled = False
        Lines.Strings = (
          #1088#1077#1085#1090#1075#1077#1085#1086#1093#1080#1088#1091#1088#1075#1080#1095#1077#1089#1082#1080#1093' '#1083#1077#1095#1077#1073#1085#1099#1093' '#1074#1084#1077#1096#1072#1090#1077#1083#1100#1089#1090#1074)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 3
        Height = 30
        Width = 278
      end
      object cxMemo45: TcxMemo
        Left = 3
        Top = 127
        Enabled = False
        Lines.Strings = (
          #1048#1079' '#1095#1080#1089#1083#1072' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' ('#1089#1090#1088'. 06) '
          #1087#1088#1086#1074#1077#1076#1077#1085#1086' '#1072#1084#1073#1091#1083#1072#1090#1086#1088#1085#1099#1084' '#1073#1086#1083#1100#1085#1099#1084)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 4
        Height = 34
        Width = 278
      end
      object cxMemo46: TcxMemo
        Left = 280
        Top = 0
        Enabled = False
        Lines.Strings = (
          #8470)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 5
        Height = 41
        Width = 41
      end
      object cxMemo47: TcxMemo
        Left = 280
        Top = 40
        Enabled = False
        Lines.Strings = (
          '01')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 6
        Height = 30
        Width = 41
      end
      object cxMemo48: TcxMemo
        Left = 280
        Top = 69
        Enabled = False
        Lines.Strings = (
          '02')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 7
        Height = 30
        Width = 41
      end
      object cxMemo49: TcxMemo
        Left = 280
        Top = 98
        Enabled = False
        Lines.Strings = (
          '03')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 8
        Height = 30
        Width = 41
      end
      object cxMemo50: TcxMemo
        Left = 280
        Top = 127
        Enabled = False
        Lines.Strings = (
          '04')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 9
        Height = 34
        Width = 41
      end
      object e00_5111_1: TcxTextEdit
        Left = 320
        Top = 40
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 10
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 30
        Width = 65
      end
      object e10_5111_2: TcxTextEdit
        Left = 320
        Top = 69
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 11
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 30
        Width = 65
      end
      object e20_5111_3: TcxTextEdit
        Left = 320
        Top = 98
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 12
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 30
        Width = 65
      end
      object e30_5111_4: TcxTextEdit
        Left = 320
        Top = 127
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 13
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 34
        Width = 65
      end
      object cxMemo153: TcxMemo
        Left = 3
        Top = 160
        Enabled = False
        Lines.Strings = (
          #1088#1077#1085#1090#1075#1077#1085#1086#1101#1085#1076#1086#1074#1072#1089#1082#1091#1083#1103#1088#1085#1099#1093' '#1086#1073#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 14
        Height = 34
        Width = 278
      end
      object cxMemo154: TcxMemo
        Left = 3
        Top = 193
        Enabled = False
        Lines.Strings = (
          #1074' '#1090#1086#1084' '#1095#1080#1089#1083#1077' '#1073#1086#1083#1100#1085#1099#1084' '#1080#1085#1092#1072#1088#1082#1090#1086#1084' '#1084#1080#1086#1082#1072#1088#1076#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 15
        Height = 34
        Width = 278
      end
      object cxMemo155: TcxMemo
        Left = 3
        Top = 226
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1085#1080#1093' '#1074' '#1087#1077#1088#1074#1099#1077' 90 '#1084#1080#1085#1091#1090' '#1086#1090' '#1084#1086#1084#1077#1085#1090#1072' '
          #1075#1086#1089#1087#1080#1090#1072#1083#1080#1079#1072#1094#1080#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 16
        Height = 34
        Width = 278
      end
      object cxMemo156: TcxMemo
        Left = 3
        Top = 259
        Enabled = False
        Lines.Strings = (
          #1080#1096#1077#1084#1080#1095#1077#1089#1082#1080#1084' '#1080#1085#1089#1091#1083#1100#1090#1086#1084)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 17
        Height = 34
        Width = 278
      end
      object cxMemo157: TcxMemo
        Left = 280
        Top = 160
        Enabled = False
        Lines.Strings = (
          '05')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 18
        Height = 34
        Width = 41
      end
      object cxMemo158: TcxMemo
        Left = 280
        Top = 193
        Enabled = False
        Lines.Strings = (
          '06')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 19
        Height = 34
        Width = 41
      end
      object cxMemo159: TcxMemo
        Left = 280
        Top = 226
        Enabled = False
        Lines.Strings = (
          '07')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 20
        Height = 34
        Width = 41
      end
      object cxMemo160: TcxMemo
        Left = 280
        Top = 259
        Enabled = False
        Lines.Strings = (
          '08')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 21
        Height = 34
        Width = 41
      end
      object e40_5111_5: TcxTextEdit
        Left = 320
        Top = 160
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 22
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 34
        Width = 65
      end
      object e50_5111_6: TcxTextEdit
        Left = 320
        Top = 193
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 23
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 34
        Width = 65
      end
      object e60_5111_7: TcxTextEdit
        Left = 320
        Top = 226
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 24
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 34
        Width = 65
      end
      object e70_5111_8: TcxTextEdit
        Left = 320
        Top = 259
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 25
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 34
        Width = 65
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = '5112'
      ImageIndex = 2
      ExplicitLeft = -2
      ExplicitTop = 25
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxMemo51: TcxMemo
        Left = 3
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1048#1079' '#1086#1073#1097#1077#1075#1086' '#1095#1080#1089#1083#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' ('#1090'. 5110, '#1089#1090#1088'. 01) '
          #1074#1099#1087#1086#1083#1085#1077#1085#1086' '#1087#1077#1088#1077#1076#1074#1080#1078#1085#1099#1084#1080' '#1072#1087#1087#1072#1088#1072#1090#1072#1084#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 0
        Height = 33
        Width = 310
      end
      object cxMemo52: TcxMemo
        Left = 3
        Top = 32
        Enabled = False
        Lines.Strings = (
          #1074' '#1090'.'#1095'. '#1088#1077#1085#1090#1075#1077#1085#1086#1090#1077#1083#1077#1074#1080#1079#1080#1086#1085#1085#1099#1084#1080' '#1091#1089#1090#1072#1085#1086#1074#1082#1072#1084#1080' '#1090#1080#1087#1072' '#1057'-'#1044#1091#1075#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 1
        Height = 33
        Width = 310
      end
      object cxMemo53: TcxMemo
        Left = 3
        Top = 64
        Enabled = False
        Lines.Strings = (
          #1048#1079' '#1086#1073#1097#1077#1075#1086' '#1095#1080#1089#1083#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' ('#1089#1090#1088'. 01) '#1074#1099#1087#1086#1083#1085#1077#1085#1086' '
          #1040#1055#1059' '#1074#1089#1077#1075#1086)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 2
        Height = 33
        Width = 310
      end
      object cxMemo54: TcxMemo
        Left = 3
        Top = 96
        Enabled = False
        Lines.Strings = (
          #1074' '#1090'.'#1095'. '#1086#1088#1075#1072#1085#1086#1074' '#1075#1088#1091#1076#1085#1086#1081' '#1082#1083#1077#1090#1082#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 3
        Height = 33
        Width = 310
      end
      object cxMemo55: TcxMemo
        Left = 3
        Top = 128
        Enabled = False
        Lines.Strings = (
          #1086#1088#1075#1072#1085#1086#1074' '#1087#1080#1097#1077#1074#1072#1088#1077#1085#1080#1103)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 4
        Height = 33
        Width = 310
      end
      object cxMemo56: TcxMemo
        Left = 3
        Top = 160
        Enabled = False
        Lines.Strings = (
          #1082#1086#1089#1090#1085#1086'-'#1089#1091#1089#1090#1072#1074#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1099)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 5
        Height = 33
        Width = 310
      end
      object cxMemo57: TcxMemo
        Left = 3
        Top = 192
        Enabled = False
        Lines.Strings = (
          #1087#1088#1086#1095#1080#1093' '#1086#1088#1075#1072#1085#1086#1074)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 6
        Height = 33
        Width = 310
      end
      object cxMemo58: TcxMemo
        Left = 312
        Top = 0
        Enabled = False
        Lines.Strings = (
          '01')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 7
        Height = 33
        Width = 41
      end
      object cxMemo59: TcxMemo
        Left = 312
        Top = 32
        Enabled = False
        Lines.Strings = (
          '02')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 8
        Height = 33
        Width = 41
      end
      object cxMemo60: TcxMemo
        Left = 312
        Top = 64
        Enabled = False
        Lines.Strings = (
          '03')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 9
        Height = 33
        Width = 41
      end
      object cxMemo61: TcxMemo
        Left = 312
        Top = 96
        Enabled = False
        Lines.Strings = (
          '04')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 10
        Height = 33
        Width = 41
      end
      object cxMemo62: TcxMemo
        Left = 312
        Top = 128
        Enabled = False
        Lines.Strings = (
          '05')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 11
        Height = 33
        Width = 41
      end
      object cxMemo63: TcxMemo
        Left = 312
        Top = 160
        Enabled = False
        Lines.Strings = (
          '06')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 12
        Height = 33
        Width = 41
      end
      object cxMemo64: TcxMemo
        Left = 312
        Top = 192
        Enabled = False
        Lines.Strings = (
          '07')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 13
        Height = 33
        Width = 41
      end
      object e00_5112_1: TcxTextEdit
        Left = 352
        Top = 0
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 14
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e10_5112_2: TcxTextEdit
        Left = 352
        Top = 32
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 15
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e20_5112_3: TcxTextEdit
        Left = 352
        Top = 64
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 16
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e30_5112_4: TcxTextEdit
        Left = 352
        Top = 96
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 17
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e40_5112_5: TcxTextEdit
        Left = 352
        Top = 128
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 18
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e50_5112_6: TcxTextEdit
        Left = 352
        Top = 160
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 19
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e60_5112_7: TcxTextEdit
        Left = 352
        Top = 192
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 20
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object cxMemo164: TcxMemo
        Left = 3
        Top = 224
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1095#1080#1089#1083#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1087#1088#1086#1095#1080#1093' '#1086#1088#1075#1072#1085#1086#1074' '#1080' '#1089#1080#1089#1090#1077#1084' ('#1080#1079' '#1075#1088'.7) '
          #1074#1099#1087#1086#1083#1085#1077#1085#1086': '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1095#1077#1088#1077#1087#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 21
        Height = 33
        Width = 310
      end
      object cxMemo165: TcxMemo
        Left = 3
        Top = 256
        Enabled = False
        Lines.Strings = (
          #1084#1072#1084#1084#1086#1075#1088#1072#1092#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 22
        Height = 33
        Width = 310
      end
      object cxMemo166: TcxMemo
        Left = 3
        Top = 288
        Enabled = False
        Lines.Strings = (
          #1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1087#1086#1095#1077#1082' '#1080' '#1084#1086#1095#1077#1074#1099#1074#1086#1076#1103#1097#1080#1093' '#1087#1091#1090#1077#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 23
        Height = 33
        Width = 310
      end
      object cxMemo167: TcxMemo
        Left = 3
        Top = 320
        Enabled = False
        Lines.Strings = (
          #1095#1077#1083#1102#1089#1090#1085#1086'-'#1083#1080#1094#1077#1074#1086#1081' '#1086#1073#1083#1072#1089#1090#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 24
        Height = 33
        Width = 310
      end
      object cxMemo168: TcxMemo
        Left = 3
        Top = 352
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1085#1080#1093' '#1079#1091#1073#1086#1074)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 25
        Height = 33
        Width = 310
      end
      object cxMemo169: TcxMemo
        Left = 312
        Top = 224
        Enabled = False
        Lines.Strings = (
          '08')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 26
        Height = 33
        Width = 41
      end
      object cxMemo170: TcxMemo
        Left = 312
        Top = 256
        Enabled = False
        Lines.Strings = (
          '09')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 27
        Height = 33
        Width = 41
      end
      object cxMemo171: TcxMemo
        Left = 312
        Top = 288
        Enabled = False
        Lines.Strings = (
          '10')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 28
        Height = 33
        Width = 41
      end
      object cxMemo172: TcxMemo
        Left = 312
        Top = 320
        Enabled = False
        Lines.Strings = (
          '11')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 29
        Height = 33
        Width = 41
      end
      object cxMemo173: TcxMemo
        Left = 312
        Top = 352
        Enabled = False
        Lines.Strings = (
          '12')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 30
        Height = 33
        Width = 41
      end
      object e70_5112_8: TcxTextEdit
        Left = 352
        Top = 224
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 31
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e80_5112_9: TcxTextEdit
        Left = 352
        Top = 256
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 32
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e90_5112_10: TcxTextEdit
        Left = 352
        Top = 288
        AutoSize = False
        PopupMenu = pmSpecial4One
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 33
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e100_5112_11: TcxTextEdit
        Left = 352
        Top = 320
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 34
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e110_5112_12: TcxTextEdit
        Left = 352
        Top = 352
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 35
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = '5113'
      ImageIndex = 3
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxMemo65: TcxMemo
        Left = 3
        Top = 55
        Enabled = False
        Lines.Strings = (
          
            #1048#1079' '#1086#1073#1097#1077#1075#1086' '#1095#1080#1089#1083#1072' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1085#1099#1093' '#1090#1086#1084#1086#1075#1088#1072#1092#1080#1081' ('#1080#1079' '#1090#1072#1073'. 5110, '#1089#1090#1088'.10) '#1074 +
            #1099#1087#1086#1083#1085#1077#1085#1086' '#1050#1058
          #1089#1077#1088#1076#1094#1072' '#1080' '#1082#1086#1088#1086#1085#1072#1088#1085#1099#1093' '#1089#1086#1089#1091#1076#1086#1074)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 0
        Height = 33
        Width = 430
      end
      object cxMemo71: TcxMemo
        Left = 432
        Top = 0
        Enabled = False
        Lines.Strings = (
          #8470
          #1089#1090#1088#1086#1082#1080)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 1
        Height = 33
        Width = 49
      end
      object cxMemo72: TcxMemo
        Left = 432
        Top = 55
        Enabled = False
        Lines.Strings = (
          '01')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 2
        Height = 33
        Width = 49
      end
      object cxMemo73: TcxMemo
        Left = 432
        Top = 87
        Enabled = False
        Lines.Strings = (
          '02')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 3
        Height = 33
        Width = 49
      end
      object cxMemo74: TcxMemo
        Left = 432
        Top = 119
        Enabled = False
        Lines.Strings = (
          '03')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 4
        Height = 33
        Width = 49
      end
      object cxMemo75: TcxMemo
        Left = 432
        Top = 151
        Enabled = False
        Lines.Strings = (
          '04')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 5
        Height = 33
        Width = 49
      end
      object cxMemo76: TcxMemo
        Left = 432
        Top = 183
        Enabled = False
        Lines.Strings = (
          '05')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 6
        Height = 33
        Width = 49
      end
      object e00_5113_1_3: TcxTextEdit
        Left = 480
        Top = 55
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 7
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e10_5113_2_3: TcxTextEdit
        Left = 480
        Top = 87
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 8
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e20_5113_3_3: TcxTextEdit
        Left = 480
        Top = 119
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 9
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e30_5113_4_3: TcxTextEdit
        Left = 480
        Top = 151
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 10
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e40_5113_5_3: TcxTextEdit
        Left = 480
        Top = 183
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 11
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object cxMemo142: TcxMemo
        Left = 3
        Top = 87
        Enabled = False
        Lines.Strings = (
          #1075#1086#1083#1086#1074#1085#1086#1075#1086' '#1084#1086#1079#1075#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 12
        Height = 33
        Width = 430
      end
      object cxMemo143: TcxMemo
        Left = 3
        Top = 119
        Enabled = False
        Lines.Strings = (
          #1095#1077#1083#1102#1089#1090#1085#1086'-'#1083#1080#1094#1077#1074#1086#1081' '#1086#1073#1083#1072#1089#1090#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 13
        Height = 33
        Width = 430
      end
      object cxMemo144: TcxMemo
        Left = 3
        Top = 151
        Enabled = False
        Lines.Strings = (
          #1087#1086#1079#1074#1086#1085#1086#1095#1085#1080#1082#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 14
        Height = 33
        Width = 430
      end
      object cxMemo145: TcxMemo
        Left = 3
        Top = 183
        Enabled = False
        Lines.Strings = (
          #1086#1073#1083#1072#1089#1090#1080' '#1096#1077#1080', '#1075#1086#1088#1090#1072#1085#1080' '#1080' '#1075#1086#1088#1090#1072#1085#1086#1075#1083#1086#1090#1082#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 15
        Height = 33
        Width = 430
      end
      object cxMemo146: TcxMemo
        Left = 3
        Top = 215
        Enabled = False
        Lines.Strings = (
          #1080#1085#1090#1077#1088#1074#1077#1085#1094#1080#1086#1085#1085#1099#1077' '#1087#1088#1086#1094#1077#1076#1091#1088#1099' '#1087#1086#1076' '#1082#1086#1085#1090#1088#1086#1083#1077#1084' '#1050#1058)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 16
        Height = 33
        Width = 430
      end
      object cxMemo147: TcxMemo
        Left = 432
        Top = 215
        Enabled = False
        Lines.Strings = (
          '06')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 17
        Height = 33
        Width = 49
      end
      object cxMemo150: TcxMemo
        Left = 432
        Top = 288
        Enabled = False
        Lines.Strings = (
          '09')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 18
        Visible = False
        Height = 33
        Width = 49
      end
      object cxMemo151: TcxMemo
        Left = 432
        Top = 320
        Enabled = False
        Lines.Strings = (
          '10')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 19
        Visible = False
        Height = 33
        Width = 49
      end
      object cxMemo152: TcxMemo
        Left = 432
        Top = 352
        Enabled = False
        Lines.Strings = (
          '11')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 20
        Visible = False
        Height = 33
        Width = 49
      end
      object e50_5113_6_3: TcxTextEdit
        Left = 480
        Top = 215
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 21
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e80_5113_9: TcxTextEdit
        Left = 480
        Top = 288
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 22
        Visible = False
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e90_5113_10: TcxTextEdit
        Left = 480
        Top = 320
        AutoSize = False
        PopupMenu = pmSpecial4One
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 23
        Visible = False
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e100_5113_11: TcxTextEdit
        Left = 480
        Top = 352
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 24
        Visible = False
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object cxMemo178: TcxMemo
        Left = 480
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1042#1089#1077#1075#1086)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 25
        Height = 33
        Width = 81
      end
      object cxMemo179: TcxMemo
        Left = 560
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1074' '#1090#1086#1084' '#1095#1080#1089#1083#1077' '#1083#1080#1094#1072#1084' '#1089#1090#1072#1088#1096#1077
          #1090#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1086#1075#1086' '#1074#1086#1079#1088#1072#1089#1090#1072)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 26
        Height = 33
        Width = 153
      end
      object e01_5113_1_4: TcxTextEdit
        Left = 560
        Top = 55
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 27
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
      object e11_5113_2_4: TcxTextEdit
        Left = 560
        Top = 87
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 28
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
      object e21_5113_3_4: TcxTextEdit
        Left = 560
        Top = 119
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 29
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
      object e31_5113_4_4: TcxTextEdit
        Left = 560
        Top = 151
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 30
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
      object e41_5113_5_4: TcxTextEdit
        Left = 560
        Top = 183
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 31
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
      object e51_5113_6_4: TcxTextEdit
        Left = 560
        Top = 215
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 32
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
      object cxTextEdit12: TcxTextEdit
        Left = 560
        Top = 288
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 33
        Visible = False
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
      object cxTextEdit13: TcxTextEdit
        Left = 560
        Top = 320
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 34
        Visible = False
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
      object cxTextEdit14: TcxTextEdit
        Left = 560
        Top = 352
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 35
        Visible = False
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
      object cxMemo66: TcxMemo
        Left = 3
        Top = 0
        Enabled = False
        Lines.Strings = (
          '')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 36
        Height = 33
        Width = 430
      end
      object cxMemo67: TcxMemo
        Left = 560
        Top = 32
        Enabled = False
        Lines.Strings = (
          '4')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 37
        Height = 24
        Width = 153
      end
      object cxMemo68: TcxMemo
        Left = 480
        Top = 32
        Enabled = False
        Lines.Strings = (
          '3')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 38
        Height = 24
        Width = 81
      end
      object cxMemo69: TcxMemo
        Left = 432
        Top = 32
        Enabled = False
        Lines.Strings = (
          '2')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 39
        Height = 24
        Width = 49
      end
      object cxMemo70: TcxMemo
        Left = 3
        Top = 32
        Enabled = False
        Lines.Strings = (
          '1')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 40
        Height = 24
        Width = 430
      end
    end
    object cxTabSheet5: TcxTabSheet
      Caption = '5114'
      ImageIndex = 4
      ExplicitLeft = -2
      ExplicitTop = 27
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxMemo77: TcxMemo
        Left = 3
        Top = 0
        Enabled = False
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 0
        Height = 33
        Width = 270
      end
      object cxMemo78: TcxMemo
        Left = 3
        Top = 32
        Enabled = False
        Lines.Strings = (
          '1')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 1
        Height = 26
        Width = 270
      end
      object cxMemo79: TcxMemo
        Left = 3
        Top = 57
        Enabled = False
        Lines.Strings = (
          #1063#1080#1089#1083#1086' '#1087#1088#1086#1092#1080#1083#1072#1082#1090#1080#1095#1077#1089#1082#1080#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1086#1088#1075#1072#1085#1086#1074
          #1075#1088#1091#1076#1085#1086#1081' '#1082#1083#1077#1090#1082#1080' ('#1074#1089#1077#1075#1086')')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 2
        Height = 33
        Width = 270
      end
      object cxMemo80: TcxMemo
        Left = 3
        Top = 89
        Enabled = False
        Lines.Strings = (
          '   '#1087#1088#1080' '#1085#1080#1093' '#1074#1099#1087#1086#1083#1085#1077#1085#1086':'
          #1085#1072' '#1087#1083#1077#1085#1086#1095#1085#1099#1093' '#1092#1083#1102#1086#1088#1086#1075#1088#1072#1092#1072#1093)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 3
        Height = 33
        Width = 270
      end
      object cxMemo81: TcxMemo
        Left = 3
        Top = 121
        Enabled = False
        Lines.Strings = (
          #1085#1072' '#1094#1080#1092#1088#1086#1074#1099#1093' '#1072#1087#1087#1072#1088#1072#1090#1072#1093)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 4
        Height = 33
        Width = 270
      end
      object cxMemo82: TcxMemo
        Left = 3
        Top = 153
        Enabled = False
        Lines.Strings = (
          #1088#1077#1085#1090#1075#1077#1085#1086#1075#1088#1072#1092#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 5
        Height = 33
        Width = 270
      end
      object cxMemo83: TcxMemo
        Left = 3
        Top = 185
        Enabled = False
        Lines.Strings = (
          #1063#1080#1089#1083#1086' '#1087#1088#1086#1092#1080#1083#1072#1082#1090#1080#1095#1077#1089#1082#1080#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1084#1086#1083#1086#1095#1085#1099#1093' '
          #1078#1077#1083#1077#1079)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 6
        Height = 33
        Width = 270
      end
      object cxMemo84: TcxMemo
        Left = 3
        Top = 281
        Enabled = False
        Lines.Strings = (
          #1063#1080#1089#1083#1086' '#1086#1089#1090#1077#1086#1076#1077#1085#1089#1080#1090#1086#1084#1077#1090#1088#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 7
        Height = 33
        Width = 270
      end
      object cxMemo85: TcxMemo
        Left = 272
        Top = 0
        Enabled = False
        Lines.Strings = (
          #8470
          #1089#1090#1088#1086#1082#1080)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 8
        Height = 33
        Width = 65
      end
      object cxMemo86: TcxMemo
        Left = 272
        Top = 32
        Enabled = False
        Lines.Strings = (
          '2')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 9
        Height = 26
        Width = 65
      end
      object cxMemo87: TcxMemo
        Left = 336
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1042#1089#1077#1075#1086)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 10
        Height = 33
        Width = 64
      end
      object cxMemo88: TcxMemo
        Left = 399
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1085#1080#1093' '#1076#1077#1090#1103#1084
          '(0 0 17 '#1083#1077#1090' '#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 11
        Height = 33
        Width = 153
      end
      object cxMemo89: TcxMemo
        Left = 336
        Top = 32
        Enabled = False
        Lines.Strings = (
          '3')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 12
        Height = 26
        Width = 64
      end
      object cxMemo90: TcxMemo
        Left = 399
        Top = 32
        Enabled = False
        Lines.Strings = (
          '4')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 13
        Height = 26
        Width = 153
      end
      object e00_5114_1_3: TcxTextEdit
        Left = 336
        Top = 57
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 14
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 64
      end
      object e01_5114_1_4: TcxTextEdit
        Left = 399
        Top = 57
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 15
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
      object e11_5114_2_4: TcxTextEdit
        Left = 399
        Top = 89
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 16
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
      object e10_5114_2_3: TcxTextEdit
        Left = 336
        Top = 89
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 17
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 64
      end
      object e20_5114_3_3: TcxTextEdit
        Left = 336
        Top = 121
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 18
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 64
      end
      object e21_5114_3_4: TcxTextEdit
        Left = 399
        Top = 121
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 19
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
      object e30_5114_4_3: TcxTextEdit
        Left = 336
        Top = 153
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 20
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 64
      end
      object e31_5114_4_4: TcxTextEdit
        Left = 399
        Top = 153
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 21
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
      object e40_5114_5_3: TcxTextEdit
        Left = 336
        Top = 185
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 22
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 64
      end
      object e41_5114_5_4: TcxTextEdit
        Left = 399
        Top = 185
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 23
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
      object e50_5114_6_3: TcxTextEdit
        Left = 336
        Top = 217
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 24
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 64
      end
      object e51_5114_6_4: TcxTextEdit
        Left = 399
        Top = 217
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 25
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
      object cxMemo129: TcxMemo
        Left = 272
        Top = 57
        Enabled = False
        Lines.Strings = (
          '01')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 26
        Height = 33
        Width = 65
      end
      object cxMemo130: TcxMemo
        Left = 272
        Top = 89
        Enabled = False
        Lines.Strings = (
          '02')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 27
        Height = 33
        Width = 65
      end
      object cxMemo131: TcxMemo
        Left = 272
        Top = 121
        Enabled = False
        Lines.Strings = (
          '03')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 28
        Height = 33
        Width = 65
      end
      object cxMemo132: TcxMemo
        Left = 272
        Top = 153
        Enabled = False
        Lines.Strings = (
          '04')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 29
        Height = 33
        Width = 65
      end
      object cxMemo133: TcxMemo
        Left = 272
        Top = 185
        Enabled = False
        Lines.Strings = (
          '05')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 30
        Height = 33
        Width = 65
      end
      object cxMemo134: TcxMemo
        Left = 272
        Top = 217
        Enabled = False
        Lines.Strings = (
          '06')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 31
        Height = 33
        Width = 65
      end
      object cxMemo174: TcxMemo
        Left = 3
        Top = 217
        Enabled = False
        Lines.Strings = (
          '      '#1087#1088#1080' '#1085#1080#1093' '#1074#1099#1087#1086#1083#1085#1077#1085#1086':'
          '   '#1085#1072' '#1087#1083#1077#1085#1086#1095#1085#1099#1093' '#1092#1083#1102#1086#1088#1086#1075#1088#1072#1092#1072#1093)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 32
        Height = 33
        Width = 270
      end
      object cxMemo175: TcxMemo
        Left = 3
        Top = 249
        Enabled = False
        Lines.Strings = (
          #1085#1072' '#1094#1080#1092#1088#1086#1074#1099#1093' '#1072#1087#1087#1072#1088#1072#1090#1072#1093' '#1080' '#1089#1080#1089#1090#1077#1084#1072#1093' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1085#1086#1081' '
          #1088#1072#1076#1080#1086#1075#1088#1072#1092#1080#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 33
        Height = 33
        Width = 270
      end
      object cxMemo176: TcxMemo
        Left = 272
        Top = 249
        Enabled = False
        Lines.Strings = (
          '07')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 34
        Height = 33
        Width = 65
      end
      object e60_5114_7_3: TcxTextEdit
        Left = 336
        Top = 249
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 35
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 64
      end
      object e61_5114_7_4: TcxTextEdit
        Left = 399
        Top = 249
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 36
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
      object cxMemo177: TcxMemo
        Left = 272
        Top = 281
        Enabled = False
        Lines.Strings = (
          '08')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 37
        Height = 33
        Width = 65
      end
      object e70_5114_8_3: TcxTextEdit
        Left = 336
        Top = 281
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 38
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 64
      end
      object e71_5114_8_4: TcxTextEdit
        Left = 399
        Top = 281
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 39
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 153
      end
    end
    object cxTabSheet6: TcxTabSheet
      Caption = '5119'
      ImageIndex = 5
      ExplicitLeft = -2
      ExplicitTop = 27
      ExplicitWidth = 0
      ExplicitHeight = 654
      object cxMemo91: TcxMemo
        Left = 3
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 0
        Height = 81
        Width = 270
      end
      object cxMemo92: TcxMemo
        Left = 272
        Top = 0
        Enabled = False
        Lines.Strings = (
          #8470' '
          #1089#1090#1088#1086#1082#1080)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 1
        Height = 81
        Width = 65
      end
      object cxMemo93: TcxMemo
        Left = 336
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1042#1089#1077#1075#1086)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 2
        Height = 81
        Width = 65
      end
      object cxMemo94: TcxMemo
        Left = 400
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1074' '#1090#1086#1084' '#1095#1080#1089#1083#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 3
        Height = 25
        Width = 257
      end
      object cxMemo95: TcxMemo
        Left = 400
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1072#1084#1073#1091#1083#1072#1090#1086#1088#1085#1099#1084' '
          #1073#1086#1083#1100#1085#1099#1084)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 4
        Height = 57
        Width = 105
      end
      object cxMemo96: TcxMemo
        Left = 504
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1074' '#1076#1085#1077#1074#1085#1086#1084' '#1089#1090#1072#1094#1080#1086#1085#1072#1088#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 5
        Height = 25
        Width = 153
      end
      object cxMemo97: TcxMemo
        Left = 504
        Top = 48
        Enabled = False
        Lines.Strings = (
          #1087#1088#1080' '#1040#1055#1059)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 6
        Height = 33
        Width = 73
      end
      object cxMemo98: TcxMemo
        Left = 576
        Top = 48
        Enabled = False
        Lines.Strings = (
          #1087#1088#1080
          #1089#1090#1072#1094#1080#1086#1085#1072#1088#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 7
        Height = 33
        Width = 81
      end
      object cxMemo99: TcxMemo
        Left = 3
        Top = 80
        Enabled = False
        Lines.Strings = (
          '1')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 8
        Height = 25
        Width = 270
      end
      object cxMemo100: TcxMemo
        Left = 3
        Top = 104
        Enabled = False
        Lines.Strings = (
          #1042#1089#1077#1075#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1086' '#1052#1056#1058)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 9
        Height = 33
        Width = 270
      end
      object cxMemo101: TcxMemo
        Left = 3
        Top = 136
        Enabled = False
        Lines.Strings = (
          '   '#1074' '#1090#1086#1084' '#1095#1080#1089#1083#1077':'
          #1089#1077#1088#1076#1077#1095#1085#1086'-'#1089#1086#1089#1091#1076#1080#1089#1090#1086#1081' '#1089#1080#1089#1090#1077#1084#1099)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 10
        Height = 33
        Width = 270
      end
      object cxMemo102: TcxMemo
        Left = 3
        Top = 168
        Enabled = False
        Lines.Strings = (
          #1083#1077#1075#1082#1080#1093' '#1080' '#1089#1088#1077#1076#1086#1089#1090#1077#1085#1080#1103)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 11
        Height = 33
        Width = 270
      end
      object cxMemo103: TcxMemo
        Left = 3
        Top = 200
        Enabled = False
        Lines.Strings = (
          #1086#1088#1075#1072#1085#1086#1074' '#1073#1088#1102#1096#1085#1086#1081' '#1087#1086#1083#1086#1089#1090#1080' '#1080' '#1079#1072#1073#1088#1102#1096#1080#1085#1085#1086#1075#1086' '
          #1087#1088#1086#1089#1090#1088#1072#1085#1089#1090#1074#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 12
        Height = 33
        Width = 270
      end
      object cxMemo104: TcxMemo
        Left = 3
        Top = 232
        Enabled = False
        Lines.Strings = (
          #1086#1088#1075#1072#1085#1086#1074' '#1084#1072#1083#1086#1075#1086' '#1090#1072#1079#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 13
        Height = 33
        Width = 270
      end
      object cxMemo105: TcxMemo
        Left = 3
        Top = 264
        Enabled = False
        Lines.Strings = (
          #1084#1086#1083#1086#1095#1085#1086#1081' '#1078#1077#1083#1077#1079#1099)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 14
        Height = 33
        Width = 270
      end
      object cxMemo106: TcxMemo
        Left = 3
        Top = 296
        Enabled = False
        Lines.Strings = (
          #1075#1086#1083#1086#1074#1085#1086#1075#1086' '#1084#1086#1079#1075#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 15
        Height = 33
        Width = 270
      end
      object cxMemo107: TcxMemo
        Left = 3
        Top = 328
        Enabled = False
        Lines.Strings = (
          #1087#1086#1079#1074#1086#1085#1086#1095#1085#1080#1082#1072' '#1080' '#1089#1087#1080#1085#1085#1086#1075#1086' '#1084#1086#1079#1075#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 16
        Height = 33
        Width = 270
      end
      object cxMemo108: TcxMemo
        Left = 3
        Top = 360
        Enabled = False
        Lines.Strings = (
          #1086#1073#1083#1072#1089#1090#1080' "'#1075#1086#1083#1086#1074#1072'-'#1096#1077#1103'"')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 17
        Height = 33
        Width = 270
      end
      object cxMemo109: TcxMemo
        Left = 3
        Top = 392
        Enabled = False
        Lines.Strings = (
          #1082#1086#1089#1090#1077#1081', '#1089#1091#1089#1090#1072#1074#1086#1074' '#1080' '#1084#1103#1075#1082#1080#1093' '#1090#1082#1072#1085#1077#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 18
        Height = 33
        Width = 270
      end
      object cxMemo110: TcxMemo
        Left = 3
        Top = 424
        Enabled = False
        Lines.Strings = (
          #1055#1088#1086#1095#1080#1077)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 19
        Height = 33
        Width = 270
      end
      object cxMemo111: TcxMemo
        Left = 3
        Top = 456
        Enabled = False
        Lines.Strings = (
          #1048#1085#1090#1077#1088#1074#1077#1085#1094#1080#1086#1085#1085#1099#1077' '#1074#1084#1077#1096#1072#1090#1077#1083#1100#1089#1090#1074#1072
          #1087#1086#1076' '#1052#1056#1058' - '#1082#1086#1085#1090#1088#1086#1083#1077#1084' ('#1080#1079' '#1089#1090#1088'. 01)')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 20
        Height = 33
        Width = 270
      end
      object cxMemo112: TcxMemo
        Left = 272
        Top = 80
        Enabled = False
        Lines.Strings = (
          '2')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 21
        Height = 25
        Width = 65
      end
      object cxMemo113: TcxMemo
        Left = 272
        Top = 104
        Enabled = False
        Lines.Strings = (
          '01')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 22
        Height = 33
        Width = 65
      end
      object cxMemo114: TcxMemo
        Left = 272
        Top = 136
        Enabled = False
        Lines.Strings = (
          '02')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 23
        Height = 33
        Width = 65
      end
      object cxMemo115: TcxMemo
        Left = 272
        Top = 168
        Enabled = False
        Lines.Strings = (
          '03')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 24
        Height = 33
        Width = 65
      end
      object cxMemo116: TcxMemo
        Left = 272
        Top = 200
        Enabled = False
        Lines.Strings = (
          '04')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 25
        Height = 33
        Width = 65
      end
      object cxMemo117: TcxMemo
        Left = 272
        Top = 232
        Enabled = False
        Lines.Strings = (
          '05')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 26
        Height = 33
        Width = 65
      end
      object cxMemo118: TcxMemo
        Left = 272
        Top = 264
        Enabled = False
        Lines.Strings = (
          '06')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 27
        Height = 33
        Width = 65
      end
      object cxMemo119: TcxMemo
        Left = 272
        Top = 296
        Enabled = False
        Lines.Strings = (
          '07')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 28
        Height = 33
        Width = 65
      end
      object cxMemo120: TcxMemo
        Left = 272
        Top = 328
        Enabled = False
        Lines.Strings = (
          '08')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 29
        Height = 33
        Width = 65
      end
      object cxMemo121: TcxMemo
        Left = 272
        Top = 360
        Enabled = False
        Lines.Strings = (
          '09')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 30
        Height = 33
        Width = 65
      end
      object cxMemo122: TcxMemo
        Left = 272
        Top = 392
        Enabled = False
        Lines.Strings = (
          '10')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 31
        Height = 33
        Width = 65
      end
      object cxMemo123: TcxMemo
        Left = 272
        Top = 424
        Enabled = False
        Lines.Strings = (
          '11')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 32
        Height = 33
        Width = 65
      end
      object cxMemo124: TcxMemo
        Left = 272
        Top = 456
        Enabled = False
        Lines.Strings = (
          '12')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 33
        Height = 33
        Width = 65
      end
      object cxMemo125: TcxMemo
        Left = 336
        Top = 80
        Enabled = False
        Lines.Strings = (
          '3')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 34
        Height = 25
        Width = 65
      end
      object cxMemo126: TcxMemo
        Left = 400
        Top = 80
        Enabled = False
        Lines.Strings = (
          '4')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 35
        Height = 25
        Width = 105
      end
      object cxMemo127: TcxMemo
        Left = 504
        Top = 80
        Enabled = False
        Lines.Strings = (
          '5')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 36
        Height = 25
        Width = 73
      end
      object cxMemo128: TcxMemo
        Left = 576
        Top = 80
        Enabled = False
        Lines.Strings = (
          '6')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 37
        Height = 25
        Width = 81
      end
      object e00_5119_1_3: TcxTextEdit
        Left = 336
        Top = 104
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 38
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e10_5119_2_3: TcxTextEdit
        Left = 336
        Top = 136
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 39
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e20_5119_3_3: TcxTextEdit
        Left = 336
        Top = 168
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 40
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e30_5119_4_3: TcxTextEdit
        Left = 336
        Top = 200
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 41
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e40_5119_5_3: TcxTextEdit
        Left = 336
        Top = 232
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 42
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e50_5119_6_3: TcxTextEdit
        Left = 336
        Top = 264
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 43
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e60_5119_7_3: TcxTextEdit
        Left = 336
        Top = 296
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 44
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e70_5119_8_3: TcxTextEdit
        Left = 336
        Top = 328
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 45
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e80_5119_9_3: TcxTextEdit
        Left = 336
        Top = 360
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 46
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e90_5119_10_3: TcxTextEdit
        Left = 336
        Top = 392
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 47
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e100_5119_11_3: TcxTextEdit
        Left = 336
        Top = 424
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 48
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e110_5119_12_3: TcxTextEdit
        Left = 336
        Top = 456
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 49
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 65
      end
      object e01_5119_1_4: TcxTextEdit
        Left = 400
        Top = 104
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 50
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 105
      end
      object e11_5119_2_4: TcxTextEdit
        Left = 400
        Top = 136
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 51
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 105
      end
      object e21_5119_3_4: TcxTextEdit
        Left = 400
        Top = 168
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 52
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 105
      end
      object e31_5119_4_4: TcxTextEdit
        Left = 400
        Top = 200
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 53
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 105
      end
      object e41_5119_5_4: TcxTextEdit
        Left = 400
        Top = 232
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 54
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 105
      end
      object e51_5119_6_4: TcxTextEdit
        Left = 400
        Top = 264
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 55
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 105
      end
      object e61_5119_7_4: TcxTextEdit
        Left = 400
        Top = 296
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 56
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 105
      end
      object e71_5119_8_4: TcxTextEdit
        Left = 400
        Top = 328
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 57
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 105
      end
      object e81_5119_9_4: TcxTextEdit
        Left = 400
        Top = 360
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 58
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 105
      end
      object e91_5119_10_4: TcxTextEdit
        Left = 400
        Top = 392
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 59
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 105
      end
      object e101_5119_11_4: TcxTextEdit
        Left = 400
        Top = 424
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 60
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 105
      end
      object e111_5119_12_4: TcxTextEdit
        Left = 400
        Top = 456
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 61
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 105
      end
      object e02_5119_1_5: TcxTextEdit
        Left = 504
        Top = 104
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 62
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 73
      end
      object e12_5119_2_5: TcxTextEdit
        Left = 504
        Top = 136
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 63
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 73
      end
      object e22_5119_3_5: TcxTextEdit
        Left = 504
        Top = 168
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 64
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 73
      end
      object e32_5119_4_5: TcxTextEdit
        Left = 504
        Top = 200
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 65
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 73
      end
      object e42_5119_5_5: TcxTextEdit
        Left = 504
        Top = 232
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 66
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 73
      end
      object e52_5119_6_5: TcxTextEdit
        Left = 504
        Top = 264
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 67
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 73
      end
      object e62_5119_7_5: TcxTextEdit
        Left = 504
        Top = 296
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 68
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 73
      end
      object e72_5119_8_5: TcxTextEdit
        Left = 504
        Top = 328
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 69
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 73
      end
      object e82_5119_9_5: TcxTextEdit
        Left = 504
        Top = 360
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 70
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 73
      end
      object e92_5119_10_5: TcxTextEdit
        Left = 504
        Top = 392
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 71
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 73
      end
      object e102_5119_11_5: TcxTextEdit
        Left = 504
        Top = 424
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 72
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 73
      end
      object e112_5119_12_5: TcxTextEdit
        Left = 504
        Top = 456
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 73
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 73
      end
      object e03_5119_1_6: TcxTextEdit
        Left = 576
        Top = 104
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 74
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e13_5119_2_6: TcxTextEdit
        Left = 576
        Top = 136
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 75
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e23_5119_3_6: TcxTextEdit
        Left = 576
        Top = 168
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 76
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e33_5119_4_6: TcxTextEdit
        Left = 576
        Top = 200
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 77
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e43_5119_5_6: TcxTextEdit
        Left = 576
        Top = 232
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 78
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e53_5119_6_6: TcxTextEdit
        Left = 576
        Top = 264
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 79
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e63_5119_7_6: TcxTextEdit
        Left = 576
        Top = 296
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 80
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e73_5119_8_6: TcxTextEdit
        Left = 576
        Top = 328
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 81
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e83_5119_9_6: TcxTextEdit
        Left = 576
        Top = 360
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 82
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e93_5119_10_6: TcxTextEdit
        Left = 576
        Top = 392
        AutoSize = False
        PopupMenu = pmMain
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 83
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e103_5119_11_6: TcxTextEdit
        Left = 576
        Top = 424
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 84
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
      object e116_5119_12_6: TcxTextEdit
        Left = 576
        Top = 456
        AutoSize = False
        PopupMenu = pmMain_4longcaptions
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 85
        OnMouseLeave = e102_5110_11_5MouseLeave
        OnMouseMove = e102_5110_11_5MouseMove
        Height = 33
        Width = 81
      end
    end
  end
  object paParams: TPanel
    Left = 0
    Top = 34
    Width = 229
    Height = 666
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 6
    Visible = False
    object cxGroupBox1: TcxGroupBox
      Left = 0
      Top = 0
      Align = alTop
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      TabOrder = 0
      Visible = False
      Height = 215
      Width = 229
      object Label1: TLabel
        Left = 5
        Top = 89
        Width = 60
        Height = 13
        Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082':'
        Visible = False
      end
      object Label2: TLabel
        Left = 5
        Top = 135
        Width = 47
        Height = 13
        Caption = #1050#1072#1073#1080#1085#1077#1090':'
        Visible = False
      end
      object cxLabel2: TcxLabel
        Left = 5
        Top = 26
        Caption = #1055#1077#1088#1080#1086#1076' '#1089':'
      end
      object cxDateBeg: TcxDateEdit
        Left = 65
        Top = 25
        Properties.DateButtons = [btnClear, btnNow, btnToday]
        Properties.ShowTime = False
        Style.ButtonStyle = btsDefault
        TabOrder = 1
        Width = 81
      end
      object cxLabel3: TcxLabel
        Left = 39
        Top = 52
        Caption = #1087#1086':'
      end
      object cxDateEnd: TcxDateEdit
        Left = 65
        Top = 52
        Properties.DateButtons = [btnClear, btnNow, btnToday]
        Properties.ImmediatePost = True
        TabOrder = 3
        Width = 81
      end
      object bbSetPeriod: TcxButton
        Left = 148
        Top = 26
        Width = 71
        Height = 47
        Caption = #1042#1099#1073#1088#1072#1090#1100'...'
        TabOrder = 4
        OnClick = bbSetPeriodClick
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Black'
      end
      object cxSotr: TcxLookupComboBox
        Left = 5
        Top = 108
        Hint = #1043#1088#1091#1087#1087#1099' '#1076#1080#1072#1075#1085#1086#1079#1086#1074
        Properties.AutoSelect = False
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownSizeable = True
        Properties.GridMode = True
        Properties.HideSelection = False
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsSotr
        Properties.ReadOnly = False
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 5
        Visible = False
        Width = 214
      end
      object cxKab: TcxLookupComboBox
        Left = 5
        Top = 154
        Hint = #1043#1088#1091#1087#1087#1099' '#1076#1080#1072#1075#1085#1086#1079#1086#1074
        Properties.AutoSelect = False
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownSizeable = True
        Properties.GridMode = True
        Properties.HideSelection = False
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsKab
        Properties.ReadOnly = False
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 6
        Visible = False
        Width = 214
      end
      object cxDez: TcxCheckBox
        Left = 5
        Top = 181
        Caption = #1044#1077#1078#1091#1088#1089#1090#1074#1086
        Properties.DisplayChecked = '-1'
        Properties.DisplayUnchecked = '0'
        Properties.DisplayGrayed = 'null'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = -1
        Properties.ValueGrayed = False
        Properties.ValueUnchecked = 0
        TabOrder = 7
        Visible = False
        Width = 89
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 0
      Top = 215
      Align = alTop
      Caption = #1060#1091#1085#1082#1094#1080#1080
      TabOrder = 1
      Visible = False
      Height = 128
      Width = 229
      object bbCalculateCell: TcxButton
        Left = 3
        Top = 15
        Width = 218
        Height = 33
        Action = aCalculateCell
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Black'
      end
      object cxButton1: TcxButton
        Left = 3
        Top = 50
        Width = 218
        Height = 33
        Action = aCalculateTable
        TabOrder = 1
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Black'
      end
      object cxButton2: TcxButton
        Left = 3
        Top = 85
        Width = 218
        Height = 33
        Action = aCalculateReport
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Black'
      end
    end
    object cxGroupBox3: TcxGroupBox
      Left = 0
      Top = 343
      Align = alClient
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      TabOrder = 2
      Height = 323
      Width = 229
      object cxButton3: TcxButton
        Left = 3
        Top = 14
        Width = 218
        Height = 33
        Action = aMetodics
        TabOrder = 0
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000F00A0000F00A00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000707070726E6E706A6972706F707273757979747676
          7273736E6A6A6C65656B66656A65656B67676764646765656361616D6C6B0000
          0000000000000000000000000000000000000073706F7FBCC689DDEB8BE2EF65
          A8DA8EE5F090E5F193E9F498EEF79AEBF399E0E591CED186B8BC7EA4A6779295
          7283856E7C7F6E6C6C000000000000000000000000000000000000746F6E9DE4
          EA75ADB2A7EEF081B5E0AEF4F7A6EDF3A0E9F099E4ED8DDDE984D7E581D6E47D
          D5E479D5E577D6E576D8E874D9E7696362000000000000000000000000000000
          00000075706F8ACBD3293E427CB1B57BAFDFAAEEF3ABEEF3AFF3F7B5F9F9BBFE
          FEBDFFFFB9FFFFB3FDFDADFBFCA4F5F999F0F68BDEE569626100000000000000
          0000000000000000000000777373BCFFFFA9DDDFC2FEFE88B5E4BAF8F8B3F0F5
          ACECF3A4E8EF9AE1EA94DDE791DEE88EDDE98CDCE788DBE887DDE982CDD76A64
          630000000000000000000000000000000000007B7B7AD4FFFFCFFFFFD4FFFF95
          BDEBD4FFFFCFFFFFCDFFFFCDFFFFCBFFFFC8FFFFC5FFFFC1FFFFBEFFFFB9FFFF
          AFFEFF9ADFE16964640000000000000000000000000000000000007C7D7EA5E4
          F1A3DDE9A6E1EA73A1DAA6E1EAA0DDE7A0DDE79DDDE79DDDE79BDDE99BE0EA9F
          E5EEA2EAF0A6EFF4A7F5F99AD9DD6C6767000000000000000000000000000000
          000000838382E0FFFFDBFFFFE0FFFF9DBDEDE0FFFFDAFFFFD9FFFFD7FFFFD4FF
          FFD1FFFFC9FFFFBEFAFBB4F5F7ABF0F5A4EFF593D1D66E686800000000000000
          00000000000000000000007F8283ADE4F1ABDFEBAFE1EB76A1DCAEE1EAA8DDE7
          A8DDE7A5DDE7A3DDE9A6E2ECABE8EFB0EEF3B5F4F6B7F8FABBFFFFA9E3E26C68
          67000000000000000000000000000000000000858585EDFFFFCAE5E4ECFFFFA1
          BBF0E9FFFFE4FFFFE1FFFFDEFFFFD9FFFFD0FEFDC4F7FAB8F1F5AEECF1A3E7EF
          9AE4ED8DC8D16F6A6A0000000000000000000000000000000000008485869BC5
          D03140438DAEB37DA2E2BAE5EBBAE3EDBEE9EFC2ECF3C6F2F6CAF7FACEFCFCD0
          FFFFCDFFFFC9FFFFC6FFFFB2E9E8706C6C000000000000000000000000000000
          000000858484F4FFFFA2B0AEEBFDF8A5B9F1EEFFFFE2FCFDD8F7F9CFF2F6C3EE
          F3B9E9EFADE2EDA3DFE99DDDE99BDDE998E0EA90CBD5716C6C00000000000000
          0000000000000000000000838281C4EBF4C7E9F0CCECEF88A4E5D1EEF2CFEEF3
          D1F0F5D3F4F7D6F7FAD9FDFDDBFFFFD8FFFFD4FFFFCFFFFFCAFFFFBBF1F0716D
          6D000000000000000000000000000000000000828080EDFFFFEBFCFDF1FFFD9D
          B1EFE8FAFADCF2F6D3EFF4CAEBF2BFE8EFB5E3EDABDEE9A4DDE7A1DDE79DDDE7
          99DFE992D4DE716D6C000000000000000000000000000000000000858383D3EF
          F4D9EEF3E3F3F496ABEDE9F7F7E4F6F9E5FAFBE5FDFEE8FFFFE5FFFFE0FFFFDC
          FFFFD7FFFFD1FFFFCCFFFFC0FAF9736F6F000000000000000000000000000000
          000000878685D9EEF2E3F5F9EAF6F799ACEEDBEDF2D1EAF1C6E6EEBCE2ECB3DE
          E9AEDEE9A5D6E09DCFDA9ACEDA95CAD494C3CA8FAAAC77757500000000000000
          0000000000000000000000888686E8F8F8CFD7D8E3E9E6AEBDF8F3FCFFF6FFFF
          F3FFFFEFFFFFEAFFFFE9FFFFAFC0BE858B8A8398977C94967980817977777676
          760000000000000000000000000000000000008C8A89C1DEE73D4A4D67757792
          B3F1BCDBEBBFE1EBB7DDE9B3DDE7B0DDE7AEE1EA99B4BB90C9C98AFDFF7ACBD4
          7D7B7A7C7C7C0000000000000000000000000000000000000000008C8B8BDFEE
          EEDAE9E8E6F3EEB0C6FDE6F7FEF1FFFFEBFFFFE7FFFFE4FFFFE1FFFFBDD3D27F
          B6BA79CDD67E797A91908F000000000000000000000000000000000000000000
          0000008F8E8ED5E8E8EFFFFFF4FFFFA9C4FEDFF6FFEBFFFFE6FFFFE2FFFFDEFF
          FFDCFFFFBAD2D2799A9F7F80818A888800000000000000000000000000000000
          0000000000000000000000949393BCC9C9CDDFDFD1E1DE9CB3DECADEE5D3E9E9
          D7F0F0DAF9F9DFFFFFDFFFFFB0C9C9817D7D8B8A8A0000000000000000000000
          000000000000000000000000000000000000009595959391918F8D8D8F8D8D8F
          8D8B8B8988888685858383838080838080898C8C878888878686000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Black'
      end
      object cxButton4: TcxButton
        Left = 3
        Top = 50
        Width = 218
        Height = 33
        Action = aDetail
        TabOrder = 1
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Black'
      end
      object cxButton5: TcxButton
        Left = 3
        Top = 86
        Width = 218
        Height = 33
        Action = aInfo
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Black'
      end
      object cxButton6: TcxButton
        Left = 3
        Top = 146
        Width = 218
        Height = 33
        Action = aClose
        TabOrder = 3
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Black'
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 229
    Top = 34
    Width = 8
    Height = 666
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 57
    Control = paParams
    Visible = False
  end
  object AL: TActionList
    Images = IL
    Left = 96
    Top = 648
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
      ImageIndex = 0
      ShortCut = 32883
      OnExecute = aCloseExecute
    end
    object aCalculateCell: TAction
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' '#1103#1095#1077#1081#1082#1077
      Hint = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' '#1103#1095#1077#1081#1082#1077
      ImageIndex = 8
      OnExecute = aCalculateCellExecute
    end
    object aCalculateTable: TAction
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' '#1090#1072#1073#1083#1080#1094#1077
      Hint = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' '#1090#1072#1073#1083#1080#1094#1077
      ImageIndex = 8
      OnExecute = aCalculateTableExecute
    end
    object aCalculateReport: TAction
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1086#1090#1095#1077#1090
      Hint = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1086#1090#1095#1077#1090
      ImageIndex = 8
      OnExecute = aCalculateReportExecute
    end
    object aMetodics: TAction
      Caption = #1052#1077#1090#1086#1076#1080#1082#1080
      ImageIndex = 12
      OnExecute = aMetodicsExecute
    end
    object aDetail: TAction
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ImageIndex = 2
      Visible = False
      OnExecute = aDetailExecute
    end
    object aInfo: TAction
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ImageIndex = 1
      OnExecute = aInfoExecute
    end
  end
  object IL: TImageList
    Left = 128
    Top = 648
    Bitmap = {
      494C01010D0010002C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004D6061006181
      8400658688005A7880005C7D80005F8083005E7C7E00566E700048515200352E
      2C00332B2B00312E2D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000577477007CC6
      D00084CBEB008CD2ED009FEDF5009AEBF50098EBF40093EAF5008EE9F50085E5
      F20076D5E5004B6B700000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005C7A7D006E98
      9A007FB3D700A1E0EF00A9ECF100A7EBF100A4EBF100A0EAF1009EECF2009FF0
      F40099F4FD00506D710000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000066818200CBFF
      FF009CCEF200AEE2F800C6FCFD00C9FFFF00CAFFFF00C6FFFF00BBFDFF00AFF8
      FA00A0F7FD00506C6F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000068828500CFFF
      FF00ACD5F000A6D5F800C0F2F600B8EEF300B1EBF200AEECF200A9ECF200A4EC
      F2009FF1FA004F686A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006E868900CBFC
      FF009DC6EF009EC9F100BEECF200BBECF200B7ECF200B3ECF200ADECF200A9EC
      F200A3F3FA0051696B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000728A8D00768D
      8E009CBBD500A1C7F200CBF2F400CBF3F800CFF9FA00D0FEFF00D0FFFF00CAFF
      FF00BAFFFF00556D700000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000798D8D00D2E7
      E500D7EAFA00B6CFFB00E8FFFF00DAF9FC00CDF3F700C1EFF400B5EBF200AFEC
      F200A4EDF700546D710000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000071838700DCF8
      FC00CBE2F100A3C0EF00D2EEF200CAECF200C4ECF200BEECF200B8ECF200B2EC
      F200A5EDF7005670730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000078878800DEF7
      FE00DAEBF300A1B8EF00D6EFF200CBECF200C6ECF200C2EFF600C1F5FC00C2F9
      FC00B4F6FC005C72730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B888A00CDDC
      DE00D6DFE000A6BBF600E7F8F900E1F9FA00E1FFFF00B8CFCD00698383006494
      9900455255004340400000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000079868700B1C1
      C200BECBC800A5BFFA00E3FAF900D6F3F700CBF1F700A8C9CE0078CACF006AAD
      B400514B4B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000075818200FFFF
      FF00FCFFFF00ACC9FF00F6FFFF00ECFFFF00E8FFFF00C4E4E30052727500514A
      4E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A6768006D7B
      7C006D79790060737A006A7C7D00687E7F0066808200627A7C004E4B4B000000
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
      0000000000000000000000000000000000000000000000000000015603000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D1ACA700694731006947310069473100694731006947
      3100694731006947310069473100694731000000000000000000000000000000
      0000000000000000000000000000E0A98B009144130091441300914413009144
      130091441300914413009144130091441300811E000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001560300015503000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D1ACA700EFE7E300C2AC9D00C2AC9D00C2AC9D00C2AC
      9D00C2AC9D00C2AC9D00C2AC9D00694731000000000000000000000000000000
      0000000000000000000000000000E0A98B00F7E6DA00F5E0D100F3DAC800F1D3
      BE00EFCDB500EDC7AC00EDC7AC009144130000000000811E0000811E00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002590400035D06000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000436E0000436E000043
      6E0000436E0000436E00D1ACA700F4EEEB00EFE7E300EBE1DC00E7DBD500E5D8
      D100E1D2CA00DDCCC200C2AC9D00694731000000000000000000000000000000
      0000000000000000000000000000E0A98B00F9EDE500F7E6DA00F5E0D100F3DA
      C800F2D6C300F0D0BA00EECAB000914413000000000000000000811E0000811E
      0000811E00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000004620800096F11000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000090C8007AD8EF000290C9000290
      C9000290C9000290C900D1ACA700F9F5F300D8984000D8984000D8984000D898
      4000D8984000E1D2CA00C2AC9D00694731000000000000000000000000000000
      0000000000000000000000000000E0A98B00FCF5F000D3835700D3835700D383
      5700D3835700D3835700F0D0BA0091441300000000000000000000000000811E
      000095440F00811E000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000006690D0018932D000156
      0300000000000000000000000000000000000000000001540300000000000000
      0000000000000000000000000000000000000090C80083DEF2007AD8EF0072D3
      ED0069CDEA0060C9E700D1ACA700FFFFFF00FBF8F700F6F1EF00F1EAE700EDE4
      DF00E9DED800E5D8D100C2AC9D00694731000000000000000000000000000000
      0000000000000000000000000000E0A98B00FFFFFF00FDF8F500FAF1EA00F8EA
      DF00F6E3D500F4DDCC00F2D6C300914413000000000000000000000000000000
      0000811E0000A7632F00811E0000811E00000000000000000000000000000000
      0000000000000000000000000000000000000000000006680D002CB84F00096B
      1000000000000000000000000000000000000000000001540300015403000000
      0000000000000000000000000000000000000090C8008CE3F50083DEF2007AD8
      EF0072D3ED0069CDEA00D1ACA700FFFFFF00D8984000D8984000D8984000D898
      4000D8984000E9DED800C2AC9D0069473100CEB8AA007A5A46007A5A46007A5A
      46007A5A46007A5A46007A5A4600E0A98B00FFFFFF00D3835700D3835700D383
      5700D3835700D3835700F4DDCC00914413000000000000000000000000000000
      000000000000811E0000BF8B6200CCA17E00811E0000811E0000000000000000
      00000000000000000000000000000000000000000000035A06002BB44C0025AB
      430001520200000000000000000000000000000000000154030007840F000154
      0300000000000000000000000000000000000090C80095E8F8008CE3F50083DE
      F2007AD8EF0072D3ED00D1ACA700FFFFFF00FFFFFF00FFFFFF00FBF8F700F6F1
      EF00F1EAE700EDE4DF00C2AC9D0069473100CEB8AA00EFE7E300EBE1DC00E7DB
      D500E3D5CD00DFCFC600DBC9BF00E0A98B00FFFFFF00FFFFFF00FFFFFF00FDF8
      F500FAF1EA00F8EADF00F6E3D500914413000000000000000000000000000000
      00000000000000000000811E0000D8B69C00E6D1BF00E7D3C400811E00000000
      0000000000000000000000000000000000000000000000000000168A280042E2
      76001C9C3300015403000154030001530200015202000154030009981300047D
      0B00015403000000000000000000000000000090C80095E8F80095E8F8008CE3
      F50083DEF2007AD8EF00D1ACA700FFFFFF00D8984000D8984000D8984000FBF8
      F700F6F1EF00CEA8A7006947310069473100CEB8AA00F4EEEB00EFE7E300EBE1
      DC00E7DBD500E5D8D100E1D2CA00E0A98B00FFFFFF00D3835700D3835700FFFF
      FF00E0A98B00AB542800AB542800AB5428000000000000000000000000000000
      0000000000000000000000000000811E0000F0E2D900FCF7F200FAF0E600811E
      0000811E000000000000000000000000000000000000000000000256040029B1
      49003FE06F0028B7480016982A0013982500169C28000E911C0009931300058F
      0D0005820D000154030000000000000000000090C80095E8F80095E8F80095E8
      F8008CE3F50083DEF200D1ACA700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FBF8F700CEA8A700FFFFFF0069473100CEB8AA00F9F5F300DFA98300DFA9
      8300DFA98300DFA98300DFA98300E0A98B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E0A98B00F3EBE600AB542800000000000000000000000000000000000000
      0000000000000000000000000000811E0000D8AF9600F4E2CF00F0D7BD00D8A7
      8400811E0000811E000000000000000000000000000000000000000000000358
      050024A9410036D362002ECC540024BD42001BAF320013A325000C981800068F
      0F0006920E000781100001540300000000000090C80095E8F80095E8F80095E8
      F80095E8F8008CE3F500D1ACA700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CEA8A7006947310000000000CEB8AA00FFFFFF00FBF8F700F6F1
      EF00F1EAE700EDE4DF00E9DED800E0A98B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E8A98B00C56A310000000000000000000000000000000000000000000000
      00000000000000000000811E0000F3DECA00EFD4B800EBC9A700DAA67D00811E
      0000000000000000000000000000000000000000000000000000000000000000
      0000015603000D7718001FA5390023B43F001EB1370018AA2D000F9D1F000A98
      15000A7F14000154030000000000000000000090C80095E8F80095E8F80095E8
      F80095E8F80095E8F800D1ACA700D1ACA700D1ACA700D1ACA700D1ACA700D1AC
      A700D1ACA700D1ACA7000000000000000000CEB8AA00FFFFFF00DFA98300DFA9
      8300DFA98300DFA98300DFA98300E0A98B00E0A98B00E0A98B00E0A98B00E0A9
      8B00E0A98B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000811E0000E7BB9200E3B08100E0A67200D592
      5A00811E00000000000000000000000000000000000000000000000000000000
      0000000000000000000002570400035B0600035D07000154030015AB29000978
      1100015403000000000000000000000000000090C80095E8F80095E8F8000060
      980000436E0000436E0000436E0000436E0000436E0000436E0000436E000290
      C90000436E00000000000000000000000000CEB8AA00FFFFFF00FFFFFF00FFFF
      FF00FBF8F700F6F1EF00F1EAE700EDE4DF006947310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000811E0000DA995E00D78F5000D384
      4100CF7B3500811E000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001540300097611000154
      0300000000000000000000000000000000000090C80095E8F80095E8F8000060
      980095E8F8006ED0EC0000436E006ED0EC004EBDE3000B95CC0000436E000290
      C90000436E00000000000000000000000000CEB8AA00FFFFFF00DFA98300DFA9
      8300FFFFFF00CEB8AA0069473100694731006947310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000811E0000811E0000811E
      0000811E0000811E0000811E0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001540300015403000000
      0000000000000000000000000000000000000090C80095E8F80095E8F80095E8
      F8000060980095E8F80000436E0000436E006ED0EC0000436E0065CBE90065CB
      E90000436E00000000000000000000000000CEB8AA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CEB8AA00F3EBE600694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001540300000000000000
      000000000000000000000000000000000000000000000090C8000090C8000090
      C8000090C8000060980095E8F80095E8F80000436E000090C8000090C8000090
      C80000000000000000000000000000000000CEB8AA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CEB8AA0069473100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000060980000609800006098000060980000000000000000000000
      000000000000000000000000000000000000CEB8AA00CEB8AA00CEB8AA00CEB8
      AA00CEB8AA00CEB8AA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084848400848484008484840084848400C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE8400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084848400008400000084000084848400C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000008484
      84008484840084848400FFCE8400FF0000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084848400008400000084000084848400C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FF00
      0000FF000000FF000000FF000000FF000000FF00000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084848400008400000084000084848400C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFDEAD00FF000000FF00
      0000FFCE8400FFCE8400FF000000FF000000FF000000FF000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      840000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400008400000084000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000848484000000FF0084848400000000000000
      000084848400000000008484840000000000FFDEAD00FF000000FF000000FF00
      00000000000000000000FFCE8400FF000000FF00000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      840000000000000000000000000000000000C6C6C60084848400848484008484
      8400848484008484840084848400008400000084000084848400848484008484
      8400848484008484840084848400C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400848484000000000000000000FFDEAD00FF000000848484000000
      00000000000000000000FFCE8400FF000000848484000000000000000000FF00
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      840000000000000000000000000000000000C6C6C60000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000C6C6C6000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000848484000000000000000000FFDEAD00FF000000848484000000
      00000000000000000000FFCE840084848400000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      84000000000000000000000000000000000000FF000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      000000840000008400000084000000FF00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000FFDEAD00FF000000848484000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      84000000000000000000000000000000000000FF000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      000000840000008400000084000000FF00000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF000000000000000000FFDEAD00FF000000848484000000
      00000000000000000000FF00000084848400000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      84000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF00000084000000840000008400000084000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFA5A500FF0000000000
      000000000000FF000000FF000000848484000000000000000000FF000000FF00
      0000848484000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      00000000000000FF00000084000000840000008400000084000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000848484008484840084848400FF000000FF00
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000FF00000084000000840000008400000084000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFCE
      8400FF000000FF000000FF000000FF000000FF000000FF000000FF0000008484
      8400000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      00000000000000FF00000084000000840000008400000084000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFCE8400FF000000FF000000FFCE8400FFCE8400FFCE8400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF00000084000000840000008400000084000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE8400FF000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE8400848484000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000959595003636
      3600363636003636360036363600363636003636360036363600363636003636
      36003636360085858500000000000000000000000000000000000000000000FF
      000000FF00000000000000FF000000FF00000000000000FF000000FF00000000
      0000FFFFFF00FFFFFF00000000000000000000000000AA540000AA540000AA54
      0000AA540000AA540000C8600000C8600000C8600000AA540000AA540000AA54
      0000AA540000AA540000AA540000000000000000000000000000824B4B009A4D
      4E00AF4E4F00C04D4E00BF4C4D009F4B4C004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B0000000000000000008E8E8E00010101000F0F
      0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F
      0F000F0F0F00383838006B6B6B000000000000000000000000000000000000FF
      000000FF00000000000000FF000000FF00000000000000FF000000FF00000000
      0000FFFFFF00FFFFFF000000000000000000AA540000C8600000903000009030
      0000903000009030000090300000903000009030000090300000903000009030
      0000903000009030000090300000AA5400000000000000000000824B4B00CC57
      5800CB565700C9545500C7535400A34E4F004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B0000000000000000003E3E3E00272727001414
      1400141414001414140014141400141414001414140014141400141414001515
      15001414140037373700202020000000000000000000000000000000000000FF
      000000FF00000000000000FF000000FF00000000000000FF000000FF00000000
      0000FFFFFF00FFFFFF000000000000000000AA540000D3BDAF00694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100AA5400000000000000000000824B4B00D05A
      5B00CF595A00CC575800CB565700A55050004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B00000000000000000040404000292929001515
      1500151515001414140014141400141414001414140014141400141414001414
      140014141400373737001E1E1E000000000000000000000000000000000000FF
      000000FF00000000000000FF000000FF00000000000000FF000000FF00000000
      0000FFFFFF00FFFFFF000000000000000000AA540000D3BDAF00ECE3DD00E7DB
      D400E4D7CF00DCCBC100DBC9BF0069473100DBC9BF00DBC9BF00DCCBC100E4D7
      CF00E7DBD400EDE4DF0069473100AA5400000000000000000000824B4B00D962
      6300D8606200D55E5F00D45D5E00A95354004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B000000000000000000404040002B2B2B001414
      14001414140014141400DADADA00C4C4C400CBCBCB0014141400141414001414
      140015151500373737001F1F1F000000000000000000000000000000000000FF
      000000FF00000000000000FF000000FF00000000000000FF000000FF00000000
      0000FFFFFF00FFFFFF000000000000000000AA540000D3BDAF00F3EDE900F8B2
      6600F8B26600F8B26600E1D3CA0069473100DCCBC100F8B26600F8B26600F8B2
      6600F8B26600F4EFEC0069473100AA5400000000000000000000824B4B00DD65
      6600DC646500D9626300D8606200AB5555004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B000000000000000000404040002A2A2A001414
      14001414140014141400EAEAEA00F0F0F0001717170014141400141414001414
      140015151500383838001F1F1F00000000000000000000000000000000000000
      0000000000000000000000FF000000FF00000000000000FF000000FF00000000
      0000FFFFFF00FFFFFF000000000000000000AA540000D3BDAF00F5F0EE00F0E9
      E500EEE5E100E7DBD400E4D7CF0069473100DFCFC600E4D7CF00E7DBD400EFE7
      E300F2EBE700F7F2F00069473100AA5400000000000000000000824B4B00E66C
      6D00E56B6C00EEA6A700FFFFFF00AF5859004E1E1F00B7EBAA005ED3770045CA
      670045CA6700F7B5B600824B4B000000000000000000404040002A2A2A001414
      1400141414001414140055555500F2F2F2008D8D8D0014141400141414001414
      140015151500373737001E1E1E00000000000000000000000000000000000000
      0000000000000000000000FF000000FF00000000000000FF000000FF00000000
      0000FFFFFF00FFFFFF000000000000000000AA540000D3BDAF00FAF8F600F8B2
      6600F8B26600F8B26600EADFD90069473100E4D7CF00F8B26600F8B26600F8B2
      6600F8B26600FCFAF90069473100AA5400000000000000000000824B4B00EA6F
      7000E96E6F00F2A9AA00FFFFFF00B15A5A004E1E1F00FFFFD300FFFFD300FFFF
      D300D9F6BD00F7B5B600824B4B000000000000000000404040002A2A2A001515
      1500141414001414140017171700F6F6F600D6D6D60014141400141414001414
      140014141400383838001E1E1E00000000000000000000000000000000000000
      0000000000000000000000FF000000FF00000000000000FF000000FF00000000
      0000FFFFFF00FFFFFF000000000000000000AA540000D3BDAF00FEFDFD00F9F6
      F400F7F2F000EFE7E300E9DDD60069473100E7DBD400EDE4DF00EFE7E300F7F2
      F000F9F6F400FEFDFD0069473100AA5400000000000000000000824B4B00F377
      7800F2767700EF747500EE737400B55D5D004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B0000000000000000003F3F3F002A2A2A001515
      15001414140014141400FFFFFF00FFFFFF00FFFFFF0014141400141414001414
      140014141400373737001F1F1F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF00000000
      0000FFFFFF00FFFFFF000000000000000000AA540000D3BDAF00FFFFFF00F8B2
      6600F8B26600F8B26600F2EBE70069473100EDE4DF00F8B26600F8B26600F8B2
      6600F8B26600FFFFFF0069473100AA5400000000000000000000824B4B00F77A
      7B00F6797A00F3777800F2767700B75F5F004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B000000000000000000404040002B2B2B001515
      1500141414001414140014141400141414001414140014141400141414001414
      140014141400373737001F1F1F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF00000000
      0000FFFFFF00FFFFFF000000000000000000AA540000D3BDAF00FFFFFF00FFFF
      FF00FEFDFD00F7F2F000F4EFEC0069473100EFE7E300F4EFEC00F7F2F000FEFD
      FD00FFFFFF00FFFFFF0069473100AA5400000000000000000000824B4B00FF81
      8200FE808100FC7F8000FB7E7F00BB6363004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B0000000000000000003F3F3F002B2B2B001414
      140014141400151515001414140014141400FFFFFF00FFFFFF00141418001414
      140015151500373737001F1F1F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF00000000
      0000FFFFFF00FFFFFF000000000000000000AA540000D3BDAF00FFFFFF00F8B2
      6600F8B26600F8B26600F9F6F40069473100F4EFEC00F8B26600F8B26600F8B2
      6600F8B26600FFFFFF0069473100AA5400000000000000000000824B4B00FF81
      8200FF818200FF818200FE808100BD6565004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B000000000000000000404040002A2A2A001414
      1400151515001515150015151500151515009595950095959500151515001414
      1400141414003838380020202000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF000000000000000000AA540000D3BDAF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FCFAF90069473100F7F2F000FCFAF900FEFDFD00FFFF
      FF00FFFFFF00FFFFFF0069473100AA5400000000000000000000824B4B00AF5E
      5F00D56F7000FF818200FF818200BF6666004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000000000050505000767676001B1B
      1B001B1B1B001C1C1C001B1B1B001C1C1C001C1C1C001B1B1B001B1B1B001B1B
      1B001B1B1B001E1E1E0054545400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF000000000000000000AA540000D3BDAF00FFFFFF00F8B2
      6600F8B26600F8B26600FFFFFF0069473100FCFAF900F8B26600F8B26600F8B2
      6600F8B26600FFFFFF0069473100AA540000000000000000000000000000824B
      4B00824B4B00B6626300EE7A7B00BF6666004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000505050000808
      0800070707000707070007070700070707000707070008080800080808000707
      0700080808005050500000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00000000000000000000000000D3BDAF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F4EFEC00D3BDAF00D3BDAF00F3EFEB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0069473100000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000C003000000000000
      C003000000000000C003000000000000C003000000000000C003000000000000
      C003000000000000C003000000000000C003000000000000C003000000000000
      C003000000000000C003000000000000C007000000000000C00F000000000000
      C01F000000000000FFFF000000000000FFFFDFFFFC00FE007FFF9FFFFC00FE00
      9FFF9FFF8000FE00C7FF9FFF0000FE00E3FF8FBF0000FE00F0FF8F9F00000000
      F83F878F00000000FC1FC00700000000FE07C00300000001FE03E00100010003
      FC0FF00300030007FE07FC070007007FFF03FF8F0007007FFF81FF9F000700FF
      FFFFFFBF800F01FFFFFFFFFFF87F03FFFFFFF81FC00FFFFFC007F81FC007FC7F
      DE07F81F8003E03FD407F81FBFF3C01FD407F81FBFF3801FD4070000BE310C3F
      D407000080011C67D407000080011CE3D4070000C0011FE3D5070000E0011CE3
      DF870000F00398C7C007F81FF00FF007DF07F81FF00FE00FC007F81FF00FF03F
      FC7FF81FF007F8FFFFFFF81FF807FCFFFE7FFFFFC001FFFFE07FC003C0018001
      C0018001C0010000C0018001C0010000C0018001C0010000C0018001C0010000
      C0018001C0010000C0018001F8010000C0018001F8010000C0018001F8010000
      C0018001FF010000C0018001FF010000C0018001FF010000C0018001FFE10000
      E001C003FFE18001FE7FFFFFFFE1FFFF00000000000000000000000000000000
      000000000000}
  end
  object os: TOracleSession
    AfterLogOn = osAfterLogOn
    Left = 64
    Top = 648
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
    ImageOptions.Images = IL
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 160
    Top = 648
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
      Caption = 'MAIN'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 214
      FloatTop = 150
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
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
  end
  object pmMain: TPopupMenu
    Images = IL
    Left = 1264
    Top = 538
    object N1: TMenuItem
      Caption = #1052#1077#1090#1086#1076#1080#1082#1080
      ImageIndex = 12
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ImageIndex = 0
      Visible = False
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ImageIndex = 1
      Visible = False
    end
  end
  object odsSotr: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_FAM || '#39' '#39' || '
      
        '       DECODE(VarcharIsNUll(FC_NAME), 1, '#39#39', SUBSTR(FC_NAME, 0, ' +
        '1) || '#39'. '#39' || '
      
        '       DECODE (VarcharIsNUll(FC_OTCH), 1, '#39#39', SUBSTR(FC_OTCH, 0,' +
        ' 1) || '#39'. '#39')) AS FC_NAME'
      ' FROM TSOTR '
      ' WHERE FK_OTDELID = GET_XRAYOTDEL '
      '   AND FK_SPRAVID = GET_XRAY_VRACH'
      '   AND FL_DEL = 0'
      'ORDER BY FC_FAM'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000046435F4E414D4501000000000005000000464B5F
      4944010000000000}
    Session = os
    Left = 56
    Top = 581
  end
  object dsSotr: TDataSource
    DataSet = odsSotr
    Left = 88
    Top = 581
  end
  object odsKab: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT KAB.FK_ID, KAB.FC_NAME, KAB.FN_ORDER '
      '  FROM TNAZVRACH NAZ, TKABINET KAB'
      'WHERE FK_SOTRID = :PSOTR'
      '  AND NAZ.FK_KABINETID = KAB.FK_ID'
      'ORDER BY KAB.FN_ORDER'
      ''
      ''
      '')
    Optimize = False
    Variables.Data = {0300000001000000060000003A50534F5452030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Cursor = crSQLWait
    Session = os
    BeforeOpen = odsKabBeforeOpen
    Left = 128
    Top = 581
  end
  object dsKab: TDataSource
    DataSet = odsKab
    Left = 160
    Top = 581
  end
  object pmMain_4longcaptions: TPopupMenu
    Images = IL
    Left = 1264
    Top = 578
    object MenuItem1: TMenuItem
      Caption = #1052#1077#1090#1086#1076#1080#1082#1080
      ImageIndex = 12
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103
      ImageIndex = 2
      Visible = False
      OnClick = MenuItem2Click
    end
    object MenuItem3: TMenuItem
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ImageIndex = 1
      Visible = False
    end
  end
  object pmSpec: TPopupMenu
    Images = IL
    Left = 1261
    Top = 463
    object N4: TMenuItem
      Caption = #1052#1077#1090#1086#1076#1080#1082#1080
      ImageIndex = 12
      OnClick = N4Click
    end
  end
  object pmSpecial4One: TPopupMenu
    Images = IL
    Left = 1261
    Top = 407
    object N5: TMenuItem
      Caption = #1052#1077#1090#1086#1076#1080#1082#1080
      ImageIndex = 12
      OnClick = N5Click
    end
  end
end
