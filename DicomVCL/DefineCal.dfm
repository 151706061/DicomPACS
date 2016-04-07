object CalibrateForm: TCalibrateForm
  Left = 437
  Top = 242
  Width = 238
  Height = 293
  Caption = 'Calibrate'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 183
    Width = 71
    Height = 13
    Caption = 'Custom Length'
  end
  object Label2: TLabel
    Left = 8
    Top = 12
    Width = 111
    Height = 13
    Caption = 'Current Length (in pixel)'
  end
  object DefineRulerUnit: TLabel
    Left = 179
    Top = 184
    Width = 14
    Height = 13
    Caption = 'cm'
  end
  object RadioGroup1: TRadioGroup
    Left = 22
    Top = 69
    Width = 185
    Height = 105
    Caption = 'Predefine Length'
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      '0.1cm'
      '1cm'
      '2cm'
      '5cm'
      '10cm'
      'Custom')
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object Edit1: TEdit
    Left = 91
    Top = 176
    Width = 83
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 31
    Top = 30
    Width = 169
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 38
    Top = 213
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 214
    Width = 75
    Height = 25
    TabOrder = 4
    Kind = bkCancel
  end
end
