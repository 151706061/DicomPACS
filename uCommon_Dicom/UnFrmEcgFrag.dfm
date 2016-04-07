object FrmEcgFrag: TFrmEcgFrag
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  ClientHeight = 367
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma,204'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object scrBox: TScrollBox
    Left = 0
    Top = 59
    Width = 800
    Height = 308
    Align = alClient
    TabOrder = 0
    Visible = False
    ExplicitTop = 57
    ExplicitWidth = 833
    ExplicitHeight = 310
    object img1: TImage
      Left = 24
      Top = 5
      Width = 257
      Height = 236
      OnMouseDown = img1MouseDown
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 59
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 833
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 152
      Height = 14
      Caption = #1084#1072#1089#1096#1090#1072#1073' '#1074#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086' '#1084#1084'/'#1084#1042
    end
    object Label2: TLabel
      Left = 8
      Top = 30
      Width = 152
      Height = 14
      Caption = #1084#1072#1089#1096#1090#1072#1073' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086' '#1084#1084'/'#1089
    end
    object Label3: TLabel
      Left = 240
      Top = 8
      Width = 24
      Height = 14
      Caption = 'H pix'
    end
    object seZoomVert: TcxSpinEdit
      Left = 161
      Top = 5
      Properties.Increment = 5.000000000000000000
      Properties.MaxValue = 1000.000000000000000000
      Properties.MinValue = 5.000000000000000000
      Properties.OnChange = seZoomVertPropertiesChange
      TabOrder = 0
      Value = 5
      Width = 59
    end
    object seZoomHoriz: TcxSpinEdit
      Left = 161
      Top = 27
      Properties.Increment = 25.000000000000000000
      Properties.MaxValue = 1000.000000000000000000
      Properties.MinValue = 5.000000000000000000
      Properties.OnChange = seZoomHorizPropertiesChange
      TabOrder = 1
      Value = 5
      Width = 59
    end
    object seHPix: TcxSpinEdit
      Left = 270
      Top = 5
      Hint = #1042#1099#1089#1086#1090#1072' '#1092#1088#1072#1075#1084#1077#1085#1090#1072' '#1074' '#1087#1080#1082#1089#1077#1083#1103#1093
      ParentShowHint = False
      Properties.Increment = 5.000000000000000000
      Properties.MaxValue = 500.000000000000000000
      Properties.MinValue = 5.000000000000000000
      Properties.OnChange = seHPixPropertiesChange
      ShowHint = True
      TabOrder = 2
      Value = 5
      Width = 59
    end
    object cbP: TcxButton
      Left = 503
      Top = 4
      Width = 26
      Height = 25
      Caption = 'P'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = cbPClick
    end
    object cbQ: TcxButton
      Left = 528
      Top = 4
      Width = 26
      Height = 25
      Caption = 'Q'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = cbQClick
    end
    object cbS: TcxButton
      Left = 578
      Top = 4
      Width = 26
      Height = 25
      Caption = 'S'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = cbSClick
    end
    object cbR: TcxButton
      Left = 553
      Top = 4
      Width = 26
      Height = 25
      Caption = 'R'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = cbRClick
    end
    object cbT: TcxButton
      Left = 603
      Top = 4
      Width = 26
      Height = 25
      Caption = 'T'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = cbTClick
    end
    object cbOtrezok: TcxButton
      Left = 343
      Top = 3
      Width = 26
      Height = 25
      Hint = #1054#1090#1088#1077#1079#1086#1082
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = cbOtrezokClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF4F2323D1C5C5FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDC1
        C1401010CFC3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC9BCBC542929D1C5C5512525FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5A3A3461818E1DA
        DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF9E86864B1E1EEFEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF896B6B542929F9F7F7FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBFF0000FF73
        50500B07EDBABAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFBABAFE0000FF7451512222FFBBBBFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F5F53E1C820000FFDD
        DDFF1111FFBBBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEDE9E94A1D1D7966C10000FF0000FF1111FFDDDDFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DADA461818B5A3A3FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF512626D1C5C5
        552A2AC9BCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFD1C5C5401010CFC3C3FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1C5C5
        522727FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object cbUgol: TcxButton
      Left = 368
      Top = 3
      Width = 26
      Height = 25
      Hint = #1059#1075#1086#1083
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = cbUgolClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFA58F8F4D2121FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBE6E6572D2D582E2EEDE8E8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1898941
        1111A58F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE9E4E4552A2A593030CECAF28888FF8888FF8888FFEEEEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF330000411111A99494DDDDFF11
        11FF2222FF2222FF0000FFBBBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E2E2
        522727330000F1EDEDFFFFFF8888FF3333FFFFFFFFEEEEFF0000FFBBBBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF380606927777330000FFFFFFFFFFFF9999FF11
        11FFAAAAFF8888FF0000FFBBBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3DCDC
        4B1E1E330000FFFFFFFFFFFFFFFFFF7777FF0000FF1111FF1111FF2F2FFF0E0E
        FF3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFF4F1F15328289B8282FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF0C0CFFFFFFFF0D0DFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFDFDFD623B3B7C5B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3BFF0E0E
        FF3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D5C5C623B3BFD
        FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF9C8383522727F4F1F1FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9
        A8A84B1E1EE3DCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5CACA552A2AFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object cxButton8: TcxButton
      Left = 343
      Top = 30
      Width = 114
      Height = 25
      Caption = #1059#1073#1088#1072#1090#1100' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = cxButton8Click
    end
    object cbPR: TcxButton
      Left = 503
      Top = 28
      Width = 34
      Height = 25
      Caption = 'PR int'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = cbPRClick
    end
    object cbPRs: TcxButton
      Left = 536
      Top = 28
      Width = 49
      Height = 25
      Caption = 'PR seg'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = cbPRsClick
    end
    object cbQRS: TcxButton
      Left = 584
      Top = 28
      Width = 72
      Height = 25
      Caption = 'QRS complex'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = cbQRSClick
    end
    object cbSTs: TcxButton
      Left = 688
      Top = 28
      Width = 49
      Height = 25
      Caption = 'ST seg'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = cbSTsClick
    end
    object cbQT: TcxButton
      Left = 655
      Top = 28
      Width = 34
      Height = 25
      Caption = 'QT int'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnClick = cbQTClick
    end
  end
  object CnsDMTable1: TCnsDMTable
    AutoShowReffrenceLine = True
    Currentindex = 0
    FetchCount = -1
    Left = 137
    Top = 97
  end
end
