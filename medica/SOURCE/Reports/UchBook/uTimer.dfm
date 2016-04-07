object fTimer: TfTimer
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 84
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 248
    Height = 84
    Align = alClient
    Caption = #1048#1076#1105#1090' '#1089#1073#1086#1088' '#1076#1072#1085#1085#1099#1093'...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Timer: TTimer
    Interval = 5000
    OnTimer = TimerTimer
    Left = 8
    Top = 8
  end
  object Timer1: TTimer
    Interval = 250
    OnTimer = Timer1Timer
    Left = 208
    Top = 8
  end
end
