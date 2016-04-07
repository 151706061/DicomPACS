object frmSetPer: TfrmSetPer
  Left = 394
  Top = 79
  BorderStyle = bsDialog
  Caption = 'frmSetPer'
  ClientHeight = 406
  ClientWidth = 432
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object tlList: TcxDBTreeList
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 426
    Height = 366
    Align = alTop
    Bands = <
      item
      end>
    BufferedPaint = False
    DataController.DataSource = dsList
    DataController.ParentField = 'FK_OWNER'
    DataController.KeyField = 'FK_ID'
    LookAndFeel.SkinName = 'Caramel'
    OptionsBehavior.CellHints = True
    OptionsBehavior.IncSearch = True
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsView.ColumnAutoWidth = True
    OptionsView.Indicator = True
    RootValue = -1
    TabOrder = 0
    OnDblClick = tlListDblClick
    OnFocusedNodeChanged = tlListFocusedNodeChanged
    object tlListcxDBTreeListColumn1: TcxDBTreeListColumn
      Caption.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DataBinding.FieldName = 'FC_NAME'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object bOk: TcxButton
    Left = 273
    Top = 376
    Width = 75
    Height = 25
    Action = aOk
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
  end
  object bCancel: TcxButton
    Left = 354
    Top = 376
    Width = 75
    Height = 25
    Action = aCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.SkinName = 'Caramel'
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 80
    Top = 144
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      
        'select fk_id, fc_name, fk_owner, asu.get_smidname(fk_owner) as o' +
        'wnname'
      '  from asu.tsmid'
      ' where level <> 1'
      'start with fc_synonim = :pfc_synonim'
      'connect by prior fk_id = fk_owner ')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A5046435F53594E4F4E494D0500000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464B5F4F574E4552010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 120
    Top = 144
  end
  object al: TActionList
    Left = 80
    Top = 216
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
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
