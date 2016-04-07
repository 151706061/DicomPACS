object ShadingForm: TShadingForm
  Left = 343
  Top = 233
  BorderStyle = bsDialog
  Caption = 'Shading'
  ClientHeight = 172
  ClientWidth = 294
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
    Left = 7
    Top = 8
    Width = 281
    Height = 129
    TabOrder = 0
    object Label1: TLabel
      Left = 18
      Top = 12
      Width = 121
      Height = 18
      Caption = 'Ambient Coefficent:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Book Antiqua'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 25
      Top = 41
      Width = 114
      Height = 18
      Caption = 'Diffuse Coefficent:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Book Antiqua'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 18
      Top = 70
      Width = 121
      Height = 18
      Caption = 'Specular Coefficent:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Book Antiqua'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 42
      Top = 99
      Width = 97
      Height = 18
      Caption = 'Specular Power:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Book Antiqua'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxTextEdit1: TcxTextEdit
      Left = 145
      Top = 9
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Book Antiqua'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.SkinName = 'Black'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 0
      Width = 121
    end
    object cxTextEdit2: TcxTextEdit
      Left = 145
      Top = 38
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Book Antiqua'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.SkinName = 'Black'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 1
      Width = 121
    end
    object cxTextEdit3: TcxTextEdit
      Left = 145
      Top = 67
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Book Antiqua'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.SkinName = 'Black'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 2
      Width = 121
    end
    object cxTextEdit4: TcxTextEdit
      Left = 145
      Top = 96
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Book Antiqua'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.SkinName = 'Black'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 3
      Width = 121
    end
  end
  object bOK: TcxButton
    Left = 131
    Top = 143
    Width = 75
    Height = 25
    Action = aSave
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Black'
  end
  object bCancel: TcxButton
    Left = 213
    Top = 143
    Width = 75
    Height = 25
    Action = aCancel
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Black'
  end
  object al: TActionList
    Left = 56
    Top = 144
    object aSave: TAction
      Caption = 'OK'
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1047#1072#1082#1088#1099#1090#1100', '#1085#1077' '#1089#1086#1093#1088#1072#1085#1103#1103
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
