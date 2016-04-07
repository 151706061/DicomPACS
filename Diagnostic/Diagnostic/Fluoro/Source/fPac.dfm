object frmPac: TfrmPac
  Left = 447
  Top = 54
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1055#1072#1094#1080#1077#1085#1090' ('#1057#1087#1080#1089#1086#1082' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081')'
  ClientHeight = 585
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 211
    Width = 601
    Height = 332
    Margins.Top = 0
    Align = alClient
    PopupMenu = pmGrid
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    LookAndFeel.SkinName = ''
    object TVLIST: TcxGridDBTableView
      OnKeyDown = TVLISTKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = TVLISTCellDblClick
      DataController.DataSource = dsList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'DOZA'
          Column = VDOZA
        end
        item
          Kind = skCount
          FieldName = 'FK_ID'
          Column = VLISTRUN
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnSorting = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VLISTRUN: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'FD_RUN'
        Width = 73
      end
      object VLISTNAME: TcxGridDBColumn
        Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        Width = 270
      end
      object VDOZA: TcxGridDBColumn
        Caption = #1044#1086#1079#1072'('#1084#1047#1074')'
        DataBinding.FieldName = 'DOZA'
        Width = 54
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = TVLIST
    end
  end
  object Panel4: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 546
    Width = 601
    Height = 36
    Hint = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086' '#1087#1072#1094#1080#1077#1085#1090#1072' '
    Margins.Top = 0
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 517
      Top = 5
      Width = 75
      Height = 25
      Action = actClose
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 177
    Width = 601
    Height = 31
    Margins.Top = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 3
    object cxLabel1: TcxLabel
      Left = 4
      Top = 5
      Caption = #1057#1087#1080#1089#1086#1082' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfOffice11
      Style.Shadow = False
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.Kind = lfOffice11
    end
    object Panel2: TPanel
      Left = 146
      Top = 2
      Width = 453
      Height = 27
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 3
      object dxBarDockControl1: TdxBarDockControl
        Left = 9
        Top = 0
        Width = 345
        Height = 26
        Align = dalNone
        BarManager = BM
        SunkenBorder = False
        UseOwnSunkenBorder = True
      end
    end
  end
  object verGr: TcxVerticalGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 601
    Height = 171
    Hint = #1051#1080#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1087#1072#1094#1080#1077#1085#1090#1072
    Align = alTop
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
    OptionsView.RowHeaderWidth = 203
    TabOrder = 7
    object rowPacient: TcxCategoryRow
      Options.Focusing = False
      Options.TabStop = False
      Properties.Caption = #1055#1072#1094#1080#1077#1085#1090
    end
    object merFIOMK: TcxMultiEditorRow
      Options.CanResized = False
      Properties.Editors = <
        item
          Caption = #1060#1048#1054
          Hint = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
          EditPropertiesClassName = 'TcxButtonEditProperties'
          EditProperties.Alignment.Horz = taCenter
          EditProperties.Buttons = <
            item
              Default = True
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00914413009144
                1300914413009144130091441300914413009144130091441300FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00F7E6DA00F5E0
                D100F3DAC800F1D3BE00EFCDB500EDC7AC00EDC7AC0091441300FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00F9EDE500F7E6
                DA00F5E0D100F3DAC800F2D6C300F0D0BA00EECAB00091441300FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00FCF5F000D383
                5700D3835700D3835700D3835700D3835700F0D0BA0091441300FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00FFFFFF00FDF8
                F500FAF1EA00F8EADF00F6E3D500F4DDCC00F2D6C30091441300CEB8AA007A5A
                46007A5A46007A5A46007A5A46007A5A46007A5A4600E0A98B00FFFFFF00D383
                5700D3835700D3835700D3835700D3835700F4DDCC0091441300CEB8AA00EFE7
                E300EBE1DC00E7DBD500E3D5CD00DFCFC600DBC9BF00E0A98B00FFFFFF00FFFF
                FF00FFFFFF00FDF8F500FAF1EA00F8EADF00F6E3D50091441300CEB8AA00F4EE
                EB00EFE7E300EBE1DC00E7DBD500E5D8D100E1D2CA00E0A98B00FFFFFF00D383
                5700D3835700FFFFFF00E0A98B00AB542800AB542800AB542800CEB8AA00F9F5
                F300DFA98300DFA98300DFA98300DFA98300DFA98300E0A98B00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00E0A98B00F3EBE600AB542800FF00FF00CEB8AA00FFFF
                FF00FBF8F700F6F1EF00F1EAE700EDE4DF00E9DED800E0A98B00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00E8A98B00C56A3100FF00FF00FF00FF00CEB8AA00FFFF
                FF00DFA98300DFA98300DFA98300DFA98300DFA98300E0A98B00E0A98B00E0A9
                8B00E0A98B00E0A98B00E0A98B00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
                FF00FFFFFF00FFFFFF00FBF8F700F6F1EF00F1EAE700EDE4DF0069473100FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
                FF00DFA98300DFA98300FFFFFF00CEB8AA00694731006947310069473100FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00CEB8AA00F3EBE60069473100FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00CEB8AA0069473100FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00CEB8
                AA00CEB8AA00CEB8AA00CEB8AA00CEB8AA00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
              Kind = bkGlyph
            end>
          EditProperties.ViewStyle = vsHideCursor
          EditProperties.OnButtonClick = merFIOMKEditors0EditPropertiesButtonClick
          Width = 75
          DataBinding.ValueType = 'String'
          Options.Filtering = False
          Options.IncSearch = False
          Options.ShowEditButtons = eisbAlways
          Value = Null
        end>
    end
    object merDateAgeSex: TcxMultiEditorRow
      Options.CanResized = False
      Options.Focusing = False
      Options.TabStop = False
      Properties.Editors = <
        item
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          EditPropertiesClassName = 'TcxLabelProperties'
          EditProperties.Alignment.Horz = taCenter
          DataBinding.ValueType = 'String'
          Value = Null
        end
        item
          Caption = #1042#1086#1079#1088#1072#1089#1090
          EditPropertiesClassName = 'TcxLabelProperties'
          EditProperties.Alignment.Horz = taCenter
          DataBinding.ValueType = 'String'
          Value = Null
        end
        item
          Caption = #1055#1086#1083
          EditPropertiesClassName = 'TcxLabelProperties'
          EditProperties.Alignment.Horz = taCenter
          DataBinding.ValueType = 'String'
          Value = Null
        end>
    end
    object rowAddress: TcxEditorRow
      Options.CanResized = False
      Options.Focusing = False
      Options.TabStop = False
      Properties.Caption = #1040#1076#1088#1077#1089
      Properties.EditPropertiesClassName = 'TcxLabelProperties'
      Properties.EditProperties.WordWrap = True
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.Editing = False
      Properties.Options.Filtering = False
      Properties.Options.IncSearch = False
      Properties.Value = Null
    end
    object rowAdrPreb: TcxEditorRow
      Options.Focusing = False
      Options.Moving = False
      Options.TabStop = False
      Properties.Caption = #1040#1076#1088#1077#1089' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1075#1086' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103
      Properties.EditPropertiesClassName = 'TcxLabelProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.Editing = False
      Properties.Options.Filtering = False
      Properties.Options.IncSearch = False
      Properties.Value = Null
    end
    object rowGra: TcxEditorRow
      Options.Focusing = False
      Options.Moving = False
      Options.TabStop = False
      Properties.Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
      Properties.EditPropertiesClassName = 'TcxLabelProperties'
      Properties.EditProperties.WordWrap = True
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
    end
    object rowWork: TcxEditorRow
      Options.CanResized = False
      Options.Focusing = False
      Options.TabStop = False
      Properties.Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
      Properties.EditPropertiesClassName = 'TcxLabelProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.Editing = False
      Properties.Options.Filtering = False
      Properties.Options.IncSearch = False
      Properties.Value = Null
    end
    object rowAdmin: TcxCategoryRow
      Properties.Caption = #1057#1083#1091#1078#1077#1073#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
    end
    object rowPeplID: TcxEditorRow
      Options.CanResized = False
      Properties.Caption = 'PeplID'
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00914413009144
            1300914413009144130091441300914413009144130091441300FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00F7E6DA00F5E0
            D100F3DAC800F1D3BE00EFCDB500EDC7AC00EDC7AC0091441300FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00F9EDE500F7E6
            DA00F5E0D100F3DAC800F2D6C300F0D0BA00EECAB00091441300FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00FCF5F000D383
            5700D3835700D3835700D3835700D3835700F0D0BA0091441300FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00FFFFFF00FDF8
            F500FAF1EA00F8EADF00F6E3D500F4DDCC00F2D6C30091441300CEB8AA007A5A
            46007A5A46007A5A46007A5A46007A5A46007A5A4600E0A98B00FFFFFF00D383
            5700D3835700D3835700D3835700D3835700F4DDCC0091441300CEB8AA00EFE7
            E300EBE1DC00E7DBD500E3D5CD00DFCFC600DBC9BF00E0A98B00FFFFFF00FFFF
            FF00FFFFFF00FDF8F500FAF1EA00F8EADF00F6E3D50091441300CEB8AA00F4EE
            EB00EFE7E300EBE1DC00E7DBD500E5D8D100E1D2CA00E0A98B00FFFFFF00D383
            5700D3835700FFFFFF00E0A98B00AB542800AB542800AB542800CEB8AA00F9F5
            F300DFA98300DFA98300DFA98300DFA98300DFA98300E0A98B00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00E0A98B00F3EBE600AB542800FF00FF00CEB8AA00FFFF
            FF00FBF8F700F6F1EF00F1EAE700EDE4DF00E9DED800E0A98B00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00E8A98B00C56A3100FF00FF00FF00FF00CEB8AA00FFFF
            FF00DFA98300DFA98300DFA98300DFA98300DFA98300E0A98B00E0A98B00E0A9
            8B00E0A98B00E0A98B00E0A98B00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
            FF00FFFFFF00FFFFFF00FBF8F700F6F1EF00F1EAE700EDE4DF0069473100FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
            FF00DFA98300DFA98300FFFFFF00CEB8AA00694731006947310069473100FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00CEB8AA00F3EBE60069473100FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00CEB8AA0069473100FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00CEB8
            AA00CEB8AA00CEB8AA00CEB8AA00CEB8AA00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          Kind = bkGlyph
        end>
      Properties.EditProperties.ViewStyle = vsHideCursor
      Properties.EditProperties.OnButtonClick = rowPeplIDEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.Filtering = False
      Properties.Options.IncSearch = False
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
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
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clBtnFace
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    LookAndFeel.SkinName = ''
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 169
    Top = 295
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
      Caption = 'Pac'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 404
      FloatTop = 232
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'bbProsmotr'
        end
        item
          Visible = True
          ItemName = 'bbPrint'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Pac'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbClose: TdxBarButton
      Action = actClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbProsmotr: TdxBarButton
      Action = actProsmotr
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrint: TdxBarButton
      Action = actPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefresh: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton1: TdxBarButton
      Action = aNaprav
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object actlstPac: TActionList
    Images = frmMain.ilMain
    Left = 280
    Top = 56
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ShortCut = 27
      OnExecute = actCloseExecute
    end
    object actProsmotr: TAction
      Caption = #1055#1088#1086#1090#1086#1082#1086#1083
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1087#1088#1086#1090#1086#1082#1086#1083#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      ImageIndex = 20
      ShortCut = 118
      OnExecute = actProsmotrExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100
      ImageIndex = 1
      ShortCut = 16464
      OnExecute = actPrintExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 29
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aNaprav: TAction
      Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      Hint = #1055#1088#1086#1089#1084#1086#1088#1077#1090#1100' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077', '#1079#1072#1087#1086#1083#1085#1077#1085#1085#1086#1077' '#1083#1072#1073#1086#1088#1072#1085#1090#1086#1084
      ImageIndex = 20
      OnExecute = aNapravExecute
    end
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWNUM, T.* FROM (SELECT '
      '       TNAZIS.FK_ID,'
      '       TNAZIS.FK_NAZSOSID, '
      '       TNAZIS.FK_SMID,'
      '       TNAZIS.FC_TYPE,'
      '       TNAZIS.FK_PACID, TKARTA.FK_PEPLID AS PEPLID, '
      '       TO_CHAR(TNAZIS.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       TNAZIS.FD_RUN AS DATE_RUN, '
      '       GET_NAME_RGISSL(TNAZIS.FK_SMID) AS FC_NAME, '
      
        '       DECODE(TNAZIS.FK_NAZSOSID, 2, '#39#1053#1045' '#1042#1067#1055'.'#39', 1, '#39#1042#1067#1055'.'#39', -11, ' +
        #39#1042#1067#1055'. '#1052#1051'. '#1057#1054#1058#1056'.'#39', 89, '#39#1056#1045#1050#1054#1052#1045#1053#1044#1054#1042#1040#1053#1054#39', 23, '#39#1054#1058#1052#1045#1053#1045#1053#1054#39') STATE,'
      
        '       (SELECT MAX(FN_NUM) FROM TIB WHERE FK_PACID = TNAZIS.FK_I' +
        'D AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       TKARTA.FD_ROJD,'
      '       ASU.GET_IB(TKARTA.FK_ID) AS NUMIB,'
      '       ASU.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID) AS OWNER,'
      '       DECODE(ASU.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID), '
      '              ASU.GET_XRAY_FLU,'
      '              (SELECT MAX(FC_CHAR) '
      '                 FROM ASU.TIB '
      '                WHERE FK_PACID = TNAZIS.FK_ID'
      
        '                  AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WH' +
        'ERE FC_SYNONIM = '#39'XRAY_FLU_NUMBER'#39')),      '
      '              (SELECT MAX(FC_CHAR) '
      '                 FROM ASU.TIB '
      '                WHERE FK_PACID = TNAZIS.FK_ID '
      
        '                  AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WH' +
        'ERE FC_SYNONIM = '#39'NUMBER_ISSL'#39'))) AS NUMBER_ISSL,'
      '       0 AS IS_AMB'
      '  FROM TNAZIS, TKARTA'
      
        '  WHERE GET_OWNER_FROM_SMID(GET_ID_RGVIDISSL(FK_SMID)) IN (GET_R' +
        'G_ISSL) '
      '    AND TNAZIS.FK_NAZSOSID = GET_VIPNAZ'
      '    AND TNAZIS.FK_PACID = TKARTA.FK_ID'
      '    AND TKARTA.FK_PEPLID = :PFK_PACID '
      '    '
      'UNION ALL'
      ''
      'SELECT'
      '       TNAZIS.FK_ID, '
      '       TNAZIS.FK_NAZSOSID,'
      '       TNAZIS.FK_SMID,'
      '       TNAZIS.FC_TYPE,'
      '       TNAZIS.FK_PACID, TAMBULANCE.FK_PEPLID AS PEPLID,'
      '       TO_CHAR(TNAZIS.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       TNAZIS.FD_RUN AS DATE_RUN,'
      '       GET_NAME_RGISSL(TNAZIS.FK_SMID) AS FC_NAME,  '
      
        '       DECODE(TNAZIS.FK_NAZSOSID, 2, '#39#1053#1045' '#1042#1067#1055'.'#39', 1, '#39#1042#1067#1055'.'#39', -11, ' +
        #39#1042#1067#1055'. '#1052#1051'. '#1057#1054#1058#1056'.'#39', 89, '#39#1056#1045#1050#1054#1052#1045#1053#1044#1054#1042#1040#1053#1054#39', 23, '#39#1054#1058#1052#1045#1053#1045#1053#1054#39') STATE,'
      
        '       (SELECT MAX(FN_NUM) FROM TIB WHERE FK_PACID = TNAZIS.FK_I' +
        'D AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       TAMBULANCE.FD_ROJD,'
      '       ASU.GET_IB(TAMBULANCE.FK_ID) AS NUMIB,'
      '       ASU.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID) AS OWNER,'
      '       DECODE(ASU.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID), '
      '              ASU.GET_XRAY_FLU,'
      '              (SELECT MAX(FC_CHAR) '
      '                 FROM ASU.TIB '
      '                WHERE FK_PACID = TNAZIS.FK_ID'
      
        '                  AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WH' +
        'ERE FC_SYNONIM = '#39'XRAY_FLU_NUMBER'#39')),      '
      '              (SELECT MAX(FC_CHAR) '
      '                 FROM ASU.TIB '
      '                WHERE FK_PACID = TNAZIS.FK_ID '
      
        '                  AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WH' +
        'ERE FC_SYNONIM = '#39'NUMBER_ISSL'#39'))) AS NUMBER_ISSL,'
      '       1 AS IS_AMB'
      '  FROM TNAZIS, TAMBULANCE'
      
        '  WHERE GET_OWNER_FROM_SMID(GET_ID_RGVIDISSL(FK_SMID)) IN (GET_R' +
        'G_ISSL) '
      '    AND TNAZIS.FK_NAZSOSID = GET_VIPNAZ'
      '    AND TNAZIS.FK_PACID = TAMBULANCE.FK_ID'
      '    AND TAMBULANCE.FK_PEPLID = :PFK_PACID '
      ''
      'ORDER BY DATE_RUN DESC  ) T')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464B5F504143494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      04000000110000000600000046445F52554E0100000000000700000046435F4E
      414D4501000000000005000000464B5F49440100000000000B000000464B5F4E
      415A534F53494401000000000005000000535441544501000000000007000000
      464B5F534D494401000000000008000000464B5F504143494401000000000008
      000000444154455F52554E01000000000004000000444F5A4101000000000006
      000000524F574E554D0100000000000700000046445F524F4A44010000000000
      050000004E554D49420100000000000700000046435F54595045010000000000
      060000005045504C4944010000000000050000004F574E45520100000000000B
      0000004E554D4245525F4953534C0100000000000600000049535F414D420100
      00000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsListBeforeOpen
    AfterOpen = odsListAfterOpen
    Left = 63
    Top = 339
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 63
    Top = 299
  end
  object frxRepProsmotr: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39299.753055555600000000
    ReportOptions.LastChange = 40903.637583495370000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepProsmotrGetValue
    Left = 170
    Top = 347
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
        Height = 268.346630000000000000
        Top = 18.897650000000000000
        Width = 748.346940000000000000
        StartNewPage = True
        Stretched = True
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 748.346940000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 60.472480000000000000
          Width = 68.046580000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 81.149660000000000000
          Width = 112.629870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 529.134200000000000000
          Top = 60.252010000000000000
          Width = 52.918330000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1114#1056#1113)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          Top = 37.795300000000000000
          Width = 748.346940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#160#1056#1115#1056#1118#1056#1115#1056#1113#1056#1115#1056#8250' '#1056#152#1056#1038#1056#1038#1056#8250#1056#8226#1056#8221#1056#1115#1056#8217#1056#1106#1056#1116#1056#152#1056#1031' '#1074#8222#8211' [NUMISSL]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 105.826840000000000000
          Width = 748.346940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[NAMEISSL]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Align = baWidth
          Top = 129.724490000000000000
          Width = 748.346940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            '[TEXTISSL]')
          ParentFont = False
          WordBreak = True
        end
        object Memo9: TfrxMemoView
          Left = 3.779530000000000000
          Top = 207.874150000000000000
          Width = 109.760000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#173#1056#8221)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Top = 234.330860000000000000
          Width = 108.860470000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 529.134200000000000000
          Top = 238.110390000000000000
          Width = 52.224230000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#176#1057#8225)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 117.165430000000000000
          Top = 60.472480000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[PACFIO]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 117.165430000000000000
          Top = 81.370130000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[DATE_ROJD]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 585.827150000000000000
          Top = 60.472480000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[NUMIB]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Align = baWidth
          Top = 16.118120000000000000
          Width = 748.346940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[OTDELNAME]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 117.165430000000000000
          Top = 207.874150000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[DOZA] '#1056#1112#1056#8212#1056#1030)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 117.165430000000000000
          Top = 234.330860000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[DATEISSL]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 585.827150000000000000
          Top = 238.110390000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[SOTR]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 347.716760000000000000
        Width = 748.346940000000000000
        object Memo5: TfrxMemoView
          Left = 415.748300000000000000
          Width = 328.819110000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 3.779530000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADESIGN], [DATESYS]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBPrintList: TfrxDBDataset
    UserName = 'frxDBPrintList'
    CloseDataSource = False
    DataSource = dsList
    Left = 254
    Top = 288
  end
  object frxPrintList: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39325.633441655100000000
    ReportOptions.LastChange = 40903.406020844910000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxPrintListGetValue
    Left = 170
    Top = 400
    Datasets = <
      item
        DataSet = frxDBPrintList
        DataSetName = 'frxDBPrintList'
      end>
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
        Height = 105.826840000000000000
        Top = 18.897650000000000000
        Width = 748.346940000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Top = 34.015770000000000000
          Width = 748.346940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#1038#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#8470' '#1056#1111#1056#1109' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1057#1107'. '#1056#164#1056 +
              #152#1056#1115': [PACFIO]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 151.181200000000000000
          Top = 86.929190000000000000
          Width = 533.092530000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 86.929190000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 684.094930000000000000
          Top = 86.929190000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#183#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 60.472480000000000000
          Top = 86.929190000000000000
          Width = 90.360940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1030#1057#8249#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 0.779530000000000000
          Top = 56.692950000000000000
          Width = 87.669870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Width = 748.346940000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]'
            '')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Align = baWidth
          Top = 16.118120000000000000
          Width = 748.346940000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[OTDELNAME]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 90.708720000000000000
          Top = 56.692950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[KOLVONAZ]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 185.196970000000000000
        Width = 748.346940000000000000
        DataSet = frxDBPrintList
        DataSetName = 'frxDBPrintList'
        KeepTogether = True
        RowCount = 0
        object Memo9: TfrxMemoView
          Left = 151.181200000000000000
          Width = 533.092530000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBPrintList."FC_NAME"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBPrintList."ROWNUM"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 684.094742050000000000
          Width = 60.472443390000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBPrintList."DOZA"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 60.472255430000000000
          Width = 90.360940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBPrintList."FD_RUN"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 15.118120000000000000
        Top = 264.567100000000000000
        Width = 748.346940000000000000
        object Memo6: TfrxMemoView
          Left = 415.748300000000000000
          Width = 329.648040000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Width = 411.968770000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADESIGN], [SYSDATE]')
          ParentFont = False
        end
      end
    end
  end
  object pmGrid: TPopupMenu
    Images = frmMain.ilMain
    Left = 308
    Top = 275
    object N1: TMenuItem
      Action = actPrint
    end
    object N2: TMenuItem
      Action = actPrint
    end
    object C1: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FDF1
        E500FDF1E500FFEDD500FFE9CE00FFE3C500FEDEBC00FFDAB100FFD5A600FFD1
        9F00FFCC9800FFD8A100BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FBF3
        EA00FBF3EA00FFEFDC00FFEDD500FEE5CA00FFE3C500FFDAB100FFDAB100FFD5
        A600FFCC9800FFD8A100BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF6
        F000FBF3EA00FDF1E500FFEDD500FFE9CE00FFE3C500FEDEBC00FFDAB100FED7
        AB00FFD5A600FFD5A600BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FBF3EA00FDF1E500FFEDD500FEE5CA00FFE3C500FEDEBC00FFDA
        B100FFD8A100FED7AB00BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FCF8F700FDF1E500FFEFDC00FFEDD500FEE5CA00FFE9C200DEC2
        B100DEBDA600FFE9B200BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FCF8F700FCF8F700FBF3EA00FDF1E500FFF2D700D9C2C100090A
        9000090A9000D5BBAC00BC4B0000FF00FF00090A900000028F00BC4B0000FAEF
        E500FBF3EA00FBF3EA00FDF1E500FAE7D400FEE5CA00FFE3C500C1A5A700090A
        9000112DEA00090A900065416600090A90000622EB0000039200BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000EF9037009754
        3D00090A90001933E200090A9000122DE50000039200FF00FF00FF00FF00BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
        000045265800090A90003C66FF00090A9000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00090A9000354CE000090A90002C46E700090A9000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00090A
        90004F65E70006099000FF00FF00090A90002C46E70006099000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00090A
        9000090A9000FF00FF00FF00FF00FF00FF000609900000028F00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Caption = 'C'#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      OnClick = C1Click
    end
  end
  object frxFlu: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39300.405691006900000000
    ReportOptions.LastChange = 40903.453425150470000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxFluGetValue
    Left = 172
    Top = 450
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
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 306.141930000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Top = 34.015770000000000000
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[NAMEISSL] '#1074#8222#8211' [NUMISSL]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 60.472480000000000000
          Width = 131.431750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#160#1056#181#1056#1029#1057#8218#1056#1110#1056#181#1056#1029'-'#1056#187#1056#176#1056#177#1056#1109#1057#1026#1056#176#1056#1029#1057#8218)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 94.488250000000000000
          Width = 132.099530000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 117.165430000000000000
          Width = 131.527520000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 476.220780000000000000
          Top = 117.165430000000000000
          Width = 91.236450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1113#1056#1114#1056#1116#1056#1038)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 476.220780000000000000
          Top = 162.519790000000000000
          Width = 92.736920000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1056#182#1056#1105#1056#1030#1056#176#1056#181#1057#8218)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 195.976500000000000000
          Width = 129.717180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1106#1056#1169#1057#1026#1056#181#1057#1027', '#1057#8218#1056#181#1056#187#1056#181#1057#8222#1056#1109#1056#1029)
          ParentFont = False
          WordBreak = True
        end
        object Memo8: TfrxMemoView
          Left = 476.220780000000000000
          Top = 94.488250000000000000
          Width = 90.624230000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1114#1056#1113)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Top = 139.842610000000000000
          Width = 130.495770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1056#1109#1056#183#1057#1026#1056#176#1057#1027#1057#8218)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 3.779530000000000000
          Top = 162.519790000000000000
          Width = 130.392480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 477.220780000000000000
          Top = 139.842610000000000000
          Width = 89.693160000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1056#1105#1056#1169' '#1056#1109#1056#1111#1056#187#1056#176#1057#8218#1057#8249)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 136.063080000000000000
          Top = 195.976500000000000000
          Width = 616.063390000000000000
          Height = 52.913420000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[ADDRESS], '#1057#8218#1056#181#1056#187'. [PHONE]')
          ParentFont = False
          WordBreak = True
        end
        object Memo21: TfrxMemoView
          Left = 532.913730000000000000
          Top = 60.472480000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[KABINET], [PHONEKAB] ')
          ParentFont = False
          WordBreak = True
        end
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Top = 256.669450000000000000
          Width = 131.676240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1057#8216#1056#1112)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 476.220780000000000000
          Top = 256.448980000000000000
          Width = 89.521880000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#166#1056#181#1056#187#1057#1034)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 476.220780000000000000
          Top = 280.126160000000000000
          Width = 90.425170000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1106#1056#1111#1056#1111#1056#176#1057#1026#1056#176#1057#8218)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Align = baWidth
          Width = 755.906000000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 136.063080000000000000
          Top = 60.472480000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[RG_LABORANT]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 136.063080000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[FIO_PAC]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 136.063080000000000000
          Top = 117.165430000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[DATE_ROJD]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 570.709030000000000000
          Top = 117.165430000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[KORENNOE]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 570.709030000000000000
          Top = 162.519790000000000000
          Width = 181.417440000000000000
          Height = 30.236240000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[PROJIVAET]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 136.063080000000000000
          Top = 139.842610000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[AGE]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 136.063080000000000000
          Top = 162.519790000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[SEX]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 570.709030000000000000
          Top = 139.842610000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[VID_OPLATA]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 570.709030000000000000
          Top = 256.448980000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[TARGET]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 570.709030000000000000
          Top = 279.126160000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[APPARAT]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 570.709030000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[NUMIB]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 136.063080000000000000
          Top = 256.448980000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[PRIEM]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Align = baWidth
          Top = 16.118120000000000000
          Width = 755.906000000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[OTDELNAME]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 385.512060000000000000
        Width = 755.906000000000000000
        object Memo9: TfrxMemoView
          Left = 453.543600000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 3.779530000000000000
          Width = 449.764070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADESIGN], [DATESYS]')
          ParentFont = False
        end
      end
    end
  end
  object odsListNaz: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWNUM, T.* '
      '  FROM (SELECT FK_DOCID, '
      '               FK_NAZSOSID,'
      '               FC_TYPE, '
      '               FK_ID, '
      '               ASU.GET_SMIDNAME(FK_SMID) AS FC_NAME, '
      '               FK_SMID,'
      '               FK_VRACHID,'
      '               ASU.GET_DOZA(TNAZIS.FK_ID) AS DOZA,'
      '               ASU.GET_TIME_FOR_RG_ISSL(TNAZIS.FK_ID) AS TIME,'
      
        '               (SELECT TO_NUMBER(FN_NUM) FROM ASU.TIB WHERE FK_P' +
        'ACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID ' +
        'WHERE FC_SYNONIM = '#39'XRAY_KOLVOUCHET'#39')) AS KOLVO,'
      
        '               (SELECT FN_NUM FROM ASU.TIB WHERE FK_PACID = TNAZ' +
        'IS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SY' +
        'NONIM = '#39'XRAY_KOLVOPRSV'#39')) AS KOLVOPRSV,'
      
        '               (SELECT ASU.GET_SMIDNAME(FK_SMID) FROM ASU.TIB WH' +
        'ERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM AS' +
        'U.TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE' +
        ' FC_SYNONIM = '#39'VID_SNIMOK'#39'))) AS VID_SNIMOK,'
      
        '               (SELECT ASU.GET_SMIDNAME(FK_SMID) FROM ASU.TIB WH' +
        'ERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM AS' +
        'U.TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE' +
        ' FC_SYNONIM = '#39'XRAY_VIDPLENKI'#39'))) AS TYPEPLENKA,'
      
        '               (SELECT ASU.GET_SMIDNAME(FK_SMID) FROM ASU.TIB WH' +
        'ERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM AS' +
        'U.TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE' +
        ' FC_SYNONIM = '#39'XRAY_KOLVO_LISTOV'#39'))) AS KOLVOLISTOV'
      ''
      '          FROM ASU.TNAZIS'
      '         WHERE FC_TYPE = :PFC_TYPE'
      
        '           AND FK_NAZSOSID NOT IN (ASU.GET_NAZCANCEL, ASU.GET_PA' +
        'SS_REGISTRATOR)'
      '        ORDER BY FK_ID) T')
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A5046435F545950450500000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000F00000005000000464B5F494401000000000007000000464B5F534D
      49440100000000000700000046435F4E414D4501000000000004000000444F5A
      41010000000000050000004B4F4C564F01000000000006000000524F574E554D
      01000000000008000000464B5F444F4349440100000000000B000000464B5F4E
      415A534F534944010000000000090000004B4F4C564F50525356010000000000
      0700000046435F545950450100000000000A000000464B5F5652414348494401
      00000000000400000054494D450100000000000A0000005649445F534E494D4F
      4B0100000000000A00000054595045504C454E4B410100000000000B0000004B
      4F4C564F4C4953544F56010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    Session = frmMain.os
    Left = 434
    Top = 329
    object odsListNazROWNUM: TFloatField
      FieldName = 'ROWNUM'
    end
    object odsListNazFK_DOCID: TFloatField
      FieldName = 'FK_DOCID'
    end
    object odsListNazFK_NAZSOSID: TFloatField
      FieldName = 'FK_NAZSOSID'
    end
    object odsListNazFC_TYPE: TStringField
      FieldName = 'FC_TYPE'
      Size = 50
    end
    object odsListNazFK_ID: TFloatField
      FieldName = 'FK_ID'
      Required = True
    end
    object odsListNazFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Size = 4000
    end
    object odsListNazFK_SMID: TFloatField
      FieldName = 'FK_SMID'
    end
    object odsListNazFK_VRACHID: TFloatField
      FieldName = 'FK_VRACHID'
    end
    object odsListNazDOZA: TFloatField
      FieldName = 'DOZA'
    end
    object odsListNazKOLVO: TFloatField
      FieldName = 'KOLVO'
    end
    object odsListNazKOLVOPRSV: TFloatField
      FieldName = 'KOLVOPRSV'
    end
    object odsListNazTIME: TFloatField
      FieldName = 'TIME'
    end
    object odsListNazVID_SNIMOK: TStringField
      FieldName = 'VID_SNIMOK'
      Size = 4000
    end
    object odsListNazTYPEPLENKA: TStringField
      FieldName = 'TYPEPLENKA'
      Size = 4000
    end
    object odsListNazKOLVOLISTOV: TStringField
      FieldName = 'KOLVOLISTOV'
      Size = 4000
    end
  end
  object frxNaprav: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39300.405691006900000000
    ReportOptions.LastChange = 40903.459096226850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxNapravGetValue
    Left = 435
    Top = 275
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
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
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 309.921460000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        Child = frxNaprav.Child1
        Stretched = True
        object Memo1: TfrxMemoView
          Align = baWidth
          Top = 40.574830000000000000
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#1116#1056#1106#1056#1119#1056#160#1056#1106#1056#8217#1056#8250#1056#8226#1056#1116#1056#152#1056#8226' '#1056#1116#1056#1106' '#1056#160#1056#8226#1056#1116#1056#1118#1056#8220#1056#8226#1056#1116'-'#1056#152#1056#1038#1056#1038#1056#8250#1056#8226#1056#8221#1056#1115#1056#8217#1056#1106#1056#1116#1056 +
              #152#1056#8226' ')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 64.252010000000000000
          Width = 131.431750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#160#1056#181#1056#1029#1057#8218#1056#1110#1056#181#1056#1029'-'#1056#187#1056#176#1056#177#1056#1109#1057#1026#1056#176#1056#1029#1057#8218)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 4.015770000000000000
          Top = 92.606370000000000000
          Width = 113.201880000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 3.795300000000000000
          Top = 114.504020000000000000
          Width = 112.629870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 476.220780000000000000
          Top = 115.125974490000000000
          Width = 87.456920000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1113#1056#1114#1056#1116#1056#1038)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 477.220780000000000000
          Top = 159.346446930000000000
          Width = 81.398330000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1056#182#1056#1105#1056#1030#1056#176#1056#181#1057#8218)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 4.795300000000000000
          Top = 208.653680000000000000
          Width = 114.599060000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1106#1056#1169#1057#1026#1056#181#1057#1027', '#1057#8218#1056#181#1056#187#1056#181#1057#8222#1056#1109#1056#1029)
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 476.220780000000000000
          Top = 92.826840000000000000
          Width = 50.514570000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1114#1056#1113)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 4.015770000000000000
          Top = 257.008040000000000000
          Width = 108.711750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1111#1057#1026#1056#176#1056#1030#1056#187#1056#181#1056#1029)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 5.015770000000000000
          Top = 137.401670000000000000
          Width = 111.598120000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1056#1109#1056#183#1057#1026#1056#176#1057#1027#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 4.795300000000000000
          Top = 160.078850000000000000
          Width = 111.494830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 476.220780000000000000
          Top = 137.425187090000000000
          Width = 89.693160000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1056#1105#1056#1169' '#1056#1109#1056#1111#1056#187#1056#176#1057#8218#1057#8249)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 389.291590000000000000
          Top = 256.228510000000000000
          Width = 138.834570000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1111#1057#1026#1056#176#1056#1030#1056#1105#1056#1030#1057#8364#1056#1105#1056#8470' '#1056#1030#1057#1026#1056#176#1057#8225)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          ShiftMode = smDontShift
          Left = 118.960730000000000000
          Top = 207.874150000000000000
          Width = 650.079160000000000000
          Height = 41.574830000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            '[ADDRESS], '#1057#8218#1056#181#1056#187'. [PHONE]')
          ParentFont = False
          WordBreak = True
        end
        object Memo21: TfrxMemoView
          Left = 529.134200000000000000
          Top = 68.031540000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[KABINET], [PHONEKAB] ')
          ParentFont = False
          WordBreak = True
        end
        object Memo29: TfrxMemoView
          Align = baWidth
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 136.063080000000000000
          Top = 64.252010000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[RG_LABORANT]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 118.960730000000000000
          Top = 92.826840000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[FIO_PAC]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 118.960730000000000000
          Top = 114.370068980000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[DATE_ROJD]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 119.055120550000000000
          Top = 137.425187090000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[AGE]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 119.181200000000000000
          Top = 160.102352440000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[SEX]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 566.929500000000000000
          Top = 115.125974490000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[KORENNOE]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 566.929500000000000000
          Top = 137.425187090000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[VID_OPLATA]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 566.929500000000000000
          Top = 159.346446930000000000
          Width = 185.196970000000000000
          Height = 34.015770000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[PROJIVAET]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 566.929500000000000000
          Top = 92.826840000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[NUMIB]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 118.275590550000000000
          Top = 257.008040000000000000
          Width = 268.346630000000000000
          Height = 45.354360000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[KEM_NAPRAVLEN]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 531.134200000000000000
          Top = 257.008040000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[VRACH_NAPRAVIL]')
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Align = baWidth
          Top = 20.677180000000000000
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[OTDELNAME]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 827.717070000000000000
        Width = 755.906000000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo22: TfrxMemoView
          Left = 3.779530000000000000
          Width = 45.354325830000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."KOLVO"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 166.299320000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."FC_NAME"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 102.047310000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."DOZA"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 49.133890000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."KOLVOPRSV"]')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 457.323130000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."TIME"]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 514.016080000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."VID_SNIMOK"]')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 608.504330000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."TYPEPLENKA"]')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 691.653990000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."KOLVOLISTOV"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 907.087200000000000000
        Width = 755.906000000000000000
        object Memo30: TfrxMemoView
          Left = 453.543600000000000000
          Width = 298.582870000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 3.779530000000000000
          Width = 449.764070000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADESIGN], [DATESYS]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 18.897650000000000000
        Top = 786.142240000000000000
        Width = 755.906000000000000000
        Stretched = True
        object Memo24: TfrxMemoView
          Left = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1029#1056#1105#1056#1112)
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 102.047310000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#183#1056#176)
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 166.299320000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#181#1057#8218#1056#1109#1056#1169#1056#1105#1056#1108#1056#176)
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 49.133890000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1057#1027#1056#1030)
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 457.323130000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#181#1056#1112#1057#1039)
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 514.016080000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1029#1056#1105#1056#1112#1056#1109#1056#1108)
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Left = 608.504330000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#1105#1056#1111)
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          Left = 691.653990000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8250#1056#1105#1057#1027#1057#8218#1057#8249)
          ParentFont = False
        end
      end
      object Child1: TfrxChild
        Height = 22.677180000000000000
        Top = 351.496290000000000000
        Width = 755.906000000000000000
        Child = frxNaprav.Child2
        Stretched = True
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Width = 108.850391260000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8221#1056#1105#1056#176#1056#1110#1056#1029#1056#1109#1056#183)
          ParentFont = False
          WordBreak = True
        end
        object Memo42: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 118.055120550000000000
          Width = 631.181510000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            '[NAPRAV_DS]')
          ParentFont = False
        end
      end
      object Child2: TfrxChild
        Height = 22.677180000000000000
        Top = 396.850650000000000000
        Width = 755.906000000000000000
        Child = frxNaprav.Child3
        Stretched = True
        object Memo11: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 3.779530000000000000
          Width = 109.642820000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1038#1057#1026#1056#1109#1057#8225#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 476.220472440944900000
          Width = 44.167520000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#166#1056#181#1056#187#1057#1034)
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 569.472790000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[TARGET]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 118.039350550000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[SROCH]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Child3: TfrxChild
        Height = 215.433210000000000000
        Top = 442.205010000000000000
        Width = 755.906000000000000000
        Child = frxNaprav.Child4
        Stretched = True
        object Memo12: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 3.779530000000000000
          Width = 108.438330000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1169#1056#177#1056#176#1056#1030#1056#1108#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 114.165430000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[NADBAVKA_TIME]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 3.779530000000000000
          Top = 192.756030000000000000
          Width = 748.346940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 3.779530000000000000
          Top = 22.677180000000000000
          Width = 107.232690000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1029#1057#8218#1057#1026#1056#176#1057#1027#1057#8218'('#1057#8218#1056#1105#1056#1111')')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 5.559060000000000000
          Top = 49.133890000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 5.559060000000000000
          Top = 71.811070000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1038#1056#1111#1056#1109#1057#1027#1056#1109#1056#177' '#1056#1030#1056#1030#1056#1109#1056#1169#1056#176)
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 5.559060000000000000
          Top = 94.488250000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1113#1057#8218#1056#1109' '#1056#1030#1056#1030#1057#8216#1056#187)
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 111.385900000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[KONTRAST]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 111.385900000000000000
          Top = 49.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[KOLVOKONTRAST]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 111.385900000000000000
          Top = 71.811070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[VVOD]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 111.385900000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[KTOVVEL]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 476.220780000000000000
          Top = 22.677180000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1169#1056#1105#1057#1027#1056#1108#1056#176)
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 476.220780000000000000
          Top = 45.354360000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1108#1056#1109#1057#1026#1056#1109#1056#177#1056#1108#1056#1105)
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 476.220780000000000000
          Top = 64.252010000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1106#1057#1026#1057#8230#1056#1105#1056#1030)
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 566.929500000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[DISC]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 566.929500000000000000
          Top = 45.354360000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[KOROB]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 566.929500000000000000
          Top = 64.252010000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[CIFRA]')
          ParentFont = False
        end
        object memTelCap: TfrxMemoView
          Left = 476.220780000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1118#1056#181#1056#187#1056#181#1057#8222#1056#1109#1056#1029)
          ParentFont = False
        end
        object memTel: TfrxMemoView
          Left = 566.929500000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[TELEFON]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 7.559060000000000000
          Top = 128.504020000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109' '#1056#187#1056#1105#1057#1027#1057#8218#1056#1109#1056#1030)
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 7.559060000000000000
          Top = 151.181200000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#1112#1056#181#1057#8225#1056#176#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 7.559060000000000000
          Top = 173.858380000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1030#1057#8249#1056#1169#1056#176#1057#8225#1056#1105)
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 283.464750000000000000
          Top = 128.504020000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1113#1057#1107#1056#1169#1056#176' '#1056#1030#1057#8249#1056#1169#1056#176#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 283.464750000000000000
          Top = 173.858380000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1030#1056#1109#1056#183#1056#1030#1057#1026#1056#176#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 113.385900000000000000
          Top = 128.504020000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[KOLVOLISTOV]')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 113.385900000000000000
          Top = 151.181200000000000000
          Width = 638.740570000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[REMARK]')
          ParentFont = False
        end
        object Memo71: TfrxMemoView
          Left = 113.385900000000000000
          Top = 173.858380000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[DATA1]')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 385.512060000000000000
          Top = 173.858380000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[DATA2]')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 385.512060000000000000
          Top = 128.504020000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[KYDA]')
          ParentFont = False
        end
      end
      object Child4: TfrxChild
        Height = 45.354360000000000000
        Top = 680.315400000000000000
        Width = 755.906000000000000000
        Stretched = True
        object Memo13: TfrxMemoView
          Left = 3.779530000000000000
          Width = 107.232690000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111#1057#1026#1056#1109#1057#8218#1056#1109#1056#1108#1056#1109#1056#187#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 114.141732280000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            '[NUMISSL]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 3.779530000000000000
          Top = 22.677180000000000000
          Width = 748.346940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = odsListNaz
    Left = 376
    Top = 272
  end
  object odsInfo: TOracleDataSet
    SQL.Strings = (
      
        'SELECT ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_AGE_NOW(:PFK_PEPLID) AS ' +
        'PACAGE,'
      
        '       (SELECT TO_CHAR(FD_ROJD, '#39'DD.MM.YYYY'#39') FROM ASU.TPEOPLES ' +
        'WHERE FK_ID = :PFK_PEPLID) as FD_ROJD,'
      '       ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(:PFK_PEPLID) AS SEX,'
      
        '       ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_WORKPLACE(:PFK_PEPLID) A' +
        'S WORKPLACE,'
      '       (select asu.get_smidname(fk_smid) '
      '                 from asu.tib '
      '                where fk_pacid = :pfk_peplid '
      
        '                  and fk_smeditid = (select fk_id from asu.tsmid' +
        ' where fc_synonim = '#39'LD_GRAGZ'#39')) as gra'
      '  FROM DUAL'
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F5045504C4944030000000000000000
      000000}
    Session = frmMain.os
    BeforeOpen = odsInfoBeforeOpen
    Left = 369
    Top = 328
  end
end
