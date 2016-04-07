object frmAddEditDrv: TfrmAddEditDrv
  Left = 452
  Top = 105
  BorderStyle = bsDialog
  Caption = 'frmAddEditDrv'
  ClientHeight = 448
  ClientWidth = 455
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
    Width = 449
    Height = 406
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 24
      Top = 15
      Caption = #1055#1086#1079#1099#1074#1085#1086#1081':'
    end
    object cxLabel2: TcxLabel
      Left = 24
      Top = 141
      Caption = #1055#1088#1080#1085#1103#1090' '#1085#1072' '#1088#1072#1073#1086#1090#1091':'
    end
    object cxLabel6: TcxLabel
      Left = 24
      Top = 40
      Caption = #1060#1048#1054' '#1090#1072#1082#1089#1080#1089#1090#1072':'
    end
    object teFio: TcxTextEdit
      Left = 156
      Top = 40
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
      TabOrder = 0
      Width = 288
    end
    object cxLabel7: TcxLabel
      Left = 24
      Top = 65
      Caption = #1052#1072#1088#1082#1072' '#1080' '#1085#1086#1084#1077#1088' '#1072#1074#1090#1086':'
    end
    object teAuto: TcxTextEdit
      Left = 156
      Top = 65
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
      Width = 288
    end
    object cxLabel8: TcxLabel
      Left = 24
      Top = 90
      Caption = #1043#1086#1076' '#1074#1099#1087#1091#1089#1082#1072':'
    end
    object teYear: TcxTextEdit
      Left = 156
      Top = 90
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
      TabOrder = 2
      Width = 101
    end
    object deIn: TcxDateEdit
      Left = 156
      Top = 141
      Properties.DateButtons = [btnToday]
      Properties.DateOnError = deNull
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 3
      Width = 101
    end
    object cxLabel3: TcxLabel
      Left = 24
      Top = 166
      Caption = #1059#1074#1086#1083#1077#1085':'
    end
    object cxLabel4: TcxLabel
      Left = 24
      Top = 191
      Caption = #1052#1077#1076#1080#1094#1080#1085#1089#1082#1072#1103' '#1089#1087#1088#1072#1074#1082#1072':'
    end
    object cxLabel5: TcxLabel
      Left = 277
      Top = 141
      Caption = '20 '#1095#1072#1089#1086#1074':'
    end
    object cxLabel9: TcxLabel
      Left = 277
      Top = 166
      Caption = #1051#1080#1094#1077#1085#1079#1080#1103':'
    end
    object deOut: TcxDateEdit
      Left = 156
      Top = 166
      Properties.DateButtons = [btnToday]
      Properties.DateOnError = deNull
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 4
      Width = 101
    end
    object deMed: TcxDateEdit
      Left = 156
      Top = 191
      Properties.DateButtons = [btnToday]
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 5
      Width = 101
    end
    object de20: TcxDateEdit
      Left = 343
      Top = 141
      Properties.DateButtons = [btnToday]
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 6
      Width = 101
    end
    object deLic: TcxDateEdit
      Left = 343
      Top = 166
      Properties.DateButtons = [btnToday]
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 7
      Width = 101
    end
    object cxLabel10: TcxLabel
      Left = 24
      Top = 115
      Caption = #1052#1086#1073#1080#1083#1100#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085':'
    end
    object tePhone: TcxTextEdit
      Left = 156
      Top = 115
      ParentFont = False
      Properties.MaxLength = 11
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
      TabOrder = 18
      Width = 288
    end
    object cxLabel11: TcxLabel
      Left = 24
      Top = 218
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080':'
    end
    object memCom: TcxMemo
      Left = 156
      Top = 217
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 20
      Height = 127
      Width = 288
    end
    object cbBag: TcxCheckBox
      Left = 156
      Top = 350
      Caption = #1041#1072#1075#1072#1078#1085#1080#1082
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
      State = cbsGrayed
      Style.LookAndFeel.SkinName = 'Coffee'
      StyleDisabled.LookAndFeel.SkinName = 'Coffee'
      StyleFocused.LookAndFeel.SkinName = 'Coffee'
      StyleHot.LookAndFeel.SkinName = 'Coffee'
      TabOrder = 21
      Width = 121
    end
    object cbTros: TcxCheckBox
      Left = 156
      Top = 373
      Caption = #1058#1088#1086#1089
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
      State = cbsGrayed
      Style.LookAndFeel.SkinName = 'Coffee'
      StyleDisabled.LookAndFeel.SkinName = 'Coffee'
      StyleFocused.LookAndFeel.SkinName = 'Coffee'
      StyleHot.LookAndFeel.SkinName = 'Coffee'
      TabOrder = 22
      Width = 121
    end
    object meName: TcxMaskEdit
      Left = 156
      Top = 15
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+'
      Properties.MaxLength = 0
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 23
      Width = 101
    end
  end
  object bOk: TcxButton
    Left = 295
    Top = 416
    Width = 75
    Height = 25
    Action = aOk
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
  end
  object cxButton1: TcxButton
    Left = 377
    Top = 416
    Width = 75
    Height = 25
    Action = aCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.SkinName = 'Caramel'
  end
  object al: TActionList
    Left = 347
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
end
