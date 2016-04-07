object frmModuleInfo: TfrmModuleInfo
  Left = 319
  Top = 117
  BorderStyle = bsDialog
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
  ClientHeight = 179
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 132
    Width = 369
    Height = 44
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitTop = 183
    ExplicitHeight = 50
    object bClose: TcxButton
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Action = aClose
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object cxVerticalGrid1: TcxVerticalGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 369
    Height = 126
    Align = alTop
    TabOrder = 1
    object catMain: TcxCategoryRow
      Options.Focusing = False
      Options.Moving = False
      Options.TabStop = False
      Properties.Caption = #1057#1083#1091#1078#1073#1072' '#1090#1072#1082#1089#1080
      Properties.HeaderAlignmentHorz = taCenter
    end
    object rowModule: TcxEditorRow
      Options.Focusing = False
      Options.Moving = False
      Options.TabStop = False
      Properties.Caption = #1052#1086#1076#1091#1083#1100
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = #1040#1056#1052' "'#1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088'"'
    end
    object rowVersion: TcxEditorRow
      Options.Focusing = False
      Options.Moving = False
      Options.TabStop = False
      Properties.Caption = #1042#1077#1088#1089#1080#1103
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
    end
    object rowDeveloper: TcxEditorRow
      Options.Focusing = False
      Options.Moving = False
      Options.TabStop = False
      Properties.Caption = #1056#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = #1055#1088#1080#1093#1086#1076#1100#1082#1086' '#1053'.'#1053'.'
    end
  end
  object al: TActionList
    Left = 264
    Top = 80
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ShortCut = 27
      OnExecute = aCloseExecute
    end
  end
end
