object frmAdd: TfrmAdd
  Left = 317
  Top = 40
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1074' '#1078#1091#1088#1085#1072#1083
  ClientHeight = 548
  ClientWidth = 735
  Color = clCream
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
  object pcMain: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 729
    Height = 510
    ActivePage = cxTabSheet2
    Align = alTop
    HideTabs = True
    LookAndFeel.SkinName = 'Caramel'
    TabOrder = 0
    OnChange = pcMainChange
    ClientRectBottom = 509
    ClientRectLeft = 1
    ClientRectRight = 728
    ClientRectTop = 1
    object cxTabSheet1: TcxTabSheet
      Caption = 'cxTabSheet1'
      ImageIndex = 0
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 721
        Height = 258
        Align = alTop
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 0
        object cxLabel1: TcxLabel
          Left = 16
          Top = 11
          Caption = #1053#1086#1084#1077#1088' '#1074' '#1078#1091#1088#1085#1072#1083#1077
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.SkinName = 'Caramel'
          Style.TextColor = clTeal
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
        end
        object seNum: TcxSpinEdit
          Left = 128
          Top = 10
          Properties.ImmediatePost = True
          Style.LookAndFeel.SkinName = 'Coffee'
          StyleDisabled.BorderColor = clBlack
          StyleDisabled.Color = clWhite
          StyleDisabled.LookAndFeel.SkinName = 'Coffee'
          StyleDisabled.TextColor = clBlack
          StyleFocused.LookAndFeel.SkinName = 'Coffee'
          StyleHot.LookAndFeel.SkinName = 'Coffee'
          TabOrder = 1
          Width = 121
        end
        object cxLabel2: TcxLabel
          Left = 384
          Top = 11
          Caption = #1044#1072#1090#1072
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.SkinName = 'Caramel'
          Style.TextColor = clTeal
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
        end
        object deDate: TcxDateEdit
          Left = 479
          Top = 10
          Properties.ImmediatePost = True
          Properties.PostPopupValueOnTab = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.BorderColor = clBlack
          StyleDisabled.Color = clWhite
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.TextColor = clBlack
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 3
          Width = 121
        end
        object cxGroupBox1: TcxGroupBox
          Left = 18
          Top = 60
          Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1072#1094#1080#1077#1085#1090#1077
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.SkinName = 'Caramel'
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 4
          Height = 186
          Width = 695
          object cxLabel3: TcxLabel
            Left = 16
            Top = 21
            Caption = #1055#1072#1094#1080#1077#1085#1090
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clTeal
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object lbPac: TcxLabel
            Left = 119
            Top = 21
            Caption = '--'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clNavy
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object cxLabel5: TcxLabel
            Left = 16
            Top = 42
            Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clTeal
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object lbDateBirth: TcxLabel
            Left = 119
            Top = 42
            Caption = '--'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clBlack
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object cxLabel9: TcxLabel
            Left = 16
            Top = 63
            Caption = #1042#1086#1079#1088#1072#1089#1090
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clTeal
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object lbAge: TcxLabel
            Left = 119
            Top = 63
            Caption = '--'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clBlack
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object cxLabel6: TcxLabel
            Left = 16
            Top = 107
            Caption = #1040#1076#1088#1077#1089
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clTeal
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object lbAddress: TcxLabel
            Left = 119
            Top = 107
            Caption = '--'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clBlack
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object cxLabel7: TcxLabel
            Left = 16
            Top = 128
            Caption = #1044#1080#1072#1075#1085#1086#1079
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clTeal
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object lbDS: TcxLabel
            Left = 119
            Top = 128
            AutoSize = False
            Caption = '--'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clBlack
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
            Properties.WordWrap = True
            Height = 48
            Width = 487
          end
          object cxLabel4: TcxLabel
            Left = 368
            Top = 21
            Caption = #8470' '#1052#1050
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clTeal
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object lbNumMK: TcxLabel
            Left = 461
            Top = 21
            Caption = '--'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clBlack
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object cxLabel8: TcxLabel
            Left = 368
            Top = 40
            Caption = #1046#1080#1090#1077#1083#1100
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clTeal
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object cxLabel10: TcxLabel
            Left = 368
            Top = 85
            Caption = #1057#1088#1086#1095#1085#1086#1089#1090#1100
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clTeal
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object lcbUrg: TcxLookupComboBox
            Left = 461
            Top = 83
            Properties.DropDownListStyle = lsFixedList
            Properties.DropDownSizeable = True
            Properties.GridMode = True
            Properties.ImmediatePost = True
            Properties.KeyFieldNames = 'FK_ID'
            Properties.ListColumns = <
              item
                FieldName = 'FC_NAME'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsExtr
            Properties.PostPopupValueOnTab = True
            Style.LookAndFeel.SkinName = 'Caramel'
            StyleDisabled.BorderColor = clBlack
            StyleDisabled.Color = clWhite
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleDisabled.TextColor = clBlack
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
            TabOrder = 14
            Width = 145
          end
          object lbSex: TcxLabel
            Left = 119
            Top = 85
            Caption = '--'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clBlack
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object cxLabel13: TcxLabel
            Left = 16
            Top = 85
            Caption = #1055#1086#1083
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clTeal
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object cxLabel14: TcxLabel
            Left = 368
            Top = 62
            Caption = #1055#1088#1086#1078#1080#1074#1072#1077#1090
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clTeal
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object lbJit: TcxLabel
            Left = 461
            Top = 42
            Caption = '--'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clBlack
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
          object lbReg: TcxLabel
            Left = 461
            Top = 62
            Caption = '--'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.SkinName = 'Caramel'
            Style.TextColor = clBlack
            Style.TextStyle = []
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.SkinName = 'Caramel'
            StyleFocused.LookAndFeel.SkinName = 'Caramel'
            StyleHot.LookAndFeel.SkinName = 'Caramel'
          end
        end
        object teTime: TcxTimeEdit
          Left = 479
          Top = 33
          EditValue = 0.000000000000000000
          Properties.ImmediatePost = True
          Properties.TimeFormat = tfHourMin
          Style.LookAndFeel.SkinName = 'Coffee'
          StyleDisabled.BorderColor = clBlack
          StyleDisabled.Color = clWhite
          StyleDisabled.LookAndFeel.SkinName = 'Coffee'
          StyleDisabled.TextColor = clBlack
          StyleFocused.LookAndFeel.SkinName = 'Coffee'
          StyleHot.LookAndFeel.SkinName = 'Coffee'
          TabOrder = 5
          Width = 58
        end
        object teTimeEnd: TcxTimeEdit
          Left = 653
          Top = 33
          EditValue = 0.000000000000000000
          Properties.ImmediatePost = True
          Properties.TimeFormat = tfHourMin
          Style.LookAndFeel.SkinName = 'Coffee'
          StyleDisabled.BorderColor = clBlack
          StyleDisabled.Color = clWhite
          StyleDisabled.LookAndFeel.SkinName = 'Coffee'
          StyleDisabled.TextColor = clBlack
          StyleFocused.LookAndFeel.SkinName = 'Coffee'
          StyleHot.LookAndFeel.SkinName = 'Coffee'
          TabOrder = 6
          Width = 60
        end
        object cxLabel12: TcxLabel
          Left = 384
          Top = 34
          Caption = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.SkinName = 'Caramel'
          Style.TextColor = clTeal
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
        end
        object cxLabel15: TcxLabel
          Left = 546
          Top = 34
          Caption = #1042#1088#1077#1084#1103' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.SkinName = 'Caramel'
          Style.TextColor = clTeal
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
        end
        object lbVyp: TcxLabel
          Left = 16
          Top = 39
          Caption = #1055#1072#1094#1080#1077#1085#1090' '#1074#1099#1087#1080#1089#1072#1085'! '#1056#1077#1078#1080#1084' '#1087#1088#1086#1089#1084#1086#1090#1088#1072'!'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.SkinName = 'Caramel'
          Style.TextColor = clRed
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          Visible = False
        end
      end
      object Panel2: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 264
        Width = 721
        Height = 181
        Margins.Top = 0
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object dxBarDockControl1: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 28
          Height = 181
          Align = dalLeft
          BarManager = BM
        end
        object grIssl: TcxGrid
          Left = 28
          Top = 0
          Width = 693
          Height = 181
          Align = alClient
          TabOrder = 1
          LookAndFeel.SkinName = 'Caramel'
          object tvIsslTable: TcxGridTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.InvertSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object vName: TcxGridColumn
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            end
            object vSmidID: TcxGridColumn
              Caption = 'ID'
              Visible = False
              VisibleForCustomization = False
            end
            object vNazID: TcxGridColumn
              Caption = 'NazID'
              Visible = False
              VisibleForCustomization = False
            end
            object vSos: TcxGridColumn
              Caption = #1057#1090#1072#1090#1091#1089
              Visible = False
              VisibleForCustomization = False
            end
            object vOut: TcxGridColumn
              Caption = 'Out'
              Visible = False
              VisibleForCustomization = False
            end
          end
          object grIsslLevel1: TcxGridLevel
            GridView = tvIsslTable
          end
        end
      end
      object vGrPodpis: TcxVerticalGrid
        AlignWithMargins = True
        Left = 3
        Top = 448
        Width = 721
        Height = 58
        Margins.Top = 0
        Align = alTop
        LookAndFeel.SkinName = 'Caramel'
        TabOrder = 2
        object catPod: TcxCategoryRow
          Properties.Caption = #1055#1086#1076#1087#1080#1089#1080
        end
        object rowSotr: TcxEditorRow
          Properties.Caption = #1042#1088#1072#1095
          Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.EditProperties.DropDownListStyle = lsFixedList
          Properties.EditProperties.DropDownSizeable = True
          Properties.EditProperties.GridMode = True
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.KeyFieldNames = 'FK_ID'
          Properties.EditProperties.ListColumns = <
            item
              FieldName = 'FC_FIO'
            end>
          Properties.EditProperties.ListOptions.ShowHeader = False
          Properties.EditProperties.ListSource = dsSotr
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.DataBinding.ValueType = 'Integer'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = 0
        end
        object rowMS: TcxEditorRow
          Properties.Caption = #1052#1077#1076#1089#1077#1089#1090#1088#1072
          Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.EditProperties.DropDownListStyle = lsFixedList
          Properties.EditProperties.DropDownSizeable = True
          Properties.EditProperties.GridMode = True
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.KeyFieldNames = 'FK_ID'
          Properties.EditProperties.ListColumns = <
            item
              FieldName = 'FC_FIO'
            end>
          Properties.EditProperties.ListOptions.ShowHeader = False
          Properties.EditProperties.ListSource = dsMs
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'cxTabSheet2'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 727
        Height = 41
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 0
        object cxLabel11: TcxLabel
          Left = 13
          Top = 12
          Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
          Style.TextColor = clTeal
          Style.TextStyle = [fsBold]
        end
        object teFIO: TcxTextEdit
          Left = 107
          Top = 8
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -16
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.SkinName = 'Caramel'
          Style.TextColor = clMaroon
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 1
          OnClick = teFIOClick
          OnEnter = teFIOEnter
          OnKeyDown = teFIOKeyDown
          Width = 466
        end
        object bClear: TcxButton
          Left = 613
          Top = 5
          Width = 34
          Height = 32
          Action = aClear
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000F00A0000F00A00000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000006DA1006FA2006D9F006D9F
            006D9C006C9C006C9C0069980067980067960066990071AA0000000000000000
            000000000000000000000000000000000000000000000000000072A8009AB900
            A1B700A0BD00A1C30093B6009ABF008BAE0095BC0081A400789A006A8700628C
            0073A90000000000000000000000000000000000000000000000000000000000
            000071A900D5EA00C7DF00CFF200C7F100ABD500BCEC00B7E700A9D8009AC600
            8EB70080A5006A9000649C000000000000000000000000000000000000000000
            000000000000000000007DB200EDF600D2E700DCFB00CBF200BCE800C0F100BB
            EC00ADDC00A4D10093BC0082AA00749B00649900000000000000000000000000
            0000000000000000000000000000000000008FBC00F6FB00DBEE00DFFE00CEF4
            00C4F100C2F300BFF200B2E000A4D20094BF0085AD007BA00065980000000000
            000000000000000000000000000000000000000000000000000095C400F5FF00
            DEF600E0FF00D0F700C9F800C4F600C2F400B1E100A3D10095C00085AD007D9F
            0064980000000000000000000000000000000000000000000000000000000000
            00009ACA00F2FF00DBF900E0FF00CFF900C7F900C6FA00BEF100AADA00A0CC00
            94BE0083AA007799006598000000000000000000000000000000000000000000
            0000000000000000000091C100C9E100C2E100C0E300B1DB00BAE800BEEF00AE
            DD009CC50082A70083A9006E8F00688600689D00000000000000000000000000
            00000000000000000000000000000000000094CD0089BD0083B70081B3007DAE
            0079AC0078A90074A3006F9E006D9A00699401659002628B046CA00000000000
            0000000000000000000000000000000000000000000000000096837DD6C3BCE5
            D1CBDECBC3D7C4BED1BFB7CBBAB2C6B6AEBFAFA7B9ABA3B4A69FAB9E9793877F
            7D70670000000000000000000000000000000000000000000000000000000000
            00959079CEC9B7DDD8C8D2CFC0CBC7B9C5BFB4BAB8ADB4B2A8ABA8A3A5A29D9F
            9C98969390817F7D6A6A6D000000000000000000000000000000000000000000
            000000000000000000000DE11A41EA0E34E20228E00426DD0424DB0221D9001E
            D7001BD50019D30016D20012D00015D70000A700000000000000000000000000
            0000000000000000000000000000000000001BE3709FFEC0DCFF6F9EFF5285FF
            4C7DFF4677FF3F70FF3569FF2D62FF275CFF2058FF1449FF0007A90000000000
            000000000000000000000000000000000000000000000000000025FF002CEF3F
            6DF57DA5FF84ABFF6B93FF4775FF406FFF3D6DFF3567FF2551F91238E60013C3
            0008C30000000000000000000000000000000000000000000000000000000000
            000000000000FF0029FF001FFF002CEF4771F85E8AFF4474FF0E33E70018E600
            15E50015DE0000E9000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000021FF0531F0608EFF2954
            F4001DFA00000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000002FFF
            1E4EFC5F90FF3D6AFD0027FF0000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000013BFF4277FF6593FE6693FF0033FF000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000B43FF6295FF5482F46E9BFF1C51FF00000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000001850FF6AA0FF344ECC5680
            F13163FF00000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000002865FF
            477DFF4F6FDB6492F5275AFF0000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000002C61FF2F62FF3162FF1F57FF000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          LookAndFeel.SkinName = 'Caramel'
        end
        object bFindPac: TcxButton
          Left = 578
          Top = 5
          Width = 34
          Height = 32
          Action = aFindPac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          LookAndFeel.SkinName = 'Caramel'
        end
      end
      object grFind: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 44
        Width = 721
        Height = 461
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        PopupMenu = pmFind
        TabOrder = 1
        LookAndFeel.SkinName = 'Caramel'
        object tvFind: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnCellDblClick = tvFindCellDblClick
          DataController.DataSource = dsFind
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = vFio
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object vFio: TcxGridDBColumn
            Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
            DataBinding.FieldName = 'FIO'
            Width = 281
          end
          object vDateR: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
            DataBinding.FieldName = 'FD_ROJD'
            Width = 73
          end
          object vNumIB: TcxGridDBColumn
            Caption = #8470' '#1052#1050
            DataBinding.FieldName = 'NIB'
            Width = 98
          end
          object vState: TcxGridDBColumn
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
            DataBinding.FieldName = 'STEK_COC'
            Width = 255
          end
          object vTypeDoc: TcxGridDBColumn
            Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'FC_NAME'
          end
        end
        object grFindLevel1: TcxGridLevel
          GridView = tvFind
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'cxTabSheet3'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 727
        Height = 57
        Align = alTop
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 0
        object paDate: TPanel
          Left = 14
          Top = 11
          Width = 220
          Height = 36
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
          object p1: TPanel
            Left = 50
            Top = 19
            Width = 17
            Height = 17
            BevelInner = bvLowered
            TabOrder = 0
            OnClick = p1Click
          end
          object p2: TPanel
            Left = 67
            Top = 19
            Width = 17
            Height = 17
            BevelInner = bvLowered
            TabOrder = 1
            OnClick = p2Click
          end
          object p3: TPanel
            Left = 84
            Top = 19
            Width = 17
            Height = 17
            BevelInner = bvLowered
            TabOrder = 2
            OnClick = p3Click
          end
          object p4: TPanel
            Left = 101
            Top = 19
            Width = 17
            Height = 17
            BevelInner = bvLowered
            TabOrder = 3
            OnClick = p4Click
          end
          object p5: TPanel
            Left = 118
            Top = 19
            Width = 17
            Height = 17
            BevelInner = bvLowered
            TabOrder = 4
            OnClick = p5Click
          end
          object p6: TPanel
            Left = 135
            Top = 19
            Width = 17
            Height = 17
            BevelInner = bvLowered
            TabOrder = 5
            OnClick = p6Click
          end
          object p7: TPanel
            Left = 152
            Top = 19
            Width = 17
            Height = 17
            BevelInner = bvLowered
            TabOrder = 6
            OnClick = p7Click
          end
          object blWeeks: TButton
            Left = 25
            Top = 19
            Width = 25
            Height = 17
            Caption = '<'
            TabOrder = 7
            OnClick = blWeeksClick
          end
          object blMon: TButton
            Left = 0
            Top = 19
            Width = 25
            Height = 17
            Caption = '<<'
            TabOrder = 8
            OnClick = blMonClick
          end
          object brWeeks: TButton
            Left = 169
            Top = 19
            Width = 25
            Height = 17
            Caption = '>'
            TabOrder = 9
            OnClick = brWeeksClick
          end
          object brMon: TButton
            Left = 195
            Top = 19
            Width = 25
            Height = 17
            Caption = '>>'
            TabOrder = 10
            OnClick = brMonClick
          end
          object pMonth: TPanel
            Left = 0
            Top = 0
            Width = 220
            Height = 19
            BevelInner = bvLowered
            Color = clSkyBlue
            ParentBackground = False
            TabOrder = 11
          end
        end
        object deDateCh: TcxDateEdit
          Left = 248
          Top = 20
          EditValue = 0d
          Properties.DateButtons = [btnToday]
          Properties.DateOnError = deNull
          Properties.ImmediatePost = True
          Properties.PostPopupValueOnTab = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.OnChange = deDateChPropertiesChange
          Style.LookAndFeel.SkinName = 'Caramel'
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 1
          Width = 121
        end
      end
      object grList: TcxGrid
        Left = 0
        Top = 57
        Width = 727
        Height = 451
        Align = alClient
        TabOrder = 1
        LookAndFeel.SkinName = 'Caramel'
        object tvList: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnCellDblClick = tvListCellDblClick
          DataController.DataSource = dsList
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = vListName
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object vListFio: TcxGridDBColumn
            Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
            DataBinding.FieldName = 'PACFIO'
            Width = 203
          end
          object vListName: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_NAME'
            Width = 504
          end
        end
        object grListLevel1: TcxGridLevel
          GridView = tvList
        end
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = 'cxTabSheet4'
      ImageIndex = 3
      object grMetod: TcxGrid
        Left = 0
        Top = 47
        Width = 727
        Height = 461
        Align = alClient
        TabOrder = 0
        LookAndFeel.SkinName = 'Caramel'
        object tvMetod: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnCellDblClick = tvMetodCellDblClick
          DataController.DataSource = dsMetod
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = tvMetodName
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object tvMetodName: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_NAME'
          end
        end
        object grMetodLevel1: TcxGridLevel
          GridView = tvMetod
        end
      end
      object Panel7: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 721
        Height = 41
        Align = alTop
        BevelInner = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 1
        object cxLabel16: TcxLabel
          Left = 13
          Top = 13
          Caption = #1060#1080#1083#1100#1090#1088
          Style.TextColor = clTeal
          Style.TextStyle = [fsBold]
        end
        object teFilter: TcxTextEdit
          Left = 66
          Top = 8
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -16
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.SkinName = 'Caramel'
          Style.TextColor = clMaroon
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'Caramel'
          StyleFocused.LookAndFeel.SkinName = 'Caramel'
          StyleHot.LookAndFeel.SkinName = 'Caramel'
          TabOrder = 1
          OnClick = teFIOClick
          OnEnter = teFIOEnter
          OnKeyUp = teFilterKeyUp
          Width = 466
        end
        object bClearFilter: TcxButton
          Left = 538
          Top = 5
          Width = 34
          Height = 32
          Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1087#1086#1080#1089#1082#1072
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = bClearFilterClick
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000F00A0000F00A00000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000006DA1006FA2006D9F006D9F
            006D9C006C9C006C9C0069980067980067960066990071AA0000000000000000
            000000000000000000000000000000000000000000000000000072A8009AB900
            A1B700A0BD00A1C30093B6009ABF008BAE0095BC0081A400789A006A8700628C
            0073A90000000000000000000000000000000000000000000000000000000000
            000071A900D5EA00C7DF00CFF200C7F100ABD500BCEC00B7E700A9D8009AC600
            8EB70080A5006A9000649C000000000000000000000000000000000000000000
            000000000000000000007DB200EDF600D2E700DCFB00CBF200BCE800C0F100BB
            EC00ADDC00A4D10093BC0082AA00749B00649900000000000000000000000000
            0000000000000000000000000000000000008FBC00F6FB00DBEE00DFFE00CEF4
            00C4F100C2F300BFF200B2E000A4D20094BF0085AD007BA00065980000000000
            000000000000000000000000000000000000000000000000000095C400F5FF00
            DEF600E0FF00D0F700C9F800C4F600C2F400B1E100A3D10095C00085AD007D9F
            0064980000000000000000000000000000000000000000000000000000000000
            00009ACA00F2FF00DBF900E0FF00CFF900C7F900C6FA00BEF100AADA00A0CC00
            94BE0083AA007799006598000000000000000000000000000000000000000000
            0000000000000000000091C100C9E100C2E100C0E300B1DB00BAE800BEEF00AE
            DD009CC50082A70083A9006E8F00688600689D00000000000000000000000000
            00000000000000000000000000000000000094CD0089BD0083B70081B3007DAE
            0079AC0078A90074A3006F9E006D9A00699401659002628B046CA00000000000
            0000000000000000000000000000000000000000000000000096837DD6C3BCE5
            D1CBDECBC3D7C4BED1BFB7CBBAB2C6B6AEBFAFA7B9ABA3B4A69FAB9E9793877F
            7D70670000000000000000000000000000000000000000000000000000000000
            00959079CEC9B7DDD8C8D2CFC0CBC7B9C5BFB4BAB8ADB4B2A8ABA8A3A5A29D9F
            9C98969390817F7D6A6A6D000000000000000000000000000000000000000000
            000000000000000000000DE11A41EA0E34E20228E00426DD0424DB0221D9001E
            D7001BD50019D30016D20012D00015D70000A700000000000000000000000000
            0000000000000000000000000000000000001BE3709FFEC0DCFF6F9EFF5285FF
            4C7DFF4677FF3F70FF3569FF2D62FF275CFF2058FF1449FF0007A90000000000
            000000000000000000000000000000000000000000000000000025FF002CEF3F
            6DF57DA5FF84ABFF6B93FF4775FF406FFF3D6DFF3567FF2551F91238E60013C3
            0008C30000000000000000000000000000000000000000000000000000000000
            000000000000FF0029FF001FFF002CEF4771F85E8AFF4474FF0E33E70018E600
            15E50015DE0000E9000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000021FF0531F0608EFF2954
            F4001DFA00000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000002FFF
            1E4EFC5F90FF3D6AFD0027FF0000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000013BFF4277FF6593FE6693FF0033FF000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000B43FF6295FF5482F46E9BFF1C51FF00000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000001850FF6AA0FF344ECC5680
            F13163FF00000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000002865FF
            477DFF4F6FDB6492F5275AFF0000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000002C61FF2F62FF3162FF1F57FF000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          LookAndFeel.SkinName = 'Caramel'
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 570
    Top = 515
    Width = 158
    Height = 41
    BevelOuter = bvNone
    Color = clCream
    ParentBackground = False
    TabOrder = 1
    object dxBarDockControl2: TdxBarDockControl
      Left = 0
      Top = 0
      Width = 158
      Height = 26
      Align = dalTop
      BarManager = BM
      ExplicitWidth = 151
    end
  end
  object Panel6: TPanel
    Left = 7
    Top = 515
    Width = 386
    Height = 41
    BevelOuter = bvNone
    Color = clCream
    ParentBackground = False
    TabOrder = 6
    object dxBarDockControl3: TdxBarDockControl
      Left = 0
      Top = 0
      Width = 386
      Height = 26
      Align = dalTop
      BarManager = BM
    end
  end
  object al: TActionList
    Images = IL
    Left = 451
    Top = 380
    object aAdd: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 2
      ShortCut = 115
      OnExecute = aAddExecute
    end
    object aDel: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      ShortCut = 119
      OnExecute = aDelExecute
    end
    object aFind: TAction
      Caption = #1053#1072#1081#1090#1080' '#1087#1072#1094#1080#1077#1085#1090#1072'...'
      Hint = #1053#1072#1081#1090#1080' '#1087#1072#1094#1080#1077#1085#1090#1072
      ShortCut = 16454
      OnExecute = aFindExecute
    end
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aChoose: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100'...'
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1085#1072#1079#1085#1072#1095#1077#1085#1085#1099#1093
      OnExecute = aChooseExecute
    end
    object aFindPac: TAction
      Category = 'FindPac'
      Hint = #1053#1072#1081#1090#1080' '#1087#1072#1094#1080#1077#1085#1090#1072
      ImageIndex = 5
      OnExecute = aFindPacExecute
    end
    object aClear: TAction
      Category = 'FindPac'
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1087#1086#1080#1089#1082#1072
      ShortCut = 119
      OnExecute = aClearExecute
    end
    object aFindPacSet: TAction
      Category = 'FindPac'
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1072#1094#1080#1077#1085#1090#1072' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1087#1086#1080#1089#1082#1072
      ImageIndex = 7
      OnExecute = aFindPacSetExecute
    end
    object aSetMetod: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1084#1077#1090#1086#1076#1080#1082#1091
      ImageIndex = 7
      OnExecute = aSetMetodExecute
    end
    object aEdit: TAction
      Enabled = False
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1088#1086#1094#1077#1076#1091#1088#1091', '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
      ImageIndex = 6
      Visible = False
      OnExecute = aEditExecute
    end
    object aChooseSet: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 7
      OnExecute = aChooseSetExecute
    end
  end
  object BM: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clBtnFace
    ImageOptions.Images = IL
    LookAndFeel.SkinName = 'Caramel'
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 411
    Top = 380
    DockControlHeights = (
      0
      0
      0
      0)
    object BMBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Left'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 297
      FloatTop = 104
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbAdd'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbEdit'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbDel'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BMBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Save'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1294
      FloatTop = 10
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbSave'
        end
        item
          Visible = True
          ItemName = 'bbCancel'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object BMBar3: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Find'
      CaptionButtons = <>
      DockControl = dxBarDockControl3
      DockedDockControl = dxBarDockControl3
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1294
      FloatTop = 10
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbFind'
        end
        item
          Visible = True
          ItemName = 'bbChoose'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbSet'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object bbAdd: TdxBarButton
      Action = aAdd
      Category = 0
    end
    object bbDel: TdxBarButton
      Action = aDel
      Category = 0
    end
    object bbCancel: TdxBarButton
      Action = aCancel
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000B50000A80101A80000A50000B4000000000000000000
        00000000000000000000000000000000009D00009C00009B0000B80000000000
        000000000000000000000000000000A40001B11542F01545E80E2CC80307AA00
        00B10000A30000000000000000000000000000000000B900009F0520C60312AC
        00009B0000A40000AC0000000000000000000000000000AC0E27D81B4FFF194A
        FB1948F51643E3091CB70000A80000C10000000000000000000000BB00009F0A
        29D60D3EF40B39E6072ED4041CB900009C0000AD0000000000000000000000AC
        2554FC2356FF1D4FFF1C4DFE1A4BFB1947F0102DC60000A90000BE0000000000
        BB0000A10C2DDA1142F80E3FF40D3CF20B39EE0A37E8041FBB00009D00008400
        00000000000000BA0405B82957F92456FF2051FF1F51FF1D4EFD1B4BF41338CE
        0101A90000B10000A40F31DE1446FC1243F81040F50E3EF40D3DF40B3AEF0A36
        E50212AC00009E0000000000000000000000B72D5DFE2859FF2657FF2455FF23
        55FF2051FF1D4CF7153DD60101A71131DE184CFE1547F91444F81243F71040F5
        0E3EF40C3DF30C3CF2072CD500009D0000000000000000000406C43C71FF2F61
        FF2B5BFF295AFF2859FF2758FF2455FF1D4EF81B4BF31C4EFD1B4AFD1848FB15
        46F91444F81243F71040F50F41F80B34E70104AB0000AA000000000000000000
        0000BB2239DA4275FF3769FF2F60FF2C5DFF2A5AFF285AFF2657FF2152FE1E4F
        FF1C4DFF1A4BFD1849FB1546F91544F91347FB0B29D90000A10000B700000000
        00000000000000000000C20000BE080DBF3B63F44273FF3565FF2F60FF2B5CFF
        295AFF2859FF2354FF1F50FE1C4EFE1A4BFE1949FC164AFF0920CC0000A40000
        B90000000000000000000000000000000000000000000000C90000B12338D748
        7AFF3A6BFF3162FF2D5EFF2A5AFF2758FF2354FF1F50FE1D4EFE1C4FFF091BC8
        0000B000008C0000000000000000000000000000000000000000000000000000
        000000DA0000B30B10BF406CFB3768FF3262FF2E5FFF2A5BFF2758FF2455FE1D
        4FFB091AC60000B0000000000000000000000000000000000000000000000000
        0000000000000000000000000000BA0001B64273FF3A6AFF3565FF3262FF2E5F
        FF2A5AFF2657FE1E4EF8102DCA0000AC00008B00000000000000000000000000
        00000000000000000000000000000000000000000000BF2740DF4576FF3D6DFF
        3969FF3565FF3262FF2D5EFF295BFF2555FE1C4CEF0A1AB80000B80000000000
        000000000000000000000000000000000000000000000000000000000000B94D
        7DFF4675FF406FFF3D6EFF396AFF3A6BFF3565FF2C5CFF295AFF2252FD1947E3
        0308B00000C40000000000000000000000000000000000000000000000000000
        000000C72337D85183FF4877FF4372FF406EFF3D6FFF243FE04375FF3364FF2A
        5BFF2657FF1D4FF9143AD10000AE0000C2000000000000000000000000000000
        0000000000000000000000C64D76F85280FF4B79FF4877FF4374FF2342E50000
        AF131FC84274FF3062FF2859FF2353FE1B4BF30C23BF0000B900000000000000
        00000000000000000000000000000000D00F17CC6091FF5280FF4D7BFF497AFF
        3C69FA0000B90000C30000BF1421CD4071FF2D5DFF2455FE1F4FFC1847E7040C
        B40000C50000000000000000000000000000000000000000D03750E45E8EFF54
        82FF507EFF4B7EFF0E1ACC0000D00000000000000000CB1729D23B6DFF2859FF
        2051FF1B4AF8133AD30000B00000C20000000000000000000000000000000000
        D06893FC6491FF5885FF5281FF3252ED0000C600000000000000000000000000
        00BF1D35DA3367FF2454FF1C4EFD1948F20B24C30000B1000000000000000000
        0000000000000000DF1D27D3719EFF6A9AFF5485FF0305C60000D60000000000
        000000000000000000DC0000B52341E52C60FF2053FF1C52FF1032E10000B300
        00000000000000000000000000000000000000E00000D0202DD62637DA0000CE
        0000000000000000000000000000000000000000C60000B62246EB102ADC0103
        BC0000BD0000C700000000000000000000000000000000000000000000000000
        00D20000C30000C30000000000000000000000000000000000000000000000C4
        0000B60000B70000BB0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
    object bbSave: TdxBarButton
      Action = aSave
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000008D000084000286040088000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000009F0003910714B02B14B129
        0A9B140094000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000A80004950817
        B22F13AD2B12AB2613AF27099A13009400000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000000AC
        0003990819B53516B03015AE2C14AD2914AD2713AF29099A1300940000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000B300049C091BB63B1AB43518B13116AF2F13AE2A13AD2913AD2814B0
        28099A1300950000000000000000000000000000000000000000000000000000
        000000000000000000B60103A00820B9411CB53A1AB33619B23417B1323DBE52
        27B43C0EAC2613AC2814B02A099A130095000000000000000000000000000000
        0000000000000000000000000002B21008A61222BB451FB8401DB63B1DB6391B
        B53A17B0310E9F1776D18641BF560EAC2514AE2914B029099913009500000000
        0000000000000000000000000000000000000000000CA61B44C7651FBA431FB8
        411EB73E1FB8401AB33600950000970000930072D1843FBF530EAC2614AD2916
        B12B0999130095000000000000000000000000000000000000000000000EAB22
        76D89117B83D1FBA4321BB441CB639009A0000A70000000000A60000940074D2
        853DBF530EAC2614AD2A15B12D09991300960000000000000000000000000000
        00000000000E9F2346C1616FD58B38C45B26BA4603A00500AC00000000000000
        00000000AA0000950074D2853ABD5010AE2714AD2B15B12C0999130096000000
        000000000000000000000000000000000EB42627BA3E41BF5709A51400C30B00
        000000000000000000000000000000AC0000950076D2883ABD5010AE2815AF2B
        17B32E09991300960000000000000000000000000000000000000011D3240FBC
        1E00D12200000000000000000000000000000000000000000000A60000980177
        D38938BC4E10AE2915AE2C17B32F099912009800000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000A90000980279D48B35BB4C11AF2A15AE2D17B22F099912008A0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000AB0000990377D58B35BB4C11AF2B16B0
        2D17B43202890400000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000A800009905
        79D48C34BA4C11AF2B18B4340188010000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000AD00009B0774D58954CA6C069C11009400000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000009D00009300008F0000990000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
    object bbFind: TdxBarButton
      Action = aFind
      Category = 0
      ImageIndex = 1
      PaintStyle = psCaptionGlyph
    end
    object bbChoose: TdxBarButton
      Action = aChoose
      Category = 0
      ImageIndex = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEdit: TdxBarButton
      Action = aEdit
      Category = 0
    end
    object bbSet: TdxBarButton
      Action = aSetMetod
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object odsFind: TOracleDataSet
    SQL.Strings = (
      'select tambulance.fk_peplid,  '
      
        '       tambulance.fc_fam||'#39' '#39'||tambulance.fc_im||'#39' '#39'|| tambulanc' +
        'e.fc_otch fio,  '
      
        #9'   decode(to_char(tambulance.fd_rojd, '#39'dd.mm.yyyy hh24:mi:ss'#39'),' +
        ' '#39'00.00.0000 00:00:00'#39', trunc(sysdate), tambulance.fd_rojd) fd_r' +
        'ojd,  '
      '       tuslvid.fc_name,  '
      '       asu.get_ib(tambulance.fk_id) as nib,'
      
        '       decode(tambulance.fp_sex, 0, '#39#1046#1077#1085#1089#1082#1080#1081#39', 1, '#39#1052#1091#1078#1089#1082#1086#1081#39') as ' +
        'sex,  '
      '       '#39#1040#1084#1073#1091#1083#1072#1090#1086#1088#1085#1086#1077' '#1083#1077#1095#1077#1085#1080#1077#39' as stek_coc, '
      '       tambulance.fk_id as pacid,  '
      '       1 as is_ambulance,  '
      '       0 as fp_tek_coc,  '
      '       tuslvid.fk_id as uslid  '
      '  from asu.tambulance, asu.tdocobsl, asu.tuslvid '
      ' where tambulance.fc_fam like :sfam  '
      '   and nvl(tambulance.fc_im,'#39' '#39') like :sim  '
      '   and nvl(tambulance.fc_otch,'#39' '#39') like :sotch  '
      '   and tambulance.fk_docobsl = tdocobsl.fk_id  '
      '   and tdocobsl.fk_viddocid = tuslvid.fk_id  '
      'union all  '
      'select tkarta.fk_peplid,  '
      
        '       tkarta.fc_fam||'#39' '#39'||tkarta.fc_im||'#39' '#39'|| tkarta.fc_otch fi' +
        'o,  '
      
        #9'   decode(to_char(tkarta.fd_rojd, '#39'dd.mm.yyyy hh24:mi:ss'#39'), '#39'00' +
        '.00.0000 00:00:00'#39', trunc(sysdate), tkarta.fd_rojd) fd_rojd,  '
      '       tuslvid.fc_name,  '
      '       asu.get_ib(tkarta.fk_id) as nib,  '
      '       decode(tkarta.fp_sex, 0, '#39#1046#1077#1085#1089#1082#1080#1081#39', 1, '#39#1052#1091#1078#1089#1082#1086#1081#39') as sex,'
      
        '       decode(tkarta.fp_tek_coc,3,'#39#1042#1099#1087#1080#1089#1072#1085#39',2,'#39#1042' '#1089#1090#1072#1094#1080#1086#1085#1072#1088#1077#39',-2,' +
        #39#1053#1072' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1080' '#1055#1054#39','#39#39') as stek_coc,  '
      '       tkarta.fk_id as pacid,  '
      '       0 as is_ambulance,  '
      '       tkarta.fp_tek_coc,  '
      '       tuslvid.fk_id as uslid '
      '  from asu.tkarta, asu.tuslvid '
      ' where tkarta.fc_fam like :sfam  '
      '   and nvl(tkarta.fc_im,'#39' '#39') like :sim  '
      '   and nvl(tkarta.fc_otch,'#39' '#39') like :sotch  '
      '   and tkarta.fk_uslvidid = tuslvid.fk_id '
      '   and tkarta.fp_tek_coc <> 3'
      'order by fio')
    Optimize = False
    Variables.Data = {
      0300000003000000050000003A5346414D050000000000000000000000040000
      003A53494D050000000000000000000000060000003A534F5443480500000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B0000000300000046494F0100000000000700000046445F524F4A44
      0100000000000700000046435F4E414D45010000000000030000004E49420100
      00000000080000005354454B5F434F4301000000000005000000504143494401
      00000000000C00000049535F414D42554C414E43450100000000000A00000046
      505F54454B5F434F430100000000000500000055534C49440100000000000900
      0000464B5F5045504C494401000000000003000000534558010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsFindAfterOpen
    Left = 151
    Top = 380
  end
  object dsFind: TDataSource
    DataSet = odsFind
    Left = 112
    Top = 380
  end
  object dsExtr: TDataSource
    DataSet = odsExtr
    Left = 272
    Top = 296
  end
  object odsExtr: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name, fn_order '
      '  from asu.tsmid'
      
        ' where fk_owner = (select fk_id from asu.tsmid where fc_synonim ' +
        '= '#39'NAZN_TYPES'#39')'
      '   and fl_showprint = 1'
      '   and fl_del = 0'
      'order by fn_order')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 312
    Top = 296
  end
  object dsSotr: TDataSource
    DataSet = odsSotr
    Left = 112
    Top = 288
  end
  object odsSotr: TOracleDataSet
    SQL.Strings = (
      'select t1.fk_id, '
      '       t1.fc_fam||'#39' '#39'|| '
      
        '       decode(asu.varcharisnull(t1.fc_name), 1, '#39#39', substr(t1.fc' +
        '_name, 0, 1) || '#39'. '#39' || '
      
        '       decode (asu.varcharisnull(t1.fc_otch), 1, '#39#39', substr(t1.f' +
        'c_otch, 0, 1) || '#39'. '#39')) as fc_fio'
      '  from asu.tsotr t1, asu.ts_sprav t2'
      ' where t1.fk_spravid = t2.fk_id'
      '   and t2.fl_vrach = 1'
      '   and t1.fk_otdelid = asu.get_otdel_rhmdl'
      '   and t1.fl_del = 0'
      'order by fc_fam')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000600000046435F4649
      4F010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 152
    Top = 288
  end
  object dsMs: TDataSource
    DataSet = odsMs
    Left = 112
    Top = 336
  end
  object odsMs: TOracleDataSet
    SQL.Strings = (
      'select t1.fk_id, '
      '       t1.fc_fam||'#39' '#39'|| '
      
        '       decode(asu.varcharisnull(t1.fc_name), 1, '#39#39', substr(t1.fc' +
        '_name, 0, 1) || '#39'. '#39' || '
      
        '       decode (asu.varcharisnull(t1.fc_otch), 1, '#39#39', substr(t1.f' +
        'c_otch, 0, 1) || '#39'. '#39')) as fc_fio'
      '  from asu.tsotr t1, asu.ts_sprav t2'
      ' where t1.fk_spravid = t2.fk_id'
      '   and t2.fk_id = asu.get_ms'
      '   and t1.fk_otdelid = asu.get_otdel_rhmdl'
      '   and t1.fl_del = 0'
      'order by fc_fam')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000600000046435F4649
      4F010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 152
    Top = 336
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 271
    Top = 344
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      
        'select t1.fk_id, t1.fk_smid, t1.fc_name, t1.fk_pacid, t1.fk_nazt' +
        'ypeid,'
      '       asu.get_peplid(t1.fk_pacid) as fk_peplid,'
      
        '       asu.pkg_regist_pacfunc.get_pac_fio(t1.fk_pacid) as pacfio' +
        ' '
      '  from asu.vnaz t1 '
      
        ' where t1.fd_run >= :pfd_date and t1.fd_run < to_date(:pfd_date)' +
        '+1'
      '   and t1.fk_nazsosid = asu.get_nevip'
      '   and t1.fk_smid in (select fk_id from asu.tsmid '
      '                       where fl_del = 0'
      '                         and fl_showanal = 1'
      
        '                      start with fc_synonim = '#39'RENTGENXIR_ISSLED' +
        #39
      '                      connect by prior fk_id = fk_owner)'
      
        '   and t1.fk_vrachid not in (select fk_id from asu.tsotr where f' +
        'k_otdelid = asu.get_otdel_rhmdl)  '
      '   and t1.fk_id not in (select fk_nazid from asu.trhmdl_vnaz) '
      '')
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A5046445F444154450C00000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F494401000000000007000000464B5F534D
      49440100000000000700000046435F4E414D4501000000000006000000504143
      46494F010000000000}
    Session = frmMain.os
    AfterOpen = odsListAfterOpen
    Left = 311
    Top = 344
  end
  object odsMetods: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name, upper(fc_name) as fc_name_up'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and fl_showanal = 1'
      '   and level <> 1'
      'start with fc_synonim = '#39'RENTGENXIR_ISSLED'#39
      'connect by prior fk_id = fk_owner'
      'order by fc_name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 452
    Top = 324
  end
  object dsMetod: TDataSource
    DataSet = odsMetods
    Left = 412
    Top = 324
  end
  object pmFind: TPopupMenu
    Left = 480
    Top = 168
    object N1: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FDF1
        E500FDF1E500FFEDD500FFE9CE00FFE3C500FEDEBC00FFDAB100FFD5A600FFD1
        9F00FFCC9800FFD8A100BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FBF3
        EA00FBF3EA00FFEFDC00FFEDD500FEE5CA00FFE3C500FFDAB100FFDAB100FFD5
        A600FFCC9800FFD8A100BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF6
        F000FBF3EA00FDF1E500FFEDD500FFE9CE00FFE3C500FEDEBC00FFDAB100FED7
        AB00FFD5A600FFD5A600BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FBF3EA00FDF1E500FFEDD500FEE5CA00FFE3C500FEDEBC00FFDA
        B100FFD8A100FED7AB00BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FCF8F700FDF1E500FFEFDC00FFEDD500FEE5CA00FFE9C200DEC2
        B100DEBDA600FFE9B200BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FCF8F700FCF8F700FBF3EA00FDF1E500FFF2D700D9C2C100090A
        9000090A9000D5BBAC00BC4B0000FF00FF00090A900000028F00BC4B0000FAEF
        E500FBF3EA00FBF3EA00FDF1E500FAE7D400FEE5CA00FFE3C500C1A5A700090A
        9000112DEA00090A900065416600090A90000622EB0000039200BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000EF9037009754
        3D00090A90001933E200090A9000122DE50000039200FF00FF00FF00FF00BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
        000045265800090A90003C66FF00090A9000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00090A9000354CE000090A90002C46E700090A9000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00090A
        90004F65E70006099000FF00FF00090A90002C46E70006099000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00090A
        9000090A9000FF00FF00FF00FF00FF00FF000609900000028F00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      OnClick = N1Click
    end
  end
  object IL: TcxImageList
    Height = 24
    Width = 24
    FormatVersion = 1
    DesignInfo = 13041959
    ImageInfo = <
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000484848004B4B4B004B4B4B004848480046464600454545004242
          4200404040003C3C3C003535350000000000000000000000000000000000FF99
          0000FF990000FF990000FF990000FF990000FF990000FF990000FF990000FF99
          0000FFCF870069645D00FBF8F400FFFCF800FFFCF800ECCDBA00F5F2EE00FFFC
          F800FFFCF800F8F5F100544F4600FFCE8400FF9900000000000000000000FF99
          0000FFE5E500FFE6E600FFE6E600FFE6E600FFE6E600FFE6E600FFE5E500FFE3
          E300FFF1F1006C6B6B00FDFCFC00FFFEFE00F7E9E300AD460E00C6A49400FFFD
          FD00FFFDFD00FCFAFA0058555500FFE6E600FF9900000000000000000000FF99
          0000FFE8E800FFE9E900FFE9E900FFE9E900FFE9E900FFE9E900FFE8E800FFE7
          E700FFF3F300706F6F00FFFDFD00FFFDFD00C97F5400A33D0000B0521800E1DB
          D900FFFCFC00FCFAFA0059575700FFE7E700FF9900000000000000000000FF99
          0000FFEBEB00FFECEC00FFECEC00FFECEC00FFECEC00FFECEC00FFEBEB00FFEA
          EA00FFF5F50071707000FDFBFB00E9C1AA00A8410100A53F0000AA420000BD7D
          5600F8F5F500FDF9F9005D5A5A00FFE7E700FF9900000000000000000000FF99
          0000FFEFEF00FFF0F000FFF0F000FFF0F000FFF0F000FFF0F000FFEFEF00FFEE
          EE00FFF6F60074737300F9EAE300B1521400AA450100D6A18100AF450300B348
          0200CBAF9F00FCF8F8005F5D5D00FFE8E800FF9900000000000000000000FF99
          0000FFF2F200FFF3F300FFF3F300FFF3F300FFF3F300FFF3F300FFF2F200FFF0
          F000FFF8F80077747300C1733E00AC460000D38E5D00FFFCFC00D99B7000AF48
          0000BC5B1900DBD4D10063616100FFE9E900FF9900000000000000000000FF99
          0000FFF4F400FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF4F400FFF3
          F300FFF9F900995C3300AD470000BB642300FBF0EC00FFFBFB00FDF4F000BF69
          2800B54D0000C07844005E5C5C00FFEAEA00FF9900000000000000000000FF99
          0000FFF8F800FFF9F900FFFAFA00FFFAFA00FFFAFA00FFF9F900FFF8F800FFF5
          F500FFFAFA00B35D1F00B14E04008A705F00777676007674740076747400876C
          5800B6510200BB5100009D6D4900F5E1E100FF9D09000000000000000000FF99
          0000FFFAFA00FFFCFC00FFFDFD00FFFDFD00FFFDFD00FFFCFC00FFFAFA00FFF9
          F900FFF9F900D4976A00F1CCB300FFF8F800FFF5F500FFF4F400FFF2F200FFF2
          F200E7B48F00BA530000C45B0600BF9C8900FAB650000000000000000000FF99
          0000FFFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFDFD00FFFA
          FA00FFF9F900FCECE300FFF7F700FFEFEF00FFEBEB00FFE8E800FFE5E500FFE1
          E100FFF0F000D1894C00BE580000C4600E00F0BD7B000000000000000000FF99
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
          FC00FFF9F900FFF8F800FFF3F300FFF0F000FFECEC00FFE9E900FFE6E600FFE2
          E200FFDFDF00FFF1F100C86E1F00C15B0000DB7415000000000000000000FF99
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFD
          FD00FFFAFA00FFF7F700FFF3F300FFF0F000FFECEC00FFE9E900FFE6E600FFE2
          E200FFDFDF00FFE5E500FADECD00C8630900D66C08000000000000000000FF99
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFD
          FD00FFFAFA00FFF7F700FFF3F300FFF0F000FFECEC00FFE9E900FFE6E600FFE2
          E200FFDFDF00FFDCDC00FFE9E900F8CEB000D46D06000000000000000000FF99
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFD
          FD00FFFAFA00FFF7F700FFF3F300FFF0F000FFECEC00FFE9E900FFE6E600FFE2
          E200FFDFDF00FFDCDC00FFD9D900FFE7E700F8AE58000000000000000000FF99
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
          FC00FFF9F900FFF7F700FFF3F300FFF0F000FFECEC00FFE9E900FFE6E600FFE2
          E200FFDFDF00FFDCDC00FFD9D900FFD5D500FFB23E000000000000000000FF99
          0000CFCDCD00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCDCD00CFCB
          CB00CFC9C900CFC7C700CFC4C400CFC2C200CFC0C000CFBDBD00CFBBBB00CFB8
          B800CFB6B600CFB3B300CFB1B100CFAFAF00FF9900000000000000000000FF99
          0000FFAD3D00FF990000FF990000FF990000FF990000FF990000FF990000FF99
          0000FF990000FF990000FF990000FF990000FF990000FF990000FF990000FF99
          0000FF990000FF990000FF990000FF990000FF9900000000000000000000FF99
          0000FFCC9900EB850000EB850000EB850000EB850000EB850000EB850000EB85
          0000EB850000EB850000EB850000EB850000EB850000EB850000EB850000EB85
          0000EB850000EB850000EB850000F7910000FF9900000000000000000000FF99
          0000FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC
          9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC
          9900FFCC9900FFCC9900FFCC9900FFAD3D00FF9900000000000000000000FF99
          0000FF990000FF990000FF990000FF990000FF990000FF990000FF990000FF99
          0000FF990000FF990000FF990000FF990000FF990000FF990000FF990000FF99
          0000FF990000FF990000FF990000FF990000FF99000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        MaskColor = clBlack
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000034
          DE00827D72006C6B6B006363630000000000000000000000000000000000FF99
          0000FF990000FF990000FF990000FF990000FF990000FF990000FF990000FF99
          0000FF990000FF990000FF990000FF990000FF990000FF990000F9B759000645
          FF004E85E600E5DACF0085745900FFAB2D00FF9900000000000000000000FF99
          0000FFE5E500FFE6E600FFE6E600FFE6E600FFE6E600FFE6E600FFE5E500FFE3
          E300FFE2E200FFE1E100FFDFDF00FFDEDE00FFDCDC00F7E1E7000C4AFF00469C
          FF0064D7FF00659DE9008E878100FFCCCC00FF9900000000000000000000FF99
          0000FFE8E800FFE9E900FFE9E900FFE9E900FFE9E900FFE9E900FFE8E800FFE7
          E700FFE6E600FFE5E500FFE2E200FFE0E000F3DCE5000B49FF0049A2FF006FD9
          FF0057B7FF000F5AFF00DAB8C500FFCDCD00FF9900000000000000000000FF99
          0000FFEBEB00FFECEC00FFECEC00FFECEC00FFECEC00FFECEC00FFEFEF00FFEE
          EE00FBEAEA00FAE7E700FFEAEA00F1D8D700848185003B8CE1006EDDFF0056B4
          FF00195BFF00E3C2DA00FFD1D100FFCECE00FF9900000000000000000000FF99
          0000FFEFEF00FFF0F000FFF0F000FFF0F000FFF0F000FFF3F300CCC2C4008888
          8B007D7C79007F7D7A0088868A009F959600AEAAA500C0C7C200419AE9001456
          FF00E6C9DD00FFD5D500FFD2D200FFD0D000FF9900000000000000000000FF99
          0000FFF2F200FFF3F300FFF3F300FFF3F300FFF5F500A3A1A300B5AA9600F5D0
          9400FBD29300FBD39A00FCD79D00C2B4A00080838900C4C0BB0082808E00E9CE
          E000FFDADA00FFD7D700FFD4D400FFD1D100FF9900000000000000000000FF99
          0000FFF4F400FFF7F700FFF7F700FFF7F700DBD7D700AEA59300FCD79A00F1D1
          9B00EFD09900EECD9100F0CF9700FAD79F00C1B39E009A909100EAD1D000FFDE
          DE00FFDCDC00FFD9D900FFD5D500FFD2D200FF9900000000000000000000FF99
          0000FFF8F800FFF9F900FFFAFA00FFFAFA0094939700F4D8A200F5DDAA00F1DB
          AA00F1DBA900F0D4A200EFD09700F0CE9A00FEDAA3008F8C8F00FFE2E200FFDF
          DF00FFDDDD00FFDADA00FFD6D600FFD3D300FF9900000000000000000000FF99
          0000FFFAFA00FFFCFC00FFFDFD00FFFDFD0082828000FFE8B500F6E5BE00F7E7
          C000F5E2B800F3DDB100F1D6A500F0D09500FDDAA40086848300FFE8E800FFE1
          E100FFDEDE00FFDBDB00FFD7D700FFD4D400FF9900000000000000000000FF99
          0000FFFDFD00FFFFFF00FFFFFF00FFFFFF0084838300FFF3C800FCF5DC00FAF3
          D600F7ECC800F6E7BD00F3DCAD00F0D39E00FED9A10084838200FFEAEA00FFE1
          E100FFDEDE00FFDCDC00FFD9D900FFD5D500FF9900000000000000000000FF99
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00B4B5B600EFE6C500FFFFF000FEFE
          FC00FCF6DB00F7ECC700F6E1B300F3D7A400F4D8A400918E9200FFEAEA00FFE2
          E200FFDFDF00FFDCDC00FFD9D900FFD5D500FF9900000000000000000000FF99
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F3F300A5A39C00FFFFEC00FFFF
          F700FDF9E500F9EECC00F7E3B600FFE1A600A49D9100DBCBCC00FFEAEA00FFE2
          E200FFDFDF00FFDCDC00FFD9D900FFD5D500FF9900000000000000000000FF99
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEB00A5A49E00E8E3
          C700FFFCD300FFF2C200E9D5AB00A29C9400C8BFC100FFEDED00FFE6E600FFE2
          E200FFDFDF00FFDCDC00FFD9D900FFD5D500FF9900000000000000000000FF99
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F2F200A5A5
          A70080808300808181009A989B00E4DADA00FFECEC00FFE9E900FFE6E600FFE2
          E200FFDFDF00FFDCDC00FFD9D900FFD5D500FF9900000000000000000000FF99
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
          FC00FFFAFA00FFF8F800FFF3F300FFF0F000FFECEC00FFE9E900FFE6E600FFE2
          E200FFDFDF00FFDCDC00FFD9D900FFD5D500FF9900000000000000000000FF99
          0000CFCDCD00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCDCD00CFCB
          CB00CFC9C900CFC7C700CFC4C400CFC2C200CFC0C000CFBDBD00CFBBBB00CFB8
          B800CFB6B600CFB3B300CFB1B100CFAFAF00FF9900000000000000000000FF99
          0000FFAD3D00FF990000FF990000FF990000FF990000FF990000FF990000FF99
          0000FF990000FF990000FF990000FF990000FF990000FF990000FF990000FF99
          0000FF990000FF990000FF990000FF990000FF9900000000000000000000FF99
          0000FFCC9900EB850000EB850000EB850000EB850000EB850000EB850000EB85
          0000EB850000EB850000EB850000EB850000EB850000EB850000EB850000EB85
          0000EB850000EB850000EB850000F7910000FF9900000000000000000000FF99
          0000FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC
          9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC
          9900FFCC9900FFCC9900FFCC9900FFAD3D00FF9900000000000000000000FF99
          0000FF990000FF990000FF990000FF990000FF990000FF990000FF990000FF99
          0000FF990000FF990000FF990000FF990000FF990000FF990000FF990000FF99
          0000FF990000FF990000FF990000FF990000FF99000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        MaskColor = clBlack
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C6C6
          C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C6C6
          C60084848400848484008484840084848400C6C6C600FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C6C6
          C60084848400008400000084000084848400C6C6C600FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C6C6
          C60084848400008400000084000084848400C6C6C600FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C6C6
          C60084848400008400000084000084848400C6C6C600FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
          C60084848400008400000084000084848400C6C6C600C6C6C600C6C6C600C6C6
          C600C6C6C600C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00C6C6C600848484008484840084848400848484008484
          8400848484000084000000840000848484008484840084848400848484008484
          840084848400C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00C6C6C600008400000084000000840000008400000084
          0000008400000084000000840000008400000084000000840000008400000084
          000000840000C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000FF0000008400000084000000840000008400000084
          0000008400000084000000840000008400000084000000840000008400000084
          00000084000000FF0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000FF0000008400000084000000840000008400000084
          0000008400000084000000840000008400000084000000840000008400000084
          00000084000000FF0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000FF000000FF000000FF000000FF000000FF000000FF
          00000084000000840000008400000084000000FF000000FF000000FF000000FF
          000000FF000000FF0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FF
          00000084000000840000008400000084000000FF0000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FF
          00000084000000840000008400000084000000FF0000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FF
          00000084000000840000008400000084000000FF0000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FF
          00000084000000840000008400000084000000FF0000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FF
          000000FF000000FF000000FF000000FF000000FF0000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        MaskColor = clFuchsia
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF008484840000000000000000000000
          000000000000000000000000000000000000000000000000000084848400FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00848484008484840084848400848484008484840000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
          FF0000000000848484000000000084848400000000008484840000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
          FF0000000000848484000000000084848400000000008484840000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
          FF0000000000848484000000000084848400000000008484840000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
          FF0000000000848484000000000084848400000000008484840000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
          FF0000000000848484000000000084848400000000008484840000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
          FF0000000000848484000000000084848400000000008484840000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00
          FF0000000000FF00FF000000000084848400000000008484840000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0084848400848484008484840000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF008484840000000000000000000000
          000000000000000000000000000000000000000000000000000084848400FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF008484840084848400848484008484840000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF008484840000000000000000000000
          000000000000000000000000000000000000000000000000000084848400FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        MaskColor = clFuchsia
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000008A0000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000087000000880000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000008200000B8D180000840000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000083
          00000E911B0044E17E0000820000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000008800001097
          1D004AEB86003ED0720000810000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000008B0000129B1F004DEA
          870047E47E003AC16900007B0000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000008D000015A1220052F08C0049E3
          7E0048E57D0038B663000B8C15001491250015902400148F2300128E2200118E
          2100108A1E00128C2100148F2600007501000000000000000000000000000000
          00000000000000000000000000000094000017A5270056F490004DE6820048E1
          7B0049E37D003CBA67003EBF6D003EC06E003DBF6D003CC06C003BC06B003ABF
          6C003ABE6B0039C06A003CC37200057807000000000000000000000000000000
          00000000000000000000009400001AAC2C005AF7940050E984004DE680004CE5
          7F0049E37C004AE67E004AE67D0047E47B0046E37A0046E2790043DF770042DE
          760042DE75003FDC740041D87A00047904000000000000000000000000000000
          000000000000009A00001EB3320062FB9A0052ED870051EA84004EE781004DE6
          80004CE57F004AE37D0049E27C0048E27B0046DF790045DE780044DE770042DB
          750041DA740041DC750046DD7D00017A03000000000000000000000000000000
          00000098000026C13F0081FFB40071F49D0051ED850052EB850051EA84004FE8
          82004EE781004DE680004BE47E004AE37D0049E27C0047E07A0046DF790045DE
          780043DC760042DC760049E48300037C04000000000000000000000000000000
          0000009A00002BC847009DFFC80095F8B80052EF870053EE880053EC860052EB
          850051EA84004FE882004EE781004CE57F004BE47E004AE37D0048E17B0047E0
          7A0046DF790044DD77004CEA8700058107000000000000000000000000000000
          00000000000000A2000020BF39009AFFC40098F9BA0053F1890054EF890054ED
          870053EC860052EB85004EE982004CE8800049E67D0049E57D0048E47C0047E3
          7C0045E17A0046E07A004EEA870006880A000000000000000000000000000000
          0000000000000000000000A200001CBD30009AFFC4009CFABC0056F28B0055F0
          890055EE880051ED860065EF930070EE9A006BED97006AEC940066E9920065E8
          910062E88F005BE789004EED8900068C0B000000000000000000000000000000
          000000000000000000000000000000A6000019BD2D009AFFC4009EFBBF0058F3
          8B0055F1890054F38A0098FCBC00A0FCC30099FCBE0096FBBC0091F9B8008DF8
          B50089F6B20089F6B30068FAA30008910D000000000000000000000000000000
          00000000000000000000000000000000000000A9000016BA2A0098FFC5009FFD
          BF0074F7A10057F48C0012A61E0015AB240014AA250015A9240014A9240012A6
          220013A6220013A6220017A82800018C03000000000000000000000000000000
          0000000000000000000000000000000000000000000000AB000015B8260097FF
          C300B3FFCF0059F78F0000850000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000AF000013B8
          24009FFFCB0064FF9C0000930000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000000B3
          000016B9260070FFAB0000980000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000B1000019BA2600009F0000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000BB000000A30000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000C80000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        MaskColor = clBlack
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00848484000000
          000000000000000000008484840000000000FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
          FF00FF00FF0084848400000000000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000084848400FF00FF00FF00
          FF00FF00FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF008484840000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FFFFFF000000000084848400FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000000084848400FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF008484840000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FFFFFF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FFFFFF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF008484840000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF008484840000000000FFFFFF00FFFFFF00FF00
          FF00FF00FF00FF00FF00FF00FF000000000084848400FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000084848400FFFFFF00FFFF
          FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
          FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00848484000000
          0000000000000000000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        MaskColor = clFuchsia
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF008484840084848400848484008484
          8400848484008484840084848400848484008484840084848400848484008484
          840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
          000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0000000000000000000000
          0000000000000000000000000000000000000000000000000000FFFFFF000000
          000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
          000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0000000000000000000000
          000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
          000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
          000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0099362F0099362F009936
          2F0099362F0099362F0099362F0099362F0099362F0099362F00FFFFFF000000
          000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
          000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0099362F0099362F009936
          2F0099362F0099362F0099362F0099362F00FFFFFF00FFFFFF00FFFFFF000000
          000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
          000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0000000000000000000000
          0000000000000000000000000000000000000000000000000000FFFFFF000000
          000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
          000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        MaskColor = clFuchsia
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00008000000080000000800000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000800000008000000080000000800000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000080
          00000080000000800000008000000080000000800000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00008000000080
          00000080000000800000FF00FF000080000000800000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000800000008000000080
          000000800000FF00FF00FF00FF00008000000080000000800000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000080000000800000008000000080
          0000FF00FF00FF00FF00FF00FF00FF00FF000080000000800000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00008000000080000000800000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00008000000080000000800000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000080000000800000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000080000000800000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000800000008000000080
          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00008000000080
          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00008000000080
          000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000080
          000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000080
          000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        MaskColor = clFuchsia
      end>
  end
end
