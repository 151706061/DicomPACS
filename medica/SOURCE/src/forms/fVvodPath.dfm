inherited frmVvodPath: TfrmVvodPath
  Width = 385
  Height = 280
  HelpContext = 52
  Caption = #1055#1091#1090#1080' '#1074#1074#1077#1076#1077#1085#1080#1103
  OldCreateOrder = True
  ShowHint = True
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  inherited ControlBar1: TControlBar
    Width = 377
  end
  inherited pcBrws: TPageControl
    Width = 377
    Height = 221
    inherited tsBrws: TTabSheet
      inherited grBrws: TdxDBGrid
        Width = 369
        Height = 193
        Filter.Criteria = {00000000}
        object grBrwsFC_NAME: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FC_NAME'
        end
        object grBrwsFC_PROCCAB: TdxDBGridMaskColumn
          Alignment = taCenter
          Width = 300
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FC_PROCCAB'
        end
        object grBrwsFK_ID: TdxDBGridMaskColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FK_ID'
        end
      end
    end
    inherited tsForm: TTabSheet
      inherited Panel1: TPanel
        Width = 369
        Height = 186
        object lbName: TLabel
          Left = 8
          Top = 11
          Width = 53
          Height = 13
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cbProcCab: TdxDBCheckEdit
          Left = 4
          Top = 40
          Width = 145
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Alignment = taRightJustify
          Caption = #1055#1088#1086#1094#1077#1076#1091#1088#1085#1099#1081' '#1082#1072#1073#1080#1085#1077#1090
          DataField = 'FL_PROCCAB'
          DataSource = dsBrws
          ValueChecked = '1'
          ValueUnchecked = '0'
          StoredValues = 1
        end
        object deName: TdxDBEdit
          Left = 65
          Top = 8
          Width = 301
          Hint = #1053#1072#1079#1074#1072#1085#1080#1077
          TabOrder = 0
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          DataField = 'FC_NAME'
          DataSource = dsBrws
        end
      end
    end
  end
  inherited il: TImageList
    Left = 243
    Top = 55
  end
  inherited FormStorage: TJvFormStorage
    Active = True
    AppStorage = nil
  end
  inherited dsBrws: TDataSource
    DataSet = odsBrws
  end
  object odsBrws: TOracleDataSet
    SQL.Strings = (
      
        'SELECT ROWID,TVVODPATH.*,DECODE(TVVODPATH.FL_PROCCAB,0,'#39#1085#1077#1090#39',1,'#39 +
        #1076#1072#39') AS FC_PROCCAB'
      'FROM ASU.TVVODPATH'
      'WHERE FK_ID > 0'
      'ORDER BY FC_NAME')
    SequenceField.Field = 'FK_ID'
    SequenceField.Sequence = 'ASU.SEQ_TVVODPATH'
    SequenceField.ApplyMoment = amOnServer
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000009000000464B5F534D494449440100000000000800000046
      4E5F50524943450100000000000A000000464C5F50524F434341420100000000
      000A00000046435F50524F43434142010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 32
    Top = 152
    object odsBrwsFK_ID: TFloatField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 40
      FieldName = 'FK_ID'
    end
    object odsBrwsFC_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 150
      FieldName = 'FC_NAME'
      Size = 50
    end
    object odsBrwsFK_SMIDID: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1089#1074#1103#1079#1072#1085#1085#1099#1093' '#1087#1088#1086#1094#1077#1076#1091#1088
      FieldName = 'FK_SMIDID'
    end
    object odsBrwsFN_PRICE: TFloatField
      DisplayLabel = #1055#1086#1088#1086#1075' "'#1044#1086#1088#1086#1075#1086#1089#1090#1086#1103#1097#1080#1081'"'
      FieldName = 'FN_PRICE'
    end
    object odsBrwsFL_PROCCAB: TIntegerField
      DisplayLabel = #1055#1088#1086#1094#1077#1076#1091#1088#1085#1099#1081' '#1082#1072#1073#1080#1085#1077#1090
      FieldName = 'FL_PROCCAB'
    end
    object odsBrwsFC_PROCCAB: TStringField
      DisplayLabel = #1055#1088#1086#1094#1077#1076#1091#1088#1085#1099#1081' '#1082#1072#1073#1080#1085#1077#1090
      DisplayWidth = 100
      FieldName = 'FC_PROCCAB'
      Size = 3
    end
  end
end
