object frmAddEditClient: TfrmAddEditClient
  Left = 218
  Top = 51
  BorderStyle = bsDialog
  Caption = 'frmAddEditClient'
  ClientHeight = 190
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 432
    Height = 150
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    object cxLabel5: TcxLabel
      Left = 24
      Top = 91
      Caption = #1058#1077#1082#1091#1097#1072#1103' '#1087#1086#1077#1079#1076#1082#1072':'
    end
    object cxLabel6: TcxLabel
      Left = 24
      Top = 16
      Caption = #1053#1086#1084#1077#1088':'
    end
    object teNum: TcxTextEdit
      Left = 129
      Top = 16
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 0
      Width = 288
    end
    object cxLabel7: TcxLabel
      Left = 24
      Top = 41
      Caption = #1050#1086#1076#1086#1074#1086#1077' '#1089#1083#1086#1074#1086':'
    end
    object teKod: TcxTextEdit
      Left = 129
      Top = 41
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 1
      Width = 288
    end
    object cxLabel8: TcxLabel
      Left = 24
      Top = 66
      Caption = #1044#1086#1084#1072#1096#1085#1080#1081' '#1072#1076#1088#1077#1089':'
    end
    object cxLabel9: TcxLabel
      Left = 24
      Top = 116
      Caption = #1041#1086#1085#1091#1089#1085#1099#1077' '#1087#1086#1077#1079#1076#1082#1080':'
    end
    object beAdr: TcxButtonEdit
      Left = 129
      Top = 65
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end
        item
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000000000000000
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
          Kind = bkGlyph
        end>
      Properties.ViewStyle = vsHideCursor
      Properties.OnButtonClick = beAdrPropertiesButtonClick
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 7
      Width = 288
    end
    object seNow: TcxSpinEdit
      Left = 129
      Top = 90
      Properties.ImmediatePost = True
      Style.LookAndFeel.SkinName = 'Coffee'
      StyleDisabled.LookAndFeel.SkinName = 'Coffee'
      StyleFocused.LookAndFeel.SkinName = 'Coffee'
      StyleHot.LookAndFeel.SkinName = 'Coffee'
      TabOrder = 8
      Width = 121
    end
    object seBonus: TcxSpinEdit
      Left = 129
      Top = 116
      Properties.ImmediatePost = True
      Style.LookAndFeel.SkinName = 'Coffee'
      StyleDisabled.LookAndFeel.SkinName = 'Coffee'
      StyleFocused.LookAndFeel.SkinName = 'Coffee'
      StyleHot.LookAndFeel.SkinName = 'Coffee'
      TabOrder = 9
      Width = 121
    end
  end
  object bOk: TcxButton
    Left = 278
    Top = 159
    Width = 75
    Height = 25
    Action = aOk
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
  end
  object cxButton1: TcxButton
    Left = 360
    Top = 159
    Width = 75
    Height = 25
    Action = aCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.SkinName = 'Caramel'
  end
  object al: TActionList
    Left = 307
    Top = 99
    object aOk: TAction
      Caption = 'Ok'
      Hint = 'OK'
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
