object SprOKDP: TSprOKDP
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1054#1050#1044#1055
  ClientHeight = 501
  ClientWidth = 745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 745
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 745
      end>
    EdgeBorders = [ebTop]
    ExplicitWidth = 486
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 736
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 57
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ShowCaptions = True
      TabOrder = 0
      object btnSelect: TToolButton
        Left = 0
        Top = 0
        Action = actSelect
        ImageIndex = 30
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton1: TToolButton
        Left = 61
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object btnAdd: TToolButton
        Left = 69
        Top = 0
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        DropdownMenu = pmAddBtn
        ImageIndex = 21
        ParentShowHint = False
        ShowHint = True
      end
      object btnEdit: TToolButton
        Left = 130
        Top = 0
        Action = actEdit
        ImageIndex = 28
        ParentShowHint = False
        ShowHint = True
      end
      object btnDelete: TToolButton
        Left = 191
        Top = 0
        Action = actRemove
        ImageIndex = 22
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton6: TToolButton
        Left = 252
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 33
        Style = tbsSeparator
      end
      object btnClose: TToolButton
        Left = 260
        Top = 0
        Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
        Caption = #1047#1072#1082#1088#1099#1090#1100
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCloseClick
      end
    end
  end
  object tlSprOKDP: TcxDBTreeList
    Left = 0
    Top = 42
    Width = 745
    Height = 459
    Align = alClient
    Bands = <
      item
        Caption.AlignHorz = taCenter
      end>
    BufferedPaint = True
    DataController.DataSource = ds
    DataController.ImageIndexFieldName = 'FN_IMAGEINDEX'
    DataController.ParentField = 'FK_PARENTID'
    DataController.KeyField = 'FK_ID'
    DragMode = dmAutomatic
    Images = dmMain.ilMain
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
    OnDblClick = actSelectExecute
    OnDragOver = tlSprOKDPDragOver
    OnEndDrag = tlSprOKDPEndDrag
    OnStartDrag = tlSprOKDPStartDrag
    ExplicitWidth = 486
    ExplicitHeight = 295
    object cxDBTreeList1FC_CODE: TcxDBTreeListColumn
      PropertiesClassName = 'TcxTextEditProperties'
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      Caption.Text = #1050#1086#1076' '#1054#1050#1044#1055
      DataBinding.FieldName = 'FC_CODE'
      Options.Footer = True
      Width = 20
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SummaryFooter.Format = #1050#1086#1083'-'#1074#1086': 0'
      SummaryFooter.Kind = skCount
      SummaryFooter.FieldName = 'FC_VALUE'
    end
    object cxDBTreeList1FC_NAME: TcxDBTreeListColumn
      Caption.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1099
      DataBinding.FieldName = 'FC_NAME'
      Width = 80
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object actionList: TActionList
    Left = 360
    Top = 8
    object actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnExecute = actAddExecute
    end
    object actAddChild: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1095#1077#1088#1085#1102#1102' '#1079#1072#1087#1080#1089#1100
      OnExecute = actAddChildExecute
    end
    object actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = actEditExecute
    end
    object actRemove: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 46
      OnExecute = actRemoveExecute
    end
    object actSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ShortCut = 13
      OnExecute = actSelectExecute
    end
  end
  object ods: TOracleDataSet
    SQL.Strings = (
      'SELECT T.*, T.rowid,'
      
        '       (select nvl(max(4),3) from MED.TSPRAV_OKDP q where q.FK_P' +
        'ARENTID = t.fk_id) AS FN_IMAGEINDEX -- '#1080#1085#1076#1077#1082#1089' '#1082#1072#1088#1090#1080#1085#1082#1080' '#1086#1087#1088#1077#1076#1077#1083#1103#1077 +
        #1090#1089#1103' '#1087#1086' '#1091#1088#1086#1074#1085#1102
      '  FROM MED.TSPRAV_OKDP T'
      ' ORDER BY FC_CODE')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000700000009000000464E5F504152454E540100000000000800000046
      435F56414C554501000000000005000000464B5F49440100000000000D000000
      464E5F494D414745494E4445580100000000000B000000464B5F534B4C41445F
      49440100000000000B000000464C5F464F52454947484E0100000000000B0000
      0046435F464F52454947484E010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    AfterOpen = odsAfterOpen
    AfterRefresh = odsAfterOpen
    Left = 232
    Top = 208
  end
  object ds: TDataSource
    DataSet = ods
    Left = 168
    Top = 144
  end
  object pmTreeList: TPopupMenu
    Left = 304
    Top = 208
    object miAdd: TMenuItem
      Action = actAdd
    end
    object miAddChild: TMenuItem
      Action = actAddChild
    end
    object miEdit: TMenuItem
      Action = actEdit
    end
    object miDelete: TMenuItem
      Action = actRemove
    end
  end
  object pmAddBtn: TPopupMenu
    Left = 128
    Top = 224
    object miAddBtnAdd: TMenuItem
      Action = actAdd
    end
    object miAddBtnAddChild: TMenuItem
      Action = actAddChild
    end
  end
  object osAutonomous: TOracleSession
    Left = 392
    Top = 208
  end
end
