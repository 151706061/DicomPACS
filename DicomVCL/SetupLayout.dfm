object LayoutSetupForm: TLayoutSetupForm
  Left = 429
  Top = 209
  Width = 283
  Height = 176
  Caption = 'Setup Layout'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 17
    Top = 18
    Width = 22
    Height = 13
    Caption = 'Row'
  end
  object Label2: TLabel
    Left = 18
    Top = 50
    Width = 29
    Height = 13
    Caption = 'Colum'
  end
  object BitBtn1: TBitBtn
    Left = 107
    Top = 115
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object SpinEdit1: TEdit
    Left = 73
    Top = 11
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'SpinEdit1'
  end
  object SpinEdit2: TEdit
    Left = 73
    Top = 41
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'SpinEdit2'
  end
  object CheckBox1: TCheckBox
    Left = 21
    Top = 74
    Width = 118
    Height = 17
    Caption = 'Display Image info'
    TabOrder = 3
  end
  object CheckBox2: TCheckBox
    Left = 21
    Top = 97
    Width = 137
    Height = 17
    Caption = 'Limit One Series'
    TabOrder = 4
  end
end
