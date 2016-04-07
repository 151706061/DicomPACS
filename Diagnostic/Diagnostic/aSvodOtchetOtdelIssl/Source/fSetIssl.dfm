object frmSetIssl: TfrmSetIssl
  Left = 383
  Top = 110
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
  ClientHeight = 448
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grIssl: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 426
    Height = 398
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object tvIssl: TcxGridDBTableView
      OnKeyDown = tvIsslKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvIsslCellDblClick
      DataController.DataSource = dsIssl
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = tvIssl_NAME
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvIssl_NAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
      end
    end
    object grIsslLevel1: TcxGridLevel
      GridView = tvIssl
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 404
    Width = 426
    Height = 41
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 104
    ExplicitTop = 416
    ExplicitWidth = 185
    object bOK: TcxButton
      Left = 265
      Top = 8
      Width = 75
      Height = 25
      Action = aOk
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 343
      Top = 8
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object odsIssl: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name '
      '  from asu.tsmid '
      ' where fl_showanal = 1'
      '   and level <> 1'
      'start with fc_synonim = '#39'ISL_FUNC_DIAGNOST'#39
      'connect by prior fk_id = fk_owner')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 160
    Top = 128
  end
  object dsIssl: TDataSource
    DataSet = odsIssl
    Left = 160
    Top = 80
  end
  object al: TActionList
    Left = 88
    Top = 232
    object aOk: TAction
      Caption = #1054#1050
      Hint = #1042#1099#1073#1088#1072#1090#1100
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
