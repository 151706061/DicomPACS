object frmSetTo: TfrmSetTo
  Left = 524
  Top = 110
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1088#1072#1090#1100' '#1072#1076#1088#1077#1089#1072#1090
  ClientHeight = 442
  ClientWidth = 222
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
  object grList: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 216
    Height = 392
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object tvList: TcxGridDBTableView
      OnKeyDown = tvListKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvListCellDblClick
      DataController.DataSource = dsTo
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = tvListName
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvListName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_TITLE'
      end
    end
    object grListLevel1: TcxGridLevel
      GridView = tvList
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 398
    Width = 216
    Height = 41
    Margins.Top = 0
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bOk: TcxButton
      Left = 51
      Top = 7
      Width = 75
      Height = 25
      Action = aOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton1: TcxButton
      Left = 134
      Top = 7
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 48
    Top = 96
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1086
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
  object pFIBTo: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT * '
      '  FROM DEVICES '
      'ORDER BY FC_TITLE')
    Transaction = frmMain.trRead
    Database = frmMain.DB
    UpdateTransaction = frmMain.trWrite
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 50
    Top = 152
    object pFIBToFC_IP: TFIBStringField
      FieldName = 'FC_IP'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBToFK_ID: TFIBIntegerField
      FieldName = 'FK_ID'
    end
    object pFIBToFN_PORT: TFIBIntegerField
      FieldName = 'FN_PORT'
    end
    object pFIBToFC_TITLE: TFIBStringField
      FieldName = 'FC_TITLE'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBToFC_COMMENT: TFIBStringField
      FieldName = 'FC_COMMENT'
      Size = 250
      EmptyStrToNull = True
    end
  end
  object dsTo: TDataSource
    DataSet = pFIBTo
    Left = 106
    Top = 152
  end
end
