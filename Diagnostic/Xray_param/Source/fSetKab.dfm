object frmSetKab: TfrmSetKab
  Left = 413
  Top = 87
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1082#1072#1073#1080#1085#1077#1090#1072
  ClientHeight = 474
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grKab: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 329
    Height = 417
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object tvKab: TcxGridDBTableView
      OnKeyDown = tvKabKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvKabCellDblClick
      DataController.DataSource = dsKab
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvKabColumn1: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
      end
    end
    object grKabLevel1: TcxGridLevel
      GridView = tvKab
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 423
    Width = 329
    Height = 48
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bOk: TcxButton
      Left = 168
      Top = 11
      Width = 75
      Height = 25
      Action = aOk
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 246
      Top = 11
      Width = 75
      Height = 25
      Action = aEsc
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 96
    Top = 144
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1082#1072#1073#1080#1085#1077#1090
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aEsc: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aEscExecute
    end
  end
  object odsKab: TOracleDataSet
    SQL.Strings = (
      'select * from asu.tkabinet t1, asu.tvrachkab t2'
      ' where t1.fk_id = t2.fk_kabinetid'
      '   and t2.fk_sotrid = :pfk_sotrid'
      'order by fc_name')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F534F54524944030000000000000000
      000000}
    Session = frmMain.osMain
    Left = 224
    Top = 120
  end
  object dsKab: TDataSource
    DataSet = odsKab
    Left = 224
    Top = 176
  end
end
