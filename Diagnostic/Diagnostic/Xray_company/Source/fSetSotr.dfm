object frmSetSotr: TfrmSetSotr
  Left = 447
  Top = 93
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
  ClientHeight = 473
  ClientWidth = 414
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
  object dxBarDockControl1: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 414
    Height = 28
    Align = dalTop
    BarManager = dxBM
  end
  object cxGrZavOtdel: TcxGrid
    Left = 0
    Top = 28
    Width = 414
    Height = 445
    Align = alClient
    TabOrder = 5
    ExplicitTop = 26
    ExplicitHeight = 447
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
      object VSOTRSPEC: TcxGridDBColumn
        Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
        DataBinding.FieldName = 'NAMESPEC'
        Width = 97
      end
    end
    object cxGrZavOtdelLevel1: TcxGridLevel
      GridView = TVSOTR
    end
  end
  object dxBM: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clBtnFace
    ImageOptions.Images = frmMain.ILMain
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsXP
    UseSystemFont = True
    Left = 128
    Top = 128
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBMBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'OKCancel'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 396
      FloatTop = 96
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbOk'
        end
        item
          Visible = True
          ItemName = 'bbCancel'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object bbOk: TdxBarButton
      Action = actSet
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbCancel: TdxBarButton
      Action = actCancel
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object actlst1: TActionList
    Images = frmMain.ILMain
    Left = 128
    Top = 80
    object actSet: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 3
      ShortCut = 113
      OnExecute = actSetExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 4
      ShortCut = 27
      OnExecute = actCancelExecute
    end
  end
  object odsSotr: TOracleDataSet
    SQL.Strings = (
      'SELECT TSOTR.FK_ID, TSOTR.FC_FAM, TSOTR.FC_FAM || '#39' '#39' || '
      
        '       DECODE(VarcharIsNUll(TSOTR.FC_NAME), 1, '#39#39', SUBSTR(TSOTR.' +
        'FC_NAME, 0, 1) || '#39'. '#39' || '
      
        '       DECODE (VarcharIsNUll(TSOTR.FC_OTCH), 1, '#39#39', SUBSTR(TSOTR' +
        '.FC_OTCH, 0, 1) || '#39'. '#39')) AS FC_NAME,'
      
        '       TS_SPRAV.FC_NAME AS NAMESPEC, TSOTR.FL_DEL, TSOTR.FK_SPRA' +
        'VID'
      ' FROM TSOTR, TS_SPRAV '
      ' WHERE TSOTR.FK_SPRAVID = TS_SPRAV.FK_ID'
      '   AND TSOTR.FK_OTDELID = GET_XRAYOTDEL'
      '   AND TSOTR.FL_DEL = 0'
      'ORDER BY TSOTR.FC_FAM')
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
