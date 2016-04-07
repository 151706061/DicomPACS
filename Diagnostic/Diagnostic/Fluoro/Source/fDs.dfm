object frmDs: TfrmDs
  Left = 228
  Top = 79
  BorderStyle = bsDialog
  Caption = #1044#1080#1072#1075#1085#1086#1079#1099' '#1087#1072#1094#1080#1077#1085#1090#1072
  ClientHeight = 355
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grDs: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 856
    Height = 297
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object tvDs: TcxGridDBTableView
      OnDblClick = tvDsDblClick
      OnKeyDown = tvDsKeyDown
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsDs
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvDs_Vid: TcxGridDBColumn
        Caption = #1042#1080#1076
        DataBinding.FieldName = 'FL_MAIN'
        Width = 73
      end
      object tvDs_Ds: TcxGridDBColumn
        Caption = #1044#1080#1072#1075#1085#1086#1079
        DataBinding.FieldName = 'FC_WRITE'
        Width = 631
      end
      object tvDs_MKB: TcxGridDBColumn
        Caption = #1052#1050#1041'-10'
        DataBinding.FieldName = 'MKB10'
        Width = 45
      end
      object tvDs_Type: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'FP_TYPE'
        Width = 93
      end
    end
    object grDsLevel1: TcxGridLevel
      GridView = tvDs
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 303
    Width = 856
    Height = 49
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 272
    ExplicitTop = 312
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bOk: TcxButton
      Left = 694
      Top = 11
      Width = 75
      Height = 25
      Action = aOK
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 772
      Top = 11
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 512
    Top = 224
    object aOK: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1076#1080#1072#1075#1085#1086#1079
      ShortCut = 113
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object odsDs: TOracleDataSet
    SQL.Strings = (
      'select fc_write,'
      '       asu.get_smidname(fp_type) as fp_type,'
      '       asu.get_smidname(fl_main) as fl_main,'
      
        '       (select fk_mkb10 from asu.tsmid where fk_id = tdiag.fk_sm' +
        'diagid) as mkb10 '
      '  from asu.tdiag'
      
        ' where fk_pacid in (select fk_id from asu.tkarta where fk_peplid' +
        ' = asu.get_peplid(:pfk_pacid)'
      '                    union all'
      
        '                    select fk_id from asu.tambulance where fk_pe' +
        'plid = asu.get_peplid(:pfk_pacid))'
      'order by fd_date')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464B5F504143494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000700000046505F545950450100000000000800000046435F
      575249544501000000000007000000464C5F4D41494E01000000000005000000
      4D4B423130010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Active = True
    Left = 432
    Top = 96
  end
  object dsDs: TDataSource
    DataSet = odsDs
    Left = 376
    Top = 96
  end
end
