object frmRun: TfrmRun
  Left = 378
  Top = 205
  BorderStyle = bsSingle
  Caption = #1060#1086#1088#1084#1072' '#1090#1077#1089#1090#1086#1074#1086#1075#1086' '#1079#1072#1087#1091#1089#1082#1072
  ClientHeight = 202
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 91
    Width = 35
    Height = 13
    Caption = 'NAZID:'
  end
  object Label2: TLabel
    Left = 88
    Top = 64
    Width = 35
    Height = 13
    Caption = 'PACID:'
  end
  object tePacid: TcxTextEdit
    Left = 129
    Top = 61
    TabOrder = 0
    Width = 121
  end
  object teNazid: TcxTextEdit
    Left = 129
    Top = 88
    TabOrder = 1
    Width = 121
  end
  object cxButton1: TcxButton
    Left = 336
    Top = 60
    Width = 75
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    TabOrder = 2
    OnClick = cxButton1Click
    LookAndFeel.SkinName = 'Black'
  end
  object cxButton2: TcxButton
    Left = 336
    Top = 154
    Width = 75
    Height = 25
    Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100
    TabOrder = 3
    OnClick = cxButton2Click
    LookAndFeel.SkinName = 'Black'
  end
  object cxButton3: TcxButton
    Left = 336
    Top = 91
    Width = 75
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100'Res'
    TabOrder = 4
    OnClick = cxButton3Click
    LookAndFeel.SkinName = 'Black'
  end
  object cxButton4: TcxButton
    Left = 336
    Top = 122
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 5
    OnClick = cxButton4Click
    LookAndFeel.SkinName = 'Black'
  end
  object teNazid1: TcxTextEdit
    Left = 129
    Top = 136
    TabOrder = 6
    Width = 121
  end
  object teNazid2: TcxTextEdit
    Left = 129
    Top = 163
    TabOrder = 7
    Width = 121
  end
end
