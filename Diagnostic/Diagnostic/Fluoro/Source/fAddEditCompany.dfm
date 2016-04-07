object frmAddEditCompany: TfrmAddEditCompany
  Left = 290
  Top = 121
  BorderStyle = bsDialog
  Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
  ClientHeight = 154
  ClientWidth = 426
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
    Top = 34
    Width = 420
    Height = 117
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 28
    ExplicitWidth = 426
    object lbl4: TLabel
      Left = 9
      Top = 53
      Width = 53
      Height = 13
      Caption = #1050#1086#1084#1087#1072#1085#1080#1103':'
    end
    object lbl1: TLabel
      Left = 9
      Top = 85
      Width = 48
      Height = 13
      Caption = #1055#1086#1088#1103#1076#1086#1082':'
    end
    object cxCompany: TcxButtonEdit
      Left = 93
      Top = 50
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ViewStyle = vsHideCursor
      Properties.OnButtonClick = cxCompanyPropertiesButtonClick
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      Width = 320
    end
    object cxOrder: TcxSpinEdit
      Left = 93
      Top = 83
      Properties.ImmediatePost = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Width = 121
    end
    object cxLabel1: TcxLabel
      Left = 9
      Top = 15
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object cxName: TcxTextEdit
      Left = 93
      Top = 15
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 3
      Width = 320
    end
  end
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 420
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 426
  end
  object BM: TdxBarManager
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
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 232
    Top = 8
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
      Caption = 'OKCancel'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 240
      FloatTop = 116
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbOK'
        end
        item
          Visible = True
          ItemName = 'bbCancel'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbOK: TdxBarButton
      Action = aOK
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbCancel: TdxBarButton
      Action = aCancel
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object alOkCancel: TActionList
    Images = frmMain.ilMain
    Left = 280
    Top = 10
    object aOK: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 10
      ShortCut = 113
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 22
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
