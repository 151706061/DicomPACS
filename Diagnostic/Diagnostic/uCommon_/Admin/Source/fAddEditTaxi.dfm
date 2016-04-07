object frmAddEditTaxi: TfrmAddEditTaxi
  Left = 358
  Top = 165
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1080#1083#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1090#1072#1082#1089#1080
  ClientHeight = 348
  ClientWidth = 282
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
    Width = 276
    Height = 297
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 8
      Top = 14
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object teName: TcxTextEdit
      Left = 97
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
      Width = 168
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 38
      Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1085#1086'*:'
    end
    object teShort: TcxTextEdit
      Left = 97
      Top = 38
      ParentFont = False
      Properties.MaxLength = 10
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
      Width = 168
    end
    object sePriceKM: TcxSpinEdit
      Left = 169
      Top = 63
      Properties.ImmediatePost = True
      Style.LookAndFeel.SkinName = 'Coffee'
      StyleDisabled.LookAndFeel.SkinName = 'Coffee'
      StyleFocused.LookAndFeel.SkinName = 'Coffee'
      StyleHot.LookAndFeel.SkinName = 'Coffee'
      TabOrder = 4
      Width = 96
    end
    object cxLabel4: TcxLabel
      Left = 8
      Top = 63
      Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' 1 '#1082#1084' '#1087#1086' '#1084'/'#1075'('#1088#1091#1073'.):'
    end
    object gbPercent: TcxGroupBox
      Left = 8
      Top = 88
      Caption = #1055#1088#1086#1094#1077#1085#1090#1086#1074#1082#1072
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 6
      Height = 105
      Width = 257
      object cxLabel5: TcxLabel
        Left = 16
        Top = 19
        Caption = #1057#1086' '#1089#1074#1086#1073#1086#1076#1085#1099#1093':'
      end
      object cxLabel6: TcxLabel
        Left = 16
        Top = 43
        Caption = #1055#1086' '#1084'/'#1075':'
      end
      object meFree: TcxMaskEdit
        Left = 102
        Top = 19
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d+'
        Properties.MaxLength = 0
        Style.LookAndFeel.SkinName = 'Caramel'
        StyleDisabled.LookAndFeel.SkinName = 'Caramel'
        StyleFocused.LookAndFeel.SkinName = 'Caramel'
        StyleHot.LookAndFeel.SkinName = 'Caramel'
        TabOrder = 2
        Width = 121
      end
      object meMG: TcxMaskEdit
        Left = 102
        Top = 43
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d+'
        Properties.MaxLength = 0
        Style.LookAndFeel.SkinName = 'Caramel'
        StyleDisabled.LookAndFeel.SkinName = 'Caramel'
        StyleFocused.LookAndFeel.SkinName = 'Caramel'
        StyleHot.LookAndFeel.SkinName = 'Caramel'
        TabOrder = 3
        Width = 121
      end
      object cxLabel7: TcxLabel
        Left = 16
        Top = 67
        Caption = #1054#1089#1090#1072#1083#1100#1085#1099#1077':'
      end
      object meAll: TcxMaskEdit
        Left = 102
        Top = 67
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d+'
        Properties.MaxLength = 0
        Style.LookAndFeel.SkinName = 'Caramel'
        StyleDisabled.LookAndFeel.SkinName = 'Caramel'
        StyleFocused.LookAndFeel.SkinName = 'Caramel'
        StyleHot.LookAndFeel.SkinName = 'Caramel'
        TabOrder = 5
        Width = 121
      end
      object cxLabel3: TcxLabel
        Left = 229
        Top = 19
        Caption = '%'
      end
      object cxLabel8: TcxLabel
        Left = 229
        Top = 43
        Caption = '%'
      end
      object cxLabel9: TcxLabel
        Left = 229
        Top = 67
        Caption = '%'
      end
    end
    object gbTalon: TcxGroupBox
      Left = 8
      Top = 199
      Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1090#1072#1083#1086#1085#1091
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 7
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
    Top = 303
    Width = 276
    Height = 42
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 16
    ExplicitTop = 312
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bOk: TcxButton
      Left = 106
      Top = 9
      Width = 75
      Height = 25
      Action = aOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Caramel'
    end
    object cxButton1: TcxButton
      Left = 190
      Top = 9
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
    Left = 331
    Top = 19
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
end
