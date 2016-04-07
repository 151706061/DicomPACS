object frmSetParam: TfrmSetParam
  Left = 410
  Top = 205
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
  ClientHeight = 140
  ClientWidth = 455
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
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 449
    Height = 86
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    ExplicitTop = 33
    object cxLabel1: TcxLabel
      Left = 5
      Top = 12
      Caption = #1050#1086#1084#1087#1072#1085#1080#1103' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091':'
    end
    object cxLabel2: TcxLabel
      Left = 74
      Top = 53
      Caption = #1055#1077#1088#1080#1086#1076' '#1089':'
    end
    object cxDateBeg: TcxDateEdit
      Left = 128
      Top = 52
      Properties.DateButtons = [btnClear, btnNow, btnToday]
      Properties.ShowTime = False
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.ButtonStyle = btsDefault
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 2
      Width = 102
    end
    object cxLabel3: TcxLabel
      Left = 241
      Top = 53
      Caption = #1087#1086':'
    end
    object cxDateEnd: TcxDateEdit
      Left = 259
      Top = 52
      Properties.DateButtons = [btnClear, btnNow, btnToday]
      Properties.ShowTime = False
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 4
      Width = 102
    end
    object bbSetPeriod: TcxButton
      Left = 367
      Top = 50
      Width = 75
      Height = 25
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
      Caption = #1042#1099#1073#1088#1072#1090#1100'...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = bbSetPeriodClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxCompany: TcxLookupComboBox
      Left = 128
      Top = 11
      Hint = #1050#1086#1084#1087#1072#1085#1080#1103' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091
      Properties.AutoSelect = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.HideSelection = False
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsCompany
      Properties.ReadOnly = False
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.BorderColor = clBtnText
      StyleDisabled.Color = clBtnHighlight
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.TextColor = clBtnText
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 6
      Width = 314
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 92
    Width = 449
    Height = 45
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    ExplicitLeft = 200
    ExplicitTop = 136
    ExplicitWidth = 185
    ExplicitHeight = 41
    object cxButton1: TcxButton
      Left = 367
      Top = 9
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton2: TcxButton
      Left = 286
      Top = 9
      Width = 75
      Height = 25
      Action = aSet
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object BM: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = frmMain.ILMain
    PopupMenuLinks = <>
    Style = bmsXP
    UseSystemFont = True
    Left = 256
    Top = 8
    DockControlHeights = (
      0
      0
      0
      0)
  end
  object alOkCancel: TActionList
    Images = frmMain.ILMain
    Left = 296
    Top = 8
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
  object odsCompany: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME '
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'X' +
        'RAY_COMPANY_DOGOVOR'#39')'
      '   AND FL_DEL = 0'
      'ORDER BY FC_NAME')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 360
    Top = 2
  end
  object dsCompany: TDataSource
    DataSet = odsCompany
    Left = 400
    Top = 2
  end
end
