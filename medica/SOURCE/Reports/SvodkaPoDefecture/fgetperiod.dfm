object frmGetPeriod: TfrmGetPeriod
  Left = 266
  Top = 173
  HelpContext = 41
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076' '#1087#1077#1088#1080#1086#1076#1072
  ClientHeight = 118
  ClientWidth = 434
  Color = clBtnFace
  Constraints.MinHeight = 126
  Constraints.MinWidth = 340
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'StMedsestra.chm'
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777777777777777777777777777777FF77
    7777777777777777777777777777000000000000000000000000000000770000
    0000000000000000000000000077000F0FFFFFFFFF00FFFFFFFFF0F0007700F0
    FFFFFFFFFF00FFFFFFFFFF0F007700F0FFFFFFFFFF00FFFFFFFFFF0F007700F0
    F0000000F0000F0000000F0F007700F0FFFFFFFFF0FF0FFFFFFFFF0F007700F0
    F0000000FF00FF0000000F0F007700F0FFFFFFFFFF00FFFFFFFFFF0F007700F0
    FFFFFFFFFF00FFFFFFFFFF0F007700F0FFF1111FFF00FFF11111FF0F007700F0
    FFF1111FFF00FFF11111FF0F007700F0FFFF11FFFF00FFF11FFFFF0F007700F0
    FFFF11FFFF00FFF111FFFF0F007700F0FFFF11FFFF00FFFF111FFF0F007700F0
    FFFF11FFFF00FFFFF111FF0F007700F0FFF111FFF0000FF11F11FF0F007700F0
    FFF111FFF0FF0FF11111FF0F007700F0FFFF11FFFF00FFFF111FFF0F007700F0
    FFFFFFFFFF00FFFFFFFFFF0F0077000F0FFFFFFFFF00FFFFFFFFF0F000770000
    00000000000000000000000000FF000000000000000000000000000000FFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 40
    Width = 434
    Height = 36
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 1
    TabOrder = 0
    object Label1: TLabel
      Left = 169
      Top = 10
      Width = 42
      Height = 13
      Hint = #1042#1074#1086#1076' '#1085#1072#1095#1072#1083#1100#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
      Caption = #1053#1072' '#1076#1072#1090#1091':'
      FocusControl = dDate1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object dDate1: TJvDateEdit
      Left = 225
      Top = 7
      Width = 194
      Height = 21
      Hint = #1042#1074#1086#1076' '#1085#1072#1095#1072#1083#1100#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageKind = ikEllipsis
      ButtonWidth = 16
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Weekends = [Sun, Sat]
      YearDigits = dyFour
      TabOrder = 0
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 434
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 428
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 421
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 46
      Caption = 'ToolBar1'
      Images = ilImages
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      OnDblClick = ToolBar1DblClick
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = aSave
        Caption = #1055#1077#1095#1072#1090#1100
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton2: TToolButton
        Left = 46
        Top = 0
        Action = aCancel
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 76
    Width = 434
    Height = 42
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      434
      42)
    object Label3: TLabel
      Left = 7
      Top = 10
      Width = 107
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090'. '#1086#1090#1074'. '#1083#1080#1094':'
    end
    object lcbMO_GROUP: TDBLookupComboBox
      Left = 124
      Top = 7
      Width = 295
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'GROUPID'
      ListField = 'FC_GROUP'
      ListSource = dsGroupMo
      TabOrder = 0
      OnCloseUp = lcbMO_GROUPCloseUp
    end
  end
  object ilImages: TImageList
    Left = 360
    Top = 48
    Bitmap = {
      494C010102002000300010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B0000007B00
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000080000000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B000000007B00007B00
      00007B0000007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000007B00000000000000
      00007B7B7B00000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      00007B0000007B0000007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000007B0000007B000000
      00007B7B7B007B7B7B0000000000000000000000000000007B00000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      0000007B0000007B00007B0000007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000007B0000007B000000
      7B0000000000000000007B7B7B000000000000007B0000007B0000007B000000
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      0000007B0000007B0000007B00007B0000007B7B7B007B7B7B00000000000000
      000000000000000000000000000000000000000000000000FF0000007B000000
      7B0000007B00000000000000000000007B0000007B0000007B0000007B000000
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      000000FF0000007B0000007B0000007B00007B0000007B7B7B007B7B7B000000
      00000000000000000000000000000000000000000000000000000000FF000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      000000FF000000FF0000007B0000007B0000007B00007B0000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000007B0000007B0000007B0000007B0000007B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B000000000000FF0000007B0000007B0000007B00007B0000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      00000000FF0000007B0000007B0000007B0000007B007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B000000000000FF000000FF0000007B0000007B0000007B00007B00
      00007B7B7B000000000000000000000000000000000000000000000000000000
      00000000FF0000007B0000007B0000007B0000007B00000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063FF000000FF0000007B
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      FF0000007B0000007B0000007B0000007B0000007B0000007B00000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000A5FF0000007B0000007B
      00007B0000007B7B7B007B7B7B00000000000000000000000000000000000000
      FF0000007B0000007B0000007B000000FF000000FF0000007B00000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF0000007B
      0000007B00007B0000007B7B7B007B7B7B0000000000000000000000FF000000
      7B0000007B00000000007B7B7B0000000000000000000000FF0000007B000000
      7B00000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      0000007B0000007B00007B0000007B7B7B00000000000000FF0000007B000000
      7B00000000007B7B7B00000000000000000000000000000000000000FF000000
      7B0000007B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF0000007B00007B0000007B7B7B0000000000000000000000FF000000
      7B00848484000000000000000000000000000000000000000000000000000000
      FF0000007B0000007B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000007B00007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00E7FFFFFF00000000C3FF8FFF00000000
      81FF078F0000000000FF038700000000007F810700000000003F800F00000000
      001FC01F00000000001FE03F00000000040FF03F000000000407F01F00000000
      8F03E00F00000000FF01E00700000000FFC0C18300000000FFE083C300000000
      FFF0C7E100000000FFF8FFF30000000000000000000000000000000000000000
      000000000000}
  end
  object alActions: TActionList
    Images = ilImages
    Left = 360
    object aSave: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
      ImageIndex = 0
      ShortCut = 13
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 1
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object acExcelExport: TAction
      Caption = #1042' Excel'
      Hint = #1069#1082#1087#1086#1088#1090' '#1074' Excel'
    end
  end
  object frDBDSSelDoc: TfrxDBDataset
    UserName = 'frDBDSSelDoc'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DOL=DOL'
      'RAS=RAS'
      'FN_OST=FN_OST'
      'MEDIC_NAME=MEDIC_NAME'
      'UCHGRID=UCHGRID'
      'FC_UCHGR=FC_UCHGR'
      'FC_EDIZM=FC_EDIZM'
      'FN_COLVOMINZAPAS=FN_COLVOMINZAPAS')
    DataSet = odsRep
    BCDToCurrency = False
    Left = 228
    Top = 88
  end
  object frSvodkaPoDefekture: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38544.638111250000000000
    ReportOptions.LastChange = 41425.646743900460000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      'smMedicType,sm :Integer;                                   '
      'procedure Band2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Band2, Engine do'
      '  begin'
      '//  sm := sm + [odsRep."FN_OSTSUM"];'
      '//  smMedicType := smMedicType + [odsRep."FN_OSTSUM"];'
      '//  smPayType := smPayType + [odsRep."FN_OSTSUM"];'
      '  end'
      'end;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with GroupHeader1, Engine do'
      '  begin'
      '  smMedicType := 0;'
      '  end'
      'end;'
      ''
      'procedure Memo1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo1, Engine do'
      '  begin'
      '  sm := 0;'
      '  end'
      'end;'
      ''
      'procedure Memo30OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo30, Engine do'
      '  begin'
      '//  memo30.Visible := [frDBDSRepHead."FC_MO"] <> '#39#39';'
      '  end'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frSvodkaPoDefektureGetValue
    OnUserFunction = frSvodkaPoDefektureUserFunction
    Left = 227
    Top = 12
    Datasets = <
      item
        DataSet = frDBDSRepHead
        DataSetName = 'frDBDSRepHead'
      end
      item
        DataSet = frDBDSSelDoc
        DataSetName = 'frDBDSSelDoc'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 1
      ColumnWidth = 180.000000000000000000
      ColumnPositions.Strings = (
        '0')
      PrintOnPreviousPage = True
      object Band2: TfrxMasterData
        Height = 18.000000000000000000
        Top = 268.346630000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'Band2OnBeforePrint'
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frDBDSSelDoc
        DataSetName = 'frDBDSSelDoc'
        RowCount = 0
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 405.000000000000000000
          Width = 70.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frDBDSSelDoc."FC_EDIZM"]')
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 46.000000000000000000
          Width = 359.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          Memo.UTF8 = (
            '[frDBDSSelDoc."MEDIC_NAME"]')
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Width = 46.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[LINE#]')
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 475.000000000000000000
          Width = 77.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frDBDSSelDoc."FN_OST"]')
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 552.000000000000000000
          Width = 98.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frDBDSSelDoc."FN_COLVOMINZAPAS"]')
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.000000000000000000
        Top = 423.307360000000000000
        Width = 680.315400000000000000
        object Memo3: TfrxMemoView
          Align = baRight
          Left = 505.315400000000000000
          Width = 175.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [PAGE#] '#1056#1105#1056#183' [TotalPages#]')
        end
        object Memo14: TfrxMemoView
          Width = 405.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 92.236240000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          Top = 7.779529999999997000
          Width = 650.000000000000000000
          Height = 30.000000000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1030#1056#1109#1056#1169#1056#1108#1056#176' '#1056#1111#1056#1109' '#1056#1169#1056#181#1057#8222#1056#181#1056#1108#1057#8218#1057#1107#1057#1026#1056#181' '#1056#1029#1056#176' [frDBDSRepHead."FD_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Top = 51.118119999999990000
          Width = 650.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo30OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1038#1056#1108#1056#187#1056#176#1056#1169': [frDBDSRepHead."FC_MO"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 54.000000000000000000
        Top = 309.921460000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 0
        object Memo17: TfrxMemoView
          Top = 21.000000000000000000
          Width = 650.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Width = 0.300000011920929000
          Memo.UTF8 = (
            '  '#1056#8212#1056#176#1056#1030'. '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470':  _______________________')
        end
      end
      object MasterHeader1: TfrxHeader
        Height = 32.000000000000000000
        Top = 211.653680000000000000
        Width = 680.315400000000000000
        ReprintOnNewPage = True
        object Memo5: TfrxMemoView
          Left = 405.000000000000000000
          Width = 70.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 46.000000000000000000
          Width = 359.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Width = 46.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            ' '#1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 552.000000000000000000
          Width = 98.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#181#1057#1027#1056#1029#1056#1105#1056#182#1056#176#1056#181#1056#1112#1057#8249#1056#8470' '#1056#183#1056#176#1056#1111#1056#176#1057#1027)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 475.000000000000000000
          Width = 77.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.000000000000000000
        Top = 170.078850000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = '<frDBDSSelDoc."UCHGRID">'
        object Memo12: TfrxMemoView
          Left = 46.000000000000000000
          Width = 604.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          Memo.UTF8 = (
            '[frDBDSSelDoc."FC_UCHGR"] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Width = 46.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          VAlign = vaCenter
        end
      end
    end
  end
  object os: TOracleSession
    LogonUsername = 'ASU'
    LogonPassword = 'ASU'
    LogonDatabase = 'ASU'
    Left = 20
    Top = 32
  end
  object odsRep: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  :DOL AS DOL,'
      '  :RAS AS RAS,  '
      '--    B.*,'
      '  SUM(NVL(B.FN_OST,0)) AS FN_OST,'
      '--  ROUND(SUM(NVL(B.FN_OSTSUM,0)),2) AS FN_OSTSUM,'
      '  '
      '    B.MEDIC_NAME, '
      '    B.UCHGRID,'
      '    B.FC_UCHGR,'
      '    B.FC_EDIZM,'
      '    --USE_FINSOURCE FC_FINSOURCE,'
      '    B.FN_COLVOMINZAPAS  '
      'FROM ('
      '  SELECT'
      '    A.FC_NAME,'
      '        A.MEDIC_NAME, '
      '      A.UCHGRID,'
      '      A.FC_UCHGR,'
      '    A.FC_EDIZM,'
      '    --USE_FINSOURCE FC_FINSOURCE,'
      '            '
      '    SUM(A.FN_KOL) AS FN_OST,'
      '--    SUM(A.FN_KOL*A.FN_PRICE) AS FN_OSTSUM,'
      '        A.FN_PRICE,'
      '        A.FN_PARTY_NUM,'
      '    A.FD_GODEN,'
      '    '
      '    A.FN_COLVOMINZAPAS,'
      '  MINZ_MOGROUPID'
      '  FROM ('
      '    SELECT'
      '      K.MEDICID,'
      '      M.FC_NAME ||'#39'('#1087'. '#8470#39'|| K.FN_PARTY_NUM ||'#39')'#39' as FC_NAME,'
      '            M.FC_NAME as MEDIC_NAME, '
      '            K.FN_PARTY_NUM,'
      '            K.FN_PRICE,'
      '      trunc(K.FD_GODEN) as FD_GODEN,'
      '            C.FN_KOL*D.mnoj AS FN_KOL,'
      '      E.FC_NAME AS FC_EDIZM,'
      '      FS.FC_NAME AS FC_FINSOURCE,'
      '      UG.root_uchgrid as UCHGRID,'
      '      UG.root_fc_uchgr as FC_UCHGR, -- UG.FC_UCHGR,'
      '      MINZ.FN_COLVOMINZAPAS,'
      '   NVL(MINZ.MOGROUPID,0) AS MINZ_MOGROUPID'
      '    FROM (SELECT TDOCS.*, '
      
        '              MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID' +
        ', TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUP_ID )' +
        ' as mnoj             '
      '              FROM MED.TDOCS '
      '              WHERE TDOCS.FL_EDIT = 0'
      '                AND (not TDOCS.FP_VIDMOVE in (4,5))'
      
        '                AND TRUNC(TDOCS.FD_DATA) BETWEEN TO_DATE('#39'01.01.' +
        '2000'#39', '#39'DD.MM.YYYY'#39') AND TRUNC(:PFD1)'
      
        '                AND :MOGROUP_ID in (TDOCS.FK_MOGROUPID_TO, TDOCS' +
        '.FK_MOGROUPID_FROM) '
      '             ) D,'
      '        '
      '         MED.TDPC C, MED.TKART K, MED.TMEDIC M, MED.TEI E,   '
      '             (select connect_by_root fc_uchgr as root_fc_uchgr, '
      '              connect_by_root uchgrid as root_uchgrid, t.* '
      
        '              from med.tuchgr t connect by prior uchgrid = paren' +
        'tid start with parentid = 0) UG, MED.TFINSOURCE FS, --MED.TMEDIC' +
        'TYPE MT, --, TPAYTYPE P,  --  MED.TUCHGR'
      '      (SELECT'
      '           NVL(COLVO,0) AS FN_COLVOMINZAPAS,'
      '           MOGROUPID,'
      '           MEDICID'
      '         FROM MED.TMINZAPAS'
      '         WHERE MOGROUPID=:MOGROUP_ID) MINZ'
      '    WHERE D.DPID = C.DPID'
      '      AND C.KARTID = K.KARTID'
      '      AND K.MEDICID = M.MEDICID'
      '      AND M.MEDICID = MINZ.MEDICID (+)'
      '      AND M.EIID = E.EIID(+)'
      '                    AND K.FK_FINSOURCE_ID = FS.FK_ID(+)'
      '      AND #uchgrid# = UG.UCHGRID '
      '      AND K.FL_DEL = 0'
      '--   AND M.FL_VISIBLE = 1 '
      '    ) A'
      '  GROUP BY MEDIC_NAME,'
      '                FN_PARTY_NUM,                '
      '      --USE_FINSOURCE FC_FINSOURCE,'
      
        '                MEDICID, FC_NAME, FC_EDIZM, FN_PRICE, UCHGRID, F' +
        'C_UCHGR,/*FK_PAYTYPE,FC_PAYTYPE,*/ FD_GODEN, FN_COLVOMINZAPAS, M' +
        'INZ_MOGROUPID'
      ') B'
      'WHERE (B.FN_OST > 0)'
      'GROUP BY B.MEDIC_NAME, '
      '         B.FC_UCHGR,'
      '         B.FC_EDIZM,'
      '    --USE_FINSOURCE FC_FINSOURCE,'
      '         B.FN_COLVOMINZAPAS,'
      '         B.UCHGRID'
      'ORDER BY UPPER(FC_UCHGR), LOWER(MEDIC_NAME)  --, FN_PARTY_NUM')
    Optimize = False
    Variables.Data = {
      0300000004000000050000003A504644310C0000000000000000000000040000
      003A444F4C050000000000000000000000040000003A52415305000000000000
      00000000000B0000003A4D4F47524F55505F4944050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000800000046435F4544495A4D01000000000006000000464E
      5F4F535401000000000003000000444F4C010000000000030000005241530100
      0000000010000000464E5F434F4C564F4D494E5A415041530100000000000A00
      00004D454449435F4E414D450100000000000700000055434847524944010000
      0000000800000046435F5543484752010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 154
    Top = 30
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 191
    Top = 10
  end
  object frDBDSRepHead: TfrxDBDataset
    UserName = 'frDBDSRepHead'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FD_1=FD_1'
      'FC_MO=FC_MO')
    DataSet = odsRepHeader
    BCDToCurrency = False
    Left = 224
    Top = 50
  end
  object odsRepHeader: TOracleDataSet
    SQL.Strings = (
      
        'select :PFD1 as fd_1, MED.PKG_MEDSES.GET_MOGROUP_NAME(:MOGROUP_I' +
        'D) as fc_mo from dual')
    Optimize = False
    Variables.Data = {
      0300000002000000050000003A504644310C00000000000000000000000B0000
      003A4D4F47524F55505F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000400000046445F310100000000000500000046435F4D4F01
      0000000000}
    Session = os
    Left = 96
    Top = 29
  end
  object sd: TSaveDialog
    Left = 24
    Top = 78
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    OpenExcelAfterExport = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    RowsCount = 0
    Split = ssNotSplit
    Left = 155
    Top = 76
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    ExportPictures = False
    OpenExcelAfterExport = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = False
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 62
    Top = 78
  end
  object frPrihDoc_Old: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38544.638111250000000000
    ReportOptions.LastChange = 41236.623835891200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Band2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Band2, Engine do'
      '  begin'
      '  sm := sm + [odsRep."FN_OSTSUM"];'
      '  smMedicType := smMedicType + [odsRep."FN_OSTSUM"];'
      '  smPayType := smPayType + [odsRep."FN_OSTSUM"];'
      '  end'
      'end;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with GroupHeader1, Engine do'
      '  begin'
      '  smMedicType := 0;'
      '  end'
      'end;'
      ''
      'procedure GroupHeader2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with GroupHeader2, Engine do'
      '  begin'
      '  smPayType := 0;'
      '  end'
      'end;'
      ''
      'procedure Memo29OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo29, Engine do'
      '  begin'
      '  sm := 0;'
      '  end'
      'end;'
      ''
      'procedure Memo30OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo30, Engine do'
      '  begin'
      '  memo30.Visible := [odsRepHeader."FC_MO"] <> '#39#39';'
      '  end'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnUserFunction = frSvodkaPoDefektureUserFunction
    Left = 302
    Top = 6
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
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 1
      ColumnWidth = 190.000000000000000000
      ColumnPositions.Strings = (
        '0')
      PrintOnPreviousPage = True
      object Band2: TfrxMasterData
        Height = 18.000000000000000000
        Top = 362.000000000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'Band2OnBeforePrint'
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frDBDSSelDoc
        DataSetName = 'frDBDSSelDoc'
        RowCount = 0
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 230.000000000000000000
          Width = 50.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRep."FC_EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 57.000000000000000000
          Width = 173.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          Memo.UTF8 = (
            '[odsRep."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 1.000000000000000000
          Width = 56.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[LINE#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 356.000000000000000000
          Width = 76.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRep."FN_OST"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 432.000000000000000000
          Width = 98.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRep."FN_COLVOMINZAPAS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 530.000000000000000000
          Width = 112.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haRight
          Memo.UTF8 = (
            '[[odsRep."FN_OST"]- [odsRep."FN_COLVOMINZAPAS"]]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 280.000000000000000000
          Width = 76.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRep."FD_GODEN"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.000000000000000000
        Top = 696.000000000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 608.000000000000000000
          Top = 4.000000000000000000
          Width = 76.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [PAGE#]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 3.000000000000000000
          Width = 684.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 130.000000000000000000
        Top = 36.000000000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Top = 48.000000000000000000
          Width = 718.110700000000000000
          Height = 30.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1030#1056#1109#1056#1169#1056#1108#1056#176' '#1056#1111#1056#1109' '#1056#1169#1056#181#1057#8222#1056#181#1056#1108#1057#8218#1057#1107#1057#1026#1056#181)
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Align = baWidth
          Top = 80.000000000000000000
          Width = 718.110700000000000000
          Height = 22.000000000000000000
          OnBeforePrint = 'Memo29OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176' [odsRepHeader."FD_1"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Align = baWidth
          Top = 104.000000000000000000
          Width = 718.110700000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo30OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109' '#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1056#8470': [odsRepHeader' +
              '."FC_MO"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 26.000000000000000000
        Top = 424.000000000000000000
        Visible = False
        Width = 718.110700000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 0
        object Memo17: TfrxMemoView
          Left = 20.000000000000000000
          Width = 72.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Width = 0.300000011920929000
          Memo.UTF8 = (
            #1056#8216#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026':')
        end
        object Memo18: TfrxMemoView
          Left = 92.000000000000000000
          Top = 4.000000000000000000
          Width = 192.000000000000000000
          Height = 12.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
          Frame.Width = 0.300000011920929000
        end
      end
      object MasterData2: TfrxMasterData
        Height = 46.000000000000000000
        Top = 488.000000000000000000
        Width = 718.110700000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 0
        object Memo19: TfrxMemoView
          Left = 114.000000000000000000
          Top = 4.000000000000000000
          Width = 178.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRep."DOL"]')
        end
        object Memo20: TfrxMemoView
          Left = 113.000000000000000000
          Top = 24.000000000000000000
          Width = 179.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
        end
        object Memo21: TfrxMemoView
          Left = 444.000000000000000000
          Top = 4.000000000000000000
          Width = 229.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRep."RAS"]')
        end
        object Memo22: TfrxMemoView
          Left = 444.000000000000000000
          Top = 24.000000000000000000
          Width = 229.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
        end
        object Memo23: TfrxMemoView
          Left = 292.000000000000000000
          Top = 4.000000000000000000
          Width = 152.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
        end
        object Memo24: TfrxMemoView
          Left = 292.000000000000000000
          Top = 24.000000000000000000
          Width = 152.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
        end
        object Memo25: TfrxMemoView
          Left = -12.000000000000000000
          Top = 4.000000000000000000
          Width = 126.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218'. '#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1056#8470':')
        end
      end
      object MasterHeader1: TfrxHeader
        Height = 32.000000000000000000
        Top = 312.000000000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        object Memo5: TfrxMemoView
          Left = 230.000000000000000000
          Width = 50.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 57.000000000000000000
          Width = 173.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 1.000000000000000000
          Width = 56.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            ' '#1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 432.000000000000000000
          Width = 98.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#1105#1056#1029#1056#1105#1056#1112#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1056#8470' '#1056#183#1056#176#1056#1111#1056#176#1057#1027)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 530.000000000000000000
          Width = 112.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1056#183#1056#1029#1056#1105#1057#8224#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 280.000000000000000000
          Width = 76.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1026#1056#1109#1056#1108' '#1056#1110#1056#1109#1056#1169#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 356.000000000000000000
          Width = 76.000000000000000000
          Height = 32.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 20.000000000000000000
        Top = 232.000000000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = '[odsRep."FK_MEDICTYPEID"]'
        object Memo26: TfrxMemoView
          Left = 8.000000000000000000
          Top = 2.000000000000000000
          Width = 244.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.300000011920929000
          Memo.UTF8 = (
            '[odsRep."FC_MEDICTYPENAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 20.000000000000000000
        Top = 272.000000000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupHeader2OnBeforePrint'
        Condition = '[odsRep."FK_PAYTYPE"]'
        object Memo31: TfrxMemoView
          Left = 60.000000000000000000
          Top = 2.000000000000000000
          Width = 244.000000000000000000
          Height = 17.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.300000011920929000
          Memo.UTF8 = (
            '[odsRep."FC_PAYTYPE"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object odsGroupMo: TOracleDataSet
    SQL.Strings = (
      'SELECT * from'
      '(SELECT groupid, fc_group, fl_del, 0 as FN_ORDER'
      
        'FROM med.tmo_group WHERE (fl_del = 0) and (UPPER(fc_group) like ' +
        #39'%'#1040#1055#1058#1045#1050#1040'%'#39')'
      'UNION'
      'SELECT groupid, fc_group, fl_del, 1 as FN_ORDER'
      
        'FROM med.tmo_group WHERE fl_del = 0 and (not (UPPER(fc_group) li' +
        'ke '#39'%'#1040#1055#1058#1045#1050#1040'%'#39'))'
      ')'
      'ORDER BY FN_ORDER, UPPER(fc_group)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C010000000000}
    Session = os
    AfterOpen = odsGroupMoAfterOpen
    Left = 20
    Top = 71
    object odsGroupMoGROUPID: TFloatField
      FieldName = 'GROUPID'
      Required = True
    end
    object odsGroupMoFC_GROUP: TStringField
      FieldName = 'FC_GROUP'
      Size = 100
    end
    object odsGroupMoFL_DEL: TFloatField
      FieldName = 'FL_DEL'
    end
  end
  object dsGroupMo: TDataSource
    DataSet = odsGroupMo
    Left = 62
    Top = 52
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 126
    Top = 65534
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Left = 151
    Top = 1
  end
  object odsTSMINI: TOracleDataSet
    SQL.Strings = (
      'select SM.FK_ID, SM.FC_SECTION, SM.FC_KEY, SM.FC_VALUE'
      '  from ASU.TSMINI SM'
      ' where UPPER(SM.FC_SECTION) = UPPER(:ASECTION)'
      '   and UPPER(SM.FC_KEY) = UPPER(:AKEY)')
    Optimize = False
    Variables.Data = {
      0300000002000000090000003A4153454354494F4E0500000000000000000000
      00050000003A414B4559050000000000000000000000}
    Session = os
    Left = 264
  end
end
