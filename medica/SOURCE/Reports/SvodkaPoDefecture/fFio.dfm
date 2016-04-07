object frmFIO: TfrmFIO
  Left = 222
  Top = 227
  Width = 373
  Height = 162
  Caption = 'Ввод данных для отчета'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 365
    Height = 106
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object lbPosition: TLabel
      Left = 74
      Top = 38
      Width = 61
      Height = 13
      Caption = 'Должность:'
    end
    object lbExSign: TLabel
      Left = 16
      Top = 66
      Width = 119
      Height = 13
      Caption = 'Расшифровка подписи:'
    end
    object edPosition: TEdit
      Left = 140
      Top = 32
      Width = 203
      Height = 21
      TabOrder = 0
    end
    object edExSign: TEdit
      Left = 140
      Top = 62
      Width = 203
      Height = 21
      TabOrder = 1
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 365
    Height = 29
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        Width = 361
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 348
      Height = 25
      ButtonWidth = 84
      Caption = 'ToolBar1'
      Flat = True
      Images = frmGetPeriod.ilImages
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
    Images = frmGetPeriod.ilImages
    Left = 325
    Top = 12
    object acApply: TAction
      Caption = 'Применить'
      Hint = 'Применить'
      ImageIndex = 0
      ShortCut = 13
      OnExecute = acApplyExecute
    end
    object acCancel: TAction
      Caption = 'Отмена'
      Hint = 'Отмена'
      ImageIndex = 1
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
end
