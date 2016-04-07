object frmPostGiven: TfrmPostGiven
  Left = 193
  Top = 131
  Width = 870
  Height = 640
  Caption = #1052#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099', '#1074#1099#1076#1072#1085#1085#1099#1077' '#1087#1086#1089#1090#1086#1074#1099#1084#1080' '#1084#1077#1076#1089#1077#1089#1090#1088#1072#1084#1080' '#1087#1072#1094#1080#1077#1085#1090#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar2: TCoolBar
    Left = 0
    Top = 0
    Width = 862
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 40
        Width = 862
      end>
    EdgeBorders = [ebTop, ebBottom]
    object ToolBar2: TToolBar
      Left = 9
      Top = 0
      Width = 849
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 56
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Images = dmMain.ilMain
      ShowCaptions = True
      TabOrder = 0
      object ToolButton3: TToolButton
        Left = 0
        Top = 0
        Action = aChoose
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton7: TToolButton
        Left = 56
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object ToolButton8: TToolButton
        Left = 64
        Top = 0
        Action = aRefresh
      end
      object Panel1: TPanel
        Left = 120
        Top = 0
        Width = 112
        Height = 36
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object abuSetDocPeriod: TJvArrowButton
          Left = 0
          Top = 0
          Width = 15
          Height = 36
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076' '#1080#1079' '#1089#1087#1080#1089#1082#1072
          Align = alLeft
          ArrowWidth = 15
          DropDown = pmDocsFilterPeriod
          Flat = True
          FillFont.Charset = DEFAULT_CHARSET
          FillFont.Color = clWindowText
          FillFont.Height = -11
          FillFont.Name = 'MS Sans Serif'
          FillFont.Style = []
        end
        object dpeDate1: TJvDatePickerEdit
          Left = 16
          Top = 0
          Width = 95
          Height = 19
          Hint = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
          AllowNoDate = False
          ButtonFlat = True
          Checked = True
          Flat = True
          ParentFlat = False
          TabOrder = 0
        end
        object dpeDate2: TJvDatePickerEdit
          Left = 16
          Top = 17
          Width = 95
          Height = 19
          Hint = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
          AllowNoDate = False
          ButtonFlat = True
          Checked = True
          Flat = True
          ParentFlat = False
          TabOrder = 1
        end
      end
      object ToolButton1: TToolButton
        Left = 232
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 240
        Top = 0
        Action = aCheckAll
      end
      object ToolButton6: TToolButton
        Left = 296
        Top = 0
        Action = aUnCheckAll
      end
      object ToolButton5: TToolButton
        Left = 352
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 360
        Top = 0
        Action = aClose
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object gPostGiven: TcxGrid
    Left = 0
    Top = 44
    Width = 862
    Height = 569
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    object tvPostGiven: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvPostGivenCellDblClick
      DataController.DataSource = dsPostGiven
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object tvPostGivenColChecked: TcxGridDBColumn
        Caption = #1042#1099#1073#1088#1072#1090#1100
        DataBinding.FieldName = 'ISCHECK'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Properties.OnEditValueChanged = tvPostGivenColCheckedPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 64
      end
      object tvPostGivenColName: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        HeaderAlignmentHorz = taCenter
        MinWidth = 685
        Options.Editing = False
        Options.Moving = False
        Width = 685
      end
      object tvPostGivenColKol: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086
        DataBinding.FieldName = 'FN_KOL'
        HeaderAlignmentHorz = taCenter
        MinWidth = 97
        Options.Editing = False
        Options.Moving = False
        Width = 97
      end
    end
    object gPostGivenL: TcxGridLevel
      GridView = tvPostGiven
    end
  end
  object alActions: TActionList
    Images = dmMain.ilMain
    OnUpdate = alActionsUpdate
    Left = 328
    Top = 82
    object aChoose: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 30
      ShortCut = 13
      OnExecute = aChooseExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 1
      ShortCut = 16499
      OnExecute = aCloseExecute
    end
    object aCheckAll: TAction
      Caption = #1042#1089#1077
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      ImageIndex = 60
      OnExecute = aCheckAllExecute
    end
    object aUnCheckAll: TAction
      Caption = #1053#1080#1086#1076#1085#1086#1075#1086
      ImageIndex = 61
      OnExecute = aUnCheckAllExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 15
      OnExecute = aRefreshExecute
    end
  end
  object odsPostGiven: TOracleDataSet
    SQL.Strings = (
      'select  (select rowid from dual) "rowid",'
      #9'q.fk_id, q.fn_kol, 0 ischeck, t.fc_name,'
      '  e.eiid,e.fc_name fc_einame'
      '  from (select fk_medicgiven fk_id, sum(fn_kol) fn_kol'
      '          from asu.tmedicgiven, asu.tnazmark n'
      
        '         where n.fd_post between :pS and :pPo and fp_mode = :pMo' +
        'de and n.fk_id = fk_nazmark'
      '         group by fk_medicgiven) q,'
      '       med.tmedic t,'
      '       med.tei e'
      ','#9'MED.VMEDKART_KOLOST V'
      ' where q.fk_id = t.medicid'
      ' and v.MEDICID = t.medicid'
      ' and e.eiid = t.eiid')
    Variables.Data = {
      0300000003000000030000003A50530C0000000000000000000000040000003A
      50504F0C0000000000000000000000060000003A504D4F444503000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F494401000000000006000000464E5F4B4F
      4C010000000000070000004953434845434B0100000000000700000046435F4E
      414D45010000000000}
    CommitOnPost = False
    CachedUpdates = True
    Session = dmMain.os
    Left = 416
    Top = 80
  end
  object dsPostGiven: TDataSource
    DataSet = odsPostGiven
    Left = 388
    Top = 80
  end
  object pmDocsFilterPeriod: TPopupMenu
    Left = 454
    Top = 80
    object N20: TMenuItem
      Tag = 5
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1076#1077#1085#1100
      OnClick = N15Click
    end
    object N18: TMenuItem
      Tag = 4
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
      OnClick = N15Click
    end
    object N16: TMenuItem
      Tag = 2
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1075#1086#1076
      OnClick = N15Click
    end
    object N21: TMenuItem
      Caption = '-'
    end
    object N17: TMenuItem
      Tag = 3
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1084#1077#1089#1103#1094
      OnClick = N15Click
    end
    object N15: TMenuItem
      Tag = 1
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1075#1086#1076
      OnClick = N15Click
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmPostGiven\'
    StoredValues = <>
    Left = 488
    Top = 324
  end
end
