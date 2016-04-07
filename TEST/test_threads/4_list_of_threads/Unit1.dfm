object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Threads'
  ClientHeight = 570
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma,204'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object Button1: TButton
    Left = 16
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Start new'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 128
    Top = 0
    Width = 621
    Height = 570
    Align = alRight
    ScrollBars = ssBoth
    TabOrder = 1
  end
end
