object FrmGetDevices: TFrmGetDevices
  Left = 244
  Top = 67
  Caption = #1057#1087#1080#1089#1086#1082' DICOM '#1091#1089#1090#1088#1086#1081#1089#1090#1074
  ClientHeight = 392
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 348
    Width = 637
    Height = 41
    Margins.Top = 0
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object BtnOk: TcxButton
      Left = 471
      Top = 8
      Width = 75
      Height = 25
      Action = aOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton2: TcxButton
      Left = 553
      Top = 8
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object cxgrdDevices: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 637
    Height = 342
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    LookAndFeel.SkinName = ''
    object cxDV: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = cxDVCellDblClick
      DataController.DataSource = dsDevices
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'FC_COMMENT'
          Column = FC_COMMENT
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object FC_COMMENT: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_COMMENT'
        Width = 234
      end
      object FC_TITLE: TcxGridDBColumn
        Caption = 'AE Title'
        DataBinding.FieldName = 'FC_TITLE'
        Width = 162
      end
      object FC_IP: TcxGridDBColumn
        Caption = 'IP '#1072#1076#1088#1077#1089
        DataBinding.FieldName = 'FC_IP'
        Width = 159
      end
      object FN_PORT: TcxGridDBColumn
        Caption = #1055#1086#1088#1090
        DataBinding.FieldName = 'FN_PORT'
        Width = 58
      end
    end
    object cxgrdlvl1: TcxGridLevel
      GridView = cxDV
    end
  end
  object alOKCancel: TActionList
    Left = 32
    Top = 344
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1086
      ShortCut = 113
      SecondaryShortCuts.Strings = (
        'ENTER')
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object dsDevices: TDataSource
    DataSet = pFIBDevices
    Left = 58
    Top = 184
  end
  object pFIBDevices: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    FK_ID,'
      '    FC_IP,'
      '    FN_PORT,'
      '    FC_TITLE,'
      '    FC_COMMENT'
      'FROM'
      '    DEVICES '
      'ORDER BY FC_TITLE')
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 58
    Top = 128
    object pFIBDevicesFC_IP: TFIBStringField
      FieldName = 'FC_IP'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDevicesFK_ID: TFIBIntegerField
      FieldName = 'FK_ID'
    end
    object pFIBDevicesFN_PORT: TFIBIntegerField
      FieldName = 'FN_PORT'
    end
    object pFIBDevicesFC_TITLE: TFIBStringField
      FieldName = 'FC_TITLE'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBDevicesFC_COMMENT: TFIBStringField
      FieldName = 'FC_COMMENT'
      Size = 250
      EmptyStrToNull = True
    end
  end
  object UniDevices: TUniQuery
    Left = 56
    Top = 88
  end
  object OraDevices: TOracleDataSet
    Optimize = False
    Left = 56
    Top = 40
  end
end
