object frmAddEditPlace: TfrmAddEditPlace
  Left = 482
  Top = 237
  BorderStyle = bsDialog
  Caption = #1052#1077#1089#1090#1086
  ClientHeight = 234
  ClientWidth = 428
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
    Width = 422
    Height = 182
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 451
    object cxLabel1: TcxLabel
      Left = 9
      Top = 14
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object teName: TcxTextEdit
      Left = 98
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
      Left = 9
      Top = 40
      Caption = #1056#1072#1081#1086#1085':'
    end
    object lcbRaion: TcxLookupComboBox
      Left = 98
      Top = 39
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
      TabOrder = 3
      Width = 249
    end
    object cxLabel3: TcxLabel
      Left = 9
      Top = 64
      Caption = #1040#1076#1088#1077#1089':'
    end
    object teAdr: TcxTextEdit
      Left = 98
      Top = 64
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
      TabOrder = 5
      Width = 311
    end
    object gbTalon: TcxGroupBox
      Left = 98
      Top = 89
      Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1090#1072#1083#1086#1085#1091
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 6
      Height = 84
      Width = 257
      object cxLabel10: TcxLabel
        Left = 16
        Top = 23
        Caption = #1055#1086#1076#1072#1095#1072':'
      end
      object ceCar: TcxCurrencyEdit
        Left = 102
        Top = 23
        Properties.DisplayFormat = '0.00'
        Style.LookAndFeel.SkinName = 'Caramel'
        StyleDisabled.LookAndFeel.SkinName = 'Caramel'
        StyleFocused.LookAndFeel.SkinName = 'Caramel'
        StyleHot.LookAndFeel.SkinName = 'Caramel'
        TabOrder = 1
        Width = 121
      end
      object cxLabel11: TcxLabel
        Left = 16
        Top = 48
        Caption = #1052#1080#1085#1091#1090#1072':'
      end
      object ceMin: TcxCurrencyEdit
        Left = 102
        Top = 48
        Properties.DisplayFormat = '0.00'
        Style.LookAndFeel.SkinName = 'Caramel'
        StyleDisabled.LookAndFeel.SkinName = 'Caramel'
        StyleFocused.LookAndFeel.SkinName = 'Caramel'
        StyleHot.LookAndFeel.SkinName = 'Caramel'
        TabOrder = 3
        Width = 121
      end
      object cxLabel12: TcxLabel
        Left = 227
        Top = 23
        Caption = #1088#1091#1073'.'
      end
      object cxLabel13: TcxLabel
        Left = 227
        Top = 48
        Caption = #1088#1091#1073'.'
      end
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 188
    Width = 422
    Height = 43
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 24
    ExplicitTop = 200
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bOk: TcxButton
      Left = 251
      Top = 8
      Width = 75
      Height = 25
      Action = aOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Caramel'
    end
    object cxButton1: TcxButton
      Left = 334
      Top = 8
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Caramel'
    end
  end
  object al: TActionList
    Left = 395
    Top = 35
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
    Left = 27
    Top = 179
  end
  object dsRaion: TDataSource
    DataSet = odsRaion
    Left = 59
    Top = 179
  end
end
