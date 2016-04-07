object frmSetParam: TfrmSetParam
  Left = 383
  Top = 209
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
  ClientHeight = 273
  ClientWidth = 394
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
    Width = 388
    Height = 225
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    OnClick = aCancelExecute
    ExplicitTop = 34
    object cxLabel2: TcxLabel
      Left = 10
      Top = 16
      Caption = #1055#1077#1088#1080#1086#1076' '#1089':'
    end
    object cxDateBeg: TcxDateEdit
      Left = 108
      Top = 15
      Properties.DateButtons = [btnNow, btnToday]
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.ShowTime = False
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.ButtonStyle = btsDefault
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Width = 81
    end
    object cxLabel3: TcxLabel
      Left = 195
      Top = 16
      Caption = #1087#1086':'
    end
    object cxDateEnd: TcxDateEdit
      Left = 221
      Top = 15
      Properties.DateButtons = [btnNow, btnToday]
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 3
      Width = 79
    end
    object bbSetPeriod: TcxButton
      Left = 306
      Top = 13
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100'...'
      TabOrder = 4
      OnClick = bbSetPeriodClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxLabel1: TcxLabel
      Left = 10
      Top = 111
      Caption = #1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100':'
    end
    object cxLabel4: TcxLabel
      Left = 10
      Top = 79
      Caption = #1055#1088#1086#1078#1080#1074#1072#1077#1090':'
    end
    object cxNational: TcxLookupComboBox
      Left = 108
      Top = 110
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsNational
      Properties.PostPopupValueOnTab = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 7
      Width = 192
    end
    object cxProj: TcxLookupComboBox
      Left = 108
      Top = 78
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsProj
      Properties.PostPopupValueOnTab = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 8
      Width = 192
    end
    object cxLabel5: TcxLabel
      Left = 10
      Top = 47
      Caption = #1042#1086#1079#1088#1072#1089#1090' '#1089':'
    end
    object cxLabel6: TcxLabel
      Left = 195
      Top = 47
      Caption = #1087#1086':'
    end
    object seAgeStart: TcxSpinEdit
      Left = 108
      Top = 46
      Properties.ImmediatePost = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 11
      Width = 81
    end
    object seAgeEnd: TcxSpinEdit
      Left = 221
      Top = 46
      Properties.ImmediatePost = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 12
      Width = 79
    end
    object cxLabel7: TcxLabel
      Left = 306
      Top = 47
      Caption = #1083#1077#1090
    end
    object cxLabel8: TcxLabel
      Left = 10
      Top = 173
      Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099':'
    end
    object beWork: TcxButtonEdit
      Left = 10
      Top = 196
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ViewStyle = vsHideCursor
      Properties.OnButtonClick = beWorkPropertiesButtonClick
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 15
      Width = 371
    end
    object cxLabel9: TcxLabel
      Left = 10
      Top = 142
      Caption = #1059#1095#1072#1089#1090#1086#1082':'
    end
    object beUch: TcxButtonEdit
      Left = 108
      Top = 141
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ViewStyle = vsHideCursor
      Properties.OnButtonClick = beUchPropertiesButtonClick
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 17
      Width = 273
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 231
    Width = 388
    Height = 39
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 144
    ExplicitTop = 272
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bSet: TcxButton
      Left = 227
      Top = 6
      Width = 75
      Height = 25
      Action = aSet
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 306
      Top = 6
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object alOkCancel: TActionList
    Images = frmMain.ilMain
    Left = 528
    Top = 40
    object aSet: TAction
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
      ShortCut = 113
      OnExecute = aSetExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object dsProj: TDataSource
    DataSet = odsProj
    Left = 408
    Top = 34
  end
  object odsProj: TOracleDataSet
    SQL.Strings = (
      'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FN_ORDER'
      '  FROM DUAL'
      ''
      'UNION ALL'
      ' '
      'SELECT FK_ID, FC_NAME, FN_ORDER'
      '  FROM ASU.TSMID '
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'PD_MZ'#39')'
      '   AND FL_SHOWPRINT = 1 '
      '   AND FL_DEL = 0'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FN_ORDER'
      '  FROM ASU.TSMID '
      ' WHERE FC_SYNONIM = '#39'LIVEIN_SELO'#39
      '   AND FL_SHOWPRINT = 1 '
      '   AND FL_DEL = 0'
      ''
      'ORDER BY FN_ORDER   ')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 448
    Top = 32
  end
  object odsNational: TOracleDataSet
    SQL.Strings = (
      'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME'
      '  FROM DUAL'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME'
      '  FROM ASU.TSMID'
      'WHERE FC_SYNONIM = '#39'NAROD_HANT'#39' OR FC_SYNONIM = '#39'NAROD_MANSI'#39
      '  AND FL_SHOWPRINT = 1'
      '  AND FL_DEL = 0'
      'START WITH FC_SYNONIM = '#39'LD_NAROD'#39
      'CONNECT BY PRIOR FK_ID = FK_OWNER '
      '')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 448
    Top = 88
  end
  object dsNational: TDataSource
    DataSet = odsNational
    Left = 408
    Top = 90
  end
end
