object RenderingProcessBarForm: TRenderingProcessBarForm
  Left = 545
  Top = 340
  Width = 413
  Height = 147
  Caption = 'Processing'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 28
    Top = 10
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object ProgressBar1: TProgressBar
    Left = 26
    Top = 25
    Width = 353
    Height = 42
    TabOrder = 0
  end
  object Button1: TButton
    Left = 167
    Top = 84
    Width = 75
    Height = 25
    Caption = 'Abort'
    TabOrder = 1
    OnClick = Button1Click
  end
end
