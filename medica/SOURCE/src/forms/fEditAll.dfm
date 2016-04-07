object frmEditAll: TfrmEditAll
  Left = 338
  Top = 402
  HelpContext = 16
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1054#1073#1097#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 99
  ClientWidth = 190
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'StMedsestra.chm'
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnActivate = FormActivate
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 44
    Width = 190
    Height = 55
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object CheckBox1: TCheckBox
      Left = 50
      Top = 24
      Width = 113
      Height = 17
      Caption = #1059#1095#1077#1090' "'#1082#1088#1072#1089#1085#1099#1084'"'
      TabOrder = 0
      OnClick = CheckBox1Click
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 190
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 186
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 173
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 60
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Images = dmMain.ilMain
      ShowCaptions = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acEnter
      end
      object ToolButton2: TToolButton
        Left = 60
        Top = 0
        Action = acEsc
      end
    end
  end
  object ActionList1: TActionList
    Images = dmMain.ilMain
    Left = 136
    Top = 8
    object acEnter: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acEnterExecute
    end
    object acEsc: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acEscExecute
    end
  end
end
