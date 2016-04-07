object frmAdr1: TfrmAdr1
  Left = 284
  Top = 98
  BorderStyle = bsNone
  Caption = #1040#1076#1088#1077#1089' '#1082#1083#1080#1077#1085#1090#1072
  ClientHeight = 486
  ClientWidth = 553
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 553
    Height = 486
    Margins.Top = 0
    Align = alClient
    Pen.Color = clTeal
    Pen.Width = 3
    ExplicitWidth = 676
    ExplicitHeight = 597
  end
  object Shape2: TShape
    Left = 22
    Top = 247
    Width = 400
    Height = 162
    Pen.Color = clMoneyGreen
    Pen.Width = 2
  end
  object Shape3: TShape
    Left = 428
    Top = 246
    Width = 111
    Height = 162
    Pen.Color = clMoneyGreen
    Pen.Width = 2
  end
  object cxLabel1: TcxLabel
    Left = 25
    Top = 15
    Caption = #1040#1076#1088#1077#1089' '#1082#1083#1080#1077#1085#1090#1072
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.TextColor = clTeal
    Style.IsFontAssigned = True
    Transparent = True
  end
  object teAdr: TcxTextEdit
    Left = 156
    Top = 15
    ParentFont = False
    Properties.MaxLength = 25
    Style.BorderColor = clTeal
    Style.BorderStyle = ebsThick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.TextColor = clNavy
    Style.IsFontAssigned = True
    TabOrder = 1
    Width = 344
  end
  object grAdr: TcxGrid
    Left = 25
    Top = 47
    Width = 514
    Height = 194
    TabOrder = 2
    LookAndFeel.SkinName = 'Caramel'
    object TVADR: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = TVADRCellClick
      OnGetCellHeight = TVADRGetCellHeight
      DataController.DataSource = dsAdr
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      OptionsView.Indicator = True
      object VADR_NAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Vert = taVCenter
        Options.Editing = False
        Width = 453
      end
      object VADR_PREFIX: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'FC_PREFIX'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Options.Editing = False
        Width = 161
      end
    end
    object grAdrLevel1: TcxGridLevel
      GridView = TVADR
    end
  end
  object cxButton39: TcxButton
    Left = 33
    Top = 271
    Width = 33
    Height = 33
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton40: TcxButton
    Left = 65
    Top = 271
    Width = 33
    Height = 33
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton51: TcxButton
    Left = 97
    Top = 271
    Width = 33
    Height = 33
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton52: TcxButton
    Left = 129
    Top = 271
    Width = 33
    Height = 33
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton53: TcxButton
    Left = 161
    Top = 271
    Width = 33
    Height = 33
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton54: TcxButton
    Left = 193
    Top = 271
    Width = 33
    Height = 33
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton55: TcxButton
    Left = 225
    Top = 271
    Width = 33
    Height = 33
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton56: TcxButton
    Left = 257
    Top = 271
    Width = 33
    Height = 33
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton57: TcxButton
    Left = 289
    Top = 271
    Width = 33
    Height = 33
    Caption = '9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton58: TcxButton
    Left = 321
    Top = 271
    Width = 33
    Height = 33
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton33: TcxButton
    Left = 353
    Top = 271
    Width = 33
    Height = 33
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton1: TcxButton
    Left = 33
    Top = 303
    Width = 33
    Height = 33
    Caption = #1049
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton2: TcxButton
    Left = 65
    Top = 303
    Width = 33
    Height = 33
    Caption = #1062
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton3: TcxButton
    Left = 97
    Top = 303
    Width = 33
    Height = 33
    Caption = #1059
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton4: TcxButton
    Left = 129
    Top = 303
    Width = 33
    Height = 33
    Caption = #1050
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton6: TcxButton
    Left = 161
    Top = 303
    Width = 33
    Height = 33
    Caption = #1045
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton5: TcxButton
    Left = 193
    Top = 303
    Width = 33
    Height = 33
    Caption = #1053
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 19
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton7: TcxButton
    Left = 225
    Top = 303
    Width = 33
    Height = 33
    Caption = #1043
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = ''
  end
  object cxButton8: TcxButton
    Left = 257
    Top = 303
    Width = 33
    Height = 33
    Caption = #1064
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 21
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton9: TcxButton
    Left = 289
    Top = 303
    Width = 33
    Height = 33
    Caption = #1065
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 22
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton10: TcxButton
    Left = 321
    Top = 303
    Width = 33
    Height = 33
    Caption = #1047
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 23
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton11: TcxButton
    Left = 353
    Top = 303
    Width = 33
    Height = 33
    Caption = #1061
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 24
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton12: TcxButton
    Left = 385
    Top = 303
    Width = 33
    Height = 33
    Caption = #1066
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 25
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton13: TcxButton
    Left = 33
    Top = 335
    Width = 33
    Height = 33
    Caption = #1060
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 26
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton14: TcxButton
    Left = 65
    Top = 335
    Width = 33
    Height = 33
    Caption = #1067
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 27
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton15: TcxButton
    Left = 97
    Top = 335
    Width = 33
    Height = 33
    Caption = #1042
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 28
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton16: TcxButton
    Left = 129
    Top = 335
    Width = 33
    Height = 33
    Caption = #1040
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 29
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton17: TcxButton
    Left = 161
    Top = 335
    Width = 33
    Height = 33
    Caption = #1055
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 30
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton18: TcxButton
    Left = 193
    Top = 335
    Width = 33
    Height = 33
    Caption = #1056
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 31
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton19: TcxButton
    Left = 225
    Top = 335
    Width = 33
    Height = 33
    Caption = #1054
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 32
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton20: TcxButton
    Left = 257
    Top = 335
    Width = 33
    Height = 33
    Caption = #1051
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 33
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton21: TcxButton
    Left = 289
    Top = 335
    Width = 33
    Height = 33
    Caption = #1044
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 34
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton22: TcxButton
    Left = 321
    Top = 335
    Width = 33
    Height = 33
    Caption = #1046
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 35
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton23: TcxButton
    Left = 353
    Top = 335
    Width = 33
    Height = 33
    Caption = #1069
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 36
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton35: TcxButton
    Left = 385
    Top = 335
    Width = 33
    Height = 33
    Caption = '/'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 37
    OnClick = cxButton35Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton24: TcxButton
    Left = 33
    Top = 367
    Width = 33
    Height = 33
    Caption = #1071
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 38
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton25: TcxButton
    Left = 65
    Top = 367
    Width = 33
    Height = 33
    Caption = #1063
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 39
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton26: TcxButton
    Left = 97
    Top = 367
    Width = 33
    Height = 33
    Caption = #1057
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 40
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton27: TcxButton
    Left = 129
    Top = 367
    Width = 33
    Height = 33
    Caption = #1052
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 41
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton28: TcxButton
    Left = 161
    Top = 367
    Width = 33
    Height = 33
    Caption = #1048
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 42
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton29: TcxButton
    Left = 193
    Top = 367
    Width = 33
    Height = 33
    Caption = #1058
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 43
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton32: TcxButton
    Left = 225
    Top = 367
    Width = 33
    Height = 33
    Caption = #1068
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 44
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton31: TcxButton
    Left = 257
    Top = 367
    Width = 33
    Height = 33
    Caption = #1041
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 45
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton30: TcxButton
    Left = 289
    Top = 367
    Width = 33
    Height = 33
    Caption = #1070
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 46
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton37: TcxButton
    Left = 321
    Top = 367
    Width = 33
    Height = 33
    Caption = ','
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 47
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton38: TcxButton
    Left = 353
    Top = 367
    Width = 33
    Height = 33
    Caption = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 48
    OnClick = cxButton1Click
    Colors.Default = clCream
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton34: TcxButton
    Left = 385
    Top = 367
    Width = 33
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 49
    OnClick = cxButton34Click
    Colors.Default = clCream
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000F00A0000F00A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000007CB1006397
      00639700609600629300659300639200669B005B880000000000000000000000
      000000000000000000000000000000000072CE0080B9007DB8007AB50076B000
      78AE0075A5007DA70086AC008EB10091B3007E9B00758D006A8B00659B0071B2
      0000000000000000000000000000000000000000000000000074A7007FAA0083
      AC008BB10097BC009EC400B2DD00ABD500B4E000B5E200B1DC00A5CD0098BF00
      94B600728D0066990075BC000000000000000000000000000000000000000000
      0084BD0098C900A3C900B7E400B0DC00BEEE00B5E200BCEB00CBFD00B8E700C5
      F600B7E400A8D20096BC008EB2007A9B00699F00A19600000000000000000000
      00000000000000000000000085BE00BDEC00BFEF00BDED00C2F200B2E000D0FF
      00BDEC00D0FF00BEEE00BDED00ADD900A4CE008EB40087A9006F960077BB0000
      000000000000000000000000000000000000000094D8009FD300C2F100BFEE00
      BFEE00CCFF00BFEE00C8FB00C6F800C0F200C2F500B1E100A0CC0093BB0086A7
      007592007AB40000000000000000000000000000000000000000000000000089
      C200C7F900C6F700C4F600C1F300C2F300C4F700C0F300C3F600BDEF00B3E200
      A0CB008CB3007BA30070A01778A18A898A000000000000000000000000000000
      000000000000009EDA00A4D900C6F700C2F200C0F300C1F400BEF200BFF000BE
      F100BCEE00A5D40088BA0078AB4787A48A8D918D837F7B7E7C919C9C00000000
      00000000000000000000000000000000000092CD00C3F600C0F300BEEF00BDF0
      00BAEC00B4E500A7DB008AC31E84AE7597A6B2A49EA7A19D999E9E8791957254
      5564060600000000000000000000000000000000000000000000A4E500A9DD00
      BFF100B8EA00B0E20099CF0088BD4D94B4A9ACAFBFB1ABB0AFAEA7B0B39A989A
      7F4745770D009525006F07000000000000000000000000000000000000000000
      00000000009ED700A7DA0094CB1D91BE85AEC0D2C3BDC8C0BDBABEBFB2BDC49C
      807B8230218B1900A63A00AF4700B04A00771000000000000000000000000000
      00000000000000000000000000ACF64193AFAAB2B7E5D5CFD2CFCFC5CED4B8B9
      BE9A66578D2300A23200BA5000B95200B44E00B44E009D3800700D0000000000
      0000000000000000000000000000000000000000000000A89E9AACAEB0C9D6DF
      B9A29B9C4D2CA02C00BA4D00C75F00C15B00BC5600BA5400B953009A31008617
      00920000000000000000000000000000000000000000000000000000000000A8
      AFB2A06F52A43A00B74600CF6400CF6600CA6300C65E00C35D00C05A00BD5700
      9026009B1F000000000000000000000000000000000000000000000000000000
      00000000000000000000BA4500CE6900F2B96FE8A95FE0923CDD8E37DA8732CD
      7012C861009C3600931F00000000000000000000000000000000000000000000
      000000000000000000000000000000000000D50000B94A00B64C00BC5905B74F
      00B54300A63C00C3610BCF6801AD47009E2A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      D04100B94A00B73A00000000A24100A83F00D36E02CF6800A53C00AD2D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000AE3C00D76F00D87F21
      D67B18A33A00B031000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000B5
      4000CF6800BD5600D3720BD16C02A73500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000B44C00C36100B14B00AB4400D46F03AF4700A7360000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF0000AA4D00DA7400B95300DE7800B046
      00B63B0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BE4E00AB4500
      B54F00AE4600B140000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object cxButton41: TcxButton
    Left = 435
    Top = 271
    Width = 33
    Height = 33
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 50
    OnClick = cxButton50Click
    Colors.Default = clCream
    LookAndFeel.SkinName = ''
  end
  object cxButton42: TcxButton
    Left = 467
    Top = 271
    Width = 33
    Height = 33
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 51
    OnClick = cxButton50Click
    Colors.Default = clCream
    LookAndFeel.SkinName = ''
  end
  object cxButton43: TcxButton
    Left = 499
    Top = 271
    Width = 33
    Height = 33
    Caption = '9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 52
    OnClick = cxButton50Click
    Colors.Default = clCream
    LookAndFeel.SkinName = ''
  end
  object cxButton44: TcxButton
    Left = 435
    Top = 303
    Width = 33
    Height = 33
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 53
    OnClick = cxButton50Click
    Colors.Default = clCream
    LookAndFeel.SkinName = ''
  end
  object cxButton45: TcxButton
    Left = 467
    Top = 303
    Width = 33
    Height = 33
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 54
    OnClick = cxButton50Click
    Colors.Default = clCream
    LookAndFeel.SkinName = ''
  end
  object cxButton46: TcxButton
    Left = 499
    Top = 303
    Width = 33
    Height = 33
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 55
    OnClick = cxButton50Click
    Colors.Default = clCream
    LookAndFeel.SkinName = ''
  end
  object cxButton47: TcxButton
    Left = 435
    Top = 335
    Width = 33
    Height = 33
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 56
    OnClick = cxButton50Click
    Colors.Default = clCream
    LookAndFeel.SkinName = ''
  end
  object cxButton48: TcxButton
    Left = 467
    Top = 335
    Width = 33
    Height = 33
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 57
    OnClick = cxButton50Click
    Colors.Default = clCream
    LookAndFeel.SkinName = ''
  end
  object cxButton49: TcxButton
    Left = 499
    Top = 335
    Width = 33
    Height = 33
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 58
    OnClick = cxButton50Click
    Colors.Default = clCream
    LookAndFeel.SkinName = ''
  end
  object cxButton50: TcxButton
    Left = 435
    Top = 367
    Width = 33
    Height = 33
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 59
    OnClick = cxButton50Click
    Colors.Default = clCream
    LookAndFeel.SkinName = ''
  end
  object cxButton60: TcxButton
    Left = 467
    Top = 367
    Width = 33
    Height = 33
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 60
    OnClick = cxButton50Click
    Colors.Default = clCream
    LookAndFeel.SkinName = ''
  end
  object cxButton36: TcxButton
    Left = 499
    Top = 367
    Width = 33
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 61
    OnClick = cxButton36Click
    Colors.Default = clCream
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000F00A0000F00A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000007CB1006397
      00639700609600629300659300639200669B005B880000000000000000000000
      000000000000000000000000000000000072CE0080B9007DB8007AB50076B000
      78AE0075A5007DA70086AC008EB10091B3007E9B00758D006A8B00659B0071B2
      0000000000000000000000000000000000000000000000000074A7007FAA0083
      AC008BB10097BC009EC400B2DD00ABD500B4E000B5E200B1DC00A5CD0098BF00
      94B600728D0066990075BC000000000000000000000000000000000000000000
      0084BD0098C900A3C900B7E400B0DC00BEEE00B5E200BCEB00CBFD00B8E700C5
      F600B7E400A8D20096BC008EB2007A9B00699F00A19600000000000000000000
      00000000000000000000000085BE00BDEC00BFEF00BDED00C2F200B2E000D0FF
      00BDEC00D0FF00BEEE00BDED00ADD900A4CE008EB40087A9006F960077BB0000
      000000000000000000000000000000000000000094D8009FD300C2F100BFEE00
      BFEE00CCFF00BFEE00C8FB00C6F800C0F200C2F500B1E100A0CC0093BB0086A7
      007592007AB40000000000000000000000000000000000000000000000000089
      C200C7F900C6F700C4F600C1F300C2F300C4F700C0F300C3F600BDEF00B3E200
      A0CB008CB3007BA30070A01778A18A898A000000000000000000000000000000
      000000000000009EDA00A4D900C6F700C2F200C0F300C1F400BEF200BFF000BE
      F100BCEE00A5D40088BA0078AB4787A48A8D918D837F7B7E7C919C9C00000000
      00000000000000000000000000000000000092CD00C3F600C0F300BEEF00BDF0
      00BAEC00B4E500A7DB008AC31E84AE7597A6B2A49EA7A19D999E9E8791957254
      5564060600000000000000000000000000000000000000000000A4E500A9DD00
      BFF100B8EA00B0E20099CF0088BD4D94B4A9ACAFBFB1ABB0AFAEA7B0B39A989A
      7F4745770D009525006F07000000000000000000000000000000000000000000
      00000000009ED700A7DA0094CB1D91BE85AEC0D2C3BDC8C0BDBABEBFB2BDC49C
      807B8230218B1900A63A00AF4700B04A00771000000000000000000000000000
      00000000000000000000000000ACF64193AFAAB2B7E5D5CFD2CFCFC5CED4B8B9
      BE9A66578D2300A23200BA5000B95200B44E00B44E009D3800700D0000000000
      0000000000000000000000000000000000000000000000A89E9AACAEB0C9D6DF
      B9A29B9C4D2CA02C00BA4D00C75F00C15B00BC5600BA5400B953009A31008617
      00920000000000000000000000000000000000000000000000000000000000A8
      AFB2A06F52A43A00B74600CF6400CF6600CA6300C65E00C35D00C05A00BD5700
      9026009B1F000000000000000000000000000000000000000000000000000000
      00000000000000000000BA4500CE6900F2B96FE8A95FE0923CDD8E37DA8732CD
      7012C861009C3600931F00000000000000000000000000000000000000000000
      000000000000000000000000000000000000D50000B94A00B64C00BC5905B74F
      00B54300A63C00C3610BCF6801AD47009E2A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      D04100B94A00B73A00000000A24100A83F00D36E02CF6800A53C00AD2D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000AE3C00D76F00D87F21
      D67B18A33A00B031000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000B5
      4000CF6800BD5600D3720BD16C02A73500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000B44C00C36100B14B00AB4400D46F03AF4700A7360000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF0000AA4D00DA7400B95300DE7800B046
      00B63B0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BE4E00AB4500
      B54F00AE4600B140000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    LookAndFeel.SkinName = ''
  end
  object cxLabel3: TcxLabel
    Left = 33
    Top = 249
    Caption = #1059#1083#1080#1094#1072
    Style.TextColor = clTeal
    Style.TextStyle = [fsBold]
  end
  object cxLabel4: TcxLabel
    Left = 435
    Top = 249
    Caption = #1044#1086#1084
    Style.TextColor = clTeal
    Style.TextStyle = [fsBold]
  end
  object bEnter: TcxButton
    Left = 283
    Top = 416
    Width = 126
    Height = 55
    Caption = #1054#1050
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 64
    OnClick = bOKClick
    Colors.NormalText = clTeal
    Glyph.Data = {
      361B0000424D361B000000000000360000002800000030000000300000000100
      180000000000001B0000F00A0000F00A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000007D00007700007600
      0075000075000079000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000870000770005870A0B98160B991805870B00750000810000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008800007A000D9B1B13AE2911AC26
      12AC2411AC240B98160075000081000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000087
      00007B000E9D1D14AE2A13AD2712AB2612AB2511AA2511AB250B961500750000
      8200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008C00007B000F9F1E16B02D14AD2B13AC2913AC28
      12AB2612AB2511AA2412AD250B96150076000084000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000008C00007C000FA0
      2017B13015AE2C15AE2B14AD2A14AD2913AC2812AB2712AB2611AA2412AD250B
      9716007600008200000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008D00007F0010A12218B23218B12F16AF2E15AE2D15AE2C14AD2A
      14AD2913AC2813AC2712AB2611AA2612AD260B97160076000082000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008D0000800011A22319B33618B1
      3317B03017B02F16AF2E16AF2D15AE2C14AD2B14AD2A13AC2813AC2712AB2612
      AC2512AD260B9716007600008200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      900000810012A3251BB53719B23419B23318B13217B03117B03016AF2F14AF2B
      14AE2C12AD2812AD2813AC2913AC2812AB2712AB2512AC260B97160076000082
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000910000810013A5271DB63B1AB3361AB33519B2
      3419B23318B13218B1311BB23449C15D7BD28975CF834CC15E14AE2A13AD2813
      AC2813AC2712AB2712AC270B9716007600008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000910000840014
      A6281EB73D1DB6391BB4381AB3371AB33619B23519B23318B1321EB33715B12F
      1CB33662CA717DD28B6BCB7919B02F13AD2813AC2813AC2712AB2613AE270B97
      1700760000840000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000930000850015A72A20B9401DB63D1CB53B1CB5391BB4381BB4
      371AB33619B2351AB33517B031099213058B0C0EA52353C5657CD38A6DCC7B19
      B02F13AD2913AC2913AC2712AB2613AE270B9717007600008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000970000850015A92C21BA421E
      B73E1EB73D1DB63C1DB63B1CB53A1BB4391BB4371BB43719B234038606007E00
      008400007E000DA42250C4637ED38A6DCC7B18B02F13AD2914AD2913AC2812AB
      2813AE280A971700760000820000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00970000890015AA2C21BB4521BA421FB8401EB73F1EB73E1DB63C1DB63B1CB5
      3A1DB63A1AB336038707008100007F00000000008A00007F000EA3224FC4637E
      D38B6BCC7A17B02D13AD2914AD2913AC2813AD2713AE280A9717007600008200
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000910000890016AB2E35C35621BA4320B94220
      B9411FB8401FB83F1EB73E1DB63D1EB73D1BB338038906008200008D00000000
      000000000000008D00007F000EA3224FC4637ED38B6ACC7A18B02F13AD2B14AD
      2A13AC2813AD2713AE280A971700760000840000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008B00
      10A42451CC704CC86920BB4321BA4420B94320B9421FB8401FB83F1FB83F1DB6
      3C038A06008300008D00000000000000000000000000000000008D00007F000D
      A22151C6647ED38B6ACC7A18B02F14AE2A14AD2A13AC2913AC2913AE280A9718
      0075000084000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008A0014AB2E6FD58970D3871DBB4222BB4521
      BA4421BA4320B94221BA421EB73E048B07008500009C00000000000000000000
      000000000000000000000000008D00007E000DA22151C6647ED38C6CCC7A18B0
      2E15AE2B14AD2A14AD2913AC2813AD290C981800770000820000000000000000
      0000000000000000000000000000000000000000000000000000000000008C00
      0799134FCC708FDDA252CA6F1DBB4321BB4621BA4422BB441FB741048C070086
      00007E0000000000000000000000000000000000000000000000000000000000
      8C00007E000DA2214DC5627ED38C6CCC7B17B02D15AE2C14AD2B14AD2913AC28
      14AF290C98180077000084000000000000000000000000000000000000000000
      00000000000000000000000000009400008C0014AC2F69D38590DDA366D18031
      C0532ABF4D20B842048E08008600009C00000000000000000000000000000000
      000000000000000000000000000000000000008B00007E000DA2214DC4627FD4
      8C69CC7917B02F15AE2C14AD2B14AD2A13AC2A14AF290C981800770000840000
      0000000000000000000000000000000000000000000000000000000000000000
      009B00008C0015AC2F59D07A8DDDA28EDEA242C461028E06008900009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008B00007E000DA2224DC4627FD48E69CC7917B02E15AE2C15AE2B
      14AD2A14AE2A14AF2A0C98180077000084000000000000000000000000000000
      00000000000000000000000000000000000000009C00008C000799131EB23A22
      B842029106008B00008C00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000008D00007E000EA4
      224EC4637FD48E69CC7A17B02E14AE2D15AE2C14AD2A14AE2914AF2A0C981800
      7700008400000000000000000000000000000000000000000000000000000000
      000000000000009E00009300008C00008B00009300008D000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008D00007F000EA3224EC66381D48E69CC7A17B130
      16AF2D15AE2C14AD2B14AD2B14AF2A0C98190077000085000000000000000000
      00000000000000000000000000000000000000000000000000000000008E0000
      8E00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008D
      00007E000DA2214EC66381D48F68CB7915AF2E16AF2D15AE2C15AE2B14AD2B14
      AF2B0C9819007600008500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008E00007E000DA2214EC66381D48F
      68CB7915AF2E16AF2E15AE2C15AE2B14AD2A15B02B0C99190076000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000008D00007E000DA2214FC66482D58F68CB7915B12E16AF2E15AE2D15
      AE2C14AD2A15B02B0C9919007600008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008D00007E000DA221
      4FC66482D59068CC7817B13016AF2E16AF2D15AE2C14AD2C15B02C0C99190076
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000008C00007F000DA2224CC46082D59068CC7816B13016
      AF2F16AF2D15AE2C16AF2B15B02C0C9919007600007F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C00
      0080000DA2224CC46282D59066CB7616B12E16AF2F16AF2E15AE2D16AF2B16B0
      2D09921400770000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000008D00007F000FA2224CC46282D59067
      CB7615B12F16B02E16AF2E15AE2D16B02E0D9A1B007700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000008D00007E000DA1214DC66382D5916BCD7B25B63D12AF2B1DB13416B1
      3005860A00790000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000008D00007E000DA12149
      C45F82D59083D59176D08525B73E0C991A007B00007C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C00007E000FA1222FBC4A48C35E21B73C0C9B1C007B
      00008A0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000008C0000
      7E000E9D1F11A425058B0C007C00008A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008600007F00007D00007E000082000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Caramel'
  end
  object cxButton71: TcxButton
    Left = 415
    Top = 416
    Width = 126
    Height = 55
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 65
    OnClick = bCancelClick
    Colors.NormalText = clTeal
    Glyph.Data = {
      361B0000424D361B000000000000360000002800000030000000300000000100
      180000000000001B0000120B0000120B00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B100
      00A70000A60000A70000A70000A60000B7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000A90000A700000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000BE0000AA0920C91034D30D2AC10718B10102A80000
      A80000BD00000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000B200019E00029F
      0000A50000B20000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000C20000AA0C28D518
      49F61643EE1541E5133DD71135C3081BB00101A80000B10000C3000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B300009E082CD70831CD0316AB00009F0000A60000A50000AA00
      00A7000000000000000000000000000000000000000000000000000000000000
      0000000000000000B8050CBA1A4FFF1849FB1748F71745F11644EE1641E8133C
      D41031BB0510AB0000A80000BC00000000000000000000000000000000000000
      00000000000000000000000000000000000000B500009F0A2FDE0C3BEE0B36E4
      0830D2062BBE0315AB00029D00069F00009C0000AA0000000000000000000000
      000000000000000000000000000000000000000000810000AD1234E61B4FFF1A
      4BFF194AFB1949F81849F71747F21644EE1640E31339C80B21B00000A80000B1
      0000C40000000000000000000000000000000000000000000000000000000000
      B50000A20C32E10E3DF20C3CF00B3AEC0A36E60934E00831D70831D2062ABF01
      0CA200009C0000A5000000000000000000000000000000000000000000000000
      0000000000AF0102B02155FF1E4FFF1D4EFE1B4DFE1B4CFE1A4BFB194AFA1948
      F61947F11743EA143CD30F2DB70205A80000A70000B900000000000000000000
      00000000000000000000000000B70100A40D35E6103FF30E3DF30D3CF10D3BF1
      0C39EC0B37EA0A37E70935E50731DB052ABB010BA100009D0000AF0000000000
      000000000000000000000000000000000000000000AE1126D02A5DFF2455FF22
      53FF1F50FE1D4EFE1C4EFE1C4DFF1B4CFD1A4AF71947F31946ED163FDC1134BE
      050EAA0000A80000BD0000000000000000000000000000000000BA0000A60F39
      E81242F51041F50F3FF40E3EF50D3DF40D3BF10C3AF00B3AEC0A37EB0936E507
      31D90529BA0108A00000A6000000000000000000000000000000000000000000
      0000000000B1070FBE2C59FA2F61FF295AFF2455FF2152FF1E4FFF1E4FFF1D4F
      FE1D4FFF1B4CFB1A49F61A47EF1743E31338C40714AC0000A70000BF00000000
      00000000000000BA0001A8103AE81444F71243F61141F51040F50F3FF50E3EF4
      0E3DF40D3CF40C3BF10B39F00A37EB0936E60730D70626B500019E0000B30000
      000000000000000000000000000000000000000000A20000BC0000AF1E39DF2E
      60FF2858FF2455FF2152FF2051FF2051FF1F50FF1E4FFF1D4DFC1B4BF71A49F1
      1944E7143BC8091BAE0000A90000BD0000000000BB0000A8133DEA1546F81443
      F81343F71242F71141F61040F50F3FF50F3EF40E3DF40D3CF30C3BF30B39F00A
      37E90935E3082FCE0316AA0000A7000000000000000000000000000000000000
      0000000000000000000000BA101FCA2F62FF295AFF2657FF2455FF2355FF2354
      FF2253FF2152FF2051FE1E4FFE1C4CF91C4AF31945E9153DCC0B21B00000A800
      00AF0101AB143EEC1748FA1547F91545F81444F81344F81243F71142F61040F5
      0F3FF50F3EF40E3DF40D3CF30C3BF30B39EF0A36E80834E0072BC10000A00000
      A60000000000000000000000000000000000000000000000000000BC1C38DE2F
      61FF2B5CFF2959FF2758FF2657FF2556FF2456FF2455FF2354FF2354FE2052FE
      1D4DFA1B4BF41A46EB163FD10D26BB0000A7143EEA194BFB1748F91747FA1646
      FA1546F91445F81344F81243F81142F71040F50F3FF50F3EF40E3DF30D3CF40C
      3BF20B3AEF0B37E90935DF010CAB00009F000000000000000000000000000000
      0000000000000000000000BA284EEE3263FF2E5FFF2C5CFF295AFF295AFF2859
      FF295AFF2758FF2556FF2455FF2354FF2252FF1F4FFB1C4BF51A48EC1844E419
      45EC1B4BF8194BFC194BFD1849FB1748FA1646FA1546F91445F91344F81243F7
      1142F71040F50F3FF50E3EF40D3DF30C3CF40B3CF20B3CF20729D70003A40000
      A90000000000000000000000000000000000000000000000C20000B13866FC38
      67FF3363FF3161FF2D5EFF2B5BFF2A5AFF295AFF295AFF2859FF2758FF2657FF
      2457FF2355FF2050FC1D4CF61C4AF41B4AF51B4BFB1B4BFC1A4BFD194AFC1949
      FB1748FA1647FA1546F91445F91344F81243F81142F61040F50F3FF50E3EF50D
      3DF30D3FF6051AC400009E0000B6000000000000000000000000000000000000
      0000000000000000C00000B23962F54375FF3C6CFF3767FF3464FF3161FF2D5E
      FF2B5CFF2A5BFF2A5AFF295AFF2A59FF2758FF2757FF2456FE2252FE1F4FFB1D
      4EFB1D4EFC1C4EFF1B4DFD1A4BFD1A4AFD1949FC1848FA1647FA1546F91445F9
      1344F81243F71141F61040F61041F70E3CF0030BB20000A10000BA0000000000
      0000000000000000000000000000000000000000000000008C0000C40000B321
      3AD9487AFF4172FF3B6BFF3767FF3464FF3061FF2E5FFF2C5DFF2B5CFF2A5AFF
      295AFF2859FF2759FF2556FF2356FE2353FE2051FE1E4FFF1D4FFE1C4DFE1A4B
      FD1A4AFD1949FC1748FA1647FA1546F91444F81343F91243F71243F70D36E601
      02A70000AD00009F000000000000000000000000000000000000000000000000
      0000000000000000000000000000CB0000B3080DBD3C65F34879FF406FFF3B6B
      FF3767FF3464FF3060FF2E5FFF2C5DFF2A5BFF2A5AFF295AFF2959FF2657FF24
      55FF2253FF2151FF1E50FF1D4FFE1C4DFE1B4BFD1A4AFD1949FC1748FA1647FA
      1545FA1445F81446FA0D2EDB0000A20000BA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00DC0000BE0000B22136D64A7BFF4575FF406EFF3A6AFF3666FF3262FF2F60FF
      2D5EFF2C5DFF2A5BFF295AFF2859FF2659FF2456FF2354FF2151FF1E50FF1D4F
      FE1C4DFE1A4BFD1A4AFD1A49FB1748FA1747F91549FB0A25D10000A20000BC00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000D20000B50509BB3D65
      F34B7CFF4372FF3D6CFF3868FF3464FF3061FF2E5FFF2D5EFF2B5CFF295AFF2A
      59FF2758FF2556FF2354FF2152FF1E50FF1D4FFE1B4DFD1A4BFD194BFD1749FA
      184BFB091ECA0000A60000BC0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008A0000C30000B12339D74E7FFF4576FF3F70FF3A69FF
      3565FF3162FF2F60FF2D5EFF2B5CFF2A5AFF295AFF2758FF2556FF2354FF2151
      FF1E50FE1C4DFD1B4BFD194BFB1B4DFC091AC50000A80000BD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      CB0000B40B11BF4773FA497AFF4070FF3969FF3464FF3262FF3061FF2E5FFF2B
      5CFF2A5AFF295AFF2758FF2556FF2354FF2051FE1D4DFB1B4CF91B4CF70817C2
      0000A80000C50000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000BF0000B60000B4385CEE4274FF
      3C6BFF3767FF3464FF3463FF3061FF2E5FFF2B5CFF2A5AFF295BFF2758FF2456
      FF2152FE1D4DF91C4BF30D24CC0000A80000B600000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C10000B13F6CFA4170FF3C6CFF3868FF3565FF3464FF3363FF30
      61FF2E5FFF2B5CFF2A5AFF2959FF2659FF2354FE1E4EF81B49EE163CCF0104AC
      0000B90000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C01B2ED44576FF406FFF
      3D6CFF3A6AFF3767FF3565FF3464FF3363FF3061FF2E5FFF2B5CFF295AFF2859
      FF2758FE2050FA1C4AF21842DE112EB80000AD0000C200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000D40000B5406DFA4473FF4170FF3E6EFF3B6BFF3969FF3767FF3565FF34
      64FF3263FF3061FF2D5EFF2A5BFF295AFF295AFF2556FE1E4EF81C49EF1740D3
      0B1FB00000AD0000C30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000C31929D04C7EFF4675FF4271FF
      406FFF3E6DFF3B6BFF3969FF3767FF3565FF3464FF3262FF2F60FF2D5EFF2A5B
      FF295AFF2859FE2254FD1D4CF61B47EB163CC8060FAE0000AA0000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      D60000B6426CF74A7AFF4675FF4473FF4170FF406FFF3E6DFF3B6BFF3969FF38
      68FF3767FF3666FF3364FF2F60FF2B5DFF2A5AFF2859FF2558FF2051FB1C4CF3
      1A44E51335BD0103AD0000B40000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C51019C75284FF4C7BFF4877FF4574FF
      4271FF4170FF416FFF3D6DFF3B6BFF3A6AFF3A6AFF3C6AFF3968FF3464FF2F60
      FF2A5BFF295AFF2758FF2556FF1E4EF91B4AF01840DB0F2AB30000AE0000C700
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      B6395AEB5380FF4C7BFF4A78FF4675FF4473FF4271FF406FFF3E6DFF3B6BFF39
      6AFF3E6EFF4273FF4170FF3A69FF3363FF2D5EFF2A5AFF2859FF2558FF2254FE
      1D4CF71B48EE163ECE0919B00000AF0000D10000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000C70406BE5989FF5180FF4E7CFF4B79FF4877FF
      4675FF4473FF4171FF3E6DFF3C6AFF3A6DFF1B32D9121DC84A7CFF4170FF3968
      FF3262FF2C5DFF295AFF2758FF2556FE2050FC1C4AF41A45E81438C10208AE00
      00BC000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000C72A40
      DC5989FF5280FF4F7DFF4D7BFF4A79FF4877FF4776FF4271FF406FFF3A6CFF27
      4CEC0000B20000B2121CC7497AFF406FFF3767FF3162FF2B5CFF2859FF2556FF
      2254FF1D4DFA1A49F11841DE102EB60000B00000C50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D20000BD537CFA5988FF5381FF507EFF4D7BFF4C7AFF
      4B78FF4675FF4271FF3F6FFF3766FD0001BA0000C40000C70000B6101CC7497A
      FF3E6DFF3666FF2F60FF2A5BFF2657FF2356FE2050FE1C4BF71947EE163ED209
      1CB20000B10000B8000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC131BCC6293
      FF5886FF5483FF517FFF4E7CFF4D7BFF4C79FF4877FF4372FF3F71FF0F1CCC00
      00C30000000000000000D20000B6121DC84779FF3C6CFF3464FF2D5EFF2859FF
      2455FF2352FE1D4EFC1B49F41944E91338C3040AAF0000BC0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CB3B58E7608FFF5B87FF5584FF5280FF507DFF4F7CFF
      4C79FF4675FF4273FF2748E80000B90000D20000000000000000000000D20000
      B51625CF4678FF3A69FF3162FF2B5CFF2657FF2253FF1F50FF1C4DF91948F017
      40DF0F2FB80000B10000C7000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000DC0000C0618FFF5F8E
      FF5A88FF5684FF5482FF517FFF4E7CFF4A7AFF4675FF3E6EFF0202BE0000D500
      00000000000000000000000000000000D10000B61B2ED54275FF3767FF2F5FFF
      295AFF2355FF2051FF1D4EFD1A49F61946EF143CD2091CB00000B10000D50000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000CF1923D16B9AFF608DFF5C89FF5885FF5583FF5280FF507EFF
      4979FF4578FF192BD70000C60000000000000000000000000000000000000000
      000000D60000B4223BDD3F71FF3363FF2C5DFF2657FF2152FF1E4FFF1B4CFB19
      47F31742E81237C2020AAF0000BD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000D14866E96F9EFF6693
      FF608DFF5A88FF5784FF5280FF4E7CFF4A79FF3660F50000BC0000D500000000
      00000000000000000000000000000000000000000000CE0000B5294AE83B6EFF
      3062FF2A5AFF2455FF1F50FF1C4DFE1A49F91745F1143FE00F2EB70000B10000
      BF00000000000000000000000000000000000000000000000000000000000000
      00000000000000D22937D780B0FF6E9BFF6693FF608DFF5B89FF5482FF4D7BFF
      497BFF0C14CA0000C70000000000000000000000000000000000000000000000
      000000000000000000D10000B62E54EF3768FF2D5FFF2758FF2153FF1D4EFE1B
      4CFE194AFA1846F31440E10A20BF0000B2000000000000000000000000000000
      0000000000000000000000000000000000000000000000D50000C32E3DDB7FAD
      FF729FFF6895FF618FFF5886FF4E7DFF2C4CE90000BF0000E300000000000000
      00000000000000000000000000000000000000000000000000000000CF0000B9
      325DF73264FF2A5BFF2355FF1F50FF1C4DFF1A4CFF194DFF1749FA0A20CE0000
      B300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D80000C31016CC5272EF709DFF709FFF6291FF4E7FFF
      0203C20000C90000000000000000000000000000000000000000000000000000
      000000000000000000000000000000D10305BE3363FD2F60FF2556FF2153FF1F
      53FF1845F80B21D60000B70000BE0000C1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000DA0000
      D40000CF0000C42939DA5D87FA293EDF0000BE0000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C4080FC33366FF295EFF1637E80710C50000B50000C00000CF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E30000CF0000C20000C3
      0000DB0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DB0000B80A16C9050AC20000B600
      00C40000C8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000D10000D100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000B40000B80000B70000B50000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'Caramel'
  end
  object bHome: TcxButton
    Left = 506
    Top = 11
    Width = 33
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 66
    OnClick = bHomeClick
    Glyph.Data = {
      360C0000424D360C000000000000360000002800000020000000200000000100
      180000000000000C0000F00A0000F00A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007171717B7B7BC6C6C6C5C5C5B7B7
      B7ACACACA1A1A19797978F8F8F8686867F8080837D7AB85400B25006AE4C06AC
      4707A7460AA4430A9E5023898D8F8D8D8D8F8F8F000000000000000000000000
      0000000000000000000000007474746C6C6C909090C7C7C7E5E5E5EDEDEDEBEB
      EBEAEAEAE8E8E8E7E7E7E4E4E4E3E3E3E2E2E3D9D6D3B55300D98A1CD27F18CB
      7715C56E11B95D099E4A1A9CA1A4919191909090000000000000000000000000
      0000000000000000007979796E6E6EA7A7A7C6C6C6C1C1C1E5E5E5EEEEEEEAEA
      EAE8E8E8E6E6E6E4E4E4E2E2E2DFDFDFDDDEDED9D5D1B95700E59C31E5992FE4
      9A2EE49A2CDA8A1FA85422D3D9DCB2B2B2909090000000000000000000000000
      0000000000007070707A7A7AB7B7B7BFBFBFBDBDBDBCBCBCE7E7E7F0F0F0ECEC
      ECEAEAEAE8E8E8E6E6E6E4E4E4E1E1E1DFE0E0DCD8D3BC5C00EAA540E7A13EE7
      9F3CE69E38DA8B28AB5B26CFD5D9B4B4B4909090000000000000000000000000
      0000006B6B6B8D8D8DBCBCBCB9B9B9B9B9B9BABABAB9B9B9EAEAEAF2F2F2EFEF
      EFECECECEAEAEAE8E8E8E5E5E5E3E3E3E1E2E2DDD9D5C16100D48734D17B24EA
      A549E9A445DD9233AE5F24D0D5D9B8B8B8929292000000000000000000000000
      737373979797BABABAB6B6B6B5B5B5B6B6B6B7B7B7B5B5B5EEEEEEF4F4F4F6F6
      F6F5F5F5F3F3F3F0F0F0EEEEEEE9E9E9E4E4E5DFDBD7C46700D78B3FD07926ED
      AC56EDAA53E0973CB26325D2D7DBBEBEBE919191000000000000000000000000
      717171A4A4A4B4B4B4B2B2B2B2B2B2B2B2B2B3B3B3B2B2B2F3F3F3FAFAFAA4A4
      A48080808787878D8D8D949494A6A6A6E9E9EAE1DED9C76A00F4B96CF3B668F0
      B164F0B15FE29A43B76B2AD4D9DDC3C3C3949494000000000000000000000000
      737373A3A3A3AFAFAFAEAEAEAFAFAFAFAFAFB1B1B1AFAFAFF6F6F6FDFDFD9C9C
      9CACACACBFBFBFC0C0C0BFBFBF949494EDEDEEE3E0DBCA6F00F7BC78F4B973F5
      B971F3B56AE59E4BBA6F2BD5DADFC9C9C9949494000000000000000000000000
      747474A3A3A3ACACACABABABABABABACACACADADADABABABFBFBFBFFFFFF9595
      95A7A7A7B8B8B8BCBCBCBDBDBD919191EFF0F0E6E2DCCE7200F9C486F9C182F8
      BD7DF5BB74E7A251BD732AD7DCE1CECECE969696000000000000000000000000
      767676A4A4A4A9A9A9A8A8A8A8A8A8A9A9A9ABABABA9A9A9FEFEFEFFFFFF8F8F
      8FA3A3A3B2B2B2B6B6B6B8B8B88C8C8CF3F3F4E8E4DED27900FFCD9AFECC99FC
      C88EFAC382E9A657C07A31DADFE4D4D4D4969696000000000000000000000000
      757575A3A3A3A6A6A6A4A4A4A5A6A6A6A8A9A8ABAEA8A7A8EEF0F1FFFFFF8888
      88A1A1A1B1B1B1B5B5B5B8B8B88A8A8AF5F5F6EAE5DFCF7100CF7500CD7100C9
      6E00C86A00C46500C57C2BDBE0E4D9D9D9979797000000000000000000000000
      787878A2A2A2A1A1A1A1A2A3A0A5AAA69181AC5A14AA4C00D1CCC9F5F7F87C7C
      7C6E6E6E7575757C7C7C7F7F7F828282F6F6F7EFEFF0EBEDF0EAE9EAE6E6E7E5
      E3E1E1E1DEDFDBD6DDD9D6DCDDDEDDDDDD959595000000000000000000000000
      797979A1A1A29DA1A6A1968EAD6929B95800D98B2AD17F21AC540DD4D3D2E2E3
      E5ECEDEDE9E9E9E3E3E3E0E0E0DFDFDFF4F4F4F0F0F0EDEDEDEBEBECE9EAEAE8
      E8E8E4E5E5E2E3E3E0E1E1DEDEDEE0E1E294989C93989F000000000000000000
      797D82A1A09FAD763EBB5B00D68526EBA646EAA445EBA646CD791FAE5A17D5D8
      D9F2F3F5FFFFFFFDFDFDFBFBFBF7F7F7F4F4F4F2F2F2F0F0F0EDEDEDEBEBEBE9
      E9E9E6E6E6E4E4E4E2E2E2E1E2E3E1E6EBB8752BBB5B00000000000000B47015
      976E42BE6200D3801DEAA549ECA84DEBA64DEAA64CEAA64BECA94DC9731AAF61
      22D8DBDEF3F4F5FFFFFFFBFBFBF9F9F9F6F6F6F4F4F4F2F2F2EFEFEFEDEDEDEB
      EBEBE9E9E9E6E6E6E5E6E8E3E3E3CF8B2FBD5E00C46100000000000000C46900
      D07B15E9A246EDAA51EDAA52ECAA53ECAB54ECAB56ECAA55EDA953EFAD52C76F
      17B2692FDADFE3F4F4F5FFFFFFFBFBFBF8F8F8F6F6F6F4F4F4F2F2F2EFEFEFED
      EDEDEBEBECE9ECEFE4DDD3C87613BA5B00CE6300000000000000000000D17200
      CD770FECAC54EEAC57EEAD59EEAE5CEFAF5DEFAF5DEEAE5CEEAD5AEDAB56EFAE
      56C36811B5723DDCE1E6F6F6F7FFFFFFFCFCFCF8F8F8F6F6F6F4F4F4F1F1F1EF
      F0F0EFF3F7E2D0BCC06500B85B00CA6200000000000000000000000000000000
      DB7700CE7913F0B162F1B262F1B264F1B367F1B367F1B264F0B162EFAF5EEFAE
      5AEFAE57BF620AB77C4CDEE3E9F7F7F8FFFFFFFAFAFAF8F8F8F6F6F6F5F5F6F4
      FAFFDCBB9AB95800B85900CD6000000000000000000000000000000000000000
      000000CD7600CF7D19F4B86EF4B76DF3B76EF3B76EF3B66EF2B56BF1B365EFB0
      60EFAE5BEEAD55BB5C04BB885EDFE5EAF8F8F9FDFDFDFAFAFAF9F9FAFAFFFFD1
      9F71B35100B85800C86000000000000000000000000000000000000000000000
      000000000000C47100D38221F7BF7BF5BC78F5BB77F5BA75F4B871F3B66CF1B3
      67EFB15FEEAD59ECAA51B85700BD936EE1E6EBF9FAFAFEFFFFFDFFFFC37E49B1
      4D00B65800BF5900000000000000000000000000000000000000000000000000
      000000000000000000C86C00D6882AFAC487F9C081F7BE7EF6BD79F4B973F2B5
      6BF0B263EEAE5CEDAB55EAA64AB55300C19D7FE4EBF0F8F5F3B56026B04E00B6
      5700C85200000000000000000000000000000000000000000000000000000000
      000000000000000000000000C56900D98F35FEC990FAC285F7BE7FF5BB78F3B7
      6FF1B367EFAF5EEDAB56ECA950E7A142B45200BF9676A4450CAF4E00B55700D6
      4300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000C66A00DE9540FECB95FAC388F8BF80F7BC
      77F5B86FF2B566F0B25DECAA52E8A245DC8F2FB15000B04F00BD5A00BE600000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C76D00DB8F36DC943ED6882ECF7E
      21C97314C16A09BE6101C15E00C15A00BF5A00BF5A00C75C0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000D27200CF7000D06D00CC6D
      00CC6A00C96500CC4E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    LookAndFeel.SkinName = 'Caramel'
  end
  object cxButton73: TcxButton
    Left = 385
    Top = 271
    Width = 33
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 67
    OnClick = cxButton73Click
    Colors.Default = clCream
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000F00A0000F00A00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFDD5100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFD65600BC4600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD45700C55D0ABB4400FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDA5C00C6600E000000BA44
      00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDC5F00CB6511
      000000000000B84200FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1
      6200CF6C16000000000000000000B54200FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFE66000D4731B000000000000000000000000B44A07B35B10B1570FAF
      540CAD5109AB4E08A84B05A74903A848019D3800FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFE96700D778210000000000000000000000000000000000
      000000000000000000000000000000000000000000000000009E3B00FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFEE6B00DB7E28000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      009E3901FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF16B00E1872F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000009B3900FFFFFFFFFFFFFFFFFFFFFFFFE16B00EB96410000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000009D3B00FFFFFFFFFFFFFFFFFFFFFFFF
      E56E00ED9A490000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000A03D00FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF46D00E68E37000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00A64001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF6A00E38A2F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000A84302FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFED6A00E1842A00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000AA4203FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFED6600DE8125000000000000000000000000BE53
      0DC46016C35E13C25C11C05A10BE570DBC540BBB5309BB550BA74100FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEB6500DB7A21000000
      000000000000B44000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFEA6500D8781D000000000000BB4400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFE96300D6751E000000BE4600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE76600D6751DC049
      00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFE86900C24C00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFF46F00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = ''
  end
  object odsAdr: TOracleDataSet
    SQL.Strings = (
      'select s.fk_id, s.fc_name, '
      '       upper(fc_name) as fc_name_up, s.fc_preffix fc_prefix, '
      '       1 as fl_type,'
      '       0 as fn_cost,'
      '       0 as fk_raionid'
      '  from taxi.tstreet s'
      'union all'
      'select fk_id, fc_name, '
      '       upper(fc_name) as fc_name_up, '#39#1084#1077#1089#1090#1086#39' as fc_prefix, '
      '       2 as fl_type,'
      '       0 as fn_cost,'
      '       fk_raionid'
      '  from taxi.ts_org'
      ' where fl_del = 0 '
      'union all'
      'select fk_id, fc_name, '
      
        '       upper(fc_name) as fc_name_up, '#39#1057#1090#1086#1103#1085#1082#1072' '#39'||decode(fl_plat,' +
        ' 1, '#39#1055#1083#1072#1090#1085#1072#1103#39'||'#39'(+'#39'||to_char(fn_cost)||'#39')'#39', null) as fc_prefix, '
      '       3 as fl_type,'
      '       fn_cost,'
      '       fk_raionid'
      '  from taxi.ts_places'
      'order by fc_name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F4E414D455F555001000000000009000000
      46435F505245464958010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 232
    Top = 208
  end
  object dsAdr: TDataSource
    DataSet = odsAdr
    Left = 232
    Top = 160
  end
  object odsRaionByStreet: TOracleDataSet
    SQL.Strings = (
      
        'select taxi.pkg_drivergrid.getstreetdistrict(:pstreet, :phouse) ' +
        'fk_raion from dual')
    Optimize = False
    Variables.Data = {
      0300000002000000080000003A50535452454554030000000000000000000000
      070000003A50484F555345030000000000000000000000}
    Session = frmMain.os
    Left = 280
    Top = 208
  end
end
