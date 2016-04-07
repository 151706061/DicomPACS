object NewHostForm: TNewHostForm
  Left = 302
  Top = 283
  Width = 333
  Height = 147
  Caption = 'New Host'
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
    Top = 16
    Width = 53
    Height = 13
    Caption = 'Host Name'
  end
  object Label2: TLabel
    Left = 15
    Top = 51
    Width = 19
    Height = 13
    Caption = 'Port'
  end
  object Edit1: TEdit
    Left = 80
    Top = 10
    Width = 218
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 80
    Top = 41
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 86
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 186
    Top = 86
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
end
