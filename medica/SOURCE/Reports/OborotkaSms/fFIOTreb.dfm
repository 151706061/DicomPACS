object frmFIOTreb: TfrmFIOTreb
  Left = 295
  Top = 195
  Width = 398
  Height = 166
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Ввод данных о составителе'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 390
    Height = 139
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object lbFam: TLabel
      Left = 19
      Top = 55
      Width = 52
      Height = 13
      Caption = 'Фамилия:'
    end
    object lbJobTitle: TLabel
      Left = 16
      Top = 87
      Width = 61
      Height = 13
      Caption = 'Должность:'
    end
    object edFam: TEdit
      Left = 86
      Top = 51
      Width = 290
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object CoolBar1: TCoolBar
      Left = 2
      Top = 2
      Width = 386
      Height = 29
      AutoSize = True
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 382
        end>
      object ToolBar1: TToolBar
        Left = 9
        Top = 0
        Width = 369
        Height = 25
        ButtonWidth = 84
        Caption = 'ToolBar1'
        Flat = True
        Images = frmGetPeriod.ilImages
        List = True
        ShowCaptions = True
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
    object edJobTitle: TEdit
      Left = 86
      Top = 83
      Width = 290
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object cbDontShow: TCheckBox
      Left = 16
      Top = 115
      Width = 177
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Не выводить больше это окно'
      TabOrder = 3
    end
  end
  object alActions: TActionList
    Images = frmGetPeriod.ilImages
    Left = 341
    Top = 14
    object acApply: TAction
      Caption = 'Применить'
      ImageIndex = 0
      ShortCut = 13
      OnExecute = acApplyExecute
    end
    object acCancel: TAction
      Caption = 'Отменить'
      ImageIndex = 1
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
end
