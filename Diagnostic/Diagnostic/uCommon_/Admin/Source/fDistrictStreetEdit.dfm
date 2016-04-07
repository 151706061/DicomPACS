object frmDistrictStreetEdit: TfrmDistrictStreetEdit
  Left = 433
  Top = 203
  BorderStyle = bsDialog
  ClientHeight = 215
  ClientWidth = 359
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
  object cxButton1: TcxButton
    Left = 199
    Top = 183
    Width = 75
    Height = 25
    Action = aOk
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    LookAndFeel.SkinName = 'Caramel'
  end
  object cxButton2: TcxButton
    Left = 281
    Top = 183
    Width = 75
    Height = 25
    Action = aCancel
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 353
    Height = 174
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    ExplicitWidth = 1360
    object Label1: TLabel
      Left = 14
      Top = 13
      Width = 34
      Height = 13
      Caption = #1056#1072#1081#1086#1085':'
    end
    object Label2: TLabel
      Left = 14
      Top = 40
      Width = 35
      Height = 13
      Caption = #1059#1083#1080#1094#1072':'
    end
    object Label3: TLabel
      Left = 14
      Top = 64
      Width = 123
      Height = 13
      Caption = #1044#1086#1084#1072' '#1095#1077#1090#1085#1086#1081' '#1089#1090#1086#1088#1086#1085#1099' '#1089':'
    end
    object Label4: TLabel
      Left = 14
      Top = 91
      Width = 130
      Height = 13
      Caption = #1044#1086#1084#1072' '#1095#1077#1090#1085#1086#1081' '#1089#1090#1086#1088#1086#1085#1099' '#1087#1086':'
    end
    object Label5: TLabel
      Left = 14
      Top = 118
      Width = 135
      Height = 13
      Caption = #1044#1086#1084#1072' '#1085#1077#1095#1077#1090#1085#1086#1081' '#1089#1090#1086#1088#1086#1085#1099' '#1089':'
    end
    object Label6: TLabel
      Left = 14
      Top = 145
      Width = 142
      Height = 13
      Caption = #1044#1086#1084#1072' '#1085#1077#1095#1077#1090#1085#1086#1081' '#1089#1090#1086#1088#1086#1085#1099' '#1087#1086':'
    end
    object cmbRaion: TcxLookupComboBox
      Left = 61
      Top = 10
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'fk_id'
      Properties.ListColumns = <
        item
          FieldName = 'fc_name'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsRaion
      Properties.OnChange = cmbRaionPropertiesChange
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 0
      Width = 281
    end
    object cmbStreet: TcxLookupComboBox
      Left = 61
      Top = 37
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'fk_id'
      Properties.ListColumns = <
        item
          FieldName = 'fc_mapname'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsStreet
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 1
      Width = 281
    end
    object teEvenS: TcxTextEdit
      Left = 162
      Top = 62
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 2
      OnKeyPress = teEvenSKeyPress
      Width = 180
    end
    object teEvenPo: TcxTextEdit
      Left = 162
      Top = 89
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 3
      OnKeyPress = teEvenSKeyPress
      Width = 180
    end
    object teOddS: TcxTextEdit
      Left = 162
      Top = 116
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 4
      OnKeyPress = teEvenSKeyPress
      Width = 180
    end
    object teOddPo: TcxTextEdit
      Left = 162
      Top = 143
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 5
      OnKeyPress = teEvenSKeyPress
      Width = 180
    end
  end
  object al: TActionList
    Left = 168
    Top = 96
    object aOk: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
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
  object qInsert: TOracleQuery
    SQL.Strings = (
      
        'insert into taxi.tdistrict (fk_raion, fk_street, fn_evens, fn_ev' +
        'enpo, fn_odds, fn_oddpo)'
      
        'values (:pfk_raion, :pfk_street, :pfn_evens, :pfn_evenpo, :pfn_o' +
        'dds, :pfn_oddpo) returning fk_id into :pid')
    Optimize = False
    Variables.Data = {
      03000000070000000A0000003A50464B5F5241494F4E03000000000000000000
      00000B0000003A50464B5F5354524545540300000000000000000000000A0000
      003A50464E5F4556454E530300000000000000000000000B0000003A50464E5F
      4556454E504F030000000000000000000000090000003A50464E5F4F44445303
      00000000000000000000000A0000003A50464E5F4F4444504F03000000000000
      0000000000040000003A504944030000000000000000000000}
    Left = 208
    Top = 112
  end
  object odsRaion: TOracleDataSet
    SQL.Strings = (
      
        'select * from taxi.ts_raion r where r.fl_del = 0 order by fc_nam' +
        'e')
    Optimize = False
    Left = 320
    Top = 104
  end
  object dsRaion: TDataSource
    DataSet = odsRaion
    Left = 112
    Top = 8
  end
  object dsStreet: TDataSource
    DataSet = odsStreet
    Left = 200
    Top = 32
  end
  object odsStreet: TOracleDataSet
    SQL.Strings = (
      
        'select r.fk_id, r.fc_name || '#39' '#39'|| r.fc_preffix||'#39'.'#39' fc_mapname ' +
        'from taxi.tstreet r '
      
        '--where not exists (select 1 from taxi.tdistrict d where d.fk_ra' +
        'ion = :praion and d.fk_street = r.fk_id)'
      'order by fc_name')
    Optimize = False
    Left = 168
    Top = 32
  end
  object qUpdate: TOracleQuery
    SQL.Strings = (
      'update taxi.tdistrict'
      'set fk_raion = :pfk_raion, '
      '    fk_street = :pfk_street, '
      '    fn_evens = :pfn_evens, '
      '    fn_evenpo = :pfn_evenpo, '
      '    fn_odds = :pfn_odds, '
      '    fn_oddpo = :pfn_oddpo'
      'where fk_id = :pid')
    Optimize = False
    Variables.Data = {
      03000000070000000A0000003A50464B5F5241494F4E03000000000000000000
      00000B0000003A50464B5F5354524545540300000000000000000000000A0000
      003A50464E5F4556454E530300000000000000000000000B0000003A50464E5F
      4556454E504F030000000000000000000000090000003A50464E5F4F44445303
      00000000000000000000000A0000003A50464E5F4F4444504F03000000000000
      0000000000040000003A504944030000000000000000000000}
    Left = 240
    Top = 112
  end
  object odsDistrict: TOracleDataSet
    SQL.Strings = (
      'select * from taxi.tdistrict d where d.fk_id = :pfk_id')
    Optimize = False
    Variables.Data = {0300000001000000070000003A50464B5F4944030000000000000000000000}
    Left = 280
    Top = 104
  end
end
