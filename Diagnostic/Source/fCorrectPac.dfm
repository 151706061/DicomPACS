object frmCorrectPac: TfrmCorrectPac
  Left = 261
  Top = 109
  BorderStyle = bsDialog
  Caption = #1055#1088#1080#1082#1088#1077#1087#1080#1090#1100' '#1087#1072#1094#1080#1077#1085#1090#1072
  ClientHeight = 442
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 906
    Height = 46
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 16
      Top = 15
      Caption = #1060#1048#1054':'
    end
    object sFIO: TcxTextEdit
      Left = 53
      Top = 12
      ParentFont = False
      Properties.CharCase = ecUpperCase
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
      TabOrder = 1
      Width = 284
    end
    object cxButton1: TcxButton
      Left = 341
      Top = 11
      Width = 30
      Height = 27
      Action = aSearch
      TabOrder = 2
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0084848400000000000000000000000000848484000000
        0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000FF00FF00FF00FF0084848400000000000000
        000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000084848400FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
        840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF000000
        000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
        840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FF00FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FF00FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
        840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
        840000000000FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF000000
        000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000084848400FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF0000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF008484840000000000000000000000000084848400FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object cxGr: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 52
    Width = 906
    Height = 343
    Margins.Top = 0
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    object TVPAC: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPac
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = VFIO
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VFIO: TcxGridDBColumn
        Caption = #1060#1048#1054
        DataBinding.FieldName = 'FIO'
        VisibleForCustomization = False
        Width = 153
      end
      object VROJD: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
        DataBinding.FieldName = 'FD_ROJD'
        VisibleForCustomization = False
        Width = 185
      end
      object VNUMBER: TcxGridDBColumn
        Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'NIB'
        Width = 181
      end
      object VTYPEDOC: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'FC_NAME'
      end
      object VSOS: TcxGridDBColumn
        Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
        DataBinding.FieldName = 'STEK_COC'
        Width = 179
      end
      object VLASTFLU: TcxGridDBColumn
        Caption = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1092#1083#1102#1086#1088'.'
        DataBinding.FieldName = 'LASTFLU'
        VisibleForCustomization = False
        Width = 166
      end
    end
    object cxGrLevel1: TcxGridLevel
      GridView = TVPAC
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 398
    Width = 906
    Height = 41
    Margins.Top = 0
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object cxButton2: TcxButton
      Left = 821
      Top = 8
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton3: TcxButton
      Left = 739
      Top = 8
      Width = 75
      Height = 25
      Action = aSave
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object odsPac: TOracleDataSet
    SQL.Strings = (
      'SELECT TKARTA.FK_PEPLID AS FK_ID, '
      '       TKARTA.FK_ID AS PACID,'
      
        '       TKARTA.FC_FAM||'#39' '#39'||TKARTA.FC_IM||'#39' '#39'|| TKARTA.FC_OTCH FI' +
        'O, '
      '       TKARTA.FD_ROJD,  '
      
        '       ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TKARTA.FK_PEPLID) SE' +
        'X,'
      '       TKARTA.FP_TEK_COC, '
      '       ASU.GET_IB(TKARTA.FK_ID) AS NIB, '
      '       TKARTA.FK_ID AS PACID,'
      
        '       DECODE(TKARTA.FP_TEK_COC,3,'#39#1042#1067#1055#1048#1057#1040#1053#39',2,'#39#1042' '#1057#1058#1040#1062#1048#1054#1053#1040#1056#1045#39',-2,' +
        #39#1053#1040' '#1054#1060#1054#1056#1052#1051#1045#1053#1048#1048' '#1055#1054#39','#39#39') STEK_COC,'
      '       ASU.GET_LAST_FLUORO(TKARTA.FK_PEPLID) AS LASTFLU,'
      '       0 AS IS_AMBULANCE,'
      '       TUSLVID.FC_NAME,'
      '       (SELECT COUNT(*) FROM ASU.TNAZIS '
      '         WHERE FK_PACID = ASU.GET_PEPLID(TKARTA.FK_ID) '
      '           AND FK_SMID = ASU.GET_XRAY_TUBDISPANCER '
      '           AND SYSDATE >= FD_NAZ '
      
        '           AND (SYSDATE < TO_DATE(FD_RUN)+1 OR FD_RUN IS NULL)) ' +
        'AS CNTTUB,'
      
        '       (SELECT COUNT(*) FROM ASU.TNAZIS WHERE FK_PACID = ASU.GET' +
        '_PEPLID(TKARTA.FK_ID) AND FK_SMID = ASU.GET_XRAY_TUBDISPANCER) A' +
        'S CNTTUB_ALL '
      ''
      '  FROM ASU.TKARTA, ASU.TPERESEL, ASU.TDOCOBSL, ASU.TUSLVID'
      ' WHERE ASU.GET_MAXPERESELID(TKARTA.FK_ID) = TPERESEL.FK_ID '
      '   AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID '
      '   AND TDOCOBSL.FK_VIDDOCID = TUSLVID.FK_ID')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000E00000005000000464B5F49440100000000000300000046494F0100
      000000000700000046445F524F4A44010000000000030000004E494201000000
      0000080000005354454B5F434F43010000000000030000005345580100000000
      00070000004C415354464C550100000000000500000050414349440100000000
      000700000050414349445F310100000000000C00000049535F414D42554C414E
      43450100000000000700000046435F4E414D450100000000000A00000046505F
      54454B5F434F4301000000000006000000434E545455420100000000000A0000
      00434E545455425F414C4C010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 121
    Top = 329
  end
  object dsPac: TDataSource
    DataSet = odsPac
    Left = 121
    Top = 282
  end
  object al: TActionList
    Left = 576
    Top = 216
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aSearch: TAction
      ShortCut = 13
      OnExecute = aSearchExecute
    end
  end
end
