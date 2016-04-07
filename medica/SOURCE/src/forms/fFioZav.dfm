object frmFioZav: TfrmFioZav
  Left = 336
  Top = 258
  BorderStyle = bsDialog
  Caption = 'Ввод данных о заведующем отделением'
  ClientHeight = 81
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbFam: TLabel
    Left = 11
    Top = 38
    Width = 52
    Height = 13
    Caption = 'Фамилия:'
  end
  object edFam: TEdit
    Left = 68
    Top = 35
    Width = 216
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 293
    Height = 28
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 24
        Width = 289
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 276
      Height = 24
      AutoSize = True
      ButtonWidth = 84
      Caption = 'ToolBar1'
      Flat = True
      Images = dmMain.ilMain
      List = True
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acApply
      end
      object ToolButton2: TToolButton
        Left = 84
        Top = 0
        Action = acCancel
      end
    end
  end
  object cbDontShow: TCheckBox
    Left = 13
    Top = 62
    Width = 177
    Height = 17
    Caption = 'Не выводить больше это окно'
    TabOrder = 2
  end
  object alActions: TActionList
    Images = dmMain.ilMain
    Left = 141
    Top = 6
    object acApply: TAction
      Caption = 'Применить'
      Hint = 'Применить'
      ImageIndex = 9
      ShortCut = 13
      OnExecute = acApplyExecute
    end
    object acCancel: TAction
      Caption = 'Отменить'
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
end
