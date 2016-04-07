object frmGetPeriod: TfrmGetPeriod
  Left = 553
  Top = 218
  HelpContext = 44
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 91
  ClientWidth = 295
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
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
    Width = 295
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 291
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 282
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
      object ToolButton3: TToolButton
        Left = 92
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object Panel1: TPanel
        Left = 100
        Top = 0
        Width = 159
        Height = 36
        Align = alClient
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object laMonthYear: TLabel
          Left = 0
          Top = 0
          Width = 159
          Height = 36
          Align = alClient
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 6
          ExplicitHeight = 20
        end
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 40
    Width = 295
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 1
    TabOrder = 1
    object Label2: TLabel
      Left = 21
      Top = 11
      Width = 77
      Height = 13
      Hint = #1042#1074#1086#1076' '#1085#1072#1095#1072#1083#1100#1085#1086#1081' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
      Caption = '&'#1042#1099#1073#1086#1088' '#1084#1077#1089#1103#1094#1072':'
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
      Left = 99
      Top = 6
      Hint = #1052#1077#1089#1103#1094' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1086#1090#1095#1077#1090#1072
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 12
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
      Left = 201
      Top = 6
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
    object rbuByOtd: TcxRadioButton
      Left = 21
      Top = 29
      Width = 113
      Height = 17
      Caption = #1087#1086' '#1086#1090#1076#1077#1083#1077#1085#1080#1103#1084
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object rbuByVid: TcxRadioButton
      Left = 153
      Top = 29
      Width = 113
      Height = 17
      Caption = #1087#1086' '#1074#1080#1076#1072#1084' '#1087#1086#1084#1086#1097#1080
      TabOrder = 3
    end
  end
  object ilImages: TImageList
    Left = 8
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
    Left = 208
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
  object os: TOracleSession
    LogonUsername = 'ASU'
    LogonPassword = 'ASU'
    LogonDatabase = 'ASU'
    Left = 12
    Top = 32
  end
  object odsRepSpisOnHighTek: TOracleDataSet
    SQL.Strings = (
      'select'
      '  sum(dp.fn_kol) as FN_KOL_SUM, '
      '  sum(dp.fn_kol*k.fn_price) as FN_SUMM_SUM,   '
      '  mg.fc_group as FC_MOGROUP,'
      '  sv.fc_name as FC_VID_POMOSHI'
      '  '
      'from'
      
        '  med.tdocs d, med.tdpc dp, med.tkart k, MED.TMO_GROUP mg, med.t' +
        'spisanievid sv'
      'where   '
      '    d.fp_vid = 3 and d.fp_vidmove = 14 and d.fl_edit = 0'
      'and d.dpid = dp.dpid'
      'and dp.kartid = k.kartid'
      'and d.fk_mogroupid_FROM = mg.GROUPID(+)'
      'and d.fk_mogroupid_TO = sv.fk_id(+)'
      'AND TRUNC(d.FD_DATA) between TRUNC(:DATE1) and TRUNC(:DATE2)'
      '--%rbuByOtd% GROUP BY mg.fc_group, sv.fc_name'
      '--%rbuByOtd% ORDER BY mg.fc_group, sv.fc_name'
      ''
      '--%rbuByVid% GROUP BY sv.fc_name, mg.fc_group'
      '--%rbuByVid% ORDER BY sv.fc_name, mg.fc_group')
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A44415445320C00000000000000000000000600
      00003A44415445310C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000A000000464E5F4B4F4C5F53554D0100000000000B000000
      464E5F53554D4D5F53554D0100000000000A00000046435F4D4F47524F555001
      00000000000E00000046435F5649445F504F4D4F534849010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 121
    Top = 36
  end
  object frDesigner: TfrDesigner
    Left = 127
    Top = 2
  end
  object frxRepSpisOnHighTek: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39639.741412939800000000
    ReportOptions.LastChange = 39774.390902222200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  FN_ALL_SUMM : DOUBLE;'
      '  FN_ALL_KOL_SUMM :DOUBLE;                      '
      '  FN_GROUP_SUMM : DOUBLE;'
      '  FN_GROUP_KOL_SUMM : DOUBLE;                            '
      '    '
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  FN_ALL_SUMM   := FN_ALL_SUMM     +<frxDBRepSpisOnHighTek."FN_S' +
        'UMM_SUM">;'
      
        '  FN_ALL_KOL_SUMM := FN_ALL_KOL_SUMM + <frxDBRepSpisOnHighTek."F' +
        'N_KOL_SUM">;'
      '    '
      
        '  FN_GROUP_SUMM := FN_GROUP_SUMM + <frxDBRepSpisOnHighTek."FN_SU' +
        'MM_SUM">;'
      
        '  FN_GROUP_KOL_SUMM := FN_GROUP_KOL_SUMM + <frxDBRepSpisOnHighTe' +
        'k."FN_KOL_SUM">;'
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  FN_ALL_SUMM       := 0;'
      '  FN_ALL_KOL_SUMM   := 0;'
      '  FN_GROUP_SUMM     := 0;'
      '  FN_GROUP_KOL_SUMM := 0;      '
      'end;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  FN_GROUP_SUMM     := 0;'
      '  FN_GROUP_KOL_SUMM := 0;                       '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxRepSpisOnHighTekGetValue
    Left = 158
    Top = 34
    Datasets = <
      item
        DataSet = frxDBRepSpisOnHighTek
        DataSetName = 'frxDBRepSpisOnHighTek'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object MasterData1: TfrxMasterData
        Height = 20.000000000000000000
        Top = 215.433210000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBRepSpisOnHighTek
        DataSetName = 'frxDBRepSpisOnHighTek'
        RowCount = 0
        Stretched = True
        object Memo6: TfrxMemoView
          Width = 44.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 44.220472440000000000
          Width = 401.763779530000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBRepSpisOnHighTek."FC_VID_POMOSHI"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 446.000000000000000000
          Width = 83.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBRepSpisOnHighTek."FN_KOL_SUM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 529.000000000000000000
          Width = 151.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBRepSpisOnHighTek."FN_SUMM_SUM"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 71.897650000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        Stretched = True
        object Memo14: TfrxMemoView
          Width = 680.315400000000000000
          Height = 71.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1111#1056#1109' '#1056#1030#1057#8249#1057#1027#1056#1109#1056#1108#1056#1105#1056#1112' '#1057#8218#1056#181#1057#8230#1056#1029#1056#1109#1056#187#1056#1109#1056#1110#1056#1105#1057#1039#1056#1112
            #1056#183#1056#176' [MonthYear]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 20.000000000000000000
        Top = 313.700990000000000000
        Width = 680.315400000000000000
        object Memo11: TfrxMemoView
          Left = 529.149660000000000000
          Width = 150.850340000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[FN_ALL_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 362.000000000000000000
          Width = 84.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight]
          Frame.Width = 1.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 445.984540000000000000
          Width = 82.818800000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[FN_ALL_KOL_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 393.071120000000000000
        Width = 680.315400000000000000
        object Memo12: TfrxMemoView
          Width = 680.315400000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 43.031496060000000000
        Top = 151.181200000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = 'frxDBRepSpisOnHighTek."FC_MOGROUP"'
        object Memo13: TfrxMemoView
          Top = 23.000000000000000000
          Width = 44.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 44.220472440000000000
          Top = 23.000000000000000000
          Width = 401.669140000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1056#1105#1056#1169' '#1056#1111#1056#1109#1056#1112#1056#1109#1057#8240#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 445.984540000000000000
          Top = 23.000000000000000000
          Width = 83.000000000000000000
          Height = 20.031496060000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 528.984540000000000000
          Top = 23.000000000000000000
          Width = 151.000000000000000000
          Height = 20.031496060000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Top = 1.000000000000000000
          Width = 677.574830000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181': [frxDBRepSpisOnHighTek."FC_MOGROUP"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 35.118120000000000000
        Top = 257.008040000000000000
        Width = 680.315400000000000000
        object Memo5: TfrxMemoView
          Left = 445.984540000000000000
          Width = 83.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[FN_GROUP_KOL_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 528.984540000000000000
          Width = 151.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[FN_GROUP_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 44.220472440000000000
          Width = 401.763779530000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1109#1057#8218#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1057#1035':  ')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page2: TfrxReportPage
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData2: TfrxMasterData
        Height = 20.000000000000000000
        Top = 215.433210000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBRepSpisOnHighTek
        DataSetName = 'frxDBRepSpisOnHighTek'
        RowCount = 0
        Stretched = True
        object Memo3: TfrxMemoView
          Width = 44.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 44.220472440000000000
          Width = 401.763779530000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBRepSpisOnHighTek."FC_MOGROUP"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 446.000000000000000000
          Width = 83.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBRepSpisOnHighTek."FN_KOL_SUM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 529.000000000000000000
          Width = 151.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBRepSpisOnHighTek."FN_SUMM_SUM"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle2: TfrxReportTitle
        Height = 71.897650000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        Stretched = True
        object Memo21: TfrxMemoView
          Width = 680.315400000000000000
          Height = 71.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1111#1056#1109' '#1056#1030#1057#8249#1057#1027#1056#1109#1056#1108#1056#1105#1056#1112' '#1057#8218#1056#181#1057#8230#1056#1029#1056#1109#1056#187#1056#1109#1056#1110#1056#1105#1057#1039#1056#1112
            #1056#183#1056#176' [MonthYear]')
          ParentFont = False
        end
      end
      object Footer2: TfrxFooter
        Height = 20.000000000000000000
        Top = 313.700990000000000000
        Width = 680.315400000000000000
        object Memo22: TfrxMemoView
          Left = 529.149660000000000000
          Width = 150.850340000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[FN_ALL_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 362.000000000000000000
          Width = 84.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight]
          Frame.Width = 1.500000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 445.984540000000000000
          Width = 82.818800000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[FN_ALL_KOL_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter2: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 393.071120000000000000
        Width = 680.315400000000000000
        object Memo25: TfrxMemoView
          Width = 680.315400000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 43.031496060000000000
        Top = 151.181200000000000000
        Width = 680.315400000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = 'frxDBRepSpisOnHighTek."FC_VID_POMOSHI"'
        object Memo26: TfrxMemoView
          Top = 23.000000000000000000
          Width = 44.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 44.220472440000000000
          Top = 23.000000000000000000
          Width = 401.669140000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 445.984540000000000000
          Top = 23.000000000000000000
          Width = 83.000000000000000000
          Height = 20.031496060000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 528.984540000000000000
          Top = 23.000000000000000000
          Width = 151.000000000000000000
          Height = 20.031496060000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Top = 1.000000000000000000
          Width = 677.574830000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1056#1105#1056#1169' '#1056#1111#1056#1109#1056#1112#1056#1109#1057#8240#1056#1105': [frxDBRepSpisOnHighTek."FC_VID_POMOSHI"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 35.118120000000000000
        Top = 257.008040000000000000
        Width = 680.315400000000000000
        object Memo30: TfrxMemoView
          Left = 445.984540000000000000
          Width = 83.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[FN_GROUP_KOL_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 528.984540000000000000
          Width = 151.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[FN_GROUP_SUMM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 44.220472440000000000
          Width = 401.763779530000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1030#1056#1105#1056#1169#1057#1107' '#1056#1111#1056#1109#1056#1112#1056#1109#1057#8240#1056#1105':  ')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object oqGetRepParam: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '  :res := asu.pkg_Smini.Readstring('#39'repSpisOnPac.exe'#39', '#39'PacByKon' +
        'tingentAndVidOpl'#39', 0);'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {0300000001000000040000003A5245530500000002000000300000000000}
    Left = 222
    Top = 40
  end
  object odsTSMINI: TOracleDataSet
    SQL.Strings = (
      
        'select sm.fk_id, sm.fc_section, sm.fc_key, sm.fc_value from asu.' +
        'tsmini sm'
      'where'
      ' UPPER(sm.fc_section) = UPPER(:aSection)'
      ' AND UPPER(sm.fc_key) = UPPER(:aKey)')
    Optimize = False
    Variables.Data = {
      0300000002000000090000003A4153454354494F4E0500000000000000000000
      00050000003A414B4559050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = os
    Left = 168
    Top = 2
  end
  object odsServerDate: TOracleDataSet
    SQL.Strings = (
      'select sysdate from dual')
    Optimize = False
    Session = os
    Left = 252
    Top = 6
  end
  object frxDBRepSpisOnHighTek: TfrxDBDataset
    UserName = 'frxDBRepSpisOnHighTek'
    CloseDataSource = True
    DataSet = odsRepSpisOnHighTek
    Left = 160
    Top = 56
  end
end
