object frmAddEditRaion: TfrmAddEditRaion
  Left = 375
  Top = 118
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1081#1086#1085
  ClientHeight = 136
  ClientWidth = 446
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
    Width = 440
    Height = 97
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 24
      Top = 15
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object cxLabel2: TcxLabel
      Left = 24
      Top = 66
      Caption = #1055#1086#1088#1103#1076#1086#1082':'
    end
    object teName: TcxTextEdit
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
      TabOrder = 2
      Width = 311
    end
    object seOrder: TcxSpinEdit
      Left = 113
      Top = 65
      Properties.ImmediatePost = True
      Style.LookAndFeel.SkinName = 'Coffee'
      StyleDisabled.LookAndFeel.SkinName = 'Coffee'
      StyleFocused.LookAndFeel.SkinName = 'Coffee'
      StyleHot.LookAndFeel.SkinName = 'Coffee'
      TabOrder = 3
      Width = 121
    end
    object cxLabel3: TcxLabel
      Left = 24
      Top = 40
      Caption = #1050#1086#1088#1086#1090#1082#1086':'
    end
    object teShort: TcxTextEdit
      Left = 113
      Top = 39
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 10
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
      TabOrder = 5
      Width = 121
    end
  end
  object bOk: TcxButton
    Left = 287
    Top = 106
    Width = 75
    Height = 25
    Action = aOk
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
  end
  object cxButton1: TcxButton
    Left = 368
    Top = 106
    Width = 75
    Height = 25
    Action = aCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.SkinName = 'Caramel'
  end
  object al: TActionList
    Left = 339
    Top = 43
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
