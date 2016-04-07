object frmGetPeriod: TfrmGetPeriod
  Left = 263
  Top = 180
  HelpContext = 44
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1088#1080#1093#1086#1076'/'#1088#1072#1089#1093#1086#1076' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074' '#1089' '#1076#1077#1085#1077#1078#1085#1086#1084' '#1074#1099#1088#1072#1078#1077#1085#1080#1080
  ClientHeight = 140
  ClientWidth = 344
  Color = clBtnFace
  Constraints.MinHeight = 135
  Constraints.MinWidth = 350
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
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 344
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 338
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 331
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
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = aSave
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
  object Panel4: TPanel
    Left = 0
    Top = 40
    Width = 344
    Height = 64
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 1
    TabOrder = 1
    object Label2: TLabel
      Left = 20
      Top = 11
      Width = 36
      Height = 13
      Hint = #1042#1074#1086#1076' '#1085#1072#1095#1072#1083#1100#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
      Caption = #1052#1077#1089#1103#1094':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object laMonthYear: TLabel
      Left = 335
      Top = 3
      Width = 6
      Height = 58
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      Visible = False
      ExplicitHeight = 20
    end
    object Label3: TLabel
      Left = 6
      Top = 35
      Width = 50
      Height = 13
      Caption = #1055#1077#1088#1080#1086#1076' '#1089':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label5: TLabel
      Left = 166
      Top = 35
      Width = 15
      Height = 13
      Caption = #1087#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label6: TLabel
      Left = 161
      Top = 12
      Width = 20
      Height = 13
      Caption = #1075#1086#1076':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object cmbMonth1: TcxComboBox
      Left = 60
      Top = 8
      Hint = #1052#1077#1089#1103#1094' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1086#1090#1095#1077#1090#1072
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.ReadOnly = False
      Properties.OnChange = cmbMonth1PropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Width = 96
    end
    object sedYear1: TcxSpinEdit
      Left = 183
      Top = 8
      Hint = #1043#1086#1076' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1086#1090#1095#1077#1090#1072
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.MaxValue = 2999.000000000000000000
      Properties.MinValue = 2000.000000000000000000
      Properties.SpinButtons.Position = sbpHorzLeftRight
      Properties.ValueType = vtInt
      Properties.OnChange = cmbMonth1PropertiesChange
      Style.BorderStyle = ebsUltraFlat
      Style.ButtonStyle = btsDefault
      Style.ButtonTransparency = ebtNone
      TabOrder = 1
      Value = 2000
      Width = 59
    end
    object deS: TcxDateEdit
      Left = 60
      Top = 32
      Properties.DateButtons = [btnToday]
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnChange = deSPropertiesChange
      TabOrder = 2
      Width = 96
    end
    object dePo: TcxDateEdit
      Left = 183
      Top = 32
      Properties.DateButtons = [btnToday]
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnChange = deSPropertiesChange
      TabOrder = 3
      Width = 96
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 104
    Width = 344
    Height = 36
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      344
      36)
    object Label1: TLabel
      Left = 5
      Top = 10
      Width = 86
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090'. '#1086#1090#1074'.:'
    end
    object lcbMO_GROUP: TDBLookupComboBox
      Left = 97
      Top = 6
      Width = 239
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'GROUPID'
      ListField = 'FC_GROUP'
      ListSource = fdmMain.dsGroupMo
      TabOrder = 0
      OnCloseUp = lcbCloseUp
    end
  end
  object ilImages: TImageList
    Left = 342
    Top = 2
    Bitmap = {
      494C010102001000140010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
    Left = 294
    Top = 8
    object aSave: TAction
      Caption = #1055#1077#1095#1072#1090#1100
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
  object frxDesigner: TfrxDesigner
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
    Left = 197
    Top = 4
  end
  object frxReport1: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39363.732243738400000000
    ReportOptions.LastChange = 41248.642795312500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  FN_Prih_SUMM ,'
      '  FN_Rash_SUMM ,   '
      '  FN_GLF_SUMM ,   '
      '  FN_ANGRO_SUMM ,'
      '  FN_PEREV_SUMM ,   '
      '  FN_RASHODNIK_SUMM ,   '
      '  FN_EXTEMP_SUMM ,   '
      '  FN_PRIH_DOCS_SUMM,   '
      '    FN_TARA_SUMM '
      ',  FN_MED_SUMM       '
      ',  FN_VSPOMSR_SUMM'
      ',FN_RASH_DOCS_SUMM    '
      '  '
      '  :double;'
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with ReportTitle1, Engine do'
      '  begin'
      '  FN_Prih_SUMM := 0;'
      '  FN_Rash_SUMM := 0;'
      '  FN_MED_SUMM :=0;'
      '  FN_PEREV_SUMM := 0;'
      '  FN_TARA_SUMM := 0;'
      '  FN_VSPOMSR_SUMM := 0;'
      '  FN_PRIH_DOCS_SUMM := 0;'
      '  end'
      'end;'
      ''
      'procedure meFN_ALLOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with meFN_ALL, Engine do'
      '  begin'
      
        '  FN_Prih_SUMM := FN_Prih_SUMM + <odsOstByMonth."FN_START_VSPOMS' +
        'R">+<odsOstByMonth."FN_START_MED">+<odsOstByMonth."FN_START_PERE' +
        'V">+<odsOstByMonth."FN_START_TARA">;'
      '  end'
      'end;'
      ''
      'procedure Memo15OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo15, Engine do'
      '  begin'
      
        '  FN_Prih_SUMM := FN_Prih_SUMM + <odsPrihDocs."FN_VSPOMSR">+<ods' +
        'PrihDocs."FN_MED">+<odsPrihDocs."FN_PEREV">+<odsPrihDocs."FN_TAR' +
        'A">;'
      
        '  FN_PRIH_DOCS_SUMM := <odsPrihDocs."FN_VSPOMSR">+<odsPrihDocs."' +
        'FN_MED">+<odsPrihDocs."FN_PEREV">+<odsPrihDocs."FN_TARA">;'
      '  end'
      'end;'
      ''
      'procedure Memo18OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo18, Engine do'
      '  begin'
      '  FN_MED_SUMM := FN_MED_SUMM + <odsPrihDocs."FN_MED">;'
      '  end'
      'end;'
      ''
      'procedure Memo19OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo19, Engine do'
      '  begin'
      '  FN_PEREV_SUMM := FN_PEREV_SUMM + <odsPrihDocs."FN_PEREV">;'
      '  end'
      'end;'
      ''
      'procedure Memo20OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo20, Engine do'
      '  begin'
      '  FN_TARA_SUMM := FN_TARA_SUMM + <odsPrihDocs."FN_TARA">;'
      '  end'
      'end;'
      ''
      'procedure Memo21OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo21, Engine do'
      '  begin'
      
        '  FN_VSPOMSR_SUMM := FN_VSPOMSR_SUMM + <odsPrihDocs."FN_VSPOMSR"' +
        '>;'
      '  end'
      'end;'
      ''
      'procedure Memo24OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo24, Engine do'
      '  begin'
      '  FN_MED_SUMM :=0;'
      '  FN_PEREV_SUMM := 0;'
      '  FN_TARA_SUMM := 0;'
      '  FN_VSPOMSR_SUMM := 0;'
      '  FN_PRIH_DOCS_SUMM := 0;'
      ''
      '  end'
      'end;'
      ''
      'procedure Memo28OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo28, Engine do'
      '  begin'
      
        '  FN_Prih_SUMM := FN_Prih_SUMM + <odsNacenkaUcenka."FN_NACHENKA"' +
        '>;'
      '  end'
      'end;'
      ''
      'procedure Memo42OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo42, Engine do'
      '  begin'
      
        '  FN_Rash_SUMM := <odsRashTreb."FN_VSPOMSR">+<odsRashTreb."FN_ME' +
        'D">+<odsRashTreb."FN_PEREV">+<odsRashTreb."FN_TARA">;'
      '  end'
      'end;'
      ''
      'procedure Memo61OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo61, Engine do'
      '  begin'
      
        '  FN_Rash_SUMM := FN_Rash_SUMM + <odsRashDocs."FN_VSPOMSR">+<ods' +
        'RashDocs."FN_MED">+<odsRashDocs."FN_PEREV">+<odsPrihDocs."FN_TAR' +
        'A">;'
      
        '  FN_RASH_DOCS_SUMM := <odsRashDocs."FN_VSPOMSR">+<odsRashDocs."' +
        'FN_MED">+<odsRashDocs."FN_PEREV">+<odsPrihDocs."FN_TARA">;'
      '  end'
      'end;'
      ''
      'procedure Memo64OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo64, Engine do'
      '  begin'
      '  FN_MED_SUMM := FN_MED_SUMM + <odsRashDocs."FN_MED">;'
      '  end'
      'end;'
      ''
      'procedure Memo65OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo65, Engine do'
      '  begin'
      '  FN_PEREV_SUMM := FN_PEREV_SUMM + <odsRashDocs."FN_PEREV">;'
      '  end'
      'end;'
      ''
      'procedure Memo66OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo66, Engine do'
      '  begin'
      '  FN_TARA_SUMM := FN_TARA_SUMM + <odsRashDocs."FN_TARA">;'
      '  end'
      'end;'
      ''
      'procedure Memo67OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo67, Engine do'
      '  begin'
      
        '  FN_VSPOMSR_SUMM := FN_VSPOMSR_SUMM + <odsRashDocs."FN_VSPOMSR"' +
        '>;'
      '  end'
      'end;'
      ''
      'procedure Memo71OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo71, Engine do'
      '  begin'
      '  FN_MED_SUMM :=0;'
      '  FN_PEREV_SUMM := 0;'
      '  FN_TARA_SUMM := 0;'
      '  FN_VSPOMSR_SUMM := 0;'
      '  FN_RASH_DOCS_SUMM := 0;'
      '  end'
      'end;'
      ''
      'procedure Memo75OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo75, Engine do'
      '  begin'
      
        '  FN_Rash_SUMM := FN_Rash_SUMM + <odsNacenkaUcenka."FN_UCHENKA">' +
        ';'
      '  end'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    OnMouseOverObject = frxReport1MouseOverObject
    Left = 240
    Top = 48
    Datasets = <
      item
        DataSet = fdmMain.frDBNacenkaUcenka
        DataSetName = 'odsNacenkaUcenka'
      end
      item
        DataSet = fdmMain.frDBOstByMonth
        DataSetName = 'odsOstByMonth'
      end
      item
        DataSet = fdmMain.frDBstByMonth_GR_LF
        DataSetName = 'odsOstByMonth_GR_LF'
      end
      item
        DataSet = fdmMain.frxDBOstByMonth_TM
        DataSetName = 'odsOstByMonth_TM'
      end
      item
        DataSet = fdmMain.frDBPrihDocs
        DataSetName = 'odsPrihDocs'
      end
      item
        DataSet = fdmMain.frDBPrihDocs_GR_LF
        DataSetName = 'odsPrihDocs_GR_LF'
      end
      item
        DataSet = fdmMain.frxDBPrihDocs_TM
        DataSetName = 'odsPrihDocs_TM'
      end
      item
        DataSet = fdmMain.frDBRashDocs
        DataSetName = 'odsRashDocs'
      end
      item
        DataSet = fdmMain.frDBRashDocs_GR_LF
        DataSetName = 'odsRashDocs_GR_LF'
      end
      item
        DataSet = fdmMain.frxDBRashDocs_TM
        DataSetName = 'odsRashDocs_TM'
      end
      item
        DataSet = fdmMain.frDBRashTreb
        DataSetName = 'odsRashTreb'
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
      object MasterData2: TfrxMasterData
        Height = 30.000000000000000000
        Top = 260.188930000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = fdmMain.frDBOstByMonth
        DataSetName = 'odsOstByMonth'
        RowCount = 0
        Stretched = True
        object meFN_ALL: TfrxMemoView
          Left = 189.000000000000000000
          Top = 0.000000000000027589
          Width = 100.000000000000000000
          Height = 30.000000000000000000
          OnBeforePrint = 'meFN_ALLOnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[<odsOstByMonth."FN_START_VSPOMSR">'
            '+<odsOstByMonth."FN_START_MED">'
            '+<odsOstByMonth."FN_START_PEREV">'
            '+<odsOstByMonth."FN_START_TARA">]')
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Top = 0.000000000000027589
          Width = 36.000000000000000000
          Height = 30.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 36.000000000000000000
          Top = 0.000000000000027589
          Width = 153.000000000000000000
          Height = 30.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' '#1056#1029#1056#176' '#1056#1029#1056#176#1057#8225#1056#176#1056#187#1056#1109' '#1056#1112#1056#181#1057#1027#1057#1039#1057#8224#1056#176)
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 289.000000000000000000
          Top = 0.000000000000027589
          Width = 90.000000000000000000
          Height = 30.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth."FN_START_MED"]')
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 379.000000000000000000
          Top = 0.000000000000027589
          Width = 90.000000000000000000
          Height = 30.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth."FN_START_PEREV"]')
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 469.000000000000000000
          Top = 0.000000000000027589
          Width = 90.000000000000000000
          Height = 30.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth."FN_START_TARA"]')
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 559.000000000000000000
          Top = 0.000000000000027589
          Width = 90.000000000000000000
          Height = 30.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth."FN_START_VSPOMSR"]')
          VAlign = vaCenter
        end
      end
      object MasterHeader1: TfrxHeader
        Height = 20.000000000000000000
        Top = 412.000000000000000000
        Width = 680.315400000000000000
        object Memo14: TfrxMemoView
          Left = 289.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 189.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 36.000000000000000000
          Width = 153.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo24OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#160#1056#152#1056#1168#1056#1115#1056#8221)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 379.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 469.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 559.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Band2: TfrxMasterData
        Height = 20.000000000000000000
        Top = 452.000000000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = fdmMain.frDBPrihDocs
        DataSetName = 'odsPrihDocs'
        RowCount = 0
        Stretched = True
        object Memo15: TfrxMemoView
          Left = 189.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo15OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[<odsPrihDocs."FN_VSPOMSR">+'
            '<odsPrihDocs."FN_MED">+'
            '<odsPrihDocs."FN_PEREV">+'
            '<odsPrihDocs."FN_TARA">]')
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[LINE#]')
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 36.000000000000000000
          Width = 153.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[odsPrihDocs."FC_DOCMIX"]')
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 289.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo18OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsPrihDocs."FN_MED"]')
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 379.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo19OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsPrihDocs."FN_PEREV"]')
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 469.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo20OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsPrihDocs."FN_TARA"]')
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 559.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo21OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsPrihDocs."FN_VSPOMSR"]')
          VAlign = vaCenter
        end
      end
      object Band3: TfrxMasterData
        Height = 20.000000000000000000
        Top = 560.000000000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSetName = 'frDBNacenkaUcenka'
        RowCount = 0
        Stretched = True
        object Memo28: TfrxMemoView
          Left = 189.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo28OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsNacenkaUcenka."FN_NACHENKA"]')
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 36.000000000000000000
          Width = 153.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#1109#1057#8224#1056#181#1056#1029#1056#1108#1056#176' ('#1056#1111#1056#1109' '#1056#8250#1056#164#1056#8211')')
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 289.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 379.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 469.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 559.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 155.747990000000000000
        Top = 36.000000000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo35: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 368.000000000000000000
          Width = 280.000000000000000000
          Height = 112.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1032#1056#1118#1056#8217#1056#8226#1056#160#1056#8211#1056#8221#1056#1106#1056#174
            ''
            #1056#8212#1056#176#1056#1112'. '#1056#1110#1056#187'. '#1056#1030#1057#1026#1056#176#1057#8225#1056#176' '#1056#1111#1056#1109' '#1056#187#1056#181#1057#8225#1056#181#1056#177#1056#1029#1056#1109#1056#8470' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1056#181
            '[var_zam_gl_vracha_po_lech]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Rich1: TfrxRichView
          ShiftMode = smWhenOverlapped
          Top = 119.000000000000000000
          Width = 650.000000000000000000
          Height = 24.409400000000000000
          ShowHint = False
          StretchMode = smActualHeight
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235315C64656666305C6465
            666C616E67313034397B5C666F6E7474626C7B5C66305C666E696C205461686F
            6D613B7D7D0D0A7B5C2A5C67656E657261746F72204D7366746564697420352E
            34312E32312E323530393B7D5C766965776B696E64345C7563315C706172645C
            66305C667331365C7061720D0A7D0D0A00}
        end
      end
      object MasterData1: TfrxMasterData
        Height = 20.000000000000000000
        Top = 604.000000000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 0
        object Memo38: TfrxMemoView
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 36.000000000000000000
          Width = 153.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 189.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_Prih_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterFooter1: TfrxFooter
        Height = 20.000000000000000000
        Top = 496.000000000000000000
        Width = 680.315400000000000000
        object Memo44: TfrxMemoView
          Left = 189.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_Prih_SUMM]')
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 289.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_MED_SUMM]')
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 379.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_PEREV_SUMM]')
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 469.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_TARA_SUMM]')
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 559.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_VSPOMSR_SUMM]')
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 36.000000000000000000
          Width = 153.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176#1056#1112':')
          VAlign = vaCenter
        end
      end
      object PageHeader2: TfrxPageHeader
        Height = 20.000000000000000000
        Top = 211.527520000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          Left = 289.000000000000000000
          Top = 0.000000000000009756
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#181#1056#1169'-'#1057#8218#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 189.000000000000000000
          Top = 0.000000000000009756
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Top = 0.000000000000009756
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 36.000000000000000000
          Top = 0.000000000000009756
          Width = 153.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 379.000000000000000000
          Top = 0.000000000000009756
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#181#1057#1026#1056#181#1056#1030'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 469.000000000000000000
          Top = 0.000000000000009756
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#176#1057#1026#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 559.000000000000000000
          Top = 0.000000000000009756
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#1111#1056#1109#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 1016.000000000000000000
        Width = 680.315400000000000000
        object Memo102: TfrxMemoView
          Left = 514.000000000000000000
          Width = 136.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [PAGE#] '#1056#1105#1056#183' [TOTALPAGES#]')
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          Width = 476.000000000000000000
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
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Band4: TfrxMasterData
        Height = 20.000000000000000000
        Top = 105.543290000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = fdmMain.frDBRashTreb
        DataSetName = 'odsRashTreb'
        RowCount = 0
        Stretched = True
        object Memo42: TfrxMemoView
          Left = 189.000000000000000000
          Top = -0.000000000000001062
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo42OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[<odsRashTreb."FN_VSPOMSR">+<odsRashTreb."FN_MED">+'
            '<odsRashTreb."FN_PEREV">+<odsRashTreb."FN_TARA">]')
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Top = -0.000000000000001062
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 36.000000000000000000
          Top = -0.000000000000001062
          Width = 153.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1115#1057#8218#1056#1111#1057#1107#1057#8240#1056#181#1056#1029#1056#1109' '#1056#1109#1057#8218#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1057#1039#1056#1112' '#1056#1111#1056#1109' '#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039#1056 +
              #1112)
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 289.000000000000000000
          Top = -0.000000000000001062
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsRashTreb."FN_MED"]')
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 379.000000000000000000
          Top = -0.000000000000001062
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsRashTreb."FN_PEREV"]')
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 469.000000000000000000
          Top = -0.000000000000001062
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsRashTreb."FN_TARA"]')
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 559.000000000000000000
          Top = -0.000000000000001062
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsRashTreb."FN_VSPOMSR"]')
          VAlign = vaCenter
        end
      end
      object Band5: TfrxHeader
        Height = 20.000000000000000000
        Top = 172.000000000000000000
        Width = 680.315400000000000000
        object Memo68: TfrxMemoView
          Left = 289.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 189.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 36.000000000000000000
          Width = 153.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo71OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1109' '#1056#1111#1056#1109' '#1056#176#1056#1108#1057#8218#1056#176#1056#1112':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 379.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 469.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 559.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Band7: TfrxMasterData
        Height = 20.000000000000000000
        Top = 212.000000000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = fdmMain.frDBRashDocs
        DataSetName = 'odsRashDocs'
        RowCount = 0
        Stretched = True
        object Memo61: TfrxMemoView
          Left = 189.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo61OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[<odsRashDocs."FN_VSPOMSR">'
            '+<odsRashDocs."FN_MED">+'
            '<odsRashDocs."FN_PEREV">+<odsRashDocs."FN_TARA">]')
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[LINE#]')
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 36.000000000000000000
          Width = 153.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[odsRashDocs."FC_DOCMIX"]')
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 289.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo64OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsRashDocs."FN_MED"]')
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 379.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo65OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsRashDocs."FN_PEREV"]')
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 469.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo66OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsRashDocs."FN_TARA"]')
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 559.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo67OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsRashDocs."FN_VSPOMSR"]')
          VAlign = vaCenter
        end
      end
      object Band8: TfrxMasterData
        Height = 20.000000000000000000
        Top = 320.000000000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSetName = 'frDBNacenkaUcenka'
        RowCount = 0
        Stretched = True
        object Memo75: TfrxMemoView
          Left = 189.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo75OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsNacenkaUcenka."FN_UCHENKA"]')
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 36.000000000000000000
          Width = 153.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1057#8224#1056#181#1056#1029#1056#1108#1056#176' ('#1056#1111#1056#1109' '#1056#8250#1056#164#1056#8211')')
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 289.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 379.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 469.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 559.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
      end
      object Band9: TfrxMasterData
        Height = 20.000000000000000000
        Top = 364.000000000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 0
        object Memo82: TfrxMemoView
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 36.000000000000000000
          Width = 154.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo91: TfrxMemoView
          Left = 189.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_Rash_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 289.000000000000000000
          Width = 360.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
      end
      object Band10: TfrxFooter
        Height = 20.000000000000000000
        Top = 256.000000000000000000
        Width = 680.315400000000000000
        object Memo84: TfrxMemoView
          Left = 189.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_Rash_SUMM]')
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 289.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_MED_SUMM]')
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 379.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_PEREV_SUMM]')
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 469.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_TARA_SUMM]')
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 559.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_VSPOMSR_SUMM]')
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 36.000000000000000000
          Width = 153.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1109' '#1056#1111#1056#1109' '#1056#176#1056#1108#1057#8218#1056#176#1056#1112':')
          VAlign = vaCenter
        end
      end
      object Band11: TfrxMasterData
        Height = 20.000000000000000000
        Top = 412.000000000000000000
        Width = 680.315400000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = fdmMain.frDBOstByMonth
        DataSetName = 'odsOstByMonth'
        RowCount = 0
        Stretched = True
        object Memo36: TfrxMemoView
          Left = 189.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[<odsOstByMonth."FN_END_VSPOMSR">+<odsOstByMonth."FN_END_MED">+<' +
              'odsOstByMonth."FN_END_PEREV">+<odsOstByMonth."FN_END_TARA">]')
          VAlign = vaCenter
        end
        object Memo92: TfrxMemoView
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 36.000000000000000000
          Width = 153.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' '#1056#1029#1056#176' '#1056#1029#1056#176#1057#8225#1056#176#1056#187#1056#1109' '#1057#1027#1056#187#1056#181#1056#1169#1057#1107#1057#1035#1057#8240#1056#181#1056#1110#1056#1109' '#1056#1112#1056#181#1057#1027#1057#1039#1057#8224 +
              #1056#176)
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 289.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth."FN_END_MED"]')
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 379.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth."FN_END_PEREV"]')
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Left = 469.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth."FN_END_TARA"]')
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 559.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '### ### ##0.00 '#1088
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth."FN_END_VSPOMSR"]')
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 20.000000000000000000
        Top = 44.000000000000000000
        Width = 680.315400000000000000
        object Memo37: TfrxMemoView
          Left = 289.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#181#1056#1169'-'#1057#8218#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 189.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 36.000000000000000000
          Width = 153.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8230#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 379.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#181#1057#1026#1056#181#1056#1030'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 469.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#176#1057#1026#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 559.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#1111#1056#1109#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Band1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 1008.000000000000000000
        Width = 680.315400000000000000
        object Memo104: TfrxMemoView
          Align = baRight
          Left = 556.315399999999900000
          Width = 124.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [PAGE#] '#1056#1105#1056#183' [TOTALPAGES#]')
          VAlign = vaCenter
        end
        object Memo107: TfrxMemoView
          Width = 476.000000000000000000
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
    end
    object Page3: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      PrintOnPreviousPage = True
      object ReportSummary1: TfrxReportSummary
        Height = 144.000000000000000000
        Top = 32.000000000000000000
        Width = 680.315400000000000000
        object Memo98: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 4.000000000000000000
          Top = 32.000000000000000000
          Width = 96.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#187#1056#1109#1056#182#1056#181#1056#1029#1056#1105#1056#181)
        end
        object mePrilojenie: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 100.000000000000000000
          Top = 32.000000000000000000
          Width = 452.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Frame.Typ = [ftBottom]
        end
        object Memo100: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 552.000000000000000000
          Top = 32.000000000000000000
          Width = 96.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Memo.UTF8 = (
            #1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#1109#1056#1030)
        end
        object Memo101: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 4.000000000000000000
          Top = 68.000000000000000000
          Width = 96.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1030'. '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470)
        end
        object meZavAptekoy: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 100.000000000000000000
          Top = 68.000000000000000000
          Width = 452.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Frame.Typ = [ftBottom]
        end
        object Memo103: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 4.000000000000000000
          Top = 104.000000000000000000
          Width = 272.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#176#1056#1030#1056#1105#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#1039' '#1056#1109#1057#8218#1057#8225#1056#181#1057#8218#1056#176' '#1056#1111#1057 +
              #1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1105#1056#187)
        end
        object mePravSost: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 276.000000000000000000
          Top = 104.000000000000000000
          Width = 276.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Frame.Typ = [ftBottom]
        end
      end
      object Band6: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 1012.000000000000000000
        Width = 680.315400000000000000
        object Memo105: TfrxMemoView
          Align = baRight
          Left = 560.315399999999900000
          Width = 120.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [PAGE#] '#1056#1105#1056#183' [TOTALPAGES#]')
          VAlign = vaCenter
        end
        object Memo108: TfrxMemoView
          Width = 476.000000000000000000
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
    end
  end
  object frxReport2: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39363.732243738400000000
    ReportOptions.LastChange = 41248.642496377320000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  FN_Prih_SUMM ,'
      '  FN_Rash_SUMM ,   '
      '  FN_GLF_SUMM ,   '
      '  FN_ANGRO_SUMM ,'
      '  FN_PEREV_SUMM ,   '
      '  FN_RASHODNIK_SUMM ,   '
      '  FN_EXTEMP_SUMM ,   '
      '  FN_PRIH_DOCS_SUMM,   '
      '    FN_TARA_SUMM '
      '    '
      '  '
      '  :double;'
      '    '
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with ReportTitle1, Engine do'
      '  begin'
      '  FN_Prih_SUMM := 0;'
      '  FN_Rash_SUMM := 0;'
      '  FN_GLF_SUMM :=0;'
      '  FN_ANGRO_SUMM :=0;'
      '  FN_PEREV_SUMM := 0;'
      '  FN_RASHODNIK_SUMM := 0;'
      '  FN_EXTEMP_SUMM := 0;'
      '  FN_PRIH_DOCS_SUMM := 0;'
      '  end'
      'end;'
      ''
      'procedure meFN_ALLOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with meFN_ALL, Engine do'
      '  begin'
      
        '  FN_Prih_SUMM := FN_Prih_SUMM + <odsOstByMonth_GR_LF."FN_START_' +
        'ANGRO">+ <odsOstByMonth_GR_LF."FN_START_GLF">+ <odsOstByMonth_GR' +
        '_LF."FN_START_PEREV">+ <odsOstByMonth_GR_LF."FN_START_EXTEMPOR">' +
        '+ <odsOstByMonth_GR_LF."FN_START_RASHODNIK">;'
      '  end'
      'end;'
      ''
      'procedure Memo15OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo15, Engine do'
      '  begin'
      
        '  FN_Prih_SUMM := FN_Prih_SUMM + <odsPrihDocs_GR_LF."FN_ALL_SUM"' +
        '>;'
      
        '  FN_PRIH_DOCS_SUMM := <odsPrihDocs_GR_LF."FN_ANGRO">+ <odsPrihD' +
        'ocs_GR_LF."FN_GLF">+ <odsPrihDocs_GR_LF."FN_PEREV">+ <odsPrihDoc' +
        's_GR_LF."FN_EXTEMPOR">+ <odsPrihDocs_GR_LF."FN_RASHODNIK">;'
      '  end'
      'end;'
      ''
      'procedure Memo18OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo18, Engine do'
      '  begin'
      
        '  FN_ANGRO_SUMM := FN_ANGRO_SUMM + <odsPrihDocs_GR_LF."FN_ANGRO"' +
        '>;'
      '  end'
      'end;'
      ''
      'procedure Memo19OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo19, Engine do'
      '  begin'
      
        '  FN_PEREV_SUMM := FN_PEREV_SUMM + <odsPrihDocs_GR_LF."FN_PEREV"' +
        '>;'
      '  end'
      'end;'
      ''
      'procedure Memo20OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo20, Engine do'
      '  begin'
      
        '  FN_RASHODNIK_SUMM := FN_RASHODNIK_SUMM + <odsPrihDocs_GR_LF."F' +
        'N_RASHODNIK">;'
      '  end'
      'end;'
      ''
      'procedure Memo21OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo21, Engine do'
      '  begin'
      
        '  FN_EXTEMP_SUMM := FN_EXTEMP_SUMM + <odsPrihDocs_GR_LF."FN_EXTE' +
        'MPOR">;'
      '  end'
      'end;'
      ''
      'procedure Memo24OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo24, Engine do'
      '  begin'
      '  FN_GLF_SUMM :=0;'
      '  FN_ANGRO_SUMM :=0;'
      '  FN_PEREV_SUMM := 0;'
      '  FN_TARA_SUMM := 0;'
      '  FN_EXTEMP_SUMM := 0;'
      '  FN_PRIH_DOCS_SUMM := 0;'
      ''
      '  end'
      'end;'
      ''
      'procedure Memo107OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo107, Engine do'
      '  begin'
      '  FN_GLF_SUMM := FN_GLF_SUMM + <odsPrihDocs_GR_LF."FN_GLF">;'
      '  end'
      'end;'
      ''
      'procedure Memo42OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with Memo42, Engine do'
      '  begin'
      '  FN_GLF_SUMM :=0;'
      '  FN_ANGRO_SUMM :=0;'
      '  FN_PEREV_SUMM := 0;'
      '  FN_TARA_SUMM := 0;'
      '  FN_EXTEMP_SUMM := 0;'
      '  FN_PRIH_DOCS_SUMM := 0;'
      '  FN_Prih_SUMM := 0;'
      '  end'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    OnMouseOverObject = frxReport1MouseOverObject
    Left = 120
    Top = 64
    Datasets = <
      item
        DataSet = fdmMain.frDBNacenkaUcenka
        DataSetName = 'odsNacenkaUcenka'
      end
      item
        DataSet = fdmMain.frDBOstByMonth
        DataSetName = 'odsOstByMonth'
      end
      item
        DataSet = fdmMain.frDBstByMonth_GR_LF
        DataSetName = 'odsOstByMonth_GR_LF'
      end
      item
        DataSet = fdmMain.frxDBOstByMonth_TM
        DataSetName = 'odsOstByMonth_TM'
      end
      item
        DataSet = fdmMain.frDBPrihDocs
        DataSetName = 'odsPrihDocs'
      end
      item
        DataSet = fdmMain.frDBPrihDocs_GR_LF
        DataSetName = 'odsPrihDocs_GR_LF'
      end
      item
        DataSet = fdmMain.frxDBPrihDocs_TM
        DataSetName = 'odsPrihDocs_TM'
      end
      item
        DataSet = fdmMain.frDBRashDocs
        DataSetName = 'odsRashDocs'
      end
      item
        DataSet = fdmMain.frDBRashDocs_GR_LF
        DataSetName = 'odsRashDocs_GR_LF'
      end
      item
        DataSet = fdmMain.frxDBRashDocs_TM
        DataSetName = 'odsRashDocs_TM'
      end
      item
        DataSet = fdmMain.frDBRashTreb
        DataSetName = 'odsRashTreb'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterHeader1: TfrxHeader
        Height = 44.000000000000000000
        Top = 381.732530000000000000
        Width = 1009.134510000000000000
        object Memo36: TfrxMemoView
          Left = 352.000000000000000000
          Top = 24.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 252.000000000000000000
          Top = 24.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Top = 24.000000000000000000
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 36.000000000000000000
          Top = 24.000000000000000000
          Width = 216.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo42OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1119#1056#160#1056#152#1056#1168#1056#1115#1056#8221)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 552.000000000000000000
          Top = 24.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 752.000000000000000000
          Top = 24.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 652.000000000000000000
          Top = 24.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 452.000000000000000000
          Top = 24.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 852.000000000000000000
          Top = 24.000000000000000000
          Width = 110.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Band2: TfrxMasterData
        Height = 20.000000000000000000
        Top = 449.764070000000000000
        Width = 1009.134510000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = fdmMain.frDBPrihDocs_GR_LF
        DataSetName = 'odsPrihDocs_GR_LF'
        RowCount = 0
        Stretched = True
        object Memo15: TfrxMemoView
          Left = 252.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo15OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsPrihDocs_GR_LF."FN_ALL_SUM"]')
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[LINE#]')
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 36.000000000000000000
          Width = 216.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[odsPrihDocs_GR_LF."FC_POSTAV"]')
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 352.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo18OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsPrihDocs_GR_LF."FN_ANGRO"]')
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 552.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo19OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsPrihDocs_GR_LF."FN_PEREV"]')
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 752.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo20OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsPrihDocs_GR_LF."FN_RASHODNIK"]')
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 652.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo21OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsPrihDocs_GR_LF."FN_EXTEMPOR"]')
          VAlign = vaCenter
        end
        object Memo107: TfrxMemoView
          Left = 452.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo107OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsPrihDocs_GR_LF."FN_GLF"]')
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Left = 852.000000000000000000
          Width = 110.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[<odsPrihDocs_GR_LF."FN_ANGRO">+ <odsPrihDocs_GR_LF."FN_GLF">+ <' +
              'odsPrihDocs_GR_LF."FN_PEREV">+ <odsPrihDocs_GR_LF."FN_EXTEMPOR">' +
              '+ <odsPrihDocs_GR_LF."FN_RASHODNIK">]')
          VAlign = vaCenter
        end
      end
      object Band3: TfrxMasterData
        Height = 44.000000000000000000
        Top = 646.299630000000000000
        Width = 1009.134510000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 0
        Stretched = True
        object Memo28: TfrxMemoView
          Left = 252.000000000000000000
          Top = 24.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth_GR_LF."FN_END_ALL"]')
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Top = 24.000000000000000000
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 36.000000000000000000
          Top = 24.000000000000000000
          Width = 216.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' '#1056#1029#1056#176' '#1056#1108#1056#1109#1056#1029#1056#181#1057#8224' '#1056#1112#1056#181#1057#1027#1057#1039#1057#8224#1056#176)
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 352.000000000000000000
          Top = 24.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth_GR_LF."FN_END_ANGRO"]')
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 552.000000000000000000
          Top = 24.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth_GR_LF."FN_END_PEREV"]')
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 752.000000000000000000
          Top = 24.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth_GR_LF."FN_END_RASHODNIK"]')
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 652.000000000000000000
          Top = 24.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth_GR_LF."FN_END_EXTEMPOR"]')
          VAlign = vaCenter
        end
        object Memo109: TfrxMemoView
          Left = 452.000000000000000000
          Top = 24.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth_GR_LF."FN_END_GLF"]')
          VAlign = vaCenter
        end
        object Memo115: TfrxMemoView
          Left = 852.000000000000000000
          Top = 24.000000000000000000
          Width = 110.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[<odsOstByMonth_GR_LF."FN_END_ANGRO">'
            '+ <odsOstByMonth_GR_LF."FN_END_GLF">'
            '+ <odsOstByMonth_GR_LF."FN_END_PEREV">'
            '+ <odsOstByMonth_GR_LF."FN_END_EXTEMPOR">'
            '+ <odsOstByMonth_GR_LF."FN_END_RASHODNIK">]')
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 173.070810000000000000
        Top = 18.897650000000000000
        Width = 1009.134510000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo35: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 652.000000000000000000
          Width = 310.000000000000000000
          Height = 119.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1032#1056#1118#1056#8217#1056#8226#1056#160#1056#8211#1056#8221#1056#1106#1056#174
            ''
            #1056#8212#1056#176#1056#1112'. '#1056#1110#1056#187'. '#1056#1030#1057#1026#1056#176#1057#8225#1056#176' '#1056#1111#1056#1109' '#1056#187#1056#181#1057#8225#1056#181#1056#177#1056#1029#1056#1109#1056#8470' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1056#181
            '[var_zam_gl_vracha_po_lech]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Rich1: TfrxRichView
          ShiftMode = smWhenOverlapped
          Top = 96.322820000000010000
          Width = 962.000000000000000000
          Height = 63.204700000000000000
          ShowHint = False
          StretchMode = smActualHeight
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235315C64656666305C6465
            666C616E67313034397B5C666F6E7474626C7B5C66305C666E696C205461686F
            6D613B7D7D0D0A7B5C2A5C67656E657261746F72204D7366746564697420352E
            34312E32312E323530393B7D5C766965776B696E64345C7563315C706172645C
            66305C667331365C7061720D0A7D0D0A00}
        end
        object Memo57: TfrxMemoView
          Left = 352.000000000000000000
          Top = 153.070810000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1106#1056#1029#1056#1110#1057#1026#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 252.000000000000000000
          Top = 133.070810000000000000
          Width = 100.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Top = 133.070810000000000000
          Width = 36.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 36.000000000000000000
          Top = 133.070810000000000000
          Width = 216.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 552.000000000000000000
          Top = 133.070810000000000000
          Width = 100.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#181#1057#1026#1056#181#1056#1030'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 752.000000000000000000
          Top = 133.070810000000000000
          Width = 100.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1056#1029#1056#1105#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 652.000000000000000000
          Top = 133.070810000000000000
          Width = 100.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#173#1056#1108#1057#1027#1057#8218#1056#181#1056#1112#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 452.000000000000000000
          Top = 153.070810000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8220#1056#8250#1056#164)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 852.000000000000000000
          Top = 133.070810000000000000
          Width = 110.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 352.000000000000000000
          Top = 133.070810000000000000
          Width = 200.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 20.000000000000000000
        Top = 604.724800000000000000
        Width = 1009.134510000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = fdmMain.frDBRashDocs_GR_LF
        DataSetName = 'odsRashDocs_GR_LF'
        RowCount = 0
        object Memo38: TfrxMemoView
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 36.000000000000000000
          Width = 216.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[odsRashDocs_GR_LF."fc_postav"]')
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 252.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsRashDocs_GR_LF."FN_ALL_SUM"]')
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 352.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsRashDocs_GR_LF."FN_ANGRO"]')
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 552.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsRashDocs_GR_LF."FN_PEREV"]')
          VAlign = vaCenter
        end
        object Memo120: TfrxMemoView
          Left = 752.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsRashDocs_GR_LF."FN_RASHODNIK"]')
          VAlign = vaCenter
        end
        object Memo121: TfrxMemoView
          Left = 652.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsRashDocs_GR_LF."FN_EXTEMPOR"]')
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          Left = 452.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsRashDocs_GR_LF."FN_GLF"]')
          VAlign = vaCenter
        end
        object Memo123: TfrxMemoView
          Left = 852.000000000000000000
          Width = 110.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[<odsRashDocs_GR_LF."FN_ANGRO">'
            '+<odsRashDocs_GR_LF."FN_GLF">'
            '+<odsRashDocs_GR_LF."FN_PEREV">'
            '+<odsRashDocs_GR_LF."FN_EXTEMPOR">'
            '+<odsRashDocs_GR_LF."FN_RASHODNIK">]')
          VAlign = vaCenter
        end
      end
      object MasterFooter1: TfrxFooter
        Height = 20.000000000000000000
        Top = 491.338900000000000000
        Width = 1009.134510000000000000
        object Memo44: TfrxMemoView
          Left = 252.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_Prih_SUMM]')
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 352.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_ANGRO_SUMM]')
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 552.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_PEREV_SUMM]')
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 752.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_RASHODNIK_SUMM]')
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 652.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_EXTEMP_SUMM]')
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 36.000000000000000000
          Width = 216.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176#1056#1112':')
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 452.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[FN_GLF_SUMM]')
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Left = 852.000000000000000000
          Width = 110.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[<FN_ANGRO_SUMM>+<FN_GLF_SUMM>+<FN_PEREV_SUMM>+<FN_EXTEMP_SUMM>+' +
              '<FN_RASHODNIK_SUMM>]')
          VAlign = vaCenter
        end
      end
      object band1: TfrxPageHeader
        Height = 40.000000000000000000
        Top = 215.433210000000000000
        Width = 1009.134510000000000000
        PrintOnFirstPage = False
        object Memo1: TfrxMemoView
          Left = 352.000000000000000000
          Top = 20.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1106#1056#1029#1056#1110#1057#1026#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 252.000000000000000000
          Width = 100.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Width = 36.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 36.000000000000000000
          Width = 216.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 552.000000000000000000
          Width = 100.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#181#1057#1026#1056#181#1056#1030'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 752.000000000000000000
          Width = 100.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1056#1029#1056#1105#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 652.000000000000000000
          Width = 100.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#173#1056#1108#1057#1027#1057#8218#1056#181#1056#1112#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 452.000000000000000000
          Top = 20.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8220#1056#8250#1056#164)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 852.000000000000000000
          Width = 110.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo124: TfrxMemoView
          Left = 352.000000000000000000
          Width = 200.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 752.126470000000000000
        Width = 1009.134510000000000000
        object Memo55: TfrxMemoView
          Left = 827.000000000000000000
          Width = 134.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [PAGE#] '#1056#1105#1056#183' [TOTALPAGES#]')
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Width = 827.000000000000000000
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
      object Band1_1: TfrxHeader
        Height = 48.000000000000000000
        Top = 532.913730000000000000
        Width = 1009.134510000000000000
        object Memo14: TfrxMemoView
          Left = 352.000000000000000000
          Top = 20.440939999999960000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 252.000000000000000000
          Top = 20.440939999999960000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Top = 20.440939999999960000
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 36.000000000000000000
          Top = 20.440939999999960000
          Width = 216.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'Memo24OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#160#1056#1106#1056#1038#1056#1168#1056#1115#1056#8221)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 552.000000000000000000
          Top = 20.440939999999960000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 752.000000000000000000
          Top = 20.440939999999960000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 652.000000000000000000
          Top = 20.440939999999960000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo108: TfrxMemoView
          Left = 452.000000000000000000
          Top = 20.440939999999960000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Left = 852.000000000000000000
          Top = 20.440939999999960000
          Width = 110.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13434828
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Height = 40.000000000000000000
        Top = 317.480520000000000000
        Width = 1009.134510000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 0
        object meFN_ALL: TfrxMemoView
          Left = 252.000000000000000000
          Top = 20.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          OnBeforePrint = 'meFN_ALLOnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth_GR_LF."FN_START_ALL"]')
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Top = 20.000000000000000000
          Width = 36.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 36.000000000000000000
          Top = 20.000000000000000000
          Width = 216.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' '#1056#1029#1056#176' '#1056#1029#1056#176#1057#8225#1056#176#1056#187#1056#1109' '#1056#1112#1056#181#1057#1027#1057#1039#1057#8224#1056#176)
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 352.000000000000000000
          Top = 20.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth_GR_LF."FN_START_ANGRO"]')
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 552.000000000000000000
          Top = 20.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth_GR_LF."FN_START_PEREV"]')
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 752.000000000000000000
          Top = 20.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth_GR_LF."FN_START_RASHODNIK"]')
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 652.000000000000000000
          Top = 20.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth_GR_LF."FN_START_EXTEMPOR"]')
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          Left = 452.000000000000000000
          Top = 20.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[odsOstByMonth_GR_LF."FN_START_GLF"]')
          VAlign = vaCenter
        end
        object Memo112: TfrxMemoView
          Left = 852.000000000000000000
          Top = 20.000000000000000000
          Width = 110.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[<odsOstByMonth_GR_LF."FN_START_ANGRO">+ <odsOstByMonth_GR_LF."F' +
              'N_START_GLF">+ <odsOstByMonth_GR_LF."FN_START_PEREV">+ <odsOstBy' +
              'Month_GR_LF."FN_START_EXTEMPOR">+ <odsOstByMonth_GR_LF."FN_START' +
              '_RASHODNIK">]')
          VAlign = vaCenter
        end
      end
    end
    object Page2: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      PrintOnPreviousPage = True
      object ReportSummary1: TfrxReportSummary
        Height = 136.000000000000000000
        Top = 18.897650000000000000
        Width = 1009.134510000000000000
        object Memo98: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 32.000000000000000000
          Width = 115.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Memo.UTF8 = (
            #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1056#187)
        end
        object mePrilojenie: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 115.000000000000000000
          Top = 32.000000000000000000
          Width = 437.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Frame.Typ = [ftBottom]
        end
        object Memo100: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 552.000000000000000000
          Top = 32.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Memo.UTF8 = (
            #1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#1109#1056#1030)
        end
        object Memo101: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 68.000000000000000000
          Width = 115.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Memo.UTF8 = (
            #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1111#1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1105#1056#187)
        end
        object meZavAptekoy: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 115.000000000000000000
          Top = 68.000000000000000000
          Width = 437.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Frame.Typ = [ftBottom]
        end
        object Memo103: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 104.000000000000000000
          Width = 276.000000000000000000
          Height = 20.000000000000000000
          Visible = False
          ShowHint = False
          StretchMode = smActualHeight
          Memo.UTF8 = (
            
              ' '#1056#1119#1057#1026#1056#176#1056#1030#1056#1105#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#1039' '#1056#1109#1057#8218#1057#8225#1056#181#1057#8218#1056#176' '#1056#1111 +
              #1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1105#1056#187)
        end
        object mePravSost: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 276.000000000000000000
          Top = 104.000000000000000000
          Width = 276.000000000000000000
          Height = 20.000000000000000000
          Visible = False
          ShowHint = False
          StretchMode = smActualHeight
          Frame.Typ = [ftBottom]
        end
      end
      object Band6: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 177.637910000000000000
        Width = 1009.134510000000000000
        object Memo105: TfrxMemoView
          Align = baRight
          Left = 785.134510000000000000
          Width = 224.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [PAGE#] '#1056#1105#1056#183' [TOTALPAGES#]')
          VAlign = vaCenter
        end
      end
    end
  end
  object frxReport3: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41239.390336759260000000
    ReportOptions.LastChange = 41591.538297349540000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxReport3GetValue
    Left = 296
    Top = 64
    Datasets = <
      item
        DataSet = fdmMain.frxDBOstByMonth_TM
        DataSetName = 'odsOstByMonth_TM'
      end
      item
        DataSet = fdmMain.frxDBPrihDocs_TM
        DataSetName = 'odsPrihDocs_TM'
      end
      item
        DataSet = fdmMain.frxDBRashDocs_TM
        DataSetName = 'odsRashDocs_TM'
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
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 94.488250000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8226#1057#8222#1056#1105#1056#1112#1056#1109#1056#1030#1056#176' '#1056#8226'.'#1056#8217'.')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 15.118119999999990000
          Width = 226.771800000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034' '#1057#1026#1057#1107#1056#1108#1056#1109#1056#1030#1056#1109#1056#1169#1056#1105#1057#8218#1056#181#1056#187#1057#1039' '#1057#1107#1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baWidth
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1056#1118#1056#167#1056#8226#1056#1118' '#1056#1106#1056#1119#1056#1118#1056#8226#1056#1113#1056#152)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baWidth
          Top = 56.692949999999990000
          Width = 718.110700000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1109' '#1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169#1056#181' '#1056#1105' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1056#181' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1056#1108#1056#1105#1057#8230' '#1056#183#1056#176#1056 +
              #1111#1056#176#1057#1027#1056#1109#1056#1030' '#1056#1030' '#1056#1169#1056#181#1056#1029#1056#181#1056#182#1056#1029#1056#1109#1056#1112' ('#1057#1027#1057#1107#1056#1112#1056#1112#1056#1109#1056#1030#1056#1109#1056#1112') '#1056#1030#1057#8249#1057#1026#1056#176#1056#182#1056#181#1056#1029#1056 +
              #1105#1056#1105)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 75.590600000000000000
          Width = 718.110700000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176' [MONTHYEAR]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        DataSet = fdmMain.frxDBOstByMonth_TM
        DataSetName = 'odsOstByMonth_TM'
        RowCount = 0
        Stretched = True
        object Memo24: TfrxMemoView
          Width = 264.567100000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' '#1056#1029#1056#176' '#1056#1029#1056#176#1057#8225#1056#176#1056#187#1056#1109' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 264.567100000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_START_MED'
          DataSet = fdmMain.frxDBOstByMonth_TM
          DataSetName = 'odsOstByMonth_TM'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsOstByMonth_TM."FN_START_MED"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 377.953000000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_START_VES'
          DataSet = fdmMain.frxDBOstByMonth_TM
          DataSetName = 'odsOstByMonth_TM'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsOstByMonth_TM."FN_START_VES"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[<odsOstByMonth_TM."FN_START_MED"> +'
            ' <odsOstByMonth_TM."FN_START_VES"> +'
            '<odsOstByMonth_TM."FN_START_PEREV">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 491.338900000000000000
          Width = 113.385900000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_START_PEREV'
          DataSet = fdmMain.frxDBOstByMonth_TM
          DataSetName = 'odsOstByMonth_TM'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsOstByMonth_TM."FN_START_PEREV"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 808.819420000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 113.385900000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        RowCount = 1
        object Memo6: TfrxMemoView
          Left = 37.795300000000000000
          Top = 11.338590000000010000
          Width = 264.567100000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8216#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026#1056#1105#1057#1039' ('#1057#8224#1056#181#1056#1029#1057#8218#1057#1026#1056#176#1056#187#1056#1105#1056#183#1056#1109#1056#1030#1056#176#1056#1029#1056#1029#1056#176#1057#1039' '#1056#177#1057#1107#1057#8230#1056 +
              #1110#1056#176#1056#187#1057#8218#1056#181#1057#1026#1056#1105#1057#1039')')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 302.362400000000000000
          Top = 11.338590000000010000
          Width = 302.362400000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 37.795300000000000000
          Top = 26.456709999999990000
          Width = 151.181200000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#160#1056#176#1056#183#1056#1169#1056#181#1056#187)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 188.976500000000000000
          Top = 26.456709999999990000
          Width = 415.748300000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 37.795300000000000000
          Top = 41.574830000000020000
          Width = 151.181200000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8221#1056#181#1056#177#1056#181#1057#8218' '#1057#1027#1057#1107#1056#177#1057#1027#1057#8225#1056#181#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 188.976500000000000000
          Top = 41.574830000000020000
          Width = 415.748300000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 37.795300000000000000
          Top = 56.692949999999990000
          Width = 151.181200000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1057#1026#1056#181#1056#1169#1056#1105#1057#8218' '#1057#1027#1057#1107#1056#177#1057#1027#1057#8225#1056#181#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 188.976500000000000000
          Top = 56.692949999999990000
          Width = 415.748300000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 37.795300000000000000
          Top = 71.811070000000030000
          Width = 151.181200000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8226#1056#1169#1056#1105#1056#1029#1056#1105#1057#8224#1056#176' '#1056#1105#1056#183#1056#1112#1056#181#1057#1026#1056#181#1056#1029#1056#1105#1057#1039', '#1057#1026#1057#1107#1056#177)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 188.976500000000000000
          Top = 71.811070000000030000
          Width = 415.748300000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 37.795300000000000000
          Top = 86.929190000000000000
          Width = 151.181200000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1029#1057#8218#1057#1026#1056#1109#1056#187#1057#1034#1056#1029#1056#176#1057#1039' '#1057#1027#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 188.976500000000000000
          Top = 86.929190000000000000
          Width = 415.748300000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 30.236220470000000000
        Top = 309.921460000000000000
        Width = 718.110700000000000000
        object Memo19: TfrxMemoView
          Width = 264.567100000000000000
          Height = 30.236220472440940000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 264.567100000000000000
          Width = 113.385826770000000000
          Height = 30.236220472440940000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#181#1056#1169#1056#1105#1056#1108#1056#176#1056#1112#1056#181#1056#1029#1057#8218#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 377.953000000000000000
          Width = 113.385826770000000000
          Height = 30.236220472440940000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1056#181#1057#1027#1056#1109#1056#1030#1057#8249#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 30.236220472440940000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 491.338900000000000000
          Width = 113.385900000000000000
          Height = 30.236220472440940000
          ShowHint = False
          Color = 13434828
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#181#1057#1026#1056#181#1056#1030#1057#1039#1056#183#1056#1109#1057#8225#1056#1029#1057#8249#1056#8470' '#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 94.488250000000000000
        Top = 691.653990000000000000
        Width = 718.110700000000000000
        object Memo29: TfrxMemoView
          Left = 37.795300000000000000
          Top = 15.118119999999980000
          Width = 566.929500000000000000
          Height = 22.677165354330710000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#1105#1056#187#1056#1109#1056#182#1056#181#1056#1029#1056#1105#1056#181'  __________________________ '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057 +
              #8218#1056#1109#1056#1030)
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 37.795300000000000000
          Top = 37.795300000000000000
          Width = 566.929500000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8212#1056#176#1056#1030#1056#181#1056#1169#1057#1107#1057#1035#1057#8240#1056#1105#1056#8470' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470'  __________________________ ' +
              '/ [ZAV_APTEKA]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 37.795300000000000000
          Top = 60.472480000000010000
          Width = 566.929500000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#176#1056#1030#1056#1105#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#1039' '#1056#1109#1057#8218#1057#8225#1056#181#1057#8218#1056#176' '#1056#1111#1057 +
              #1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1105#1056#187'  __________________________ / ______________/')
          ParentFont = False
        end
      end
      object MasterData3: TfrxMasterData
        Height = 18.897650000000000000
        Top = 404.409710000000000000
        Width = 718.110700000000000000
        DataSet = fdmMain.frxDBPrihDocs_TM
        DataSetName = 'odsPrihDocs_TM'
        RowCount = 0
        Stretched = True
        object Memo32: TfrxMemoView
          Width = 264.567100000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 264.567100000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_MED'
          DataSet = fdmMain.frxDBPrihDocs_TM
          DataSetName = 'odsPrihDocs_TM'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsPrihDocs_TM."FN_MED"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 377.953000000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_VES'
          DataSet = fdmMain.frxDBPrihDocs_TM
          DataSetName = 'odsPrihDocs_TM'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsPrihDocs_TM."FN_VES"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[ <odsPrihDocs_TM."FN_MED"> +'
            '  <odsPrihDocs_TM."FN_VES"> +'
            ' <odsPrihDocs_TM."FN_PEREV">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 491.338900000000000000
          Width = 113.385900000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_PEREV'
          DataSet = fdmMain.frxDBPrihDocs_TM
          DataSetName = 'odsPrihDocs_TM'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsPrihDocs_TM."FN_PEREV"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData4: TfrxMasterData
        Height = 18.897650000000000000
        Top = 445.984540000000000000
        Width = 718.110700000000000000
        RowCount = 1
        Stretched = True
        object Memo38: TfrxMemoView
          Left = 264.567100000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[<odsOstByMonth_TM."FN_START_MED"> +<odsPrihDocs_TM."FN_MED">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Width = 264.567100000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1057#1027' '#1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169#1056#1109#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 377.953000000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[<odsOstByMonth_TM."FN_START_VES">+<odsPrihDocs_TM."FN_VES">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[<odsOstByMonth_TM."FN_START_MED"> +'
            ' <odsOstByMonth_TM."FN_START_VES"> +'
            '<odsOstByMonth_TM."FN_START_PEREV"> +'
            '<odsPrihDocs_TM."FN_MED"> +'
            '<odsPrihDocs_TM."FN_VES"> +'
            '<odsPrihDocs_TM."FN_PEREV">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 491.338900000000000000
          Width = 113.385900000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[<odsOstByMonth_TM."FN_START_PEREV">+<odsPrihDocs_TM."FN_PEREV">' +
              ']')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData5: TfrxMasterData
        Height = 18.897650000000000000
        Top = 487.559370000000000000
        Width = 718.110700000000000000
        RowCount = 1
        Stretched = True
        object Memo42: TfrxMemoView
          Width = 264.567100000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8230#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 264.567100000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 377.953000000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 491.338900000000000000
          Width = 113.385900000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData6: TfrxMasterData
        Height = 18.897650000000000000
        Top = 529.134199999999900000
        Width = 718.110700000000000000
        DataSet = fdmMain.frxDBRashDocs_TM
        DataSetName = 'odsRashDocs_TM'
        RowCount = 0
        Stretched = True
        object Memo50: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[ <odsRashDocs_TM."FN_MED"> +'
            '  <odsRashDocs_TM."FN_VES"> +'
            ' <odsRashDocs_TM."FN_PEREV">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 264.567100000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_MED'
          DataSet = fdmMain.frxDBRashDocs_TM
          DataSetName = 'odsRashDocs_TM'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRashDocs_TM."FN_MED"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Width = 264.567100000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataField = 'FC_GROUP'
          DataSet = fdmMain.frxDBRashDocs_TM
          DataSetName = 'odsRashDocs_TM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[odsRashDocs_TM."FC_GROUP"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 377.953000000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_VES'
          DataSet = fdmMain.frxDBRashDocs_TM
          DataSetName = 'odsRashDocs_TM'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRashDocs_TM."FN_VES"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 491.338900000000000000
          Width = 113.385900000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_PEREV'
          DataSet = fdmMain.frxDBRashDocs_TM
          DataSetName = 'odsRashDocs_TM'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsRashDocs_TM."FN_PEREV"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData8: TfrxMasterData
        Height = 18.897650000000000000
        Top = 612.283860000000000000
        Width = 718.110700000000000000
        DataSet = fdmMain.frxDBOstByMonth_TM
        DataSetName = 'odsOstByMonth_TM'
        RowCount = 0
        Stretched = True
        object Memo57: TfrxMemoView
          Width = 264.567100000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' '#1056#1029#1056#176' '#1056#1108#1056#1109#1056#1029#1056#181#1057#8224' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 264.567100000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_END_MED'
          DataSet = fdmMain.frxDBOstByMonth_TM
          DataSetName = 'odsOstByMonth_TM'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsOstByMonth_TM."FN_END_MED"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 377.953000000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_END_VES'
          DataSet = fdmMain.frxDBOstByMonth_TM
          DataSetName = 'odsOstByMonth_TM'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsOstByMonth_TM."FN_END_VES"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[<odsOstByMonth_TM."FN_END_MED"> +'
            ' <odsOstByMonth_TM."FN_END_VES"> +'
            ' <odsOstByMonth_TM."FN_END_PEREV">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 491.338900000000000000
          Width = 113.385900000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_END_PEREV'
          DataSet = fdmMain.frxDBOstByMonth_TM
          DataSetName = 'odsOstByMonth_TM'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[odsOstByMonth_TM."FN_END_PEREV"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 570.709030000000000000
        Width = 718.110700000000000000
        object Memo52: TfrxMemoView
          Width = 264.567100000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 264.567100000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<odsRashDocs_TM."FN_MED">,MasterData6)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 377.953000000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<odsRashDocs_TM."FN_VES">,MasterData6)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[SUM( <odsRashDocs_TM."FN_MED">+<odsRashDocs_TM."FN_VES">+<odsRa' +
              'shDocs_TM."FN_PEREV">,MasterData6)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 491.338900000000000000
          Width = 113.385900000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<odsRashDocs_TM."FN_PEREV">,MasterData6)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
end
