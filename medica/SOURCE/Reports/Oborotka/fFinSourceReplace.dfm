object frmFinSourceReplace: TfrmFinSourceReplace
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1079#1072#1084#1077#1085#1099' '#1080#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
  ClientHeight = 303
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 538
    Height = 265
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -8
    object tvMain: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsMain
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object tvMainFK_ID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_ID'
        Visible = False
        VisibleForCustomization = False
      end
      object tvMainMEDICID: TcxGridDBColumn
        Caption = #1054#1073#1098#1077#1082#1090' '#1091#1095#1077#1090#1072
        DataBinding.FieldName = 'MEDICID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'MEDICID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsMedic
        Width = 150
      end
      object tvMainFK_FINSOURCE_PRIH: TcxGridDBColumn
        Caption = #1048#1089#1090'. '#1092#1080#1085'. '#1087#1088#1080#1093#1086#1076#1072
        DataBinding.FieldName = 'FK_FINSOURCE_PRIH'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsFinsource
        Width = 50
      end
      object tvMainFK_FINSOURCE_RASH: TcxGridDBColumn
        Caption = #1048#1089#1090'. '#1092#1080#1085'. '#1088#1072#1089#1093#1086#1076#1072
        DataBinding.FieldName = 'FK_FINSOURCE_RASH'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'FK_ID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsFinsource
        Width = 50
      end
      object tvMainFD_DATE: TcxGridDBColumn
        Caption = #1053#1072#1095#1072#1083#1086' '#1076#1077#1081#1089#1090#1074#1080#1103
        DataBinding.FieldName = 'FD_DATE'
        Width = 30
      end
    end
    object lvMain: TcxGridLevel
      GridView = tvMain
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 265
    Width = 538
    Height = 38
    Align = alBottom
    TabOrder = 1
    object btSave: TcxButton
      Left = 368
      Top = 6
      Width = 75
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = btSaveClick
    end
    object btCancel: TcxButton
      Left = 456
      Top = 6
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btCancelClick
    end
    object btAdd: TcxButton
      Left = 8
      Top = 6
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = btAddClick
    end
    object btEdit: TcxButton
      Left = 89
      Top = 6
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 3
      OnClick = btEditClick
    end
    object btDelete: TcxButton
      Left = 170
      Top = 6
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 4
      OnClick = btDeleteClick
    end
  end
  object odsMain: TOracleDataSet
    SQL.Strings = (
      
        'select t.rowid, t.fk_id, t.medicid, t.fd_date, t.fk_finsource_pr' +
        'ih, t.fk_finsource_rash from med.tfinsource_replace t')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F4944010000000000070000004D45444943
      49440100000000000700000046445F4441544501000000000011000000464B5F
      46494E534F555243455F5052494801000000000011000000464B5F46494E534F
      555243455F52415348010000000000}
    CommitOnPost = False
    Session = frmGetPeriod.os
    AfterOpen = odsMainAfterOpen
    Left = 304
    Top = 48
  end
  object dsMain: TDataSource
    DataSet = odsMain
    Left = 352
    Top = 48
  end
  object odsFinsource: TOracleDataSet
    SQL.Strings = (
      'select t.fk_id, t.fc_name from med.tfinsource t')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F4944010000000000070000004D45444943
      49440100000000000700000046445F4441544501000000000011000000464B5F
      46494E534F555243455F5052494801000000000011000000464B5F46494E534F
      555243455F52415348010000000000}
    Session = frmGetPeriod.os
    Left = 208
    Top = 120
  end
  object dsFinsource: TDataSource
    DataSet = odsFinsource
    Left = 256
    Top = 120
  end
  object dsMedic: TDataSource
    DataSet = odsMedic
    Left = 136
    Top = 176
  end
  object odsMedic: TOracleDataSet
    SQL.Strings = (
      'select t.medicid, t.fc_name from med.tmedic t')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F4944010000000000070000004D45444943
      49440100000000000700000046445F4441544501000000000011000000464B5F
      46494E534F555243455F5052494801000000000011000000464B5F46494E534F
      555243455F52415348010000000000}
    Session = frmGetPeriod.os
    Left = 88
    Top = 176
  end
end
