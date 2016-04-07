object SelectPacsHostForm: TSelectPacsHostForm
  Left = 442
  Top = 323
  Width = 408
  Height = 344
  Caption = 'retry connection'
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
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 164
    Width = 400
    Height = 112
    Align = alBottom
    Caption = 'Hosts'
    Columns = 2
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 400
    Height = 164
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 276
    Width = 400
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 257
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkAbort
    end
    object BitBtn2: TBitBtn
      Left = 162
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkRetry
    end
    object Button1: TButton
      Left = 67
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Setup'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
end
