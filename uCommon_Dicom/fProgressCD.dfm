object frmProgressCD: TfrmProgressCD
  Left = 314
  Top = 204
  BorderStyle = bsDialog
  Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
  ClientHeight = 176
  ClientWidth = 542
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object pcParam: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 536
    Height = 61
    ActivePage = cxTabSheet1
    Align = alTop
    HideTabs = True
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Green'
    ParentShowHint = False
    ShowHint = True
    Style = 7
    TabOrder = 0
    ClientRectBottom = 60
    ClientRectLeft = 1
    ClientRectRight = 535
    ClientRectTop = 1
    object cxTabSheet1: TcxTabSheet
      Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072
      ImageIndex = 0
      object cxLabel1: TcxLabel
        Left = 12
        Top = 6
        Caption = #1044#1077#1081#1089#1090#1074#1080#1077':'
        Transparent = True
      end
      object cxProgressBar1: TcxProgressBar
        Left = 12
        Top = 29
        AutoSize = False
        Style.BorderStyle = ebsOffice11
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 1
        Height = 22
        Width = 508
      end
      object lb1: TcxLabel
        Left = 75
        Top = 6
        Caption = '--'
        Transparent = True
      end
    end
  end
  object cxPageControl1: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 67
    Width = 536
    Height = 62
    Margins.Top = 0
    ActivePage = cxTabSheet2
    Align = alTop
    HideTabs = True
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Office2007Green'
    ParentShowHint = False
    ShowHint = True
    Style = 7
    TabOrder = 1
    ClientRectBottom = 61
    ClientRectLeft = 1
    ClientRectRight = 535
    ClientRectTop = 1
    object cxTabSheet2: TcxTabSheet
      Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072
      ImageIndex = 0
      object cxLabel2: TcxLabel
        Left = 12
        Top = 3
        Caption = #1044#1077#1081#1089#1090#1074#1080#1077': '
        Transparent = True
      end
      object cxProgressBar2: TcxProgressBar
        Left = 12
        Top = 26
        AutoSize = False
        Style.BorderStyle = ebsOffice11
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 1
        Height = 22
        Width = 508
      end
      object lb2: TcxLabel
        Left = 75
        Top = 3
        Caption = '--'
        Transparent = True
      end
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 132
    Width = 536
    Height = 41
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object bCancel: TcxButton
      Left = 229
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = bCancelClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 120
    Top = 120
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1055#1088#1077#1082#1088#1072#1090#1080#1090#1100' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1091
    end
  end
end
