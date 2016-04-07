object frmSetKontrast: TfrmSetKontrast
  Left = 442
  Top = 80
  BorderStyle = bsDialog
  Caption = #1050#1086#1085#1090#1088#1072#1089#1090' ('#1090#1080#1087')'
  ClientHeight = 473
  ClientWidth = 392
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
  object cxTreeTypeKontrast: TcxDBTreeList
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 386
    Height = 422
    Align = alTop
    Bands = <
      item
      end>
    BufferedPaint = False
    DataController.DataSource = dsTypeKontrast
    DataController.ParentField = 'FK_OWNER'
    DataController.KeyField = 'FK_ID'
    OptionsBehavior.CellHints = True
    OptionsBehavior.IncSearch = True
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsView.CellAutoHeight = True
    OptionsView.ColumnAutoWidth = True
    OptionsView.Headers = False
    OptionsView.Indicator = True
    RootValue = -1
    TabOrder = 0
    OnDblClick = cxTreeTypeKontrastDblClick
    OnFocusedNodeChanged = cxTreeTypeKontrastFocusedNodeChanged
    OnKeyDown = cxTreeTypeKontrastKeyDown
    object cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn
      Caption.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DataBinding.FieldName = 'FC_NAME'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 428
    Width = 386
    Height = 42
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 136
    ExplicitTop = 432
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bOk: TcxButton
      Left = 223
      Top = 7
      Width = 75
      Height = 25
      Action = aOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 304
      Top = 7
      Width = 75
      Height = 25
      Action = aEsc
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object odsTypeKontrast: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FK_OWNER, FN_ORDER '
      '  FROM asu.TSMID'
      ' WHERE FL_SHOWPRINT = 1 '
      '   AND level <> 1'
      
        'START WITH FK_ID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM' +
        ' = '#39'XRAY_TYPEKONTRAST'#39')'
      'CONNECT BY PRIOR FK_ID = FK_OWNER '
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464B5F4F574E455201000000000008000000464E
      5F4F52444552010000000000}
    Session = frmMain.os
    Left = 186
    Top = 123
  end
  object dsTypeKontrast: TDataSource
    DataSet = odsTypeKontrast
    Left = 218
    Top = 123
  end
  object al: TActionList
    Left = 168
    Top = 232
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aEsc: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aEscExecute
    end
  end
end
