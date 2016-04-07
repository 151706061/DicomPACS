object frmEdit: TfrmEdit
  Left = 425
  Top = 131
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100
  ClientHeight = 361
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alTop
    Caption = #1051#1080#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 0
    Height = 183
    Width = 417
    object cxLabel1: TcxLabel
      Left = 11
      Top = 17
      Caption = #1060#1072#1084#1080#1083#1080#1103':'
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -13
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxFam: TcxTextEdit
      Left = 126
      Top = 19
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.BorderColor = clBtnText
      StyleDisabled.Color = clBtnHighlight
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.TextColor = clBtnText
      StyleFocused.BorderColor = clInactiveCaptionText
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Text = 'FAM'
      OnKeyPress = cxFamKeyPress
      Width = 283
    end
    object cxLabel3: TcxLabel
      Left = 11
      Top = 43
      Caption = #1048#1084#1103':'
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -13
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxName: TcxTextEdit
      Left = 126
      Top = 45
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.BorderColor = clBtnText
      StyleDisabled.Color = clBtnHighlight
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.TextColor = clBtnText
      StyleFocused.BorderColor = clInactiveCaptionText
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 3
      Text = 'NAME'
      OnKeyPress = cxNameKeyPress
      Width = 283
    end
    object cxLabel4: TcxLabel
      Left = 11
      Top = 69
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -13
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxOtch: TcxTextEdit
      Left = 126
      Top = 71
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.BorderColor = clBtnText
      StyleDisabled.Color = clBtnHighlight
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.TextColor = clBtnText
      StyleFocused.BorderColor = clInactiveCaptionText
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 5
      Text = 'OTCH'
      OnKeyPress = cxOtchKeyPress
      Width = 283
    end
    object cxLabel2: TcxLabel
      Left = 11
      Top = 95
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.:'
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -13
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxdeRojd: TcxDateEdit
      Left = 126
      Top = 97
      ParentFont = False
      Properties.DateOnError = deToday
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.ShowTime = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.BorderColor = clBtnText
      StyleDisabled.Color = clBtnHighlight
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.TextColor = clBtnText
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 7
      Width = 121
    end
    object cxLabel5: TcxLabel
      Left = 11
      Top = 125
      Caption = #1055#1086#1083':'
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -13
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxMale: TcxRadioButton
      Left = 126
      Top = 128
      Width = 89
      Height = 17
      Caption = #1052#1091#1078#1089#1082#1086#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
      Transparent = True
    end
    object cxFemale: TcxRadioButton
      Left = 215
      Top = 128
      Width = 79
      Height = 17
      Caption = #1046#1077#1085#1089#1082#1080#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
      Transparent = True
    end
    object cxLabel7: TcxLabel
      Left = 11
      Top = 151
      Caption = #1058#1077#1083#1077#1092#1086#1085' ('#1089#1086#1090'.):'
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -13
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object mePhone: TcxMaskEdit
      Left = 126
      Top = 153
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+'
      Properties.MaxLength = 0
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 12
      Width = 283
    end
  end
  object cxGroupBox2: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 189
    Margins.Top = 0
    Align = alTop
    Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1060#1043
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 1
    Height = 121
    Width = 417
    object cxLabel6: TcxLabel
      Left = 11
      Top = 18
      Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100':'
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -13
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxPeriod: TcxLookupComboBox
      Left = 129
      Top = 19
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
      Left = 11
      Top = 41
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103':'
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -13
      Style.Font.Name = 'Arial'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Transparent = True
      Visible = False
    end
    object cxCat: TcxLookupComboBox
      Left = 129
      Top = 42
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
      Width = 280
    end
    object cbRgPlus: TcxCheckBox
      Left = 126
      Top = 67
      Hint = #1054#1090#1084#1077#1090#1082#1072' '#1086' '#1090#1086#1084', '#1095#1090#1086' '#1087#1072#1094#1080#1077#1085#1090' '#1103#1074#1083#1103#1077#1090#1089#1103' '#1088#1077#1085#1090#1075#1077#1085' '#1087#1086#1083#1086#1078#1080#1090#1077#1083#1100#1085#1099#1084
      Caption = 'Rg +'
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.TextColor = clBlack
      Style.TextStyle = []
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 4
      Transparent = True
      Width = 121
    end
    object cbMed: TcxCheckBox
      Left = 126
      Top = 90
      Caption = #1052#1077#1076#1088#1072#1073#1086#1090#1085#1080#1082
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.OnEditValueChanged = cbMedPropertiesEditValueChanged
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.TextColor = clBlack
      Style.TextStyle = []
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 5
      Transparent = True
      Width = 121
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 313
    Width = 417
    Height = 45
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object bOk: TcxButton
      Left = 254
      Top = 9
      Width = 75
      Height = 25
      Action = actOK
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 334
      Top = 9
      Width = 75
      Height = 25
      Action = actCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object actlstOKCancel: TActionList
    Left = 36
    Top = 282
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
    Left = 337
    Top = 187
  end
  object dsPeriod: TDataSource
    DataSet = odsPeriod
    Left = 377
    Top = 187
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
    Left = 345
    Top = 259
  end
  object dsCat: TDataSource
    DataSet = odsCat
    Left = 377
    Top = 259
  end
end
