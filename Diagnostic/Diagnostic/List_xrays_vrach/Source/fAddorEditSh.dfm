object frmAddorEditSh: TfrmAddorEditSh
  Left = 294
  Top = 124
  BorderStyle = bsDialog
  Caption = 'frmAddorEditSh'
  ClientHeight = 246
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 570
    Height = 195
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 13
      Top = 8
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object cxLabel2: TcxLabel
      Left = 13
      Top = 32
      Caption = #1058#1077#1082#1089#1090':'
    end
    object teName: TcxTextEdit
      Left = 95
      Top = 8
      Properties.MaxLength = 100
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 2
      OnClick = teNameClick
      OnEnter = teNameEnter
      Width = 463
    end
    object memText: TcxMemo
      Left = 95
      Top = 32
      Properties.MaxLength = 4000
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 3
      OnClick = memTextClick
      OnEnter = memTextEnter
      Height = 153
      Width = 463
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 201
    Width = 570
    Height = 42
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 248
    ExplicitTop = 240
    ExplicitWidth = 185
    ExplicitHeight = 41
    object cxButton1: TcxButton
      Left = 399
      Top = 8
      Width = 75
      Height = 25
      Action = aSave
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton2: TcxButton
      Left = 483
      Top = 8
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 155
    Top = 107
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1096#1072#1073#1083#1086#1085
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
