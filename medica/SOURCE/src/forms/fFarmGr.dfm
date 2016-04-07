object frmFarmGr: TfrmFarmGr
  Left = 315
  Top = 195
  HelpContext = 46
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1092#1072#1088#1084#1072#1082#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1093' '#1075#1088#1091#1087#1087
  ClientHeight = 268
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  HelpFile = 'medica.chm'
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 688
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 38
        Width = 684
      end>
    ExplicitTop = 8
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 675
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 58
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acClose
      end
      object ToolButton6: TToolButton
        Left = 58
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 66
        Top = 0
        Action = acAdd
      end
      object ToolButton2: TToolButton
        Left = 124
        Top = 0
        Action = acEdit
      end
      object ToolButton4: TToolButton
        Left = 182
        Top = 0
        Action = acDel
      end
      object ToolButton7: TToolButton
        Left = 240
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 248
        Top = 0
        Action = acRefresh
      end
    end
  end
  object cxGridList: TcxGrid
    Left = 0
    Top = 42
    Width = 688
    Height = 226
    Align = alClient
    TabOrder = 1
    object cxGridListDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmMain.dsFarmGr
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = cxGridListDBTableView1_FC_FARMGR
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GridLineColor = clBlack
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.ContentEven = dmMain.cxStyleGridEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridOddRow
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      object cxGridListDBTableView1_FC_FARMGR: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_FARMGR'
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Width = 315
      end
      object cxGridListDBTableView1_FC_NAME: TcxGridDBColumn
        DataBinding.FieldName = 'FC_NAME'
        Visible = False
        Width = 339
      end
      object cxGridListDBTableView1_FARMGRID: TcxGridDBColumn
        DataBinding.FieldName = 'FARMGRID'
        Visible = False
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Width = 20
      end
    end
    object cxGridListLevel1: TcxGridLevel
      GridView = cxGridListDBTableView1
    end
  end
  object ActionList1: TActionList
    Images = dmMain.ilMain
    Left = 320
    Top = 208
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
      ShortCut = 119
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
    AppStoragePath = 'frmFarmGr\'
    StoredValues = <>
    Left = 368
    Top = 120
  end
end
