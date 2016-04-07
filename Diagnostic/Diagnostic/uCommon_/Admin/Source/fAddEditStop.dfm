object frmAddEditStop: TfrmAddEditStop
  Left = 265
  Top = 131
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1083#1080' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1089#1090#1086#1103#1085#1082#1091
  ClientHeight = 289
  ClientWidth = 456
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
    Width = 450
    Height = 247
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 24
      Top = 15
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    end
    object teName: TcxTextEdit
      Left = 120
      Top = 14
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
      TabOrder = 0
      Width = 311
    end
    object teFName: TcxTextEdit
      Left = 120
      Top = 39
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
    object cxLabel3: TcxLabel
      Left = 24
      Top = 40
      Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077':'
    end
    object cbPlat: TcxCheckBox
      Left = 120
      Top = 66
      Caption = #1055#1083#1072#1090#1085#1072#1103
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
      State = cbsGrayed
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 2
      Width = 121
    end
    object memComment: TcxMemo
      Left = 120
      Top = 118
      Properties.ScrollBars = ssVertical
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 4
      Height = 89
      Width = 311
    end
    object cxLabel2: TcxLabel
      Left = 24
      Top = 119
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080':'
    end
    object cxLabel4: TcxLabel
      Left = 24
      Top = 91
      Caption = #1053#1072#1076#1073#1072#1074#1082#1072'('#1088#1091#1073'.):'
    end
    object cePrice: TcxCurrencyEdit
      Left = 120
      Top = 91
      Properties.DisplayFormat = '0.00'
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 3
      Width = 121
    end
    object cxLabel5: TcxLabel
      Left = 24
      Top = 213
      Caption = #1056#1072#1081#1086#1085':'
    end
    object lcbRaion: TcxLookupComboBox
      Left = 120
      Top = 213
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
      Properties.ListSource = dsRaion
      Properties.PostPopupValueOnTab = True
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 10
      Width = 249
    end
  end
  object bOk: TcxButton
    Left = 297
    Top = 257
    Width = 75
    Height = 25
    Action = aOk
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
  end
  object cxButton1: TcxButton
    Left = 378
    Top = 257
    Width = 75
    Height = 25
    Action = aCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.SkinName = 'Caramel'
  end
  object al: TActionList
    Left = 51
    Top = 139
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
  object dsRaion: TDataSource
    DataSet = odsRaion
    Left = 347
    Top = 67
  end
  object odsRaion: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name '
      '  from taxi.ts_raion'
      ' where fl_del = 0'
      'order by fc_name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 299
    Top = 67
  end
end
