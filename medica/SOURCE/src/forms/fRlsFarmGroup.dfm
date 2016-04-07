object frmRlsFarmGroup: TfrmRlsFarmGroup
  Left = 254
  Top = 164
  Width = 417
  Height = 419
  Caption = #1042#1099#1073#1086#1088' '#1092#1072#1088#1084' '#1075#1088#1091#1087#1087#1099' '#1056#1051#1057
  Color = clBtnFace
  Constraints.MinHeight = 240
  Constraints.MinWidth = 320
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object paRls: TPanel
    Left = 0
    Top = 42
    Width = 409
    Height = 350
    Align = alClient
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 1
      Top = 169
      Width = 407
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object paName: TPanel
      Left = 1
      Top = 1
      Width = 407
      Height = 168
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        407
        168)
      object lbFilter: TLabel
        Left = 6
        Top = 10
        Width = 43
        Height = 13
        Caption = #1060#1080#1083#1100#1090#1088':'
      end
      object edFilter: TEdit
        Left = 52
        Top = 6
        Width = 350
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = edFilterChange
      end
      object grRlsFarmGroups: TcxDBTreeList
        Left = 6
        Top = 32
        Width = 397
        Height = 131
        Anchors = [akLeft, akTop, akRight, akBottom]
        Bands = <
          item
            Caption.AlignHorz = taCenter
          end>
        BufferedPaint = True
        DataController.DataSource = dsRlsFarmGroups
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
        OptionsCustomizing.BandMoving = False
        OptionsCustomizing.BandVertSizing = False
        OptionsCustomizing.ColumnMoving = False
        OptionsCustomizing.ColumnVertSizing = False
        OptionsData.Editing = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsSelection.InvertSelect = False
        OptionsView.CellEndEllipsis = True
        OptionsView.CellTextMaxLineCount = -1
        OptionsView.ShowEditButtons = ecsbFocused
        OptionsView.ColumnAutoWidth = True
        OptionsView.Indicator = True
        ParentColor = False
        Preview.AutoHeight = False
        Preview.MaxLineCount = 2
        RootValue = -1
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        Styles.ContentEven = dmMain.cxStyleGridEvenRow
        Styles.ContentOdd = dmMain.cxStyleGridOddRow
        TabOrder = 1
        object cxDBTreeList1FK_ID: TcxDBTreeListColumn
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          DataBinding.FieldName = 'FK_ID'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxDBTreeList1FK_PARENT: TcxDBTreeListColumn
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Visible = False
          DataBinding.FieldName = 'FK_PARENT'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxDBTreeList1FC_NAME: TcxDBTreeListColumn
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 90
          Properties.ReadOnly = True
          Caption.Text = #1053#1072#1079#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_NAME'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object paDescription: TPanel
      Left = 1
      Top = 172
      Width = 407
      Height = 177
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object gbDescription: TGroupBox
        Left = 0
        Top = 0
        Width = 407
        Height = 177
        Align = alClient
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          407
          177)
        object meRlsDescription: TDBMemo
          Left = 6
          Top = 16
          Width = 395
          Height = 155
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clBtnFace
          DataField = 'DESCRIPTION'
          DataSource = dsRlsFarmGroups
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 409
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 38
        Width = 405
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 392
      Height = 38
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 62
      Caption = 'ToolBar1'
      Flat = True
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton2: TToolButton
        Left = 0
        Top = 0
        Action = aOk
      end
      object ToolButton1: TToolButton
        Left = 62
        Top = 0
        Action = aCancel
      end
      object ToolButton3: TToolButton
        Left = 124
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 132
        Top = 0
        Action = aExpandCollapse
        Caption = #1056#1072#1079#1074'/'#1057#1074#1077#1088
      end
    end
  end
  object odsRlsFarmGroups: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM rls.tpharmgroup'
      'ORDER BY fk_id,fc_name')
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F494401000000000009000000464B5F5041
      52454E540100000000000700000046435F4E414D450100000000000B00000044
      45534352495054494F4E000000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    FilterOptions = [foCaseInsensitive]
    Left = 16
    Top = 112
    object odsRlsFarmGroupsFK_ID: TFloatField
      FieldName = 'FK_ID'
      Required = True
    end
    object odsRlsFarmGroupsFK_PARENT: TFloatField
      FieldName = 'FK_PARENT'
      Required = True
    end
    object odsRlsFarmGroupsFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Size = 90
    end
    object odsRlsFarmGroupsDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      BlobType = ftOraClob
    end
  end
  object dsRlsFarmGroups: TDataSource
    DataSet = odsRlsFarmGroups
    Left = 16
    Top = 168
  end
  object alRls: TActionList
    Images = dmMain.ilMain
    Left = 368
    Top = 48
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1086#1088' '#1092#1072#1088#1084#1075#1088#1091#1087#1087#1099
      ImageIndex = 9
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 8
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aExpandCollapse: TAction
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100'/'#1057#1074#1077#1088#1085#1091#1090#1100
      Hint = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100'/'#1057#1074#1077#1088#1085#1091#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 54
      ShortCut = 122
      OnExecute = aExpandCollapseExecute
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmRlsFarmGroup\'
    StoredProps.Strings = (
      'paName.Height')
    StoredValues = <>
    Left = 352
    Top = 336
  end
end
