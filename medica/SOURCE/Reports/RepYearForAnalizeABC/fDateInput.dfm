object frmDateInput: TfrmDateInput
  Left = 394
  Top = 323
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1090#1091
  ClientHeight = 59
  ClientWidth = 180
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 180
    Height = 29
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        Width = 176
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 163
      Height = 25
      Caption = 'ToolBar1'
      Flat = True
      Images = frmGetPeriod.ilImages
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acOk
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Action = acCancel
      end
    end
  end
  object deDate: TcxDateEdit
    Left = 21
    Top = 34
    Width = 142
    Height = 21
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.BorderStyle = ebs3D
    TabOrder = 1
    EditValue = 0d
  end
  object al: TActionList
    Images = frmGetPeriod.ilImages
    Left = 67
    Top = 4
    object acOk: TAction
      Caption = 'Ok'
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      ImageIndex = 0
      ShortCut = 113
      OnExecute = acOkExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 1
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
end
