object frmWork: TfrmWork
  Left = 275
  Top = 57
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1084#1077#1089#1090#1072' '#1088#1072#1073#1086#1090#1099
  ClientHeight = 441
  ClientWidth = 853
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
  object grWork: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 847
    Height = 342
    Margins.Top = 0
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object tvWork: TcxGridDBTableView
      OnKeyDown = tvWorkKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvWorkCellDblClick
      DataController.DataSource = dsWork
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
      object tvWorkName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
      end
    end
    object grWorkLevel1: TcxGridLevel
      GridView = tvWork
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 847
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 1
    object FilterText: TcxTextEdit
      Left = 64
      Top = 10
      Properties.CharCase = ecUpperCase
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      OnClick = FilterTextClick
      OnEnter = FilterTextEnter
      OnKeyUp = FilterTextKeyUp
      Width = 353
    end
    object cxLabel1: TcxLabel
      Left = 12
      Top = 11
      Caption = #1060#1080#1083#1100#1090#1088':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object bbClear: TcxButton
      Left = 423
      Top = 8
      Width = 26
      Height = 25
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbClearClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000A40206B0030AAE0000A600009800000000
        00000000000000000000A700009A0000A70000000000000000000000000000A9
        1844F6194DF81031D20102AB0000B60000000000000000B10928D7092ED70313
        B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
        00B00000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
        1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
        F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
        52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
        0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
        AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
        5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
        0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
        A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
        6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
        0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
        C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
        13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
        000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
        FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
        00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
        0000000000000000CF0000C00000CE0000000000000000000000000000C40001
        B80000B500007700000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 392
    Width = 847
    Height = 46
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object bbOk: TcxButton
      Left = 686
      Top = 10
      Width = 75
      Height = 25
      Action = aOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bbCancel: TcxButton
      Left = 764
      Top = 10
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 336
    Top = 152
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1084#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
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
  object odsWork: TOracleDataSet
    SQL.Strings = (
      'SELECT TCOMPANY.FK_ID, '
      '       UPPER(TCOMPANY.FC_NAME) FC_NAME'
      '  FROM ASU.TCOMPANY'
      ' WHERE FL_DEL = 0'
      'CONNECT BY PRIOR FK_ID = FK_OWNER'
      
        'START WITH FK_ID = (SELECT FK_ID FROM ASU.TCOMPANY WHERE FC_SYNO' +
        'NIM = '#39'ROOT_HMAO_SL'#39')'
      ''
      'ORDER BY FC_SHORT'
      ''
      '')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 176
    Top = 176
  end
  object dsWork: TDataSource
    DataSet = odsWork
    Left = 176
    Top = 224
  end
end
