object frmOtmetki: TfrmOtmetki
  Left = 215
  Top = 96
  BorderStyle = bsDialog
  Caption = #1054#1090#1084#1077#1090#1082#1080' '#1088#1077#1085#1090#1075#1077#1085#1086#1083#1086#1075#1072
  ClientHeight = 369
  ClientWidth = 883
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 877
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 877
    Height = 332
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    OnClick = Panel2Click
    ExplicitLeft = 137
    ExplicitTop = 208
    ExplicitWidth = 875
    ExplicitHeight = 345
    object cxLabel3: TcxLabel
      Left = 145
      Top = 82
      Caption = #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      OnClick = cxLabel3Click
    end
    object cxResume: TcxRichEdit
      Left = 236
      Top = 82
      ParentFont = False
      PopupMenu = pmZakl
      Properties.MaxLength = 2500
      Properties.ScrollBars = ssVertical
      Style.BorderStyle = ebsOffice11
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Book Antiqua'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Office2007Green'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      OnClick = cxResumeClick
      Height = 66
      Width = 633
    end
    object cxLabel4: TcxLabel
      Left = 60
      Top = 156
      Caption = #1057#1086#1074#1087#1072#1076#1077#1085#1080#1077' '#1089' '#1085#1072#1087#1088'. DS-'#1086#1084':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      OnClick = cxLabel4Click
    end
    object cxLabel6: TcxLabel
      Left = 189
      Top = 180
      Caption = #1042#1088#1072#1095':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      OnClick = cxLabel6Click
    end
    object cxLabel7: TcxLabel
      Left = 188
      Top = 203
      Caption = #1044#1072#1090#1072':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      OnClick = cxLabel7Click
    end
    object cxDSsovpalo: TcxLookupComboBox
      Left = 236
      Top = 158
      Hint = #1043#1088#1091#1087#1087#1099' '#1076#1080#1072#1075#1085#1086#1079#1086#1074
      Properties.AutoSelect = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.HideSelection = False
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsDSsovpalo
      Properties.ReadOnly = False
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 2
      OnClick = cxDSsovpaloClick
      OnMouseDown = cxDSsovpaloMouseDown
      Width = 72
    end
    object cxSotr: TcxLookupComboBox
      Left = 236
      Top = 181
      Hint = #1043#1088#1091#1087#1087#1099' '#1076#1080#1072#1075#1085#1086#1079#1086#1074
      Properties.AutoSelect = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.HideSelection = False
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsSotr
      Properties.ReadOnly = False
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 3
      OnClick = cxSotrClick
      OnMouseDown = cxSotrMouseDown
      Width = 159
    end
    object cxDate: TcxDateEdit
      Left = 236
      Top = 205
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 4
      OnClick = cxDateClick
      OnMouseDown = cxDateMouseDown
      Width = 81
    end
    object bbResume: TcxButton
      Left = 201
      Top = 104
      Width = 25
      Height = 25
      Action = aResume
      TabOrder = 1
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000170AC00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000275B0000E88C0000275B000096EA1000174
        AF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000275B000279FDA001379B0005FE3FF0070EFFC005DD4
        E5000C699A000275B0000275B000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000275B0003FC7FF00147FBA001682BB0052D7FF006CEBFE007FFE
        FF0086FFFF008AFFFF005FD7E6000275B0000275B0000473AD00FF00FF00FF00
        FF000275B0003EC4FC003BC2FF00117DB6003FC4F80047CCFB0063E3FC007BF8
        FF007FFBFF0080FEFF007EFBFC001D84AF002DA5D9000679B400FF00FF000275
        B00056D9FF0048CCFB0042C5F800128BC5003FC4F8003FC4F8005ADCFB0077F4
        FF0082FFFF0073EDF3001D84AF0032B1ED000174AF00FF00FF000275B00076F4
        FF0064E5FE005DDEFB005FD7E6000377B1003BC1FE003ABFFA0051D4FB0072F2
        FF0064DCEA001D84AF0035B7F30038BDFB000174AF00FF00FF000275B0008BFF
        FF0077F3FE005FD7E6000375B0001C8EC700015703002EACE60048C9F40048BF
        DE002B9AC70051D4FA004FD3FE000174AF00FF00FF00FF00FF000275B0008EFF
        FF005FD7E6000070AD000172AC00006BA400015703000183BD000C8CC2005AD5
        E70075F6FF0001570300015703000D87BC00FF00FF00FF00FF000275B0005FD7
        E600006FAC000377B1000378B200006CA7000157030005730A0007A7E0006DEB
        F40084FFFF00015703000E78130001570300FF00FF00FF00FF000376B0000275
        B0000377B1000378B2000472AA0003669E0001570300047F0A00015703000157
        030001570300015703003CD56A00168B230001570300FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000378B2000379B4000279B4000157030006980F000793
        110011A022001FAF37002FC6550041E073001FA0350001570300FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00015703000378
        0400088E0C0013A1230022B63F0035D15D0023A5360001570300FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000157
        0300015703000157030016AA29001086160001570300FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0001570300056D000001570300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000157030001570300FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object memVyav: TcxMemo
      Left = 477
      Top = 158
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.BorderColor = clBlack
      StyleDisabled.BorderStyle = ebsOffice11
      StyleDisabled.Color = clWhite
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 9
      Height = 68
      Width = 392
    end
    object bbVyavleno: TcxButton
      Left = 446
      Top = 178
      Width = 26
      Height = 27
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1074#1072#1088#1080#1072#1085#1090#1099
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = bbVyavlenoClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000A6000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000008700009800000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000084000A9314009B0000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000081003FC4
        730B9315009C0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000007E003CC26E3FC1710D9617009F000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000750041D07340CA7142BF720E9B1800A300000000
        000000000000000000000000000000000000000000000000006E01097E10077E
        0F077E0E0B84160C86170D88180E89180D8A190C851448E37C49E87F44CD7244
        C073109E1B00AA00000000000000000000000000000000000000000000000000
        0378093FCB7736BE6739BF6A3AC06B3CBF6C3DBE6C3EBF6D3EBE6E3EBD6C3FC1
        6B4BE67F4DE98047D07647BF7513A21F00AC0000000000000000000000000000
        000000000000000001750454E6893AD76F3DDA7240DC7442DE7644E17846E37A
        48E57C4AE77E4AE67E4CE67F4CE67F51ED854AD37949BF7615A52100B0000000
        0000000000000000000000000000000000740464E79439D56E3ED77140D97342
        DB7544DD7746DF7948E17B4AE37D4DE6804DE6804FE88250EA8354F0874ED67C
        4CBF7818A92600B50000000000000000000000000000000000760472ECA03AD6
        6D40D97342DB7544DD7746DF7948E17B4AE37D4CE57F4EE7814FE88251EA8454
        ED8755EF8858F48C51DC804FC27D20B03100A900000000000000000000000000
        00780579EEA542D97441DA7443DC7645DE7848E17B4AE37D4CE57F4EE78150E9
        8352EB8553EC8655EE8856EF8959F38C5FFE9556CD8624B23800AA0000000000
        000000000000000000780578EFA64FDC7E3CDB7142DE7644E07845E27947E47B
        4BE77F4DE9814FEB8353ED8755EE8857F08A5AF38D5DF6926BFFA61EAF2D00B5
        000000000000000000000000000000000078057CEFA871E4985EE18961E38D67
        E7916AE9956BEB966FED9870EF9B75EF9E64F09457F18B59F28C5EF7936BFFA5
        22C13400B000000000000000000000000000000000000000017B0774F7A782F1
        AC85F2AF88F4B18CF6B48EF8B591F8B893FABA93FABAA3F9C075F49F58F38D5E
        F7936BFFA720BD3100AA00000000000000000000000000000000000000000000
        0075010C8A180A8915098A1510961F119922129B23139D24139E250C9A1C7FF7
        A865F4945CF7926BFFA61EB82C00AB0000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000770083F9AC5BFA936AFFA41BB62B00A9000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000810076FFA869FFA318B22700A600000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000086006DFFA915AD2200A40000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000008A0016B0
        2300A80000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000910000AA000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000B100000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object lbVyav: TcxLabel
      Left = 405
      Top = 156
      Caption = #1042#1099#1103#1074#1083#1077#1085#1086':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      OnClick = lbVyavClick
    end
    object cxLabel8: TcxLabel
      Left = 28
      Top = 238
      Caption = #1047#1072#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1099#1081' '#1076#1080#1072#1075#1085#1086#1079' '#1087#1086#1089#1083#1077':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      OnClick = cxLabel8Click
    end
    object cxDSposle: TcxLookupComboBox
      Left = 236
      Top = 239
      Hint = #1043#1088#1091#1087#1087#1099' '#1076#1080#1072#1075#1085#1086#1079#1086#1074
      Properties.AutoSelect = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.HideSelection = False
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsDSposle
      Properties.ReadOnly = False
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 13
      OnClick = cxDSposleClick
      OnMouseDown = cxDSposleMouseDown
      Width = 159
    end
    object cxLabel10: TcxLabel
      Left = 24
      Top = 264
      Caption = #1055#1072#1090#1086#1083#1086#1075#1086#1072#1085#1072#1090#1086#1084#1080#1095#1077#1089#1082#1080#1081' '#1076#1080#1072#1075#1085#1086#1079':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      OnClick = cxLabel10Click
    end
    object cxDSAnatom: TcxMemo
      Left = 236
      Top = 266
      Enabled = False
      Style.BorderStyle = ebsOffice11
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.BorderColor = clBtnText
      StyleDisabled.Color = clBtnHighlight
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.TextColor = clBtnText
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 15
      OnClick = cxDSAnatomClick
      Height = 57
      Width = 633
    end
    object cxLabel9: TcxLabel
      Left = 405
      Top = 238
      Caption = #1057#1086#1074#1087#1072#1076#1077#1085#1080#1077' '#1079#1072#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086#1075#1086' DS-'#1072' '#1089' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1077#1084':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      OnClick = cxLabel9Click
    end
    object cxResumesovpalo: TcxLookupComboBox
      Left = 723
      Top = 239
      Hint = #1043#1088#1091#1087#1087#1099' '#1076#1080#1072#1075#1085#1086#1079#1086#1074
      Properties.AutoSelect = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.HideSelection = False
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsResumeSovpalo
      Properties.ReadOnly = False
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 17
      OnClick = cxResumesovpaloClick
      OnMouseDown = cxResumesovpaloMouseDown
      Width = 72
    end
    object paVyavleno: TPanel
      Left = 900
      Top = 12
      Width = 305
      Height = 168
      TabOrder = 18
      Visible = False
      object dxBarDockControl2: TdxBarDockControl
        Left = 1
        Top = 1
        Width = 303
        Height = 28
        Align = dalTop
        BarManager = BM
        SunkenBorder = True
        UseOwnSunkenBorder = True
      end
      object cxTreeNaz: TcxDBTreeList
        Left = 1
        Top = 29
        Width = 303
        Height = 138
        BorderStyle = cxcbsNone
        Align = alClient
        Bands = <
          item
          end>
        BufferedPaint = False
        DataController.DataSource = dsVyavleno
        DataController.ParentField = 'FK_OWNER'
        DataController.KeyField = 'FK_ID'
        LookAndFeel.Kind = lfUltraFlat
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsData.Deleting = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Headers = False
        OptionsView.Indicator = True
        RootValue = -1
        TabOrder = 1
        OnExit = cxTreeNazExit
        OnKeyDown = cxTreeNazKeyDown
        object cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayChecked = '1'
          Properties.DisplayUnchecked = '0'
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Caption.Text = '_'
          DataBinding.FieldName = 'FL_CHECK'
          Options.Sizing = False
          Options.Moving = False
          Width = 53
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn
          Caption.Text = #1052#1077#1090#1086#1076#1080#1082#1072
          DataBinding.FieldName = 'FC_NAME'
          Options.Editing = False
          Width = 792
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object cxLabel1: TcxLabel
      Left = 137
      Top = 4
      Caption = #8470' '#1087#1088#1086#1090#1086#1082#1086#1083#1072':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      OnClick = cxLabel1Click
    end
    object cxNumIssl: TcxLabel
      Left = 236
      Top = 2
      Caption = '--'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Book Antiqua'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      OnClick = cxNumIsslClick
    end
    object cxlbDays: TcxLabel
      Left = 363
      Top = 6
      Caption = #1055#1088#1077#1076#1091#1087#1088#1077#1078#1076#1077#1085#1080#1077'!'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Visible = False
      OnClick = cxlbDaysClick
    end
    object cxLabel2: TcxLabel
      Left = 169
      Top = 26
      Caption = #1044#1080#1072#1075#1085#1086#1079':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      OnClick = cxLabel2Click
    end
    object cxDS: TcxRichEdit
      Left = 236
      Top = 28
      Enabled = False
      Properties.ScrollBars = ssVertical
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.BorderColor = clBtnText
      StyleDisabled.Color = clBtnHighlight
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 23
      OnClick = cxDSClick
      Height = 49
      Width = 633
    end
  end
  object BM: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 384
    Top = 64
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
      Caption = 'Main'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 404
      FloatTop = 232
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbSave'
        end
        item
          Visible = True
          ItemName = 'bbCancel'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrint'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Main'
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
      Caption = 'OKCANCEL'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1219
      FloatTop = 36
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbOK'
        end
        item
          Visible = True
          ItemName = 'bbOut'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbSave: TdxBarButton
      Action = aSave
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbCancel: TdxBarButton
      Action = aCancel
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrint: TdxBarButton
      Action = actPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbOK: TdxBarButton
      Category = 0
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103
      Visible = ivAlways
      ImageIndex = 32
      OnClick = bbOKClick
    end
    object bbOut: TdxBarButton
      Category = 0
      Hint = #1054#1090#1084#1077#1085#1072
      Visible = ivAlways
      ImageIndex = 31
      OnClick = bbOutClick
    end
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 448
    Top = 65
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 32
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 31
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aResume: TAction
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1081
      OnExecute = aResumeExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1086#1090#1084#1077#1090#1086#1082
      ImageIndex = 10
      ShortCut = 16464
      OnExecute = actPrintExecute
    end
  end
  object odsDSsovpalo: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME '
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'N' +
        'APRAVDIAG_SOVPALO'#39')'
      '   AND FL_SHOWPRINT = 1'
      'ORDER BY FN_ORDER ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 480
    Top = 394
  end
  object dsDSsovpalo: TDataSource
    DataSet = odsDSsovpalo
    Left = 520
    Top = 394
  end
  object odsDSposle: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME '
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'D' +
        'SZAKL_POSLE'#39')'
      '   AND FL_SHOWPRINT = 1'
      'ORDER BY FN_ORDER ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 488
    Top = 490
  end
  object dsDSposle: TDataSource
    DataSet = odsDSposle
    Left = 520
    Top = 490
  end
  object odsResumeSovpalo: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME '
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'Z' +
        'AKLDS_SOVPALO'#39')'
      '   AND FL_SHOWPRINT = 1'
      'ORDER BY FN_ORDER ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 488
    Top = 538
  end
  object dsResumeSovpalo: TDataSource
    DataSet = odsResumeSovpalo
    Left = 520
    Top = 538
  end
  object odsSotr: TOracleDataSet
    SQL.Strings = (
      'SELECT 1 AS FK_ID, '#39' '#39' AS FC_FAM, FC_NAME'
      'FROM TSMID'
      
        'WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'RG' +
        '_VRACH'#39')'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_FAM, FC_FAM || '#39' '#39' || '
      
        '       DECODE(VarcharIsNUll(FC_NAME), 1, '#39#39', SUBSTR(FC_NAME, 0, ' +
        '1) || '#39'. '#39' || '
      
        '       DECODE (VarcharIsNUll(FC_OTCH), 1, '#39#39', SUBSTR(FC_OTCH, 0,' +
        ' 1) || '#39'. '#39')) AS FC_NAME'
      '  FROM TSOTR '
      ' WHERE FK_OTDELID = :PFK_OTDELID'
      '   AND FK_SPRAVID IN (GET_XRAY_VRACH, GET_ZAVOTDEL)'
      '   AND FL_DEL = 0'
      'ORDER BY FC_FAM')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A50464B5F4F5444454C49440300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000600000046435F46414D010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsSotrBeforeOpen
    Left = 488
    Top = 586
  end
  object dsSotr: TDataSource
    DataSet = odsSotr
    Left = 520
    Top = 586
  end
  object pmZakl: TPopupMenu
    Left = 480
    Top = 64
  end
  object odsVyavleno: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWID, 0 AS FL_CHECK, FK_ID, FC_NAME '
      '  FROM asu.TSMID'
      
        ' WHERE FK_ID <> (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ' +
        #39'OTMETKI_VYAVLENO'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      
        'START WITH FK_ID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM' +
        ' = '#39'OTMETKI_VYAVLENO'#39')'
      'CONNECT BY PRIOR FK_ID = FK_OWNER'
      'ORDER BY FN_ORDER '
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464C5F434845434B010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    Session = frmMain.os
    Left = 488
    Top = 442
    object odsVyavlenoFL_CHECK: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'FL_CHECK'
    end
    object odsVyavlenoFK_ID: TFloatField
      FieldName = 'FK_ID'
      Required = True
    end
    object odsVyavlenoFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Size = 255
    end
  end
  object dsVyavleno: TDataSource
    DataSet = odsVyavleno
    Left = 520
    Top = 442
  end
  object frxRepOtmetki: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39299.753055555600000000
    ReportOptions.LastChange = 40040.549554270830000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepOtmetkiGetValue
    Left = 540
    Top = 66
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 453.543600000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        StartNewPage = True
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 41.574830000000000000
          Width = 739.488770000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1112#1056#181#1057#8218#1056#1108#1056#1105' '#1057#1026#1056#181#1056#1029#1057#8218#1056#1110#1056#181#1056#1029#1056#1109#1056#187#1056#1109#1056#1110#1056#176)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 117.165430000000000000
          Top = 230.740260000000000000
          Width = 628.325950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[NAME_ISSL]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 113.385900000000000000
          Top = 257.196970000000000000
          Width = 631.559370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[ZAKL]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 49.133890000000000000
          Top = 314.110390000000000000
          Width = 181.444910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1056#1109#1056#1030#1056#1111#1056#176#1056#1169#1056#181#1056#1029#1056#1105#1056#181' '#1057#1027' '#1056#1029#1056#176#1056#1111#1057#1026'. DS-'#1056#1109#1056#1112':')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 34.015770000000000000
          Top = 432.496290000000000000
          Width = 129.525640000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#176#1057#8225'-'#1057#1026#1056#181#1056#1029#1057#8218#1056#1110#1056#181#1056#1029#1056#1109#1056#187#1056#1109#1056#1110':')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 415.748300000000000000
          Top = 432.496290000000000000
          Width = 48.188930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176':')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 3.779530000000000000
          Top = 336.567100000000000000
          Width = 228.508930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1108#1056#187#1057#1035#1057#8225#1056#1105#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1057#8249#1056#8470' '#1056#1169#1056#1105#1056#176#1056#1110#1056#1029#1056#1109#1056#183' '#1056#1111#1056#1109#1057#1027#1056#187#1056#181':')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 3.779530000000000000
          Top = 355.464750000000000000
          Width = 347.367520000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              #1056#1038#1056#1109#1056#1030#1056#1111#1056#176#1056#1169#1056#181#1056#1029#1056#1105#1056#181' '#1056#183#1056#176#1056#1108#1056#187#1057#1035#1057#8225#1056#1105#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1056#1110#1056#1109' DS-'#1056#176' '#1057#1027' '#1056#183#1056 +
              #176#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1056#1105#1056#181#1056#1112':')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 11.338590000000000000
          Top = 75.590600000000000000
          Width = 99.474570000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111#1057#1026#1056#1109#1057#8218#1056#1109#1056#1108#1056#1109#1056#187#1056#176':')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 117.165430000000000000
          Top = 136.063080000000000000
          Width = 616.199370000000000000
          Height = 90.708720000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[DIAGNOZ]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 49.133890000000000000
          Top = 113.385900000000000000
          Width = 64.267050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218':')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 52.913420000000000000
          Top = 136.063080000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8221#1056#1105#1056#176#1056#1110#1056#1029#1056#1109#1056#183':')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 11.338590000000000000
          Top = 257.196970000000000000
          Width = 99.840000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1056#1105#1056#181':')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 3.779530000000000000
          Width = 740.787880000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]'
            '[OTDELNAME]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 117.165430000000000000
          Top = 75.590600000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[NUM_ISSL]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 117.165430000000000000
          Top = 113.385900000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[PACFIO]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 234.330860000000000000
          Top = 314.110390000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[NAPRAV_SOVPALO]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 166.299320000000000000
          Top = 432.496290000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[VRACH]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 468.661720000000000000
          Top = 432.496290000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[DATE_ISSL]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 234.330860000000000000
          Top = 336.567100000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[ZAKL_POSLE]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 355.275820000000000000
          Top = 355.464750000000000000
          Width = 385.512060000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = []
          Memo.UTF8 = (
            '[ZAKL_ZAKL]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 11.338590000000000000
          Top = 230.740260000000000000
          Width = 99.840000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'book Antiqua'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181':')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 37.795300000000000000
        Top = 532.913730000000000000
        Width = 755.906000000000000000
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Top = 0.779530000000000000
          Width = 740.787880000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 3.779530000000000000
          Top = 24.456710000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADESIGN]')
          ParentFont = False
        end
      end
    end
  end
  object odsNapr: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWID, 0 AS FL_CHECK, FK_ID, FC_NAME'
      '  FROM asu.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM ' +
        '= '#39'XRAY_KUDA_NAPRAVLEN'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464C5F434845434B010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    Session = frmMain.os
    Left = 616
    Top = 458
    object FloatField1: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'FL_CHECK'
    end
    object FloatField2: TFloatField
      FieldName = 'FK_ID'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'FC_NAME'
      Size = 255
    end
  end
end
