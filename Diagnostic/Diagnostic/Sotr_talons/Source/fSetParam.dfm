object frmSetParam: TfrmSetParam
  Left = 430
  Top = 281
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
  ClientHeight = 141
  ClientWidth = 435
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
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 429
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 429
    Height = 104
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    object cxLabel1: TcxLabel
      Left = 15
      Top = 14
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079':'
    end
    object bbSetSotr: TcxButton
      Left = 345
      Top = 11
      Width = 75
      Height = 25
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      Caption = #1042#1099#1073#1088#1072#1090#1100'...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbSetSotrClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxLabel2: TcxLabel
      Left = 15
      Top = 70
      Caption = #1055#1077#1088#1080#1086#1076' '#1089':'
    end
    object cxDateBeg: TcxDateEdit
      Left = 85
      Top = 69
      Properties.DateButtons = [btnNow, btnToday]
      Properties.ShowTime = False
      Style.BorderStyle = ebsUltraFlat
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.ButtonStyle = btsDefault
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 3
      Width = 102
    end
    object cxLabel3: TcxLabel
      Left = 194
      Top = 70
      Caption = #1087#1086':'
    end
    object cxDateEnd: TcxDateEdit
      Left = 212
      Top = 69
      Properties.DateButtons = [btnNow, btnToday]
      Properties.ShowTime = False
      Style.BorderStyle = ebsUltraFlat
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 5
      Width = 102
    end
    object bbSetPeriod: TcxButton
      Left = 345
      Top = 67
      Width = 75
      Height = 25
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
      Caption = #1042#1099#1073#1088#1072#1090#1100'...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = bbSetPeriodClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cbVar: TcxComboBox
      Left = 85
      Top = 11
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items.Strings = (
        #1086#1090#1076#1077#1083#1077#1085#1080#1077
        #1089#1086#1090#1088#1091#1076#1085#1080#1082)
      Properties.PostPopupValueOnTab = True
      Properties.OnChange = cbVarPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 7
      Width = 121
    end
    object lbValue: TcxLabel
      Left = 85
      Top = 39
      Caption = '--'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    end
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
    ImageOptions.Images = frmMain.ILMain
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 352
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
      FloatLeft = 187
      FloatTop = 131
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbSet'
        end
        item
          Visible = True
          ItemName = 'bbCancel'
        end
        item
          BeginGroup = True
          UserDefine = [udWidth]
          UserWidth = 19
          Visible = True
          ItemName = 'cxCheck'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbSet: TdxBarButton
      Action = aSet
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbCancel: TdxBarButton
      Action = aCancel
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object cxCheck: TcxBarEditItem
      Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
      Category = 0
      Hint = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
      Visible = ivNever
      ShowCaption = True
      Width = 100
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.DisplayChecked = '1'
      Properties.DisplayUnchecked = '0'
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      InternalEditValue = 0
    end
  end
  object alOkCancel: TActionList
    Images = frmMain.ILMain
    Left = 392
    Top = 8
    object aSet: TAction
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
      ImageIndex = 3
      ShortCut = 113
      OnExecute = aSetExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 4
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
