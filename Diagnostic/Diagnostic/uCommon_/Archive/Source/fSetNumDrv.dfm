object frmSetNumDrv: TfrmSetNumDrv
  Left = 405
  Top = 49
  BorderStyle = bsDialog
  Caption = 'frmSetNumDrv'
  ClientHeight = 600
  ClientWidth = 678
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grDrv: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 672
    Height = 507
    Margins.Top = 0
    Align = alTop
    PopupMenu = pmTV
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    LookAndFeel.SkinName = ''
    ExplicitLeft = 0
    ExplicitWidth = 678
    object tvDrv: TcxGridDBTableView
      OnKeyDown = tvDrvKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvDrvCellDblClick
      DataController.DataSource = dsDrv
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = tvDrvNumDrv
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvDrvNumDrv: TcxGridDBColumn
        Caption = #1055#1086#1079#1099#1074#1085#1086#1081
        DataBinding.FieldName = 'FC_NAME'
      end
      object tvDrvFIO: TcxGridDBColumn
        Caption = #1060#1048#1054
        DataBinding.FieldName = 'FC_FIO'
      end
      object tvDrvCar: TcxGridDBColumn
        Caption = #1052#1072#1096#1080#1085#1072
        DataBinding.FieldName = 'FC_AUTO'
      end
      object tvDrvTaxiName: TcxGridDBColumn
        Caption = #1058#1072#1082#1089#1080
        DataBinding.FieldName = 'TAXINAME'
      end
    end
    object grDrvLevel1: TcxGridLevel
      GridView = tvDrv
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 672
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object cxLabel1: TcxLabel
      Left = 11
      Top = 13
      Caption = #1060#1080#1083#1100#1090#1088':'
    end
    object teFilter: TcxTextEdit
      Left = 60
      Top = 11
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 119
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      OnClick = teFilterClick
      OnEnter = teFilterEnter
      OnKeyUp = teFilterKeyUp
      Width = 333
    end
    object cxLabel2: TcxLabel
      Left = 399
      Top = 12
      Caption = #1087#1086':'
    end
    object cbFilter: TcxComboBox
      Left = 425
      Top = 11
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items.Strings = (
        #1087#1086#1079#1099#1074#1085#1086#1084#1091
        #1092#1080#1086
        #1084#1072#1096#1080#1085#1077)
      Properties.PostPopupValueOnTab = True
      Properties.OnChange = cbFilterPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 3
      Width = 152
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 557
    Width = 672
    Height = 40
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    ExplicitLeft = 144
    ExplicitTop = 568
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bbSave: TcxButton
      Left = 512
      Top = 7
      Width = 75
      Height = 25
      Action = aSave
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bbCancel: TcxButton
      Left = 590
      Top = 7
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object dsDrv: TDataSource
    DataSet = odsDrv
    Left = 397
    Top = 147
  end
  object odsDrv: TOracleDataSet
    SQL.Strings = (
      'select t1.fk_id,'
      '       t1.fc_fio, upper(t1.fc_fio) as fc_fio_up,'
      '       t1.fc_auto, upper(t1.fc_auto) as fc_auto_up,'
      '       t1.fc_name, upper(t1.fc_name) as fc_name_up,'
      '       t2.fc_name as taxiname          '
      '  from taxi.ts_drivers t1, taxi.ts_taxi t2'
      ' where t1.fk_taxiid = t2.fk_id'
      'order by fc_fio')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000600000046435F4649
      4F0100000000000700000046435F4155544F0100000000000700000046435F4E
      414D4501000000000008000000544158494E414D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 435
    Top = 147
  end
  object al: TActionList
    Left = 357
    Top = 283
    object aSave: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object pmTV: TPopupMenu
    Left = 152
    Top = 224
    object N1: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FDF1
        E500FDF1E500FFEDD500FFE9CE00FFE3C500FEDEBC00FFDAB100FFD5A600FFD1
        9F00FFCC9800FFD8A100BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FBF3
        EA00FBF3EA00FFEFDC00FFEDD500FEE5CA00FFE3C500FFDAB100FFDAB100FFD5
        A600FFCC9800FFD8A100BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF6
        F000FBF3EA00FDF1E500FFEDD500FFE9CE00FFE3C500FEDEBC00FFDAB100FED7
        AB00FFD5A600FFD5A600BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FBF3EA00FDF1E500FFEDD500FEE5CA00FFE3C500FEDEBC00FFDA
        B100FFD8A100FED7AB00BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FCF8F700FDF1E500FFEFDC00FFEDD500FEE5CA00FFE9C200DEC2
        B100DEBDA600FFE9B200BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FCF8F700FCF8F700FBF3EA00FDF1E500FFF2D700D9C2C100090A
        9000090A9000D5BBAC00BC4B0000FF00FF00090A900000028F00BC4B0000FAEF
        E500FBF3EA00FBF3EA00FDF1E500FAE7D400FEE5CA00FFE3C500C1A5A700090A
        9000112DEA00090A900065416600090A90000622EB0000039200BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000EF9037009754
        3D00090A90001933E200090A9000122DE50000039200FF00FF00FF00FF00BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
        000045265800090A90003C66FF00090A9000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00090A9000354CE000090A90002C46E700090A9000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00090A
        90004F65E70006099000FF00FF00090A90002C46E70006099000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00090A
        9000090A9000FF00FF00FF00FF00FF00FF000609900000028F00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      OnClick = N1Click
    end
  end
end
