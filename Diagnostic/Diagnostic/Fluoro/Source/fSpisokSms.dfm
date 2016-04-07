object frmSpisokSms: TfrmSpisokSms
  Left = 236
  Top = 77
  BorderStyle = bsDialog
  Caption = #1057#1087#1080#1089#1086#1082' '#1076#1083#1103' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1089#1084#1089
  ClientHeight = 473
  ClientWidth = 862
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
  object grSpisok: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 856
    Height = 392
    Margins.Top = 0
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object tvSpisok: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = tvSpisok_FIO
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object tvSpisok_FIO: TcxGridColumn
        Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
        Width = 341
      end
      object tvSpisok_Last: TcxGridColumn
        Caption = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1060#1043
        Width = 157
      end
      object tvSpisok_Plan: TcxGridColumn
        Caption = #1055#1083#1072#1085
        Width = 155
      end
      object tvSpisok_Phone: TcxGridColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085' ('#1084#1086#1073'.)'
        Width = 189
      end
    end
    object grSpisokLevel1: TcxGridLevel
      GridView = tvSpisok
    end
  end
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 856
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object paPb: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 429
    Width = 856
    Height = 41
    Margins.Top = 0
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 6
    Visible = False
    object pbSend: TcxProgressBar
      Left = 127
      Top = 11
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      Width = 716
    end
    object cxLabel1: TcxLabel
      Left = 9
      Top = 12
      Caption = #1048#1076#1105#1090' '#1086#1090#1087#1088#1072#1074#1082#1072' '#1089#1084#1089'...'
    end
  end
  object BM: TdxBarManager
    AllowReset = False
    AutoDockColor = False
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
    DockColor = clBtnFace
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 528
    Top = 80
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
      Caption = 'Main'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 186
      FloatTop = 77
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbSend'
        end
        item
          Visible = True
          ItemName = 'bbClose'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbSend: TdxBarButton
      Action = aSend
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000DB6900E48400E68300C25E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000E47F00D87600DA8919EEAD5FECAD5AE7870000000000000000
        0000000000000000C15700900000000000000000000000000000000000000000
        000000000000EA7B00D06E00D87A03E4973DFBBF7FFFD09DFFCE9CFFD4ABE98F
        06000000000000000000000000000000B84F00BB520000000000000000000000
        0000000000C36100CB6400CB6600D48120EFA659FFC689FFC68CFFC78DFFC78F
        FFC993FFCFA0E49A2EF18200000000000000000000B94300AB4900BE4D000000
        00000000000000000000D35100C06502E18F3CFEB66BFFC07CFFC07CFFC080FF
        C284FFC48AFFC68DFFC890FFCD9AEBA955E38600000000000000000000A64200
        AD4B02B34A00000000000000000000000000D46100DC842BFFE5C0FFC586FFC2
        81FFC281FFC181FFC282FFC386FFC58AFFC68DFFC992F8BD7DDF7F0000000000
        0000000000A44100C9650FB64A00000000000000000000000000000000D36700
        D3781DD48028D37E22CE7818EEA453FFC183FFC184FFC387FFC58AFFC58DFFCC
        98DC7F00000000000000000000A74300DF7817B6470000000000000000000000
        0000000000000000C97100D66800A44F00BF6200FEBA75FFBF7EFFC081FFC284
        FFC388FFC588FFCA93D98823E68B00000000000000B14C04EC821BB249000000
        00000000000000000000000000000000000000000000CA6500DD8D36FFC17BFF
        BE7BFFC080FFC184FEBE7EFFC387FFC58DE49B47C16B00000000000000B34E05
        FF9622AD4400000000000000000000000000000000000000000000D16700C266
        05FFBC74FFBA74FFBB76FFC180E59946CB740BFFCA90FFC485F3B26AC1660000
        0000000000AA4602FF9E24B95506B44600000000000000000000000000000000
        C26100B75800F5A655FFB86DFFB96EFFBA76FFBE7BC56900CA6700E69E4FFFCA
        92FFC586C365000000000000009B3900FF961DF0851BA34400C32A0000000000
        0000000000C16100B45100E99440FFB668FFB366FFB56CFFBF78D88327D77100
        000000CD6B00FCCC9BFFDBACC368030000000000009A3800EA7D14FF961FEA7F
        1AAF4E00AF4900B74C00B54E00BC5B07F19B44FFB25FFFAF5DFFB262FFB96DEB
        9D4CC46300000000000000DD7300CA700CD1791ACC6900000000000000AF4000
        BB5205FF9C28FF931EFF9927F08B27E68628F29639FFAD51FFAC52FFAB54FFAD
        59FFB566F5A655B85C00DF4400000000000000000000C36200CE550000000000
        0000000000000000A83D00E57C19FFA43FFF921EFF9727FF9C34FFA03EFFA445
        FFA649FFA94FFFBB70F4A250B75800D761000000000000000000000000000000
        00000000000000000000000000000000B13900A13A00E47B1AFFB55CFFB15AFF
        A84DFFA94EFFB262FFC07AFFC077DE8630AC5700D15100000000000000000000
        000000000000000000000000000000000000000000000000000000B03900A93D
        00BC5100E38024FCA54BFFB15AF8A44FDF7F28BB5807B05500FF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000B13E00B04000AD4000AF4300B04700B74B00B646000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
    object bbClose: TdxBarButton
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 336
    Top = 152
    object aSend: TAction
      Caption = #1054#1090#1087#1088#1072#1074#1082#1072' '#1089#1084#1089
      Hint = #1053#1072#1095#1072#1090#1100' '#1086#1090#1087#1088#1072#1074#1082#1091' '#1089#1084#1089
      OnExecute = aSendExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 0
      ShortCut = 27
      OnExecute = aCloseExecute
    end
  end
  object oqSendSms: TOracleQuery
    SQL.Strings = (
      'declare'
      '  i integer;'
      'Begin'
      
        '  i:=asu.pkg_sms.send_sms('#39#1042#1099' '#1087#1088#1080#1075#1083#1072#1096#1072#1077#1090#1077#1089#1100' '#1076#1083#1103' '#1087#1088#1086#1093#1086#1078#1076#1077#1085#1080#1103' '#1092#1083#1102#1086 +
        #1088#1086#1075#1088#1072#1092#1080#1080' '#1074' '#1054#1050#1041'.'#1056#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099' 7.30-19.30, '#1089#1073' 8.00-13.00.'#1055#1088#1080' '#1089#1077#1073#1077' '#1080 +
        #1084#1077#1090#1100' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1077#1085#1080#1077' '#1083#1080#1095#1085#1086#1089#1090#1080#39', :pfc_phone);'
      'End;')
    Session = frmMain.os
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A5046435F50484F4E4505000000000000000000
      0000}
    Cursor = crSQLWait
    Left = 480
    Top = 184
  end
end
