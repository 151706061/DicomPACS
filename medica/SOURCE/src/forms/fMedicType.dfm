inherited frmMedictype: TfrmMedictype
  Left = 209
  Top = 217
  Width = 559
  Height = 309
  HelpContext = 51
  Caption = #1058#1080#1087#1099' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074
  OldCreateOrder = True
  ShowHint = True
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  inherited ControlBar1: TControlBar
    Width = 551
  end
  inherited pcBrws: TPageControl
    Width = 551
    Height = 250
    inherited tsBrws: TTabSheet
      inherited grBrws: TdxDBGrid
        Width = 543
        Height = 222
        Filter.Criteria = {00000000}
        object grBrwsFC_NAME: TdxDBGridMaskColumn
          Width = 109
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FC_NAME'
        end
        object grBrwsFC_ACCOUNT: TdxDBGridMaskColumn
          Visible = False
          Width = 66
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FC_ACCOUNT'
        end
        object grBrwsFC_REPORTTITLE: TdxDBGridMaskColumn
          Visible = False
          Width = 109
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FC_REPORTTITLE'
        end
        object grBrwsFC_SMSTITLE: TdxDBGridMaskColumn
          Visible = False
          Width = 109
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FC_SMSTITLE'
        end
        object grBrwslkUchgrtype: TdxDBGridLookupColumn
          Width = 72
          BandIndex = 0
          RowIndex = 0
          FieldName = 'lkUchgrtype'
        end
        object grBrwsFK_ID: TdxDBGridMaskColumn
          Visible = False
          Width = 80
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FK_ID'
        end
      end
    end
    inherited tsForm: TTabSheet
      inherited Panel1: TPanel
        Width = 543
        Height = 215
        object lbUchGrType: TLabel
          Left = 4
          Top = 38
          Width = 103
          Height = 13
          Caption = #1058#1080#1087' '#1091#1095#1077#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 8
          Top = 92
          Width = 125
          Height = 13
          Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1086#1090#1095#1077#1090#1072' ('#1057#1052#1057'):'
          Visible = False
        end
        object Label2: TLabel
          Left = 8
          Top = 65
          Width = 152
          Height = 13
          Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1086#1090#1095#1077#1090#1072' ('#1055#1088#1086#1074#1080#1079#1086#1088'):'
          Visible = False
        end
        object Label1: TLabel
          Left = 8
          Top = 38
          Width = 26
          Height = 13
          Caption = #1057#1095#1077#1090':'
          Visible = False
        end
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
        object lcbUchGrType: TdxDBLookupEdit
          Left = 113
          Top = 35
          Width = 425
          Hint = #1058#1080#1087' '#1091#1095#1077#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099
          TabOrder = 4
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FK_TUCHGRTYPE'
          DataSource = dsBrws
          ReadOnly = False
          ListFieldName = 'FC_NAME'
          Revertable = True
          KeyFieldName = 'FK_ID'
          ListSource = dmMain.dsUchGrType
          LookupKeyValue = Null
          StoredValues = 64
        end
        object deCaption2: TdxDBButtonEdit
          Left = 163
          Top = 89
          Width = 375
          Hint = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1086#1090#1095#1077#1090#1072' ('#1057#1052#1057')'
          TabOrder = 3
          Visible = False
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FC_SMSTITLE'
          DataSource = dsBrws
          ReadOnly = False
          Buttons = <
            item
              Default = True
            end>
          OnButtonClick = deCaption1ButtonClick
          StoredValues = 64
          ExistButtons = True
        end
        object deCaption1: TdxDBButtonEdit
          Left = 163
          Top = 62
          Width = 375
          Hint = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1086#1090#1095#1077#1090#1072' ('#1055#1088#1086#1074#1080#1079#1086#1088')'
          TabOrder = 2
          Visible = False
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FC_REPORTTITLE'
          DataSource = dsBrws
          Buttons = <
            item
              Default = True
            end>
          OnButtonClick = deCaption1ButtonClick
          ExistButtons = True
        end
        object deAccount: TdxDBEdit
          Left = 65
          Top = 35
          Width = 472
          Hint = #1057#1095#1077#1090
          TabOrder = 1
          Visible = False
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FC_ACCOUNT'
          DataSource = dsBrws
        end
        object deName: TdxDBEdit
          Left = 65
          Top = 8
          Width = 472
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
  inherited FormStorage: TJvFormStorage
    Active = True
    AppStorage = nil
    Left = 248
    Top = 187
  end
  inherited dsBrws: TDataSource
    DataSet = odsBrws
    Top = 184
  end
  object odsBrws: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWID,TMEDICTYPE.* FROM MED.TMEDICTYPE'
      'ORDER BY FC_NAME')
    SequenceField.Field = 'FK_ID'
    SequenceField.Sequence = 'MED.SEQ_TMEDICTYPE'
    SequenceField.ApplyMoment = amOnServer
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F4143434F554E540100000000000E000000
      46435F5245504F52545449544C450100000000000D000000464B5F5455434847
      52545950450100000000000B00000046435F534D535449544C45010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    DesignActivation = True
    Left = 34
    Top = 136
    object odsBrwsFK_ID: TIntegerField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 40
      FieldName = 'FK_ID'
    end
    object odsBrwsFC_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'FC_NAME'
      Size = 100
    end
    object odsBrwsFC_ACCOUNT: TStringField
      DisplayLabel = #1057#1095#1077#1090
      DisplayWidth = 60
      FieldName = 'FC_ACCOUNT'
      Size = 100
    end
    object odsBrwsFC_REPORTTITLE: TStringField
      DisplayLabel = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1086#1090#1095#1077#1090#1072' ('#1055#1088#1086#1074#1080#1079#1086#1088')'
      DisplayWidth = 100
      FieldName = 'FC_REPORTTITLE'
      Size = 1000
    end
    object odsBrwsFK_TUCHGRTYPE: TIntegerField
      FieldName = 'FK_TUCHGRTYPE'
    end
    object odsBrwsFC_SMSTITLE: TStringField
      DisplayLabel = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1086#1090#1095#1077#1090#1072' ('#1057#1052#1057')'
      DisplayWidth = 100
      FieldName = 'FC_SMSTITLE'
      Size = 1000
    end
    object odsBrwslkuchgrtype: TStringField
      DisplayLabel = #1058#1080#1087' '#1091#1095#1077#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099
      FieldKind = fkLookup
      FieldName = 'lkUchgrtype'
      LookupDataSet = dmMain.odsUchGrType
      LookupKeyFields = 'FK_ID'
      LookupResultField = 'FC_NAME'
      KeyFields = 'FK_TUCHGRTYPE'
      Size = 100
      Lookup = True
    end
  end
end
