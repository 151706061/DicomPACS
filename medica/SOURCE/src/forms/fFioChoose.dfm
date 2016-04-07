object frmFioChoose: TfrmFioChoose
  Left = 271
  Top = 240
  Width = 436
  Height = 284
  Caption = 'Выбор ФИО'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 428
    Height = 28
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 24
        Width = 424
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 411
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
  object al: TActionList
    Images = dmMain.ilMain
    Left = 378
    Top = 18
    object acApply: TAction
      Caption = 'Применить'
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acApplyExecute
    end
    object acCancel: TAction
      Caption = 'Отмена'
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
end
