object frmFindDrv: TfrmFindDrv
  Left = 245
  Top = 90
  BorderStyle = bsDialog
  Caption = #1055#1086#1080#1089#1082' '#1090#1072#1082#1089#1080#1089#1090#1072
  ClientHeight = 532
  ClientWidth = 923
  Color = clCream
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
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 917
    Height = 62
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    object teFind: TcxTextEdit
      Left = 9
      Top = 8
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextColor = clNavy
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 0
      OnClick = teFindClick
      OnEnter = teFindEnter
      OnKeyUp = teFindKeyUp
      Width = 456
    end
    object bClear: TcxButton
      Left = 471
      Top = 6
      Width = 33
      Height = 31
      Action = aClear
      TabOrder = 1
      LookAndFeel.SkinName = 'Caramel'
    end
    object rbFio: TcxRadioButton
      Left = 568
      Top = 4
      Width = 113
      Height = 17
      Caption = #1087#1086' '#1060#1048#1054
      TabOrder = 2
      OnClick = rbFioClick
      LookAndFeel.SkinName = 'Caramel'
    end
    object rbMarka: TcxRadioButton
      Left = 568
      Top = 41
      Width = 161
      Height = 17
      Caption = #1087#1086' '#1084#1072#1088#1082#1077', '#1085#1086#1084#1077#1088#1091', '#1094#1074#1077#1090#1091
      TabOrder = 3
      OnClick = rbMarkaClick
      LookAndFeel.SkinName = 'Caramel'
    end
    object rbName: TcxRadioButton
      Left = 568
      Top = 23
      Width = 113
      Height = 17
      Caption = #1087#1086' '#1087#1086#1079#1099#1074#1085#1086#1084#1091
      TabOrder = 4
      OnClick = rbNameClick
      LookAndFeel.SkinName = 'Caramel'
    end
  end
  object bClose: TcxButton
    Left = 882
    Top = 9
    Width = 33
    Height = 31
    Action = aClose
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
  end
  object bFind: TcxButton
    Left = 513
    Top = 9
    Width = 33
    Height = 31
    Action = aFind
    TabOrder = 2
    LookAndFeel.SkinName = 'Caramel'
  end
  object grFind: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 68
    Width = 917
    Height = 461
    Margins.Top = 0
    Align = alClient
    PopupMenu = pmGrid
    TabOrder = 3
    LookAndFeel.SkinName = 'Caramel'
    object tvFind: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvFindCellDblClick
      DataController.DataSource = dsFind
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = tvFindName
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
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object tvFindName: TcxGridDBColumn
        Caption = #1055#1086#1079#1099#1074#1085#1086#1081
        DataBinding.FieldName = 'FC_NAME'
      end
      object tvFindFIO: TcxGridDBColumn
        Caption = #1060#1048#1054
        DataBinding.FieldName = 'FC_FIO'
      end
      object tvFindAuto: TcxGridDBColumn
        Caption = #1040#1074#1090#1086
        DataBinding.FieldName = 'FC_AUTO'
      end
      object tvFindTaxi: TcxGridDBColumn
        Caption = #1058#1072#1082#1089#1080
        DataBinding.FieldName = 'TAXINAME'
      end
    end
    object grFindLevel1: TcxGridLevel
      GridView = tvFind
    end
  end
  object al: TActionList
    Images = frmMain.IL
    Left = 600
    Top = 168
    object aClear: TAction
      Enabled = False
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1074#1074#1086#1076#1072
      ImageIndex = 10
      ShortCut = 119
      OnExecute = aClearExecute
    end
    object aFind: TAction
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080' '#1087#1077#1088#1077#1081#1090#1080' '#1082' '#1090#1072#1082#1089#1080#1089#1090#1091
      ImageIndex = 8
      ShortCut = 113
      OnExecute = aFindExecute
    end
    object aClose: TAction
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091' '#1087#1086#1080#1089#1082#1072
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
  end
  object odsFind: TOracleDataSet
    SQL.Strings = (
      
        'select t1.fk_id, t1.fc_name, t1.fc_fio, t1.fc_auto, t1.fk_taxiid' +
        ','
      
        '       upper(t1.fc_name) as fc_name_up, upper(t1.fc_fio) as fc_f' +
        'io_up, upper(t1.fc_auto) as fc_auto_up,'
      '       t2.fc_name as taxiname'
      '  from taxi.ts_drivers t1, taxi.ts_taxi t2'
      ' where t1.fl_del = 0'
      '   and t1.fk_taxiid = t2.fk_id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000900000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000600000046435F46494F0100000000000700000046435F41
      55544F01000000000009000000464B5F5441584949440100000000000A000000
      46435F4E414D455F55500100000000000900000046435F46494F5F5550010000
      0000000A00000046435F4155544F5F555001000000000008000000544158494E
      414D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 424
    Top = 173
  end
  object dsFind: TDataSource
    DataSet = odsFind
    Left = 424
    Top = 128
  end
  object pmGrid: TPopupMenu
    Images = frmMain.IL
    Left = 600
    Top = 224
    object N1: TMenuItem
      Action = aFind
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1090#1072#1082#1089#1080#1089#1090#1072' '#1080' '#1087#1077#1088#1077#1081#1090#1080
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 7
      OnClick = N3Click
    end
  end
end
