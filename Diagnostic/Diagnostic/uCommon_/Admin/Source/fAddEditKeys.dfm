object frmAddEditKeys: TfrmAddEditKeys
  Left = 361
  Top = 174
  BorderStyle = bsDialog
  Caption = #1050#1085#1086#1087#1082#1072
  ClientHeight = 216
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    367
    216)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 361
    Height = 174
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 24
      Top = 14
      Caption = #1050#1086#1076'*:'
    end
    object teName: TcxTextEdit
      Left = 176
      Top = 12
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.ReadOnly = True
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
      Text = #1053#1072#1078#1084#1080#1090#1077' '#1074' '#1087#1086#1083#1077' '#1085#1091#1078#1085#1091#1102' '#1082#1085#1086#1087#1082#1091
      OnKeyDown = teNameKeyDown
      Width = 177
    end
    object cxLabel2: TcxLabel
      Left = 24
      Top = 68
      Caption = #1057#1080#1084#1074#1086#1083'*:'
    end
    object cxLabel3: TcxLabel
      Left = 24
      Top = 92
      Caption = #1057#1080#1085#1086#1085#1080#1084':'
    end
    object teAction: TcxTextEdit
      Left = 87
      Top = 115
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
      TabOrder = 7
      Width = 266
    end
    object cxLabel4: TcxLabel
      Left = 24
      Top = 115
      Caption = #1044#1077#1081#1089#1090#1074#1080#1077':'
    end
    object lblCode: TcxLabel
      Left = 87
      Top = 11
      Caption = '67'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object teSymbol: TcxTextEdit
      Left = 87
      Top = 68
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
      Width = 266
    end
    object teSynonym: TcxTextEdit
      Left = 87
      Top = 92
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
      TabOrder = 6
      Width = 266
    end
    object cbShift: TcxCheckBox
      Left = 87
      Top = 37
      Caption = 'Shift'
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 2
      Width = 50
    end
    object cbCtrl: TcxCheckBox
      Left = 143
      Top = 37
      Caption = 'Ctrl'
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 3
      Width = 50
    end
    object cbAlt: TcxCheckBox
      Left = 199
      Top = 37
      Caption = 'Alt'
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 4
      Width = 50
    end
    object cxLabel5: TcxLabel
      Left = 24
      Top = 143
      Caption = #1056#1072#1081#1086#1085':'
    end
  end
  object bOk: TcxButton
    Left = 214
    Top = 184
    Width = 75
    Height = 25
    Action = aOk
    Anchors = [akRight, akBottom]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
  end
  object cxButton1: TcxButton
    Left = 288
    Top = 184
    Width = 75
    Height = 25
    Action = aCancel
    Anchors = [akRight, akBottom]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.SkinName = 'Caramel'
  end
  object cmbRaion: TcxLookupComboBox
    Left = 90
    Top = 143
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'fk_id'
    Properties.ListColumns = <
      item
        FieldName = 'fc_name'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsRaion
    Style.LookAndFeel.SkinName = 'Caramel'
    StyleDisabled.LookAndFeel.SkinName = 'Caramel'
    StyleFocused.LookAndFeel.SkinName = 'Caramel'
    StyleHot.LookAndFeel.SkinName = 'Caramel'
    TabOrder = 3
    Width = 266
  end
  object al: TActionList
    Left = 291
    Top = 51
    object aOk: TAction
      Caption = 'Ok'
      Hint = 'OK'
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object odsInfo: TOracleDataSet
    SQL.Strings = (
      'select * from taxi.ttaxidispetcherkey s where oid = :poid')
    Optimize = False
    Variables.Data = {0300000001000000050000003A504F4944610000000000000000000000}
    Left = 262
    Top = 53
  end
  object qUpdateKey: TOracleQuery
    SQL.Strings = (
      'update taxi.ttaxidispetcherkey '
      'set fc_key = :pfc_key, '
      '    fc_synonym = :pfc_synonym, '
      '    fc_name = :pfc_name, '
      '    fc_symbol = :pfc_symbol,'
      '    fl_shift = :pfl_shift,'
      '    fl_ctrl = :pfl_ctrl, '
      '    fl_alt = :pfl_alt,'
      '    fk_raion = :pfk_raion'
      'where oid = :poid')
    Optimize = False
    Variables.Data = {
      0300000009000000080000003A5046435F4B4559050000000000000000000000
      0C0000003A5046435F53594E4F4E594D05000000000000000000000009000000
      3A5046435F4E414D450500000000000000000000000B0000003A5046435F5359
      4D424F4C050000000000000000000000050000003A504F494461000000000000
      00000000000A0000003A50464C5F534849465403000000000000000000000009
      0000003A50464C5F4354524C030000000000000000000000080000003A50464C
      5F414C540300000000000000000000000A0000003A50464B5F5241494F4E0300
      00000000000000000000}
    Left = 288
    Top = 88
  end
  object qInsKey: TOracleQuery
    SQL.Strings = (
      
        'insert into taxi.ttaxidispetcherkey (fc_key, fc_synonym, fc_name' +
        ', fc_symbol, fl_shift, fl_ctrl, fl_alt, fk_raion)'
      
        'values (:pfc_key, :pfc_synonym, :pfc_name, :pfc_symbol, :pfl_shi' +
        'ft, :pfl_ctrl, :pfl_alt, :pfk_raion)'
      'returning oid into :poid')
    Optimize = False
    Variables.Data = {
      0300000009000000080000003A5046435F4B4559050000000000000000000000
      0C0000003A5046435F53594E4F4E594D05000000000000000000000009000000
      3A5046435F4E414D450500000000000000000000000B0000003A5046435F5359
      4D424F4C050000000000000000000000050000003A504F494461000000000000
      00000000000A0000003A50464C5F534849465403000000000000000000000009
      0000003A50464C5F4354524C030000000000000000000000080000003A50464C
      5F414C540300000000000000000000000A0000003A50464B5F5241494F4E0300
      00000000000000000000}
    Left = 256
    Top = 88
  end
  object dsRaion: TDataSource
    DataSet = odsRaion
    Left = 112
    Top = 144
  end
  object odsRaion: TOracleDataSet
    SQL.Strings = (
      'select null fk_id, '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39' fc_name from dual'
      'union all'
      'select fk_id, fc_name from'
      
        '(select r.fk_id, r.fc_name from taxi.ts_raion r order by fn_orde' +
        'r)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000046435F4E414D4501000000000005000000464B5F
      4944010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 144
    Top = 144
  end
end
