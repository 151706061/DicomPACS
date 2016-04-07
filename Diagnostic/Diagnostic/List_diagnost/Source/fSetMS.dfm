object frmSetMS: TfrmSetMS
  Left = 419
  Top = 262
  BorderStyle = bsDialog
  Caption = #1054#1090#1084#1077#1090#1082#1080' '#1084#1077#1076#1089#1077#1089#1090#1088#1099
  ClientHeight = 92
  ClientWidth = 343
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
    Width = 337
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 8
      Top = 12
      Caption = #1052#1077#1076#1089#1077#1089#1090#1088#1072':'
    end
    object beMs: TcxButtonEdit
      Left = 77
      Top = 11
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ViewStyle = vsHideCursor
      Properties.OnButtonClick = beMsPropertiesButtonClick
      TabOrder = 1
      Width = 249
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 337
    Height = 42
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bOk: TcxButton
      Left = 173
      Top = 7
      Width = 75
      Height = 25
      Action = aOk
      TabOrder = 0
    end
    object bCancel: TcxButton
      Left = 251
      Top = 7
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
    end
  end
  object al: TActionList
    Left = 40
    Top = 48
    object aOk: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
