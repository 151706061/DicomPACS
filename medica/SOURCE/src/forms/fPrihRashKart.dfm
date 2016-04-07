object frmPrihRashKart: TfrmPrihRashKart
  Left = 547
  Top = 356
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Партия медикаментов'
  ClientHeight = 338
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 494
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 490
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 477
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 60
      EdgeBorders = []
      Flat = True
      Images = dmMain.ilMain
      ShowCaptions = True
      TabOrder = 0
      object btnSave: TToolButton
        Left = 0
        Top = 0
        Action = actSave
        ParentShowHint = False
        ShowHint = True
      end
      object btnCancel: TToolButton
        Left = 60
        Top = 0
        Action = actCancel
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  inline FrameKartFields1: TFrameKartFields
    Top = 44
    Width = 494
    Height = 294
    Align = alClient
    TabOrder = 1
    inherited cxGroupBox2: TcxGroupBox
      Width = 494
      inherited sePrice_: TdxSpinEdit
        StoredValues = 8
      end
      inherited seKol: TdxSpinEdit
        StoredValues = 25
      end
    end
    inherited cxGroupBox1: TcxGroupBox
      Width = 494
      inherited lcbEdizm: TDBLookupComboBox
        Left = 414
        Top = 84
      end
    end
    inherited dsEdizm: TDataSource
      Left = 264
    end
    inherited odsEdizm: TOracleDataSet
      QBEDefinition.QBEFieldDefs = {04000000010000000700000046435F4E414D45010000000000}
      Left = 216
      Top = 62
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 160
    Top = 8
    object actSave: TAction
      Caption = 'Сохранить'
      Hint = 'Сохранить'
      ImageIndex = 9
      ShortCut = 113
      OnExecute = actSaveExecute
    end
    object actCancel: TAction
      Caption = 'Отмена'
      Hint = 'Отменить изменения'
      ImageIndex = 8
      ShortCut = 27
      OnExecute = actCancelExecute
    end
    object actCardSelect: TAction
      Caption = 'actCardSelect'
      ShortCut = 32
      OnExecute = SpeedButton1Click
    end
    object acSecret: TAction
      Caption = 'acSecret'
      Enabled = False
      ShortCut = 49232
      OnExecute = acSecretExecute
    end
  end
  object odskartList: TOracleDataSet
    SQL.Strings = (
      '/*SELECT '
      
        'TMEDIC.fc_name prep_name, TEI.EIID EIID, TEI.FC_NAME AS EINAME, ' +
        'TMEDIC.FN_FPACKINUPACK, TMEDIC.FK_FPACKID '
      'FROM '
      ' MED. TMEDIC, MED.TEI'
      'WHERE'
      'TMEDIC.MEDICID = :MEDICID'
      'AND TMEDIC.EIID = TEI.EIID'
      'AND TMEDIC.FL_VISIBLE = 1'
      '*/'
      'SELECT'
      '    TKART.*,'
      '    TEI.EIID,'
      '    TEI.FC_NAME AS EINAME,'
      '    TKART.FC_PRODUCER AS PROD,'
      '    TKART.FC_CERTIFICATE AS CERT,'
      '    TMEDIC.FN_FPACKINUPACK,'
      '    TMEDIC.FK_FPACKID'
      '  FROM MED.TKART, MED.TMEDIC, MED.TEI'
      '  WHERE TKART.FL_DEL = 0'
      '    AND TKART.MEDICID = TMEDIC.MEDICID'
      '    AND TMEDIC.EIID = TEI.EIID'
      '    AND KARTID = :AKARTID'
      '    AND TMEDIC.FL_VISIBLE = 1')
    Variables.Data = {
      0300000001000000080000003A414B4152544944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000012000000060000004B4152544944010000000000040000004D4F4944
      01000000000006000000464C5F44454C010000000000070000004D4544494349
      440100000000000700000046435F4E414D450100000000000900000046435F53
      455249414C0100000000000800000046445F474F44454E010000000000060000
      0045494E414D450100000000000D000000464E5F50524F444345525449440100
      000000000E00000046435F43455254494649434154450100000000000B000000
      46435F50524F44554345520100000000000400000050524F4401000000000004
      0000004345525401000000000004000000454949440100000000000F00000046
      4E5F465041434B494E555041434B0100000000000A000000464B5F465041434B
      49440100000000000C000000464E5F4D4F47524F555049440100000000000C00
      0000464E5F50415254595F4E554D010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 68
    Top = 236
    object odskartListFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Size = 255
    end
    object odskartListEINAME: TStringField
      FieldName = 'EINAME'
      Required = True
      Size = 10
    end
    object odskartListKARTID: TIntegerField
      FieldName = 'KARTID'
      Required = True
    end
    object odskartListPROD: TStringField
      FieldName = 'PROD'
      Size = 256
    end
    object odskartListCERT: TStringField
      FieldName = 'CERT'
      Size = 256
    end
    object odskartListEIID: TIntegerField
      FieldName = 'EIID'
      Required = True
    end
    object odskartListMEDICID: TIntegerField
      FieldName = 'MEDICID'
      Required = True
    end
    object odskartListFN_FPACKINUPACK: TFloatField
      FieldName = 'FN_FPACKINUPACK'
    end
    object odskartListFK_FPACKID: TFloatField
      FieldName = 'FK_FPACKID'
    end
  end
  object dsKartList: TDataSource
    DataSet = odskartList
    Left = 10
    Top = 236
  end
  object odsDpc: TOracleDataSet
    SQL.Strings = (
      'select'
      '    tdpc.*'
      'from MED.tdpc'
      'where kartid = :akartid')
    Variables.Data = {
      0300000001000000080000003A414B4152544944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000009000000050000004450434944010000000000040000004450494401
      0000000000060000004B415254494401000000000006000000464E5F4B4F4C01
      000000000007000000464E5F53554D4D0100000000000B000000464E5F4E4557
      505249434501000000000008000000464E5F5052494345010000000000060000
      00464E5F53454C0100000000000A000000464E5F545245424B4F4C0100000000
      00}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 390
    Top = 236
    object odsDpcFN_KOL: TFloatField
      FieldName = 'FN_KOL'
    end
    object odsDpcFN_SUMM: TFloatField
      FieldName = 'FN_SUMM'
    end
  end
  object dsDpc: TDataSource
    DataSet = odsDpc
    Left = 344
    Top = 236
  end
end
