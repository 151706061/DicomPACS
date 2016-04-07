object frmVid_post: TfrmVid_post
  Left = 393
  Top = 151
  HelpContext = 50
  Caption = #1042#1080#1076#1099' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1081
  ClientHeight = 321
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 378
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 374
      end>
    EdgeBorders = [ebLeft, ebTop, ebRight]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 365
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 57
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton3: TToolButton
        Left = 0
        Top = 0
        Action = acAdd
      end
      object ToolButton4: TToolButton
        Left = 57
        Top = 0
        Action = acDel
      end
      object ToolButton6: TToolButton
        Left = 114
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 122
        Top = 0
        Action = acRefresh
      end
      object ToolButton7: TToolButton
        Left = 179
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 187
        Top = 0
        Action = acClose
      end
    end
  end
  object cxGridList: TcxGrid
    Left = 0
    Top = 42
    Width = 378
    Height = 279
    Align = alClient
    TabOrder = 1
    object cxGridListDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmMain.dsVid_post
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLineColor = clBlack
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.ContentEven = dmMain.cxStyleGridEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridOddRow
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      object cxGridListDBTableView1FK_ID: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'FK_ID'
        Visible = False
        Options.Editing = False
      end
      object cxGridListDBTableView1FC_NAME: TcxGridDBColumn
        Caption = #1042#1080#1076' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
        DataBinding.FieldName = 'FC_NAME'
        PropertiesClassName = 'TcxTextEditProperties'
        VisibleForCustomization = False
      end
    end
    object cxGridListLevel1: TcxGridLevel
      GridView = cxGridListDBTableView1
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 328
    Top = 8
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      ImageIndex = 1
      ShortCut = 16499
      OnExecute = acCloseExecute
    end
    object acDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 22
      ShortCut = 49232
      OnExecute = acDelExecute
    end
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 21
      ShortCut = 115
      OnExecute = acAddExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 15
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmVid_post\'
    StoredProps.Strings = (
      'cxGridListDBTableView1FK_ID.Width'
      'cxGridListDBTableView1FK_ID.Visible')
    StoredValues = <>
    Left = 320
    Top = 272
  end
  object oqAdd: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '  insert into med.tvid_post (FC_NAME) VALUES (:pFC_NAME) returni' +
        'ng FK_ID into :pFK_ID;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000002000000090000003A5046435F4E414D450500000000000000000000
      00070000003A50464B5F494403000000040000000600000000000000}
    Left = 14
    Top = 72
  end
  object oqDel: TOracleQuery
    SQL.Strings = (
      'begin'
      '--  select'
      '  delete from med.tvid_post where FK_ID = :pFK_ID;'
      '  commit;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {0300000001000000070000003A50464B5F4944030000000000000000000000}
    Left = 82
    Top = 74
  end
end
