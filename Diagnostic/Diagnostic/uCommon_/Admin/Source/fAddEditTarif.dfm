object frmAddEditTarif: TfrmAddEditTarif
  Left = 369
  Top = 144
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1080#1083#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1090#1072#1088#1080#1092#1072
  ClientHeight = 200
  ClientWidth = 449
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
    Width = 443
    Height = 158
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 24
      Top = 15
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1072#1088#1080#1092#1072':'
    end
    object teName: TcxTextEdit
      Left = 156
      Top = 15
      ParentFont = False
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
      Width = 272
    end
    object cxLabel2: TcxLabel
      Left = 24
      Top = 41
      Caption = #1053#1072#1095#1072#1083#1086' '#1076#1077#1081#1089#1090#1074#1080#1103':'
    end
    object cxLabel3: TcxLabel
      Left = 24
      Top = 68
      Caption = #1050#1086#1085#1077#1094' '#1076#1077#1081#1089#1090#1074#1080#1103':'
    end
    object cxLabel4: TcxLabel
      Left = 24
      Top = 95
      Caption = #1055#1086#1076#1072#1095#1072' '#1084#1072#1096#1080#1085#1099'('#1088#1091#1073'.):'
    end
    object cxLabel5: TcxLabel
      Left = 24
      Top = 122
      Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1084#1080#1085#1091#1090#1099'('#1088#1091#1073'.):'
    end
    object teBegin: TcxTimeEdit
      Left = 156
      Top = 42
      EditValue = 0.000000000000000000
      Properties.ImmediatePost = True
      Properties.TimeFormat = tfHourMin
      Style.LookAndFeel.SkinName = 'Coffee'
      StyleDisabled.LookAndFeel.SkinName = 'Coffee'
      StyleFocused.LookAndFeel.SkinName = 'Coffee'
      StyleHot.LookAndFeel.SkinName = 'Coffee'
      TabOrder = 6
      Width = 121
    end
    object teEnd: TcxTimeEdit
      Left = 156
      Top = 67
      EditValue = 0.000000000000000000
      Properties.ImmediatePost = True
      Properties.TimeFormat = tfHourMin
      Style.LookAndFeel.SkinName = 'Coffee'
      StyleDisabled.LookAndFeel.SkinName = 'Coffee'
      StyleFocused.LookAndFeel.SkinName = 'Coffee'
      StyleHot.LookAndFeel.SkinName = 'Coffee'
      TabOrder = 7
      Width = 121
    end
    object ceCar: TcxCurrencyEdit
      Left = 156
      Top = 94
      Properties.DisplayFormat = '0.00'
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 8
      Width = 121
    end
    object ceMin: TcxCurrencyEdit
      Left = 156
      Top = 122
      Properties.DisplayFormat = '0.00'
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 9
      Width = 121
    end
  end
  object bOk: TcxButton
    Left = 289
    Top = 168
    Width = 75
    Height = 25
    Action = aOk
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
  end
  object cxButton1: TcxButton
    Left = 371
    Top = 168
    Width = 75
    Height = 25
    Action = aCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.SkinName = 'Caramel'
  end
  object al: TActionList
    Left = 347
    Top = 75
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
