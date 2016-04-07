object frmControlProtocolN: TfrmControlProtocolN
  Left = 283
  Top = 66
  Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077
  ClientHeight = 542
  ClientWidth = 863
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
    Width = 857
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object rveText: TRichViewEdit
    AlignWithMargins = True
    Left = 3
    Top = 68
    Width = 857
    Height = 434
    Margins.Top = 0
    ReadOnly = False
    OnChange = rveTextChange
    Align = alTop
    PopupMenu = pmRveText
    TabOrder = 1
    TabStop = False
    BackgroundStyle = bsStretched
    DoInPaletteMode = rvpaCreateCopies
    Options = [rvoAllowSelection, rvoScrollToEnd, rvoShowCheckpoints, rvoShowPageBreaks, rvoTagsArePChars, rvoAutoCopyText, rvoAutoCopyRVF, rvoAutoCopyImage, rvoAutoCopyRTF, rvoFormatInvalidate, rvoDblClickSelectsWord, rvoRClickDeselects, rvoFastFormatting]
    RTFReadProperties.UnicodeMode = rvruMixed
    RTFReadProperties.TextStyleMode = rvrsAddIfNeeded
    RTFReadProperties.ParaStyleMode = rvrsAddIfNeeded
    RVFOptions = [rvfoSavePicturesBody, rvfoSaveControlsBody, rvfoSaveBinary, rvfoSaveBack, rvfoLoadBack, rvfoSaveTextStyles, rvfoSaveParaStyles, rvfoSaveLayout, rvfoLoadLayout, rvfoSaveDocProperties, rvfoLoadDocProperties]
    Style = rvs
    ExplicitLeft = 0
    ExplicitTop = 59
    ExplicitWidth = 854
  end
  object Panel8: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 505
    Width = 857
    Height = 34
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    ExplicitTop = 504
    ExplicitHeight = 35
    object Label2: TLabel
      Left = 273
      Top = 10
      Width = 30
      Height = 13
      Caption = #1044#1072#1090#1072':'
    end
    object Label3: TLabel
      Left = 437
      Top = 10
      Width = 34
      Height = 13
      Caption = #1042#1088#1077#1084#1103':'
    end
    object cxSotr: TcxLookupComboBox
      Left = 649
      Top = 6
      Hint = #1043#1088#1091#1087#1087#1099' '#1076#1080#1072#1075#1085#1086#1079#1086#1074
      Properties.AutoSelect = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.HideSelection = False
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsSotr
      Properties.ReadOnly = False
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 2
      Width = 200
    end
    object cxdeDateProtocol: TcxDateEdit
      Left = 307
      Top = 6
      Properties.ShowTime = False
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      Width = 121
    end
    object cxteTimeProtocol: TcxTimeEdit
      Left = 476
      Top = 6
      EditValue = 0.000000000000000000
      Properties.TimeFormat = tfHourMin
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Width = 69
    end
    object cxLabel28: TcxLabel
      Left = 569
      Top = 8
      Caption = #1042#1088#1072#1095'-'#1101#1082#1089#1087#1077#1088#1090':'
    end
  end
  object paName: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 857
    Height = 31
    Margins.Top = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 7
    ExplicitTop = 33
    object cxName: TcxLabel
      Left = 5
      Top = 6
      Caption = '--'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Book Antiqua'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
  end
  object BM: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
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
    Left = 248
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
      Caption = 'OKCANCEL'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 246
      FloatTop = 111
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbSave'
        end
        item
          Visible = True
          ItemName = 'bbCancel'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbDel'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrint'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbSave: TdxBarButton
      Action = aSave
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbCancel: TdxBarButton
      Action = aCancel
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton1: TdxBarButton
      Action = aSaveTemplate
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton2: TdxBarButton
      Action = aLoadTemplate
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrint: TdxBarButton
      Action = aPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDel: TdxBarButton
      Action = aDel
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 248
    Top = 178
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1086#1085#1090#1088#1086#1083#1100#1085#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077
      ImageIndex = 32
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 31
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aSaveTemplate: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082' '#1096#1072#1073#1083#1086#1085
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082' '#1096#1072#1073#1083#1086#1085
      ImageIndex = 33
      OnExecute = aSaveTemplateExecute
    end
    object aLoadTemplate: TAction
      Caption = #1048#1079#1074#1083#1077#1095#1100' '#1080#1079' '#1096#1072#1073#1083#1086#1085#1072
      Hint = #1048#1079#1074#1083#1077#1095#1100' '#1080#1079' '#1096#1072#1073#1083#1086#1085#1072
      ImageIndex = 34
      OnExecute = aLoadTemplateExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1082#1086#1085#1090#1088#1086#1083#1100#1085#1086#1075#1086' '#1086#1087#1080#1089#1072#1085#1080#1103
      ImageIndex = 10
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1082#1086#1085#1090#1088#1086#1083#1100#1085#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077
      ImageIndex = 19
      ShortCut = 119
      OnExecute = aDelExecute
    end
  end
  object rvs: TRVStyle
    TextStyles = <
      item
        StyleName = 'Normal text'
        Charset = RUSSIAN_CHARSET
        FontName = 'Courier New'
      end>
    ParaStyles = <
      item
        StyleName = 'Paragraph Style'
        Tabs = <>
      end
      item
        StyleName = 'Centered'
        Alignment = rvaCenter
        Tabs = <>
      end
      item
        StyleName = 'Left'
        Tabs = <>
      end>
    ListStyles = <>
    LiveSpellingColor = clLime
    DefCodePage = 1251
    InvalidPicture.Data = {
      07544269746D617036100000424D361000000000000036000000280000002000
      0000200000000100200000000000001000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800080808000808080008080800080808000808080008080
      800080808000808080008080800080808000808080008080800080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000}
    StyleTemplates = <>
    Left = 248
    Top = 232
  end
  object odsRVData: TOracleDataSet
    SQL.Strings = (
      'SELECT a.ROWID, a.*'
      '  FROM trichviewdata a'
      ' WHERE a.fk_pacid = :fk_pacid'
      '')
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A464B5F50414349440300000000000000000000
      00}
    SequenceField.Field = 'FK_ID'
    SequenceField.Sequence = 'SEQ_TRICHVIEWDATA'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F494401000000000008000000464B5F5041
      4349440100000000000700000046425F424C4F420000000000000B000000464E
      5F434F4D50524553530100000000000700000046425F48544D4C000000000000
      0700000046425F54455854000000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 304
    Top = 76
    object odsRVDataFK_ID: TFloatField
      FieldName = 'FK_ID'
    end
    object odsRVDataFK_PACID: TFloatField
      FieldName = 'FK_PACID'
      Required = True
    end
    object odsRVDataFB_BLOB: TBlobField
      FieldName = 'FB_BLOB'
      BlobType = ftOraBlob
    end
    object odsRVDataFN_COMPRESS: TFloatField
      FieldName = 'FN_COMPRESS'
      Required = True
    end
    object odsRVDataFB_HTML: TBlobField
      FieldName = 'FB_HTML'
      BlobType = ftOraBlob
    end
    object odsRVDataFB_TEXT: TMemoField
      FieldName = 'FB_TEXT'
      BlobType = ftOraClob
    end
  end
  object odsSotr: TOracleDataSet
    SQL.Strings = (
      'SELECT 1 AS FK_ID, '#39' '#39' AS FC_FAM, FC_NAME'
      'FROM TSMID'
      
        'WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'RG' +
        '_VRACH'#39')'
      '  AND FL_DEL = 0'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_FAM, FC_FAM || '#39' '#39' || '
      
        '       DECODE(VarcharIsNUll(FC_NAME), 1, '#39#39', SUBSTR(FC_NAME, 0, ' +
        '1) || '#39'. '#39' || '
      
        '       DECODE (VarcharIsNUll(FC_OTCH), 1, '#39#39', SUBSTR(FC_OTCH, 0,' +
        ' 1) || '#39'. '#39')) AS FC_NAME'
      ' FROM TSOTR '
      ' WHERE FK_OTDELID = :PFK_OTDELID '
      '   AND FK_SPRAVID IN (GET_XRAY_VRACH, GET_ZAVOTDEL)'
      '   AND FL_DEL = 0'
      'ORDER BY FC_FAM'
      ''
      '/*SELECT 1 AS FK_ID, '#39' '#39' AS FC_FAM, FC_NAME'
      'FROM TSMID'
      
        'WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'RG' +
        '_VRACH'#39')'
      '  AND FL_DEL = 0'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_FAM, FC_FAM || '#39' '#39' || '
      
        '       DECODE(VarcharIsNUll(FC_NAME), 1, '#39#39', SUBSTR(FC_NAME, 0, ' +
        '1) || '#39'. '#39' || '
      
        '       DECODE (VarcharIsNUll(FC_OTCH), 1, '#39#39', SUBSTR(FC_OTCH, 0,' +
        ' 1) || '#39'. '#39')) AS FC_NAME'
      ' FROM TSOTR '
      ' WHERE FK_OTDELID = GET_XRAYOTDEL '
      '   AND FK_SPRAVID = GET_XRAY_VRACH'
      '   AND FL_DEL = 0'
      'ORDER BY FC_FAM */'
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A50464B5F4F5444454C49440300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000046435F4E414D4501000000000005000000464B5F
      49440100000000000600000046435F46414D010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsSotrBeforeOpen
    Left = 658
    Top = 243
  end
  object dsSotr: TDataSource
    DataSet = odsSotr
    Left = 690
    Top = 243
  end
  object frxRepControlProtocol: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39299.753055555600000000
    ReportOptions.LastChange = 40045.343771793980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepControlProtocolGetValue
    Left = 536
    Top = 128
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 389.291590000000000000
        Top = 18.897650000000000000
        Width = 748.346940000000000000
        AllowSplit = True
        KeepChild = True
        StartNewPage = True
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Width = 739.488770000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]'
            '[OTDELNAME]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 64.252010000000000000
          Width = 109.621410000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218':')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 84.929190000000000000
          Width = 108.850340000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039':')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 132.283550000000000000
          Width = 257.440000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#1113#1056#1109#1056#1029#1057#8218#1057#1026#1056#1109#1056#187#1057#1034#1056#1029#1056#1109#1056#181' '#1056#1109#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1105#1056#181' '#1056#1108' '#1056#1111#1057#1026#1056#1109#1057#8218#1056#1109#1056#1108#1056#1109#1056#187#1057#1107' '#1074#8222 +
              #8211' [NUMISSL]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 154.960730000000000000
          Width = 81.280000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[NAMEISSL]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 185.196970000000000000
          Width = 737.008350000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Top = 190.196970000000000000
          Width = 735.817750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            '[TEXTISSL]')
          ParentFont = False
          WordBreak = True
        end
        object Memo10: TfrxMemoView
          Left = 34.015770000000000000
          Top = 283.464750000000000000
          Width = 78.624230000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176':')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 302.362400000000000000
          Top = 283.464750000000000000
          Width = 116.466110000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#176#1057#8225'-'#1057#1036#1056#1108#1057#1027#1056#1111#1056#181#1057#1026#1057#8218':')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 559.370440000000000000
          Top = 40.795300000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Book Antiqua'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[KABINET], [PHONEKAB]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 117.165430000000000000
          Top = 64.252010000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[PACFIO]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 117.165430000000000000
          Top = 84.929190000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[DATE_ROJD]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 117.165430000000000000
          Top = 283.464750000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            '[DATEISSL]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 423.307360000000000000
          Top = 283.464750000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            '[SOTR]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 468.661720000000000000
        Width = 748.346940000000000000
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Width = 737.008350000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADESIGN]')
          ParentFont = False
        end
      end
    end
  end
  object pmRveText: TPopupMenu
    Images = frmMain.ilMain
    Left = 250
    Top = 283
    object N3: TMenuItem
      Caption = #1042#1099#1088#1077#1079#1072#1090#1100
      ImageIndex = 37
      OnClick = N3Click
    end
    object N2: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 36
      OnClick = N2Click
    end
    object N1: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      ImageIndex = 38
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      ImageIndex = 35
      OnClick = N5Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Action = aSaveTemplate
    end
    object N10: TMenuItem
      Action = aLoadTemplate
    end
  end
end
