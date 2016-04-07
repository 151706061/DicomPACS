inherited frmSpecialMedic: TfrmSpecialMedic
  Left = 491
  Top = 196
  HelpContext = 53
  Caption = #1053#1072#1088#1082#1086#1090#1080#1095#1077#1089#1082#1080#1077', '#1089#1080#1083#1100#1085#1086#1076#1077#1081#1089#1090#1074'. '#1080' '#1103#1076#1086#1074#1080#1090#1099#1077' '#1074#1077#1097'-'#1074#1072': '
  OldCreateOrder = True
  ShowHint = True
  OnHelp = FormHelp
  ExplicitWidth = 606
  ExplicitHeight = 333
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcBrws: TPageControl
    ActivePage = tsForm
    inherited tsBrws: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 590
      ExplicitHeight = 248
      inherited grBrws_: TcxGrid
        inherited grBrws_DBTableView: TcxGridDBTableView
          object grBrws_DBTableViewFC_NAME: TcxGridDBColumn
            DataBinding.FieldName = 'FC_NAME'
            Width = 530
          end
          object grBrws_DBTableViewFK_ID: TcxGridDBColumn
            DataBinding.FieldName = 'FK_ID'
            Width = 58
          end
        end
      end
    end
    inherited tsForm: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 590
      ExplicitHeight = 248
      inherited Panel1: TPanel
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
        object deName: TcxDBButtonEdit
          Left = 67
          Top = 4
          Hint = #1053#1072#1079#1074#1072#1085#1080#1077
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'FC_NAME'
          DataBinding.DataSource = dsBrws
          Properties.Buttons = <
            item
              Default = True
              Enabled = False
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.CharCase = ecUpperCase
          Properties.OnButtonClick = deNameButtonClick
          Style.BorderStyle = ebs3D
          TabOrder = 0
          Width = 520
        end
      end
    end
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
      
        'SELECT TSPECIALMEDIC.ROWID,TSPECIALMEDIC.* FROM MED.TSPECIALMEDI' +
        'C'
      'WHERE FK_ID > 0'
      'ORDER BY FC_NAME')
    Optimize = False
    SequenceField.Field = 'FK_ID'
    SequenceField.Sequence = 'MED.SEQ_TSPECIALMEDIC'
    SequenceField.ApplyMoment = amOnServer
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 36
    Top = 144
  end
end
