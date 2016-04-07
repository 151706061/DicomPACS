object fNarcoticActReport: TfNarcoticActReport
  Left = 0
  Top = 0
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1072#1082#1090#1072' '#1053#1057' '#1080' '#1055#1042
  ClientHeight = 137
  ClientWidth = 443
  Color = clBtnFace
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cbCommon: TCoolBar
    Left = 0
    Top = 0
    Width = 443
    Height = 26
    AutoSize = True
    Bands = <
      item
        Control = tbCommon
        ImageIndex = -1
        MinHeight = 22
        Width = 437
      end>
    Images = dmMain.ilMain
    object tbCommon: TToolBar
      Left = 9
      Top = 0
      Width = 430
      Height = 22
      AutoSize = True
      ButtonWidth = 65
      Caption = 'tbCommon'
      Images = dmMain.ilMain
      List = True
      ShowCaptions = True
      TabOrder = 0
      Wrapable = False
      object btnOk: TToolButton
        Left = 0
        Top = 0
        Action = acOk
        AutoSize = True
      end
      object sepOk: TToolButton
        Left = 46
        Top = 0
        Width = 8
        Caption = 'sepOk'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object btnCancel: TToolButton
        Left = 54
        Top = 0
        Action = acCancel
        AutoSize = True
      end
    end
  end
  object grdParams: TcxVerticalGrid
    Left = 0
    Top = 26
    Width = 443
    Height = 111
    Align = alClient
    OptionsView.CellAutoHeight = True
    OptionsView.RowHeaderWidth = 137
    OptionsBehavior.HeaderSizing = False
    TabOrder = 1
    object grdParamsActNumber: TcxEditorRow
      Properties.Caption = #1040#1082#1090' '#8470
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.EditProperties.MaxLength = 15
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = ''
    end
    object grdParamsPredsedatel: TcxEditorRow
      Properties.Caption = #1055#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1100
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.EditProperties.MaxLength = 100
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = ''
    end
    object grdParamsCommission1: TcxEditorRow
      Properties.Caption = #1063#1083#1077#1085' '#1082#1086#1084#1080#1089#1089#1080#1080' 1'
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.EditProperties.MaxLength = 150
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = ''
    end
    object grdParamsCommission2: TcxEditorRow
      Properties.Caption = #1063#1083#1077#1085' '#1082#1086#1084#1080#1089#1089#1080#1080' 2'
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.EditProperties.MaxLength = 150
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
    end
    object grdParamsPack: TcxEditorRow
      Properties.Caption = #1059#1087#1072#1082#1086#1074#1082#1072
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.EditProperties.MaxLength = 300
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = ''
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 168
    Top = 65520
    object acOk: TAction
      Caption = #1054#1050
      ImageIndex = 9
      OnExecute = acOkExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 8
      OnExecute = acCancelExecute
    end
  end
end
