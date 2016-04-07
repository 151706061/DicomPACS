object frmSearchCompany: TfrmSearchCompany
  Left = 240
  Top = 66
  BorderStyle = bsDialog
  Caption = #1055#1086#1080#1089#1082' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
  ClientHeight = 464
  ClientWidth = 983
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 977
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 74
    Width = 977
    Height = 387
    Margins.Top = 0
    Align = alClient
    TabOrder = 6
    LookAndFeel.Kind = lfFlat
    ExplicitLeft = 8
    ExplicitWidth = 983
    ExplicitHeight = 390
    object TVSEARCH: TcxGridDBTableView
      OnDblClick = TVSEARCHDblClick
      OnKeyDown = TVSEARCHKeyDown
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsSearchCompany
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'FK_ID'
          Column = VSEARCHNAME
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VSEARCHNAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Width = 811
      end
      object VSEARCHOWNER: TcxGridDBColumn
        Caption = #1042#1077#1090#1082#1072
        DataBinding.FieldName = 'NAMEOWNER'
        Width = 158
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = TVSEARCH
    end
  end
  object paSearch: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 977
    Height = 37
    Margins.Top = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 0
    ExplicitTop = 28
    ExplicitWidth = 983
    object cxCompanyName: TcxTextEdit
      Left = 146
      Top = 9
      Properties.CharCase = ecUpperCase
      Style.BorderStyle = ebsOffice11
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      OnClick = cxCompanyNameClick
      OnEnter = cxCompanyNameEnter
      OnKeyUp = cxCompanyNameKeyUp
      Width = 407
    end
    object cxLabel1: TcxLabel
      Left = 5
      Top = 9
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102':'
    end
    object bClear: TcxButton
      Left = 559
      Top = 3
      Width = 114
      Height = 31
      Action = aClear
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000007CB1006397
        00639700609600629300659300639200669B005B880000000000000000000000
        000000000000000000000000000000000072CE0080B9007DB8007AB50076B000
        78AE0075A5007DA70086AC008EB10091B3007E9B00758D006A8B00659B0071B2
        0000000000000000000000000000000000000000000000000074A7007FAA0083
        AC008BB10097BC009EC400B2DD00ABD500B4E000B5E200B1DC00A5CD0098BF00
        94B600728D0066990075BC000000000000000000000000000000000000000000
        0084BD0098C900A3C900B7E400B0DC00BEEE00B5E200BCEB00CBFD00B8E700C5
        F600B7E400A8D20096BC008EB2007A9B00699F00A19600000000000000000000
        00000000000000000000000085BE00BDEC00BFEF00BDED00C2F200B2E000D0FF
        00BDEC00D0FF00BEEE00BDED00ADD900A4CE008EB40087A9006F960077BB0000
        000000000000000000000000000000000000000094D8009FD300C2F100BFEE00
        BFEE00CCFF00BFEE00C8FB00C6F800C0F200C2F500B1E100A0CC0093BB0086A7
        007592007AB40000000000000000000000000000000000000000000000000089
        C200C7F900C6F700C4F600C1F300C2F300C4F700C0F300C3F600BDEF00B3E200
        A0CB008CB3007BA30070A01778A18A898A000000000000000000000000000000
        000000000000009EDA00A4D900C6F700C2F200C0F300C1F400BEF200BFF000BE
        F100BCEE00A5D40088BA0078AB4787A48A8D918D837F7B7E7C919C9C00000000
        00000000000000000000000000000000000092CD00C3F600C0F300BEEF00BDF0
        00BAEC00B4E500A7DB008AC31E84AE7597A6B2A49EA7A19D999E9E8791957254
        5564060600000000000000000000000000000000000000000000A4E500A9DD00
        BFF100B8EA00B0E20099CF0088BD4D94B4A9ACAFBFB1ABB0AFAEA7B0B39A989A
        7F4745770D009525006F07000000000000000000000000000000000000000000
        00000000009ED700A7DA0094CB1D91BE85AEC0D2C3BDC8C0BDBABEBFB2BDC49C
        807B8230218B1900A63A00AF4700B04A00771000000000000000000000000000
        00000000000000000000000000ACF64193AFAAB2B7E5D5CFD2CFCFC5CED4B8B9
        BE9A66578D2300A23200BA5000B95200B44E00B44E009D3800700D0000000000
        0000000000000000000000000000000000000000000000A89E9AACAEB0C9D6DF
        B9A29B9C4D2CA02C00BA4D00C75F00C15B00BC5600BA5400B953009A31008617
        00920000000000000000000000000000000000000000000000000000000000A8
        AFB2A06F52A43A00B74600CF6400CF6600CA6300C65E00C35D00C05A00BD5700
        9026009B1F000000000000000000000000000000000000000000000000000000
        00000000000000000000BA4500CE6900F2B96FE8A95FE0923CDD8E37DA8732CD
        7012C861009C3600931F00000000000000000000000000000000000000000000
        000000000000000000000000000000000000D50000B94A00B64C00BC5905B74F
        00B54300A63C00C3610BCF6801AD47009E2A0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        D04100B94A00B73A00000000A24100A83F00D36E02CF6800A53C00AD2D000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000AE3C00D76F00D87F21
        D67B18A33A00B031000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000000B5
        4000CF6800BD5600D3720BD16C02A73500000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000B44C00C36100B14B00AB4400D46F03AF4700A7360000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000FF0000AA4D00DA7400B95300DE7800B046
        00B63B0000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000BE4E00AB4500
        B54F00AE4600B140000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
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
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 448
    Top = 112
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
      FloatLeft = 168
      FloatTop = 66
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbSet'
        end
        item
          BeginGroup = True
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
    object bbSet: TdxBarButton
      Action = aSet
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbClose: TdxBarButton
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object alSearch: TActionList
    Images = frmMain.ilMain
    Left = 448
    Top = 184
    object aSet: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100' '
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      ImageIndex = 10
      ShortCut = 113
      OnExecute = aSetExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091' '#1087#1086#1080#1089#1082#1072
      ImageIndex = 0
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aClear: TAction
      Caption = #1059#1073#1088#1072#1090#1100' '#1092#1080#1083#1100#1090#1088
      Hint = #1059#1073#1088#1072#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 30
      ShortCut = 119
      OnExecute = aClearExecute
    end
  end
  object dsSearchCompany: TDataSource
    DataSet = odsSearchCompany
    Left = 584
    Top = 136
  end
  object odsSearchCompany: TOracleDataSet
    SQL.Strings = (
      'SELECT TP.FK_ID, '
      '       TP.FC_NAME, '
      '       TP.FK_OWNER, '
      
        '       (SELECT FC_NAME FROM ASU.TPERIOD_COMPANY WHERE FK_ID = TP' +
        '.FK_OWNER) AS NAMEOWNER,'
      '       TP.FN_PRIZNAK,'
      '       FK_COMPANYID '
      '  FROM ASU.TPERIOD_COMPANY TP'
      ' WHERE TP.FK_COMPANYID IS NOT NULL'
      '   AND TP.FL_DEL = 0'
      'ORDER BY TP.FC_NAME')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464B5F4F574E4552010000000000090000004E41
      4D454F574E4552010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 584
    Top = 192
  end
end
