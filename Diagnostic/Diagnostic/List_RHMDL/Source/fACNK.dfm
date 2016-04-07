object frmACNK: TfrmACNK
  Left = 196
  Top = 39
  BorderStyle = bsDialog
  Caption = #1040#1057#1053#1050
  ClientHeight = 621
  ClientWidth = 1010
  Color = clCream
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
  object Shape1: TShape
    Left = 8
    Top = 351
    Width = 318
    Height = 77
    Pen.Color = clNavy
    Pen.Width = 2
  end
  object cxLabel1: TcxLabel
    Left = 24
    Top = 357
    Caption = #1055#1086#1076#1087#1080#1089#1100
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.SkinName = 'Caramel'
    Style.TextColor = clNavy
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Caramel'
    StyleFocused.LookAndFeel.SkinName = 'Caramel'
    StyleHot.LookAndFeel.SkinName = 'Caramel'
  end
  object cxLabel2: TcxLabel
    Left = 24
    Top = 379
    Caption = #1044#1072#1090#1072
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.SkinName = 'Caramel'
    Style.TextColor = clTeal
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Caramel'
    StyleFocused.LookAndFeel.SkinName = 'Caramel'
    StyleHot.LookAndFeel.SkinName = 'Caramel'
  end
  object deDate: TcxDateEdit
    Left = 71
    Top = 378
    Properties.DateButtons = [btnToday]
    Properties.ImmediatePost = True
    Properties.PostPopupValueOnTab = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.LookAndFeel.SkinName = 'Caramel'
    StyleDisabled.BorderColor = clBlack
    StyleDisabled.Color = clWhite
    StyleDisabled.LookAndFeel.SkinName = 'Caramel'
    StyleDisabled.TextColor = clBlack
    StyleFocused.LookAndFeel.SkinName = 'Caramel'
    StyleHot.LookAndFeel.SkinName = 'Caramel'
    TabOrder = 2
    Width = 121
  end
  object cxLabel3: TcxLabel
    Left = 24
    Top = 403
    Caption = #1042#1088#1072#1095
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.SkinName = 'Caramel'
    Style.TextColor = clTeal
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Caramel'
    StyleFocused.LookAndFeel.SkinName = 'Caramel'
    StyleHot.LookAndFeel.SkinName = 'Caramel'
  end
  object lcbVrach: TcxLookupComboBox
    Left = 71
    Top = 401
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.GridMode = True
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'FK_ID'
    Properties.ListColumns = <
      item
        FieldName = 'FC_FIO'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsSotr
    Properties.PostPopupValueOnTab = True
    Style.LookAndFeel.SkinName = 'Caramel'
    StyleDisabled.BorderColor = clBlack
    StyleDisabled.Color = clWhite
    StyleDisabled.LookAndFeel.SkinName = 'Caramel'
    StyleDisabled.TextColor = clBlack
    StyleFocused.LookAndFeel.SkinName = 'Caramel'
    StyleHot.LookAndFeel.SkinName = 'Caramel'
    TabOrder = 4
    Width = 226
  end
  object cxGroupBox1: TcxGroupBox
    AlignWithMargins = True
    Left = 8
    Top = 7
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1072#1094#1080#1077#1085#1090#1077
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
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
    Height = 167
    Width = 318
    object cxLabel4: TcxLabel
      Left = 10
      Top = 22
      Caption = #1055#1072#1094#1080#1077#1085#1090
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
    end
    object lbPac: TcxLabel
      Left = 96
      Top = 24
      Caption = '--'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextColor = clNavy
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
    end
    object cxLabel5: TcxLabel
      Left = 11
      Top = 70
      Caption = #1042#1086#1079#1088#1072#1089#1090
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
    end
    object lbAge: TcxLabel
      Left = 97
      Top = 70
      Caption = '--'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
    end
    object cxLabel6: TcxLabel
      Left = 11
      Top = 93
      Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1077
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
    end
    object lbOtdel: TcxLabel
      Left = 11
      Top = 114
      Caption = '--'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
    end
    object cxLabel8: TcxLabel
      Left = 11
      Top = 133
      Caption = #1055#1072#1083#1072#1090#1072
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
    end
    object cxLabel9: TcxLabel
      Left = 97
      Top = 133
      Caption = '--'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
    end
    object lbNumMK: TcxLabel
      Left = 96
      Top = 45
      Caption = '--'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextColor = clNavy
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
    end
    object cxLabel11: TcxLabel
      Left = 10
      Top = 45
      Caption = #8470' '#1052#1050
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 177
    Width = 318
    Height = 131
    Margins.Top = 0
    BevelInner = bvLowered
    Color = clCream
    ParentBackground = False
    TabOrder = 6
    object cxLabel21: TcxLabel
      Left = 11
      Top = 12
      Caption = #1044#1086#1089#1090#1091#1087
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
    end
    object cxLabel22: TcxLabel
      Left = 11
      Top = 35
      Caption = #1050#1086#1085#1090#1088#1072#1089#1090
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
    end
    object cxLabel23: TcxLabel
      Left = 11
      Top = 57
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
    end
    object cxLabel24: TcxLabel
      Left = 11
      Top = 81
      Caption = #1040#1086#1088#1090#1072
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
    end
    object cxLabel25: TcxLabel
      Left = 11
      Top = 104
      Caption = #1056#1077#1082#1086#1084#1077#1085#1076#1086#1074#1072#1085#1086
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
    end
    object lcbAccess: TcxLookupComboBox
      Left = 108
      Top = 10
      Properties.DropDownAutoSize = True
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
      Properties.ListSource = dsAccess
      Properties.PostPopupValueOnTab = True
      Properties.OnChange = lcbAccessPropertiesChange
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 5
      Width = 197
    end
    object lcbKontrast: TcxLookupComboBox
      Left = 108
      Top = 33
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
      Properties.ListSource = dsKontrast
      Properties.PostPopupValueOnTab = True
      Properties.OnChange = lcbKontrastPropertiesChange
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 6
      Width = 197
    end
    object seKolvo: TcxSpinEdit
      Left = 108
      Top = 56
      Properties.ImmediatePost = True
      Properties.OnChange = seKolvoPropertiesChange
      Style.LookAndFeel.SkinName = 'Coffee'
      StyleDisabled.LookAndFeel.SkinName = 'Coffee'
      StyleFocused.LookAndFeel.SkinName = 'Coffee'
      StyleHot.LookAndFeel.SkinName = 'Coffee'
      TabOrder = 7
      Width = 74
    end
    object lcbAorta: TcxLookupComboBox
      Left = 108
      Top = 79
      Properties.DropDownAutoSize = True
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
      Properties.ListSource = dsAorta
      Properties.PostPopupValueOnTab = True
      Properties.OnChange = lcbAortaPropertiesChange
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 8
      Width = 197
    end
    object lcbRecom: TcxLookupComboBox
      Left = 108
      Top = 102
      Properties.DropDownAutoSize = True
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
      Properties.ListSource = dsRecom
      Properties.PostPopupValueOnTab = True
      Properties.OnChange = lcbRecomPropertiesChange
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 9
      Width = 197
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 330
    Top = 7
    Width = 678
    Height = 611
    ActivePage = cxTabSheet1
    LookAndFeel.SkinName = 'Caramel'
    TabOrder = 7
    ClientRectBottom = 605
    ClientRectLeft = 3
    ClientRectRight = 672
    ClientRectTop = 27
    object cxTabSheet1: TcxTabSheet
      Caption = #1055#1088#1072#1074#1072#1103' '#1089#1090#1086#1088#1086#1085#1072
      ImageIndex = 0
      object Panel6: TPanel
        AlignWithMargins = True
        Left = 224
        Top = 4
        Width = 220
        Height = 153
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 0
        object cxLabel26: TcxLabel
          Left = 7
          Top = 2
          Caption = #1055#1088#1072#1074#1072#1103' '#1086#1073#1097#1072#1103' '#1073#1077#1076#1088#1077#1085#1085#1072#1103' '#1072#1088#1090#1077#1088#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.TextColor = clMaroon
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel33: TcxLabel
          Left = 7
          Top = 21
          Caption = #1057#1090#1077#1085#1086#1079
        end
        object lcbRg17: TcxLookupComboBox
          Left = 83
          Top = 20
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg18
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg17PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 2
          Width = 134
        end
        object cxLabel34: TcxLabel
          Left = 7
          Top = 43
          Caption = #1040#1085#1077#1074#1088#1080#1079#1084#1072
        end
        object lcbRg18: TcxLookupComboBox
          Left = 83
          Top = 42
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg19
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg18PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 4
          Width = 134
        end
        object cxLabel35: TcxLabel
          Left = 7
          Top = 65
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg19: TcxLookupComboBox
          Left = 83
          Top = 64
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg20
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg19PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 6
          Width = 134
        end
        object cxLabel36: TcxLabel
          Left = 7
          Top = 87
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beRg5: TcxButtonEdit
          Left = 83
          Top = 86
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beRg5PropertiesButtonClick
          Properties.OnEditValueChanged = beRg5PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 8
          Width = 134
        end
        object cxLabel37: TcxLabel
          Left = 7
          Top = 109
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1088#1086#1074#1086#1090#1086#1082#1072
        end
        object lcbRg20: TcxLookupComboBox
          Left = 157
          Top = 108
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg21
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg20PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 10
          Width = 60
        end
        object cxLabel38: TcxLabel
          Left = 7
          Top = 131
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg21: TcxLookupComboBox
          Left = 83
          Top = 130
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg22
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg21PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 12
          Width = 134
        end
      end
      object Panel7: TPanel
        AlignWithMargins = True
        Left = 224
        Top = 159
        Width = 220
        Height = 153
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 1
        object cxLabel39: TcxLabel
          Left = 7
          Top = 2
          Caption = #1055#1086#1074#1077#1088#1093#1085#1086#1089#1090#1085#1072#1103' '#1073#1077#1076#1088#1077#1085#1085#1072#1103' '#1072#1088#1090#1077#1088#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.TextColor = clMaroon
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel40: TcxLabel
          Left = 7
          Top = 21
          Caption = #1057#1090#1077#1085#1086#1079
        end
        object lcbRg22: TcxLookupComboBox
          Left = 83
          Top = 20
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg23
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg22PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 2
          Width = 134
        end
        object cxLabel68: TcxLabel
          Left = 7
          Top = 43
          Caption = #1040#1085#1077#1074#1088#1080#1079#1084#1072
        end
        object lcbRg23: TcxLookupComboBox
          Left = 83
          Top = 42
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg24
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg23PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 4
          Width = 134
        end
        object cxLabel69: TcxLabel
          Left = 7
          Top = 65
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg24: TcxLookupComboBox
          Left = 83
          Top = 64
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg25
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg24PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 6
          Width = 134
        end
        object cxLabel70: TcxLabel
          Left = 7
          Top = 87
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beRg6: TcxButtonEdit
          Left = 83
          Top = 86
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beRg6PropertiesButtonClick
          Properties.OnEditValueChanged = beRg6PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 8
          Width = 134
        end
        object cxLabel71: TcxLabel
          Left = 7
          Top = 109
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1088#1086#1074#1086#1090#1086#1082#1072
        end
        object lcbRg25: TcxLookupComboBox
          Left = 157
          Top = 108
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg26
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg25PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 10
          Width = 60
        end
        object cxLabel72: TcxLabel
          Left = 7
          Top = 131
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg26: TcxLookupComboBox
          Left = 83
          Top = 130
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg27
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg26PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 12
          Width = 134
        end
      end
      object Panel8: TPanel
        AlignWithMargins = True
        Left = 224
        Top = 314
        Width = 220
        Height = 153
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 2
        object cxLabel42: TcxLabel
          Left = 7
          Top = 2
          Caption = #1043#1083#1091#1073#1086#1082#1072#1103' '#1073#1077#1076#1088#1077#1085#1085#1072#1103' '#1072#1088#1090#1077#1088#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.TextColor = clMaroon
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel43: TcxLabel
          Left = 7
          Top = 21
          Caption = #1057#1090#1077#1085#1086#1079
        end
        object lcbRg27: TcxLookupComboBox
          Left = 83
          Top = 20
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg28
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg27PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 2
          Width = 134
        end
        object cxLabel44: TcxLabel
          Left = 7
          Top = 43
          Caption = #1040#1085#1077#1074#1088#1080#1079#1084#1072
        end
        object lcbRg28: TcxLookupComboBox
          Left = 83
          Top = 42
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg29
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg28PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 4
          Width = 134
        end
        object cxLabel45: TcxLabel
          Left = 7
          Top = 65
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg29: TcxLookupComboBox
          Left = 83
          Top = 64
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg30
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg29PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 6
          Width = 134
        end
        object cxLabel46: TcxLabel
          Left = 7
          Top = 87
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beRg7: TcxButtonEdit
          Left = 83
          Top = 86
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beRg7PropertiesButtonClick
          Properties.OnEditValueChanged = beRg7PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 8
          Width = 134
        end
        object cxLabel48: TcxLabel
          Left = 7
          Top = 109
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1088#1086#1074#1086#1090#1086#1082#1072
        end
        object lcbRg30: TcxLookupComboBox
          Left = 157
          Top = 108
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg31
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg30PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 10
          Width = 60
        end
        object cxLabel73: TcxLabel
          Left = 7
          Top = 131
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg31: TcxLookupComboBox
          Left = 83
          Top = 130
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg32
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg31PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 12
          Width = 134
        end
      end
      object Panel9: TPanel
        AlignWithMargins = True
        Left = 446
        Top = 4
        Width = 220
        Height = 137
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 3
        object cxLabel80: TcxLabel
          Left = 7
          Top = 2
          Caption = #1055#1086#1076#1082#1086#1083#1077#1085#1085#1072#1103' '#1072#1088#1090#1077#1088#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.TextColor = clMaroon
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel81: TcxLabel
          Left = 7
          Top = 21
          Caption = #1057#1090#1077#1085#1086#1079
        end
        object lcbRg32: TcxLookupComboBox
          Left = 83
          Top = 20
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg33
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg32PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 2
          Width = 134
        end
        object cxLabel84: TcxLabel
          Left = 7
          Top = 43
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg34: TcxLookupComboBox
          Left = 83
          Top = 42
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg35
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg34PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 4
          Width = 134
        end
        object cxLabel85: TcxLabel
          Left = 7
          Top = 65
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beRg8: TcxButtonEdit
          Left = 83
          Top = 64
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beRg8PropertiesButtonClick
          Properties.OnEditValueChanged = beRg8PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 6
          Width = 134
        end
        object cxLabel86: TcxLabel
          Left = 7
          Top = 87
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1088#1086#1074#1086#1090#1086#1082#1072
        end
        object lcbRg35: TcxLookupComboBox
          Left = 157
          Top = 86
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg36
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg35PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 8
          Width = 60
        end
        object cxLabel87: TcxLabel
          Left = 7
          Top = 109
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg36: TcxLookupComboBox
          Left = 83
          Top = 108
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg37
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg36PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 10
          Width = 134
        end
      end
      object Panel18: TPanel
        AlignWithMargins = True
        Left = 446
        Top = 143
        Width = 220
        Height = 135
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 4
        object cxLabel123: TcxLabel
          Left = 7
          Top = 2
          Caption = #1041#1086#1083#1100#1096#1077#1073#1077#1088#1094#1086#1074#1072#1103' '#1072#1088#1090#1077#1088#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.TextColor = clMaroon
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel124: TcxLabel
          Left = 7
          Top = 21
          Caption = #1057#1090#1077#1085#1086#1079
        end
        object lcbRg37: TcxLookupComboBox
          Left = 83
          Top = 20
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg38
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg37PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 2
          Width = 134
        end
        object cxLabel126: TcxLabel
          Left = 7
          Top = 43
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg39: TcxLookupComboBox
          Left = 83
          Top = 42
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg39
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg39PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 4
          Width = 134
        end
        object cxLabel127: TcxLabel
          Left = 7
          Top = 65
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beRg9: TcxButtonEdit
          Left = 83
          Top = 64
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beRg9PropertiesButtonClick
          Properties.OnEditValueChanged = beRg9PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 6
          Width = 134
        end
        object cxLabel128: TcxLabel
          Left = 7
          Top = 87
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1088#1086#1074#1086#1090#1086#1082#1072
        end
        object lcbRg40: TcxLookupComboBox
          Left = 157
          Top = 86
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg40
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg40PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 8
          Width = 60
        end
        object cxLabel129: TcxLabel
          Left = 7
          Top = 109
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg41: TcxLookupComboBox
          Left = 83
          Top = 108
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg41
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg41PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 10
          Width = 134
        end
      end
      object Panel3: TPanel
        AlignWithMargins = True
        Left = 2
        Top = 4
        Width = 220
        Height = 221
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 5
        object cxLabel12: TcxLabel
          Left = 7
          Top = 20
          Caption = #1048#1079#1074#1080#1090#1086#1089#1090#1100
        end
        object lcbRgIz: TcxLookupComboBox
          Left = 83
          Top = 20
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg1
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRgIzPropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 1
          Width = 134
        end
        object cxLabel13: TcxLabel
          Left = 7
          Top = 44
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg1: TcxLookupComboBox
          Left = 83
          Top = 42
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg2
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg1PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 3
          Width = 134
        end
        object cxLabel14: TcxLabel
          Left = 7
          Top = 66
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beRg1: TcxButtonEdit
          Left = 83
          Top = 65
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beRg1PropertiesButtonClick
          Properties.OnEditValueChanged = beRg1PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 5
          Width = 134
        end
        object cxLabel15: TcxLabel
          Left = 7
          Top = 88
          Caption = #1057#1090#1077#1085#1086#1079
        end
        object lcbRg2: TcxLookupComboBox
          Left = 83
          Top = 87
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg3
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg2PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 7
          Width = 134
        end
        object cxLabel16: TcxLabel
          Left = 7
          Top = 110
          Caption = #1040#1085#1077#1074#1088#1080#1079#1084#1072
        end
        object lcbRg3: TcxLookupComboBox
          Left = 83
          Top = 109
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg4
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg3PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 9
          Width = 134
        end
        object cxLabel17: TcxLabel
          Left = 7
          Top = 132
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg4: TcxLookupComboBox
          Left = 83
          Top = 131
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg5
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg4PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 11
          Width = 134
        end
        object cxLabel18: TcxLabel
          Left = 7
          Top = 154
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beRg2: TcxButtonEdit
          Left = 83
          Top = 153
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beRg2PropertiesButtonClick
          Properties.OnEditValueChanged = beRg2PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 13
          Width = 134
        end
        object cxLabel19: TcxLabel
          Left = 7
          Top = 176
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1088#1086#1074#1086#1090#1086#1082#1072
        end
        object lcbRg5: TcxLookupComboBox
          Left = 157
          Top = 175
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg6
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg5PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 15
          Width = 60
        end
        object cxLabel20: TcxLabel
          Left = 7
          Top = 198
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg6: TcxLookupComboBox
          Left = 83
          Top = 197
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg7
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg6PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 17
          Width = 134
        end
        object cxLabel41: TcxLabel
          Left = 8
          Top = 4
          Caption = #1055#1088#1072#1074#1072#1103' '#1086#1073#1097#1072#1103' '#1087#1086#1076#1074#1079#1076#1086#1096#1085#1072#1103' '#1072#1088#1090#1077#1088#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.TextColor = clMaroon
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
      end
      object Panel4: TPanel
        AlignWithMargins = True
        Left = 2
        Top = 227
        Width = 220
        Height = 153
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 6
        object cxLabel82: TcxLabel
          Left = 7
          Top = 2
          Caption = #1053#1072#1088#1091#1078#1085#1072#1103' '#1087#1086#1076#1074#1079#1076#1086#1096#1085#1072#1103' '#1072#1088#1090#1077#1088#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.TextColor = clMaroon
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel47: TcxLabel
          Left = 7
          Top = 21
          Caption = #1057#1090#1077#1085#1086#1079
        end
        object lcbRg7: TcxLookupComboBox
          Left = 83
          Top = 20
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg8
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg7PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 2
          Width = 134
        end
        object cxLabel49: TcxLabel
          Left = 7
          Top = 43
          Caption = #1040#1085#1077#1074#1088#1080#1079#1084#1072
        end
        object lcbRg8: TcxLookupComboBox
          Left = 83
          Top = 42
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg9
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg8PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 4
          Width = 134
        end
        object cxLabel75: TcxLabel
          Left = 7
          Top = 65
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg9: TcxLookupComboBox
          Left = 83
          Top = 64
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg10
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg9PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 6
          Width = 134
        end
        object cxLabel76: TcxLabel
          Left = 7
          Top = 87
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beRg3: TcxButtonEdit
          Left = 83
          Top = 86
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beRg3PropertiesButtonClick
          Properties.OnEditValueChanged = beRg3PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 8
          Width = 134
        end
        object cxLabel77: TcxLabel
          Left = 7
          Top = 109
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1088#1086#1074#1086#1090#1086#1082#1072
        end
        object lcbRg10: TcxLookupComboBox
          Left = 157
          Top = 108
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg11
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg10PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 10
          Width = 60
        end
        object cxLabel78: TcxLabel
          Left = 7
          Top = 131
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg11: TcxLookupComboBox
          Left = 83
          Top = 130
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg12
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg11PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 12
          Width = 134
        end
      end
      object Panel5: TPanel
        AlignWithMargins = True
        Left = 2
        Top = 382
        Width = 220
        Height = 153
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 7
        object cxLabel27: TcxLabel
          Left = 7
          Top = 2
          Caption = #1042#1085#1091#1090#1088#1077#1085#1103#1103' '#1087#1086#1076#1074#1079#1076#1086#1096#1085#1072#1103' '#1072#1088#1090#1077#1088#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.TextColor = clMaroon
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel28: TcxLabel
          Left = 7
          Top = 21
          Caption = #1057#1090#1077#1085#1086#1079
        end
        object lcbRg12: TcxLookupComboBox
          Left = 83
          Top = 20
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg13
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg12PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 2
          Width = 134
        end
        object cxLabel29: TcxLabel
          Left = 7
          Top = 43
          Caption = #1040#1085#1077#1074#1088#1080#1079#1084#1072
        end
        object lcbRg13: TcxLookupComboBox
          Left = 83
          Top = 42
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg14
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg13PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 4
          Width = 134
        end
        object cxLabel30: TcxLabel
          Left = 7
          Top = 65
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg14: TcxLookupComboBox
          Left = 83
          Top = 64
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg15
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg14PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 6
          Width = 134
        end
        object cxLabel31: TcxLabel
          Left = 7
          Top = 87
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beRg4: TcxButtonEdit
          Left = 83
          Top = 86
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beRg4PropertiesButtonClick
          Properties.OnEditValueChanged = beRg4PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 8
          Width = 134
        end
        object cxLabel32: TcxLabel
          Left = 7
          Top = 109
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1088#1086#1074#1086#1090#1086#1082#1072
        end
        object lcbRg15: TcxLookupComboBox
          Left = 157
          Top = 108
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg16
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg15PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 10
          Width = 60
        end
        object cxLabel79: TcxLabel
          Left = 7
          Top = 131
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbRg16: TcxLookupComboBox
          Left = 83
          Top = 130
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsRg17
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRg16PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 12
          Width = 134
        end
      end
      object Panel2: TPanel
        AlignWithMargins = True
        Left = 2
        Top = 537
        Width = 220
        Height = 35
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 8
        object cxLabel74: TcxLabel
          Left = 7
          Top = 10
          Caption = #1055#1088#1072#1074#1072#1103' '#1095#1080#1089#1090#1072#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.SkinName = 'Caramel'
          Style.TextColor = clTeal
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
        end
        object lcbRgClear: TcxLookupComboBox
          Left = 97
          Top = 8
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = dsRgClear
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbRgClearPropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 1
          Width = 120
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = #1051#1077#1074#1072#1103' '#1089#1090#1086#1088#1086#1085#1072
      ImageIndex = 1
      object Panel10: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 220
        Height = 221
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 0
        object cxLabel50: TcxLabel
          Left = 7
          Top = 20
          Caption = #1048#1079#1074#1080#1090#1086#1089#1090#1100
        end
        object lcbLfIz: TcxLookupComboBox
          Left = 83
          Top = 21
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf1
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLfIzPropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 1
          Width = 134
        end
        object cxLabel51: TcxLabel
          Left = 7
          Top = 44
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf1: TcxLookupComboBox
          Left = 83
          Top = 43
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf2
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf1PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 3
          Width = 134
        end
        object cxLabel52: TcxLabel
          Left = 7
          Top = 66
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beLf1: TcxButtonEdit
          Left = 83
          Top = 65
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beLf1PropertiesButtonClick
          Properties.OnEditValueChanged = beLf1PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 5
          Width = 134
        end
        object cxLabel53: TcxLabel
          Left = 7
          Top = 88
          Caption = #1057#1090#1077#1085#1086#1079
        end
        object lcbLf2: TcxLookupComboBox
          Left = 83
          Top = 87
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf3
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf2PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 7
          Width = 134
        end
        object cxLabel54: TcxLabel
          Left = 7
          Top = 110
          Caption = #1040#1085#1077#1074#1088#1080#1079#1084#1072
        end
        object lcbLf3: TcxLookupComboBox
          Left = 83
          Top = 109
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf4
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf3PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 9
          Width = 134
        end
        object cxLabel55: TcxLabel
          Left = 7
          Top = 132
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf4: TcxLookupComboBox
          Left = 83
          Top = 131
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf5
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf4PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 11
          Width = 134
        end
        object cxLabel56: TcxLabel
          Left = 7
          Top = 154
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beLf2: TcxButtonEdit
          Left = 83
          Top = 153
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beLf2PropertiesButtonClick
          Properties.OnEditValueChanged = beLf2PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 13
          Width = 134
        end
        object cxLabel57: TcxLabel
          Left = 7
          Top = 176
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1088#1086#1074#1086#1090#1086#1082#1072
        end
        object lcbLf5: TcxLookupComboBox
          Left = 157
          Top = 175
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf6
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf5PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 15
          Width = 60
        end
        object cxLabel58: TcxLabel
          Left = 7
          Top = 198
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf6: TcxLookupComboBox
          Left = 83
          Top = 197
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf7
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf6PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 17
          Width = 134
        end
        object cxLabel88: TcxLabel
          Left = 7
          Top = 2
          Caption = #1051#1077#1074#1072#1103' '#1086#1073#1097#1072#1103' '#1087#1086#1076#1074#1079#1076#1086#1096#1085#1072#1103' '#1072#1088#1090#1077#1088#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.TextColor = clNavy
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
      end
      object Panel15: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 229
        Width = 220
        Height = 153
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 1
        object cxLabel108: TcxLabel
          Left = 7
          Top = 2
          Caption = #1053#1072#1088#1091#1078#1085#1072#1103' '#1087#1086#1076#1074#1079#1076#1086#1096#1085#1072#1103' '#1072#1088#1090#1077#1088#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.TextColor = clNavy
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel109: TcxLabel
          Left = 7
          Top = 21
          Caption = #1057#1090#1077#1085#1086#1079
        end
        object lcbLf7: TcxLookupComboBox
          Left = 83
          Top = 20
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf8
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf7PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 2
          Width = 134
        end
        object cxLabel110: TcxLabel
          Left = 7
          Top = 43
          Caption = #1040#1085#1077#1074#1088#1080#1079#1084#1072
        end
        object lcbLf8: TcxLookupComboBox
          Left = 83
          Top = 42
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf9
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf8PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 4
          Width = 134
        end
        object cxLabel111: TcxLabel
          Left = 7
          Top = 65
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf9: TcxLookupComboBox
          Left = 83
          Top = 64
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf10
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf9PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 6
          Width = 134
        end
        object cxLabel112: TcxLabel
          Left = 7
          Top = 87
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beLf3: TcxButtonEdit
          Left = 83
          Top = 86
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beLf3PropertiesButtonClick
          Properties.OnEditValueChanged = beLf3PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 8
          Width = 134
        end
        object cxLabel113: TcxLabel
          Left = 7
          Top = 109
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1088#1086#1074#1086#1090#1086#1082#1072
        end
        object lcbLf10: TcxLookupComboBox
          Left = 157
          Top = 108
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf11
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf10PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 10
          Width = 60
        end
        object cxLabel114: TcxLabel
          Left = 7
          Top = 131
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf11: TcxLookupComboBox
          Left = 83
          Top = 130
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf12
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf11PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 12
          Width = 134
        end
      end
      object Panel16: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 385
        Width = 220
        Height = 153
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 2
        object cxLabel115: TcxLabel
          Left = 7
          Top = 2
          Caption = #1042#1085#1091#1090#1088#1077#1085#1103#1103' '#1087#1086#1076#1074#1079#1076#1086#1096#1085#1072#1103' '#1072#1088#1090#1077#1088#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.TextColor = clNavy
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel116: TcxLabel
          Left = 7
          Top = 21
          Caption = #1057#1090#1077#1085#1086#1079
        end
        object lcbLf12: TcxLookupComboBox
          Left = 83
          Top = 20
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf13
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf12PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 2
          Width = 134
        end
        object cxLabel117: TcxLabel
          Left = 7
          Top = 43
          Caption = #1040#1085#1077#1074#1088#1080#1079#1084#1072
        end
        object lcbLf13: TcxLookupComboBox
          Left = 83
          Top = 42
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf14
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf13PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 4
          Width = 134
        end
        object cxLabel118: TcxLabel
          Left = 7
          Top = 65
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf14: TcxLookupComboBox
          Left = 83
          Top = 64
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf15
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf14PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 6
          Width = 134
        end
        object cxLabel119: TcxLabel
          Left = 7
          Top = 87
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beLf4: TcxButtonEdit
          Left = 83
          Top = 86
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beLf4PropertiesButtonClick
          Properties.OnEditValueChanged = beLf4PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 8
          Width = 134
        end
        object cxLabel120: TcxLabel
          Left = 7
          Top = 109
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1088#1086#1074#1086#1090#1086#1082#1072
        end
        object lcbLf15: TcxLookupComboBox
          Left = 157
          Top = 108
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf16
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf15PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 10
          Width = 60
        end
        object cxLabel121: TcxLabel
          Left = 7
          Top = 131
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf16: TcxLookupComboBox
          Left = 83
          Top = 130
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf17
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf16PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 12
          Width = 134
        end
      end
      object Panel11: TPanel
        AlignWithMargins = True
        Left = 225
        Top = 5
        Width = 220
        Height = 153
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 3
        object cxLabel59: TcxLabel
          Left = 7
          Top = 2
          Caption = #1051#1077#1074#1072#1103' '#1086#1073#1097#1072#1103' '#1073#1077#1076#1088#1077#1085#1085#1072#1103' '#1072#1088#1090#1077#1088#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.TextColor = clNavy
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel60: TcxLabel
          Left = 7
          Top = 21
          Caption = #1057#1090#1077#1085#1086#1079
        end
        object lcbLf17: TcxLookupComboBox
          Left = 83
          Top = 20
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf18
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf17PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 2
          Width = 134
        end
        object cxLabel61: TcxLabel
          Left = 7
          Top = 43
          Caption = #1040#1085#1077#1074#1088#1080#1079#1084#1072
        end
        object lcbLf18: TcxLookupComboBox
          Left = 83
          Top = 42
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf19
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf18PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 4
          Width = 134
        end
        object cxLabel62: TcxLabel
          Left = 7
          Top = 65
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf19: TcxLookupComboBox
          Left = 83
          Top = 64
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf20
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf19PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 6
          Width = 134
        end
        object cxLabel63: TcxLabel
          Left = 7
          Top = 87
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beLf5: TcxButtonEdit
          Left = 83
          Top = 86
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beLf5PropertiesButtonClick
          Properties.OnEditValueChanged = beLf5PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 8
          Width = 134
        end
        object cxLabel64: TcxLabel
          Left = 7
          Top = 109
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1088#1086#1074#1086#1090#1086#1082#1072
        end
        object lcbLf20: TcxLookupComboBox
          Left = 157
          Top = 108
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf21
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf20PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 10
          Width = 60
        end
        object cxLabel65: TcxLabel
          Left = 7
          Top = 131
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf21: TcxLookupComboBox
          Left = 83
          Top = 130
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf22
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf21PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 12
          Width = 134
        end
      end
      object Panel12: TPanel
        AlignWithMargins = True
        Left = 225
        Top = 161
        Width = 220
        Height = 153
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 4
        object cxLabel66: TcxLabel
          Left = 7
          Top = 2
          Caption = #1055#1086#1074#1077#1088#1093#1085#1086#1089#1090#1085#1072#1103' '#1073#1077#1076#1088#1077#1085#1085#1072#1103' '#1072#1088#1090#1077#1088#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.TextColor = clNavy
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel67: TcxLabel
          Left = 7
          Top = 21
          Caption = #1057#1090#1077#1085#1086#1079
        end
        object lcbLf22: TcxLookupComboBox
          Left = 83
          Top = 20
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf23
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf22PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 2
          Width = 134
        end
        object cxLabel89: TcxLabel
          Left = 7
          Top = 43
          Caption = #1040#1085#1077#1074#1088#1080#1079#1084#1072
        end
        object lcbLf23: TcxLookupComboBox
          Left = 83
          Top = 42
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf24
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf23PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 4
          Width = 134
        end
        object cxLabel90: TcxLabel
          Left = 7
          Top = 65
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf24: TcxLookupComboBox
          Left = 83
          Top = 64
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf25
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf24PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 6
          Width = 134
        end
        object cxLabel91: TcxLabel
          Left = 7
          Top = 87
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beLf6: TcxButtonEdit
          Left = 83
          Top = 86
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beLf6PropertiesButtonClick
          Properties.OnEditValueChanged = beLf6PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 8
          Width = 134
        end
        object cxLabel92: TcxLabel
          Left = 7
          Top = 109
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1088#1086#1074#1086#1090#1086#1082#1072
        end
        object lcbLf25: TcxLookupComboBox
          Left = 157
          Top = 108
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf26
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf25PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 10
          Width = 60
        end
        object cxLabel93: TcxLabel
          Left = 7
          Top = 131
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf26: TcxLookupComboBox
          Left = 83
          Top = 130
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf27
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf26PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 12
          Width = 134
        end
      end
      object Panel13: TPanel
        AlignWithMargins = True
        Left = 225
        Top = 317
        Width = 220
        Height = 153
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 5
        object cxLabel94: TcxLabel
          Left = 7
          Top = 2
          Caption = #1043#1083#1091#1073#1086#1082#1072#1103' '#1073#1077#1076#1088#1077#1085#1085#1072#1103' '#1072#1088#1090#1077#1088#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.TextColor = clNavy
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel95: TcxLabel
          Left = 7
          Top = 21
          Caption = #1057#1090#1077#1085#1086#1079
        end
        object lcbLf27: TcxLookupComboBox
          Left = 83
          Top = 20
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf28
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf27PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 2
          Width = 134
        end
        object cxLabel96: TcxLabel
          Left = 7
          Top = 43
          Caption = #1040#1085#1077#1074#1088#1080#1079#1084#1072
        end
        object lcbLf28: TcxLookupComboBox
          Left = 83
          Top = 42
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf29
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf28PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 4
          Width = 134
        end
        object cxLabel97: TcxLabel
          Left = 7
          Top = 65
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf29: TcxLookupComboBox
          Left = 83
          Top = 64
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf30
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf29PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 6
          Width = 134
        end
        object cxLabel98: TcxLabel
          Left = 7
          Top = 87
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beLf7: TcxButtonEdit
          Left = 83
          Top = 86
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beLf7PropertiesButtonClick
          Properties.OnEditValueChanged = beLf7PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 8
          Width = 134
        end
        object cxLabel99: TcxLabel
          Left = 7
          Top = 109
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1088#1086#1074#1086#1090#1086#1082#1072
        end
        object lcbLf30: TcxLookupComboBox
          Left = 157
          Top = 108
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf31
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf30PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 10
          Width = 60
        end
        object cxLabel100: TcxLabel
          Left = 7
          Top = 131
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf31: TcxLookupComboBox
          Left = 83
          Top = 130
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf32
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf31PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 12
          Width = 134
        end
      end
      object Panel14: TPanel
        AlignWithMargins = True
        Left = 448
        Top = 5
        Width = 220
        Height = 135
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 6
        object cxLabel101: TcxLabel
          Left = 7
          Top = 2
          Caption = #1055#1086#1076#1082#1086#1083#1077#1085#1085#1072#1103' '#1072#1088#1090#1077#1088#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.TextColor = clNavy
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel102: TcxLabel
          Left = 7
          Top = 21
          Caption = #1057#1090#1077#1085#1086#1079
        end
        object lcbLf32: TcxLookupComboBox
          Left = 83
          Top = 20
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf33
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf32PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 2
          Width = 134
        end
        object cxLabel104: TcxLabel
          Left = 7
          Top = 43
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf33: TcxLookupComboBox
          Left = 83
          Top = 42
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf34
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf33PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 4
          Width = 134
        end
        object cxLabel105: TcxLabel
          Left = 7
          Top = 65
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beLf8: TcxButtonEdit
          Left = 83
          Top = 64
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beLf8PropertiesButtonClick
          Properties.OnEditValueChanged = beLf8PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 6
          Width = 134
        end
        object cxLabel106: TcxLabel
          Left = 7
          Top = 87
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1088#1086#1074#1086#1090#1086#1082#1072
        end
        object lcbLf34: TcxLookupComboBox
          Left = 157
          Top = 86
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf35
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf34PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 8
          Width = 60
        end
        object cxLabel107: TcxLabel
          Left = 7
          Top = 109
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf35: TcxLookupComboBox
          Left = 83
          Top = 108
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf36
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf35PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 10
          Width = 134
        end
      end
      object Panel19: TPanel
        AlignWithMargins = True
        Left = 448
        Top = 143
        Width = 220
        Height = 135
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 7
        object cxLabel130: TcxLabel
          Left = 7
          Top = 2
          Caption = #1041#1086#1083#1100#1096#1077#1073#1077#1088#1094#1086#1074#1072#1103' '#1072#1088#1090#1077#1088#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.TextColor = clNavy
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel131: TcxLabel
          Left = 7
          Top = 21
          Caption = #1057#1090#1077#1085#1086#1079
        end
        object lcbLf36: TcxLookupComboBox
          Left = 83
          Top = 20
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf37
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf36PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 2
          Width = 134
        end
        object cxLabel133: TcxLabel
          Left = 7
          Top = 43
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf37: TcxLookupComboBox
          Left = 83
          Top = 42
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf38
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf37PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 4
          Width = 134
        end
        object cxLabel134: TcxLabel
          Left = 7
          Top = 65
          Caption = #1044#1086', '#1073#1086#1083#1077#1077
        end
        object beLf9: TcxButtonEdit
          Left = 83
          Top = 64
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.ViewStyle = vsHideCursor
          Properties.OnButtonClick = beLf9PropertiesButtonClick
          Properties.OnEditValueChanged = beLf9PropertiesEditValueChanged
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 6
          Width = 134
        end
        object cxLabel135: TcxLabel
          Left = 7
          Top = 87
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1082#1088#1086#1074#1086#1090#1086#1082#1072
        end
        object lcbLf38: TcxLookupComboBox
          Left = 157
          Top = 86
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf39
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf38PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 8
          Width = 60
        end
        object cxLabel136: TcxLabel
          Left = 7
          Top = 109
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103
        end
        object lcbLf39: TcxLookupComboBox
          Left = 83
          Top = 108
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = frmDM.dsLf40
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLf39PropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 10
          Width = 134
        end
      end
      object Panel17: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 541
        Width = 220
        Height = 35
        Margins.Top = 0
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 8
        object cxLabel122: TcxLabel
          Left = 7
          Top = 10
          Caption = #1051#1077#1074#1072#1103' '#1095#1080#1089#1090#1072#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.SkinName = 'Caramel'
          Style.TextColor = clTeal
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
        end
        object lcbLfClear: TcxLookupComboBox
          Left = 97
          Top = 8
          Properties.DropDownAutoSize = True
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
          Properties.ListSource = dsLfClear
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = lcbLfClearPropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 1
          Width = 120
        end
      end
    end
  end
  object lbDoza: TcxLabel
    Left = 18
    Top = 316
    Caption = #1044#1054#1047#1040
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Book Antiqua'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxDoza: TcxCurrencyEdit
    Left = 116
    Top = 314
    AutoSize = False
    EditValue = '0'
    ParentFont = False
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 4
    Properties.OnChange = cxDozaPropertiesChange
    Style.BorderStyle = ebsOffice11
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Book Antiqua'
    Style.Font.Style = []
    Style.LookAndFeel.SkinName = 'Caramel'
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clBlack
    StyleDisabled.Color = clWhite
    StyleDisabled.LookAndFeel.SkinName = 'Caramel'
    StyleDisabled.TextColor = clBlack
    StyleFocused.LookAndFeel.SkinName = 'Caramel'
    StyleHot.LookAndFeel.SkinName = 'Caramel'
    TabOrder = 9
    Height = 27
    Width = 83
  end
  object lbMZV: TcxLabel
    Left = 205
    Top = 316
    Caption = #1084#1047#1074
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Book Antiqua'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object Panel20: TPanel
    Left = 8
    Top = 439
    Width = 322
    Height = 29
    Alignment = taRightJustify
    BevelOuter = bvNone
    BiDiMode = bdRightToLeft
    Color = clCream
    ParentBiDiMode = False
    ParentBackground = False
    TabOrder = 11
    object dxBarDockControl1: TdxBarDockControl
      Left = 0
      Top = 0
      Width = 322
      Height = 26
      Align = dalTop
      BarManager = BM
    end
  end
  object rve: TRichViewEdit
    Left = 330
    Top = 618
    Width = 360
    Height = 126
    ReadOnly = False
    TabOrder = 13
    TabStop = False
    Visible = False
    BackgroundStyle = bsStretched
    DoInPaletteMode = rvpaCreateCopies
    Options = [rvoAllowSelection, rvoScrollToEnd, rvoShowCheckpoints, rvoShowPageBreaks, rvoTagsArePChars, rvoAutoCopyText, rvoAutoCopyRVF, rvoAutoCopyImage, rvoAutoCopyRTF, rvoFormatInvalidate, rvoDblClickSelectsWord, rvoRClickDeselects, rvoFastFormatting]
    RTFReadProperties.UnicodeMode = rvruMixed
    RTFReadProperties.TextStyleMode = rvrsAddIfNeeded
    RTFReadProperties.ParaStyleMode = rvrsAddIfNeeded
    RVFOptions = [rvfoSavePicturesBody, rvfoSaveControlsBody, rvfoSaveBinary, rvfoSaveBack, rvfoLoadBack, rvfoSaveTextStyles, rvfoSaveParaStyles, rvfoSaveLayout, rvfoLoadLayout, rvfoSaveDocProperties, rvfoLoadDocProperties]
    Style = rvs
  end
  object cxLabel7: TcxLabel
    Left = 200
    Top = 379
    Caption = #1042#1088#1077#1084#1103
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.SkinName = 'Caramel'
    Style.TextColor = clTeal
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Caramel'
    StyleFocused.LookAndFeel.SkinName = 'Caramel'
    StyleHot.LookAndFeel.SkinName = 'Caramel'
  end
  object teTime: TcxTimeEdit
    Left = 241
    Top = 378
    EditValue = 0.000000000000000000
    Properties.ImmediatePost = True
    Properties.TimeFormat = tfHourMin
    Style.LookAndFeel.SkinName = 'Coffee'
    StyleDisabled.BorderColor = clBlack
    StyleDisabled.Color = clWhite
    StyleDisabled.LookAndFeel.SkinName = 'Coffee'
    StyleDisabled.TextColor = clBlack
    StyleFocused.LookAndFeel.SkinName = 'Coffee'
    StyleHot.LookAndFeel.SkinName = 'Coffee'
    TabOrder = 18
    Width = 56
  end
  object lbVyp: TcxLabel
    Left = 8
    Top = 474
    Caption = #1055#1072#1094#1080#1077#1085#1090' '#1074#1099#1087#1080#1089#1072#1085'! '#1056#1077#1078#1080#1084' '#1087#1088#1086#1089#1084#1086#1090#1088#1072'!'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.SkinName = 'Caramel'
    Style.TextColor = clRed
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.SkinName = 'Caramel'
    StyleFocused.LookAndFeel.SkinName = 'Caramel'
    StyleHot.LookAndFeel.SkinName = 'Caramel'
    Visible = False
  end
  object BM: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    Categories.Strings = (
      #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clBtnFace
    LookAndFeel.SkinName = 'Caramel'
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 848
    Top = 343
    DockControlHeights = (
      0
      0
      0
      0)
    object BMBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Main'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 197
      FloatTop = 8
      FloatClientWidth = 51
      FloatClientHeight = 104
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbPodpis'
        end
        item
          Visible = True
          ItemName = 'bbSave'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbCancel'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrint'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object bbPrint: TdxBarButton
      Action = aPrint
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000091
        91917C7C7C8585858080807A7A7A797979000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00A0A0A08C8C8C8C8C8CA1A1A1A0A0A09696969090908686868383837D7D7D96
        9696000000000000000000000000000000000000000000000000000000000000
        000000A9A9A9919191909090A8A8A8A7A7A77777777C7C7C7171716B6B6B5454
        547373738585857A7A7A79797982828200000000000000000000000000000000
        0000000000888888989898959595AEAEAEAEAEAE7F7F7F868686C2C2C2D9D9D9
        ADADADA5A5A55050502828283737375959597676767A7A7A7A7A7A7D7D7D0000
        00000000000000000000000000929292A6A6A6B5B5B5888888979797D1D1D1DE
        DEDED8D8D8D1D1D1AEAEAEB2B2B2939393555555393939282828292929404040
        5F5F5F7474747777777474740000000000000000008C8C8C8C8C8CAAAAAADCDC
        DCE4E4E4DEDEDEDADADAD9D9D9D1D1D1B1B1B1B2B2B2B5B6B6B5B6B8999B9E79
        7B7E4E4F503737372525252B2B2B4848486B6B6B6666660000000000009E9E9E
        EBEBEBEAEAEAE5E5E5E1E1E1DFDFDFDDDDDDDBDBDBCCCCCCB7B7B7B7B7B7B6B8
        BBBBAFA2C1A07CC1A78AB5B4B3969DA377797A4A4A4A44444474747465656500
        0000000000A6A6A6F0F0F0E8E8E8E6E6E6E4E4E4E2E2E2DFDFDFDEDEDECACACA
        BDBDBDBCBDBFBEB8B3DD8723E4993CDF902FDA7D15CA8138BDBBB7B5B6B8A4A4
        A4C0C0C0737373000000000000A0A0A0F4F4F4EBEBEBE9E9E9E7E7E7E4E4E4E1
        E1E1E1E1E1C6C6C6C3C3C3C2C6CDCE9859EAB068E8A95AE6A957E6A653E29B3F
        CA8131BDC0C5C3BEBBC1C0BF6969690000000000009E9E9EEDEDEDF1F1F1ECEC
        ECEAEAEAE7E7E7E3E3E3DDDDDDC8C8C8C8C9CBC8C1BBE1963AEDB874E8AA5CE6
        A857E5A554E6A54FD1822CA4B7C862B3F8C6C0BC606060000000000000AAAAAA
        D6D6D6F6F6F6EFEFEFECECECE8E8E8E7E7E7D5D5D5CFCFCFCDD2DAD69E55EFB9
        79EBB168E9AC60E8A95BE6A855E4A14BD4934E5E9DCA52B4FBABA4A06A6A6A00
        0000000000979797BABABAFBFBFBF2F2F2EDEDEDEBEBEBE1E1E1D8D8D8D7DBE1
        D8BC98E8A958F1BD7EECB168EAAE62E8AB5DE8AA5BDF9334D1B49499A5AEB0B8
        BD8685845F5F5F000000000000000000CFCFCFCACACAF5F5F5F4F4F4EBECEDE4
        E5E7E0E5ECE0CDB3E6A550F6C58DEFB671EDB26AEBAF65E9AC5FE9AB5CD8882A
        D2D8DED9D9D9B4B3B38A8A8A000000000000000000000000000000D0D0D0A6A6
        A7BFBCB9BCB9B7C8C0B4E7C294EFB56DF8CA97F3BB7AF0B672EEB36CEDB168ED
        B064E29739DDC3A2E2E5E9C1C1C18A8A8A000000000000000000000000000000
        0000000000009B9A9BFFFEEBFFECCEF8BB74F3BB78F3BF81F1B770F0B56FF0B4
        6EF0B46CEDB167E6A14AC5975DC0C5CDA6A7A791919194949400000000000000
        00000000000000000000009B9B9BB4B1ADFFFAEBFFF5E5FFF5E5FDE9CCF9DAB4
        F5D09EF1C58AF0BE7AC8985AF1A23CF6A3369FA8B3A4A5A69C9C9C0000000000
        00000000000000000000000000000000000000A0A0A1D1CBC5FFFAEFFFF5E6FF
        F4E3FFF2DFFFF1DBFFF0D8FFEFD4FFF2D3888D94000000000000000000000000
        0000000000000000000000000000000000000000000000000000009E9F9FF1ED
        E5FFFCF2FFF8EAFFF5E6FFF3E1FFF0DAFFEED5FFEFD3E2D3BB8C8D9000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000A2A2A3ECE8E4EEEAE3F5EFE4FEF4E6FFF8E6FFF9E3FFF7DCFFF8DABEB6
        A896979800000000000000000000000000000000000000000000000000000000
        0000000000000000000000A9A9A99192929191928C8D8E898A8C88898B8B8A8C
        9092909897949797960000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
    object bbCancel: TdxBarButton
      Action = aCancel
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000B50000A80101A80000A50000B4000000000000000000
        00000000000000000000000000000000009D00009C00009B0000B80000000000
        000000000000000000000000000000A40001B11542F01545E80E2CC80307AA00
        00B10000A30000000000000000000000000000000000B900009F0520C60312AC
        00009B0000A40000AC0000000000000000000000000000AC0E27D81B4FFF194A
        FB1948F51643E3091CB70000A80000C10000000000000000000000BB00009F0A
        29D60D3EF40B39E6072ED4041CB900009C0000AD0000000000000000000000AC
        2554FC2356FF1D4FFF1C4DFE1A4BFB1947F0102DC60000A90000BE0000000000
        BB0000A10C2DDA1142F80E3FF40D3CF20B39EE0A37E8041FBB00009D00008400
        00000000000000BA0405B82957F92456FF2051FF1F51FF1D4EFD1B4BF41338CE
        0101A90000B10000A40F31DE1446FC1243F81040F50E3EF40D3DF40B3AEF0A36
        E50212AC00009E0000000000000000000000B72D5DFE2859FF2657FF2455FF23
        55FF2051FF1D4CF7153DD60101A71131DE184CFE1547F91444F81243F71040F5
        0E3EF40C3DF30C3CF2072CD500009D0000000000000000000406C43C71FF2F61
        FF2B5BFF295AFF2859FF2758FF2455FF1D4EF81B4BF31C4EFD1B4AFD1848FB15
        46F91444F81243F71040F50F41F80B34E70104AB0000AA000000000000000000
        0000BB2239DA4275FF3769FF2F60FF2C5DFF2A5AFF285AFF2657FF2152FE1E4F
        FF1C4DFF1A4BFD1849FB1546F91544F91347FB0B29D90000A10000B700000000
        00000000000000000000C20000BE080DBF3B63F44273FF3565FF2F60FF2B5CFF
        295AFF2859FF2354FF1F50FE1C4EFE1A4BFE1949FC164AFF0920CC0000A40000
        B90000000000000000000000000000000000000000000000C90000B12338D748
        7AFF3A6BFF3162FF2D5EFF2A5AFF2758FF2354FF1F50FE1D4EFE1C4FFF091BC8
        0000B000008C0000000000000000000000000000000000000000000000000000
        000000DA0000B30B10BF406CFB3768FF3262FF2E5FFF2A5BFF2758FF2455FE1D
        4FFB091AC60000B0000000000000000000000000000000000000000000000000
        0000000000000000000000000000BA0001B64273FF3A6AFF3565FF3262FF2E5F
        FF2A5AFF2657FE1E4EF8102DCA0000AC00008B00000000000000000000000000
        00000000000000000000000000000000000000000000BF2740DF4576FF3D6DFF
        3969FF3565FF3262FF2D5EFF295BFF2555FE1C4CEF0A1AB80000B80000000000
        000000000000000000000000000000000000000000000000000000000000B94D
        7DFF4675FF406FFF3D6EFF396AFF3A6BFF3565FF2C5CFF295AFF2252FD1947E3
        0308B00000C40000000000000000000000000000000000000000000000000000
        000000C72337D85183FF4877FF4372FF406EFF3D6FFF243FE04375FF3364FF2A
        5BFF2657FF1D4FF9143AD10000AE0000C2000000000000000000000000000000
        0000000000000000000000C64D76F85280FF4B79FF4877FF4374FF2342E50000
        AF131FC84274FF3062FF2859FF2353FE1B4BF30C23BF0000B900000000000000
        00000000000000000000000000000000D00F17CC6091FF5280FF4D7BFF497AFF
        3C69FA0000B90000C30000BF1421CD4071FF2D5DFF2455FE1F4FFC1847E7040C
        B40000C50000000000000000000000000000000000000000D03750E45E8EFF54
        82FF507EFF4B7EFF0E1ACC0000D00000000000000000CB1729D23B6DFF2859FF
        2051FF1B4AF8133AD30000B00000C20000000000000000000000000000000000
        D06893FC6491FF5885FF5281FF3252ED0000C600000000000000000000000000
        00BF1D35DA3367FF2454FF1C4EFD1948F20B24C30000B1000000000000000000
        0000000000000000DF1D27D3719EFF6A9AFF5485FF0305C60000D60000000000
        000000000000000000DC0000B52341E52C60FF2053FF1C52FF1032E10000B300
        00000000000000000000000000000000000000E00000D0202DD62637DA0000CE
        0000000000000000000000000000000000000000C60000B62246EB102ADC0103
        BC0000BD0000C700000000000000000000000000000000000000000000000000
        00D20000C30000C30000000000000000000000000000000000000000000000C4
        0000B60000B70000BB0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
    object bbSave: TdxBarButton
      Action = aSave
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000008D000084000286040088000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000009F0003910714B02B14B129
        0A9B140094000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000A80004950817
        B22F13AD2B12AB2613AF27099A13009400000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000000AC
        0003990819B53516B03015AE2C14AD2914AD2713AF29099A1300940000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000B300049C091BB63B1AB43518B13116AF2F13AE2A13AD2913AD2814B0
        28099A1300950000000000000000000000000000000000000000000000000000
        000000000000000000B60103A00820B9411CB53A1AB33619B23417B1323DBE52
        27B43C0EAC2613AC2814B02A099A130095000000000000000000000000000000
        0000000000000000000000000002B21008A61222BB451FB8401DB63B1DB6391B
        B53A17B0310E9F1776D18641BF560EAC2514AE2914B029099913009500000000
        0000000000000000000000000000000000000000000CA61B44C7651FBA431FB8
        411EB73E1FB8401AB33600950000970000930072D1843FBF530EAC2614AD2916
        B12B0999130095000000000000000000000000000000000000000000000EAB22
        76D89117B83D1FBA4321BB441CB639009A0000A70000000000A60000940074D2
        853DBF530EAC2614AD2A15B12D09991300960000000000000000000000000000
        00000000000E9F2346C1616FD58B38C45B26BA4603A00500AC00000000000000
        00000000AA0000950074D2853ABD5010AE2714AD2B15B12C0999130096000000
        000000000000000000000000000000000EB42627BA3E41BF5709A51400C30B00
        000000000000000000000000000000AC0000950076D2883ABD5010AE2815AF2B
        17B32E09991300960000000000000000000000000000000000000011D3240FBC
        1E00D12200000000000000000000000000000000000000000000A60000980177
        D38938BC4E10AE2915AE2C17B32F099912009800000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000A90000980279D48B35BB4C11AF2A15AE2D17B22F099912008A0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000AB0000990377D58B35BB4C11AF2B16B0
        2D17B43202890400000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000A800009905
        79D48C34BA4C11AF2B18B4340188010000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000AD00009B0774D58954CA6C069C11009400000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000009D00009300008F0000990000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
    object bbPodpis: TdxBarButton
      Action = aPodpis
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000886554997766967463967463967463967463977464
        95746295756296736394746193726094715F92725E91705F926F5E93725F7F5F
        4E0000000000000000000000000000000000009A7A69FEF2E4F9EBDDF9EBDDF9
        EBDDF9EBDDF1E4D7E4D7C9EFE3D4F9EADBF9EADCF9EBDBF8EAD8F8E7D5F7E6D2
        F7E6CFFBE7CE906F5D0000000000000000000000000000000000009B7B6BFFFD
        F3FCF6EBFCF6EBFBF6EBFCF6EBD6D0C8C4BEB7D9D3CAFBF4EAFCF4E9FCF4E8FA
        F3E8FBF3E6F9F1E2FAEFE0FBEDD98E6D5B000000000000000000000000000000
        0000009B7C6BFFFDF4FBF6ECDEC4B7DEC4B7DEC4B69F908994857ECEB5A8DDC0
        AFDDBEADDDBDAADDBBA8DDBBA5DEBDA7FBF2E3FCEEDC8F6E5C00000000000000
        00000000000000000000009C7D6CFFFEF6FCF7EEDBC0B6DBC0B6E3CFC76E6863
        837E7CD4C5C0E5D0C5E0C5B8DAB9A7DAB7A4DAB6A1DDB9A3FAF3E6FBF1E1906F
        5E0000000000000000000000000000000000009F7E6DFFFFF8FCF8F1DBC3BADB
        C3BAE4D2CA8E94997C8DA8426253438D487FB373E4CDC0DAB9A6DAB6A3DDBBA5
        FCF4E8FDF1E491705F0000000000000000000000000000000000009F7F70FFFF
        FAFCF9F3DBC5BFDBC5BFE2D0CAAEB6C456A98E26B84240C95E209A3172AC69E4
        CCBEDAB8A5DDBBA7FBF5E9FCF3E4927160000000000000000000000000000000
        000000A38070FFFFFCFDFAF5DBC8C2DBC8C3E0CEC9C3CACF27BE4A6AFF9E56E5
        7F3FC25C1B912A8DB57CE2C8B8DDBCA8FBF5EBFCF2E593715F00000000000000
        0000000000000000000000A38171FFFFFEFDFBF7DBC8C5DBC8C5DDCBC7C8D9C3
        41DC6B69FF9A61F69152DE783BBC56168A23A6BD91E2C7B6FBF6ECFCF4E69572
        61000000000000000000000000000000000000A48372FFFFFFFDFBF9DCC8C3DC
        C8C4DCC7C2E4D4D06CD48655EF8366FF985FF48F4FDA7437B650188721BBC4A1
        FBF7EFFCF3E7947360000000000000000000000000000000000000A58473FFFF
        FFFEFCFBDCC7C2DCC7C2DCC7C1DDC6BFE0D8CF51C9715CF68A67FF995DEF894A
        D46E31AF49208526DCEAD4FEF6EA967362000000000000000000000000000000
        000000A88574FFFFFFFEFDFDEDE2DFEDE2DFEDE2DEEDE1DDEEE2DDDAEAD645D0
        6D61FB9067FF995BEC8648CF692DA7412E8E35EBEFE099786700000000000000
        0000000000000000000000A88675FFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFEFEFE
        FEFDFDFEFDFCC7F7D544DB6F62FC9365FD9857E88242C96121A6373E9842B6A0
        94000000000000000000000000000000000000A98776FFFFFFFFFFFFE0CFCEE0
        CFCEE0CECCE0CDCADFCAC6DFC8C3E6D3CC97DEA34CE67964FE9462FE954EEA7C
        598C657B6D788D8280000000000000000000000000000000000000AC8877FFFF
        FFFFFFFFDDCBC9DDCBCADDCAC8DDC8C5DCC6C1DCC4BCDCC1B8E6D2CA71D78A52
        EE7E5DFD928E9F94D1C6CCB5B1A776767B3D42A8000000000000000000000000
        000000AD8978FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFEFD
        FCFFFDFBF4FAF34FD778A7B7ACFFFDFFFFFFF97786D21730D30913B50000A800
        0000000000000000000000AE8978FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFFFEFDFCFFFFFECDB9AFB3B09CD6C6CDFFFFF17890F13565F93354
        E31625B9000097000000000000000000000000AE8B7AFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFEFEFEFEFEFDFEFDFBFFFFFDD5C7BED3BFB0F9F0DE929ED3
        3666FC4B7AFF304FDC1522B5000096000000000000000000000000AF8B78FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFDFCFEFCFAFFFEFDD9CAC3C4
        A384F0D5A87979C33B60F03D65EE253DCC0307A20000A8000000000000000000
        000000AE8979FFFFFFFEFEFFFEFEFEFEFEFEFEFEFEFEFEFDFEFDFCFEFCFBFEFC
        F9FFFFFCDACCC4BB93699C745BDAC9C4101CC30E19AD02019B0000A700000000
        0000000000000000000000AF8C7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD1BEB48B63519D73600000000000000000000000
        000000000000000000000000000000000000009E7661B18F7FAF8C7BAF8D7BAE
        8B7CAD8C7AAC8A7BAB8979A98878A88777A98A789672619A6B58000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
  end
  object al: TActionList
    Left = 808
    Top = 343
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aPodpis: TAction
      Caption = #1055#1086#1076#1087#1080#1089#1072#1090#1100
      Hint = #1055#1086#1076#1087#1080#1089#1072#1090#1100' '#1087#1088#1086#1090#1086#1082#1086#1083
      ShortCut = 118
      OnExecute = aPodpisExecute
    end
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1087#1088#1086#1090#1086#1082#1086#1083
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
  end
  object dsAccess: TDataSource
    DataSet = odsAccess
    Left = 816
    Top = 464
  end
  object odsAccess: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_ACCESS'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Session = frmMain.os
    Left = 856
    Top = 464
  end
  object dsKontrast: TDataSource
    DataSet = odsKontrast
    Left = 920
    Top = 464
  end
  object odsKontrast: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39#39' as fc_name, 0 as fn_order'
      '  from dual'
      'union all'
      'select fk_id, fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'RHMDL_KONTRAST'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Left = 960
    Top = 464
  end
  object dsSotr: TDataSource
    DataSet = odsSotr
    Left = 920
    Top = 520
  end
  object odsSotr: TOracleDataSet
    SQL.Strings = (
      'select t1.fk_id, '
      '       t1.fc_fam||'#39' '#39'|| '
      
        '       decode(asu.varcharisnull(t1.fc_name), 1, '#39#39', substr(t1.fc' +
        '_name, 0, 1) || '#39'. '#39' || '
      
        '       decode (asu.varcharisnull(t1.fc_otch), 1, '#39#39', substr(t1.f' +
        'c_otch, 0, 1) || '#39'. '#39')) as fc_fio'
      '  from asu.tsotr t1, asu.ts_sprav t2'
      ' where t1.fk_spravid = t2.fk_id'
      '   and t2.fl_vrach = 1'
      '   and t1.fk_otdelid = asu.get_otdel_rhmdl'
      '   and t1.fl_del = 0'
      'order by fc_fam')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000600000046435F4649
      4F010000000000}
    Session = frmMain.os
    Left = 960
    Top = 520
  end
  object dsAorta: TDataSource
    DataSet = odsAorta
    Left = 816
    Top = 512
  end
  object odsAorta: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_AORTA'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Session = frmMain.os
    Left = 856
    Top = 512
  end
  object dsRecom: TDataSource
    DataSet = odsRecom
    Left = 816
    Top = 560
  end
  object odsRecom: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RECOM'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Session = frmMain.os
    Left = 856
    Top = 560
  end
  object rvs: TRVStyle
    TextStyles = <
      item
        StyleName = 'Normal text'
        Charset = RUSSIAN_CHARSET
        FontName = 'Courier New'
        HoverUnderlineColor = clBlack
      end
      item
        StyleName = 'Heading'
        FontName = 'Arial'
        Size = 11
        Style = [fsBold]
      end>
    ParaStyles = <
      item
        StyleName = 'Paragraph Style'
        Tabs = <>
      end
      item
        StyleName = 'Centered'
        Alignment = rvaCenter
        Tabs = <>
      end
      item
        StyleName = 'Left'
        Tabs = <>
      end>
    ListStyles = <>
    DefCodePage = 1251
    InvalidPicture.Data = {
      07544269746D617036100000424D361000000000000036000000280000002000
      0000200000000100200000000000001000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800080808000808080008080800080808000808080008080
      800080808000808080008080800080808000808080008080800080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000}
    StyleTemplates = <>
    Left = 360
    Top = 632
  end
  object odsRVData: TOracleDataSet
    SQL.Strings = (
      'SELECT a.ROWID, a.*'
      '  FROM asu.trichviewdata a'
      ' WHERE a.fk_pacid = :fk_pacid'
      '')
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A464B5F50414349440300000000000000000000
      00}
    SequenceField.Field = 'FK_ID'
    SequenceField.Sequence = 'SEQ_TRICHVIEWDATA'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F494401000000000008000000464B5F5041
      4349440100000000000700000046425F424C4F420000000000000B000000464E
      5F434F4D50524553530100000000000700000046425F48544D4C000000000000
      0700000046425F54455854000000000000}
    Session = frmMain.os
    Left = 400
    Top = 632
    object odsRVDataFK_ID: TFloatField
      FieldName = 'FK_ID'
    end
    object odsRVDataFK_PACID: TFloatField
      FieldName = 'FK_PACID'
      Required = True
    end
    object odsRVDataFB_BLOB: TBlobField
      FieldName = 'FB_BLOB'
      BlobType = ftOraBlob
    end
    object odsRVDataFN_COMPRESS: TFloatField
      FieldName = 'FN_COMPRESS'
      Required = True
    end
    object odsRVDataFB_HTML: TBlobField
      FieldName = 'FB_HTML'
      BlobType = ftOraBlob
    end
    object odsRVDataFB_TEXT: TMemoField
      FieldName = 'FB_TEXT'
      BlobType = ftOraClob
    end
  end
  object dsRgClear: TDataSource
    DataSet = odsRgClear
    Left = 808
    Top = 393
  end
  object odsRgClear: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 125)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_CLEAR'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 848
    Top = 393
  end
  object odsLfClear: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 125)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_CLEAR'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 952
    Top = 345
  end
  object dsLfClear: TDataSource
    DataSet = odsLfClear
    Left = 912
    Top = 345
  end
  object frxProtocol: TfrxReport
    Version = '4.7.21'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40564.637735439800000000
    ReportOptions.LastChange = 40612.450258564820000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxProtocolGetValue
    Left = 216
    Top = 80
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#160#1056#1115#1056#1118#1056#1115#1056#1113#1056#1115#1056#8250' '#1056#1106#1056#1038#1056#1116#1056#1113)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PACFIO]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Top = 49.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1056#1109#1056#183#1057#1026#1056#176#1057#1027#1057#8218)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 113.385900000000000000
          Top = 49.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[AGE]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Top = 71.811070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[OTDEL]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 536.693260000000000000
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1114#1056#1113)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 634.961040000000000000
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[NUMMK]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 177.637910000000000000
        Width = 755.906000000000000000
        RowCount = 1
        StartNewPage = True
        Stretched = True
        object Memo2: TfrxMemoView
          Align = baWidth
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            '   [TEXT1]   ')
          ParentFont = False
          WordBreak = True
        end
      end
      object MasterData2: TfrxMasterData
        Height = 22.677180000000000000
        Top = 332.598640000000000000
        Width = 755.906000000000000000
        RowCount = 1
        StartNewPage = True
        Stretched = True
        object Memo4: TfrxMemoView
          Align = baWidth
          Top = 2.897650000000000000
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            '   [RIGHT]   ')
          ParentFont = False
          WordBreak = True
        end
      end
      object MasterData3: TfrxMasterData
        Height = 22.677180000000000000
        Top = 423.307360000000000000
        Width = 755.906000000000000000
        RowCount = 1
        StartNewPage = True
        Stretched = True
        object Memo23: TfrxMemoView
          Align = baWidth
          Top = 1.000000000000000000
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            '   [LEFT]   ')
          ParentFont = False
          WordBreak = True
        end
      end
      object MasterData9: TfrxMasterData
        Height = 22.677180000000000000
        Top = 287.244280000000000000
        Width = 755.906000000000000000
        RowCount = 1
        StartNewPage = True
        Stretched = True
        object Memo7: TfrxMemoView
          Left = 109.606370000000000000
          Width = 646.299630000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[RECOM]')
          ParentFont = False
        end
        object memRecom: TfrxMemoView
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#160#1056#181#1056#1108#1056#1109#1056#1112#1056#181#1056#1029#1056#1169#1056#176#1057#8224#1056#1105#1056#1105)
          ParentFont = False
        end
      end
      object MasterData10: TfrxMasterData
        Height = 41.574830000000000000
        Top = 222.992270000000000000
        Width = 755.906000000000000000
        RowCount = 1
        StartNewPage = True
        Stretched = True
        object Memo27: TfrxMemoView
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1056#1029#1057#8249#1056#181' '#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#8249)
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Align = baWidth
          Top = 21.677180000000000000
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            '   [RASHOD]   ')
          ParentFont = False
          WordBreak = True
        end
      end
      object MasterData11: TfrxMasterData
        Height = 26.456710000000000000
        Top = 514.016080000000000000
        Width = 755.906000000000000000
        RowCount = 1
        object Memo16: TfrxMemoView
          Top = 3.779530000000020000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#183#1056#176':')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 113.385900000000000000
          Top = 3.779530000000020000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[DOZA]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 211.653680000000000000
          Top = 3.779530000000020000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1112#1056#8212#1056#1030)
          ParentFont = False
        end
      end
      object MasterData12: TfrxMasterData
        Height = 68.031540000000000000
        Top = 563.149970000000000000
        Width = 755.906000000000000000
        RowCount = 1
        object Memo29: TfrxMemoView
          Align = baWidth
          Top = 3.779530000000000000
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#1115#1056#8221#1056#1119#1056#152#1056#1038#1056#172)
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Top = 26.456710000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Top = 49.133890000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1038#1056#1109#1057#8218#1057#1026#1057#1107#1056#1169#1056#1029#1056#1105#1056#1108)
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          AutoWidth = True
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DATERUN]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 113.385900000000000000
          Top = 49.133890000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          AutoWidth = True
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[SOTR]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 691.653990000000000000
        Width = 755.906000000000000000
        object Memo34: TfrxMemoView
          Align = baWidth
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADESIGN], [DATEPRINT]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData14: TfrxMasterData
        Height = 22.677180000000000000
        Top = 377.953000000000000000
        Width = 755.906000000000000000
        RowCount = 1
        StartNewPage = True
        Stretched = True
        object Memo39: TfrxMemoView
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#176#1056#1030#1056#176#1057#1039' '#1057#8225#1056#1105#1057#1027#1057#8218#1056#176#1057#1039':')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 117.165430000000000000
          Width = 638.740570000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            '[RGCLEAR]   ')
          ParentFont = False
          WordBreak = True
        end
      end
      object MasterData4: TfrxMasterData
        Height = 22.677180000000000000
        Top = 468.661720000000000000
        Width = 755.906000000000000000
        RowCount = 1
        StartNewPage = True
        Stretched = True
        object Memo3: TfrxMemoView
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8250#1056#181#1056#1030#1056#176#1057#1039' '#1057#8225#1056#1105#1057#1027#1057#8218#1056#176#1057#1039':')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 117.165430000000000000
          Width = 638.740570000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            '[LFCLEAR]   ')
          ParentFont = False
          WordBreak = True
        end
      end
    end
  end
end
