object SprOKDPEdit: TSprOKDPEdit
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1054#1050#1044#1055
  ClientHeight = 166
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    305
    166)
  PixelsPerInch = 96
  TextHeight = 13
  object m_lblEditCaption: TLabel
    Left = 8
    Top = 8
    Width = 57
    Height = 13
    Caption = #1050#1086#1076' '#1054#1050#1044#1055':'
  end
  object Label1: TLabel
    Left = 8
    Top = 51
    Width = 194
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1099':'
  end
  object m_edCode: TEdit
    Left = 8
    Top = 24
    Width = 289
    Height = 21
    MaxLength = 7
    TabOrder = 0
  end
  object m_btnOK: TButton
    Left = 176
    Top = 133
    Width = 57
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1050
    Default = True
    ModalResult = 1
    TabOrder = 1
    ExplicitTop = 109
  end
  object m_btnCancel: TButton
    Left = 240
    Top = 133
    Width = 57
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
    ExplicitTop = 109
  end
  object m_edName: TMemo
    Left = 8
    Top = 69
    Width = 289
    Height = 58
    ScrollBars = ssVertical
    TabOrder = 3
  end
end
