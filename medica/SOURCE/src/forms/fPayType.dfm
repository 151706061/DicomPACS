inherited frmPayType: TfrmPayType
  Width = 391
  HelpContext = 11
  Caption = #1058#1080#1087#1099' '#1086#1087#1083#1072#1090
  HelpFile = 'StMedsestra.chm'
  OldCreateOrder = True
  ShowHint = True
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  inherited ControlBar1: TControlBar
    Width = 383
  end
  inherited pcBrws: TPageControl
    Width = 383
    inherited tsBrws: TTabSheet
      inherited grBrws: TdxDBGrid
        Width = 375
        Filter.Criteria = {00000000}
        object grBrwsFC_NAME: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FC_NAME'
        end
        object grBrwsFK_ID: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FK_ID'
        end
      end
    end
    inherited tsForm: TTabSheet
      inherited Panel1: TPanel
        Width = 375
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
        object deName: TdxDBEdit
          Left = 65
          Top = 8
          Width = 304
          Hint = #1053#1072#1079#1074#1072#1085#1080#1077
          TabOrder = 0
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FC_NAME'
          DataSource = dsBrws
        end
      end
    end
  end
  inherited FormStorage: TJvFormStorage
    Active = True
    AppStorage = dmMain.JvAppRegistryStorage
  end
  inherited dsBrws: TDataSource
    DataSet = odsBrws
  end
  object odsBrws: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWID,TPAYTYPE.* FROM MED.TPAYTYPE'
      'ORDER BY FC_NAME')
    SequenceField.Field = 'FK_ID'
    SequenceField.Sequence = 'SEQ_TPAYTYPE'
    SequenceField.ApplyMoment = amOnServer
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 34
    Top = 152
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
  end
end
