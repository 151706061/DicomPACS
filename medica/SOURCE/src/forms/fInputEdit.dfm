object fmInputEdit: TfmInputEdit
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  ClientHeight = 74
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    305
    74)
  PixelsPerInch = 96
  TextHeight = 13
  object teEdit: TcxTextEdit
    Left = 8
    Top = 8
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Width = 289
  end
  object buOk: TcxButton
    Left = 9
    Top = 41
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 1
  end
  object buCancel: TcxButton
    Left = 221
    Top = 41
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
end
