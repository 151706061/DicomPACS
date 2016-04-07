object frmMedKardEdit: TfrmMedKardEdit
  Left = 512
  Top = 169
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1072#1088#1090#1080#1080
  ClientHeight = 427
  ClientWidth = 488
  Color = clBtnFace
  Constraints.MaxHeight = 455
  Constraints.MaxWidth = 496
  Constraints.MinHeight = 315
  Constraints.MinWidth = 494
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 488
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 486
      end>
    EdgeBorders = [ebTop, ebBottom]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 479
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 60
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acSave
      end
      object ToolButton4: TToolButton
        Left = 60
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 68
        Top = 0
        Action = acCancel
      end
      object ToolButton3: TToolButton
        Left = 128
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 9
        Style = tbsSeparator
        Visible = False
      end
      object ToolButton5: TToolButton
        Left = 136
        Top = 0
        Action = acAdd
        Visible = False
      end
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 44
    Align = alClient
    Caption = ' '#1055#1072#1088#1090#1080#1103' '
    TabOrder = 1
    Height = 312
    Width = 488
    object Panel2: TPanel
      Left = 2
      Top = 18
      Width = 484
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lbPartyID: TLabel
        Left = 38
        Top = 7
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #8470' '#1087#1072#1088#1090#1080#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 234
        Top = 7
        Width = 89
        Height = 13
        Alignment = taRightJustify
        Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sbuCheckBrak: TSpeedButton
        Left = 453
        Top = 3
        Width = 21
        Height = 21
        Action = acCheckBrak
        AllowAllUp = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF007B7B7B007B7B7B007B7B
          7B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF007B0000007B0000007B0000007B7B7B007B7B
          7B007B7B7B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FFFF00007B7B00007B7B00007B7B00007B7B00007B0000007B7B
          7B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FFFF00007B7B00007B7B00007B7B00007B7B00007B000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FFFF0000FFFF0000FFFF00007B7B7B007B7B7B007B7B
          7B007B7B7B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF007B0000007B0000007B0000007B0000007B7B
          7B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FFFF00007B7B00007B7B00007B7B00007B0000007B7B7B007B7B
          7B007B7B7B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FFFF0000FFFF00007B7B00007B7B00007B0000007B7B7B007B7B
          7B007B7B7B007B7B7B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FFFF00007B7B00007B7B00007B0000007B00
          00007B7B7B007B7B7B007B7B7B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFF00007B7B00007B7B00007B7B
          00007B0000007B7B7B007B7B7B007B7B7B007B7B7B00FF00FF00FF00FF00FF00
          FF00FF00FF007B7B7B007B7B7B007B7B7B00FF00FF00FFFF00007B7B00007B7B
          00007B7B00007B0000007B0000007B7B7B007B7B7B007B7B7B00FF00FF00FF00
          FF007B0000007B7B7B007B7B7B007B7B7B007B7B7B00FFFF0000FFFF00007B7B
          00007B7B00007B7B00007B0000007B0000007B7B7B007B7B7B00FFFF00007B7B
          00007B7B00007B7B00007B0000007B7B7B007B7B7B007B7B7B007B7B7B00FFFF
          00007B7B00007B7B00007B7B00007B0000007B7B7B007B7B7B00FFFF0000FFFF
          00007B7B00007B7B00007B7B00007B7B00007B0000007B0000007B0000007B7B
          00007B7B00007B7B00007B7B00007B000000FF00FF00FF00FF00FF00FF00FF00
          FF00FFFF0000FFFF0000FFFF00007B7B00007B7B00007B7B00007B7B00007B7B
          00007B7B0000FFFF0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FFFF0000FFFF0000FFFF00007B7B00007B7B00007B7B
          0000FFFF0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        Transparent = False
        Visible = False
      end
      object edSerial: TEdit
        Left = 327
        Top = 3
        Width = 147
        Height = 21
        TabOrder = 1
      end
      object edFN_Party_num: TEdit
        Left = 95
        Top = 3
        Width = 103
        Height = 21
        TabOrder = 0
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 145
      Width = 484
      Height = 58
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object Bevel1: TBevel
        Left = 95
        Top = 4
        Width = 379
        Height = 2
        Shape = bsTopLine
      end
      object Label1: TLabel
        Left = 12
        Top = 12
        Width = 79
        Height = 13
        Alignment = taRightJustify
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 14
        Top = 41
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 290
        Top = 41
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = #1045#1076'. '#1048#1079#1084'.:'
      end
      object edMedic: TJvComboEdit
        Left = 97
        Top = 10
        Width = 380
        Height = 21
        ButtonWidth = 16
        ClickKey = 32
        DirectInput = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImageKind = ikEllipsis
        ParentFont = False
        TabOrder = 0
        OnButtonClick = edMedicButtonClick
        OnChange = edMedicChange
      end
      object chbGoden: TCheckBox
        Left = 95
        Top = 39
        Width = 16
        Height = 17
        Hint = #1059#1082#1072#1079#1072#1090#1100' '#1089#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
        Caption = 'chbGoden'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = chbGodenClick
      end
      object dedGoden: TcxDateEdit
        Left = 116
        Top = 37
        EditValue = 0d
        Enabled = False
        Properties.DateButtons = [btnToday]
        Properties.InputKind = ikMask
        Properties.PostPopupValueOnTab = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnValidate = dedGodenPropertiesValidate
        Style.BorderStyle = ebs3D
        TabOrder = 2
        Width = 81
      end
      object edEdIzm: TEdit
        Left = 342
        Top = 37
        Width = 133
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object paInvNomer: TPanel
      Left = 2
      Top = 117
      Width = 484
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label3: TLabel
        Left = 30
        Top = 10
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = #1048#1085#1074'. '#1085#1086#1084#1077#1088':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edInvNomer: TEdit
        Left = 95
        Top = 6
        Width = 380
        Height = 21
        TabOrder = 0
      end
    end
    object paFinSource_VidPost: TPanel
      Left = 2
      Top = 272
      Width = 484
      Height = 31
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 5
      DesignSize = (
        484
        31)
      object laFinSource: TLabel
        Left = 24
        Top = 13
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object laVidPost: TLabel
        Left = 276
        Top = 13
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = #1042#1080#1076' '#1087#1086#1089#1090'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Bevel2: TBevel
        Left = 95
        Top = 4
        Width = 379
        Height = 2
        Shape = bsTopLine
      end
      object lcbFinSource: TDBLookupComboBox
        Left = 95
        Top = 9
        Width = 150
        Height = 21
        Hint = #1048#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        KeyField = 'FK_ID'
        ListField = 'FC_NAME'
        ListSource = dmMain.dsTFinSource
        NullValueKey = 46
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = False
      end
      object lcbVidPost: TDBLookupComboBox
        Left = 325
        Top = 9
        Width = 150
        Height = 21
        Hint = #1042#1080#1076' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        KeyField = 'FK_ID'
        ListField = 'FC_NAME'
        ListSource = dmMain.dsVid_post
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Visible = False
      end
    end
    object paExpensive_Brak: TPanel
      Left = 2
      Top = 44
      Width = 484
      Height = 17
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 6
      object chbExpensive: TCheckBox
        Left = 95
        Top = 2
        Width = 103
        Height = 17
        Caption = #1044#1086#1088#1086#1075#1086#1089#1090#1086#1103#1097#1080#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnClick = chbExpensiveClick
      end
      object chbFL_Brak: TCheckBox
        Left = 327
        Top = 2
        Width = 142
        Height = 17
        AllowGrayed = True
        Caption = #1055#1072#1088#1090#1080#1103' '#1079#1072#1073#1088#1072#1082#1086#1074#1072#1085#1072
        State = cbGrayed
        TabOrder = 1
        Visible = False
      end
      object chbJNVLS: TCheckBox
        Left = 226
        Top = 2
        Width = 73
        Height = 17
        Caption = #1046#1053#1042#1051#1055
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = False
        OnClick = chbExpensiveClick
      end
    end
    object paProdCert: TPanel
      Left = 2
      Top = 203
      Width = 484
      Height = 69
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      object lblProducer: TLabel
        Left = 9
        Top = 27
        Width = 82
        Height = 13
        Alignment = taRightJustify
        Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100':'
      end
      object lblCertificate: TLabel
        Left = 27
        Top = 51
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090':'
      end
      object cbProdCert: TCheckBox
        Left = 95
        Top = 3
        Width = 369
        Height = 17
        Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1077' '#1080' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1077
        TabOrder = 0
        OnClick = cbProdCertClick
      end
      object edProducer: TJvComboEdit
        Left = 95
        Top = 24
        Width = 380
        Height = 21
        ButtonWidth = 16
        ClickKey = 32
        DirectInput = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImageKind = ikEllipsis
        ParentFont = False
        TabOrder = 1
        OnButtonClick = edProducerButtonClick
      end
      object edCertificate: TJvComboEdit
        Left = 95
        Top = 48
        Width = 380
        Height = 21
        ButtonWidth = 16
        ClickKey = 32
        DirectInput = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImageKind = ikEllipsis
        ParentFont = False
        TabOrder = 2
        OnButtonClick = edProducerButtonClick
      end
    end
    object paQuotaCode: TPanel
      Left = 2
      Top = 61
      Width = 484
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label4: TLabel
        Left = 35
        Top = 10
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = #1050#1086#1076' '#1082#1074#1086#1090#1099':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object medQUOTA_CODE1: TcxMaskEdit
        Left = 95
        Top = 7
        Hint = #1050#1086#1076' '#1086#1090#1076#1077#1083#1077#1085#1080#1103
        ParentShowHint = False
        Properties.AlwaysShowBlanksAndLiterals = True
        Properties.EditMask = '00;0;_'
        Properties.MaxLength = 0
        ShowHint = True
        Style.BorderStyle = ebs3D
        TabOrder = 0
        Text = '00'
        Width = 20
      end
      object medQUOTA_CODE234: TcxMaskEdit
        Left = 113
        Top = 7
        Hint = #1050#1086#1076' '#1091#1095#1105#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099', '#1074#1080#1076#1072' '#1080' '#1087#1086#1076#1074#1080#1076#1072' '#1087#1088#1086#1076#1091#1082#1094#1080#1080
        TabStop = False
        ParentShowHint = False
        Properties.AlwaysShowBlanksAndLiterals = True
        Properties.EditMask = '00-00-00;0;_'
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        ShowHint = True
        Style.BorderStyle = ebs3D
        TabOrder = 1
        Text = '000000'
        Width = 51
      end
    end
    object paDrugID: TPanel
      Left = 2
      Top = 89
      Width = 484
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 7
      object Label5: TLabel
        Left = 54
        Top = 10
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'DrugID:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edDrugID: TEdit
        Left = 95
        Top = 6
        Width = 380
        Height = 21
        Hint = 
          'DrugID - '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1081' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1051#1057' '#1076#1083#1103' '#1087#1088#1086#1077#1082#1090#1072' "'#1052#1086#1085#1080#1090#1086#1088#1080#1085#1075' '#1094#1077#1085 +
          '"'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
  end
  object grbPriceKol: TcxGroupBox
    Left = 0
    Top = 356
    Align = alBottom
    Caption = ' '#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1080' '#1094#1077#1085#1072' '
    TabOrder = 2
    Height = 71
    Width = 488
    object laKol: TLabel
      Left = 40
      Top = 21
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1086#1083'-'#1074#1086':'
    end
    object laSum: TLabel
      Left = 182
      Top = 21
      Width = 37
      Height = 13
      Hint = #1057#1091#1084#1084#1072' '#1089#1086' '#1074#1089#1077#1084#1080' '#1085#1072#1076#1073#1072#1074#1082#1072#1084#1080' '#1080' '#1085#1072#1094#1077#1085#1082#1072#1084#1080
      Alignment = taRightJustify
      Caption = #1057#1091#1084#1084#1072':'
      ParentShowHint = False
      ShowHint = True
    end
    object laPrice: TLabel
      Left = 334
      Top = 21
      Width = 29
      Height = 13
      Hint = #1062#1077#1085#1072' '#1089#1086' '#1074#1089#1077#1084#1080' '#1085#1072#1076#1073#1072#1074#1082#1072#1084#1080' '#1080' '#1085#1072#1094#1077#1085#1082#1072#1084#1080
      Alignment = taRightJustify
      Caption = #1062#1077#1085#1072':'
      ParentShowHint = False
      ShowHint = True
    end
    object cePriceView: TcxCurrencyEdit
      Left = 369
      Top = 16
      Hint = 
        #1062#1077#1085#1072' '#1089#1086' '#1074#1089#1077#1084#1080' '#1085#1072#1076#1073#1072#1074#1082#1072#1084#1080' '#1080' '#1085#1072#1094#1077#1085#1082#1072#1084#1080'.'#13#10#1048#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1074#1086' '#1074#1089#1077#1093' '#1086#1090#1095#1077 +
        #1090#1072#1093' '#1080' '#1086#1073#1086#1088#1086#1090#1072#1093'.'
      EditValue = 0.000000000000000000
      ParentShowHint = False
      Properties.Alignment.Horz = taRightJustify
      Properties.AssignedValues.MinValue = True
      Properties.DecimalPlaces = 8
      Properties.MaxValue = 99999999999.000000000000000000
      Properties.Nullable = False
      Properties.UseThousandSeparator = True
      Properties.OnChange = cePriceViewPropertiesChange
      ShowHint = True
      Style.BorderStyle = ebs3D
      TabOrder = 1
      OnEnter = cePriceViewEnter
      Width = 108
    end
    object seKol: TcxSpinEdit
      Left = 81
      Top = 16
      Properties.Alignment.Horz = taRightJustify
      Properties.AssignedValues.MinValue = True
      Properties.DisplayFormat = ',0.#######'
      Properties.EditFormat = ',0.#######'
      Properties.ImmediatePost = True
      Properties.MaxValue = 999999999.000000000000000000
      Properties.ValueType = vtFloat
      Properties.OnChange = seKolPropertiesChange
      Style.BorderStyle = ebs3D
      TabOrder = 0
      OnEnter = seKolEnter
      Width = 80
    end
    object seSumm: TcxCurrencyEdit
      Left = 223
      Top = 16
      Hint = #1057#1091#1084#1084#1072' '#1089#1086' '#1074#1089#1077#1084#1080' '#1085#1072#1076#1073#1072#1074#1082#1072#1084#1080' '#1080' '#1085#1072#1094#1077#1085#1082#1072#1084#1080
      EditValue = 0.000000000000000000
      ParentShowHint = False
      Properties.Alignment.Horz = taRightJustify
      Properties.AssignedValues.MinValue = True
      Properties.DecimalPlaces = 8
      Properties.MaxValue = 99999999999.000000000000000000
      Properties.UseThousandSeparator = True
      Properties.OnChange = seSummPropertiesChange
      ShowHint = True
      Style.BorderStyle = ebs3D
      TabOrder = 2
      OnEnter = seSummEnter
      Width = 80
    end
    object paNacenki: TPanel
      Left = 2
      Top = 41
      Width = 484
      Height = 28
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      object laNacenka: TLabel
        Left = 26
        Top = 6
        Width = 47
        Height = 13
        Hint = #1053#1072#1094#1077#1085#1082#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081' '#1086#1087#1090#1086#1074#1086#1081' '#1090#1086#1088#1075#1086#1074#1083#1080
        Alignment = taRightJustify
        Caption = #1053#1072#1094#1077#1085#1082#1072':'
        ParentShowHint = False
        ShowHint = True
      end
      object laNDS: TLabel
        Left = 188
        Top = 6
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = #1053#1044#1057':'
      end
      object laPriceMnf: TLabel
        Left = 290
        Top = 6
        Width = 71
        Height = 13
        Hint = #1062#1077#1085#1072', '#1091#1089#1090#1072#1085#1072#1074#1083#1080#1074#1072#1077#1084#1072#1103' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1077#1084
        Alignment = taRightJustify
        Caption = #1062#1077#1085#1072' '#1087#1088#1086#1080#1079#1074'.:'
        ParentShowHint = False
        ShowHint = True
      end
      object seNacenka: TcxSpinEdit
        Left = 79
        Top = 1
        Hint = #1053#1072#1094#1077#1085#1082#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081' '#1086#1087#1090#1086#1074#1086#1081' '#1090#1086#1088#1075#1086#1074#1083#1080
        ParentShowHint = False
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.MinValue = True
        Properties.DisplayFormat = ',0.###%'
        Properties.EditFormat = ',0.###'
        Properties.ImmediatePost = True
        Properties.MaxValue = 999.000000000000000000
        Properties.ValueType = vtFloat
        ShowHint = True
        Style.BorderStyle = ebs3D
        TabOrder = 0
        Width = 52
      end
      object seNDS: TcxSpinEdit
        Left = 221
        Top = 1
        ParentShowHint = False
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.MinValue = True
        Properties.DisplayFormat = ',0.###%'
        Properties.EditFormat = ',0.###'
        Properties.ImmediatePost = True
        Properties.MaxValue = 999.000000000000000000
        Properties.ValueType = vtFloat
        ShowHint = True
        Style.BorderStyle = ebs3D
        TabOrder = 1
        Width = 52
      end
      object cedPriceMnf: TcxCurrencyEdit
        Left = 367
        Top = 1
        Hint = #1062#1077#1085#1072', '#1091#1089#1090#1072#1085#1072#1074#1083#1080#1074#1072#1077#1084#1072#1103' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1077#1084
        EditValue = 0.000000000000000000
        ParentShowHint = False
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.MinValue = True
        Properties.DecimalPlaces = 8
        Properties.MaxValue = 99999999999.000000000000000000
        Properties.Nullable = False
        Properties.UseThousandSeparator = True
        Properties.OnChange = cedPriceMnfPropertiesChange
        ShowHint = True
        Style.BorderStyle = ebs3D
        TabOrder = 2
        OnKeyDown = cedPriceMnfKeyDown
        Width = 108
      end
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 454
    Top = 6
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCancelExecute
    end
    object acSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acSaveExecute
    end
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1082#1072#1088#1090#1086#1095#1082#1091' '#1080' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1077#1097#1077' '#1086#1076#1085#1091
      ImageIndex = 21
      ShortCut = 16397
      OnExecute = acAddExecute
    end
    object acCheckBrak: TAction
      AutoCheck = True
      Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1089#1088#1077#1076#1080' '#1079#1072#1073#1088#1072#1082#1086#1074#1072#1085#1085#1099#1093' '#1087#1072#1088#1090#1080#1081' '#1087#1086' '#1089#1077#1088#1080#1081#1085#1086#1084#1091' '#1085#1086#1084#1077#1088''#1091
      ImageIndex = 40
      OnExecute = acCheckBrakExecute
    end
  end
  object odsEdizm: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '   m.fc_name as FC_MEDICNAME,m.FN_FPACKINUPACK, '
      
        '   tei.fc_name as FC_UEI, tei.eiid as FK_UEI, FEI.FC_NAME as FC_' +
        'FEI, FEI.eiid as FK_FEI, '
      
        '   nvl(UG.FC_QUOTA_CODE_2,'#39'00'#39')||nvl(m.FC_QUOTA_CODE_34,'#39'0000'#39') ' +
        'as FC_QUOTA_CODE_234, m.FL_JNVLS,'
      '   m.FN_MEDICPRODCERTID,'
      '   PC.FC_PROD, PC.FC_CERT,'
      '   m.uchgrid'
      'from MED.TMEDIC m, MED.TEI, MED.TEI FEI, MED.TUCHGR UG,'
      
        '     (select -- pfc_value - '#1085#1072#1079#1074#1072#1085#1080#1103' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1077#1081', Sfc_value -' +
        ' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1099
      
        '        p1.FK_ID as PFK_ID, p1.fn_parent as pfn_parent, nvl(p1.f' +
        'c_value, p2.fc_value) as  FC_PROD             -- '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      
        '        ,p2.FK_ID as SFK_ID, p2.fn_parent as Sfn_parent, decode(' +
        'p1.FK_ID, null, null, p2.fc_value) as FC_CERT -- '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090
      
        '      from med.tprodcert  p1, med.tprodcert p2 where p1.fk_id(+)' +
        ' = p2.fn_parent) pc'
      'where'
      '      m.eiid = tei.eiid(+)   '
      '  and m.uchgrid = UG.uchgrid(+)'
      '  and m.fk_FPACKID = FEI.eiid(+)'
      '  and m.FN_MEDICPRODCERTID = pc.SFK_ID(+)'
      '  and m.medicid = :medicid')
    Optimize = False
    Variables.Data = {
      0300000001000000080000003A4D45444943494403000000040000002A110000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000C00000046435F4D454449434E414D450100000000000600
      000046435F55454901000000000006000000464B5F5545490100000000000600
      000046435F46454901000000000006000000464B5F464549010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 190
    Top = 194
  end
  object dsEdizm: TDataSource
    DataSet = odsEdizm
    Left = 238
    Top = 184
  end
  object odskartList: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '    TKART.*,'
      '    m.FN_FPACKINUPACK,'
      '    pc.pfc_value as PROD,'
      '    pc.Sfc_value as CERT,'
      '    mogr.fc_group'
      ''
      '  FROM MED.TKART, '
      '       MED.TMEDIC M,'
      '       MED.TMO_GROUP mogr,'
      
        '     -- '#1085#1086#1074#1072#1103' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1103', '#1089#1086#1084#1074#1077#1089#1090#1080#1084#1072#1103' '#1089' 8i (04.04.2008 '#1042#1086#1088#1086#1085#1086#1074' '#1054 +
        '.'#1040'.)'
      
        '     (select -- pfc_value - '#1085#1072#1079#1074#1072#1085#1080#1103' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1077#1081', Sfc_value -' +
        ' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1099
      
        '        p1.FK_ID as PFK_ID, p1.fn_parent as pfn_parent, nvl(p1.f' +
        'c_value, p2.fc_value) as  pfc_value             -- '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      
        '        ,p2.FK_ID as SFK_ID, p2.fn_parent as Sfn_parent, decode(' +
        'p1.FK_ID, null, null, p2.fc_value) as Sfc_value -- '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090
      
        '      from med.tprodcert  p1, med.tprodcert p2 where p1.fk_id(+)' +
        ' = p2.fn_parent) pc'
      '  WHERE'
      '        KARTID = :AKARTID'
      '    AND TKART.MEDICID = M.MEDICID'
      '    AND TKART.FL_DEL = 0'
      '    AND TKART.fk_mogroupid = mogr.groupid(+)'
      '    and TKART.fn_prodcertid = pc.SFK_ID(+)')
    Optimize = False
    Variables.Data = {
      0300000001000000080000003A414B4152544944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000015000000060000004B4152544944010000000000040000004D4F4944
      01000000000006000000464C5F44454C010000000000070000004D4544494349
      440100000000000700000046435F4E414D450100000000000900000046435F53
      455249414C0100000000000800000046445F474F44454E010000000000060000
      0045494E414D450100000000000D000000464E5F50524F444345525449440100
      000000000E00000046435F43455254494649434154450100000000000B000000
      46435F50524F44554345520100000000000400000050524F4401000000000004
      0000004345525401000000000004000000454949440100000000000F00000046
      4E5F465041434B494E555041434B0100000000000A000000464B5F465041434B
      49440100000000000C000000464E5F50415254595F4E554D0100000000000C00
      0000464B5F4D4F47524F5550494401000000000008000000464E5F5052494345
      01000000000006000000464E5F4B4F4C0100000000000800000046435F47524F
      5550010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 282
    Top = 8
  end
  object dsKartList: TDataSource
    DataSet = odskartList
    Left = 220
    Top = 6
  end
  object dsDpc: TDataSource
    DataSet = odsDpc
    Left = 358
    Top = 4
  end
  object odsDpc: TOracleDataSet
    SQL.Strings = (
      'select'
      '    tdpc.*'
      'from MED.tdpc'
      'where kartid = :akartid')
    Optimize = False
    Variables.Data = {
      0300000001000000080000003A414B4152544944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000009000000050000004450434944010000000000040000004450494401
      0000000000060000004B415254494401000000000006000000464E5F4B4F4C01
      000000000007000000464E5F53554D4D0100000000000B000000464E5F4E4557
      505249434501000000000008000000464E5F5052494345010000000000060000
      00464E5F53454C0100000000000A000000464E5F545245424B4F4C0100000000
      00}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 402
    Top = 6
    object odsDpcFN_KOL: TFloatField
      FieldName = 'FN_KOL'
    end
    object odsDpcFN_SUMM: TFloatField
      FieldName = 'FN_SUMM'
    end
  end
  object Timer1: TTimer
    Interval = 250
    OnTimer = Timer1Timer
    Left = 18
    Top = 84
  end
  object oqUpdateFK_VID_POST: TOracleQuery
    SQL.Strings = (
      
        'update med.tkart k set k.fk_vid_post = :pfk_vid_post where k.kar' +
        'tid = :pkartid')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000020000000D0000003A50464B5F5649445F504F535403000000000000
      0000000000080000003A504B4152544944030000000000000000000000}
    Left = 346
    Top = 222
  end
  object oqUpdateExpensive: TOracleQuery
    SQL.Strings = (
      
        'update med.tkart k set k.FL_EXPENSIVE = :pFL_EXPENSIVE where k.k' +
        'artid = :pkartid')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000002000000080000003A504B4152544944030000000000000000000000
      0E0000003A50464C5F455850454E53495645030000000000000000000000}
    Left = 24
    Top = 262
  end
end
