object frmKem: TfrmKem
  Left = 423
  Top = 87
  BorderStyle = bsDialog
  Caption = #1050#1077#1084' '#1085#1072#1087#1088#1072#1074#1083#1077#1085
  ClientHeight = 524
  ClientWidth = 418
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
  object cxKem: TcxDBTreeList
    AlignWithMargins = True
    Left = 3
    Top = 36
    Width = 412
    Height = 436
    Margins.Top = 0
    Align = alTop
    Bands = <
      item
      end>
    BufferedPaint = False
    DataController.DataSource = dsKem
    DataController.ParentField = 'FK_OWNER'
    DataController.KeyField = 'FK_ID'
    LookAndFeel.Kind = lfFlat
    LookAndFeel.SkinName = ''
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
    OnDblClick = cxKemDblClick
    OnFocusedNodeChanged = cxKemFocusedNodeChanged
    OnKeyDown = cxKemKeyDown
    ExplicitLeft = 155
    ExplicitTop = 45
    ExplicitWidth = 408
    object cxDBTreeListColumn1: TcxDBTreeListColumn
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
    Top = 3
    Width = 412
    Height = 30
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object cxLabel1: TcxLabel
      Left = 3
      Top = 6
      Caption = #1060#1080#1083#1100#1090#1088':'
    end
    object teFilter: TcxTextEdit
      Left = 47
      Top = 5
      Properties.CharCase = ecUpperCase
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      OnClick = teFilterClick
      OnEnter = teFilterEnter
      OnKeyUp = teFilterKeyUp
      Width = 360
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 475
    Width = 412
    Height = 46
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    ExplicitLeft = 48
    ExplicitTop = 480
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bOK: TcxButton
      Left = 243
      Top = 10
      Width = 76
      Height = 25
      Action = aOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 326
      Top = 10
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 168
    Top = 344
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1082#1077#1084' '#1085#1072#1087#1088#1072#1074#1083#1077#1085
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
  object odsKem: TOracleDataSet
    SQL.Strings = (
      
        'SELECT FK_ID, FC_NAME, UPPER(FC_NAME) AS FC_NAME_UP, FK_OWNER, F' +
        'N_ORDER '
      '  FROM ASU.TSMID'
      ' WHERE FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0 '
      
        '   AND FK_ID <> (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ' +
        #39'KEM_NAPRAVLEN'#39') '
      
        'START WITH FK_ID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM' +
        ' = '#39'KEM_NAPRAVLEN'#39')'
      'CONNECT BY PRIOR FK_ID = FK_OWNER '
      ''
      'UNION ALL'
      ''
      
        'SELECT FK_ID, FC_NAME, UPPER(FC_NAME) AS FC_NAME_UP, FK_OWNER, 1' +
        '000 as FN_ORDER'
      '  FROM ASU.TSMID'
      'WHERE FL_SHOWPRINT = 1'
      'START WITH FC_SYNONIM = '#39'PD_NAPRAVIV_YCH'#39
      'CONNECT BY PRIOR FK_ID = FK_OWNER '
      ''
      '/*UNION ALL'
      ''
      
        'select fk_id, fc_name, upper(fc_name) as fc_name_up, fk_ownerid ' +
        'as fk_owner, 100000 as fn_order'
      '  from asu.totdel'
      ' where connect_by_isleaf = 1'
      '   and fl_del = 0'
      'start with fk_id = asu.get_polikotdel'
      'connect by prior fk_id = fk_ownerid */'
      ''
      'ORDER BY FN_ORDER ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464B5F4F574E455201000000000008000000464E
      5F4F52444552010000000000}
    Session = frmMain.os
    Left = 234
    Top = 195
  end
  object dsKem: TDataSource
    DataSet = odsKem
    Left = 266
    Top = 195
  end
end
