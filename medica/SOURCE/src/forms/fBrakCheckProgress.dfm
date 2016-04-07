object fmBrakCheckProgress: TfmBrakCheckProgress
  Left = 305
  Top = 356
  BorderStyle = bsToolWindow
  Caption = #1055#1088#1086#1075#1088#1077#1089#1089
  ClientHeight = 83
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 0
    Top = 0
    Width = 288
    Height = 27
    Align = alTop
    ForeColor = clBlue
    Progress = 0
  end
  object buCancel: TcxButton
    Left = 100
    Top = 50
    Width = 75
    Height = 25
    Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100
    TabOrder = 0
    OnClick = buCancelClick
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 196
    Top = 36
  end
end
