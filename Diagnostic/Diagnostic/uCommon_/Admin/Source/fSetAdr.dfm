object frmSetAdr: TfrmSetAdr
  Left = 283
  Top = 119
  BorderStyle = bsDialog
  Caption = #1044#1086#1084#1072#1096#1085#1080#1081' '#1072#1076#1088#1077#1089' '#1082#1083#1080#1077#1085#1090#1072
  ClientHeight = 443
  ClientWidth = 637
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
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 631
    Height = 397
    Align = alTop
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 16
      Top = 12
      Caption = #1057#1090#1088#1086#1082#1072' '#1072#1076#1088#1077#1089#1072':'
    end
    object lbAdr: TcxLabel
      Left = 106
      Top = 12
      Caption = '--'
    end
    object grStreet: TcxGrid
      Left = 16
      Top = 35
      Width = 601
      Height = 310
      TabOrder = 2
      LookAndFeel.SkinName = 'Caramel'
      object TVSTREET: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        OnCellDblClick = TVSTREETCellDblClick
        DataController.DataSource = ds
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        OptionsView.Indicator = True
        object VSTREET_NAME: TcxGridDBColumn
          Caption = #1059#1083#1080#1094#1072
          DataBinding.FieldName = 'FC_NAME'
        end
        object VSTREET_PREFIX: TcxGridDBColumn
          Caption = #1055#1088#1077#1092#1080#1082#1089
          DataBinding.FieldName = 'FC_PREFIX'
        end
      end
      object grStreetLevel1: TcxGridLevel
        GridView = TVSTREET
      end
    end
    object cxLabel3: TcxLabel
      Left = 16
      Top = 360
      Caption = #1044#1086#1084':'
    end
    object cxLabel4: TcxLabel
      Left = 208
      Top = 360
      Caption = #1055#1086#1076#1098#1077#1079#1076':'
    end
    object teHouse: TcxTextEdit
      Left = 50
      Top = 360
      ParentFont = False
      Properties.OnChange = teHousePropertiesChange
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 5
      Width = 103
    end
    object teHall: TcxTextEdit
      Left = 267
      Top = 360
      ParentFont = False
      Properties.OnChange = teHallPropertiesChange
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 6
      Width = 103
    end
  end
  object bOk: TcxButton
    Left = 478
    Top = 410
    Width = 75
    Height = 25
    Action = aOk
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
  end
  object cxButton1: TcxButton
    Left = 559
    Top = 410
    Width = 75
    Height = 25
    Action = aCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.SkinName = 'Caramel'
  end
  object cxLabel2: TcxLabel
    Left = 19
    Top = 413
    Caption = #1044#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' '#1084#1099#1096#1082#1086#1081' '#1085#1072' '#1089#1087#1080#1089#1082#1077', '#1095#1090#1086#1073#1099' '#1074#1099#1073#1088#1072#1090#1100' '#1091#1083#1080#1094#1091
  end
  object al: TActionList
    Left = 435
    Top = 83
    object aOk: TAction
      Caption = 'Ok'
      Enabled = False
      Hint = 'OK'
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object ds: TDataSource
    DataSet = ods
    Left = 227
    Top = 131
  end
  object ods: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name, fc_prefix'
      '  from taxi.tkladr'
      
        ' where fk_owner = (select substr(fc_value, 1, instr(fc_value, '#39';' +
        #39')-1) from taxi.tparams where fc_key = '#39'TOWN'#39')')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000900000046435F505245464958010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 227
    Top = 179
  end
end
