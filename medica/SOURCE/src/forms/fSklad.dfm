object frmSklad: TfrmSklad
  Left = 393
  Top = 151
  Width = 386
  Height = 348
  HelpContext = 50
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1082#1083#1072#1076#1086#1074
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
      Width = 361
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 57
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
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
      DataController.DataSource = dmMain.dsSklad
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
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        PropertiesClassName = 'TcxTextEditProperties'
        VisibleForCustomization = False
      end
      object cxGridListDBTableView1FC_SYNONIM: TcxGridDBColumn
        Caption = #1057#1080#1085#1086#1085#1080#1084
        DataBinding.FieldName = 'FC_SYNONIM'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
      end
      object cxGridListDBTableView1FC_NAME_REP: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1086#1090#1095#1077#1090#1086#1074
        DataBinding.FieldName = 'FC_NAME_REP'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
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
    AppStoragePath = 'frmSklad\'
    StoredProps.Strings = (
      'cxGridListDBTableView1FC_SYNONIM.Visible'
      'cxGridListDBTableView1FC_SYNONIM.Width'
      'cxGridListDBTableView1FK_ID.Visible'
      'cxGridListDBTableView1FK_ID.Width'
      'cxGridListDBTableView1FC_NAME_REP.Visible'
      'cxGridListDBTableView1FC_NAME_REP.Width')
    StoredValues = <>
    Left = 320
    Top = 272
  end
  object oqAdd: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '  insert into med.tsklad (FC_NAME, FC_SYNONIM, FC_NAME_REP) VALU' +
        'ES (:pFC_NAME, :pFC_SYNONIM, :pFC_NAME_REP) returning FK_ID into' +
        ' :pFK_ID;'
      'end;')
    Session = dmMain.os
    Variables.Data = {
      0300000004000000090000003A5046435F4E414D450500000000000000000000
      000C0000003A5046435F53594E4F4E494D0500000000000000000000000D0000
      003A5046435F4E414D455F524550050000000000000000000000070000003A50
      464B5F4944030000000000000000000000}
    Left = 14
    Top = 72
  end
  object oqDel: TOracleQuery
    SQL.Strings = (
      'begin'
      '--  select'
      '  delete from med.tsklad where FK_ID = :pFK_ID;'
      '  commit;'
      'end;')
    Session = dmMain.os
    Variables.Data = {0300000001000000070000003A50464B5F4944030000000000000000000000}
    Left = 82
    Top = 74
  end
end
