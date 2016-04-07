object frmEdIzm: TfrmEdIzm
  Left = 393
  Top = 151
  HelpContext = 50
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1092#1086#1088#1084' '#1074#1099#1087#1091#1089#1082#1072
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
  OnHelp = FormHelp
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
        Width = 372
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
      ButtonWidth = 58
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
      object ToolButton2: TToolButton
        Left = 58
        Top = 0
        Action = acEdit
      end
      object ToolButton4: TToolButton
        Left = 116
        Top = 0
        Action = acDel
      end
      object ToolButton6: TToolButton
        Left = 174
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 182
        Top = 0
        Action = acRefresh
      end
      object ToolButton7: TToolButton
        Left = 240
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 248
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
      DataController.DataSource = dmMain.dsEI
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLineColor = clBlack
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.ContentEven = dmMain.cxStyleGridEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridOddRow
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      object cxGridListDBTableView1_FC_NAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
        DataBinding.FieldName = 'FC_NAME'
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Width = 279
      end
      object cxGridListDBTableView1_FC_OKEI: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1054#1050#1045#1048
        DataBinding.FieldName = 'FC_OKEI'
        Visible = False
      end
      object cxGridListDBTableView1_EIID: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'EIID'
        Visible = False
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Width = 88
      end
      object cxGridListDBTableView1_FK_RLSDRUGFORM: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'FK_RLSDRUGFORM'
        Visible = False
        Options.Editing = False
        Options.Filtering = False
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
    object acEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 3
      ShortCut = 114
      OnExecute = acEditExecute
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
    AppStoragePath = 'frmEdIzm\'
    StoredProps.Strings = (
      'cxGridListDBTableView1_EIID.Visible'
      'cxGridListDBTableView1_EIID.Width'
      'cxGridListDBTableView1_FC_NAME.Visible'
      'cxGridListDBTableView1_FC_NAME.Width'
      'cxGridListDBTableView1_FC_OKEI.Visible'
      'cxGridListDBTableView1_FC_OKEI.Width'
      'cxGridListDBTableView1_FK_RLSDRUGFORM.Visible'
      'cxGridListDBTableView1_FK_RLSDRUGFORM.Width')
    StoredValues = <>
    Left = 320
    Top = 272
  end
end
