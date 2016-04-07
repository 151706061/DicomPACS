object frmSetSotr: TfrmSetSotr
  Left = 447
  Top = 93
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
  ClientHeight = 413
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
  object cxGrZavOtdel: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 408
    Height = 359
    Align = alTop
    TabOrder = 4
    LookAndFeel.Kind = lfFlat
    ExplicitTop = 34
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
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 365
    Width = 408
    Height = 45
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    ExplicitLeft = 0
    ExplicitTop = 98
    ExplicitWidth = 414
    ExplicitHeight = 46
    object bSet: TcxButton
      Left = 243
      Top = 9
      Width = 75
      Height = 25
      Action = actSet
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 324
      Top = 9
      Width = 75
      Height = 25
      Action = actCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
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
    LookAndFeel.Kind = lfFlat
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 128
    Top = 128
    DockControlHeights = (
      0
      0
      0
      0)
  end
  object actlst1: TActionList
    Images = frmMain.ILMain
    Left = 128
    Top = 80
    object actSet: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
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
      'SELECT TSOTR.FK_ID, TSOTR.FC_FAM, TSOTR.FC_FAM || '#39' '#39' || '
      
        '       DECODE(VarcharIsNUll(TSOTR.FC_NAME), 1, '#39#39', SUBSTR(TSOTR.' +
        'FC_NAME, 0, 1) || '#39'. '#39' || '
      
        '       DECODE (VarcharIsNUll(TSOTR.FC_OTCH), 1, '#39#39', SUBSTR(TSOTR' +
        '.FC_OTCH, 0, 1) || '#39'. '#39')) AS FC_NAME,'
      
        '       TS_SPRAV.FC_NAME AS NAMESPEC, TSOTR.FL_DEL, TSOTR.FK_SPRA' +
        'VID'
      ' FROM TSOTR, TS_SPRAV '
      ' WHERE TSOTR.FK_SPRAVID = TS_SPRAV.FK_ID'
      '   AND TSOTR.FK_OTDELID = :PFK_OTDELID --GET_XRAYOTDEL'
      '   AND TSOTR.FL_DEL = 0'
      'ORDER BY TSOTR.FC_FAM')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A50464B5F4F5444454C49440300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000600000046435F4641
      4D0100000000000700000046435F4E414D45010000000000080000004E414D45
      5350454301000000000006000000464C5F44454C010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsSotrBeforeOpen
    Left = 72
    Top = 200
  end
  object dsSotr: TDataSource
    DataSet = odsSotr
    Left = 112
    Top = 200
  end
end
