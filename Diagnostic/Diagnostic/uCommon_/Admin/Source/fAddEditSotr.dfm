object frmAddEditSotr: TfrmAddEditSotr
  Left = 312
  Top = 62
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
  ClientHeight = 230
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
    Height = 190
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 24
      Top = 15
      Caption = #1060#1072#1084#1080#1083#1080#1103':'
    end
    object cxLabel2: TcxLabel
      Left = 24
      Top = 42
      Caption = #1048#1084#1103':'
    end
    object cxLabel3: TcxLabel
      Left = 24
      Top = 69
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
    end
    object teFam: TcxTextEdit
      Left = 113
      Top = 14
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
      TabOrder = 3
      Width = 311
    end
    object teName: TcxTextEdit
      Left = 113
      Top = 41
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 4
      Width = 311
    end
    object teOtch: TcxTextEdit
      Left = 113
      Top = 68
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 5
      Width = 311
    end
    object cxLabel4: TcxLabel
      Left = 24
      Top = 96
      Caption = #1051#1086#1075#1080#1085':'
    end
    object teLogin: TcxTextEdit
      Left = 113
      Top = 95
      Properties.MaxLength = 15
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 7
      Width = 311
    end
    object cxLabel5: TcxLabel
      Left = 24
      Top = 123
      Caption = #1055#1072#1088#1086#1083#1100':'
    end
    object tePass: TcxTextEdit
      Left = 113
      Top = 122
      Properties.EchoMode = eemPassword
      Properties.MaxLength = 15
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 9
      Width = 311
    end
    object cxLabel6: TcxLabel
      Left = 24
      Top = 150
      Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1077':'
    end
    object teConfirm: TcxTextEdit
      Left = 113
      Top = 149
      Properties.EchoMode = eemPassword
      Properties.MaxLength = 15
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 11
      Width = 311
    end
  end
  object bOk: TcxButton
    Left = 290
    Top = 199
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
    Top = 199
    Width = 75
    Height = 25
    Action = aCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.SkinName = 'Caramel'
  end
  object al: TActionList
    Left = 59
    Top = 171
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
