object frmSetSotr: TfrmSetSotr
  Left = 447
  Top = 93
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072', '#1074#1074#1086#1076#1080#1074#1096#1077#1075#1086' '#1082#1086#1085#1090#1088#1072#1089#1090
  ClientHeight = 502
  ClientWidth = 309
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
  object cxGrZavOtdel: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 303
    Height = 445
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object TVSOTR: TcxGridDBTableView
      OnDblClick = TVSOTRDblClick
      OnKeyDown = TVSOTRKeyDown
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsSotr
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'FK_ID'
          Column = VSOTRFIO
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
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VSOTRFIO: TcxGridDBColumn
        Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
        DataBinding.FieldName = 'FC_NAME'
        Width = 172
      end
    end
    object cxGrZavOtdelLevel1: TcxGridLevel
      GridView = TVSOTR
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 451
    Width = 303
    Height = 48
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bOk: TcxButton
      Left = 135
      Top = 11
      Width = 75
      Height = 25
      Action = actSet
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 216
      Top = 11
      Width = 75
      Height = 25
      Action = actCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object actlst1: TActionList
    Images = frmMain.ILMain
    Left = 128
    Top = 80
    object actSet: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 113
      OnExecute = actSetExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = actCancelExecute
    end
  end
  object odsSotr: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER'
      '  FROM asu.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM ' +
        '= '#39'KTO_KONTRAST'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000600000046435F4641
      4D0100000000000700000046435F4E414D45010000000000080000004E414D45
      5350454301000000000006000000464C5F44454C010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 72
    Top = 200
  end
  object dsSotr: TDataSource
    DataSet = odsSotr
    Left = 112
    Top = 200
  end
end
