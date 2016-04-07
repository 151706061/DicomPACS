object frmDateInput: TfrmDateInput
  Left = 394
  Top = 323
  HelpContext = 47
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1090#1091
  ClientHeight = 59
  ClientWidth = 127
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
  OnCreate = FormCreate
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 127
    Height = 29
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        Width = 123
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 114
      Height = 25
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
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
    EditValue = 0d
    Properties.DateButtons = [btnToday]
    Properties.ImmediatePost = True
    Properties.InputKind = ikMask
    Properties.SaveTime = False
    Properties.ShowTime = False
    Properties.OnValidate = deDatePropertiesValidate
    Style.BorderStyle = ebs3D
    TabOrder = 1
    Width = 89
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 131
    Top = 4
    object acOk: TAction
      Caption = 'Ok'
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acOkExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
end
