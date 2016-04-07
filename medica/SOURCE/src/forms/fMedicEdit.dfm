object frmMedicEdit: TfrmMedicEdit
  Left = 0
  Top = 0
  AutoSize = True
  BorderStyle = bsToolWindow
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1073#1098#1077#1082#1090#1072' '#1091#1095#1077#1090#1072
  ClientHeight = 566
  ClientWidth = 491
  Color = clBtnFace
  Constraints.MaxHeight = 590
  Constraints.MinHeight = 380
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 491
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 491
      end>
    EdgeBorders = [ebTop, ebBottom]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 482
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 60
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton2: TToolButton
        Left = 0
        Top = 0
        Action = acSave
      end
      object ToolButton5: TToolButton
        Left = 60
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 68
        Top = 0
        Action = acAdd
      end
      object ToolButton4: TToolButton
        Left = 128
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 136
        Top = 0
        Action = acCancel
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 44
    Width = 491
    Height = 522
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1054#1073#1097#1080#1077
      object paNames: TPanel
        Left = 0
        Top = 0
        Width = 483
        Height = 494
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object grbNames: TGroupBox
          Left = 0
          Top = 25
          Width = 483
          Height = 170
          Align = alTop
          TabOrder = 0
          DesignSize = (
            483
            170)
          object Label1: TLabel
            Left = 40
            Top = 19
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 15
            Top = 96
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1056#1051#1057':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 46
            Top = 121
            Width = 47
            Height = 13
            Hint = #1064#1090#1088#1080#1093'-'#1082#1086#1076
            Alignment = taRightJustify
            Caption = #1050#1086#1076' EAN:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object lblNameLat: TLabel
            Left = 11
            Top = 47
            Width = 82
            Height = 13
            Alignment = taRightJustify
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077' ('#1083#1072#1090'.):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label13: TLabel
            Left = 14
            Top = 73
            Width = 79
            Height = 13
            Hint = #1052#1077#1078#1076#1091#1085#1072#1088#1086#1076#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1072
            Alignment = taRightJustify
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077' ('#1052#1053'):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Bevel1: TBevel
            Left = 447
            Top = 42
            Width = 21
            Height = 21
            Anchors = [akTop, akRight]
            ExplicitLeft = 407
          end
          object Bevel2: TBevel
            Left = 447
            Top = 16
            Width = 21
            Height = 21
            Anchors = [akTop, akRight]
            ExplicitLeft = 407
          end
          object Label8: TLabel
            Left = 7
            Top = 145
            Width = 82
            Height = 13
            Hint = #1064#1090#1088#1080#1093'-'#1082#1086#1076
            Alignment = taRightJustify
            Caption = #1057#1086#1082#1088'. '#1085#1072#1079#1074#1072#1085#1080#1077':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object bbEqual: TBitBtn
            Left = 447
            Top = 92
            Width = 21
            Height = 21
            Action = aEqual
            Anchors = [akTop, akRight]
            ParentShowHint = False
            ShowHint = False
            TabOrder = 4
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00848484000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000084848400FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF000000000084848400FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF000000000084848400FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF000000000084848400FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400FF00
              FF00FF00FF00FF00FF00FF00FF00FFFFFF000000000000000000000000000000
              0000FF00FF00FFFFFF00FFFFFF0000840000008400000000000084848400FF00
              FF00FF00FF00FF00FF00FF00FF00FFFFFF00000084000000FF000000FF000000
              840000000000FF00FF00FFFFFF0000840000008400000000000084848400FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000084000000FF000000FF000000
              FF000000840000000000FF00FF00FFFFFF00FFFFFF0000000000848484008484
              840084848400848484008484840084848400000084000000FF000000FF000000
              FF000000FF000000840000000000848484008484840084848400FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000084000000FF000000
              FF000000FF000000FF000000840000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000084000000
              FF000000FF000000FF000000FF000000840000000000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
              84000000FF000000FF000000840000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00000084000000840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0000008400FF00FF00FF00FF00FF00FF00FF00FF00}
          end
          object edEanCode: TEdit
            Left = 95
            Top = 116
            Width = 374
            Height = 21
            Hint = #1064#1090#1088#1080#1093'-'#1082#1086#1076
            Anchors = [akLeft, akTop, akRight]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
          end
          object bbChoseRlsPrep: TBitBtn
            Left = 95
            Top = 92
            Width = 347
            Height = 21
            Hint = #1042#1099#1073#1086#1088' '#1085#1072#1079#1074#1072#1085#1080#1103' '#1087#1088#1077#1087#1072#1088#1072#1090#1072' '#1056#1083#1089
            Anchors = [akLeft, akTop, akRight]
            Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074' '#1056#1051#1057' >>'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = bbChoseRlsPrepClick
          end
          object edNameLat: TEdit
            Left = 95
            Top = 42
            Width = 352
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1024
            TabOrder = 1
          end
          object edNameInternational: TEdit
            Left = 95
            Top = 68
            Width = 374
            Height = 21
            Hint = #1052#1077#1078#1076#1091#1085#1072#1088#1086#1076#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1072
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1024
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object edName: TEdit
            Left = 95
            Top = 16
            Width = 352
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 1024
            TabOrder = 0
            OnChange = edNameChange
          end
          object rbuRusName: TRadioButton
            Left = 450
            Top = 19
            Width = 17
            Height = 17
            Hint = #1055#1077#1095#1072#1090#1072#1090#1100' '#1085#1072' '#1086#1090#1095#1077#1090#1072#1093' '#1088#1091#1089#1089#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1072
            Anchors = [akTop, akRight]
            Checked = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            TabStop = True
          end
          object rbuLatName: TRadioButton
            Left = 450
            Top = 45
            Width = 17
            Height = 17
            Hint = #1055#1077#1095#1072#1090#1072#1090#1100' '#1085#1072' '#1086#1090#1095#1077#1090#1072#1093' '#1083#1072#1090#1080#1085#1089#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1072
            Anchors = [akTop, akRight]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
          end
          object chbIsEquipment: TCheckBox
            Left = 95
            Top = 71
            Width = 97
            Height = 17
            Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
            TabOrder = 8
            Visible = False
          end
          object edShortName: TEdit
            Left = 95
            Top = 142
            Width = 374
            Height = 21
            Hint = #1057#1086#1082#1088#1072#1097#1077#1085#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1086#1073#1100#1077#1082#1090#1072' '#1091#1095#1077#1090#1072
            Anchors = [akLeft, akTop, akRight]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
          end
        end
        object grbEI: TGroupBox
          Left = 0
          Top = 421
          Width = 483
          Height = 147
          Align = alTop
          TabOrder = 1
          DesignSize = (
            483
            147)
          object Label11: TLabel
            Left = 38
            Top = 88
            Width = 55
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #1052#1072#1089#1089#1072' '#1051#1092':'
          end
          object Label12: TLabel
            Left = 38
            Top = 112
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = #1045#1076'. '#1084#1072#1089#1089#1099':'
            WordWrap = True
          end
          object Label9: TLabel
            Left = 20
            Top = 65
            Width = 73
            Height = 13
            Hint = #1060#1072#1089#1086#1074#1086#1095#1085#1099#1077' '#1077#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
            Alignment = taRightJustify
            AutoSize = False
            Caption = #1060#1072#1089'. '#1077#1076'. '#1080#1079#1084'.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label10: TLabel
            Left = 4
            Top = 41
            Width = 130
            Height = 13
            Hint = #1050#1086#1083'-'#1074#1086' '#1092#1072#1089#1086#1074#1086#1095#1085#1099#1093' '#1077#1076#1080#1085#1080#1094' '#1074' '#1091#1087#1072#1082#1086#1074#1086#1095#1085#1086#1081
            Alignment = taRightJustify
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = #1050#1086#1083'-'#1074#1086' '#1092#1072#1089'. '#1074' '#1091#1087'.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            ExplicitWidth = 89
          end
          object Label4: TLabel
            Left = 17
            Top = 16
            Width = 76
            Height = 13
            Hint = #1059#1087#1072#1082#1086#1074#1086#1095#1085#1099#1077' '#1077#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
            Alignment = taRightJustify
            Caption = #1059#1087#1072#1082'. '#1077#1076'. '#1080#1079#1084'.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object lcbMassUnits: TDBLookupComboBox
            Left = 95
            Top = 108
            Width = 375
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DropDownRows = 15
            KeyField = 'FK_ID'
            ListField = 'FC_SHORTNAME'
            ListSource = dmMain.dsMassUnits
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
          object cbFEdizm: TDBLookupComboBox
            Left = 95
            Top = 61
            Width = 375
            Height = 21
            Hint = #1060#1072#1089#1086#1074#1086#1095#1085#1099#1077' '#1077#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
            Anchors = [akLeft, akTop, akRight]
            DropDownRows = 15
            KeyField = 'EIID'
            ListField = 'FC_NAME'
            ListSource = dsFEdizm
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object cbUEdIzm: TDBLookupComboBox
            Left = 95
            Top = 12
            Width = 375
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DropDownRows = 15
            KeyField = 'EIID'
            ListField = 'FC_NAME'
            ListSource = dmMain.dsEI
            TabOrder = 0
          end
          object seKolFinU: TcxSpinEdit
            Left = 95
            Top = 37
            Hint = #1050#1086#1083'-'#1074#1086' '#1092#1072#1089#1086#1074#1086#1095#1085#1099#1093' '#1077#1076#1080#1085#1080#1094' '#1074' '#1091#1087#1072#1082#1086#1074#1086#1095#1085#1086#1081
            Anchors = [akLeft, akTop, akRight]
            ParentShowHint = False
            Properties.ValueType = vtFloat
            ShowHint = True
            Style.BorderStyle = ebs3D
            Style.ButtonStyle = bts3D
            TabOrder = 1
            OnClick = seKolFinUChange
            Width = 375
          end
          object seMass: TcxSpinEdit
            Left = 95
            Top = 84
            Anchors = [akLeft, akTop, akRight]
            ParentShowHint = False
            Properties.ValueType = vtFloat
            ShowHint = True
            Style.BorderStyle = ebs3D
            Style.ButtonStyle = bts3D
            TabOrder = 4
            OnClick = seKolFinUChange
            Width = 375
          end
        end
        object paLevel: TPanel
          Left = 0
          Top = 295
          Width = 483
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          Visible = False
          DesignSize = (
            483
            25)
          object Label5: TLabel
            Left = 0
            Top = 5
            Width = 90
            Height = 13
            Caption = #1059#1088#1086#1074#1077#1085#1100' '#1076#1086#1089#1090#1091#1087#1072':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object cbLevel: TDBLookupComboBox
            Left = 95
            Top = 1
            Width = 374
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DropDownRows = 15
            KeyField = 'FK_ID'
            ListField = 'FC_NAME'
            ListSource = dmMain.dsLevel
            TabOrder = 0
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 568
          Width = 483
          Height = 31
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          DesignSize = (
            483
            31)
          object cbLgota: TCheckBox
            Left = 10
            Top = 7
            Width = 73
            Height = 17
            Alignment = taLeftJustify
            Caption = #1051#1100#1075#1086#1090#1085#1099#1081
            TabOrder = 0
          end
          object chbUpdate_Visible_For_Not_Apteka: TCheckBox
            Left = 325
            Top = 7
            Width = 143
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074#1085#1077' '#1072#1087#1090#1077#1082#1080
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object chbFormular: TCheckBox
            Left = 160
            Top = 7
            Width = 73
            Height = 17
            Alignment = taLeftJustify
            Caption = #1060#1086#1088#1084#1091#1083#1103#1088
            TabOrder = 2
          end
          object chbJNVLS: TCheckBox
            Left = 89
            Top = 7
            Width = 65
            Height = 17
            Alignment = taLeftJustify
            Caption = #1046#1053#1042#1051#1055
            TabOrder = 3
          end
        end
        object paQuotaCode234: TPanel
          Left = 0
          Top = 0
          Width = 483
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 4
          object Label14: TLabel
            Left = 35
            Top = 7
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = #1050#1086#1076' '#1082#1074#1086#1090#1099':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object medQuotaCode: TcxMaskEdit
            Left = 95
            Top = 4
            Properties.AlwaysShowBlanksAndLiterals = True
            Properties.EditMask = '00-00;0;_'
            Properties.MaxLength = 0
            Style.BorderStyle = ebs3D
            TabOrder = 0
            Text = '0000'
            Width = 102
          end
        end
        object paFarmGr: TPanel
          Left = 0
          Top = 195
          Width = 483
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 5
          DesignSize = (
            483
            25)
          object Label2: TLabel
            Left = 17
            Top = 8
            Width = 74
            Height = 13
            Caption = #1060#1072#1088#1084'. '#1075#1088#1091#1087#1087#1072':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object cbFarmGr: TDBLookupComboBox
            Left = 95
            Top = 4
            Width = 374
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DropDownRows = 15
            KeyField = 'FARMGRID'
            ListField = 'FC_FARMGR'
            ListSource = dmMain.dsFarmGr
            TabOrder = 0
          end
        end
        object paGROUP_LF: TPanel
          Left = 0
          Top = 245
          Width = 483
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 6
          Visible = False
          DesignSize = (
            483
            25)
          object lbGROUP_LF: TLabel
            Left = 30
            Top = 6
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = #1043#1088#1091#1087#1087#1072' '#1051#1060':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object cbGROUP_LF: TDBLookupComboBox
            Left = 95
            Top = 2
            Width = 374
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DropDownRows = 15
            KeyField = 'FK_GROUP_LF_ID'
            ListField = 'FC_GROUP_LF'
            ListSource = dmMain.dsGROUP_LF
            TabOrder = 0
            OnClick = cbGROUP_LFClick
          end
        end
        object paUchGr: TPanel
          Left = 0
          Top = 220
          Width = 483
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 7
          object Label3: TLabel
            Left = 7
            Top = 7
            Width = 82
            Height = 13
            Caption = #1059#1095#1077#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object peUchGr: TcxPopupEdit
            Tag = -1
            Left = 95
            Top = 3
            Properties.PopupAutoSize = False
            Properties.PopupControl = tlUchGr
            Properties.PopupWidth = 374
            Style.BorderStyle = ebs3D
            TabOrder = 0
            Width = 374
          end
        end
        object paATC: TPanel
          Left = 0
          Top = 270
          Width = 483
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 8
          DesignSize = (
            483
            25)
          object Label15: TLabel
            Left = 29
            Top = 6
            Width = 60
            Height = 13
            Caption = #1040#1058#1061'-'#1082#1083#1072#1089#1089'.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object peATC: TcxPopupEdit
            Tag = -1
            Left = 95
            Top = 3
            Anchors = [akLeft, akTop, akRight]
            Properties.PopupAutoSize = False
            Properties.PopupControl = tlATC
            Properties.PopupWidth = 360
            Style.BorderStyle = ebs3D
            TabOrder = 0
            Width = 374
          end
        end
        object paProdcert: TPanel
          Left = 0
          Top = 371
          Width = 483
          Height = 50
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 9
          object lblProducer: TLabel
            Left = 9
            Top = 4
            Width = 82
            Height = 13
            Alignment = taRightJustify
            Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100':'
          end
          object lblCertificate: TLabel
            Left = 27
            Top = 31
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090':'
          end
          object edProducer: TJvComboEdit
            Left = 95
            Top = 1
            Width = 359
            Height = 21
            ButtonWidth = 16
            ClickKey = 32
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImageKind = ikEllipsis
            ParentFont = False
            TabOrder = 0
            OnButtonClick = edProducerButtonClick
          end
          object edCertificate: TJvComboEdit
            Left = 95
            Top = 28
            Width = 359
            Height = 21
            ButtonWidth = 16
            ClickKey = 32
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImageKind = ikEllipsis
            ParentFont = False
            TabOrder = 1
            OnButtonClick = edProducerButtonClick
          end
        end
        object paClass: TPanel
          Left = 0
          Top = 320
          Width = 483
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 10
          Visible = False
          object Label16: TLabel
            Left = 55
            Top = 4
            Width = 34
            Height = 13
            Caption = #1050#1083#1072#1089#1089':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object cbClass: TcxComboBox
            Left = 95
            Top = 1
            Properties.ImmediatePost = True
            Properties.Items.Strings = (
              ''
              '1'
              '2'#1072
              '2'#1073
              '3')
            Style.BorderStyle = ebs3D
            TabOrder = 0
            Width = 359
          end
        end
        object paOKDP: TPanel
          Left = 0
          Top = 345
          Width = 483
          Height = 26
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 11
          object Label17: TLabel
            Left = 34
            Top = 4
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = #1050#1086#1076' '#1054#1050#1044#1055':'
          end
          object edOKDP: TJvComboEdit
            Tag = -1
            Left = 95
            Top = 1
            Width = 359
            Height = 21
            ButtonWidth = 16
            ClickKey = 32
            DirectInput = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImageKind = ikEllipsis
            ParentFont = False
            TabOrder = 0
            OnButtonClick = edOKDPButtonClick
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      ImageIndex = 1
      object paDescription: TPanel
        Left = 0
        Top = 0
        Width = 483
        Height = 494
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object gbDescription: TGroupBox
          Left = 0
          Top = 249
          Width = 483
          Height = 105
          Align = alTop
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
          TabOrder = 2
          DesignSize = (
            483
            105)
          object edComment: TMemo
            Left = 8
            Top = 15
            Width = 468
            Height = 84
            Anchors = [akLeft, akTop, akRight, akBottom]
            MaxLength = 3999
            TabOrder = 0
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 483
          Height = 57
          Align = alTop
          Caption = #1053#1072#1088#1082#1086#1090#1080#1095#1077#1089#1082#1080#1077', '#1089#1080#1083#1100#1085#1086#1076#1077#1081#1089#1090#1074'. '#1080' '#1103#1076#1086#1074#1080#1090#1099#1077' '#1074#1077#1097'-'#1074#1072':'
          TabOrder = 0
          DesignSize = (
            483
            57)
          object lcbNarco: TDBLookupComboBox
            Left = 16
            Top = 24
            Width = 459
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DropDownRows = 15
            KeyField = 'FK_ID'
            ListField = 'FC_NAME'
            ListSource = dmMain.dsNarco
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 57
          Width = 483
          Height = 192
          Align = alTop
          Caption = #1057#1086#1089#1090#1072#1074
          TabOrder = 1
          DesignSize = (
            483
            192)
          object cxGridMedicItems: TcxGrid
            Left = 2
            Top = 15
            Width = 401
            Height = 175
            Align = alLeft
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object cxGridMedicItemsDBTableView1: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsMedicItems
              DataController.Filter.MaxValueListCount = 1000
              DataController.KeyFieldNames = 'fk_mediccomplexid'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              Filtering.ColumnPopup.MaxDropDownItemCount = 12
              OptionsBehavior.CellHints = True
              OptionsBehavior.IncSearch = True
              OptionsSelection.HideFocusRectOnExit = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              OptionsView.GroupFooters = gfVisibleWhenExpanded
              Preview.AutoHeight = False
              Preview.MaxLineCount = 2
              Styles.ContentEven = dmMain.cxStyleGridEvenRow
              Styles.ContentOdd = dmMain.cxStyleGridOddRow
              Styles.Selection = dmMain.cxStyleGridSelectedRow
              object cxGridMedicItemsDBTableView1FN_ORDER: TcxGridDBColumn
                Caption = #1055#1086#1088#1103#1076#1086#1082
                DataBinding.FieldName = 'FN_ORDER'
                PropertiesClassName = 'TcxSpinEditProperties'
                Properties.ImmediatePost = True
                Properties.MinValue = 1.000000000000000000
                Properties.ValueType = vtInt
                Properties.OnChange = cxGridMedicItemsDBTableView1FN_ORDERPropertiesChange
                Properties.OnEditValueChanged = cxGridMedicItemsDBTableView1FN_ORDERPropertiesEditValueChanged
                Options.Filtering = False
                Width = 37
              end
              object cxGridMedicItemsDBTableView1FC_MEDIC: TcxGridDBColumn
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'FC_MEDIC'
                PropertiesClassName = 'TcxMaskEditProperties'
                Properties.Alignment.Horz = taLeftJustify
                Properties.MaxLength = 255
                Properties.ReadOnly = True
                Options.Editing = False
                Options.Filtering = False
                Width = 191
              end
              object cxGridMedicItemsDBTableView1FC_EI: TcxGridDBColumn
                Caption = #1045#1076'.  '#1080#1079#1084'.'
                DataBinding.FieldName = 'FC_EI'
                PropertiesClassName = 'TcxTextEditProperties'
                Options.Editing = False
                Options.Filtering = False
                Width = 42
              end
              object cxGridMedicItemsDBTableView1FN_AMOUNT: TcxGridDBColumn
                Caption = #1050#1086#1083'-'#1074#1086
                DataBinding.FieldName = 'FN_AMOUNT'
                PropertiesClassName = 'TcxSpinEditProperties'
                Properties.DisplayFormat = '### ### ##0.##########'
                Properties.ValueType = vtFloat
                Options.Filtering = False
                Width = 58
              end
              object cxGridMedicItemsDBTableView1FL_TARA: TcxGridDBColumn
                Caption = #1058#1072#1088#1072
                DataBinding.FieldName = 'FL_TARA'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ImmediatePost = True
                Properties.ValueChecked = 1
                Properties.ValueUnchecked = 0
                Width = 34
              end
            end
            object cxGridMedicItemsLevel1: TcxGridLevel
              GridView = cxGridMedicItemsDBTableView1
            end
          end
          object btAddMedicItems: TButton
            Left = 414
            Top = 29
            Width = 60
            Height = 25
            Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1086#1089#1090#1072#1074
            Anchors = [akTop, akRight]
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btAddMedicItemsClick
          end
          object btDelMedicItems: TButton
            Left = 414
            Top = 135
            Width = 60
            Height = 25
            Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1089#1086#1089#1090#1072#1074#1072
            Anchors = [akRight, akBottom]
            Caption = #1059#1076#1072#1083#1080#1090#1100
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = btDelMedicItemsClick
          end
        end
      end
    end
  end
  object tlATC: TcxDBTreeList
    Left = 227
    Top = 50
    Width = 210
    Height = 31
    Bands = <
      item
      end>
    BufferedPaint = False
    DataController.DataSource = dmMain.dsATC
    DataController.ParentField = 'PARENTID'
    DataController.KeyField = 'ID'
    OptionsBehavior.ExpandOnIncSearch = True
    OptionsBehavior.IncSearch = True
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsView.ColumnAutoWidth = True
    OptionsView.Headers = False
    RootValue = -1
    TabOrder = 2
    Visible = False
    OnDblClick = tlATCDblClick
    OnKeyPress = tlATCKeyPress
    object tlATCNAME: TcxDBTreeListColumn
      DataBinding.FieldName = 'NAME'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object tlUchGr: TcxDBTreeList
    Left = 236
    Top = 56
    Width = 210
    Height = 31
    Bands = <
      item
      end>
    BufferedPaint = False
    DataController.DataSource = dmMain.dsUchGr
    DataController.ParentField = 'PARENTID'
    DataController.KeyField = 'UCHGRID'
    OptionsBehavior.ExpandOnIncSearch = True
    OptionsBehavior.IncSearch = True
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsView.ColumnAutoWidth = True
    OptionsView.Headers = False
    RootValue = 0
    TabOrder = 3
    Visible = False
    OnDblClick = tlUchGrDblClick
    OnKeyPress = tlUchGrKeyPress
    object tlUchGrFC_UCHGR: TcxDBTreeListColumn
      DataBinding.FieldName = 'FC_UCHGR'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 224
    Top = 8
    object acSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1080' '#1079#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acSaveExecute
    end
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1080' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1077#1097#1077' '#1086#1076#1085#1091' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 21
      ShortCut = 16397
      OnExecute = acAddExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' '#1073#1077#1079' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCancelExecute
    end
    object aEqual: TAction
      Hint = #1047#1072#1088#1086#1074#1085#1103#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1103
      ImageIndex = 28
      OnExecute = aEqualExecute
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmMedicEdit\'
    StoredProps.Strings = (
      'paDescription.Height')
    StoredValues = <>
    Left = 212
    Top = 416
  end
  object odsFEdizm: TOracleDataSet
    SQL.Strings = (
      'select tei.*'
      'from med.V$tEI tei'
      'where tei.eiid > 0'
      '  ORDER BY tei.FC_NAME')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000004000000454949440100000000000700000046435F4E414D
      450100000000000700000046435F4F4B4549010000000000}
    Session = dmMain.os
    Left = 310
    Top = 8
  end
  object dsFEdizm: TDataSource
    DataSet = odsFEdizm
    Left = 280
    Top = 8
  end
  object dsMedicItems: TDataSource
    DataSet = odsMedicItems
    Left = 192
    Top = 196
  end
  object odsMedicItems: TOracleDataSet
    SQL.Strings = (
      'select'
      #9'mc.rowid,'
      #9'm.medicid,'
      #9'm.fc_name as fc_medic,'
      #9'e.fc_name as fc_ei,'
      #9'mc.fn_amount,'
      '       mc.fl_tara,'
      #9'mc.fk_medicitem,'
      '       mc.FN_ORDER,'
      '       mc.fk_mediccomplexid'
      ''
      'from'
      #9'MED.tmedic m,'
      #9'MED.tei e,'
      #9'MED.tmedicomplex mc'
      'where m.EIID = e.EIID'
      #9'and mc.fk_medicitem = m.medicid'
      #9'and mc.fk_medic = :FK_MEDIC'
      'order by mc.FN_ORDER, UPPER(m.fc_name), UPPER(e.fc_name)')
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A464B5F4D454449430300000004000000954900
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000070000004D45444943494401000000000009000000464E5F
      414D4F554E540100000000000800000046435F4D454449430100000000000500
      000046435F45490100000000000C000000464B5F4D454449434954454D010000
      00000008000000464E5F4F52444552010000000000}
    Cursor = crSQLWait
    UpdatingTable = 'med.tmedicomplex'
    Session = dmMain.os
    Left = 110
    Top = 194
  end
  object odsMedicRLS: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '       RLS.Get_ActmattersList(:FK_NOMEN_RLS) NDV,'
      ''
      '       (SELECT VPREPRLS.RESULT || VNOMENRLS.RESULT AS FC_PREP'
      '        FROM  RLS.VPREPRLS, RLS.VNOMENRLS'
      '        WHERE VNOMENRLS.FK_ID = :FK_NOMEN_RLS'
      '          AND VNOMENRLS.FK_PREP = VPREPRLS.FK_ID(+)) as FC_PREP,'
      '       '
      
        '       (select FL_VISIBLE_FOR_NOT_APTEKA from med.tmedic where m' +
        'edicid = :medicid) as FL_VISIBLE_FOR_NOT_APTEKA'
      ''
      'FROM DUAL')
    Optimize = False
    Variables.Data = {
      03000000020000000D0000003A464B5F4E4F4D454E5F524C5303000000000000
      0000000000080000003A4D454449434944030000000000000000000000}
    Session = dmMain.os
    Left = 22
    Top = 182
  end
  object oqUpdate_Visible_For_Not_Apteka: TOracleQuery
    SQL.Strings = (
      'update med.tmedic '
      'set FL_VISIBLE_FOR_NOT_APTEKA = :FL_VISIBLE '
      'WHERE medicid = :medicid')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000020000000B0000003A464C5F56495349424C45030000000400000001
      00000000000000080000003A4D454449434944030000000000000000000000}
    Left = 352
    Top = 418
  end
  object oqFL_EQUIPMENT: TOracleQuery
    SQL.Strings = (
      'update med.tmedic '
      'set FL_EQUIPMENT = :pFL_EQUIPMENT '
      'WHERE medicid = :medicid')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000002000000080000003A4D454449434944030000000000000000000000
      0E0000003A50464C5F45515549504D454E54030000000000000000000000}
    Left = 350
    Top = 362
  end
end
