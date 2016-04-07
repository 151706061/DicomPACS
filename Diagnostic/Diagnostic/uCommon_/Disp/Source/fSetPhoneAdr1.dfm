object frmSetPhoneAdr1: TfrmSetPhoneAdr1
  Left = 350
  Top = 197
  BorderStyle = bsNone
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1079#1072#1082#1072#1079
  ClientHeight = 193
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 43
    Width = 523
    Height = 98
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    object cxLabel2: TcxLabel
      Left = 6
      Top = 10
      Caption = #1040#1076#1088#1077#1089' '#1082#1083#1080#1077#1085#1090#1072':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      Transparent = True
    end
    object teAdr1: TcxTextEdit
      Left = 119
      Top = 7
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 119
      Properties.MaxLength = 25
      Properties.OnChange = teAdr1PropertiesChange
      Style.BorderColor = clTeal
      Style.BorderStyle = ebsThick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = ''
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = ''
      StyleFocused.LookAndFeel.SkinName = ''
      StyleHot.LookAndFeel.SkinName = ''
      TabOrder = 1
      OnClick = teAdr1Click
      OnEnter = teAdr1Enter
      OnExit = teAdr1Exit
      OnKeyDown = teAdr1KeyDown
      Width = 397
    end
    object cxLabel4: TcxLabel
      Left = 6
      Top = 39
      Caption = #1055#1077#1088#1077#1089#1077#1095#1077#1085#1080#1077' '#1089':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      Transparent = True
    end
    object teAdr2: TcxTextEdit
      Left = 119
      Top = 36
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 119
      Properties.MaxLength = 25
      Properties.OnChange = teAdr2PropertiesChange
      Style.BorderColor = clTeal
      Style.BorderStyle = ebsThick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      TabOrder = 3
      OnClick = teAdr2Click
      OnEnter = teAdr2Enter
      OnExit = teAdr2Exit
      OnKeyDown = teAdr2KeyDown
      Width = 397
    end
    object cxLabel3: TcxLabel
      Left = 6
      Top = 68
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      Transparent = True
    end
    object teDop: TcxTextEdit
      Left = 119
      Top = 65
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 119
      Properties.MaxLength = 50
      Style.BorderColor = clTeal
      Style.BorderStyle = ebsThick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      TabOrder = 5
      OnClick = teDopClick
      OnEnter = teDopEnter
      OnExit = teDopExit
      OnKeyDown = teDopKeyDown
      Width = 397
    end
  end
  object paHouse: TPanel
    AlignWithMargins = True
    Left = 529
    Top = 43
    Width = 143
    Height = 98
    Margins.Left = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 1
    object cxLabel5: TcxLabel
      Left = 6
      Top = 10
      Caption = #1044#1086#1084':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      Transparent = True
    end
    object teHouse: TcxTextEdit
      Left = 56
      Top = 7
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 119
      Properties.MaxLength = 25
      Style.BorderColor = clTeal
      Style.BorderStyle = ebsThick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      TabOrder = 1
      OnClick = teHouseClick
      OnEnter = teHouseEnter
      OnExit = teHouseExit
      OnKeyDown = teHouseKeyDown
      OnKeyPress = teHouseKeyPress
      Width = 78
    end
    object cxLabel6: TcxLabel
      Left = 6
      Top = 39
      Caption = #1055#1086#1076'.:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      Transparent = True
    end
    object teHall: TcxTextEdit
      Left = 56
      Top = 36
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 119
      Properties.MaxLength = 25
      Style.BorderColor = clTeal
      Style.BorderStyle = ebsThick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      TabOrder = 3
      OnClick = teHallClick
      OnEnter = teHallEnter
      OnExit = teHallExit
      OnKeyDown = teHallKeyDown
      Width = 78
    end
    object cxLabel7: TcxLabel
      Left = 6
      Top = 68
      Caption = #1041#1091#1082#1074#1072':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      Transparent = True
    end
    object teHouseLiter: TcxTextEdit
      Left = 56
      Top = 65
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 119
      Properties.MaxLength = 25
      Style.BorderColor = clTeal
      Style.BorderStyle = ebsThick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      TabOrder = 5
      OnClick = teHouseLiterClick
      OnEnter = teHouseLiterEnter
      OnExit = teHouseLiterExit
      OnKeyDown = teHouseLiterKeyDown
      Width = 78
    end
  end
  object Panel4: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 144
    Width = 669
    Height = 46
    Margins.Top = 0
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 2
    object bEnter: TcxButton
      Left = 394
      Top = 3
      Width = 129
      Height = 38
      Action = aOk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
      Left = 530
      Top = 3
      Width = 129
      Height = 38
      Action = aCancel
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 669
    Height = 37
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object cxLabel1: TcxLabel
      Left = 48
      Top = 7
      Caption = #1058#1077#1083#1077#1092#1086#1085':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      Transparent = True
    end
    object meVvod: TcxMaskEdit
      Left = 119
      Top = 6
      AutoSize = False
      ParentFont = False
      Properties.ClearKey = 119
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d+'
      Properties.MaxLength = 0
      Style.BorderColor = clTeal
      Style.BorderStyle = ebsThick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = ''
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = ''
      StyleFocused.LookAndFeel.SkinName = ''
      StyleHot.LookAndFeel.SkinName = ''
      TabOrder = 1
      OnKeyDown = meVvodKeyDown
      OnKeyPress = meVvodKeyPress
      Height = 24
      Width = 132
    end
    object cxButton3: TcxButton
      AlignWithMargins = True
      Left = 640
      Top = 1
      Width = 27
      Height = 25
      TabOrder = 2
      OnMouseDown = cxButton3MouseDown
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
  end
  object al: TActionList
    Left = 360
    Top = 24
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aOk: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1079#1072#1082#1072#1079
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aTab: TAction
      Caption = 'aTab'
      ShortCut = 16393
      OnExecute = aTabExecute
    end
  end
  object jvFrmStor: TJvFormStorage
    AppStorage = frmMain.AppStorage
    AppStoragePath = 'frmSetPhoneAdr1\'
    Options = [fpLocation]
    StoredValues = <>
    Left = 398
    Top = 22
  end
  object oqMergeDetail: TOracleQuery
    SQL.Strings = (
      'merge into taxi.tjuradr1 using dual on (fk_jurid = :pfk_jurid)'
      'when matched then '
      
        '  update set fc_adr=:pfc_adr, fc_dop=:pfc_dop, fk_type=:pfk_type' +
        ', fc_street=upper(:pfc_street), fc_street1=upper(:pfc_street1), '
      
        '             fl_isdownslash=:pfl_isdownslash, fk_idadr1=:pfk_ida' +
        'dr1, fk_idadr2=:pfk_idadr2, fc_house=:pfc_house, '
      
        '             fc_houseliter=:pfc_houseliter, fc_hall=:pfc_hall, f' +
        'c_adr_place = :pfc_adr_place, fc_housefraction = :pfc_housefract' +
        'ion '
      '       where fk_jurid = :pfk_jurid'
      'when not matched then '
      
        '  insert(fk_jurid, fc_adr, fc_dop, fk_type, fc_street, fc_street' +
        '1, fl_isdownslash, fk_idadr1, fk_idadr2, fc_house, fc_houseliter' +
        ', fc_hall, fc_adr_place, fc_housefraction) '
      
        '  values(:pfk_jurid, :pfc_adr, :pfc_dop, :pfk_type, upper(:pfc_s' +
        'treet), upper(:pfc_street1), :pfl_isdownslash, :pfk_idadr1, :pfk' +
        '_idadr2, :pfc_house, :pfc_houseliter, :pfc_hall, :pfc_adr_place,' +
        ' :pfc_housefraction)')
    Session = frmMain.os
    Optimize = False
    Variables.Data = {
      030000000E0000000A0000003A50464B5F4A5552494403000000000000000000
      0000080000003A5046435F414452050000000000000000000000080000003A50
      46435F444F50050000000000000000000000090000003A50464B5F5459504503
      00000000000000000000000B0000003A5046435F535452454554050000000000
      0000000000000C0000003A5046435F5354524545543105000000000000000000
      0000100000003A50464C5F4953444F574E534C41534803000000000000000000
      00000B0000003A50464B5F4944414452310300000000000000000000000B0000
      003A50464B5F4944414452320300000000000000000000000A0000003A504643
      5F484F5553450500000000000000000000000F0000003A5046435F484F555345
      4C49544552050000000000000000000000090000003A5046435F48414C4C0500
      000000000000000000000E0000003A5046435F4144525F504C41434505000000
      0000000000000000120000003A5046435F484F5553454652414354494F4E0500
      00000000000000000000}
    Cursor = crSQLWait
    Left = 464
    Top = 24
  end
  object oqInsert1: TOracleQuery
    SQL.Strings = (
      
        'insert into taxi.tjournal(fd_datein, fn_sos, fc_phone, fc_phone_' +
        'full, fk_clientid, fk_sotrid, fk_taxiid, fc_adr1, fk_adr1id, fn_' +
        'stop, fk_raionid) '
      'values(sysdate, '
      '       9, '
      '       taxi.get_phone_without_kodtown(:pfc_phone), '
      '       :pfc_phone_full, '
      
        '       (select max(fk_clientid) from taxi.tphones where fc_phone' +
        ' = taxi.get_phone_without_kodtown(:pfc_phone)), '
      '       :pfk_sotrid, '
      '       :pfk_taxiid,'
      '       :pfc_adr1, '
      '       :pfk_adr1id, '
      '       :pfn_stop, '
      
        '       taxi.pkg_drivergrid.GetStreetDistrict(:pfk_adr1id, :pfk_a' +
        'dr2id, :pfn_num))'
      'returning fk_id into :pfk_id')
    Session = frmMain.os
    Optimize = False
    Variables.Data = {
      030000000A0000000A0000003A5046435F50484F4E4505000000000000000000
      00000F0000003A5046435F50484F4E455F46554C4C0500000000000000000000
      000B0000003A50464B5F534F545249440300000000000000000000000B000000
      3A50464B5F544158494944030000000000000000000000090000003A5046435F
      414452310500000000000000000000000B0000003A50464B5F41445231494403
      0000000000000000000000090000003A50464E5F53544F500300000000000000
      000000000B0000003A50464B5F41445232494403000000000000000000000008
      0000003A50464E5F4E554D030000000000000000000000070000003A50464B5F
      4944030000000000000000000000}
    Left = 187
    Top = 133
  end
  object oqInsert2: TOracleQuery
    SQL.Strings = (
      
        'insert into taxi.tjournal(fd_datein, fn_sos, fc_phone, fc_phone_' +
        'full, fk_clientid, fk_sotrid, fk_taxiid, fc_adr1, fk_adr1id, fn_' +
        'stop, fk_raionid) '
      'values(sysdate, '
      '       9, '
      '       taxi.get_phone_without_kodtown(:pfc_phone), '
      '       :pfc_phone_full, '
      
        '       (select max(fk_clientid) from taxi.tphones where fc_phone' +
        ' = taxi.get_phone_without_kodtown(:pfc_phone)), '
      '       :pfk_sotrid, '
      '       :pfk_taxiid,'
      '       :pfc_adr1, '
      '       :pfk_adr1id, '
      '       :pfn_stop, '
      '       :pfk_raionid)'
      'returning fk_id into :pfk_id')
    Session = frmMain.os
    Optimize = False
    Variables.Data = {
      03000000090000000A0000003A5046435F50484F4E4505000000000000000000
      00000F0000003A5046435F50484F4E455F46554C4C0500000000000000000000
      000B0000003A50464B5F534F545249440300000000000000000000000B000000
      3A50464B5F544158494944030000000000000000000000090000003A5046435F
      414452310500000000000000000000000B0000003A50464B5F41445231494403
      0000000000000000000000090000003A50464E5F53544F500300000000000000
      000000000C0000003A50464B5F5241494F4E4944030000000000000000000000
      070000003A50464B5F494403000000040000000113000000000000}
    Left = 251
    Top = 133
  end
end
