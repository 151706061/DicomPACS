object fmProfil: TfmProfil
  Left = 354
  Top = 299
  HelpContext = 47
  Caption = #1055#1088#1086#1092#1080#1083#1080
  ClientHeight = 288
  ClientWidth = 482
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
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 482
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 474
      end>
    BorderWidth = 1
    EdgeBorders = [ebLeft, ebTop, ebRight]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 465
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
      object ToolButton3: TToolButton
        Left = 0
        Top = 0
        Action = acAdd
      end
      object tbuEdit: TToolButton
        Left = 58
        Top = 0
        Action = acEdit
        AllowAllUp = True
        Style = tbsCheck
      end
      object ToolButton4: TToolButton
        Left = 116
        Top = 0
        Action = acDel
      end
      object ToolButton7: TToolButton
        Left = 174
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 182
        Top = 0
        Action = acRefresh
      end
      object ToolButton6: TToolButton
        Left = 240
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
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
  object cxGrid1: TcxGrid
    Left = 0
    Top = 42
    Width = 482
    Height = 246
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmMain.dsProfil
      DataController.KeyFieldNames = 'FK_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1050#1086#1083'-'#1074#1086': ### ###'
          Kind = skCount
          Column = cxGrid1DBTableView1_FC_NAME
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnDataChanged = cxGrid1DBTableView1DataControllerDataChanged
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Appending = True
      OptionsData.CancelOnExit = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object cxGrid1DBTableView1_FK_ID: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'FK_ID'
        Visible = False
        Options.Editing = False
        Width = 57
      end
      object cxGrid1DBTableView1_FC_NAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 234
      end
      object cxGrid1DBTableView1_FL_DEL: TcxGridDBColumn
        DataBinding.FieldName = 'FL_DEL'
        Visible = False
        VisibleForCustomization = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 304
    Top = 24
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
      AutoCheck = True
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
    AppStoragePath = 'frmProfil\'
    StoredProps.Strings = (
      'cxGrid1DBTableView1_FC_NAME.Width'
      'cxGrid1DBTableView1_FK_ID.Width')
    StoredValues = <>
    Left = 304
    Top = 104
  end
end
