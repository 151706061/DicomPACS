object frmSetLastFluNum: TfrmSetLastFluNum
  Left = 419
  Top = 226
  BorderStyle = bsDialog
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1085#1086#1084#1077#1088#1072' '#1092#1083#1102#1086#1088#1086#1075#1088#1072#1092#1080#1080
  ClientHeight = 137
  ClientWidth = 196
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
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 92
    Height = 13
    Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1085#1086#1084#1077#1088':'
  end
  object lbNum: TLabel
    Left = 122
    Top = 16
    Width = 35
    Height = 13
    Caption = 'lbNum'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 48
    Width = 91
    Height = 13
    Caption = #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1085#1086#1084#1077#1088':'
  end
  object seLastNum: TcxSpinEdit
    Left = 122
    Top = 45
    Properties.ImmediatePost = True
    Style.LookAndFeel.SkinName = 'Office2007Green'
    StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
    StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
    StyleHot.LookAndFeel.SkinName = 'Office2007Green'
    TabOrder = 0
    Width = 55
  end
  object bOk: TcxButton
    Left = 24
    Top = 96
    Width = 67
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = bOkClick
    LookAndFeel.SkinName = 'Office2007Green'
  end
  object bCancel: TcxButton
    Left = 105
    Top = 96
    Width = 72
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = bCancelClick
    LookAndFeel.SkinName = 'Office2007Green'
  end
end
