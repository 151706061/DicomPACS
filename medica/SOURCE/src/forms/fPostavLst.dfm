object frmPostavLst: TfrmPostavLst
  Left = 356
  Top = 215
  HelpContext = 55
  Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082#1080
  ClientHeight = 357
  ClientWidth = 547
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 547
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 543
      end>
    BorderWidth = 1
    EdgeBorders = [ebTop]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 534
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
      object ToolButton8: TToolButton
        Left = 0
        Top = 0
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
        Action = acSelect
      end
      object ToolButton9: TToolButton
        Left = 58
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 2
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
      object ToolButton6: TToolButton
        Left = 306
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 314
        Top = 0
        Action = acClose
      end
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 42
    Width = 547
    Height = 315
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = dxDBGrid1DblClick
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmMain.dsPostav
      DataController.Filter.MaxValueListCount = 1000
      DataController.KeyFieldNames = 'POSTAVID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DataController.OnDataChanged = cxGrid1DBTableView1DataControllerDataChanged
      Filtering.ColumnPopup.MaxDropDownItemCount = 12
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      Preview.AutoHeight = False
      Preview.MaxLineCount = 2
      Styles.ContentEven = dmMain.cxStyleGridEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridOddRow
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      object cxGrid1DBTableView1POSTAVID: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'POSTAVID'
        Visible = False
      end
      object cxGrid1DBTableView1FC_NAME: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        DataBinding.FieldName = 'FC_NAME'
      end
      object cxGrid1DBTableView1FC_BOSSDOLG: TcxGridDBColumn
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103
        DataBinding.FieldName = 'FC_BOSSDOLG'
      end
      object cxGrid1DBTableView1FC_BOSSFIO: TcxGridDBColumn
        Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
        DataBinding.FieldName = 'FC_BOSSFIO'
      end
      object cxGrid1DBTableView1FC_REKVIZITI: TcxGridDBColumn
        Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
        DataBinding.FieldName = 'FC_REKVIZITI'
      end
      object cxGrid1DBTableView1FC_KONTRAKT_N: TcxGridDBColumn
        Caption = #8470' '#1082#1086#1085#1090#1088#1072#1082#1090#1072
        DataBinding.FieldName = 'FC_KONTRAKT_N'
        Visible = False
      end
      object cxGrid1DBTableView1FD_KONTRAKT_BEGIN: TcxGridDBColumn
        Caption = #1050#1086#1085#1090#1088#1072#1082#1090' '#1089
        DataBinding.FieldName = 'FD_KONTRAKT_BEGIN'
        Visible = False
      end
      object cxGrid1DBTableView1FD_KONTRAKT_END: TcxGridDBColumn
        Caption = #1050#1086#1085#1090#1088#1072#1082#1090' '#1087#1086
        DataBinding.FieldName = 'FD_KONTRAKT_END'
        Visible = False
      end
      object cxGrid1DBTableView1FC_ADDRESS: TcxGridDBColumn
        Caption = #1040#1076#1088#1077#1089
        DataBinding.FieldName = 'FC_ADDRESS'
      end
      object cxGrid1DBTableView1FC_PHONE: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'FC_PHONE'
        Visible = False
      end
      object cxGrid1DBTableView1FC_R_S: TcxGridDBColumn
        Caption = #1056#1072#1089#1095'. '#1089#1095#1077#1090
        DataBinding.FieldName = 'FC_R_S'
        Visible = False
      end
      object cxGrid1DBTableView1FC_K_S: TcxGridDBColumn
        Caption = #1050#1086#1088#1088'. '#1089#1095#1077#1090
        DataBinding.FieldName = 'FC_K_S'
        Visible = False
      end
      object cxGrid1DBTableView1FC_INN: TcxGridDBColumn
        Caption = #1048#1053#1053
        DataBinding.FieldName = 'FC_INN'
        Visible = False
      end
      object cxGrid1DBTableView1FC_BIK: TcxGridDBColumn
        Caption = #1041#1048#1050
        DataBinding.FieldName = 'FC_BIK'
        Visible = False
      end
      object cxGrid1DBTableView1FC_OKPO: TcxGridDBColumn
        Caption = #1054#1050#1055#1054
        DataBinding.FieldName = 'FC_OKPO'
        Visible = False
      end
      object cxGrid1DBTableView1FC_OKONH: TcxGridDBColumn
        Caption = #1054#1050#1054#1053#1061
        DataBinding.FieldName = 'FC_OKONH'
        Visible = False
      end
      object cxGrid1DBTableView1FC_BANK: TcxGridDBColumn
        Caption = #1041#1072#1085#1082
        DataBinding.FieldName = 'FC_BANK'
        Visible = False
      end
      object cxGrid1DBTableView1FC_LICENSE_N: TcxGridDBColumn
        Caption = #8470' '#1083#1080#1094#1077#1085#1079#1080#1080
        DataBinding.FieldName = 'FC_LICENSE_N'
      end
      object cxGrid1DBTableView1FD_LICENSE: TcxGridDBColumn
        Caption = #1057#1088#1086#1082' '#1083#1080#1094#1077#1085#1079#1080#1080
        DataBinding.FieldName = 'FD_LICENSE'
      end
      object cxGrid1DBTableView1FC_PM_VENDOR_ID: TcxGridDBColumn
        Caption = 'VendorID '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091' "'#1052#1086#1085#1080#1090#1086#1088#1080#1085#1075' '#1094#1077#1085'"'
        DataBinding.FieldName = 'FC_PM_VENDOR_ID'
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 496
    Top = 32
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
    object acSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 30
      ShortCut = 13
      OnExecute = acSelectExecute
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmPostavLst\'
    StoredProps.Strings = (
      'cxGrid1DBTableView1FC_ADDRESS.Width'
      'cxGrid1DBTableView1FC_BANK.Width'
      'cxGrid1DBTableView1FC_BIK.Width'
      'cxGrid1DBTableView1FC_BOSSDOLG.Width'
      'cxGrid1DBTableView1FC_BOSSFIO.Width'
      'cxGrid1DBTableView1FC_INN.Width'
      'cxGrid1DBTableView1FC_K_S.Width'
      'cxGrid1DBTableView1FC_KONTRAKT_N.Width'
      'cxGrid1DBTableView1FC_LICENSE_N.Width'
      'cxGrid1DBTableView1FC_NAME.Width'
      'cxGrid1DBTableView1FC_OKONH.Width'
      'cxGrid1DBTableView1FC_OKPO.Width'
      'cxGrid1DBTableView1FC_PHONE.Width'
      'cxGrid1DBTableView1FC_R_S.Width'
      'cxGrid1DBTableView1FC_REKVIZITI.Width'
      'cxGrid1DBTableView1FD_KONTRAKT_BEGIN.Width'
      'cxGrid1DBTableView1FD_KONTRAKT_END.Width'
      'cxGrid1DBTableView1FD_LICENSE.Width'
      'cxGrid1DBTableView1POSTAVID.Width'
      'cxGrid1DBTableView1FC_ADDRESS.Visible'
      'cxGrid1DBTableView1FC_BANK.Visible'
      'cxGrid1DBTableView1FC_BIK.Visible'
      'cxGrid1DBTableView1FC_BOSSDOLG.Visible'
      'cxGrid1DBTableView1FC_BOSSFIO.Visible'
      'cxGrid1DBTableView1FC_INN.Visible'
      'cxGrid1DBTableView1FC_K_S.Visible'
      'cxGrid1DBTableView1FC_KONTRAKT_N.Visible'
      'cxGrid1DBTableView1FC_LICENSE_N.Visible'
      'cxGrid1DBTableView1FC_NAME.Visible'
      'cxGrid1DBTableView1FC_OKONH.Visible'
      'cxGrid1DBTableView1FC_OKPO.Visible'
      'cxGrid1DBTableView1FC_PHONE.Visible'
      'cxGrid1DBTableView1FC_R_S.Visible'
      'cxGrid1DBTableView1FC_REKVIZITI.Visible'
      'cxGrid1DBTableView1FD_KONTRAKT_BEGIN.Visible'
      'cxGrid1DBTableView1FD_KONTRAKT_END.Visible'
      'cxGrid1DBTableView1FD_LICENSE.Visible'
      'cxGrid1DBTableView1POSTAVID.Visible'
      'cxGrid1DBTableView1FC_PM_VENDOR_ID.Visible'
      'cxGrid1DBTableView1FC_PM_VENDOR_ID.Width')
    StoredValues = <>
    Left = 488
    Top = 304
  end
end
