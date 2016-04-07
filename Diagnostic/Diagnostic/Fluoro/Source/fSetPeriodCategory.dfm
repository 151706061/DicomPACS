object frmSetPeriodCategory: TfrmSetPeriodCategory
  Left = 379
  Top = 134
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100', '#1082#1072#1090#1077#1075#1086#1088#1080#1102
  ClientHeight = 129
  ClientWidth = 429
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
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 423
    Height = 75
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 14
      Top = 11
      Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100':'
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
    end
    object cxPeriod: TcxLookupComboBox
      Left = 127
      Top = 12
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsPeriod
      Properties.OnEditValueChanged = cxPeriodPropertiesEditValueChanged
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Width = 145
    end
    object lbCat: TcxLabel
      Left = 14
      Top = 42
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103':'
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      Visible = False
    end
    object cxCat: TcxLookupComboBox
      Left = 127
      Top = 43
      Properties.DropDownListStyle = lsFixedList
      Properties.GridMode = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsCat
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 3
      Visible = False
      Width = 283
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 81
    Width = 423
    Height = 45
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 96
    ExplicitTop = 192
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bSave: TcxButton
      Left = 254
      Top = 9
      Width = 75
      Height = 25
      Action = actOK
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 335
      Top = 9
      Width = 75
      Height = 25
      Action = actCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object actlstOKCancel: TActionList
    Images = frmMain.ilMain
    Left = 268
    Top = 10
    object actOK: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ShortCut = 113
      OnExecute = actOKExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100
      ShortCut = 27
      OnExecute = actCancelExecute
    end
  end
  object odsPeriod: TOracleDataSet
    SQL.Strings = (
      
        'SELECT -1 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FN_ORDER, '#39#39' AS FC_SYNON' +
        'IM'
      '  FROM DUAL'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FN_ORDER, FC_SYNONIM '
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'XRAY_PERIOD_OSMOTROV'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F524445520100000000000A0000004643
      5F53594E4F4E494D010000000000}
    Session = frmMain.os
    Left = 57
    Top = 43
  end
  object dsPeriod: TDataSource
    DataSet = odsPeriod
    Left = 89
    Top = 43
  end
  object odsCat: TOracleDataSet
    SQL.Strings = (
      
        'SELECT -1 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FN_ORDER, '#39#39' AS FC_SYNON' +
        'IM'
      '  FROM DUAL'
      ''
      'UNION ALL'
      ' '
      'SELECT FK_ID, FC_NAME, FN_ORDER, FC_SYNONIM '
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= :PFC_SYNONIM)'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A5046435F53594E4F4E494D0500000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F524445520100000000000A0000004643
      5F53594E4F4E494D010000000000}
    Session = frmMain.os
    Left = 57
    Top = 83
  end
  object dsCat: TDataSource
    DataSet = odsCat
    Left = 89
    Top = 83
  end
end
