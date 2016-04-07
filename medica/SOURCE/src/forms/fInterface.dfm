object fmInterface: TfmInterface
  Left = 293
  Top = 96
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1048#1085#1090#1077#1088#1092#1077#1081#1089
  ClientHeight = 220
  ClientWidth = 284
  Color = clBtnFace
  Constraints.MinHeight = 247
  Constraints.MinWidth = 292
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    284
    220)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 83
    Width = 284
    Height = 6
    Align = alTop
    Shape = bsBottomLine
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = ' '#1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1075#1083#1072#1074#1085#1099#1093' '#1090#1072#1073#1083#1080#1094' '
    TabOrder = 0
    DesignSize = (
      284
      83)
    Height = 83
    Width = 284
    object cxLabel1: TcxLabel
      Left = 12
      Top = 22
      Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072' '#1095#1077#1090#1085#1099#1093' '#1089#1090#1088#1086#1082
    end
    object cxLabel2: TcxLabel
      Left = 12
      Top = 50
      Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072' '#1085#1077#1095#1077#1090#1085#1099#1093' '#1089#1090#1088#1086#1082
    end
    object bedMasterTableColorBgndEven: TcxButtonEdit
      Left = 160
      Top = 22
      Anchors = [akLeft, akTop, akRight]
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = bedMasterTableColorBgndEvenPropertiesButtonClick
      Style.Color = clWhite
      TabOrder = 2
      Text = #1058#1077#1082#1089#1090
      Width = 115
    end
    object bedMasterTableColorBgndOdd: TcxButtonEdit
      Left = 160
      Top = 48
      Anchors = [akLeft, akTop, akRight]
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = bedMasterTableColorBgndEvenPropertiesButtonClick
      Style.Color = clWhite
      TabOrder = 3
      Text = #1058#1077#1082#1089#1090
      Width = 115
    end
  end
  object buOK: TcxButton
    Left = 14
    Top = 187
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 1
    OnClick = buOKClick
    LookAndFeel.Kind = lfStandard
  end
  object buCancel: TcxButton
    Left = 106
    Top = 187
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
    LookAndFeel.Kind = lfStandard
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 89
    Align = alTop
    Caption = ' '#1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1090#1072#1073#1083#1080#1094' '
    TabOrder = 2
    DesignSize = (
      284
      83)
    Height = 83
    Width = 284
    object cxLabel3: TcxLabel
      Left = 12
      Top = 22
      Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072' '#1095#1077#1090#1085#1099#1093' '#1089#1090#1088#1086#1082
    end
    object cxLabel4: TcxLabel
      Left = 12
      Top = 50
      Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072' '#1085#1077#1095#1077#1090#1085#1099#1093' '#1089#1090#1088#1086#1082
    end
    object bedDetailTableColorBgndEven: TcxButtonEdit
      Left = 160
      Top = 22
      Anchors = [akLeft, akTop, akRight]
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = bedMasterTableColorBgndEvenPropertiesButtonClick
      Style.Color = clWhite
      TabOrder = 2
      Text = #1058#1077#1082#1089#1090
      Width = 115
    end
    object bedDetailTableColorBgndOdd: TcxButtonEdit
      Left = 160
      Top = 48
      Anchors = [akLeft, akTop, akRight]
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = bedMasterTableColorBgndEvenPropertiesButtonClick
      Style.Color = clWhite
      TabOrder = 3
      Text = #1058#1077#1082#1089#1090
      Width = 115
    end
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'fmInterface\'
    StoredValues = <>
    Left = 220
    Top = 174
  end
  object ColorDialog1: TColorDialog
    Left = 88
    Top = 66
  end
end
