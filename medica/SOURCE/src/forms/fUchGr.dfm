object frmUchGr: TfrmUchGr
  Left = 354
  Top = 299
  HelpContext = 47
  Caption = #1059#1095#1077#1090#1085#1099#1077' '#1075#1088#1091#1087#1087#1099
  ClientHeight = 458
  ClientWidth = 645
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
    Width = 645
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 637
      end>
    BorderWidth = 1
    EdgeBorders = [ebLeft, ebTop, ebRight]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 628
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
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        DropdownMenu = pmAdd
        Style = tbsDropDown
      end
      object tbuEdit: TToolButton
        Left = 58
        Top = 0
        Action = acEdit
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
  object tlUchgr: TcxDBTreeList
    Left = 0
    Top = 42
    Width = 645
    Height = 416
    Align = alClient
    Bands = <
      item
        Caption.AlignHorz = taCenter
      end>
    BufferedPaint = True
    DataController.DataSource = dmMain.dsUchGr
    DataController.ParentField = 'PARENTID'
    DataController.KeyField = 'UCHGRID'
    DragMode = dmAutomatic
    LookAndFeel.Kind = lfFlat
    OptionsBehavior.GoToNextCellOnTab = True
    OptionsBehavior.ImmediateEditor = False
    OptionsBehavior.AutoDragCopy = True
    OptionsBehavior.DragCollapse = False
    OptionsBehavior.ExpandOnIncSearch = True
    OptionsBehavior.ShowHourGlass = False
    OptionsBehavior.IncSearch = True
    OptionsCustomizing.BandCustomizing = False
    OptionsCustomizing.BandVertSizing = False
    OptionsCustomizing.ColumnVertSizing = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsSelection.HideFocusRect = False
    OptionsView.CellTextMaxLineCount = -1
    OptionsView.ShowEditButtons = ecsbFocused
    OptionsView.ColumnAutoWidth = True
    OptionsView.Footer = True
    OptionsView.Indicator = True
    ParentColor = False
    PopupMenu = pmTreeList
    Preview.AutoHeight = False
    Preview.MaxLineCount = 2
    RootValue = 0
    Styles.Selection = dmMain.cxStyleGridSelectedRow
    Styles.ContentEven = dmMain.cxStyleGridEvenRow
    Styles.ContentOdd = dmMain.cxStyleGridOddRow
    TabOrder = 1
    OnDragOver = tlUchgrDragOver
    OnEndDrag = tlUchgrEndDrag
    OnStartDrag = tlUchgrStartDrag
    ExplicitTop = 42
    ExplicitHeight = 416
    object tlUchgrUCHGRID: TcxDBTreeListColumn
      Visible = False
      DataBinding.FieldName = 'UCHGRID'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object tlUchgrFC_UCHGR: TcxDBTreeListColumn
      PropertiesClassName = 'TcxTextEditProperties'
      Caption.Text = #1053#1072#1079#1074#1072#1085#1080#1077
      DataBinding.FieldName = 'FC_UCHGR'
      Options.Footer = True
      Width = 279
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      SummaryFooter.Format = #1050#1086#1083'-'#1074#1086' '#1089#1090#1088#1086#1082': 0'
      SummaryFooter.Kind = skCount
      SummaryFooter.FieldName = 'FC_UCHGR'
    end
    object tlUchgrFC_QUOTA_CODE_2: TcxDBTreeListColumn
      PropertiesClassName = 'TcxTextEditProperties'
      Properties.MaxLength = 2
      Caption.Text = #1050#1086#1076' '#1082#1074#1086#1090#1099' (2-'#1072#1103' '#1087#1072#1088#1072' '#1094#1080#1092#1088')'
      DataBinding.FieldName = 'FC_QUOTA_CODE_2'
      Width = 65
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object tlUchgrPARENTID: TcxDBTreeListColumn
      Visible = False
      DataBinding.FieldName = 'PARENTID'
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    OnUpdate = alUpdate
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
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 3
      ShortCut = 114
      OnExecute = acEditExecute
    end
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 21
      ShortCut = 115
      OnExecute = acAddExecute
    end
    object acAddChild: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1095#1077#1088#1085#1102#1102' '#1079#1072#1087#1080#1089#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1095#1077#1088#1085#1102#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 21
      OnExecute = acAddChildExecute
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
    AppStoragePath = 'frmUchGr\'
    StoredValues = <>
    Left = 304
    Top = 104
  end
  object oqSetQUOTA_UchGr: TOracleQuery
    SQL.Strings = (
      'begin  '
      '/*'
      '  select count(1) into :fn_tmedic_uchgr from med.tmedic m'
      '  where m.UCHGRID = :UCHGRID;'
      ''
      '  update med.tmedic m'
      
        '  set m.FC_QUOTA_CODE_234 = :FC_QUOTA_UCHGR||Substr(m.FC_QUOTA_C' +
        'ODE_234, 3)'
      '  where m.UCHGRID = :UCHGRID;'
      '*/'
      
        '  select count(1) into :fn_tkart_uchgr from med.tmedic m, med.tk' +
        'art k'
      '  where m.UCHGRID = :UCHGRID'
      '    and m.medicid = k.medicid;'
      ''
      '  update med.tkart k'
      
        '  set k.FC_QUOTA_CODE = (select max(SubStr(k.FC_QUOTA_CODE, 1, 2' +
        ')||:FC_QUOTA_UCHGR||m1.FC_QUOTA_CODE_34) from med.tmedic m1 wher' +
        'e m1.UCHGRID = :UCHGRID and m1.medicid = k.medicid)'
      
        '  where k.medicid in (select m2.medicid from med.tmedic m2 where' +
        ' m2.UCHGRID = :UCHGRID);'
      ''
      '  commit;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000003000000080000003A55434847524944030000000000000000000000
      0F0000003A46435F51554F54415F55434847520500000000000000000000000F
      0000003A464E5F544B4152545F55434847520300000004000000000000000000
      0000}
    Left = 168
    Top = 112
  end
  object pmTreeList: TPopupMenu
    Left = 304
    Top = 208
    object miAdd: TMenuItem
      Action = acAdd
    end
    object miAddChild: TMenuItem
      Action = acAddChild
    end
    object miEdit: TMenuItem
      Action = acEdit
    end
    object miDelete: TMenuItem
      Action = acDel
    end
  end
  object osAutonomous: TOracleSession
    Left = 392
    Top = 208
  end
  object pmAdd: TPopupMenu
    Left = 176
    Top = 208
    object N1: TMenuItem
      Action = acAdd
    end
    object N2: TMenuItem
      Action = acAddChild
    end
  end
end
