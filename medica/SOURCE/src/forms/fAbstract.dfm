object frmAbstract: TfrmAbstract
  Left = 288
  Top = 173
  Width = 376
  Height = 396
  Caption = 'Аннотация'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 368
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 38
        Width = 364
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 351
      Height = 38
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 51
      Caption = 'ToolBar1'
      Flat = True
      Images = frmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = aClose
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 42
    Width = 368
    Height = 327
    Align = alClient
    TabOrder = 1
    object gbDescription: TGroupBox
      Left = 5
      Top = 2
      Width = 359
      Height = 320
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Описание:'
      TabOrder = 0
      object reDescription: TRichEdit
        Left = 6
        Top = 14
        Width = 347
        Height = 300
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clBtnFace
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object ActionList1: TActionList
    Images = frmMain.ilMain
    Left = 187
    Top = 4
    object aClose: TAction
      Caption = 'Закрыть'
      Hint = 'Закрыть'
      ImageIndex = 8
      ShortCut = 27
      OnExecute = aCloseExecute
    end
  end
  object FormStorage: TJvFormStorage
    StoredValues = <>
    Left = 21
    Top = 280
  end
  object odsDescription: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      'n.fk_id AS "Код номентклатуры",'
      'n.fk_prep "Код препарата",'
      'tn.fc_name AS "Торговое название",'
      'ln.fc_name AS "Латинское название",'
      'Get_PharmGroupList(p.fk_id) AS "Фарм.группа",'
      'Get_ActmattersList(p.fk_id) AS "НДВ",'
      'Get_Icd10List(p.fk_id) AS "Нозологическая класс.(МКБ-10)",'
      'Get_AtxList(p.fk_id) AS "АТХ",'
      'dt.composition AS "Состав и форма выпуска",'
      'dt.drugformdescr AS "Описание лекарственной формы",'
      'dt.characters AS "Характеристика",'
      'GET_PHARMACTDESC(dt.fk_id) AS "Описание ф.д.",'
      'dt.pharmaactions AS "Фармакологическое действие",'
      'dt.componentsproperties AS "Свойства компонентов",'
      'dt.pharmakinetic AS "Фармакокинетика",'
      'dt.pharmadynamic AS "Фармакодинамика",'
      'dt.clinicalpharmacology AS "Клиническая фармакология",'
      'dt.direction AS "Инструкция",'
      'dt.indications AS "Показания",'
      'dt.recommendations AS "Рекомендуется",'
      'dt.contraindications AS "Противопоказания",'
      'dt.sideactions AS "Побочные действия",'
      'dt.interactions AS "Взаимодействие",'
      'dt.usemethodanddoses AS "Способ применения и дозы",'
      'dt.overdose AS "Передозировка",'
      'dt.pregnancyuse AS "Прим. при берем. и корм.грудью",'
      'dt.specialguidelines AS "Особые указания",'
      'dt.precautions AS "Меры предосторожности",'
      'dt.literature AS "Литература",'
      'dt.fb_comment AS "Комментарий",'
      'dl.fc_text AS "Срок годности",'
      
        'CASE WHEN p.listtype IS NULL THEN '#39#39' ELSE '#39'Список '#39'||p.listtype|' +
        '|'#39'.'#39' END ||'
      #39' '#39'||dsc.fc_text AS "Условия хранения",'
      'n.eancode AS "Код EAN",'
      
        'fn.fc_name||CASE WHEN f.fk_country > 0 THEN '#39' ('#39'||c.fc_name||'#39')'#39 +
        ' ELSE '#39#39' END AS "Фирма поместившая инф. в РЛС"'
      
        'FROM Rls.TNomen n, Rls.Tprep p, Rls.Ttradenames tn, Rls.Tlatinna' +
        'mes ln, '
      
        'Rls.Tnomen_Desc nd, Rls.Tdescriptions d, Rls.Tdesctextes dt, Rls' +
        '.Tdruglifetime dl,'
      
        'Rls.Tdrugstorcond dsc, Rls.Tfirms f, Rls.Tfirmnames fn, Rls.Tcou' +
        'ntries c'
      'WHERE n.fk_prep = p.fk_id'
      '  AND p.fk_tradename = tn.fk_id'
      '  AND p.fk_latinname = ln.fk_id'
      '  AND n.fk_id = nd.fk_nomen (+)'
      '  AND nd.fk_desc = d.fk_id (+)'
      '  AND nd.fk_desc = dt.fk_id (+)'
      '  AND n.fk_life = dl.fk_id '
      '  AND n.fk_drugstorcond = dsc.fk_id '
      '  AND d.fk_firm = f.fk_id (+)'
      '  AND f.fk_name = fn.fk_id (+)'
      '  AND f.fk_country = c.fk_id (+)'
      '  AND n.fk_id = :fk_id')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A464B5F4944030000000000000000000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    QBEDefinition.QBEFieldDefs = {
      030000002200000011000000CAEEE420EDEEECE5EDF2EAEBE0F2F3F0FB010000
      00000D000000CAEEE420EFF0E5EFE0F0E0F2E0010000000011000000D2EEF0E3
      EEE2EEE520EDE0E7E2E0EDE8E5010000000012000000CBE0F2E8EDF1EAEEE520
      EDE0E7E2E0EDE8E501000000000B000000D4E0F0EC2EE3F0F3EFEFE001000000
      0003000000CDC4C201000000001D000000CDEEE7EEEBEEE3E8F7E5F1EAE0FF20
      EAEBE0F1F12E28CCCAC12D313029010000000003000000C0D2D5010000000016
      000000D1EEF1F2E0E220E820F4EEF0ECE020E2FBEFF3F1EAE001000000001C00
      0000CEEFE8F1E0EDE8E520EBE5EAE0F0F1F2E2E5EDEDEEE920F4EEF0ECFB0100
      0000000E000000D5E0F0E0EAF2E5F0E8F1F2E8EAE001000000001A000000D4E0
      F0ECE0EAEEEBEEE3E8F7E5F1EAEEE520E4E5E9F1F2E2E8E50100000000140000
      00D1E2EEE9F1F2E2E020EAEEECEFEEEDE5EDF2EEE201000000000F000000D4E0
      F0ECE0EAEEEAE8EDE5F2E8EAE001000000000F000000D4E0F0ECE0EAEEE4E8ED
      E0ECE8EAE0010000000018000000CAEBE8EDE8F7E5F1EAE0FF20F4E0F0ECE0EA
      EEEBEEE3E8FF01000000000A000000C8EDF1F2F0F3EAF6E8FF01000000000900
      0000CFEEEAE0E7E0EDE8FF01000000000D000000D0E5EAEEECE5EDE4F3E5F2F1
      FF010000000010000000CFF0EEF2E8E2EEEFEEEAE0E7E0EDE8FF010000000011
      000000CFEEE1EEF7EDFBE520E4E5E9F1F2E2E8FF01000000000E000000C2E7E0
      E8ECEEE4E5E9F1F2E2E8E5010000000018000000D1EFEEF1EEE120EFF0E8ECE5
      EDE5EDE8FF20E820E4EEE7FB01000000000D000000CFE5F0E5E4EEE7E8F0EEE2
      EAE001000000001E000000CFF0E8EC2E20EFF0E820E1E5F0E5EC2E20E820EAEE
      F0EC2EE3F0F3E4FCFE01000000000F000000CEF1EEE1FBE520F3EAE0E7E0EDE8
      FF010000000015000000CCE5F0FB20EFF0E5E4EEF1F2EEF0EEE6EDEEF1F2E801
      000000000A000000CBE8F2E5F0E0F2F3F0E001000000000B000000CAEEECECE5
      EDF2E0F0E8E901000000000D000000D1F0EEEA20E3EEE4EDEEF1F2E801000000
      0010000000D3F1EBEEE2E8FF20F5F0E0EDE5EDE8FF010000000007000000CAEE
      E42045414E01000000001C000000D4E8F0ECE020EFEEECE5F1F2E8E2F8E0FF20
      E8EDF42E20E220D0CBD101000000000D000000CEEFE8F1E0EDE8E520F42EE42E
      0100000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = frmMain.os
    DesignActivation = False
    Active = False
    Left = 297
    Top = 84
    object odsDescriptionDSDesigner: TFloatField
      FieldName = 'Код номентклатуры'
      Required = True
    end
    object odsDescriptionDSDesigner2: TFloatField
      FieldName = 'Код препарата'
    end
    object odsDescriptionDSDesigner3: TStringField
      FieldName = 'Торговое название'
      Size = 260
    end
    object odsDescriptionDSDesigner4: TStringField
      FieldName = 'Латинское название'
      Size = 160
    end
    object odsDescriptionDSDesigner5: TStringField
      FieldName = 'Фарм.группа'
      Size = 90
    end
    object odsDescriptionDSDesigner6: TStringField
      FieldName = 'НДВ'
      Size = 100
    end
    object odsDescriptionDSDesigner10: TStringField
      FieldName = 'Нозологическая класс.(МКБ-10)'
      Size = 300
    end
    object odsDescriptionDSDesigner7: TStringField
      FieldName = 'АТХ'
      Size = 130
    end
    object odsDescriptionDSDesigner8: TMemoField
      FieldName = 'Состав и форма выпуска'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner9: TMemoField
      FieldName = 'Описание лекарственной формы'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner11: TMemoField
      FieldName = 'Характеристика'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner12: TStringField
      FieldName = 'Описание ф.д.'
      Size = 4000
    end
    object odsDescriptionDSDesigner13: TMemoField
      FieldName = 'Фармакологическое действие'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner14: TMemoField
      FieldName = 'Свойства компонентов'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner15: TMemoField
      FieldName = 'Фармакокинетика'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner16: TMemoField
      FieldName = 'Фармакодинамика'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner17: TMemoField
      FieldName = 'Клиническая фармакология'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner18: TMemoField
      FieldName = 'Инструкция'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner19: TMemoField
      FieldName = 'Показания'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner20: TMemoField
      FieldName = 'Рекомендуется'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner21: TMemoField
      FieldName = 'Противопоказания'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner22: TMemoField
      FieldName = 'Побочные действия'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner23: TMemoField
      FieldName = 'Взаимодействие'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner24: TMemoField
      FieldName = 'Способ применения и дозы'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner25: TMemoField
      FieldName = 'Передозировка'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner26: TMemoField
      FieldName = 'Прим. при берем. и корм.грудью'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner27: TMemoField
      FieldName = 'Особые указания'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner28: TMemoField
      FieldName = 'Меры предосторожности'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner29: TMemoField
      FieldName = 'Литература'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner30: TMemoField
      FieldName = 'Комментарий'
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner31: TStringField
      FieldName = 'Срок годности'
      Size = 40
    end
    object odsDescriptionDSDesigner32: TStringField
      FieldName = 'Условия хранения'
      Size = 150
    end
    object odsDescriptionEAN: TStringField
      FieldName = 'Код EAN'
      Size = 13
    end
    object odsDescriptionDSDesigner33: TStringField
      FieldName = 'Фирма поместившая инф. в РЛС'
      Size = 150
    end
  end
end
