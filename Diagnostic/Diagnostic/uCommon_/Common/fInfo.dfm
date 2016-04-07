object frmInfo: TfrmInfo
  Left = 267
  Top = 198
  BorderStyle = bsDialog
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1079#1072#1082#1072#1079#1077
  ClientHeight = 305
  ClientWidth = 838
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 832
    Height = 254
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object cxVerticalGrid1: TcxVerticalGrid
      AlignWithMargins = True
      Left = 544
      Top = 0
      Width = 288
      Height = 254
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      OptionsView.RowHeaderWidth = 144
      TabOrder = 0
      ExplicitHeight = 230
      object catDop: TcxCategoryRow
        Options.Focusing = False
        Options.Moving = False
        Options.TabStop = False
        Properties.Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      end
      object rowDopTime: TcxEditorRow
        Properties.Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = Null
      end
      object rowStopDrv: TcxEditorRow
        Properties.Caption = #1054#1089#1090#1072#1085#1086#1074#1082#1080' '#1074#1086#1076#1080#1090#1077#1083#1100
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = Null
      end
      object rowStopClt: TcxEditorRow
        Properties.Caption = #1054#1089#1090#1072#1085#1086#1074#1082#1080' '#1082#1083#1080#1077#1085#1090
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = Null
      end
      object rowBag: TcxEditorRow
        Properties.Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1089' '#1073#1072#1075#1072#1078#1086#1084
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = Null
      end
      object rowKm: TcxEditorRow
        Properties.Caption = #1050#1080#1083#1086#1084#1077#1090#1088#1072#1078
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = Null
      end
      object catSpecial: TcxCategoryRow
        Options.Focusing = False
        Options.Moving = False
        Options.TabStop = False
        Properties.Caption = #1054#1089#1086#1073#1099#1077' '#1086#1090#1084#1077#1090#1082#1080
      end
      object rowFree: TcxEditorRow
        Properties.Caption = #1057#1074#1086#1073#1086#1076#1085#1099#1081' '#1079#1072#1082#1072#1079
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = #1044#1040
        Styles.Header = stBold
        Styles.Content = stBold
      end
      object rowPeregon: TcxEditorRow
        Properties.Caption = #1055#1077#1088#1077#1075#1086#1085
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = #1044#1040
        Styles.Header = stBold
        Styles.Content = stBold
      end
      object rowNeopl: TcxEditorRow
        Properties.Caption = #1053#1077#1086#1087#1083#1072#1090#1072
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = #1044#1040'!'
        Styles.Header = stNeopl
        Styles.Content = stNeopl
      end
    end
    object cxVerticalGrid2: TcxVerticalGrid
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 541
      Height = 254
      Margins.Left = 0
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alClient
      OptionsView.RowHeaderWidth = 130
      TabOrder = 1
      ExplicitHeight = 230
      object catMain: TcxCategoryRow
        Options.Focusing = False
        Options.Moving = False
        Options.TabStop = False
        Properties.Caption = #1043#1083#1072#1074#1085#1086#1077
      end
      object rowDate: TcxEditorRow
        Properties.Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = Null
      end
      object rowNumTel: TcxEditorRow
        Properties.Caption = #8470' '#1090#1077#1083#1077#1092#1086#1085#1072
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = Null
      end
      object rowAdr1: TcxEditorRow
        Properties.Caption = #1040#1076#1088#1077#1089' '#1082#1083#1080#1077#1085#1090#1072
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = Null
      end
      object rowAdr2: TcxEditorRow
        Properties.Caption = #1040#1076#1088#1077#1089' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = Null
      end
      object rowSetDrv: TcxEditorRow
        Properties.Caption = #1042#1088#1077#1084#1103' '#1074#1099#1073#1086#1088#1072' '#1084#1072#1096#1080#1085#1099
        Properties.DataBinding.ValueType = 'String'
        Properties.Value = Null
      end
      object rowNum: TcxEditorRow
        Properties.Caption = #1055#1086#1079#1099#1074#1085#1086#1081
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = Null
      end
      object rowFics: TcxEditorRow
        Properties.Caption = #1060#1080#1082#1089#1072#1094#1080#1103' '#1074
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = Null
      end
      object rowTimeTrip: TcxEditorRow
        Properties.Caption = #1042' '#1087#1091#1090#1080
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = Null
      end
      object rowCalc: TcxEditorRow
        Properties.Caption = #1056#1072#1089#1095#1077#1090' '#1074
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = Null
      end
      object rowFact: TcxEditorRow
        Properties.Caption = #1060#1072#1082#1090'. '#1086#1087#1083#1072#1090#1072
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = Null
      end
      object rowFactMG: TcxEditorRow
        Properties.Caption = #1060#1072#1082#1090'. '#1086#1087#1083#1072#1090#1072' '#1087#1086' '#1084'/'#1075
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = Null
      end
      object rowSum: TcxEditorRow
        Properties.Caption = #1057#1091#1084#1084#1072
        Properties.DataBinding.ValueType = 'String'
        Properties.Options.Editing = False
        Properties.Value = Null
        Styles.Header = stSum
        Styles.Content = stSum
      end
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 260
    Width = 832
    Height = 42
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitTop = 236
    ExplicitHeight = 49
    object bClose: TcxButton
      Left = 744
      Top = 9
      Width = 75
      Height = 25
      Action = aClose
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 451
    Top = 163
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
      ShortCut = 27
      OnExecute = aCloseExecute
    end
  end
  object stRep: TcxStyleRepository
    Left = 363
    Top = 195
    PixelsPerInch = 96
    object stSum: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object stNeopl: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object stBold: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
end
