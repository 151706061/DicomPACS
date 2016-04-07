object fGetDate: TfGetDate
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = #1044#1072#1090#1072', '#1076#1086' '#1082#1086#1090#1086#1088#1086#1081' '#1086#1095#1080#1097#1072#1090#1100
  ClientHeight = 101
  ClientWidth = 230
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
  object chbUseDefaultDateBeg: TCheckBox
    Left = 137
    Top = 310
    Width = 137
    Height = 17
    Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1076#1083#1103' '#1074#1089#1077#1093
    TabOrder = 0
  end
  object btOK: TBitBtn
    Left = 23
    Top = 61
    Width = 75
    Height = 25
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 1
  end
  object de: TcxDateEdit
    Left = 57
    Top = 18
    ParentFont = False
    Properties.DateButtons = [btnToday]
    Properties.ShowTime = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 2
    Width = 121
  end
  object btCanel: TBitBtn
    Left = 137
    Top = 61
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
end
