object ProdCertEditDlg: TProdCertEditDlg
  Left = 506
  Top = 355
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'ProdCertEditDlg'
  ClientHeight = 86
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    305
    86)
  PixelsPerInch = 96
  TextHeight = 13
  object m_lblEditCaption: TLabel
    Left = 8
    Top = 8
    Width = 82
    Height = 13
    Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100':'
  end
  object m_edValue: TEdit
    Left = 8
    Top = 24
    Width = 289
    Height = 21
    TabOrder = 0
  end
  object m_btnOK: TButton
    Left = 176
    Top = 55
    Width = 57
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1050
    Default = True
    ModalResult = 1
    TabOrder = 1
    ExplicitTop = 56
  end
  object m_btnCancel: TButton
    Left = 240
    Top = 55
    Width = 57
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
    ExplicitTop = 56
  end
  object chbForeighn: TcxCheckBox
    Left = 8
    Top = 51
    Caption = #1048#1084#1087#1086#1088#1090#1085#1099#1081
    TabOrder = 3
    Transparent = True
    Width = 121
  end
end
