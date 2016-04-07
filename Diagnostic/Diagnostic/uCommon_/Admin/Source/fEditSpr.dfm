object frmEditStr: TfrmEditStr
  Left = 360
  Top = 178
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1091#1083#1080#1094#1099
  ClientHeight = 167
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 448
    Height = 126
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 24
      Top = 15
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object teName: TcxTextEdit
      Left = 113
      Top = 14
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 1
      Width = 311
    end
    object cxLabel2: TcxLabel
      Left = 24
      Top = 40
      Caption = #1050#1086#1088#1086#1090#1082#1086':'
    end
    object teShortName: TcxTextEdit
      Left = 113
      Top = 39
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 3
      Width = 311
    end
    object lbPref: TcxLabel
      Left = 24
      Top = 63
      Caption = #1055#1088#1077#1092#1092#1080#1082#1089':'
    end
    object lcbPref: TcxLookupComboBox
      Left = 113
      Top = 64
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FC_PREFFIX'
      Properties.ListColumns = <
        item
          FieldName = 'FC_PREFFIX'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsPref
      Properties.PostPopupValueOnTab = True
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 5
      Width = 80
    end
    object cbShowInFromWhere: TcxCheckBox
      Left = 113
      Top = 89
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074' '#1072#1076#1088#1077#1089#1077' '#1082#1083#1080#1077#1085#1090#1072
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 6
      Width = 311
    end
  end
  object bOk: TcxButton
    Left = 294
    Top = 135
    Width = 75
    Height = 25
    Action = aOk
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
  end
  object cxButton1: TcxButton
    Left = 376
    Top = 135
    Width = 75
    Height = 25
    Action = aCancel
    TabOrder = 2
    LookAndFeel.SkinName = 'Caramel'
  end
  object al: TActionList
    Left = 419
    Top = 75
    object aOk: TAction
      Caption = 'Ok'
      Hint = 'OK'
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
  object odsPref: TOracleDataSet
    SQL.Strings = (
      'select distinct fc_preffix '
      '  from taxi.tstreet '
      'order by fc_preffix')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {04000000010000000A00000046435F50524546464958010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 336
    Top = 72
  end
  object dsPref: TDataSource
    DataSet = odsPref
    Left = 376
    Top = 72
  end
end
