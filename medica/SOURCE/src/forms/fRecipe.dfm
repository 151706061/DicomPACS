object frmRecipe: TfrmRecipe
  Left = 488
  Top = 330
  BorderStyle = bsDialog
  Caption = 'Серия/номер рецептов'
  ClientHeight = 182
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbSerial: TGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 57
    Caption = 'Серия'
    TabOrder = 0
    object edSerial: TEdit
      Left = 24
      Top = 24
      Width = 121
      Height = 21
      MaxLength = 255
      TabOrder = 0
    end
  end
  object gbNumber: TGroupBox
    Left = 8
    Top = 72
    Width = 185
    Height = 105
    Caption = 'Номер'
    TabOrder = 1
    object lblNumberTo: TLabel
      Left = 8
      Top = 52
      Width = 14
      Height = 13
      Caption = 'По'
    end
    object lblNumberFrom: TLabel
      Left = 8
      Top = 28
      Width = 7
      Height = 13
      Caption = 'С'
    end
    object edNumberFrom: TEdit
      Left = 24
      Top = 24
      Width = 121
      Height = 21
      MaxLength = 10
      TabOrder = 0
    end
    object edNumberTo: TEdit
      Left = 24
      Top = 48
      Width = 121
      Height = 21
      MaxLength = 10
      TabOrder = 1
    end
    object cbResetCurrentNum: TCheckBox
      Left = 8
      Top = 80
      Width = 169
      Height = 17
      Caption = 'Сбросить текущее значение'
      TabOrder = 2
    end
  end
  object btnOK: TButton
    Left = 200
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Применить'
    Default = True
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 200
    Top = 40
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Отменить'
    ModalResult = 2
    TabOrder = 3
  end
end
