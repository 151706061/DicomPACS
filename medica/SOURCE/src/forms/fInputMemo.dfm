object frmInputMemo: TfrmInputMemo
  Left = 264
  Top = 223
  Width = 536
  Height = 226
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 528
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 38
        Width = 524
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 511
      Height = 38
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 64
      Caption = 'ToolBar1'
      Flat = True
      Images = dmMain.ilMain
      ShowCaptions = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acApply
      end
      object ToolButton2: TToolButton
        Left = 64
        Top = 0
        Action = acCancel
      end
    end
  end
  object Me: TMemo
    Left = 0
    Top = 42
    Width = 528
    Height = 150
    Align = alClient
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
  end
  object alOtmena: TActionList
    Images = dmMain.ilMain
    Left = 168
    Top = 24
    object acApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acApplyExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 14
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
end
