object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 487
  ClientWidth = 923
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma,204'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 41
    Width = 923
    Height = 446
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 176
    ExplicitTop = 96
    ExplicitWidth = 300
    ExplicitHeight = 150
    ControlData = {
      4C000000655F0000182E00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 923
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 576
    ExplicitTop = 88
    ExplicitWidth = 185
    object Edit1: TEdit
      Left = 16
      Top = 10
      Width = 401
      Height = 22
      TabOrder = 0
    end
    object Button1: TButton
      Left = 440
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
