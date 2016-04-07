object frmRlsDragForms: TfrmRlsDragForms
  Left = 316
  Top = 200
  Width = 467
  Height = 263
  Caption = #1050#1083#1072#1089#1089#1080#1092#1080#1082#1072#1094#1080#1103' '#1083#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1099#1093' '#1092#1086#1088#1084' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074' ('#1056#1051#1057')'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 459
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 38
        Width = 455
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 442
      Height = 38
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 66
      Caption = 'ToolBar1'
      Flat = True
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acSelect
      end
      object ToolButton2: TToolButton
        Left = 66
        Top = 0
        Action = acCancel
      end
      object ToolButton3: TToolButton
        Left = 132
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 140
        Top = 0
        Action = acCollExpand
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 42
    Width = 459
    Height = 175
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object tl: TcxDBTreeList
      Left = 0
      Top = 0
      Width = 459
      Height = 175
      Align = alClient
      Bands = <
        item
          Caption.AlignHorz = taCenter
        end>
      BufferedPaint = True
      DataController.DataSource = dsDrugForms
      DataController.ParentField = 'FK_PARENT'
      DataController.KeyField = 'FK_ID'
      DefaultLayout = True
      LookAndFeel.Kind = lfUltraFlat
      OptionsBehavior.GoToNextCellOnTab = True
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.DragCollapse = False
      OptionsBehavior.ExpandOnIncSearch = True
      OptionsBehavior.ShowHourGlass = False
      OptionsBehavior.IncSearch = True
      OptionsCustomizing.BandCustomizing = False
      OptionsCustomizing.BandVertSizing = False
      OptionsCustomizing.ColumnVertSizing = False
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsSelection.InvertSelect = False
      OptionsView.CellEndEllipsis = True
      OptionsView.CellTextMaxLineCount = -1
      OptionsView.ShowEditButtons = ecsbFocused
      OptionsView.ColumnAutoWidth = True
      ParentColor = False
      Preview.AutoHeight = False
      Preview.MaxLineCount = 2
      RootValue = -1
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      Styles.ContentEven = dmMain.cxStyleGridEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridOddRow
      TabOrder = 0
      object cxDBTreeList1FULLNAME: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 1024
        Properties.ReadOnly = True
        Caption.Text = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1051#1060
        DataBinding.FieldName = 'FULLNAME'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
  end
  object sb: TStatusBar
    Left = 0
    Top = 217
    Width = 459
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object odsDrugForms: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM Rls.Tdrugforms')
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F494401000000000009000000464B5F5041
      52454E540100000000000700000046435F4E414D450100000000000800000046
      554C4C4E414D45010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    AfterScroll = odsDrugFormsAfterScroll
    Left = 24
    Top = 64
    object odsDrugFormsFK_ID: TFloatField
      FieldName = 'FK_ID'
      Required = True
    end
    object odsDrugFormsFK_PARENT: TFloatField
      FieldName = 'FK_PARENT'
    end
    object odsDrugFormsFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Size = 1024
    end
    object odsDrugFormsFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 1024
    end
  end
  object dsDrugForms: TDataSource
    DataSet = odsDrugForms
    Left = 24
    Top = 112
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 216
    Top = 48
    object acSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acSelectExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCancelExecute
    end
    object acCollExpand: TAction
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100
      Hint = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 53
      ShortCut = 122
      OnExecute = acCollExpandExecute
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmRlsDragForms\'
    StoredValues = <>
    Left = 216
    Top = 114
  end
end
