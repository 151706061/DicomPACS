object ProdCertDlg: TProdCertDlg
  Left = 319
  Top = 158
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1077#1081' '#1080' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1086#1074
  ClientHeight = 337
  ClientWidth = 486
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
    Width = 486
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 486
      end>
    EdgeBorders = [ebTop]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 477
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 58
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
        Left = 58
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object btnAdd: TToolButton
        Left = 66
        Top = 0
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        DropdownMenu = pmAddBtn
        ImageIndex = 21
        ParentShowHint = False
        ShowHint = True
      end
      object btnEdit: TToolButton
        Left = 124
        Top = 0
        Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
        Action = actEdit
        ImageIndex = 28
        ParentShowHint = False
        ShowHint = True
      end
      object btnDelete: TToolButton
        Left = 182
        Top = 0
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
        Action = actRemove
        ImageIndex = 22
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton6: TToolButton
        Left = 240
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 33
        Style = tbsSeparator
      end
      object btnClose: TToolButton
        Left = 248
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
  object cxDBTreeList1: TcxDBTreeList
    Left = 0
    Top = 42
    Width = 486
    Height = 295
    Align = alClient
    Bands = <
      item
        Caption.AlignHorz = taCenter
      end>
    BufferedPaint = True
    DataController.DataSource = ds
    DataController.ImageIndexFieldName = 'FN_IMAGEINDEX'
    DataController.ParentField = 'FN_PARENT'
    DataController.KeyField = 'FK_ID'
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
    RootValue = -1
    Styles.Selection = dmMain.cxStyleGridSelectedRow
    Styles.ContentEven = dmMain.cxStyleGridEvenRow
    Styles.ContentOdd = dmMain.cxStyleGridOddRow
    TabOrder = 1
    OnDblClick = actSelectExecute
    object cxDBTreeList1FC_VALUE: TcxDBTreeListColumn
      PropertiesClassName = 'TcxTextEditProperties'
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      Caption.Text = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1080'/'#1057#1077#1088#1090#1080#1092#1080#1082#1072#1090#1099
      DataBinding.FieldName = 'FC_VALUE'
      Options.Footer = True
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SummaryFooter.Format = #1050#1086#1083'-'#1074#1086': 0'
      SummaryFooter.Kind = skCount
      SummaryFooter.FieldName = 'FC_VALUE'
    end
    object cxDBTreeList1FC_FOREIGHN: TcxDBTreeListColumn
      Caption.Text = #1048#1084#1087#1086#1088#1090#1085#1099#1081'/'#1054#1090#1077#1095#1077#1089#1090#1074#1077#1085#1085#1099#1081
      DataBinding.FieldName = 'FC_FOREIGHN'
      Width = 30
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object ods: TOracleDataSet
    SQL.Strings = (
      'select tprodcert.*,'
      
        '       DECODE(FN_PARENT,0,DECODE(fl_foreighn,0,'#39#1054#1090#1077#1095#1077#1089#1090#1074#1077#1085#1085#1099#1081#39','#39 +
        #1048#1084#1087#1086#1088#1090#1085#1099#1081#39'),'#39#39') FC_FOREIGHN'
      
        ',DECODE(FN_PARENT, 0, 4, 3) as FN_ImageIndex -- '#1080#1085#1076#1077#1082#1089' '#1082#1072#1088#1090#1080#1085#1082#1080' ' +
        #1086#1087#1088#1077#1076#1077#1083#1103#1077#1090#1089#1103' '#1087#1086' '#1091#1088#1086#1074#1085#1102
      ''
      'FROM med.v$tprodcert tprodcert'
      'order by FC_VALUE')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000700000009000000464E5F504152454E540100000000000800000046
      435F56414C554501000000000005000000464B5F49440100000000000D000000
      464E5F494D414745494E4445580100000000000B000000464B5F534B4C41445F
      49440100000000000B000000464C5F464F52454947484E0100000000000B0000
      0046435F464F52454947484E010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
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
    object miAddProd: TMenuItem
      Action = actAddProd
    end
    object miAddCert: TMenuItem
      Action = actAddCert
    end
    object miEdit: TMenuItem
      Action = actEdit
    end
    object miDelete: TMenuItem
      Action = actRemove
    end
  end
  object actionList: TActionList
    OnUpdate = actionListUpdate
    Left = 320
    Top = 8
    object actAddProd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103
      OnExecute = actAddProdExecute
    end
    object actAddCert: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090
      OnExecute = actAddCertExecute
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
  object pmAddBtn: TPopupMenu
    Left = 128
    Top = 224
    object miAddBtnAddProd: TMenuItem
      Action = actAddProd
    end
    object miAddBtnAddCert: TMenuItem
      Action = actAddCert
    end
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'ProdCertDlg\'
    StoredValues = <>
    Left = 234
    Top = 172
  end
end
