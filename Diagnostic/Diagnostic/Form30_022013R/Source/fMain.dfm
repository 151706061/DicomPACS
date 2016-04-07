object frmMain: TfrmMain
  Left = -8
  Top = -8
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1092#1086#1088#1084#1099' 30 '#1056#1072#1076#1080#1086#1085#1091#1082#1083#1080#1076#1085#1072#1103' '#1076#1080#1072#1075#1085#1086#1089#1090#1080#1082#1072' - '#1060#1077#1074#1088#1072#1083#1100' 2013'
  ClientHeight = 716
  ClientWidth = 1366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 34
    Width = 1366
    Height = 682
    ActivePage = cxTabSheet1
    Align = alClient
    Style = 10
    TabOrder = 0
    ClientRectBottom = 682
    ClientRectRight = 1366
    ClientRectTop = 19
    object cxTS_5110: TcxTabSheet
      Tag = 1
      Caption = '5100'
      ImageIndex = 0
      TabVisible = False
      object e00_5110_1_3: TcxTextEdit
        Left = 328
        Top = 115
        Cursor = crArrow
        AutoSize = False
        Enabled = False
        ParentShowHint = False
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
        Top = 25
        Enabled = False
        Lines.Strings = (
          #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103
          #1086#1088#1075#1072#1085#1086#1074' '#1080' '#1089#1080#1089#1090#1077#1084)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 1
        Height = 67
        Width = 262
      end
      object cxMemo2: TcxMemo
        Left = 3
        Top = 115
        Enabled = False
        Lines.Strings = (
          #1056#1077#1085#1090#1075#1077#1085#1086#1076#1080#1072#1075#1085#1086#1089#1090#1080#1095#1077#1089#1082#1080#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103' ('#1074#1089#1077#1075#1086')')
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
          #1080#1079' '#1085#1080#1093' ('#1089#1090#1088'.01):'
          #1086#1088#1075#1072#1085#1086#1074' '#1075#1088#1091#1076#1085#1086#1081' '#1082#1083#1077#1090#1082#1080)
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
        Width = 262
      end
      object cxMemo5: TcxMemo
        Left = 3
        Top = 208
        Enabled = False
        Lines.Strings = (
          '     '#1080#1079' '#1085#1080#1093':'
          '                '#1087#1080#1097#1077#1074#1086#1076#1072','
          '                '#1078#1077#1083#1091#1076#1082#1072' '#1080' '#1090#1086#1085#1082#1086#1081' '#1082#1080#1096#1082#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 5
        Height = 49
        Width = 262
      end
      object cxMemo6: TcxMemo
        Left = 3
        Top = 257
        Enabled = False
        Lines.Strings = (
          '     '#1086#1073#1086#1076#1086#1095#1085#1086#1081' '#1080' '#1087#1088#1103#1084#1086#1081' '#1082#1080#1096#1082#1080)
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
        Top = 323
        Enabled = False
        Lines.Strings = (
          '     '#1080#1079' '#1085#1080#1093': '#1096#1077#1081#1085#1086#1075#1086' '#1080' '#1075#1088#1091#1076#1085#1086#1075#1086
          '                 '#1086#1090#1076#1077#1083#1072' '#1087#1086#1079#1074#1086#1085#1086#1095#1085#1080#1082#1072)
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
        Top = 356
        Enabled = False
        Lines.Strings = (
          '     '#1087#1086#1103#1089#1085#1080#1095#1085#1086#1075#1086' '#1080' '#1082#1088#1077#1089#1090#1094#1086'-'
          '     '#1074#1086#1075#1086' '#1086#1090#1076'. '#1087#1086#1079#1074#1086#1085#1086#1095#1085#1080#1082#1072'  ')
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
        Top = 389
        Enabled = False
        Lines.Strings = (
          #1087#1088#1086#1095#1080#1093' '#1086#1088#1075#1072#1085#1086#1074' '#1080' '#1089#1080#1089#1090#1077#1084)
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
        Top = 422
        Enabled = False
        Lines.Strings = (
          '     '#1080#1079' '#1085#1080#1093': '#1095#1077#1088#1077#1087#1072' '#1080' '#1095#1077#1083#1102#1089#1090#1085#1086'-'
          '                 '#1083#1080#1094#1077#1074#1086#1081' '#1086#1073#1083#1072#1089#1090#1080)
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
        Top = 455
        Enabled = False
        Lines.Strings = (
          '               '#1080#1079' '#1085#1080#1093' '#1079#1091#1073#1086#1074)
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
        Top = 25
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
        Height = 67
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
        Top = 25
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
        Height = 67
        Width = 65
      end
      object cxMemo15: TcxMemo
        Left = 392
        Top = 46
        Enabled = False
        Lines.Strings = (
          #1056#1077#1085#1090#1075#1077#1085#1086#1089#1082#1086#1087#1080#1081)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 15
        Height = 46
        Width = 105
      end
      object cxMemo19: TcxMemo
        Left = 392
        Top = 25
        Enabled = False
        Lines.Strings = (
          #1055#1088#1080' '#1085#1080#1093' '#1074#1099#1087#1086#1083#1085#1077#1085#1086)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 16
        Height = 22
        Width = 449
      end
      object cxMemo21: TcxMemo
        Left = 1059
        Top = 46
        Enabled = False
        Lines.Strings = (
          #1074' '#1076#1085#1077#1074#1085#1086#1084' '
          #1089#1090#1072#1094#1080#1086#1085#1072#1088#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 17
        Height = 46
        Width = 97
      end
      object cxMemo22: TcxMemo
        Left = 976
        Top = 46
        Enabled = False
        Lines.Strings = (
          #1074
          #1087#1086#1083#1080#1082#1083#1080#1085#1080#1082#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 18
        Height = 46
        Width = 84
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
        TabOrder = 19
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
        TabOrder = 20
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
        TabOrder = 21
        Height = 25
        Width = 105
      end
      object cxMemo26: TcxMemo
        Left = 496
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
        TabOrder = 22
        Height = 25
        Width = 65
      end
      object cxMemo27: TcxMemo
        Left = 560
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
        TabOrder = 23
        Height = 25
        Width = 65
      end
      object cxMemo28: TcxMemo
        Left = 624
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
        TabOrder = 24
        Height = 25
        Width = 65
      end
      object cxMemo29: TcxMemo
        Left = 688
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
        TabOrder = 25
        Height = 25
        Width = 65
      end
      object cxMemo30: TcxMemo
        Left = 752
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
        TabOrder = 26
        Height = 25
        Width = 89
      end
      object e10_5110_2_3: TcxTextEdit
        Tag = 1
        Left = 328
        Top = 144
        Hint = '5100_1.1_3R'
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
        TabOrder = 27
        Height = 33
        Width = 65
      end
      object e20_5110_3_3: TcxTextEdit
        Left = 328
        Top = 176
        Hint = '5100_1.2_3R'
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
        TabOrder = 28
        Height = 33
        Width = 65
      end
      object e30_5110_4_3: TcxTextEdit
        Left = 328
        Top = 208
        Hint = '5100_1.2.1_3R'
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
        TabOrder = 29
        Height = 49
        Width = 65
      end
      object e40_5110_5_3: TcxTextEdit
        Left = 328
        Top = 257
        Hint = '5100_1.2.2_3R'
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
        TabOrder = 30
        Height = 33
        Width = 65
      end
      object e60_5110_7_3: TcxTextEdit
        Left = 328
        Top = 356
        Hint = '5100_1.3.2_3R'
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
        TabOrder = 31
        Height = 33
        Width = 65
      end
      object e70_5110_8_3: TcxTextEdit
        Left = 328
        Top = 389
        Hint = '5100_1.4_3R'
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
        TabOrder = 32
        Height = 33
        Width = 65
      end
      object e80_5110_9_3: TcxTextEdit
        Left = 328
        Top = 422
        Hint = '5100_1.4.1_3R'
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
        TabOrder = 33
        Height = 33
        Width = 65
      end
      object e90_5110_10_3: TcxTextEdit
        Left = 328
        Top = 455
        Hint = '5100_1.4.1.1_3R'
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
        TabOrder = 34
        Height = 33
        Width = 65
      end
      object cxMemo31: TcxMemo
        Left = 264
        Top = 115
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
        TabOrder = 35
        Height = 30
        Width = 65
      end
      object cxMemo32: TcxMemo
        Left = 264
        Top = 144
        Enabled = False
        Lines.Strings = (
          '1.1')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 36
        Height = 33
        Width = 65
      end
      object cxMemo33: TcxMemo
        Left = 264
        Top = 176
        Enabled = False
        Lines.Strings = (
          '1.2')
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
      object cxMemo34: TcxMemo
        Left = 264
        Top = 208
        Enabled = False
        Lines.Strings = (
          '1.2.1')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 38
        Height = 49
        Width = 65
      end
      object cxMemo35: TcxMemo
        Left = 264
        Top = 257
        Enabled = False
        Lines.Strings = (
          '1.2.2')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 39
        Height = 33
        Width = 65
      end
      object cxMemo36: TcxMemo
        Left = 264
        Top = 323
        Enabled = False
        Lines.Strings = (
          '1.3.1')
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
      object cxMemo37: TcxMemo
        Left = 264
        Top = 356
        Enabled = False
        Lines.Strings = (
          '1.3.2')
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
      object cxMemo38: TcxMemo
        Left = 264
        Top = 389
        Enabled = False
        Lines.Strings = (
          '1.4')
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
      object cxMemo39: TcxMemo
        Left = 264
        Top = 422
        Enabled = False
        Lines.Strings = (
          '1.4.1')
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
      object cxMemo40: TcxMemo
        Left = 264
        Top = 455
        Enabled = False
        Lines.Strings = (
          '1.4.1.1')
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
      object e01_5110_1_4: TcxTextEdit
        Left = 392
        Top = 115
        AutoSize = False
        Enabled = False
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clGray
        StyleDisabled.TextColor = clBlack
        StyleFocused.BorderColor = clNavy
        StyleFocused.BorderStyle = ebsThick
        StyleFocused.Color = clMoneyGreen
        TabOrder = 45
        Height = 30
        Width = 105
      end
      object e02_5110_1_5: TcxTextEdit
        Left = 496
        Top = 115
        AutoSize = False
        Enabled = False
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
        TabOrder = 46
        Height = 30
        Width = 65
      end
      object e03_5110_1_6: TcxTextEdit
        Left = 560
        Top = 115
        AutoSize = False
        Enabled = False
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
        TabOrder = 47
        Height = 30
        Width = 65
      end
      object e04_5110_1_7: TcxTextEdit
        Left = 624
        Top = 115
        AutoSize = False
        Enabled = False
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
        TabOrder = 48
        Height = 30
        Width = 65
      end
      object e05_5110_1_8: TcxTextEdit
        Left = 688
        Top = 115
        AutoSize = False
        Enabled = False
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
        TabOrder = 49
        Height = 30
        Width = 65
      end
      object e06_5110_1_9: TcxTextEdit
        Left = 752
        Top = 115
        AutoSize = False
        Enabled = False
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
        TabOrder = 50
        Height = 30
        Width = 89
      end
      object e11_5110_2_4: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 144
        Hint = '5100_1.1_4R'
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
        TabOrder = 51
        Height = 33
        Width = 105
      end
      object e21_5110_3_4: TcxTextEdit
        Left = 392
        Top = 176
        Hint = '5100_1.2_4R'
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
        TabOrder = 52
        Height = 33
        Width = 105
      end
      object e31_5110_4_4: TcxTextEdit
        Left = 392
        Top = 208
        Hint = '5100_1.2.1_4R'
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
        TabOrder = 53
        Height = 49
        Width = 105
      end
      object e61_5110_7_4: TcxTextEdit
        Left = 392
        Top = 356
        Hint = '5100_1.3.2_4R'
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
        TabOrder = 54
        Height = 33
        Width = 105
      end
      object e71_5110_8_4: TcxTextEdit
        Left = 392
        Top = 389
        Hint = '5100_1.4_4R'
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
        Height = 33
        Width = 105
      end
      object e81_5110_9_4: TcxTextEdit
        Left = 392
        Top = 422
        Hint = '5100_1.4.1_4R'
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
        Height = 33
        Width = 105
      end
      object e41_5110_5_4: TcxTextEdit
        Left = 392
        Top = 257
        Hint = '5100_1.2.2_4R'
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
        Height = 33
        Width = 105
      end
      object e91_5110_10_4: TcxTextEdit
        Left = 392
        Top = 455
        Hint = '5100_1.4.1.1_4R'
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
        Height = 33
        Width = 105
      end
      object e12_5110_2_5: TcxTextEdit
        Tag = 1
        Left = 496
        Top = 144
        Hint = '5100_1.1_5R'
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
        Height = 33
        Width = 65
      end
      object e22_5110_3_5: TcxTextEdit
        Left = 496
        Top = 176
        Hint = '5100_1.2_5R'
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
        TabOrder = 60
        Height = 33
        Width = 65
      end
      object e32_5110_4_5: TcxTextEdit
        Left = 496
        Top = 208
        Hint = '5100_1.2.1_5R'
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
        TabOrder = 61
        Height = 49
        Width = 65
      end
      object e62_5110_7_5: TcxTextEdit
        Left = 496
        Top = 356
        Hint = '5100_1.3.2_5R'
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
        Height = 33
        Width = 65
      end
      object e72_5110_8_5: TcxTextEdit
        Left = 496
        Top = 389
        Hint = '5100_1.4_5R'
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
        Height = 33
        Width = 65
      end
      object e82_5110_9_5: TcxTextEdit
        Left = 496
        Top = 422
        Hint = '5100_1.4.1_5R'
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
        Height = 33
        Width = 65
      end
      object e92_5110_10_5: TcxTextEdit
        Left = 496
        Top = 455
        Hint = '5100_1.4.1.1_5R'
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
        Height = 33
        Width = 65
      end
      object e42_5110_5_5: TcxTextEdit
        Left = 496
        Top = 257
        Hint = '5100_1.2.2_5R'
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
        Height = 33
        Width = 65
      end
      object e13_5110_2_6: TcxTextEdit
        Tag = 1
        Left = 560
        Top = 144
        Hint = '5100_1.1_6R'
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
        Height = 33
        Width = 65
      end
      object e23_5110_3_6: TcxTextEdit
        Left = 560
        Top = 176
        Hint = '5100_1.2_6R'
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
        Height = 33
        Width = 65
      end
      object e33_5110_4_6: TcxTextEdit
        Left = 560
        Top = 208
        Hint = '5100_1.2.1_6R'
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
        Height = 49
        Width = 65
      end
      object e43_5110_5_6: TcxTextEdit
        Left = 560
        Top = 257
        Hint = '5100_1.2.2_6R'
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
        Height = 33
        Width = 65
      end
      object e13_5110_2_7: TcxTextEdit
        Tag = 1
        Left = 624
        Top = 144
        Hint = '5100_1.1_7R'
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
        Height = 33
        Width = 65
      end
      object e24_5110_3_7: TcxTextEdit
        Left = 624
        Top = 176
        Hint = '5100_1.2_7R'
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
        Height = 33
        Width = 65
      end
      object e34_5110_4_7: TcxTextEdit
        Left = 624
        Top = 208
        Hint = '5100_1.2.1_7R'
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
        Height = 49
        Width = 65
      end
      object e44_5110_5_7: TcxTextEdit
        Left = 624
        Top = 257
        Hint = '5100_1.2.2_7R'
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
        Height = 33
        Width = 65
      end
      object e63_5110_7_6: TcxTextEdit
        Left = 560
        Top = 356
        Hint = '5100_1.3.2_6R'
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
        Height = 33
        Width = 65
      end
      object e73_5110_8_6: TcxTextEdit
        Left = 560
        Top = 389
        Hint = '5100_1.4_6R'
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
        Height = 33
        Width = 65
      end
      object e83_5110_9_6: TcxTextEdit
        Left = 560
        Top = 422
        Hint = '5100_1.4.1_6R'
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
        Height = 33
        Width = 65
      end
      object e93_5110_10_6: TcxTextEdit
        Left = 560
        Top = 455
        Hint = '5100_1.4.1.1_6R'
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
        Height = 33
        Width = 65
      end
      object e64_5110_7_7: TcxTextEdit
        Left = 624
        Top = 356
        Hint = '5100_1.3.2_7R'
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
        Height = 33
        Width = 65
      end
      object e74_5110_8_7: TcxTextEdit
        Left = 624
        Top = 389
        Hint = '5100_1.4_7R'
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
        Height = 33
        Width = 65
      end
      object e84_5110_9_7: TcxTextEdit
        Left = 624
        Top = 422
        Hint = '5100_1.4.1_7R'
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
        Height = 33
        Width = 65
      end
      object e94_5110_10_7: TcxTextEdit
        Left = 624
        Top = 455
        Hint = '5100_1.4.1.1_7R'
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
        Height = 33
        Width = 65
      end
      object e15_5110_2_8: TcxTextEdit
        Tag = 1
        Left = 688
        Top = 144
        Hint = '5100_1.1_8R'
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
        Height = 33
        Width = 65
      end
      object e25_5110_3_8: TcxTextEdit
        Left = 688
        Top = 176
        Hint = '5100_1.2_8R'
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
        Height = 33
        Width = 65
      end
      object e35_5110_4_8: TcxTextEdit
        Left = 688
        Top = 208
        Hint = '5100_1.2.1_8R'
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
        Height = 49
        Width = 65
      end
      object e45_5110_5_8: TcxTextEdit
        Left = 688
        Top = 257
        Hint = '5100_1.2.2_8R'
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
        Height = 33
        Width = 65
      end
      object e16_5110_2_9: TcxTextEdit
        Tag = 1
        Left = 752
        Top = 144
        Hint = '5100_1.1_9R'
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
        Height = 33
        Width = 89
      end
      object e26_5110_3_9: TcxTextEdit
        Left = 752
        Top = 176
        Hint = '5100_1.2_9R'
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
        Height = 33
        Width = 89
      end
      object e36_5110_4_9: TcxTextEdit
        Left = 752
        Top = 208
        Hint = '5100_1.2.1_9R'
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
        Height = 49
        Width = 89
      end
      object e46_5110_5_9: TcxTextEdit
        Left = 752
        Top = 257
        Hint = '5100_1.2.2_9R'
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
        Height = 33
        Width = 89
      end
      object e65_5110_7_8: TcxTextEdit
        Left = 688
        Top = 356
        Hint = '5100_1.3.2_8R'
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
        Height = 33
        Width = 65
      end
      object e75_5110_8_8: TcxTextEdit
        Left = 688
        Top = 389
        Hint = '5100_1.4_8R'
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
        Height = 33
        Width = 65
      end
      object e85_5110_9_8: TcxTextEdit
        Left = 688
        Top = 422
        Hint = '5100_1.4.1_8R'
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
        Height = 33
        Width = 65
      end
      object e95_5110_10_8: TcxTextEdit
        Left = 688
        Top = 455
        Hint = '5100_1.4.1.1_8R'
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
        Height = 33
        Width = 65
      end
      object e66_5110_7_9: TcxTextEdit
        Left = 752
        Top = 356
        Hint = '5100_1.3.2_9R'
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
        Height = 33
        Width = 89
      end
      object e76_5110_8_9: TcxTextEdit
        Left = 752
        Top = 389
        Hint = '5100_1.4_9R'
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
        Height = 33
        Width = 89
      end
      object e86_5110_9_9: TcxTextEdit
        Left = 752
        Top = 422
        Hint = '5100_1.4.1_9R'
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
        Height = 33
        Width = 89
      end
      object e96_5110_10_9: TcxTextEdit
        Left = 752
        Top = 455
        Hint = '5100_1.4.1.1_9R'
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
        Height = 33
        Width = 89
      end
      object e50_5110_6_3: TcxTextEdit
        Left = 328
        Top = 323
        Hint = '5100_1.3.1_3R'
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
        TabOrder = 99
        Height = 33
        Width = 65
      end
      object e51_5110_6_4: TcxTextEdit
        Left = 392
        Top = 323
        Hint = '5100_1.3.1_4R'
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
        TabOrder = 100
        Height = 33
        Width = 105
      end
      object e53_5110_6_6: TcxTextEdit
        Left = 560
        Top = 323
        Hint = '5100_1.3.1_6R'
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
        TabOrder = 101
        Height = 33
        Width = 65
      end
      object e54_5110_6_7: TcxTextEdit
        Left = 624
        Top = 323
        Hint = '5100_1.3.1_7R'
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
        TabOrder = 102
        Height = 33
        Width = 65
      end
      object e52_5110_6_5: TcxTextEdit
        Left = 496
        Top = 323
        Hint = '5100_1.3.1_5R'
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
        TabOrder = 103
        Height = 33
        Width = 65
      end
      object e55_5110_6_8: TcxTextEdit
        Left = 688
        Top = 323
        Hint = '5100_1.3.1_8R'
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
        Height = 33
        Width = 65
      end
      object e56_5110_6_9: TcxTextEdit
        Left = 752
        Top = 323
        Hint = '5100_1.3.1_9R'
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
        Height = 33
        Width = 89
      end
      object cxMemo135: TcxMemo
        Left = 3
        Top = 488
        Enabled = False
        Lines.Strings = (
          '          '#1087#1086#1095#1077#1082' '#1080' '#1084#1086#1095#1077'-'
          '          '#1074#1099#1074#1086#1076#1103#1097#1080#1093' '#1087#1091#1090#1077#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 106
        Height = 33
        Width = 262
      end
      object cxMemo136: TcxMemo
        Left = 3
        Top = 521
        Enabled = False
        Lines.Strings = (
          '          '#1084#1086#1083#1086#1095#1085#1099#1093' '#1078#1077#1083#1077#1079)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 107
        Height = 33
        Width = 262
      end
      object cxMemo137: TcxMemo
        Left = 264
        Top = 488
        Enabled = False
        Lines.Strings = (
          '1.4.2')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 108
        Height = 33
        Width = 65
      end
      object cxMemo138: TcxMemo
        Left = 264
        Top = 521
        Enabled = False
        Lines.Strings = (
          '1.4.3')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 109
        Height = 33
        Width = 65
      end
      object cxTextEdit1: TcxTextEdit
        Left = 328
        Top = 488
        Hint = '5100_1.4.2_3R'
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
        TabOrder = 110
        Height = 33
        Width = 65
      end
      object e101_5110_11_4: TcxTextEdit
        Left = 392
        Top = 488
        Hint = '5100_1.4.2_4R'
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
        TabOrder = 111
        Height = 33
        Width = 105
      end
      object e102_5110_11_5: TcxTextEdit
        Left = 496
        Top = 488
        Hint = '5100_1.4.2_5R'
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
        TabOrder = 112
        Height = 33
        Width = 65
      end
      object e103_5110_11_6: TcxTextEdit
        Left = 560
        Top = 488
        Hint = '5100_1.4.2_6R'
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
        TabOrder = 113
        Height = 33
        Width = 65
      end
      object e104_5110_11_7: TcxTextEdit
        Left = 624
        Top = 488
        Hint = '5100_1.4.2_7R'
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
        TabOrder = 114
        Height = 33
        Width = 65
      end
      object e105_5110_11_8: TcxTextEdit
        Left = 688
        Top = 488
        Hint = '5100_1.4.2_8R'
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
        TabOrder = 115
        Height = 33
        Width = 65
      end
      object e106_5110_11_9: TcxTextEdit
        Left = 752
        Top = 488
        Hint = '5100_1.4.2_9R'
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
        TabOrder = 116
        Height = 33
        Width = 89
      end
      object cxTextEdit8: TcxTextEdit
        Left = 328
        Top = 521
        Hint = '5100_1.4.3_3R'
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
        TabOrder = 117
        Height = 33
        Width = 65
      end
      object e111_5110_12_4: TcxTextEdit
        Left = 392
        Top = 521
        Hint = '5100_1.4.3_4R'
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
        TabOrder = 118
        Height = 33
        Width = 105
      end
      object e112_5110_12_5: TcxTextEdit
        Left = 496
        Top = 521
        Hint = '5100_1.4.3_5R'
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
        TabOrder = 119
        Height = 33
        Width = 65
      end
      object e113_5110_12_6: TcxTextEdit
        Left = 560
        Top = 521
        Hint = '5100_1.4.3_6R'
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
        TabOrder = 120
        Height = 33
        Width = 65
      end
      object e114_5110_12_7: TcxTextEdit
        Left = 624
        Top = 521
        Hint = '5100_1.4.3_7R'
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
        TabOrder = 121
        Height = 33
        Width = 65
      end
      object e115_5110_12_8: TcxTextEdit
        Left = 688
        Top = 521
        Hint = '5100_1.4.3_8R'
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
        TabOrder = 122
        Height = 33
        Width = 65
      end
      object e116_5110_12_9: TcxTextEdit
        Left = 752
        Top = 521
        Hint = '5100_1.4.3_9R'
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
        TabOrder = 123
        Height = 33
        Width = 89
      end
      object cxMemo139: TcxMemo
        Left = 840
        Top = 46
        Enabled = False
        Lines.Strings = (
          #1089' '#1082#1086#1085#1090#1088#1072#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077#1084'*')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 124
        Height = 46
        Width = 137
      end
      object cxMemo140: TcxMemo
        Left = 840
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
        TabOrder = 125
        Height = 25
        Width = 137
      end
      object e07_5110_1_10: TcxTextEdit
        Left = 840
        Top = 115
        AutoSize = False
        Enabled = False
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
        TabOrder = 126
        Height = 30
        Width = 137
      end
      object e17_5110_2_10: TcxTextEdit
        Left = 840
        Top = 144
        Hint = '5100_1.1_10R'
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
        TabOrder = 127
        Height = 33
        Width = 137
      end
      object e27_5110_3_10: TcxTextEdit
        Left = 840
        Top = 176
        Hint = '5100_1.2_10R'
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
        TabOrder = 128
        Height = 33
        Width = 137
      end
      object e37_5110_4_10: TcxTextEdit
        Left = 840
        Top = 208
        Hint = '5100_1.2.1_10R'
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
        TabOrder = 129
        Height = 49
        Width = 137
      end
      object e47_5110_5_10: TcxTextEdit
        Left = 840
        Top = 257
        Hint = '5100_1.2.2_10R'
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
        TabOrder = 130
        Height = 33
        Width = 137
      end
      object e67_5110_7_10: TcxTextEdit
        Left = 840
        Top = 356
        Hint = '5100_1.3.2_10R'
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
        TabOrder = 131
        Height = 33
        Width = 137
      end
      object e77_5110_8_10: TcxTextEdit
        Left = 840
        Top = 389
        Hint = '5100_1.4_10R'
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
        TabOrder = 132
        Height = 33
        Width = 137
      end
      object e87_5110_9_10: TcxTextEdit
        Left = 840
        Top = 422
        Hint = '5100_1.4.1_10R'
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
        TabOrder = 133
        Height = 33
        Width = 137
      end
      object e97_5110_10_10: TcxTextEdit
        Left = 840
        Top = 455
        Hint = '5100_1.4.1.1_10R'
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
        TabOrder = 134
        Height = 33
        Width = 137
      end
      object e107_5110_11_10: TcxTextEdit
        Left = 840
        Top = 488
        Hint = '5100_1.4.2_10R'
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
        TabOrder = 135
        Height = 33
        Width = 137
      end
      object e117_5110_12_10: TcxTextEdit
        Left = 840
        Top = 521
        Hint = '5100_1.4.3_10R'
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
        TabOrder = 136
        Height = 33
        Width = 137
      end
      object e57_5110_6_10: TcxTextEdit
        Left = 840
        Top = 323
        Hint = '5100_1.3.1_10R'
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
        TabOrder = 137
        Height = 33
        Width = 137
      end
      object cxMemo161: TcxMemo
        Left = 840
        Top = 25
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
        TabOrder = 138
        Height = 22
        Width = 316
      end
      object cxMemo141: TcxMemo
        Left = 3
        Top = 290
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
        TabOrder = 139
        Height = 33
        Width = 262
      end
      object cxMemo148: TcxMemo
        Left = 264
        Top = 290
        Enabled = False
        Lines.Strings = (
          '1.3')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 140
        Height = 33
        Width = 65
      end
      object cxTextEdit3: TcxTextEdit
        Left = 328
        Top = 290
        Hint = '5100_1.3_3R'
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
        TabOrder = 141
        Height = 33
        Width = 65
      end
      object e131_5110_14_4: TcxTextEdit
        Left = 392
        Top = 290
        Hint = '5100_1.3_4R'
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
        TabOrder = 142
        Height = 33
        Width = 105
      end
      object e132_5110_14_5: TcxTextEdit
        Left = 496
        Top = 290
        Hint = '5100_1.3_5R'
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
        TabOrder = 143
        Height = 33
        Width = 65
      end
      object e133_5110_14_6: TcxTextEdit
        Left = 560
        Top = 290
        Hint = '5100_1.3_6R'
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
        TabOrder = 144
        Height = 33
        Width = 65
      end
      object e134_5110_14_7: TcxTextEdit
        Left = 624
        Top = 290
        Hint = '5100_1.3_7R'
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
        TabOrder = 145
        Height = 33
        Width = 65
      end
      object e135_5110_14_8: TcxTextEdit
        Left = 688
        Top = 290
        Hint = '5100_1.3_8R'
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
        TabOrder = 146
        Height = 33
        Width = 65
      end
      object e136_5110_14_9: TcxTextEdit
        Left = 752
        Top = 290
        Hint = '5100_1.3_9R'
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
        TabOrder = 147
        Height = 33
        Width = 89
      end
      object e137_5110_14_10: TcxTextEdit
        Left = 840
        Top = 290
        Hint = '5100_1.3_10R'
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
        TabOrder = 148
        Height = 33
        Width = 137
      end
      object cxLabel1: TcxLabel
        Left = 16
        Top = 552
        Caption = '* '#1073#1077#1079' '#1072#1085#1075#1080#1086#1075#1088#1072#1092#1080#1081
      end
      object cxMemo149: TcxMemo
        Left = 496
        Top = 46
        Enabled = False
        Lines.Strings = (
          #1056#1077#1085#1090#1075#1077#1085#1086#1075#1088#1072#1084#1084)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 150
        Height = 22
        Width = 129
      end
      object cxMemo162: TcxMemo
        Left = 624
        Top = 46
        Enabled = False
        Lines.Strings = (
          #1060#1083#1102#1086#1088#1086#1075#1088#1072#1084#1084)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 151
        Height = 22
        Width = 129
      end
      object cxMemo163: TcxMemo
        Left = 496
        Top = 67
        Enabled = False
        Lines.Strings = (
          #1085#1072' '#1087#1083#1077#1085#1082#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 152
        Height = 25
        Width = 65
      end
      object cxMemo180: TcxMemo
        Left = 560
        Top = 67
        Enabled = False
        Lines.Strings = (
          #1094#1080#1092#1088#1086#1074#1099#1093)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 153
        Height = 25
        Width = 65
      end
      object cxMemo181: TcxMemo
        Left = 624
        Top = 67
        Enabled = False
        Lines.Strings = (
          #1085#1072' '#1087#1083#1077#1085#1082#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 154
        Height = 25
        Width = 65
      end
      object cxMemo182: TcxMemo
        Left = 688
        Top = 67
        Enabled = False
        Lines.Strings = (
          #1094#1080#1092#1088#1086#1074#1099#1093)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 155
        Height = 25
        Width = 65
      end
      object cxMemo183: TcxMemo
        Left = 752
        Top = 46
        Enabled = False
        Lines.Strings = (
          #1058#1086#1084#1086#1075#1088#1072#1084#1084)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 156
        Height = 46
        Width = 89
      end
      object cxMemo16: TcxMemo
        Left = 976
        Top = 91
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
        TabOrder = 157
        Height = 25
        Width = 84
      end
      object cxTextEdit2: TcxTextEdit
        Left = 976
        Top = 115
        AutoSize = False
        Enabled = False
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
        TabOrder = 158
        Height = 30
        Width = 84
      end
      object cxTextEdit4: TcxTextEdit
        Tag = 1
        Left = 976
        Top = 144
        Hint = '5100_1.1_11R'
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
        TabOrder = 159
        Height = 33
        Width = 84
      end
      object cxTextEdit5: TcxTextEdit
        Left = 976
        Top = 176
        Hint = '5100_1.2_11R'
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
        TabOrder = 160
        Height = 33
        Width = 84
      end
      object cxTextEdit6: TcxTextEdit
        Left = 976
        Top = 208
        Hint = '5100_1.2.1_11R'
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
        TabOrder = 161
        Height = 49
        Width = 84
      end
      object cxTextEdit7: TcxTextEdit
        Left = 976
        Top = 257
        Hint = '5100_1.2.2_11R'
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
        TabOrder = 162
        Height = 33
        Width = 84
      end
      object cxTextEdit9: TcxTextEdit
        Left = 976
        Top = 290
        Hint = '5100_1.3_11R'
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
        TabOrder = 163
        Height = 33
        Width = 84
      end
      object cxTextEdit10: TcxTextEdit
        Left = 976
        Top = 323
        Hint = '5100_1.3.1_11R'
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
        TabOrder = 164
        Height = 33
        Width = 84
      end
      object cxTextEdit11: TcxTextEdit
        Left = 976
        Top = 356
        Hint = '5100_1.3.2_11R'
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
        TabOrder = 165
        Height = 33
        Width = 84
      end
      object cxTextEdit15: TcxTextEdit
        Left = 976
        Top = 389
        Hint = '5100_1.4_11R'
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
        TabOrder = 166
        Height = 33
        Width = 84
      end
      object cxTextEdit16: TcxTextEdit
        Left = 976
        Top = 422
        Hint = '5100_1.4.1_11R'
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
        TabOrder = 167
        Height = 33
        Width = 84
      end
      object cxTextEdit17: TcxTextEdit
        Left = 976
        Top = 455
        Hint = '5100_1.4.1.1_11R'
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
        TabOrder = 168
        Height = 33
        Width = 84
      end
      object cxTextEdit18: TcxTextEdit
        Left = 976
        Top = 488
        Hint = '5100_1.4.2_11R'
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
        TabOrder = 169
        Height = 33
        Width = 84
      end
      object cxTextEdit19: TcxTextEdit
        Left = 976
        Top = 521
        Hint = '5100_1.4.3_11R'
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
        TabOrder = 170
        Height = 33
        Width = 84
      end
      object cxMemo17: TcxMemo
        Left = 1059
        Top = 91
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
        TabOrder = 171
        Height = 25
        Width = 97
      end
      object cxTextEdit20: TcxTextEdit
        Left = 1059
        Top = 115
        AutoSize = False
        Enabled = False
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
        TabOrder = 172
        Height = 30
        Width = 97
      end
      object cxTextEdit21: TcxTextEdit
        Tag = 1
        Left = 1059
        Top = 144
        Hint = '5100_1.1_12R'
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
        TabOrder = 173
        Height = 33
        Width = 97
      end
      object cxTextEdit22: TcxTextEdit
        Left = 1059
        Top = 176
        Hint = '5100_1.2_12R'
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
        TabOrder = 174
        Height = 33
        Width = 97
      end
      object cxTextEdit23: TcxTextEdit
        Left = 1059
        Top = 208
        Hint = '5100_1.2.1_12R'
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
        TabOrder = 175
        Height = 49
        Width = 97
      end
      object cxTextEdit24: TcxTextEdit
        Left = 1059
        Top = 257
        Hint = '5100_1.2.2_12R'
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
        TabOrder = 176
        Height = 33
        Width = 97
      end
      object cxTextEdit25: TcxTextEdit
        Left = 1059
        Top = 290
        Hint = '5100_1.3_12R'
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
        TabOrder = 177
        Height = 33
        Width = 97
      end
      object cxTextEdit26: TcxTextEdit
        Left = 1059
        Top = 323
        Hint = '5100_1.3.1_12R'
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
        TabOrder = 178
        Height = 33
        Width = 97
      end
      object cxTextEdit27: TcxTextEdit
        Left = 1059
        Top = 356
        Hint = '5100_1.3.2_12R'
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
        TabOrder = 179
        Height = 33
        Width = 97
      end
      object cxTextEdit28: TcxTextEdit
        Left = 1059
        Top = 389
        Hint = '5100_1.4_12R'
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
        TabOrder = 180
        Height = 33
        Width = 97
      end
      object cxTextEdit29: TcxTextEdit
        Left = 1059
        Top = 422
        Hint = '5100_1.4.1_12R'
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
        TabOrder = 181
        Height = 33
        Width = 97
      end
      object cxTextEdit30: TcxTextEdit
        Left = 1059
        Top = 455
        Hint = '5100_1.4.1.1_12R'
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
        TabOrder = 182
        Height = 33
        Width = 97
      end
      object cxTextEdit31: TcxTextEdit
        Left = 1059
        Top = 488
        Hint = '5100_1.4.2_12R'
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
        TabOrder = 183
        Height = 33
        Width = 97
      end
      object cxTextEdit32: TcxTextEdit
        Left = 1059
        Top = 521
        Hint = '5100_1.4.3_12R'
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
        TabOrder = 184
        Height = 33
        Width = 97
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = '5111'
      ImageIndex = 1
      TabVisible = False
      object cxMemo41: TcxMemo
        Left = 3
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103
          #1086#1088#1075#1072#1085#1086#1074' '#1080' '#1089#1080#1089#1090#1077#1084)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 0
        Height = 49
        Width = 334
      end
      object cxMemo42: TcxMemo
        Left = 3
        Top = 69
        Enabled = False
        Lines.Strings = (
          #1056#1077#1085#1090#1075#1077#1085#1086#1093#1080#1088#1091#1088#1075#1080#1095#1077#1089#1082#1080#1077' '#1074#1084#1077#1096#1072#1090#1077#1083#1100#1089#1090#1074#1072', '#1074#1089#1077#1075#1086','
          #1074' '#1090#1086#1084' '#1095#1080#1089#1083#1077' '#1085#1072':')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 1
        Height = 41
        Width = 334
      end
      object cxMemo43: TcxMemo
        Left = 3
        Top = 109
        Enabled = False
        Lines.Strings = (
          '     '#1075#1086#1083#1086#1074#1085#1086#1084' '#1084#1086#1079#1075#1077)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 2
        Height = 25
        Width = 334
      end
      object cxMemo46: TcxMemo
        Left = 336
        Top = 0
        Enabled = False
        Lines.Strings = (
          #8470
          #1089#1090#1088#1086#1082
          #1080)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 3
        Height = 49
        Width = 41
      end
      object cxMemo47: TcxMemo
        Left = 336
        Top = 69
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
        TabOrder = 4
        Height = 41
        Width = 41
      end
      object cxMemo48: TcxMemo
        Left = 336
        Top = 109
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
        TabOrder = 5
        Height = 25
        Width = 41
      end
      object e00_5111_1: TcxTextEdit
        Left = 376
        Top = 69
        Hint = '5111_1_3R'
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
        TabOrder = 6
        Height = 41
        Width = 113
      end
      object e10_5111_2: TcxTextEdit
        Left = 376
        Top = 109
        Hint = '5111_2_3R'
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
        Height = 25
        Width = 113
      end
      object cxMemo18: TcxMemo
        Left = 376
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1042#1085#1091#1090#1088#1080#1089#1086#1089#1091#1076#1080#1089#1090#1099#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 8
        Height = 25
        Width = 225
      end
      object cxMemo20: TcxMemo
        Left = 376
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1044#1080#1072#1075#1085#1086#1089#1090#1080#1095#1077#1089#1082#1080#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 9
        Height = 25
        Width = 113
      end
      object cxMemo184: TcxMemo
        Left = 488
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1051#1077#1095#1077#1073#1085#1099#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 10
        Height = 25
        Width = 113
      end
      object cxMemo185: TcxMemo
        Left = 600
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1042#1085#1077#1089#1086#1089#1091#1076#1080#1089#1090#1099#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 11
        Height = 25
        Width = 225
      end
      object cxMemo186: TcxMemo
        Left = 600
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1044#1080#1072#1075#1085#1086#1089#1090#1080#1095#1077#1089#1082#1080#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 12
        Height = 25
        Width = 113
      end
      object cxMemo187: TcxMemo
        Left = 712
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1051#1077#1095#1077#1073#1085#1099#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 13
        Height = 25
        Width = 113
      end
      object cxTextEdit33: TcxTextEdit
        Left = 488
        Top = 69
        Hint = '5111_1_4R'
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
        Height = 41
        Width = 113
      end
      object cxTextEdit34: TcxTextEdit
        Left = 600
        Top = 69
        Hint = '5111_1_5R'
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
        Height = 41
        Width = 113
      end
      object cxTextEdit35: TcxTextEdit
        Left = 712
        Top = 69
        Hint = '5111_1_6R'
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
        Height = 41
        Width = 113
      end
      object cxTextEdit36: TcxTextEdit
        Left = 488
        Top = 109
        Hint = '5111_2_4R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit37: TcxTextEdit
        Left = 600
        Top = 109
        Hint = '5111_2_5R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit38: TcxTextEdit
        Left = 712
        Top = 109
        Hint = '5111_2_6R'
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
        Height = 25
        Width = 113
      end
      object cxMemo44: TcxMemo
        Left = 3
        Top = 133
        Enabled = False
        Lines.Strings = (
          '     '#1086#1073#1083#1072#1089#1090#1080' '#1096#1077#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 20
        Height = 25
        Width = 334
      end
      object cxMemo45: TcxMemo
        Left = 336
        Top = 133
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
        TabOrder = 21
        Height = 25
        Width = 41
      end
      object cxTextEdit39: TcxTextEdit
        Left = 376
        Top = 133
        Hint = '5111_3_3R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit40: TcxTextEdit
        Left = 488
        Top = 133
        Hint = '5111_3_4R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit41: TcxTextEdit
        Left = 600
        Top = 133
        Hint = '5111_3_5R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit42: TcxTextEdit
        Left = 712
        Top = 133
        Hint = '5111_3_6R'
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
        Height = 25
        Width = 113
      end
      object cxMemo49: TcxMemo
        Left = 3
        Top = 157
        Enabled = False
        Lines.Strings = (
          '     '#1084#1086#1083#1086#1095#1085#1099#1093' '#1078#1077#1083#1077#1079)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 26
        Height = 25
        Width = 334
      end
      object cxMemo50: TcxMemo
        Left = 336
        Top = 157
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
        TabOrder = 27
        Height = 25
        Width = 41
      end
      object cxTextEdit43: TcxTextEdit
        Left = 376
        Top = 157
        Hint = '5111_4_3R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit44: TcxTextEdit
        Left = 488
        Top = 157
        Hint = '5111_4_4R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit45: TcxTextEdit
        Left = 600
        Top = 157
        Hint = '5111_4_5R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit46: TcxTextEdit
        Left = 712
        Top = 157
        Hint = '5111_4_6R'
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
        Height = 25
        Width = 113
      end
      object cxMemo153: TcxMemo
        Left = 3
        Top = 181
        Enabled = False
        Lines.Strings = (
          '     '#1086#1088#1075#1072#1085#1072#1093' '#1075#1088#1091#1076#1085#1086#1081' '#1082#1083#1077#1090#1082#1080' '#1074#1089#1077#1075#1086'*')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 32
        Height = 25
        Width = 334
      end
      object cxMemo154: TcxMemo
        Left = 336
        Top = 181
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
        TabOrder = 33
        Height = 25
        Width = 41
      end
      object cxTextEdit47: TcxTextEdit
        Left = 376
        Top = 181
        Hint = '5111_5_3R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit48: TcxTextEdit
        Left = 488
        Top = 181
        Hint = '5111_5_4R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit49: TcxTextEdit
        Left = 600
        Top = 181
        Hint = '5111_5_5R'
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
        TabOrder = 36
        Height = 25
        Width = 113
      end
      object cxTextEdit50: TcxTextEdit
        Left = 712
        Top = 181
        Hint = '5111_5_6R'
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
        TabOrder = 37
        Height = 25
        Width = 113
      end
      object cxMemo155: TcxMemo
        Left = 3
        Top = 205
        Enabled = False
        Lines.Strings = (
          '          '#1080#1079' '#1085#1080#1093' '#1083#1077#1075#1086#1095#1085#1086#1081' '#1072#1088#1090#1077#1088#1080#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 38
        Height = 25
        Width = 334
      end
      object cxMemo156: TcxMemo
        Left = 336
        Top = 205
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
        TabOrder = 39
        Height = 25
        Width = 41
      end
      object cxTextEdit51: TcxTextEdit
        Left = 376
        Top = 205
        Hint = '5111_6_3R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit52: TcxTextEdit
        Left = 488
        Top = 205
        Hint = '5111_6_4R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit53: TcxTextEdit
        Left = 600
        Top = 205
        Hint = '5111_6_5R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit54: TcxTextEdit
        Left = 712
        Top = 205
        Hint = '5111_6_6R'
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
        Height = 25
        Width = 113
      end
      object cxMemo157: TcxMemo
        Left = 3
        Top = 229
        Enabled = False
        Lines.Strings = (
          '     '#1089#1077#1088#1076#1094#1077' '#1074#1089#1077#1075#1086)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 44
        Height = 25
        Width = 334
      end
      object cxMemo158: TcxMemo
        Left = 336
        Top = 229
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
        TabOrder = 45
        Height = 25
        Width = 41
      end
      object cxTextEdit55: TcxTextEdit
        Left = 376
        Top = 229
        Hint = '5111_7_3R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit56: TcxTextEdit
        Left = 488
        Top = 229
        Hint = '5111_7_4R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit57: TcxTextEdit
        Left = 600
        Top = 229
        Hint = '5111_7_5R'
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
        TabOrder = 48
        Height = 25
        Width = 113
      end
      object cxTextEdit58: TcxTextEdit
        Left = 712
        Top = 229
        Hint = '5111_7_6R'
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
        TabOrder = 49
        Height = 25
        Width = 113
      end
      object cxMemo159: TcxMemo
        Left = 3
        Top = 253
        Enabled = False
        Lines.Strings = (
          '          '#1080#1079' '#1085#1080#1093': '#1082#1086#1088#1086#1085#1072#1088#1085#1099#1093' '#1089#1086#1089#1091#1076#1072#1093)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 50
        Height = 25
        Width = 334
      end
      object cxMemo160: TcxMemo
        Left = 336
        Top = 253
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
        TabOrder = 51
        Height = 25
        Width = 41
      end
      object cxTextEdit59: TcxTextEdit
        Left = 376
        Top = 253
        Hint = '5111_8_3R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit60: TcxTextEdit
        Left = 488
        Top = 253
        Hint = '5111_8_4R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit61: TcxTextEdit
        Left = 600
        Top = 253
        Hint = '5111_8_5R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit62: TcxTextEdit
        Left = 712
        Top = 253
        Hint = '5111_8_6R'
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
        Height = 25
        Width = 113
      end
      object cxMemo188: TcxMemo
        Left = 3
        Top = 277
        Enabled = False
        Lines.Strings = (
          '          '#1082#1072#1084#1077#1088#1072#1093' '#1089#1077#1088#1076#1094#1072' '#1080' '#1082#1083#1072#1087#1072#1085#1072#1093)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 56
        Height = 25
        Width = 334
      end
      object cxMemo189: TcxMemo
        Left = 336
        Top = 277
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
        TabOrder = 57
        Height = 25
        Width = 41
      end
      object cxTextEdit63: TcxTextEdit
        Left = 376
        Top = 277
        Hint = '5111_9_3R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit64: TcxTextEdit
        Left = 488
        Top = 277
        Hint = '5111_9_4R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit65: TcxTextEdit
        Left = 600
        Top = 277
        Hint = '5111_9_5R'
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
        TabOrder = 60
        Height = 25
        Width = 113
      end
      object cxTextEdit66: TcxTextEdit
        Left = 712
        Top = 277
        Hint = '5111_9_6R'
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
        TabOrder = 61
        Height = 25
        Width = 113
      end
      object cxMemo190: TcxMemo
        Left = 3
        Top = 301
        Enabled = False
        Lines.Strings = (
          '     '#1075#1088#1091#1076#1085#1086#1081' '#1072#1086#1088#1090#1077)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 62
        Height = 25
        Width = 334
      end
      object cxMemo191: TcxMemo
        Left = 336
        Top = 301
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
        TabOrder = 63
        Height = 25
        Width = 41
      end
      object cxTextEdit67: TcxTextEdit
        Left = 376
        Top = 301
        Hint = '5111_10_3R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit68: TcxTextEdit
        Left = 488
        Top = 301
        Hint = '5111_10_4R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit69: TcxTextEdit
        Left = 600
        Top = 301
        Hint = '5111_10_5R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit70: TcxTextEdit
        Left = 712
        Top = 301
        Hint = '5111_10_6R'
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
        Height = 25
        Width = 113
      end
      object cxMemo192: TcxMemo
        Left = 3
        Top = 325
        Enabled = False
        Lines.Strings = (
          '     '#1073#1088#1102#1096#1085#1086#1081' '#1072#1086#1088#1090#1077)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 68
        Height = 25
        Width = 334
      end
      object cxMemo193: TcxMemo
        Left = 336
        Top = 325
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
        TabOrder = 69
        Height = 25
        Width = 41
      end
      object cxTextEdit71: TcxTextEdit
        Left = 376
        Top = 325
        Hint = '5111_11_3R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit72: TcxTextEdit
        Left = 488
        Top = 325
        Hint = '5111_11_4R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit73: TcxTextEdit
        Left = 600
        Top = 325
        Hint = '5111_11_5R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit74: TcxTextEdit
        Left = 712
        Top = 325
        Hint = '5111_11_6R'
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
        Height = 25
        Width = 113
      end
      object cxMemo194: TcxMemo
        Left = 3
        Top = 349
        Enabled = False
        Lines.Strings = (
          '     '#1085#1080#1078#1085#1077#1081' '#1087#1086#1083#1086#1081' '#1074#1077#1085#1077)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 74
        Height = 25
        Width = 334
      end
      object cxMemo195: TcxMemo
        Left = 336
        Top = 349
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
        TabOrder = 75
        Height = 25
        Width = 41
      end
      object cxTextEdit75: TcxTextEdit
        Left = 376
        Top = 349
        Hint = '5111_12_3R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit76: TcxTextEdit
        Left = 488
        Top = 349
        Hint = '5111_12_4R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit77: TcxTextEdit
        Left = 600
        Top = 349
        Hint = '5111_12_5R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit78: TcxTextEdit
        Left = 712
        Top = 349
        Hint = '5111_12_6R'
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
        Height = 25
        Width = 113
      end
      object cxMemo196: TcxMemo
        Left = 3
        Top = 373
        Enabled = False
        Lines.Strings = (
          '     '#1078#1077#1083#1091#1076#1086#1095#1085#1086'-'#1082#1080#1096#1077#1095#1085#1086#1084' '#1090#1088#1072#1082#1090#1077)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 80
        Height = 25
        Width = 334
      end
      object cxMemo197: TcxMemo
        Left = 336
        Top = 373
        Enabled = False
        Lines.Strings = (
          '13')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 81
        Height = 25
        Width = 41
      end
      object cxTextEdit79: TcxTextEdit
        Left = 376
        Top = 373
        Hint = '5111_13_3R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit80: TcxTextEdit
        Left = 488
        Top = 373
        Hint = '5111_13_4R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit81: TcxTextEdit
        Left = 600
        Top = 373
        Hint = '5111_13_5R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit82: TcxTextEdit
        Left = 712
        Top = 373
        Hint = '5111_13_6R'
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
        Height = 25
        Width = 113
      end
      object cxMemo198: TcxMemo
        Left = 3
        Top = 397
        Enabled = False
        Lines.Strings = (
          '     '#1087#1077#1095#1077#1085#1080', '#1078#1077#1083#1095#1085#1099#1093' '#1087#1091#1090#1103#1093', '#1089#1077#1083#1077#1079#1077#1085#1082#1077', '#1087#1086#1076#1078#1077#1083#1091#1076#1086#1095#1085#1086#1081' '
          #1078#1077#1083#1077#1079#1077)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 86
        Height = 25
        Width = 334
      end
      object cxMemo199: TcxMemo
        Left = 336
        Top = 397
        Enabled = False
        Lines.Strings = (
          '14')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 87
        Height = 25
        Width = 41
      end
      object cxTextEdit83: TcxTextEdit
        Left = 376
        Top = 397
        Hint = '5111_14_3R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit84: TcxTextEdit
        Left = 488
        Top = 397
        Hint = '5111_14_4R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit85: TcxTextEdit
        Left = 600
        Top = 397
        Hint = '5111_14_5R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit86: TcxTextEdit
        Left = 712
        Top = 397
        Hint = '5111_14_6R'
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
        Height = 25
        Width = 113
      end
      object cxMemo200: TcxMemo
        Left = 3
        Top = 421
        Enabled = False
        Lines.Strings = (
          '     '#1085#1072#1076#1087#1086#1095#1077#1095#1085#1080#1082#1072#1093)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 92
        Height = 25
        Width = 334
      end
      object cxMemo201: TcxMemo
        Left = 336
        Top = 421
        Enabled = False
        Lines.Strings = (
          '15')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 93
        Height = 25
        Width = 41
      end
      object cxTextEdit87: TcxTextEdit
        Left = 376
        Top = 421
        Hint = '5111_15_3R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit88: TcxTextEdit
        Left = 488
        Top = 421
        Hint = '5111_15_4R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit89: TcxTextEdit
        Left = 600
        Top = 421
        Hint = '5111_15_5R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit90: TcxTextEdit
        Left = 712
        Top = 421
        Hint = '5111_15_6R'
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
        Height = 25
        Width = 113
      end
      object cxMemo202: TcxMemo
        Left = 3
        Top = 445
        Enabled = False
        Lines.Strings = (
          '     '#1087#1086#1095#1082#1072#1093' '#1080' '#1084#1086#1095#1077#1090#1086#1095#1085#1080#1082#1072#1093)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 98
        Height = 25
        Width = 334
      end
      object cxMemo203: TcxMemo
        Left = 336
        Top = 445
        Enabled = False
        Lines.Strings = (
          '16')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 99
        Height = 25
        Width = 41
      end
      object cxTextEdit91: TcxTextEdit
        Left = 376
        Top = 445
        Hint = '5111_16_3R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit92: TcxTextEdit
        Left = 488
        Top = 445
        Hint = '5111_16_4R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit93: TcxTextEdit
        Left = 600
        Top = 445
        Hint = '5111_16_5R'
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
        Height = 25
        Width = 113
      end
      object cxTextEdit94: TcxTextEdit
        Left = 712
        Top = 445
        Hint = '5111_16_6R'
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
        TabOrder = 103
        Height = 25
        Width = 113
      end
      object cxMemo204: TcxMemo
        Left = 3
        Top = 469
        Enabled = False
        Lines.Strings = (
          '     '#1086#1088#1075#1072#1085#1072#1093' '#1084#1072#1083#1086#1075#1086' '#1090#1072#1079#1072' ('#1078#1077#1085#1089#1082#1086#1075#1086')')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 104
        Height = 25
        Width = 334
      end
      object cxMemo205: TcxMemo
        Left = 336
        Top = 469
        Enabled = False
        Lines.Strings = (
          '17')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 105
        Height = 25
        Width = 41
      end
      object cxTextEdit95: TcxTextEdit
        Left = 376
        Top = 469
        Hint = '5111_17_3R'
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
        TabOrder = 106
        Height = 25
        Width = 113
      end
      object cxTextEdit96: TcxTextEdit
        Left = 488
        Top = 469
        Hint = '5111_17_4R'
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
        TabOrder = 107
        Height = 25
        Width = 113
      end
      object cxTextEdit97: TcxTextEdit
        Left = 600
        Top = 469
        Hint = '5111_17_5R'
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
        TabOrder = 108
        Height = 25
        Width = 113
      end
      object cxTextEdit98: TcxTextEdit
        Left = 712
        Top = 469
        Hint = '5111_17_6R'
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
        TabOrder = 109
        Height = 25
        Width = 113
      end
      object cxMemo206: TcxMemo
        Left = 3
        Top = 493
        Enabled = False
        Lines.Strings = (
          '     '#1086#1088#1075#1072#1085#1072#1093' '#1084#1072#1083#1086#1075#1086' '#1090#1072#1079#1072' ('#1084#1091#1078#1089#1082#1086#1075#1086')')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 110
        Height = 25
        Width = 334
      end
      object cxMemo207: TcxMemo
        Left = 336
        Top = 493
        Enabled = False
        Lines.Strings = (
          '18')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 111
        Height = 25
        Width = 41
      end
      object cxTextEdit99: TcxTextEdit
        Left = 376
        Top = 493
        Hint = '5111_18_3R'
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
        TabOrder = 112
        Height = 25
        Width = 113
      end
      object cxTextEdit100: TcxTextEdit
        Left = 488
        Top = 493
        Hint = '5111_18_4R'
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
        TabOrder = 113
        Height = 25
        Width = 113
      end
      object cxTextEdit101: TcxTextEdit
        Left = 600
        Top = 493
        Hint = '5111_18_5R'
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
        TabOrder = 114
        Height = 25
        Width = 113
      end
      object cxTextEdit102: TcxTextEdit
        Left = 712
        Top = 493
        Hint = '5111_18_6R'
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
        TabOrder = 115
        Height = 25
        Width = 113
      end
      object cxMemo208: TcxMemo
        Left = 3
        Top = 517
        Enabled = False
        Lines.Strings = (
          '     '#1082#1086#1085#1077#1095#1085#1086#1089#1090#1103#1093)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 116
        Height = 25
        Width = 334
      end
      object cxMemo209: TcxMemo
        Left = 336
        Top = 517
        Enabled = False
        Lines.Strings = (
          '19')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 117
        Height = 25
        Width = 41
      end
      object cxTextEdit103: TcxTextEdit
        Left = 376
        Top = 517
        Hint = '5111_19_3R'
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
        TabOrder = 118
        Height = 25
        Width = 113
      end
      object cxTextEdit104: TcxTextEdit
        Left = 488
        Top = 517
        Hint = '5111_19_4R'
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
        TabOrder = 119
        Height = 25
        Width = 113
      end
      object cxTextEdit105: TcxTextEdit
        Left = 600
        Top = 517
        Hint = '5111_19_5R'
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
        TabOrder = 120
        Height = 25
        Width = 113
      end
      object cxTextEdit106: TcxTextEdit
        Left = 712
        Top = 517
        Hint = '5111_19_6R'
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
        TabOrder = 121
        Height = 25
        Width = 113
      end
      object cxMemo210: TcxMemo
        Left = 3
        Top = 541
        Enabled = False
        Lines.Strings = (
          '     '#1087#1086#1079#1074#1086#1085#1086#1095#1085#1080#1082#1077)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 122
        Height = 25
        Width = 334
      end
      object cxMemo211: TcxMemo
        Left = 336
        Top = 541
        Enabled = False
        Lines.Strings = (
          '20')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 123
        Height = 25
        Width = 41
      end
      object cxTextEdit107: TcxTextEdit
        Left = 376
        Top = 541
        Hint = '5111_20_3R'
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
        TabOrder = 124
        Height = 25
        Width = 113
      end
      object cxTextEdit108: TcxTextEdit
        Left = 488
        Top = 541
        Hint = '5111_20_4R'
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
        TabOrder = 125
        Height = 25
        Width = 113
      end
      object cxTextEdit109: TcxTextEdit
        Left = 600
        Top = 541
        Hint = '5111_20_5R'
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
        TabOrder = 126
        Height = 25
        Width = 113
      end
      object cxTextEdit110: TcxTextEdit
        Left = 712
        Top = 541
        Hint = '5111_20_6R'
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
        TabOrder = 127
        Height = 25
        Width = 113
      end
      object cxMemo212: TcxMemo
        Left = 3
        Top = 565
        Enabled = False
        Lines.Strings = (
          '     '#1087#1088#1086#1095#1080#1093' '#1086#1088#1075#1072#1085#1072#1093' '#1080' '#1089#1080#1089#1090#1077#1084#1072#1093)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 128
        Height = 25
        Width = 334
      end
      object cxMemo213: TcxMemo
        Left = 336
        Top = 565
        Enabled = False
        Lines.Strings = (
          '21')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 129
        Height = 25
        Width = 41
      end
      object cxTextEdit111: TcxTextEdit
        Left = 376
        Top = 565
        Hint = '5111_21_3R'
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
        TabOrder = 130
        Height = 25
        Width = 113
      end
      object cxTextEdit112: TcxTextEdit
        Left = 488
        Top = 565
        Hint = '5111_21_4R'
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
        TabOrder = 131
        Height = 25
        Width = 113
      end
      object cxTextEdit113: TcxTextEdit
        Left = 600
        Top = 565
        Hint = '5111_21_5R'
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
        TabOrder = 132
        Height = 25
        Width = 113
      end
      object cxTextEdit114: TcxTextEdit
        Left = 712
        Top = 565
        Hint = '5111_21_6R'
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
        TabOrder = 133
        Height = 25
        Width = 113
      end
      object cxLabel2: TcxLabel
        Left = 3
        Top = 596
        Caption = '* '#1073#1077#1079' '#1089#1077#1088#1076#1094#1072' '#1080' '#1075#1088#1091#1076#1085#1086#1081' '#1072#1086#1088#1090#1099
      end
      object cxMemo214: TcxMemo
        Left = 3
        Top = 48
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
        TabOrder = 135
        Height = 22
        Width = 334
      end
      object cxMemo215: TcxMemo
        Left = 336
        Top = 48
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
        TabOrder = 136
        Height = 22
        Width = 41
      end
      object cxMemo216: TcxMemo
        Left = 376
        Top = 48
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
        TabOrder = 137
        Height = 22
        Width = 113
      end
      object cxMemo217: TcxMemo
        Left = 488
        Top = 48
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
        TabOrder = 138
        Height = 22
        Width = 113
      end
      object cxMemo218: TcxMemo
        Left = 600
        Top = 48
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
        TabOrder = 139
        Height = 22
        Width = 113
      end
      object cxMemo219: TcxMemo
        Left = 712
        Top = 48
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
        TabOrder = 140
        Height = 22
        Width = 113
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = '5112'
      ImageIndex = 2
      TabVisible = False
      object cxMemo51: TcxMemo
        Left = 3
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1048#1079' '#1086#1073#1097#1077#1075#1086' '#1095#1080#1089#1083#1072' '#1088#1077#1085#1090#1075#1077#1085#1086#1101#1085#1076#1086#1074#1072#1089#1082#1091#1083#1103#1088#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1074#1099#1087#1086#1083#1085#1077#1085#1086':'
          #1087#1072#1094#1080#1077#1085#1090#1072#1084' '#1089' '#1080#1085#1092#1072#1088#1082#1090#1086#1084' '#1084#1080#1086#1082#1072#1088#1076#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 0
        Height = 33
        Width = 382
      end
      object cxMemo52: TcxMemo
        Left = 3
        Top = 32
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1085#1080#1093' '#1074' '#1087#1077#1088#1074#1099#1077' 90 '#1084#1080#1085#1091#1090' '#1086#1090' '#1084#1086#1084#1077#1085#1090#1072' '#1075#1086#1089#1087#1080#1090#1072#1083#1080#1079#1072#1094#1080#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 1
        Height = 33
        Width = 382
      end
      object cxMemo54: TcxMemo
        Left = 3
        Top = 64
        Enabled = False
        Lines.Strings = (
          #1089' '#1080#1085#1092#1072#1088#1082#1090#1086#1084' '#1084#1086#1079#1075#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 2
        Height = 33
        Width = 382
      end
      object cxMemo55: TcxMemo
        Left = 3
        Top = 96
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1086#1073#1097#1077#1075#1086' '#1095#1080#1089#1083#1072' '#1088#1077#1085#1090#1075#1077#1085#1086#1093#1080#1088#1091#1088#1075#1080#1095#1077#1089#1082#1080#1093' '#1087#1088#1086#1094#1077#1076#1091#1088' '#1074#1099#1087#1086#1083#1085#1077#1085#1086' '#1085#1072
          #1088#1077#1085#1090#1075#1077#1085#1086#1090#1077#1083#1077#1074#1080#1079#1080#1086#1085#1085#1099#1093' '#1091#1089#1090#1072#1085#1086#1074#1082#1072#1093' '#1090#1080#1087#1072' '#1057'-'#1044#1091#1075#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 3
        Height = 33
        Width = 382
      end
      object cxMemo56: TcxMemo
        Left = 3
        Top = 128
        Enabled = False
        Lines.Strings = (
          #1087#1086#1076' '#1082#1086#1085#1090#1088#1086#1083#1077#1084' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1085#1086#1081' '#1090#1086#1084#1086#1075#1088#1072#1092#1080#1080' ('#1050#1058')')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 4
        Height = 33
        Width = 382
      end
      object cxMemo57: TcxMemo
        Left = 3
        Top = 160
        Enabled = False
        Lines.Strings = (
          #1087#1086#1076' '#1082#1086#1085#1090#1088#1086#1083#1077#1084' '#1091#1083#1100#1090#1088#1072#1079#1074#1091#1082#1072' ('#1059#1047')')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 5
        Height = 33
        Width = 382
      end
      object cxMemo58: TcxMemo
        Left = 384
        Top = 0
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
        TabOrder = 6
        Height = 33
        Width = 41
      end
      object cxMemo59: TcxMemo
        Left = 384
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
        TabOrder = 7
        Height = 33
        Width = 41
      end
      object cxMemo61: TcxMemo
        Left = 384
        Top = 64
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
        TabOrder = 8
        Height = 33
        Width = 41
      end
      object cxMemo62: TcxMemo
        Left = 384
        Top = 96
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
        TabOrder = 9
        Height = 33
        Width = 41
      end
      object cxMemo63: TcxMemo
        Left = 384
        Top = 128
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
        TabOrder = 10
        Height = 33
        Width = 41
      end
      object cxMemo64: TcxMemo
        Left = 384
        Top = 160
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
        TabOrder = 11
        Height = 33
        Width = 41
      end
      object e00_5112_1: TcxTextEdit
        Left = 424
        Top = 0
        Hint = '5112_1_1NR'
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
        Height = 33
        Width = 65
      end
      object e10_5112_2: TcxTextEdit
        Left = 424
        Top = 32
        Hint = '5112_2_1NR'
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
        Height = 33
        Width = 65
      end
      object e30_5112_4: TcxTextEdit
        Left = 424
        Top = 64
        Hint = '5112_3_1NR'
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
        Height = 33
        Width = 65
      end
      object e40_5112_5: TcxTextEdit
        Left = 424
        Top = 96
        Hint = '5112_4_1NR'
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
        Height = 33
        Width = 65
      end
      object e50_5112_6: TcxTextEdit
        Left = 424
        Top = 128
        Hint = '5112_5_1NR'
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
        Height = 33
        Width = 65
      end
      object e60_5112_7: TcxTextEdit
        Left = 424
        Top = 160
        Hint = '5112_6_1NR'
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
        Height = 33
        Width = 65
      end
      object cxMemo164: TcxMemo
        Left = 3
        Top = 192
        Enabled = False
        Lines.Strings = (
          #1087#1086#1076' '#1082#1086#1085#1090#1088#1086#1083#1077#1084' '#1084#1072#1075#1085#1080#1090#1085#1086'-'#1088#1077#1079#1086#1085#1072#1085#1089#1085#1086#1081' '#1090#1086#1084#1086#1075#1088#1072#1092#1080#1080' ('#1052#1056#1058')')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 18
        Height = 33
        Width = 382
      end
      object cxMemo169: TcxMemo
        Left = 384
        Top = 192
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
        TabOrder = 19
        Height = 33
        Width = 41
      end
      object e70_5112_8: TcxTextEdit
        Left = 424
        Top = 192
        Hint = '5112_7_1NR'
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
        Height = 33
        Width = 65
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = '5113'
      ImageIndex = 3
      TabVisible = False
      object cxMemo65: TcxMemo
        Left = 3
        Top = 99
        Enabled = False
        Lines.Strings = (
          #1042#1089#1077#1075#1086' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 0
        Height = 33
        Width = 318
      end
      object cxMemo71: TcxMemo
        Left = 320
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
        Height = 77
        Width = 49
      end
      object cxMemo72: TcxMemo
        Left = 320
        Top = 99
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
        TabOrder = 2
        Height = 33
        Width = 49
      end
      object cxMemo73: TcxMemo
        Left = 320
        Top = 131
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
        TabOrder = 3
        Height = 33
        Width = 49
      end
      object cxMemo74: TcxMemo
        Left = 320
        Top = 163
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
        TabOrder = 4
        Height = 33
        Width = 49
      end
      object cxMemo75: TcxMemo
        Left = 320
        Top = 195
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
        TabOrder = 5
        Height = 33
        Width = 49
      end
      object cxMemo76: TcxMemo
        Left = 320
        Top = 227
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
        TabOrder = 6
        Height = 33
        Width = 49
      end
      object e00_5113_1_3: TcxTextEdit
        Left = 368
        Top = 99
        Hint = '5113_1_3R'
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
        Height = 33
        Width = 81
      end
      object e10_5113_2_3: TcxTextEdit
        Left = 368
        Top = 131
        Hint = '5113_2_3R'
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
        Height = 33
        Width = 81
      end
      object e20_5113_3_3: TcxTextEdit
        Left = 368
        Top = 163
        Hint = '5113_3_3R'
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
        Height = 33
        Width = 81
      end
      object e30_5113_4_3: TcxTextEdit
        Left = 368
        Top = 195
        Hint = '5113_4_3R'
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
        Height = 33
        Width = 81
      end
      object e40_5113_5_3: TcxTextEdit
        Left = 368
        Top = 227
        Hint = '5113_5_3R'
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
        Height = 33
        Width = 81
      end
      object cxMemo142: TcxMemo
        Left = 3
        Top = 131
        Enabled = False
        Lines.Strings = (
          #1074' '#1090'.'#1095'.: '#1075#1086#1083#1086#1074#1085#1086#1075#1086' '#1084#1086#1079#1075#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 12
        Height = 33
        Width = 318
      end
      object cxMemo143: TcxMemo
        Left = 3
        Top = 163
        Enabled = False
        Lines.Strings = (
          '            '#1095#1077#1083#1102#1089#1090#1085#1086'-'#1083#1080#1094#1077#1074#1086#1081' '#1086#1073#1083#1072#1089#1090#1080', '#1074#1080#1089#1086#1095#1085#1099#1093' '#1082#1086#1089#1090#1077#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 13
        Height = 33
        Width = 318
      end
      object cxMemo144: TcxMemo
        Left = 3
        Top = 195
        Enabled = False
        Lines.Strings = (
          '            '#1086#1073#1083#1072#1089#1090#1080' '#1096#1077#1080', '#1075#1086#1088#1090#1072#1085#1080' '#1080' '#1075#1086#1088#1090#1072#1085#1086#1075#1083#1086#1090#1082#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 14
        Height = 33
        Width = 318
      end
      object cxMemo145: TcxMemo
        Left = 3
        Top = 227
        Enabled = False
        Lines.Strings = (
          '            '#1086#1088#1075#1072#1085#1086#1074' '#1075#1088#1091#1076#1085#1086#1081' '#1082#1083#1077#1090#1082#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 15
        Height = 33
        Width = 318
      end
      object cxMemo146: TcxMemo
        Left = 3
        Top = 259
        Enabled = False
        Lines.Strings = (
          '            '#1089#1077#1088#1076#1094#1072' '#1080' '#1082#1086#1088#1086#1085#1072#1088#1085#1099#1093' '#1089#1086#1089#1091#1076#1086#1074)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 16
        Height = 33
        Width = 318
      end
      object cxMemo147: TcxMemo
        Left = 320
        Top = 259
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
        TabOrder = 17
        Height = 33
        Width = 49
      end
      object e50_5113_6_3: TcxTextEdit
        Left = 368
        Top = 259
        Hint = '5113_6_3R'
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
        Height = 33
        Width = 81
      end
      object cxMemo178: TcxMemo
        Left = 368
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
        TabOrder = 19
        Height = 77
        Width = 81
      end
      object cxMemo179: TcxMemo
        Left = 448
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1085#1080#1093':')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 20
        Height = 25
        Width = 409
      end
      object e01_5113_1_4: TcxTextEdit
        Left = 448
        Top = 131
        Hint = '5113_2_4R'
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
        Height = 33
        Width = 137
      end
      object e11_5113_2_4: TcxTextEdit
        Left = 448
        Top = 99
        Hint = '5113_1_4R'
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
        Height = 33
        Width = 137
      end
      object e21_5113_3_4: TcxTextEdit
        Left = 448
        Top = 163
        Hint = '5113_3_4R'
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
        Height = 33
        Width = 137
      end
      object e31_5113_4_4: TcxTextEdit
        Left = 448
        Top = 195
        Hint = '5113_4_4R'
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
        Height = 33
        Width = 137
      end
      object e41_5113_5_4: TcxTextEdit
        Left = 448
        Top = 227
        Hint = '5113_5_4R'
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
        Height = 33
        Width = 137
      end
      object e51_5113_6_4: TcxTextEdit
        Left = 448
        Top = 259
        Hint = '5113_6_4R'
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
        TabOrder = 26
        Height = 33
        Width = 137
      end
      object cxMemo66: TcxMemo
        Left = 3
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103' '
          #1086#1088#1075#1072#1085#1086#1074' '#1080' '#1089#1080#1089#1090#1077#1084)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 27
        Height = 77
        Width = 318
      end
      object cxMemo67: TcxMemo
        Left = 448
        Top = 76
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
        TabOrder = 28
        Height = 24
        Width = 137
      end
      object cxMemo68: TcxMemo
        Left = 368
        Top = 76
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
        TabOrder = 29
        Height = 24
        Width = 81
      end
      object cxMemo69: TcxMemo
        Left = 320
        Top = 76
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
        TabOrder = 30
        Height = 24
        Width = 49
      end
      object cxMemo70: TcxMemo
        Left = 3
        Top = 76
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
        TabOrder = 31
        Height = 24
        Width = 318
      end
      object cxMemo53: TcxMemo
        Left = 448
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1089' '#1074#1085#1091#1090#1088#1080#1074#1077#1085#1085#1099#1084
          #1082#1086#1085#1090#1088#1072#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077#1084)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 32
        Height = 53
        Width = 137
      end
      object cxMemo60: TcxMemo
        Left = 584
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1089' '#1074#1085#1091#1090#1088#1080#1074#1077#1085#1085#1099#1084
          #1073#1086#1083#1102#1089#1085#1099#1084
          #1082#1086#1085#1090#1088#1072#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077#1084)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 33
        Height = 53
        Width = 137
      end
      object cxMemo165: TcxMemo
        Left = 720
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1074' '#1087#1086#1083#1080#1082#1083#1080#1085#1080#1082#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 34
        Height = 53
        Width = 137
      end
      object cxMemo166: TcxMemo
        Left = 3
        Top = 291
        Enabled = False
        Lines.Strings = (
          '            '#1086#1088#1075#1072#1085#1086#1074' '#1073#1088#1102#1096#1085#1086#1081' '#1087#1086#1083#1086#1089#1090#1080' ('#1087#1077#1095#1077#1085#1100', '#1089#1077#1083#1077#1079#1077#1085#1082#1072','
          '            '#1087#1086#1076#1078#1077#1083#1091#1076#1086#1095#1085#1072#1103' '#1078#1077#1083#1077#1079#1072', '#1085#1072#1076#1087#1086#1095#1077#1095#1085#1080#1082#1080')')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 35
        Height = 33
        Width = 318
      end
      object cxMemo167: TcxMemo
        Left = 3
        Top = 323
        Enabled = False
        Lines.Strings = (
          '            '#1087#1086#1095#1077#1082' '#1080' '#1084#1086#1095#1077#1074#1099#1074#1086#1076#1103#1097#1080#1093' '#1087#1091#1090#1077#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 36
        Height = 33
        Width = 318
      end
      object cxMemo168: TcxMemo
        Left = 3
        Top = 355
        Enabled = False
        Lines.Strings = (
          '            '#1086#1088#1075#1072#1085#1086#1074' '#1084#1072#1083#1086#1075#1086' '#1090#1072#1079#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 37
        Height = 33
        Width = 318
      end
      object cxMemo170: TcxMemo
        Left = 3
        Top = 387
        Enabled = False
        Lines.Strings = (
          '            '#1087#1086#1079#1074#1086#1085#1086#1095#1085#1080#1082#1072' ('#1096#1077#1081#1085#1099#1081' '#1080' '#1075#1088#1091#1076#1085#1086#1081' '#1086#1090#1076#1077#1083#1099')')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 38
        Height = 33
        Width = 318
      end
      object cxMemo171: TcxMemo
        Left = 3
        Top = 419
        Enabled = False
        Lines.Strings = (
          '            '#1087#1086#1079#1074#1086#1085#1086#1095#1085#1080#1082#1072' ('#1087#1086#1103#1089#1085#1080#1095#1085#1099#1081' '#1080' '#1082#1088#1077#1089#1090#1094#1086#1074#1099#1081' '#1086#1090#1076#1077#1083#1099')')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 39
        Height = 33
        Width = 318
      end
      object cxMemo172: TcxMemo
        Left = 3
        Top = 451
        Enabled = False
        Lines.Strings = (
          '            '#1089#1091#1089#1090#1072#1074#1086#1074' '#1082#1086#1085#1077#1095#1085#1086#1089#1090#1077#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 40
        Height = 33
        Width = 318
      end
      object cxMemo173: TcxMemo
        Left = 3
        Top = 483
        Enabled = False
        Lines.Strings = (
          '            '#1087#1088#1086#1095#1080#1093' '#1086#1088#1075#1072#1085#1086#1074' '#1080' '#1089#1080#1089#1090#1077#1084)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 41
        Height = 33
        Width = 318
      end
      object cxMemo220: TcxMemo
        Left = 584
        Top = 76
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
        TabOrder = 42
        Height = 24
        Width = 137
      end
      object cxMemo221: TcxMemo
        Left = 720
        Top = 76
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
        TabOrder = 43
        Height = 24
        Width = 137
      end
      object cxMemo222: TcxMemo
        Left = 320
        Top = 387
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
        TabOrder = 44
        Height = 33
        Width = 49
      end
      object cxTextEdit115: TcxTextEdit
        Left = 584
        Top = 99
        Hint = '5113_1_5R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit116: TcxTextEdit
        Left = 584
        Top = 131
        Hint = '5113_2_5R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit117: TcxTextEdit
        Left = 584
        Top = 163
        Hint = '5113_3_5R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit118: TcxTextEdit
        Left = 584
        Top = 195
        Hint = '5113_4_5R'
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
        TabOrder = 48
        Height = 33
        Width = 137
      end
      object cxTextEdit119: TcxTextEdit
        Left = 584
        Top = 227
        Hint = '5113_5_5R'
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
        TabOrder = 49
        Height = 33
        Width = 137
      end
      object cxTextEdit120: TcxTextEdit
        Left = 584
        Top = 259
        Hint = '5113_6_5R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit121: TcxTextEdit
        Left = 720
        Top = 99
        Hint = '5113_1_6R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit122: TcxTextEdit
        Left = 720
        Top = 131
        Hint = '5113_2_6R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit123: TcxTextEdit
        Left = 720
        Top = 163
        Hint = '5113_3_6R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit124: TcxTextEdit
        Left = 720
        Top = 195
        Hint = '5113_4_6R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit125: TcxTextEdit
        Left = 720
        Top = 227
        Hint = '5113_5_6R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit126: TcxTextEdit
        Left = 720
        Top = 259
        Hint = '5113_6_6R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit13: TcxTextEdit
        Left = 448
        Top = 291
        Hint = '5113_7_4R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit14: TcxTextEdit
        Left = 584
        Top = 291
        Hint = '5113_7_5R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit127: TcxTextEdit
        Left = 720
        Top = 291
        Hint = '5113_7_6R'
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
        TabOrder = 60
        Height = 33
        Width = 137
      end
      object cxTextEdit128: TcxTextEdit
        Left = 720
        Top = 323
        Hint = '5113_8_6R'
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
        TabOrder = 61
        Height = 33
        Width = 137
      end
      object cxTextEdit129: TcxTextEdit
        Left = 584
        Top = 323
        Hint = '5113_8_5R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit130: TcxTextEdit
        Left = 448
        Top = 323
        Hint = '5113_8_4R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit133: TcxTextEdit
        Left = 448
        Top = 355
        Hint = '5113_9_4R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit134: TcxTextEdit
        Left = 584
        Top = 355
        Hint = '5113_9_5R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit135: TcxTextEdit
        Left = 720
        Top = 355
        Hint = '5113_9_6R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit136: TcxTextEdit
        Left = 720
        Top = 387
        Hint = '5113_10_6R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit137: TcxTextEdit
        Left = 584
        Top = 387
        Hint = '5113_10_5R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit138: TcxTextEdit
        Left = 448
        Top = 387
        Hint = '5113_10_4R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit139: TcxTextEdit
        Left = 368
        Top = 387
        Hint = '5113_10_3R'
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
        Height = 33
        Width = 81
      end
      object cxTextEdit140: TcxTextEdit
        Left = 368
        Top = 419
        Hint = '5113_11_3R'
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
        Height = 33
        Width = 81
      end
      object cxTextEdit141: TcxTextEdit
        Left = 448
        Top = 419
        Hint = '5113_11_4R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit142: TcxTextEdit
        Left = 584
        Top = 419
        Hint = '5113_11_5R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit143: TcxTextEdit
        Left = 720
        Top = 419
        Hint = '5113_11_6R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit144: TcxTextEdit
        Left = 720
        Top = 451
        Hint = '5113_12_6R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit145: TcxTextEdit
        Left = 584
        Top = 451
        Hint = '5113_12_5R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit146: TcxTextEdit
        Left = 448
        Top = 451
        Hint = '5113_12_4R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit147: TcxTextEdit
        Left = 368
        Top = 451
        Hint = '5113_12_3R'
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
        Height = 33
        Width = 81
      end
      object cxTextEdit148: TcxTextEdit
        Left = 368
        Top = 483
        Hint = '5113_13_3R'
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
        Height = 33
        Width = 81
      end
      object cxTextEdit149: TcxTextEdit
        Left = 448
        Top = 483
        Hint = '5113_13_4R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit150: TcxTextEdit
        Left = 584
        Top = 483
        Hint = '5113_13_5R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit151: TcxTextEdit
        Left = 720
        Top = 483
        Hint = '5113_13_6R'
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
        Height = 33
        Width = 137
      end
      object cxTextEdit12: TcxTextEdit
        Left = 368
        Top = 291
        Hint = '5113_7_3R'
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
        Height = 33
        Width = 81
      end
      object cxTextEdit131: TcxTextEdit
        Left = 368
        Top = 323
        Hint = '5113_8_3R'
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
        Height = 33
        Width = 81
      end
      object cxTextEdit132: TcxTextEdit
        Left = 368
        Top = 355
        Hint = '5113_9_3R'
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
        Height = 33
        Width = 81
      end
      object cxMemo96: TcxMemo
        Left = 320
        Top = 483
        Enabled = False
        Lines.Strings = (
          '13')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 85
        Height = 33
        Width = 49
      end
      object cxMemo223: TcxMemo
        Left = 320
        Top = 451
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
        TabOrder = 86
        Height = 33
        Width = 49
      end
      object cxMemo224: TcxMemo
        Left = 320
        Top = 419
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
        TabOrder = 87
        Height = 33
        Width = 49
      end
      object cxMemo150: TcxMemo
        Left = 320
        Top = 355
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
        TabOrder = 88
        Height = 33
        Width = 49
      end
      object cxMemo151: TcxMemo
        Left = 320
        Top = 291
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
        TabOrder = 89
        Height = 33
        Width = 49
      end
      object cxMemo152: TcxMemo
        Left = 320
        Top = 323
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
        TabOrder = 90
        Height = 33
        Width = 49
      end
    end
    object cxTabSheet5: TcxTabSheet
      Caption = '5114'
      ImageIndex = 4
      TabVisible = False
      object cxMemo77: TcxMemo
        Left = 3
        Top = 3
        Enabled = False
        Lines.Strings = (
          #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1077#1085#1090#1075#1077#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 0
        Height = 70
        Width = 363
      end
      object cxMemo78: TcxMemo
        Left = 0
        Top = 72
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
        Width = 366
      end
      object cxMemo79: TcxMemo
        Left = 0
        Top = 97
        Enabled = False
        Lines.Strings = (
          #1063#1080#1089#1083#1086' '#1088#1077#1085#1090#1075#1077#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1093' '#1087#1088#1086#1092#1080#1083#1072#1082#1090#1080#1095#1077#1089#1082#1080#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '
          #1086#1088#1075#1072#1085#1086#1074
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
        Width = 366
      end
      object cxMemo80: TcxMemo
        Left = 0
        Top = 129
        Enabled = False
        Lines.Strings = (
          '     '#1080#1079' '#1085#1080#1093' '#1074#1099#1087#1086#1083#1085#1077#1085#1086':'
          '     '#1085#1072' '#1087#1083#1077#1085#1086#1095#1085#1099#1093' '#1092#1083#1102#1086#1088#1086#1075#1088#1072#1092#1072#1093)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 3
        Height = 33
        Width = 366
      end
      object cxMemo81: TcxMemo
        Left = 0
        Top = 161
        Enabled = False
        Lines.Strings = (
          '     '#1085#1072' '#1094#1080#1092#1088#1086#1074#1099#1093' '#1072#1087#1087#1072#1088#1072#1090#1072#1093' '#1080' '#1089#1080#1089#1090#1077#1084#1072#1093' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1085#1086#1081' '#1088#1072#1076#1080#1086#1075#1088#1072#1092#1080#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 4
        Height = 33
        Width = 366
      end
      object cxMemo82: TcxMemo
        Left = 0
        Top = 193
        Enabled = False
        Lines.Strings = (
          '     '#1088#1077#1085#1090#1075#1077#1085#1086#1075#1088#1072#1092#1080#1081' '#1085#1072' '#1087#1083#1077#1085#1082#1077)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 5
        Height = 33
        Width = 366
      end
      object cxMemo83: TcxMemo
        Left = 0
        Top = 225
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
        Width = 366
      end
      object cxMemo85: TcxMemo
        Left = 365
        Top = 3
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
        TabOrder = 7
        Height = 70
        Width = 65
      end
      object cxMemo86: TcxMemo
        Left = 365
        Top = 72
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
        TabOrder = 8
        Height = 26
        Width = 65
      end
      object cxMemo87: TcxMemo
        Left = 429
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
        TabOrder = 9
        Height = 70
        Width = 64
      end
      object cxMemo88: TcxMemo
        Left = 492
        Top = 28
        Enabled = False
        Lines.Strings = (
          #1076#1077#1090#1103#1084
          '0 - 17 '#1083#1077#1090' '
          '('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 10
        Height = 45
        Width = 153
      end
      object cxMemo89: TcxMemo
        Left = 429
        Top = 72
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
        TabOrder = 11
        Height = 26
        Width = 64
      end
      object cxMemo90: TcxMemo
        Left = 492
        Top = 72
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
        TabOrder = 12
        Height = 26
        Width = 153
      end
      object e00_5114_1_3: TcxTextEdit
        Left = 429
        Top = 97
        Hint = '5114_1_3NR'
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
        Height = 33
        Width = 64
      end
      object e01_5114_1_4: TcxTextEdit
        Left = 492
        Top = 97
        Hint = '5114_1_4NR'
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
        Height = 33
        Width = 153
      end
      object e11_5114_2_4: TcxTextEdit
        Left = 492
        Top = 129
        Hint = '5114_2_4NR'
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
        Height = 33
        Width = 153
      end
      object e10_5114_2_3: TcxTextEdit
        Left = 429
        Top = 129
        Hint = '5114_2_3NR'
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
        Height = 33
        Width = 64
      end
      object e20_5114_3_3: TcxTextEdit
        Left = 429
        Top = 161
        Hint = '5114_3_3NR'
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
        Height = 33
        Width = 64
      end
      object e21_5114_3_4: TcxTextEdit
        Left = 492
        Top = 161
        Hint = '5114_3_4NR'
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
        Height = 33
        Width = 153
      end
      object e30_5114_4_3: TcxTextEdit
        Left = 429
        Top = 193
        Hint = '5114_4_3NR'
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
        Height = 33
        Width = 64
      end
      object e31_5114_4_4: TcxTextEdit
        Left = 492
        Top = 193
        Hint = '5114_4_4NR'
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
        Height = 33
        Width = 153
      end
      object e40_5114_5_3: TcxTextEdit
        Left = 429
        Top = 225
        Hint = '5114_5_3NR'
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
        Height = 33
        Width = 64
      end
      object e41_5114_5_4: TcxTextEdit
        Left = 492
        Top = 225
        Hint = '5114_5_4NR'
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
        TabOrder = 22
        Height = 33
        Width = 153
      end
      object e50_5114_6_3: TcxTextEdit
        Left = 429
        Top = 257
        Hint = '5114_6_3NR'
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
        Height = 33
        Width = 64
      end
      object e51_5114_6_4: TcxTextEdit
        Left = 492
        Top = 257
        Hint = '5114_6_4NR'
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
        TabOrder = 24
        Height = 33
        Width = 153
      end
      object cxMemo129: TcxMemo
        Left = 365
        Top = 97
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
        TabOrder = 25
        Height = 33
        Width = 65
      end
      object cxMemo130: TcxMemo
        Left = 365
        Top = 129
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
        TabOrder = 26
        Height = 33
        Width = 65
      end
      object cxMemo131: TcxMemo
        Left = 365
        Top = 161
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
        TabOrder = 27
        Height = 33
        Width = 65
      end
      object cxMemo132: TcxMemo
        Left = 365
        Top = 193
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
        TabOrder = 28
        Height = 33
        Width = 65
      end
      object cxMemo133: TcxMemo
        Left = 365
        Top = 225
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
        TabOrder = 29
        Height = 33
        Width = 65
      end
      object cxMemo134: TcxMemo
        Left = 365
        Top = 257
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
        TabOrder = 30
        Height = 33
        Width = 65
      end
      object cxMemo174: TcxMemo
        Left = 0
        Top = 257
        Enabled = False
        Lines.Strings = (
          '     '#1080#1079' '#1085#1080#1093' '#1074#1099#1087#1086#1083#1085#1077#1085#1086':'
          '   '#1085#1072' '#1087#1083#1077#1085#1086#1095#1085#1099#1093' '#1072#1087#1087#1072#1088#1072#1090#1072#1093)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 31
        Height = 33
        Width = 366
      end
      object cxMemo175: TcxMemo
        Left = 0
        Top = 289
        Enabled = False
        Lines.Strings = (
          '     '#1085#1072' '#1094#1080#1092#1088#1086#1074#1099#1093' '#1072#1087#1087#1072#1088#1072#1090#1072#1093' '#1080' '#1089#1080#1089#1090#1077#1084#1072#1093' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1085#1086#1081' '#1088#1072#1076#1080#1086#1075#1088#1072#1092#1080#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 32
        Height = 33
        Width = 366
      end
      object cxMemo176: TcxMemo
        Left = 365
        Top = 289
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
        TabOrder = 33
        Height = 33
        Width = 65
      end
      object e60_5114_7_3: TcxTextEdit
        Left = 429
        Top = 289
        Hint = '5114_7_3NR'
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
        Height = 33
        Width = 64
      end
      object e61_5114_7_4: TcxTextEdit
        Left = 492
        Top = 289
        Hint = '5114_7_4NR'
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
        TabOrder = 35
        Height = 33
        Width = 153
      end
      object cxMemo84: TcxMemo
        Left = 492
        Top = 3
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1085#1080#1093':')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 36
        Height = 26
        Width = 305
      end
      object cxMemo177: TcxMemo
        Left = 644
        Top = 28
        Enabled = False
        Lines.Strings = (
          #1083#1080#1094#1072#1084' '#1089#1090#1072#1088#1096#1077
          #1090#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1086#1075#1086
          #1074#1086#1079#1088#1072#1089#1090#1072)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 37
        Height = 45
        Width = 153
      end
      object cxMemo226: TcxMemo
        Left = 644
        Top = 72
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
        TabOrder = 38
        Height = 26
        Width = 153
      end
      object cxTextEdit152: TcxTextEdit
        Left = 644
        Top = 97
        Hint = '5114_1_5NR'
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
        Height = 33
        Width = 153
      end
      object cxTextEdit153: TcxTextEdit
        Left = 644
        Top = 129
        Hint = '5114_2_5NR'
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
        Height = 33
        Width = 153
      end
      object cxTextEdit154: TcxTextEdit
        Left = 644
        Top = 161
        Hint = '5114_3_5NR'
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
        Height = 33
        Width = 153
      end
      object cxTextEdit155: TcxTextEdit
        Left = 644
        Top = 193
        Hint = '5114_4_5NR'
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
        Height = 33
        Width = 153
      end
      object cxTextEdit156: TcxTextEdit
        Left = 644
        Top = 225
        Hint = '5114_5_5NR'
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
        TabOrder = 43
        Height = 33
        Width = 153
      end
      object cxTextEdit157: TcxTextEdit
        Left = 644
        Top = 257
        Hint = '5114_6_5NR'
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
        TabOrder = 44
        Height = 33
        Width = 153
      end
      object cxTextEdit158: TcxTextEdit
        Left = 644
        Top = 289
        Hint = '5114_7_5NR'
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
        TabOrder = 45
        Height = 33
        Width = 153
      end
    end
    object cxTabSheet6: TcxTabSheet
      Caption = '5119'
      ImageIndex = 5
      TabVisible = False
      object cxMemo91: TcxMemo
        Left = 3
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 0
        Height = 57
        Width = 366
      end
      object cxMemo92: TcxMemo
        Left = 368
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
        Height = 57
        Width = 65
      end
      object cxMemo93: TcxMemo
        Left = 432
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
        Height = 57
        Width = 65
      end
      object cxMemo94: TcxMemo
        Left = 640
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1075#1088'.3 '#1074#1099#1087#1086#1083#1085#1077#1085#1086':')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 3
        Height = 25
        Width = 153
      end
      object cxMemo95: TcxMemo
        Left = 496
        Top = 0
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1085#1080#1093' '#1089' '#1074#1085#1091#1090#1088#1080#1074#1077#1085#1085#1099#1084
          #1082#1086#1085#1090#1088#1072#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077#1084)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 4
        Height = 57
        Width = 145
      end
      object cxMemo97: TcxMemo
        Left = 640
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1074' '
          #1087#1086#1083#1080#1082#1083#1080#1085#1080#1082
          #1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 5
        Height = 33
        Width = 73
      end
      object cxMemo98: TcxMemo
        Left = 712
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1074' '#1076#1085#1077#1074#1085#1086#1084' '
          #1089#1090#1072#1094#1080#1086#1085#1072#1088#1077)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 6
        Height = 33
        Width = 81
      end
      object cxMemo99: TcxMemo
        Left = 3
        Top = 56
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
        TabOrder = 7
        Height = 25
        Width = 366
      end
      object cxMemo100: TcxMemo
        Left = 3
        Top = 80
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
        TabOrder = 8
        Height = 33
        Width = 366
      end
      object cxMemo101: TcxMemo
        Left = 3
        Top = 112
        Enabled = False
        Lines.Strings = (
          '          '#1074' '#1090#1086#1084' '#1095#1080#1089#1083#1077':'
          '     '#1089#1077#1088#1076#1077#1095#1085#1086'-'#1089#1086#1089#1091#1076#1080#1089#1090#1086#1081' '#1089#1080#1089#1090#1077#1084#1099)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 9
        Height = 33
        Width = 366
      end
      object cxMemo102: TcxMemo
        Left = 3
        Top = 144
        Enabled = False
        Lines.Strings = (
          '     '#1083#1077#1075#1082#1080#1093' '#1080' '#1089#1088#1077#1076#1086#1089#1090#1077#1085#1080#1103)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 10
        Height = 33
        Width = 366
      end
      object cxMemo103: TcxMemo
        Left = 3
        Top = 176
        Enabled = False
        Lines.Strings = (
          '     '#1086#1088#1075#1072#1085#1086#1074' '#1073#1088#1102#1096#1085#1086#1081' '#1087#1086#1083#1086#1089#1090#1080' '#1080' '#1079#1072#1073#1088#1102#1096#1080#1085#1085#1086#1075#1086' '#1087#1088#1086#1089#1090#1088#1072#1085#1089#1090#1074#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 11
        Height = 33
        Width = 366
      end
      object cxMemo104: TcxMemo
        Left = 3
        Top = 208
        Enabled = False
        Lines.Strings = (
          '     '#1086#1088#1075#1072#1085#1086#1074' '#1084#1072#1083#1086#1075#1086' '#1090#1072#1079#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 12
        Height = 33
        Width = 366
      end
      object cxMemo105: TcxMemo
        Left = 3
        Top = 240
        Enabled = False
        Lines.Strings = (
          '     '#1084#1086#1083#1086#1095#1085#1086#1081' '#1078#1077#1083#1077#1079#1099)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 13
        Height = 33
        Width = 366
      end
      object cxMemo106: TcxMemo
        Left = 3
        Top = 272
        Enabled = False
        Lines.Strings = (
          '     '#1075#1086#1083#1086#1074#1085#1086#1075#1086' '#1084#1086#1079#1075#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 14
        Height = 33
        Width = 366
      end
      object cxMemo107: TcxMemo
        Left = 3
        Top = 304
        Enabled = False
        Lines.Strings = (
          '     '#1087#1086#1079#1074#1086#1085#1086#1095#1085#1080#1082#1072' '#1080' '#1089#1087#1080#1085#1085#1086#1075#1086' '#1084#1086#1079#1075#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 15
        Height = 33
        Width = 366
      end
      object cxMemo108: TcxMemo
        Left = 3
        Top = 336
        Enabled = False
        Lines.Strings = (
          '     '#1086#1073#1083#1072#1089#1090#1080' "'#1075#1086#1083#1086#1074#1072'-'#1096#1077#1103'"')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 16
        Height = 33
        Width = 366
      end
      object cxMemo109: TcxMemo
        Left = 3
        Top = 368
        Enabled = False
        Lines.Strings = (
          '     '#1082#1086#1089#1090#1077#1081', '#1089#1091#1089#1090#1072#1074#1086#1074' '#1080' '#1084#1103#1075#1082#1080#1093' '#1090#1082#1072#1085#1077#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 17
        Height = 33
        Width = 366
      end
      object cxMemo110: TcxMemo
        Left = 3
        Top = 400
        Enabled = False
        Lines.Strings = (
          '     '#1087#1088#1086#1095#1080#1093' '#1086#1088#1075#1072#1085#1086#1074' '#1080' '#1089#1080#1089#1090#1077#1084)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 18
        Height = 33
        Width = 366
      end
      object cxMemo111: TcxMemo
        Left = 3
        Top = 432
        Enabled = False
        Lines.Strings = (
          #1048#1085#1090#1077#1088#1074#1077#1085#1094#1080#1086#1085#1085#1099#1077' '#1074#1084#1077#1096#1072#1090#1077#1083#1100#1089#1090#1074#1072' '#1087#1086#1076' '#1052#1056#1058' - '#1082#1086#1085#1090#1088#1086#1083#1077#1084' ('#1080#1079' '#1089#1090#1088'. 01)')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 19
        Height = 33
        Width = 366
      end
      object cxMemo112: TcxMemo
        Left = 368
        Top = 56
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
        TabOrder = 20
        Height = 25
        Width = 65
      end
      object cxMemo113: TcxMemo
        Left = 368
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
        TabOrder = 21
        Height = 33
        Width = 65
      end
      object cxMemo114: TcxMemo
        Left = 368
        Top = 112
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
        TabOrder = 22
        Height = 33
        Width = 65
      end
      object cxMemo115: TcxMemo
        Left = 368
        Top = 144
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
        TabOrder = 23
        Height = 33
        Width = 65
      end
      object cxMemo116: TcxMemo
        Left = 368
        Top = 176
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
        TabOrder = 24
        Height = 33
        Width = 65
      end
      object cxMemo117: TcxMemo
        Left = 368
        Top = 208
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
        TabOrder = 25
        Height = 33
        Width = 65
      end
      object cxMemo118: TcxMemo
        Left = 368
        Top = 240
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
        TabOrder = 26
        Height = 33
        Width = 65
      end
      object cxMemo119: TcxMemo
        Left = 368
        Top = 272
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
        TabOrder = 27
        Height = 33
        Width = 65
      end
      object cxMemo120: TcxMemo
        Left = 368
        Top = 304
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
        TabOrder = 28
        Height = 33
        Width = 65
      end
      object cxMemo121: TcxMemo
        Left = 368
        Top = 336
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
        TabOrder = 29
        Height = 33
        Width = 65
      end
      object cxMemo122: TcxMemo
        Left = 368
        Top = 368
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
        TabOrder = 30
        Height = 33
        Width = 65
      end
      object cxMemo123: TcxMemo
        Left = 368
        Top = 400
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
        TabOrder = 31
        Height = 33
        Width = 65
      end
      object cxMemo124: TcxMemo
        Left = 368
        Top = 432
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
        TabOrder = 32
        Height = 33
        Width = 65
      end
      object cxMemo125: TcxMemo
        Left = 432
        Top = 56
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
        TabOrder = 33
        Height = 25
        Width = 65
      end
      object cxMemo126: TcxMemo
        Left = 496
        Top = 56
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
        TabOrder = 34
        Height = 25
        Width = 145
      end
      object cxMemo127: TcxMemo
        Left = 640
        Top = 56
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
        TabOrder = 35
        Height = 25
        Width = 73
      end
      object cxMemo128: TcxMemo
        Left = 712
        Top = 56
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
        TabOrder = 36
        Height = 25
        Width = 81
      end
      object e00_5119_1_3: TcxTextEdit
        Left = 432
        Top = 80
        Hint = '5119_1_3NR'
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
        TabOrder = 37
        Height = 33
        Width = 65
      end
      object e10_5119_2_3: TcxTextEdit
        Left = 432
        Top = 112
        Hint = '5119_2_3NR'
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
        Height = 33
        Width = 65
      end
      object e20_5119_3_3: TcxTextEdit
        Left = 432
        Top = 144
        Hint = '5119_3_3NR'
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
        Height = 33
        Width = 65
      end
      object e30_5119_4_3: TcxTextEdit
        Left = 432
        Top = 176
        Hint = '5119_4_3NR'
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
        Height = 33
        Width = 65
      end
      object e40_5119_5_3: TcxTextEdit
        Left = 432
        Top = 208
        Hint = '5119_5_3NR'
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
        Height = 33
        Width = 65
      end
      object e50_5119_6_3: TcxTextEdit
        Left = 432
        Top = 240
        Hint = '5119_6_3NR'
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
        Height = 33
        Width = 65
      end
      object e60_5119_7_3: TcxTextEdit
        Left = 432
        Top = 272
        Hint = '5119_7_3NR'
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
        Height = 33
        Width = 65
      end
      object e70_5119_8_3: TcxTextEdit
        Left = 432
        Top = 304
        Hint = '5119_8_3NR'
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
        Height = 33
        Width = 65
      end
      object e80_5119_9_3: TcxTextEdit
        Left = 432
        Top = 336
        Hint = '5119_9_3NR'
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
        Height = 33
        Width = 65
      end
      object e90_5119_10_3: TcxTextEdit
        Left = 432
        Top = 368
        Hint = '5119_10_3NR'
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
        Height = 33
        Width = 65
      end
      object e100_5119_11_3: TcxTextEdit
        Left = 432
        Top = 400
        Hint = '5119_11_3NR'
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
        Height = 33
        Width = 65
      end
      object e110_5119_12_3: TcxTextEdit
        Left = 432
        Top = 432
        Hint = '5119_12_3NR'
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
        TabOrder = 48
        Height = 33
        Width = 65
      end
      object e01_5119_1_4: TcxTextEdit
        Left = 496
        Top = 80
        Hint = '5119_1_4NR'
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
        TabOrder = 49
        Height = 33
        Width = 145
      end
      object e11_5119_2_4: TcxTextEdit
        Left = 496
        Top = 112
        Hint = '5119_2_4NR'
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
        Height = 33
        Width = 145
      end
      object e21_5119_3_4: TcxTextEdit
        Left = 496
        Top = 144
        Hint = '5119_3_4NR'
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
        Height = 33
        Width = 145
      end
      object e31_5119_4_4: TcxTextEdit
        Left = 496
        Top = 176
        Hint = '5119_4_4NR'
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
        Height = 33
        Width = 145
      end
      object e41_5119_5_4: TcxTextEdit
        Left = 496
        Top = 208
        Hint = '5119_5_4NR'
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
        Height = 33
        Width = 145
      end
      object e51_5119_6_4: TcxTextEdit
        Left = 496
        Top = 240
        Hint = '5119_6_4NR'
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
        Height = 33
        Width = 145
      end
      object e61_5119_7_4: TcxTextEdit
        Left = 496
        Top = 272
        Hint = '5119_7_4NR'
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
        Height = 33
        Width = 145
      end
      object e71_5119_8_4: TcxTextEdit
        Left = 496
        Top = 304
        Hint = '5119_8_4NR'
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
        Height = 33
        Width = 145
      end
      object e81_5119_9_4: TcxTextEdit
        Left = 496
        Top = 336
        Hint = '5119_9_4NR'
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
        Height = 33
        Width = 145
      end
      object e91_5119_10_4: TcxTextEdit
        Left = 496
        Top = 368
        Hint = '5119_10_4NR'
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
        Height = 33
        Width = 145
      end
      object e101_5119_11_4: TcxTextEdit
        Left = 496
        Top = 400
        Hint = '5119_11_4NR'
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
        Height = 33
        Width = 145
      end
      object e111_5119_12_4: TcxTextEdit
        Left = 496
        Top = 432
        Hint = '5119_12_4NR'
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
        TabOrder = 60
        Height = 33
        Width = 145
      end
      object e02_5119_1_5: TcxTextEdit
        Left = 640
        Top = 80
        Hint = '5119_1_5NR'
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
        TabOrder = 61
        Height = 33
        Width = 73
      end
      object e12_5119_2_5: TcxTextEdit
        Left = 640
        Top = 112
        Hint = '5119_2_5NR'
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
        Height = 33
        Width = 73
      end
      object e22_5119_3_5: TcxTextEdit
        Left = 640
        Top = 144
        Hint = '5119_3_5NR'
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
        Height = 33
        Width = 73
      end
      object e32_5119_4_5: TcxTextEdit
        Left = 640
        Top = 176
        Hint = '5119_4_5NR'
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
        Height = 33
        Width = 73
      end
      object e42_5119_5_5: TcxTextEdit
        Left = 640
        Top = 208
        Hint = '5119_5_5NR'
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
        Height = 33
        Width = 73
      end
      object e52_5119_6_5: TcxTextEdit
        Left = 640
        Top = 240
        Hint = '5119_6_5NR'
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
        Height = 33
        Width = 73
      end
      object e62_5119_7_5: TcxTextEdit
        Left = 640
        Top = 272
        Hint = '5119_7_5NR'
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
        Height = 33
        Width = 73
      end
      object e72_5119_8_5: TcxTextEdit
        Left = 640
        Top = 304
        Hint = '5119_8_5NR'
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
        Height = 33
        Width = 73
      end
      object e82_5119_9_5: TcxTextEdit
        Left = 640
        Top = 336
        Hint = '5119_9_5NR'
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
        Height = 33
        Width = 73
      end
      object e92_5119_10_5: TcxTextEdit
        Left = 640
        Top = 368
        Hint = '5119_10_5NR'
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
        Height = 33
        Width = 73
      end
      object e102_5119_11_5: TcxTextEdit
        Left = 640
        Top = 400
        Hint = '5119_11_5NR'
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
        Height = 33
        Width = 73
      end
      object e112_5119_12_5: TcxTextEdit
        Left = 640
        Top = 432
        Hint = '5119_12_5NR'
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
        Height = 33
        Width = 73
      end
      object e03_5119_1_6: TcxTextEdit
        Left = 712
        Top = 80
        Hint = '5119_1_6NR'
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
        Height = 33
        Width = 81
      end
      object e13_5119_2_6: TcxTextEdit
        Left = 712
        Top = 112
        Hint = '5119_2_6NR'
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
        Height = 33
        Width = 81
      end
      object e23_5119_3_6: TcxTextEdit
        Left = 712
        Top = 144
        Hint = '5119_3_6NR'
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
        Height = 33
        Width = 81
      end
      object e33_5119_4_6: TcxTextEdit
        Left = 712
        Top = 176
        Hint = '5119_4_6NR'
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
        Height = 33
        Width = 81
      end
      object e43_5119_5_6: TcxTextEdit
        Left = 712
        Top = 208
        Hint = '5119_5_6NR'
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
        Height = 33
        Width = 81
      end
      object e53_5119_6_6: TcxTextEdit
        Left = 712
        Top = 240
        Hint = '5119_6_6NR'
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
        Height = 33
        Width = 81
      end
      object e63_5119_7_6: TcxTextEdit
        Left = 712
        Top = 272
        Hint = '5119_7_6NR'
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
        Height = 33
        Width = 81
      end
      object e73_5119_8_6: TcxTextEdit
        Left = 712
        Top = 304
        Hint = '5119_8_6NR'
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
        Height = 33
        Width = 81
      end
      object e83_5119_9_6: TcxTextEdit
        Left = 712
        Top = 336
        Hint = '5119_9_6NR'
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
        Height = 33
        Width = 81
      end
      object e93_5119_10_6: TcxTextEdit
        Left = 712
        Top = 368
        Hint = '5119_10_6NR'
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
        Height = 33
        Width = 81
      end
      object e103_5119_11_6: TcxTextEdit
        Left = 712
        Top = 400
        Hint = '5119_11_6NR'
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
        Height = 33
        Width = 81
      end
      object e116_5119_12_6: TcxTextEdit
        Left = 712
        Top = 432
        Hint = '5119_12_6NR'
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
        Height = 33
        Width = 81
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = '5120'
      ImageIndex = 6
      object cxMemo225: TcxMemo
        Left = 3
        Top = 3
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
        Height = 75
        Width = 326
      end
      object cxMemo227: TcxMemo
        Left = 328
        Top = 3
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
        Height = 75
        Width = 65
      end
      object cxTextEdit159: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 98
        Hint = '5120_1_3'
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
        TabOrder = 2
        Height = 22
        Width = 65
      end
      object cxMemo228: TcxMemo
        Left = 3
        Top = 77
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
        TabOrder = 3
        Height = 22
        Width = 326
      end
      object cxMemo229: TcxMemo
        Left = 3
        Top = 98
        Enabled = False
        Lines.Strings = (
          #1055#1088#1086#1074#1077#1076#1077#1085#1086' '#1088#1072#1076#1080#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081', '#1074#1089#1077#1075#1086)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 4
        Height = 22
        Width = 326
      end
      object cxMemo230: TcxMemo
        Left = 3
        Top = 119
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1085#1080#1093': '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' in vitro')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 5
        Height = 22
        Width = 326
      end
      object cxMemo231: TcxMemo
        Left = 3
        Top = 140
        Enabled = False
        Lines.Strings = (
          #1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 6
        Height = 22
        Width = 326
      end
      object cxMemo232: TcxMemo
        Left = 3
        Top = 161
        Enabled = False
        Lines.Strings = (
          #1088#1072#1076#1080#1086#1075#1088#1072#1092#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 7
        Height = 22
        Width = 326
      end
      object cxMemo233: TcxMemo
        Left = 3
        Top = 182
        Enabled = False
        Lines.Strings = (
          #1089#1094#1080#1085#1090#1080#1075#1088#1072#1092#1080#1095#1077#1089#1082#1080#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 8
        Height = 22
        Width = 326
      end
      object cxMemo234: TcxMemo
        Left = 3
        Top = 203
        Enabled = False
        Lines.Strings = (
          '     '#1080#1079' '#1085#1080#1093': '#1086#1089#1090#1077#1086#1089#1094#1080#1085#1090#1080#1075#1088#1072#1092#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 9
        Height = 22
        Width = 326
      end
      object cxMemo235: TcxMemo
        Left = 3
        Top = 224
        Enabled = False
        Lines.Strings = (
          '                   '#1084#1080#1077#1083#1086#1089#1094#1080#1085#1090#1080#1075#1088#1072#1092#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 10
        Height = 22
        Width = 326
      end
      object cxMemo236: TcxMemo
        Left = 3
        Top = 245
        Enabled = False
        Lines.Strings = (
          '                   '#1075#1077#1087#1072#1090#1086#1089#1094#1080#1085#1090#1080#1075#1088#1072#1092#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 11
        Height = 22
        Width = 326
      end
      object cxMemo237: TcxMemo
        Left = 3
        Top = 266
        Enabled = False
        Lines.Strings = (
          '                   '#1089#1094#1080#1085#1090#1080#1075#1088#1072#1092#1080#1081' '#1097#1080#1090#1086#1074#1080#1076#1085#1086#1081' '#1078#1077#1083#1077#1079#1099)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 12
        Height = 22
        Width = 326
      end
      object cxMemo238: TcxMemo
        Left = 3
        Top = 287
        Enabled = False
        Lines.Strings = (
          '                   '#1089#1094#1080#1085#1090#1080#1075#1088#1072#1092#1080#1081' '#1087#1072#1088#1072#1097#1080#1090#1086#1074#1080#1076#1085#1099#1093' '#1078#1077#1083#1077#1079)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 13
        Height = 22
        Width = 326
      end
      object cxMemo239: TcxMemo
        Left = 3
        Top = 308
        Enabled = False
        Lines.Strings = (
          '                   '#1087#1086#1079#1080#1090#1080#1074#1085#1099#1093' '#1089#1094#1080#1085#1090#1080#1075#1088#1072#1092#1080#1081' '#1089' '#1090#1091#1084#1086#1088#1086#1090#1088#1086#1087#1085#1099#1084#1080' '#1056#1060#1055)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 14
        Height = 22
        Width = 326
      end
      object cxMemo240: TcxMemo
        Left = 3
        Top = 329
        Enabled = False
        Lines.Strings = (
          '                   '#1089#1094#1080#1085#1090#1080#1075#1088#1072#1092#1080#1081' '#1089' I-123 - '#1052#1048#1041#1043)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 15
        Height = 22
        Width = 326
      end
      object cxMemo241: TcxMemo
        Left = 3
        Top = 371
        Enabled = False
        Lines.Strings = (
          '                   '#1087#1077#1088#1092#1091#1079#1080#1086#1085#1085#1099#1093' '#1089#1094#1080#1085#1090#1080#1075#1088#1072#1092#1080#1081' '#1083#1077#1075#1082#1080#1093)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 16
        Height = 22
        Width = 326
      end
      object cxMemo242: TcxMemo
        Left = 3
        Top = 392
        Enabled = False
        Lines.Strings = (
          '                   '#1089#1094#1080#1085#1090#1080#1075#1088#1072#1092#1080#1081' '#1084#1080#1086#1082#1072#1088#1076#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 17
        Height = 22
        Width = 326
      end
      object cxMemo243: TcxMemo
        Left = 3
        Top = 413
        Enabled = False
        Lines.Strings = (
          '                   '#1089#1094#1080#1085#1090#1080#1075#1088#1072#1092#1080#1103' '#1083#1080#1084#1092#1072#1090#1080#1095#1077#1089#1082#1086#1081' '#1089#1080#1089#1090#1077#1084#1099)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 18
        Height = 22
        Width = 326
      end
      object cxMemo244: TcxMemo
        Left = 3
        Top = 434
        Enabled = False
        Lines.Strings = (
          '                   '#1076#1080#1085#1072#1084#1080#1095#1077#1089#1082#1080#1093' '#1089#1094#1080#1085#1090#1080#1075#1088#1072#1092#1080#1081' '#1087#1086#1095#1077#1082)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 19
        Height = 22
        Width = 326
      end
      object cxMemo245: TcxMemo
        Left = 3
        Top = 455
        Enabled = False
        Lines.Strings = (
          '                   '#1076#1080#1085#1072#1084#1080#1095#1077#1089#1082#1080#1093' '#1089#1094#1080#1085#1090#1080#1075#1088#1072#1092#1080#1081' '#1087#1077#1095#1077#1085#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 20
        Height = 22
        Width = 326
      end
      object cxMemo246: TcxMemo
        Left = 3
        Top = 476
        Enabled = False
        Lines.Strings = (
          '                   '#1076#1080#1085#1072#1084#1080#1095#1077#1089#1082#1080#1093' '#1089#1094#1080#1085#1090#1080#1075#1088#1072#1092#1080#1081' '#1078#1077#1083#1091#1076#1082#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 21
        Height = 22
        Width = 326
      end
      object cxMemo247: TcxMemo
        Left = 3
        Top = 497
        Enabled = False
        Lines.Strings = (
          '                   '#1088#1072#1076#1080#1086#1085#1091#1082#1083#1080#1076#1085#1099#1093' '#1074#1077#1085#1090#1088#1080#1082#1091#1083#1086#1075#1088#1072#1092#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 22
        Height = 22
        Width = 326
      end
      object cxMemo248: TcxMemo
        Left = 3
        Top = 518
        Enabled = False
        Lines.Strings = (
          '                   '#1088#1072#1076#1080#1086#1085#1091#1082#1083#1080#1076#1085#1099#1093' '#1072#1085#1075#1080#1086#1075#1088#1072#1092#1080#1081', '#1092#1083#1077#1073#1086#1075#1088#1072#1092#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 23
        Height = 22
        Width = 326
      end
      object cxMemo251: TcxMemo
        Left = 392
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
        TabOrder = 24
        Height = 75
        Width = 65
      end
      object cxMemo252: TcxMemo
        Left = 456
        Top = 3
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1085#1080#1093' '#1087#1072#1094#1080#1077#1085#1090#1072#1084' '#1089':')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 25
        Height = 22
        Width = 393
      end
      object cxMemo253: TcxMemo
        Left = 456
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1086#1085#1082#1086#1083#1086#1075#1080'-'
          #1095#1077#1089#1082#1080#1084#1080
          #1079#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103#1084#1080)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 26
        Height = 54
        Width = 97
      end
      object cxMemo254: TcxMemo
        Left = 552
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1080#1096#1077#1084#1080#1095#1077#1089#1082#1080#1084#1080' '
          #1073#1086#1083#1077#1079#1085#1103#1084#1080
          #1089#1077#1088#1076#1094#1072)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 27
        Height = 54
        Width = 97
      end
      object cxMemo255: TcxMemo
        Left = 648
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1101#1085#1076#1086#1082#1088#1080#1085#1085#1099#1084#1080
          #1079#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103#1084#1080)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 28
        Height = 54
        Width = 97
      end
      object cxMemo256: TcxMemo
        Left = 744
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1085#1077#1074#1088#1086#1083#1086'-'
          #1075#1080#1095#1077#1089#1082#1080#1084#1080
          #1079#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103#1084#1080)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 29
        Height = 54
        Width = 105
      end
      object cxMemo257: TcxMemo
        Left = 848
        Top = 3
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1086#1073#1097#1077#1075#1086' '#1095#1080#1089#1083#1072
          #1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' ('#1075#1088'.3)'
          #1087#1088#1086#1074#1077#1076#1077#1085#1086' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
          #1088#1072#1076#1080#1086#1076#1080#1072#1075#1085#1086#1089#1090#1080#1095#1077#1089#1082#1080#1084#1080' '#1084#1077#1090#1086#1076#1072#1084#1080
          'in vivo')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 30
        Height = 75
        Width = 217
      end
      object cxMemo258: TcxMemo
        Left = 328
        Top = 77
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
        TabOrder = 31
        Height = 22
        Width = 65
      end
      object cxMemo259: TcxMemo
        Left = 392
        Top = 77
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
        TabOrder = 32
        Height = 22
        Width = 65
      end
      object cxMemo260: TcxMemo
        Left = 456
        Top = 77
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
        TabOrder = 33
        Height = 22
        Width = 97
      end
      object cxMemo261: TcxMemo
        Left = 552
        Top = 77
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
        TabOrder = 34
        Height = 22
        Width = 97
      end
      object cxMemo262: TcxMemo
        Left = 648
        Top = 77
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
        TabOrder = 35
        Height = 22
        Width = 97
      end
      object cxMemo263: TcxMemo
        Left = 744
        Top = 77
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
        TabOrder = 36
        Height = 22
        Width = 105
      end
      object cxMemo264: TcxMemo
        Left = 848
        Top = 77
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
        TabOrder = 37
        Height = 22
        Width = 217
      end
      object cxMemo265: TcxMemo
        Left = 328
        Top = 98
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
        TabOrder = 38
        Height = 22
        Width = 65
      end
      object cxMemo266: TcxMemo
        Left = 328
        Top = 119
        Enabled = False
        Lines.Strings = (
          '1.2')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 39
        Height = 22
        Width = 65
      end
      object cxMemo267: TcxMemo
        Left = 328
        Top = 140
        Enabled = False
        Lines.Strings = (
          '1.3')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 40
        Height = 22
        Width = 65
      end
      object cxMemo268: TcxMemo
        Left = 328
        Top = 161
        Enabled = False
        Lines.Strings = (
          '1.4')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 41
        Height = 22
        Width = 65
      end
      object cxMemo269: TcxMemo
        Left = 328
        Top = 182
        Enabled = False
        Lines.Strings = (
          '1.5')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 42
        Height = 22
        Width = 65
      end
      object cxMemo270: TcxMemo
        Left = 328
        Top = 203
        Enabled = False
        Lines.Strings = (
          '1.5.1')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 43
        Height = 22
        Width = 65
      end
      object cxMemo271: TcxMemo
        Left = 328
        Top = 224
        Enabled = False
        Lines.Strings = (
          '1.5.2')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 44
        Height = 22
        Width = 65
      end
      object cxMemo272: TcxMemo
        Left = 328
        Top = 245
        Enabled = False
        Lines.Strings = (
          '1.5.3')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 45
        Height = 22
        Width = 65
      end
      object cxMemo273: TcxMemo
        Left = 328
        Top = 266
        Enabled = False
        Lines.Strings = (
          '1.5.4')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 46
        Height = 22
        Width = 65
      end
      object cxMemo274: TcxMemo
        Left = 328
        Top = 287
        Enabled = False
        Lines.Strings = (
          '1.5.5')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 47
        Height = 22
        Width = 65
      end
      object cxMemo275: TcxMemo
        Left = 328
        Top = 308
        Enabled = False
        Lines.Strings = (
          '1.5.6')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 48
        Height = 22
        Width = 65
      end
      object cxMemo276: TcxMemo
        Left = 328
        Top = 329
        Enabled = False
        Lines.Strings = (
          '1.5.7')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 49
        Height = 22
        Width = 65
      end
      object cxMemo277: TcxMemo
        Left = 328
        Top = 350
        Enabled = False
        Lines.Strings = (
          '1.5.8')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 50
        Height = 22
        Width = 65
      end
      object cxMemo278: TcxMemo
        Left = 328
        Top = 371
        Enabled = False
        Lines.Strings = (
          '1.5.9')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 51
        Height = 22
        Width = 65
      end
      object cxMemo279: TcxMemo
        Left = 328
        Top = 392
        Enabled = False
        Lines.Strings = (
          '1.5.10')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 52
        Height = 22
        Width = 65
      end
      object cxMemo280: TcxMemo
        Left = 328
        Top = 413
        Enabled = False
        Lines.Strings = (
          '1.5.11')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 53
        Height = 22
        Width = 65
      end
      object cxMemo281: TcxMemo
        Left = 328
        Top = 434
        Enabled = False
        Lines.Strings = (
          '1.5.12')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 54
        Height = 22
        Width = 65
      end
      object cxMemo282: TcxMemo
        Left = 328
        Top = 455
        Enabled = False
        Lines.Strings = (
          '1.5.13')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 55
        Height = 22
        Width = 65
      end
      object cxMemo283: TcxMemo
        Left = 328
        Top = 476
        Enabled = False
        Lines.Strings = (
          '1.5.14')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 56
        Height = 22
        Width = 65
      end
      object cxMemo284: TcxMemo
        Left = 328
        Top = 518
        Enabled = False
        Lines.Strings = (
          '1.5.16')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 57
        Height = 22
        Width = 65
      end
      object cxMemo285: TcxMemo
        Left = 328
        Top = 497
        Enabled = False
        Lines.Strings = (
          '1.5.15')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 58
        Height = 22
        Width = 65
      end
      object cxMemo287: TcxMemo
        Left = 3
        Top = 350
        Enabled = False
        Lines.Strings = (
          '                   '#1087#1077#1088#1092#1091#1079#1080#1086#1085#1085#1099#1093' '#1089#1094#1080#1085#1090#1080#1075#1088#1072#1092#1080#1081' '#1075#1086#1083#1086#1074#1085#1086#1075#1086' '#1084#1086#1079#1075#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 59
        Height = 22
        Width = 326
      end
      object cxTextEdit160: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 98
        Hint = '5120_1_4'
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
        TabOrder = 60
        Height = 22
        Width = 97
      end
      object cxTextEdit161: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 98
        Hint = '5120_1_5'
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
        TabOrder = 61
        Height = 22
        Width = 97
      end
      object cxTextEdit162: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 98
        Hint = '5120_1_6'
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
        TabOrder = 62
        Height = 22
        Width = 97
      end
      object cxTextEdit163: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 98
        Hint = '5120_1_7'
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
        TabOrder = 63
        Height = 22
        Width = 105
      end
      object cxTextEdit164: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 98
        Hint = '5120_1_8'
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
        TabOrder = 64
        Height = 22
        Width = 217
      end
      object cxTextEdit165: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 119
        Hint = '5120_1.2_3'
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
        TabOrder = 65
        Height = 22
        Width = 65
      end
      object cxTextEdit166: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 119
        Hint = '5120_1.2_4'
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
        TabOrder = 66
        Height = 22
        Width = 97
      end
      object cxTextEdit167: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 119
        Hint = '5120_1.2_5'
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
        TabOrder = 67
        Height = 22
        Width = 97
      end
      object cxTextEdit168: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 119
        Hint = '5120_1.2_6'
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
        TabOrder = 68
        Height = 22
        Width = 97
      end
      object cxTextEdit169: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 119
        Hint = '5120_1.2_7'
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
        TabOrder = 69
        Height = 22
        Width = 105
      end
      object cxTextEdit170: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 119
        Hint = '5120_1.2_8'
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
        TabOrder = 70
        Height = 22
        Width = 217
      end
      object cxTextEdit171: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 140
        Hint = '5120_1.3_3'
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
        TabOrder = 71
        Height = 22
        Width = 65
      end
      object cxTextEdit172: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 140
        Hint = '5120_1.3_4'
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
        TabOrder = 72
        Height = 22
        Width = 97
      end
      object cxTextEdit173: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 140
        Hint = '5120_1.3_5'
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
        TabOrder = 73
        Height = 22
        Width = 97
      end
      object cxTextEdit174: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 140
        Hint = '5120_1.3_6'
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
        TabOrder = 74
        Height = 22
        Width = 97
      end
      object cxTextEdit175: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 140
        Hint = '5120_1.3_7'
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
        TabOrder = 75
        Height = 22
        Width = 105
      end
      object cxTextEdit176: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 140
        Hint = '5120_1.3_8'
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
        TabOrder = 76
        Height = 22
        Width = 217
      end
      object cxTextEdit177: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 161
        Hint = '5120_1.4_3'
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
        TabOrder = 77
        Height = 22
        Width = 65
      end
      object cxTextEdit178: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 161
        Hint = '5120_1.4_4'
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
        TabOrder = 78
        Height = 22
        Width = 97
      end
      object cxTextEdit179: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 161
        Hint = '5120_1.4_5'
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
        TabOrder = 79
        Height = 22
        Width = 97
      end
      object cxTextEdit180: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 161
        Hint = '5120_1.4_6'
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
        TabOrder = 80
        Height = 22
        Width = 97
      end
      object cxTextEdit181: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 161
        Hint = '5120_1.4_7'
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
        TabOrder = 81
        Height = 22
        Width = 105
      end
      object cxTextEdit182: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 161
        Hint = '5120_1.4_8'
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
        TabOrder = 82
        Height = 22
        Width = 217
      end
      object cxTextEdit183: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 182
        Hint = '5120_1.5_3'
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
        TabOrder = 83
        Height = 22
        Width = 65
      end
      object cxTextEdit184: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 182
        Hint = '5120_1.5_4'
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
        TabOrder = 84
        Height = 22
        Width = 97
      end
      object cxTextEdit185: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 182
        Hint = '5120_1.5_5'
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
        TabOrder = 85
        Height = 22
        Width = 97
      end
      object cxTextEdit186: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 182
        Hint = '5120_1.5_6'
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
        TabOrder = 86
        Height = 22
        Width = 97
      end
      object cxTextEdit187: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 182
        Hint = '5120_1.5_7'
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
        TabOrder = 87
        Height = 22
        Width = 105
      end
      object cxTextEdit188: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 182
        Hint = '5120_1.5_8'
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
        TabOrder = 88
        Height = 22
        Width = 217
      end
      object cxTextEdit189: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 203
        Hint = '5120_1.5.1_3'
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
        TabOrder = 89
        Height = 22
        Width = 65
      end
      object cxTextEdit190: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 203
        Hint = '5120_1.5.1_4'
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
        TabOrder = 90
        Height = 22
        Width = 97
      end
      object cxTextEdit191: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 203
        Hint = '5120_1.5.1_5'
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
        TabOrder = 91
        Height = 22
        Width = 97
      end
      object cxTextEdit192: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 203
        Hint = '5120_1.5.1_6'
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
        TabOrder = 92
        Height = 22
        Width = 97
      end
      object cxTextEdit193: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 203
        Hint = '5120_1.5.1_7'
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
        TabOrder = 93
        Height = 22
        Width = 105
      end
      object cxTextEdit194: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 203
        Hint = '5120_1.5.1_8'
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
        TabOrder = 94
        Height = 22
        Width = 217
      end
      object cxTextEdit195: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 224
        Hint = '5120_1.5.2_8'
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
        TabOrder = 95
        Height = 22
        Width = 217
      end
      object cxTextEdit196: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 224
        Hint = '5120_1.5.2_7'
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
        TabOrder = 96
        Height = 22
        Width = 105
      end
      object cxTextEdit197: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 224
        Hint = '5120_1.5.2_6'
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
        TabOrder = 97
        Height = 22
        Width = 97
      end
      object cxTextEdit198: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 224
        Hint = '5120_1.5.2_5'
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
        TabOrder = 98
        Height = 22
        Width = 97
      end
      object cxTextEdit199: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 224
        Hint = '5120_1.5.2_4'
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
        TabOrder = 99
        Height = 22
        Width = 97
      end
      object cxTextEdit200: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 224
        Hint = '5120_1.5.2_3'
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
        TabOrder = 100
        Height = 22
        Width = 65
      end
      object cxTextEdit201: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 245
        Hint = '5120_1.5.3_3'
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
        TabOrder = 101
        Height = 22
        Width = 65
      end
      object cxTextEdit202: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 245
        Hint = '5120_1.5.3_4'
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
        TabOrder = 102
        Height = 22
        Width = 97
      end
      object cxTextEdit203: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 245
        Hint = '5120_1.5.3_5'
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
        TabOrder = 103
        Height = 22
        Width = 97
      end
      object cxTextEdit204: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 245
        Hint = '5120_1.5.3_6'
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
        TabOrder = 104
        Height = 22
        Width = 97
      end
      object cxTextEdit205: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 245
        Hint = '5120_1.5.3_7'
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
        TabOrder = 105
        Height = 22
        Width = 105
      end
      object cxTextEdit206: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 245
        Hint = '5120_1.5.3_8'
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
        TabOrder = 106
        Height = 22
        Width = 217
      end
      object cxTextEdit207: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 266
        Hint = '5120_1.5.4_8'
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
        TabOrder = 107
        Height = 22
        Width = 217
      end
      object cxTextEdit208: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 266
        Hint = '5120_1.5.4_7'
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
        TabOrder = 108
        Height = 22
        Width = 105
      end
      object cxTextEdit209: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 266
        Hint = '5120_1.5.4_6'
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
        TabOrder = 109
        Height = 22
        Width = 97
      end
      object cxTextEdit210: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 266
        Hint = '5120_1.5.4_5'
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
        TabOrder = 110
        Height = 22
        Width = 97
      end
      object cxTextEdit211: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 266
        Hint = '5120_1.5.4_4'
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
        TabOrder = 111
        Height = 22
        Width = 97
      end
      object cxTextEdit212: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 266
        Hint = '5120_1.5.4_3'
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
        TabOrder = 112
        Height = 22
        Width = 65
      end
      object cxTextEdit213: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 287
        Hint = '5120_1.5.5_3'
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
        TabOrder = 113
        Height = 22
        Width = 65
      end
      object cxTextEdit214: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 287
        Hint = '5120_1.5.5_4'
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
        TabOrder = 114
        Height = 22
        Width = 97
      end
      object cxTextEdit215: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 287
        Hint = '5120_1.5.5_5'
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
        TabOrder = 115
        Height = 22
        Width = 97
      end
      object cxTextEdit216: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 287
        Hint = '5120_1.5.5_6'
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
        TabOrder = 116
        Height = 22
        Width = 97
      end
      object cxTextEdit217: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 287
        Hint = '5120_1.5.5_7'
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
        TabOrder = 117
        Height = 22
        Width = 105
      end
      object cxTextEdit218: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 287
        Hint = '5120_1.5.5_8'
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
        TabOrder = 118
        Height = 22
        Width = 217
      end
      object cxTextEdit219: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 308
        Hint = '5120_1.5.6_3'
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
        TabOrder = 119
        Height = 22
        Width = 65
      end
      object cxTextEdit220: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 308
        Hint = '5120_1.5.6_4'
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
        TabOrder = 120
        Height = 22
        Width = 97
      end
      object cxTextEdit221: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 308
        Hint = '5120_1.5.6_5'
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
        TabOrder = 121
        Height = 22
        Width = 97
      end
      object cxTextEdit222: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 308
        Hint = '5120_1.5.6_6'
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
        TabOrder = 122
        Height = 22
        Width = 97
      end
      object cxTextEdit223: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 308
        Hint = '5120_1.5.6_7'
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
        TabOrder = 123
        Height = 22
        Width = 105
      end
      object cxTextEdit224: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 308
        Hint = '5120_1.5.6_8'
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
        TabOrder = 124
        Height = 22
        Width = 217
      end
      object cxTextEdit225: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 329
        Hint = '5120_1.5.7_8'
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
        TabOrder = 125
        Height = 22
        Width = 217
      end
      object cxTextEdit226: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 329
        Hint = '5120_1.5.7_7'
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
        TabOrder = 126
        Height = 22
        Width = 105
      end
      object cxTextEdit227: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 329
        Hint = '5120_1.5.7_6'
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
        TabOrder = 127
        Height = 22
        Width = 97
      end
      object cxTextEdit228: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 329
        Hint = '5120_1.5.7_5'
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
        TabOrder = 128
        Height = 22
        Width = 97
      end
      object cxTextEdit229: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 329
        Hint = '5120_1.5.7_4'
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
        TabOrder = 129
        Height = 22
        Width = 97
      end
      object cxTextEdit230: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 329
        Hint = '5120_1.5.7_3'
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
        TabOrder = 130
        Height = 22
        Width = 65
      end
      object cxTextEdit231: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 350
        Hint = '5120_1.5.8_3'
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
        TabOrder = 131
        Height = 22
        Width = 65
      end
      object cxTextEdit232: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 350
        Hint = '5120_1.5.8_4'
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
        TabOrder = 132
        Height = 22
        Width = 97
      end
      object cxTextEdit233: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 350
        Hint = '5120_1.5.8_5'
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
        TabOrder = 133
        Height = 22
        Width = 97
      end
      object cxTextEdit234: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 350
        Hint = '5120_1.5.8_6'
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
        TabOrder = 134
        Height = 22
        Width = 97
      end
      object cxTextEdit235: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 350
        Hint = '5120_1.5.8_7'
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
        TabOrder = 135
        Height = 22
        Width = 105
      end
      object cxTextEdit236: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 350
        Hint = '5120_1.5.8_8'
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
        TabOrder = 136
        Height = 22
        Width = 217
      end
      object cxTextEdit237: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 371
        Hint = '5120_1.5.9_8'
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
        TabOrder = 137
        Height = 22
        Width = 217
      end
      object cxTextEdit238: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 371
        Hint = '5120_1.5.9_7'
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
        TabOrder = 138
        Height = 22
        Width = 105
      end
      object cxTextEdit239: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 371
        Hint = '5120_1.5.9_6'
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
        TabOrder = 139
        Height = 22
        Width = 97
      end
      object cxTextEdit240: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 371
        Hint = '5120_1.5.9_5'
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
        TabOrder = 140
        Height = 22
        Width = 97
      end
      object cxTextEdit241: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 371
        Hint = '5120_1.5.9_4'
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
        TabOrder = 141
        Height = 22
        Width = 97
      end
      object cxTextEdit242: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 371
        Hint = '5120_1.5.9_3'
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
        TabOrder = 142
        Height = 22
        Width = 65
      end
      object cxTextEdit243: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 392
        Hint = '5120_1.5.10_3'
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
        TabOrder = 143
        Height = 22
        Width = 65
      end
      object cxTextEdit244: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 392
        Hint = '5120_1.5.10_4'
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
        TabOrder = 144
        Height = 22
        Width = 97
      end
      object cxTextEdit245: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 392
        Hint = '5120_1.5.10_5'
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
        TabOrder = 145
        Height = 22
        Width = 97
      end
      object cxTextEdit246: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 392
        Hint = '5120_1.5.10_6'
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
        TabOrder = 146
        Height = 22
        Width = 97
      end
      object cxTextEdit247: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 392
        Hint = '5120_1.5.10_7'
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
        TabOrder = 147
        Height = 22
        Width = 105
      end
      object cxTextEdit248: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 392
        Hint = '5120_1.5.10_8'
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
        TabOrder = 148
        Height = 22
        Width = 217
      end
      object cxTextEdit249: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 413
        Hint = '5120_1.5.11_3'
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
        TabOrder = 149
        Height = 22
        Width = 65
      end
      object cxTextEdit250: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 413
        Hint = '5120_1.5.11_4'
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
        TabOrder = 150
        Height = 22
        Width = 97
      end
      object cxTextEdit251: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 413
        Hint = '5120_1.5.11_5'
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
        TabOrder = 151
        Height = 22
        Width = 97
      end
      object cxTextEdit252: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 413
        Hint = '5120_1.5.11_6'
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
        TabOrder = 152
        Height = 22
        Width = 97
      end
      object cxTextEdit253: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 413
        Hint = '5120_1.5.11_7'
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
        TabOrder = 153
        Height = 22
        Width = 105
      end
      object cxTextEdit254: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 413
        Hint = '5120_1.5.11_8'
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
        TabOrder = 154
        Height = 22
        Width = 217
      end
      object cxTextEdit255: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 434
        Hint = '5120_1.5.12_8'
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
        TabOrder = 155
        Height = 22
        Width = 217
      end
      object cxTextEdit256: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 434
        Hint = '5120_1.5.12_7'
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
        TabOrder = 156
        Height = 22
        Width = 105
      end
      object cxTextEdit257: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 434
        Hint = '5120_1.5.12_6'
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
        TabOrder = 157
        Height = 22
        Width = 97
      end
      object cxTextEdit258: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 434
        Hint = '5120_1.5.12_5'
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
        TabOrder = 158
        Height = 22
        Width = 97
      end
      object cxTextEdit259: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 434
        Hint = '5120_1.5.12_4'
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
        TabOrder = 159
        Height = 22
        Width = 97
      end
      object cxTextEdit260: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 434
        Hint = '5120_1.5.12_3'
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
        TabOrder = 160
        Height = 22
        Width = 65
      end
      object cxTextEdit261: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 455
        Hint = '5120_1.5.13_3'
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
        TabOrder = 161
        Height = 22
        Width = 65
      end
      object cxTextEdit262: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 455
        Hint = '5120_1.5.13_4'
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
        TabOrder = 162
        Height = 22
        Width = 97
      end
      object cxTextEdit263: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 455
        Hint = '5120_1.5.13_5'
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
        TabOrder = 163
        Height = 22
        Width = 97
      end
      object cxTextEdit264: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 455
        Hint = '5120_1.5.13_6'
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
        TabOrder = 164
        Height = 22
        Width = 97
      end
      object cxTextEdit265: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 455
        Hint = '5120_1.5.13_7'
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
        TabOrder = 165
        Height = 22
        Width = 105
      end
      object cxTextEdit266: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 455
        Hint = '5120_1.5.13_8'
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
        TabOrder = 166
        Height = 22
        Width = 217
      end
      object cxTextEdit267: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 476
        Hint = '5120_1.5.14_8'
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
        TabOrder = 167
        Height = 22
        Width = 217
      end
      object cxTextEdit268: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 476
        Hint = '5120_1.5.14_7'
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
        TabOrder = 168
        Height = 22
        Width = 105
      end
      object cxTextEdit269: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 476
        Hint = '5120_1.5.14_6'
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
        TabOrder = 169
        Height = 22
        Width = 97
      end
      object cxTextEdit270: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 476
        Hint = '5120_1.5.14_5'
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
        TabOrder = 170
        Height = 22
        Width = 97
      end
      object cxTextEdit271: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 476
        Hint = '5120_1.5.14_4'
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
        TabOrder = 171
        Height = 22
        Width = 97
      end
      object cxTextEdit272: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 476
        Hint = '5120_1.5.14_3'
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
        TabOrder = 172
        Height = 22
        Width = 65
      end
      object cxTextEdit273: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 497
        Hint = '5120_1.5.15_3'
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
        TabOrder = 173
        Height = 22
        Width = 65
      end
      object cxTextEdit274: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 497
        Hint = '5120_1.5.15_4'
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
        TabOrder = 174
        Height = 22
        Width = 97
      end
      object cxTextEdit275: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 497
        Hint = '5120_1.5.15_5'
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
        TabOrder = 175
        Height = 22
        Width = 97
      end
      object cxTextEdit276: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 497
        Hint = '5120_1.5.15_6'
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
        TabOrder = 176
        Height = 22
        Width = 97
      end
      object cxTextEdit277: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 497
        Hint = '5120_1.5.15_7'
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
        TabOrder = 177
        Height = 22
        Width = 105
      end
      object cxTextEdit278: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 497
        Hint = '5120_1.5.15_8'
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
        TabOrder = 178
        Height = 22
        Width = 217
      end
      object cxTextEdit279: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 518
        Hint = '5120_1.5.16_3'
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
        TabOrder = 179
        Height = 22
        Width = 65
      end
      object cxTextEdit280: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 518
        Hint = '5120_1.5.16_4'
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
        TabOrder = 180
        Height = 22
        Width = 97
      end
      object cxTextEdit281: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 518
        Hint = '5120_1.5.16_5'
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
        TabOrder = 181
        Height = 22
        Width = 97
      end
      object cxTextEdit282: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 518
        Hint = '5120_1.5.16_6'
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
        TabOrder = 182
        Height = 22
        Width = 97
      end
      object cxTextEdit283: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 518
        Hint = '5120_1.5.16_7'
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
        TabOrder = 183
        Height = 22
        Width = 105
      end
      object cxTextEdit284: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 518
        Hint = '5120_1.5.16_8'
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
        TabOrder = 184
        Height = 22
        Width = 217
      end
    end
    object cxTabSheet7: TcxTabSheet
      Caption = '5120 ('#1087#1088#1086#1076#1086#1083#1078#1077#1085#1080#1077')'
      ImageIndex = 7
      object cxMemo249: TcxMemo
        Left = 3
        Top = 98
        Enabled = False
        Lines.Strings = (
          #1054#1060#1069#1050#1058' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 0
        Height = 22
        Width = 326
      end
      object cxMemo250: TcxMemo
        Left = 3
        Top = 119
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1085#1080#1093': '#1075#1086#1083#1086#1074#1085#1086#1075#1086' '#1084#1086#1079#1075#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 1
        Height = 22
        Width = 326
      end
      object cxMemo286: TcxMemo
        Left = 328
        Top = 98
        Enabled = False
        Lines.Strings = (
          '1.6')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 2
        Height = 22
        Width = 65
      end
      object cxMemo288: TcxMemo
        Left = 3
        Top = 3
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
        TabOrder = 3
        Height = 75
        Width = 326
      end
      object cxMemo289: TcxMemo
        Left = 3
        Top = 77
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
        TabOrder = 4
        Height = 22
        Width = 326
      end
      object cxMemo290: TcxMemo
        Left = 328
        Top = 3
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
        TabOrder = 5
        Height = 75
        Width = 65
      end
      object cxMemo291: TcxMemo
        Left = 328
        Top = 77
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
        TabOrder = 6
        Height = 22
        Width = 65
      end
      object cxMemo292: TcxMemo
        Left = 392
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
        TabOrder = 7
        Height = 75
        Width = 65
      end
      object cxMemo293: TcxMemo
        Left = 392
        Top = 77
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
        TabOrder = 8
        Height = 22
        Width = 65
      end
      object cxMemo294: TcxMemo
        Left = 456
        Top = 3
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1085#1080#1093' '#1087#1072#1094#1080#1077#1085#1090#1072#1084' '#1089':')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 9
        Height = 22
        Width = 393
      end
      object cxMemo295: TcxMemo
        Left = 456
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1086#1085#1082#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1084
          #1080
          #1079#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103#1084#1080)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 10
        Height = 54
        Width = 97
      end
      object cxMemo296: TcxMemo
        Left = 456
        Top = 77
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
        TabOrder = 11
        Height = 22
        Width = 97
      end
      object cxMemo297: TcxMemo
        Left = 552
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1080#1096#1077#1084#1080#1095#1089#1082#1080#1084#1080' '
          #1073#1086#1083#1077#1079#1085#1103#1084#1080
          #1089#1077#1088#1076#1094#1072)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 12
        Height = 54
        Width = 97
      end
      object cxMemo298: TcxMemo
        Left = 552
        Top = 77
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
        TabOrder = 13
        Height = 22
        Width = 97
      end
      object cxMemo299: TcxMemo
        Left = 648
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1101#1085#1076#1086#1082#1088#1080#1085#1085#1099#1084#1080
          #1079#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103#1084#1080)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 14
        Height = 54
        Width = 97
      end
      object cxMemo300: TcxMemo
        Left = 648
        Top = 77
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
        TabOrder = 15
        Height = 22
        Width = 97
      end
      object cxMemo301: TcxMemo
        Left = 744
        Top = 24
        Enabled = False
        Lines.Strings = (
          #1085#1077#1074#1088#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1084
          #1080
          #1079#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103#1084#1080)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 16
        Height = 54
        Width = 105
      end
      object cxMemo302: TcxMemo
        Left = 744
        Top = 77
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
        TabOrder = 17
        Height = 22
        Width = 105
      end
      object cxMemo303: TcxMemo
        Left = 848
        Top = 3
        Enabled = False
        Lines.Strings = (
          #1080#1079' '#1086#1073#1097#1077#1075#1086' '#1095#1080#1089#1083#1072
          #1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' ('#1075#1088'.3)'
          #1087#1088#1086#1074#1077#1076#1077#1085#1086' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
          #1088#1072#1076#1080#1086#1076#1080#1072#1075#1085#1086#1089#1090#1080#1095#1077#1089#1082#1080#1084#1080' '#1084#1077#1090#1086#1076#1072#1084#1080
          'in vivo')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 18
        Height = 75
        Width = 217
      end
      object cxMemo304: TcxMemo
        Left = 848
        Top = 77
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
        TabOrder = 19
        Height = 22
        Width = 217
      end
      object cxMemo305: TcxMemo
        Left = 328
        Top = 119
        Enabled = False
        Lines.Strings = (
          '1.6.1')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 20
        Height = 22
        Width = 65
      end
      object cxMemo306: TcxMemo
        Left = 3
        Top = 140
        Enabled = False
        Lines.Strings = (
          '             '#1101#1085#1076#1086#1082#1088#1080#1085#1085#1099#1093' '#1078#1077#1083#1077#1079)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 21
        Height = 22
        Width = 326
      end
      object cxMemo307: TcxMemo
        Left = 328
        Top = 140
        Enabled = False
        Lines.Strings = (
          '1.6.2')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 22
        Height = 22
        Width = 65
      end
      object cxMemo309: TcxMemo
        Left = 328
        Top = 161
        Enabled = False
        Lines.Strings = (
          '1.6.3')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 23
        Height = 22
        Width = 65
      end
      object cxMemo311: TcxMemo
        Left = 328
        Top = 182
        Enabled = False
        Lines.Strings = (
          '1.6.4')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 24
        Height = 22
        Width = 65
      end
      object cxMemo312: TcxMemo
        Left = 328
        Top = 203
        Enabled = False
        Lines.Strings = (
          '1.6.5')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 25
        Height = 22
        Width = 65
      end
      object cxMemo314: TcxMemo
        Left = 328
        Top = 224
        Enabled = False
        Lines.Strings = (
          '1.6.6')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 26
        Height = 22
        Width = 65
      end
      object cxMemo316: TcxMemo
        Left = 328
        Top = 245
        Enabled = False
        Lines.Strings = (
          '1.6.7')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 27
        Height = 22
        Width = 65
      end
      object cxMemo308: TcxMemo
        Left = 3
        Top = 161
        Enabled = False
        Lines.Strings = (
          '             '#1083#1077#1075#1082#1080#1093'('#1087#1077#1088#1092#1091#1079#1080#1103', '#1074#1077#1085#1090#1080#1083#1103#1094#1080#1103')')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 28
        Height = 22
        Width = 326
      end
      object cxMemo310: TcxMemo
        Left = 3
        Top = 182
        Enabled = False
        Lines.Strings = (
          '             '#1084#1080#1086#1082#1072#1088#1076#1072' '#1074' '#1087#1086#1082#1086#1077)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 29
        Height = 22
        Width = 326
      end
      object cxMemo313: TcxMemo
        Left = 3
        Top = 203
        Enabled = False
        Lines.Strings = (
          '             '#1084#1080#1086#1082#1072#1088#1076#1072' '#1089' '#1085#1072#1075#1088#1091#1079#1086#1095#1085#1099#1084#1080' '#1087#1088#1086#1073#1072#1084#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 30
        Height = 22
        Width = 326
      end
      object cxMemo315: TcxMemo
        Left = 3
        Top = 224
        Enabled = False
        Lines.Strings = (
          '             '#1084#1080#1086#1082#1072#1088#1076#1072' '#1089#1080#1085#1093#1088#1086#1085#1080#1079#1080#1088#1086#1074#1072#1085#1085#1086#1075#1086' '#1089' '#1069#1050#1043)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 31
        Height = 22
        Width = 326
      end
      object cxMemo317: TcxMemo
        Left = 3
        Top = 245
        Enabled = False
        Lines.Strings = (
          '             '#1089#1077#1083#1077#1079#1077#1085#1082#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 32
        Height = 22
        Width = 326
      end
      object cxMemo318: TcxMemo
        Left = 3
        Top = 266
        Enabled = False
        Lines.Strings = (
          '             '#1087#1077#1095#1077#1085#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 33
        Height = 22
        Width = 326
      end
      object cxMemo319: TcxMemo
        Left = 328
        Top = 266
        Enabled = False
        Lines.Strings = (
          '1.6.8')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 34
        Height = 22
        Width = 65
      end
      object cxMemo320: TcxMemo
        Left = 3
        Top = 287
        Enabled = False
        Lines.Strings = (
          #1054#1060#1069#1050#1058'/'#1050#1058)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 35
        Height = 22
        Width = 326
      end
      object cxMemo321: TcxMemo
        Left = 328
        Top = 287
        Enabled = False
        Lines.Strings = (
          '1.7')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 36
        Height = 22
        Width = 65
      end
      object cxMemo322: TcxMemo
        Left = 3
        Top = 308
        Enabled = False
        Lines.Strings = (
          #1055#1069#1058'/'#1050#1058)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 37
        Height = 22
        Width = 326
      end
      object cxMemo323: TcxMemo
        Left = 328
        Top = 308
        Enabled = False
        Lines.Strings = (
          '1.8')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 38
        Height = 22
        Width = 65
      end
      object cxMemo324: TcxMemo
        Left = 3
        Top = 329
        Enabled = False
        Lines.Strings = (
          #1055#1069#1058'/'#1052#1056#1058)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 39
        Height = 22
        Width = 326
      end
      object cxMemo325: TcxMemo
        Left = 328
        Top = 329
        Enabled = False
        Lines.Strings = (
          '1.9')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 40
        Height = 22
        Width = 65
      end
      object cxMemo326: TcxMemo
        Left = 3
        Top = 350
        Enabled = False
        Lines.Strings = (
          #1086#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1061#1077#1083#1080#1082#1086#1073#1072#1082#1090#1077#1088' '#1087#1080#1083#1086#1088#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 41
        Height = 22
        Width = 326
      end
      object cxMemo327: TcxMemo
        Left = 328
        Top = 350
        Enabled = False
        Lines.Strings = (
          '1.10')
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 42
        Height = 22
        Width = 65
      end
      object cxTextEdit285: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 98
        Hint = '5120_1.6_3'
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
        TabOrder = 43
        Height = 22
        Width = 65
      end
      object cxTextEdit286: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 98
        Hint = '5120_1.6_4'
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
        TabOrder = 44
        Height = 22
        Width = 97
      end
      object cxTextEdit287: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 98
        Hint = '5120_1.6_5'
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
        TabOrder = 45
        Height = 22
        Width = 97
      end
      object cxTextEdit288: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 98
        Hint = '5120_1.6_6'
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
        TabOrder = 46
        Height = 22
        Width = 97
      end
      object cxTextEdit289: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 98
        Hint = '5120_1.6_7'
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
        TabOrder = 47
        Height = 22
        Width = 105
      end
      object cxTextEdit290: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 98
        Hint = '5120_1.6_8'
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
        TabOrder = 48
        Height = 22
        Width = 217
      end
      object cxTextEdit291: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 119
        Hint = '5120_1.6.1_3'
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
        TabOrder = 49
        Height = 22
        Width = 65
      end
      object cxTextEdit292: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 119
        Hint = '5120_1.6.1_4'
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
        TabOrder = 50
        Height = 22
        Width = 97
      end
      object cxTextEdit293: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 119
        Hint = '5120_1.6.1_5'
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
        TabOrder = 51
        Height = 22
        Width = 97
      end
      object cxTextEdit294: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 119
        Hint = '5120_1.6.1_6'
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
        TabOrder = 52
        Height = 22
        Width = 97
      end
      object cxTextEdit295: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 119
        Hint = '5120_1.6.1_7'
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
        TabOrder = 53
        Height = 22
        Width = 105
      end
      object cxTextEdit296: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 119
        Hint = '5120_1.6.1_8'
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
        TabOrder = 54
        Height = 22
        Width = 217
      end
      object cxTextEdit297: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 140
        Hint = '5120_1.6.2_3'
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
        TabOrder = 55
        Height = 22
        Width = 65
      end
      object cxTextEdit298: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 161
        Hint = '5120_1.6.3_3'
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
        TabOrder = 56
        Height = 22
        Width = 65
      end
      object cxTextEdit299: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 140
        Hint = '5120_1.6.2_4'
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
        TabOrder = 57
        Height = 22
        Width = 97
      end
      object cxTextEdit300: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 161
        Hint = '5120_1.6.3_4'
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
        TabOrder = 58
        Height = 22
        Width = 97
      end
      object cxTextEdit301: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 140
        Hint = '5120_1.6.2_5'
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
        TabOrder = 59
        Height = 22
        Width = 97
      end
      object cxTextEdit302: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 161
        Hint = '5120_1.6.3_5'
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
        TabOrder = 60
        Height = 22
        Width = 97
      end
      object cxTextEdit303: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 140
        Hint = '5120_1.6.2_6'
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
        TabOrder = 61
        Height = 22
        Width = 97
      end
      object cxTextEdit304: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 161
        Hint = '5120_1.6.3_6'
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
        TabOrder = 62
        Height = 22
        Width = 97
      end
      object cxTextEdit305: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 140
        Hint = '5120_1.6.2_7'
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
        TabOrder = 63
        Height = 22
        Width = 105
      end
      object cxTextEdit306: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 161
        Hint = '5120_1.6.3_7'
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
        TabOrder = 64
        Height = 22
        Width = 105
      end
      object cxTextEdit307: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 140
        Hint = '5120_1.6.2_8'
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
        TabOrder = 65
        Height = 22
        Width = 217
      end
      object cxTextEdit308: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 161
        Hint = '5120_1.6.3_8'
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
        TabOrder = 66
        Height = 22
        Width = 217
      end
      object cxTextEdit309: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 182
        Hint = '5120_1.6.4_3'
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
        TabOrder = 67
        Height = 22
        Width = 65
      end
      object cxTextEdit310: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 203
        Hint = '5120_1.6.5_3'
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
        TabOrder = 68
        Height = 22
        Width = 65
      end
      object cxTextEdit311: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 224
        Hint = '5120_1.6.6_3'
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
        TabOrder = 69
        Height = 22
        Width = 65
      end
      object cxTextEdit312: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 245
        Hint = '5120_1.6.7_3'
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
        TabOrder = 70
        Height = 22
        Width = 65
      end
      object cxTextEdit313: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 182
        Hint = '5120_1.6.4_4'
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
        TabOrder = 71
        Height = 22
        Width = 97
      end
      object cxTextEdit314: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 203
        Hint = '5120_1.6.5_4'
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
        TabOrder = 72
        Height = 22
        Width = 97
      end
      object cxTextEdit315: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 224
        Hint = '5120_1.6.6_4'
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
        TabOrder = 73
        Height = 22
        Width = 97
      end
      object cxTextEdit316: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 245
        Hint = '5120_1.6.7_4'
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
        TabOrder = 74
        Height = 22
        Width = 97
      end
      object cxTextEdit317: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 182
        Hint = '5120_1.6.4_5'
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
        TabOrder = 75
        Height = 22
        Width = 97
      end
      object cxTextEdit318: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 203
        Hint = '5120_1.6.5_5'
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
        TabOrder = 76
        Height = 22
        Width = 97
      end
      object cxTextEdit319: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 224
        Hint = '5120_1.6.6_5'
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
        TabOrder = 77
        Height = 22
        Width = 97
      end
      object cxTextEdit320: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 245
        Hint = '5120_1.6.7_5'
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
        TabOrder = 78
        Height = 22
        Width = 97
      end
      object cxTextEdit321: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 182
        Hint = '5120_1.6.4_6'
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
        TabOrder = 79
        Height = 22
        Width = 97
      end
      object cxTextEdit322: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 203
        Hint = '5120_1.6.5_6'
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
        TabOrder = 80
        Height = 22
        Width = 97
      end
      object cxTextEdit323: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 224
        Hint = '5120_1.6.6_6'
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
        TabOrder = 81
        Height = 22
        Width = 97
      end
      object cxTextEdit324: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 245
        Hint = '5120_1.6.7_6'
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
        TabOrder = 82
        Height = 22
        Width = 97
      end
      object cxTextEdit325: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 182
        Hint = '5120_1.6.4_7'
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
        TabOrder = 83
        Height = 22
        Width = 105
      end
      object cxTextEdit326: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 203
        Hint = '5120_1.6.5_7'
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
        TabOrder = 84
        Height = 22
        Width = 105
      end
      object cxTextEdit327: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 224
        Hint = '5120_1.6.6_7'
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
        TabOrder = 85
        Height = 22
        Width = 105
      end
      object cxTextEdit328: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 245
        Hint = '5120_1.6.7_7'
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
        TabOrder = 86
        Height = 22
        Width = 105
      end
      object cxTextEdit329: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 182
        Hint = '5120_1.6.4_8'
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
        TabOrder = 87
        Height = 22
        Width = 217
      end
      object cxTextEdit330: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 203
        Hint = '5120_1.6.5_8'
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
        TabOrder = 88
        Height = 22
        Width = 217
      end
      object cxTextEdit331: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 224
        Hint = '5120_1.6.6_8'
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
        TabOrder = 89
        Height = 22
        Width = 217
      end
      object cxTextEdit332: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 245
        Hint = '5120_1.6.7_8'
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
        TabOrder = 90
        Height = 22
        Width = 217
      end
      object cxTextEdit333: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 266
        Hint = '5120_1.6.8_3'
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
        TabOrder = 91
        Height = 22
        Width = 65
      end
      object cxTextEdit334: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 287
        Hint = '5120_1.7_3'
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
        TabOrder = 92
        Height = 22
        Width = 65
      end
      object cxTextEdit335: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 308
        Hint = '5120_1.8_3'
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
        TabOrder = 93
        Height = 22
        Width = 65
      end
      object cxTextEdit336: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 329
        Hint = '5120_1.9_3'
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
        TabOrder = 94
        Height = 22
        Width = 65
      end
      object cxTextEdit337: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 266
        Hint = '5120_1.6.8_4'
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
        TabOrder = 95
        Height = 22
        Width = 97
      end
      object cxTextEdit338: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 287
        Hint = '5120_1.7_4'
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
        TabOrder = 96
        Height = 22
        Width = 97
      end
      object cxTextEdit339: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 308
        Hint = '5120_1.8_4'
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
        TabOrder = 97
        Height = 22
        Width = 97
      end
      object cxTextEdit340: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 329
        Hint = '5120_1.9_4'
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
        TabOrder = 98
        Height = 22
        Width = 97
      end
      object cxTextEdit341: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 266
        Hint = '5120_1.6.8_5'
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
        TabOrder = 99
        Height = 22
        Width = 97
      end
      object cxTextEdit342: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 287
        Hint = '5120_1.7_5'
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
        TabOrder = 100
        Height = 22
        Width = 97
      end
      object cxTextEdit343: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 308
        Hint = '5120_1.8_5'
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
        TabOrder = 101
        Height = 22
        Width = 97
      end
      object cxTextEdit344: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 329
        Hint = '5120_1.9_5'
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
        TabOrder = 102
        Height = 22
        Width = 97
      end
      object cxTextEdit345: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 266
        Hint = '5120_1.6.8_6'
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
        TabOrder = 103
        Height = 22
        Width = 97
      end
      object cxTextEdit346: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 287
        Hint = '5120_1.7_6'
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
        TabOrder = 104
        Height = 22
        Width = 97
      end
      object cxTextEdit347: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 308
        Hint = '5120_1.8_6'
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
        TabOrder = 105
        Height = 22
        Width = 97
      end
      object cxTextEdit348: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 329
        Hint = '5120_1.9_6'
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
        TabOrder = 106
        Height = 22
        Width = 97
      end
      object cxTextEdit349: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 266
        Hint = '5120_1.6.8_7'
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
        TabOrder = 107
        Height = 22
        Width = 105
      end
      object cxTextEdit350: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 287
        Hint = '5120_1.7_7'
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
        TabOrder = 108
        Height = 22
        Width = 105
      end
      object cxTextEdit351: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 308
        Hint = '5120_1.8_7'
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
        TabOrder = 109
        Height = 22
        Width = 105
      end
      object cxTextEdit352: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 329
        Hint = '5120_1.9_7'
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
        TabOrder = 110
        Height = 22
        Width = 105
      end
      object cxTextEdit353: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 266
        Hint = '5120_1.6.8_8'
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
        TabOrder = 111
        Height = 22
        Width = 217
      end
      object cxTextEdit354: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 287
        Hint = '5120_1.7_8'
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
        TabOrder = 112
        Height = 22
        Width = 217
      end
      object cxTextEdit355: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 308
        Hint = '5120_1.8_8'
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
        TabOrder = 113
        Height = 22
        Width = 217
      end
      object cxTextEdit356: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 329
        Hint = '5120_1.9_8'
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
        TabOrder = 114
        Height = 22
        Width = 217
      end
      object cxTextEdit357: TcxTextEdit
        Tag = 1
        Left = 392
        Top = 350
        Hint = '5120_1.10_3'
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
        TabOrder = 115
        Height = 22
        Width = 65
      end
      object cxTextEdit358: TcxTextEdit
        Tag = 1
        Left = 456
        Top = 350
        Hint = '5120_1.10_4'
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
        TabOrder = 116
        Height = 22
        Width = 97
      end
      object cxTextEdit359: TcxTextEdit
        Tag = 1
        Left = 552
        Top = 350
        Hint = '5120_1.10_5'
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
        TabOrder = 117
        Height = 22
        Width = 97
      end
      object cxTextEdit360: TcxTextEdit
        Tag = 1
        Left = 648
        Top = 350
        Hint = '5120_1.10_6'
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
        TabOrder = 118
        Height = 22
        Width = 97
      end
      object cxTextEdit361: TcxTextEdit
        Tag = 1
        Left = 744
        Top = 350
        Hint = '5120_1.10_7'
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
        TabOrder = 119
        Height = 22
        Width = 105
      end
      object cxTextEdit362: TcxTextEdit
        Tag = 1
        Left = 848
        Top = 350
        Hint = '5120_1.10_8'
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
        TabOrder = 120
        Height = 22
        Width = 217
      end
    end
    object cxTabSheet8: TcxTabSheet
      Caption = '5121'
      ImageIndex = 8
      object cxMemo328: TcxMemo
        Left = 3
        Top = 3
        Enabled = False
        Lines.Strings = (
          #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1088#1072#1076#1080#1086#1076#1080#1072#1075#1085#1086#1089#1090#1080#1095#1077#1089#1082#1080#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 0
        Height = 38
        Width = 526
      end
      object cxMemo329: TcxMemo
        Left = 3
        Top = 40
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
        Height = 22
        Width = 526
      end
      object cxMemo330: TcxMemo
        Left = 528
        Top = 3
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
        TabOrder = 2
        Height = 38
        Width = 65
      end
      object cxMemo331: TcxMemo
        Left = 592
        Top = 3
        Enabled = False
        Lines.Strings = (
          #1063#1080#1089#1083#1086)
        Properties.Alignment = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 3
        Height = 38
        Width = 65
      end
      object cxMemo332: TcxMemo
        Left = 528
        Top = 40
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
        TabOrder = 4
        Height = 22
        Width = 65
      end
      object cxMemo333: TcxMemo
        Left = 592
        Top = 40
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
        TabOrder = 5
        Height = 22
        Width = 65
      end
      object cxMemo334: TcxMemo
        Left = 3
        Top = 61
        Enabled = False
        Lines.Strings = (
          #1055#1088#1080' '#1088#1072#1076#1080#1086#1076#1080#1072#1075#1085#1086#1089#1090#1080#1095#1077#1089#1082#1080#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103#1093' '#1074#1099#1103#1074#1083#1077#1085#1086' '#1087#1072#1094#1080#1077#1085#1090#1086#1074' '#1089':'
          #1080#1096#1077#1084#1080#1095#1077#1089#1082#1080#1084#1080' '#1073#1086#1083#1077#1079#1085#1103#1084#1080' '#1089#1077#1088#1076#1094#1072)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 6
        Height = 36
        Width = 526
      end
      object cxMemo335: TcxMemo
        Left = 3
        Top = 96
        Enabled = False
        Lines.Strings = (
          #1073#1086#1083#1077#1079#1085#1103#1084#1080' '#1097#1080#1090#1086#1074#1080#1076#1085#1086#1081' '#1078#1077#1083#1077#1079#1099)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 7
        Height = 36
        Width = 526
      end
      object cxMemo336: TcxMemo
        Left = 3
        Top = 131
        Enabled = False
        Lines.Strings = (
          
            #1085#1077#1074#1088#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1084#1080' '#1079#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103#1084#1080' ('#1101#1082#1089#1090#1088#1072#1087#1080#1088#1072#1084#1080#1076#1072#1083#1100#1085#1099#1084#1080' '#1088#1072#1089#1089#1090#1088#1086#1081#1089#1090#1074 +
            #1072#1084#1080', '#1088#1072#1089#1089#1077#1103#1085#1085#1099#1084' '#1089#1082#1083#1077#1088#1086#1079#1086#1084','
          #1088#1072#1079#1083#1080#1095#1085#1099#1084#1080' '#1074#1080#1076#1072#1084#1080' '#1076#1077#1084#1077#1085#1094#1080#1081', '#1074#1086#1089#1087#1072#1083#1080#1090#1077#1083#1100#1085#1099#1084#1080' '#1079#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103#1084#1080')')
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 8
        Height = 36
        Width = 526
      end
      object cxMemo337: TcxMemo
        Left = 3
        Top = 166
        Enabled = False
        Lines.Strings = (
          #1079#1083#1086#1082#1072#1095#1077#1089#1090#1074#1077#1085#1085#1099#1084#1080' '#1085#1086#1074#1086#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103#1084#1080)
        Properties.Alignment = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsOffice11
        StyleDisabled.BorderColor = clBlack
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 9
        Height = 36
        Width = 526
      end
      object cxMemo338: TcxMemo
        Left = 528
        Top = 61
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
        TabOrder = 10
        Height = 36
        Width = 65
      end
      object cxMemo339: TcxMemo
        Left = 528
        Top = 96
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
        TabOrder = 11
        Height = 36
        Width = 65
      end
      object cxMemo340: TcxMemo
        Left = 528
        Top = 131
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
        Height = 36
        Width = 65
      end
      object cxMemo341: TcxMemo
        Left = 528
        Top = 166
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
        Height = 36
        Width = 65
      end
      object cxTextEdit363: TcxTextEdit
        Tag = 1
        Left = 592
        Top = 61
        Hint = '5121_1'
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
        TabOrder = 14
        Height = 36
        Width = 65
      end
      object cxTextEdit364: TcxTextEdit
        Tag = 1
        Left = 592
        Top = 96
        Hint = '5121_2'
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
        TabOrder = 15
        Height = 36
        Width = 65
      end
      object cxTextEdit365: TcxTextEdit
        Tag = 1
        Left = 592
        Top = 131
        Hint = '5121_3'
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
        TabOrder = 16
        Height = 36
        Width = 65
      end
      object cxTextEdit366: TcxTextEdit
        Tag = 1
        Left = 592
        Top = 166
        Hint = '5121_4'
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
        TabOrder = 17
        Height = 36
        Width = 65
      end
    end
  end
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1360
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
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
    ImageOptions.Images = IL
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 1248
    Top = 88
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
      FloatLeft = 1384
      FloatTop = 10
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
  object IL: TImageList
    Left = 1248
    Top = 144
    Bitmap = {
      494C01010D001000580010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  object AL: TActionList
    Images = IL
    Left = 1216
    Top = 144
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
      ImageIndex = 0
      ShortCut = 32883
      OnExecute = aCloseExecute
    end
    object aMetodics: TAction
      Caption = #1052#1077#1090#1086#1076#1080#1082#1080
      Hint = #1050#1086#1085#1092#1080#1075#1091#1088#1080#1088#1086#1074#1072#1085#1080#1077' '#1084#1077#1090#1086#1076#1080#1082
      ImageIndex = 3
      OnExecute = aMetodicsExecute
    end
  end
  object pmMain: TPopupMenu
    Images = IL
    Left = 1248
    Top = 194
    object N1: TMenuItem
      Action = aMetodics
      ImageIndex = 12
    end
  end
  object os: TOracleSession
    Left = 1248
    Top = 245
  end
end
