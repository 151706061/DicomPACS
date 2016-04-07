object FrameKartFields: TFrameKartFields
  Left = 0
  Top = 0
  Width = 488
  Height = 276
  AutoSize = True
  TabOrder = 0
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 228
    Align = alTop
    Caption = ' Количество и цена '
    TabOrder = 1
    Height = 48
    Width = 488
    object Label4: TLabel
      Left = 230
      Top = 21
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Кол-во:'
    end
    object Label5: TLabel
      Left = 372
      Top = 21
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Сумма:'
    end
    object Label6: TLabel
      Left = 81
      Top = 21
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Цена:'
    end
    object sePrice_: TdxSpinEdit
      Left = 118
      Top = 18
      Width = 99
      Style.BorderStyle = xbsFlat
      Style.ButtonStyle = btsFlat
      Style.ButtonTransparence = ebtNone
      Style.HotTrack = False
      Style.Shadow = False
      TabOrder = 3
      Visible = False
      ValueType = vtFloat
      StoredValues = 8
    end
    object seKol: TdxSpinEdit
      Left = 271
      Top = 17
      Width = 70
      Style.BorderStyle = xbsFlat
      Style.ButtonStyle = btsFlat
      Style.ButtonTransparence = ebtNone
      Style.HotTrack = False
      Style.Shadow = False
      TabOrder = 1
      Alignment = taLeftJustify
      ValueType = vtFloat
      StoredValues = 25
    end
    object sesumm: TJvValidateEdit
      Left = 411
      Top = 17
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 2
      DisplayFormat = dfCurrency
    end
    object cePriceView: TJvValidateEdit
      Left = 115
      Top = 17
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 0
      DisplayFormat = dfCurrency
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = ' Партия '
    TabOrder = 0
    Height = 228
    Width = 488
    object Label1: TLabel
      Left = 41
      Top = 51
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'Медикамент:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 265
      Top = 20
      Width = 89
      Height = 13
      Alignment = taRightJustify
      Caption = 'Серийный номер:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 31
      Top = 87
      Width = 77
      Height = 13
      Alignment = taRightJustify
      Caption = 'Срок годности:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblProducer: TLabel
      Left = 26
      Top = 135
      Width = 82
      Height = 13
      Alignment = taRightJustify
      Caption = 'Производитель:'
    end
    object lblCertificate: TLabel
      Left = 44
      Top = 159
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Сертификат:'
    end
    object lbPartyID: TLabel
      Left = 55
      Top = 20
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = '№ партии:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 306
      Top = 87
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ед. Изм.:'
    end
    object Bevel1: TBevel
      Left = 112
      Top = 46
      Width = 368
      Height = 2
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 112
      Top = 183
      Width = 368
      Height = 2
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 24
      Top = 195
      Width = 83
      Height = 13
      Alignment = taRightJustify
      Caption = 'Группа мат. отв.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edMedic: TJvComboEdit
      Left = 112
      Top = 56
      Width = 370
      Height = 21
      ClickKey = 32
      DirectInput = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      ParentFont = False
      TabOrder = 2
      OnButtonClick = edMedicButtonClick
      OnChange = edMedicChange
    end
    object edSerial: TEdit
      Left = 358
      Top = 16
      Width = 122
      Height = 21
      TabOrder = 1
    end
    object edGoden: TDateTimePicker
      Left = 112
      Top = 83
      Width = 103
      Height = 21
      CalAlignment = dtaLeft
      Date = 37152.4417152315
      Time = 37152.4417152315
      ShowCheckbox = True
      Checked = False
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
    end
    object edProducer: TJvComboEdit
      Left = 112
      Top = 132
      Width = 369
      Height = 21
      ClickKey = 32
      DirectInput = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      ParentFont = False
      TabOrder = 7
      OnButtonClick = edProducerCertificateButtonClick
    end
    object edCertificate: TJvComboEdit
      Left = 112
      Top = 156
      Width = 369
      Height = 21
      ClickKey = 32
      DirectInput = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GlyphKind = gkEllipsis
      ButtonWidth = 16
      NumGlyphs = 1
      ParentFont = False
      TabOrder = 8
      OnButtonClick = edProducerCertificateButtonClick
    end
    object cbProdCert: TCheckBox
      Left = 112
      Top = 111
      Width = 369
      Height = 17
      Caption = 'Использовать информацию о производителе и сертификате'
      TabOrder = 6
      OnClick = cbProdCertClick
    end
    object edPartyID: TEdit
      Left = 112
      Top = 16
      Width = 103
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edEdIzm: TEdit
      Left = 358
      Top = 83
      Width = 122
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object edMO_NAME: TEdit
      Left = 112
      Top = 191
      Width = 369
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 9
    end
    object lcbEdizm: TDBLookupComboBox
      Left = 274
      Top = 106
      Width = 67
      Height = 21
      DropDownRows = 2
      KeyField = 'EIID'
      ListField = 'FC_EDIZM'
      ListSource = dsEdizm
      TabOrder = 5
      Visible = False
    end
  end
  object dsEdizm: TDataSource
    DataSet = odsEdizm
    Left = 280
    Top = 60
  end
  object odsEdizm: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '   tei.fc_name'
      'from MED.TMEDIC, MED.TEI'
      'where'
      '  tmedic.eiid = tei.eiid   '
      '  and tmedic.medicid = :medicid')
    Variables.Data = {
      0300000001000000080000003A4D454449434944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000004000000454949440100000000000800000046435F454449
      5A4D010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 232
    Top = 60
  end
end
