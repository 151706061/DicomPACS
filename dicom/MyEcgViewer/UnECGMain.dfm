object frmECGMain: TfrmECGMain
  Left = 0
  Top = 0
  Caption = 'ECGViewer'
  ClientHeight = 640
  ClientWidth = 1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma,204'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1093
    Height = 640
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'DICOM TAGS'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 1085
        Height = 611
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma,204'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        Visible = False
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'ECG TAGS'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 64
        Height = 19
        Caption = 'Modality'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma,204'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 67
        Width = 223
        Height = 19
        Caption = 'AcquisitionContextSequence'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma,204'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 256
        Top = 13
        Width = 238
        Height = 19
        Caption = 'PerformedActionItemSequence'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma,204'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 512
        Top = 13
        Width = 83
        Height = 19
        Caption = 'CodeValue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma,204'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 512
        Top = 42
        Width = 202
        Height = 19
        Caption = 'CodingSchemeDesignator'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma,204'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 512
        Top = 72
        Width = 106
        Height = 19
        Caption = 'CodeMeaning'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma,204'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edModality: TEdit
        Left = 145
        Top = 8
        Width = 64
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma,204'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edCodeValue1: TEdit
        Left = 729
        Top = 5
        Width = 315
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma,204'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edCodingSchemeDesignator1: TEdit
        Left = 729
        Top = 34
        Width = 315
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma,204'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edCodeMeaning1: TEdit
        Left = 729
        Top = 64
        Width = 315
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma,204'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object memAcquisitionContextSequence: TMemo
        Left = 0
        Top = 112
        Width = 1085
        Height = 499
        Align = alBottom
        ScrollBars = ssVertical
        TabOrder = 4
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Waveform Sequence'
      ImageIndex = 1
      object memConceptCodeSequence: TMemo
        Left = 0
        Top = 0
        Width = 1085
        Height = 611
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object tsGraph: TTabSheet
      Caption = 'DATA'
      ImageIndex = 3
      OnShow = tsGraphShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 43
        Width = 1085
        Height = 568
        Align = alClient
        TabOrder = 0
        object pb1: TPaintBox
          Left = 1
          Top = 0
          Width = 1166
          Height = 591
          OnPaint = pb1Paint
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1085
        Height = 43
        Align = alTop
        TabOrder = 1
        object Label9: TLabel
          Left = 864
          Top = 8
          Width = 192
          Height = 14
          Caption = #1087#1086' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1080' : 1 '#1089#1077#1082#1091#1085#1076#1072' = 5 '#1082#1083#1077#1090#1086#1082
        end
        object Label10: TLabel
          Left = 864
          Top = 23
          Width = 157
          Height = 14
          Caption = #1087#1086' '#1074#1077#1088#1090#1080#1082#1072#1083#1080' : 1 '#1084#1074' = 2 '#1082#1083#1077#1090#1082#1080
        end
        object Panel2: TPanel
          Left = 313
          Top = 1
          Width = 264
          Height = 41
          Align = alLeft
          TabOrder = 0
          object Label3: TLabel
            Left = 40
            Top = 2
            Width = 152
            Height = 14
            Caption = #1084#1072#1089#1096#1090#1072#1073' '#1074#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086' '#1084#1084'/'#1084#1042
          end
          object rv15: TRadioButton
            Left = 79
            Top = 19
            Width = 33
            Height = 17
            Caption = '15'
            TabOrder = 0
          end
          object rv20: TRadioButton
            Left = 115
            Top = 19
            Width = 34
            Height = 17
            Caption = '20'
            TabOrder = 1
          end
          object rv25: TRadioButton
            Left = 152
            Top = 19
            Width = 35
            Height = 17
            Caption = '25'
            TabOrder = 2
          end
          object rv40: TRadioButton
            Left = 191
            Top = 19
            Width = 33
            Height = 17
            Caption = '40'
            TabOrder = 3
          end
          object rv75: TRadioButton
            Left = 227
            Top = 19
            Width = 34
            Height = 17
            Caption = '75'
            TabOrder = 4
          end
          object rv10: TRadioButton
            Left = 39
            Top = 19
            Width = 34
            Height = 17
            Caption = '10'
            Checked = True
            TabOrder = 5
            TabStop = True
          end
          object rv5: TRadioButton
            Left = 5
            Top = 19
            Width = 31
            Height = 17
            Caption = '5'
            TabOrder = 6
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 312
          Height = 41
          Align = alLeft
          TabOrder = 1
          object Label8: TLabel
            Left = 24
            Top = 2
            Width = 152
            Height = 14
            Caption = #1084#1072#1089#1096#1090#1072#1073' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086' '#1084#1084'/'#1089
          end
          object rb25: TRadioButton
            Left = 16
            Top = 19
            Width = 33
            Height = 17
            Caption = '25'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object rb50: TRadioButton
            Left = 79
            Top = 19
            Width = 34
            Height = 17
            Caption = '50'
            TabOrder = 1
          end
          object rb100: TRadioButton
            Left = 144
            Top = 19
            Width = 35
            Height = 17
            Caption = '100'
            TabOrder = 2
          end
          object rb200: TRadioButton
            Left = 199
            Top = 19
            Width = 35
            Height = 17
            Caption = '200'
            TabOrder = 3
          end
          object rb400: TRadioButton
            Left = 255
            Top = 19
            Width = 35
            Height = 17
            Caption = '400'
            TabOrder = 4
          end
        end
        object Button1: TButton
          Left = 577
          Top = 1
          Width = 112
          Height = 41
          Align = alLeft
          Caption = #1047#1072#1076#1072#1090#1100
          TabOrder = 2
          OnClick = Button1Click
        end
      end
    end
    object TEST: TTabSheet
      Caption = 'TEST'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Memo2: TMemo
        Left = 0
        Top = 41
        Width = 1085
        Height = 570
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1085
        Height = 41
        Align = alTop
        TabOrder = 1
        object Button2: TButton
          Left = 16
          Top = 10
          Width = 75
          Height = 25
          Caption = 'TextBox'
          TabOrder = 0
          OnClick = Button2Click
        end
      end
    end
    object tsPDF: TTabSheet
      Caption = 'PDF'
      ImageIndex = 5
      OnShow = tsPDFShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object WebBrowser1: TWebBrowser
        Left = 0
        Top = 0
        Width = 1085
        Height = 611
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 88
        ExplicitTop = 128
        ExplicitWidth = 300
        ExplicitHeight = 150
        ControlData = {
          4C00000023700000263F00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Create ECG'
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1085
        Height = 65
        Align = alTop
        TabOrder = 0
        object Label11: TLabel
          Left = 451
          Top = 11
          Width = 90
          Height = 14
          Caption = #1054#1073#1097#1077#1077' '#1074#1088#1077#1084#1103','#1089#1077#1082
        end
        object Label13: TLabel
          Left = 388
          Top = 37
          Width = 153
          Height = 14
          Caption = #1042#1099#1089#1086#1090#1072' '#1086#1090' '#1089#1088#1077#1076#1085#1077#1081' '#1083#1080#1085#1080#1080', '#1084#1074
        end
        object Button3: TButton
          Left = 631
          Top = 5
          Width = 146
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' 1 '#1082#1072#1085#1072#1083
          TabOrder = 0
          OnClick = Button3Click
        end
        object Button4: TButton
          Left = 8
          Top = 7
          Width = 75
          Height = 25
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
          TabOrder = 1
          OnClick = Button4Click
        end
        object cbCUT: TCheckBox
          Left = 88
          Top = 11
          Width = 73
          Height = 17
          Caption = #1074#1099#1088#1077#1079#1072#1090#1100
          TabOrder = 2
        end
        object Button5: TButton
          Left = 162
          Top = 7
          Width = 96
          Height = 25
          Caption = #1059#1073#1088#1072#1090#1100' '#1086#1090#1084#1077#1090#1082#1091
          TabOrder = 3
          OnClick = Button5Click
        end
        object Button6: TButton
          Left = 264
          Top = 7
          Width = 113
          Height = 25
          Caption = #1054#1089#1090#1072#1074#1080#1090#1100' '#1074#1099#1088#1077#1079#1082#1091
          TabOrder = 4
          OnClick = Button6Click
        end
        object edTimeMs: TEdit
          Left = 544
          Top = 6
          Width = 68
          Height = 22
          TabOrder = 5
          Text = '8'
        end
        object edValMax: TEdit
          Left = 544
          Top = 34
          Width = 68
          Height = 22
          TabOrder = 6
          Text = '1000'
        end
        object Button7: TButton
          Left = 8
          Top = 34
          Width = 75
          Height = 25
          Caption = #1040#1042#1058#1054
          TabOrder = 7
          OnClick = Button7Click
        end
      end
      object ScrollBox2: TScrollBox
        Left = 3
        Top = 71
        Width = 1061
        Height = 514
        TabOrder = 1
        object Image1: TImage
          Left = 5
          Top = 16
          Width = 1036
          Height = 475
          OnMouseDown = Image1MouseDown
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #1059#1047#1048
      ImageIndex = 7
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PaintBox1: TPaintBox
        Left = 0
        Top = 0
        Width = 1085
        Height = 611
        Align = alClient
        OnPaint = pb1Paint
        ExplicitLeft = -99
        ExplicitWidth = 1166
        ExplicitHeight = 591
      end
    end
    object tsVCL: TTabSheet
      Caption = 'VCL'
      ImageIndex = 8
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 529
        Height = 611
        Align = alLeft
        Caption = 'DICOM image'
        TabOrder = 0
        object DicomMultiViewer1: TDicomMultiViewer
          Left = 2
          Top = 16
          Width = 525
          Height = 593
          DisplayLabel = True
          DisplayWLLabel = True
          DisplayRuler = True
          DisplayRightRuler = True
          DisplayBottomRuler = True
          TextOverlayMode = False
          UpdateAllImageProperty = True
          CanMultiSelect = True
          WhiteGrid = False
          MultiViewMode = mvmSTANDARDView
          AutoGrid = False
          ScrollBarVisible = True
          CanCheckSize = True
          Align = alClient
          TabOrder = 0
          CurrentImage = 0
          Columns = 1
          Rows = 1
          DicomDatasets = CnsDMTable1
        end
      end
      object Button8: TButton
        Left = 560
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Refresh'
        TabOrder = 1
        OnClick = Button8Click
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'TreeTags'
      ImageIndex = 9
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxTreeList1: TcxTreeList
        Left = 0
        Top = 0
        Width = 1085
        Height = 611
        Align = alClient
        Bands = <
          item
          end>
        BufferedPaint = False
        OptionsData.Editing = False
        OptionsData.Deleting = False
        TabOrder = 0
        object cxTreeList1cxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #1053#1086#1084#1077#1088
          DataBinding.ValueType = 'String'
          Width = 100
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #1058#1080#1087
          DataBinding.ValueType = 'String'
          Width = 49
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn3: TcxTreeListColumn
          Caption.Text = #1054#1087#1080#1089#1072#1085#1080#1077
          DataBinding.ValueType = 'String'
          Width = 352
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn4: TcxTreeListColumn
          Caption.Text = #1047#1085#1072#1095#1077#1085#1080#1077
          DataBinding.ValueType = 'String'
          Width = 573
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = #1091#1089#1090#1072#1085#1086#1074#1082#1072' '#1090#1077#1075#1086#1074
      ImageIndex = 10
      OnShow = TabSheet7Show
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label12: TLabel
        Left = 3
        Top = 5
        Width = 76
        Height = 14
        Caption = 'TransferSyntax'
      end
      object Label14: TLabel
        Left = 3
        Top = 29
        Width = 85
        Height = 14
        Caption = 'TransferSyntaxID'
      end
      object edTransferSyntax: TEdit
        Left = 94
        Top = 2
        Width = 562
        Height = 22
        TabOrder = 0
      end
      object Memo3: TMemo
        Left = 785
        Top = 0
        Width = 297
        Height = 603
        Lines.Strings = (
          'PrivateTransferSyntax = 8192;'
          '  ImplicitVRLittleEndian = 8193;'
          '  ExplicitVRLittleEndian = 8194;'
          '  ExplicitVRBigEndian = 8195;'
          '  RLELossless = 8198;'
          '  //JPEG_1 = 8196;'
          '  JPEGBaseline = 8196;'
          '  //JPEG_14_SelectionValue1 = 8197;'
          '  JPEGLossless = 8197;'
          '  JPEGExtendedProcess_2_4 = 8199;'
          '  JPEG_3_5 = 8200;'
          '  JPEG_6_8 = 8201;'
          '  JPEG_7_9 = 8202;'
          '  JPEG_10_12 = 8203;'
          '  JPEG_11_13 = 8204;'
          '  JPEGLossless14 = 8205;'
          '  JPEGLossless15 = 8206;'
          '  JPEG_16_18 = 8207;'
          '  JPEG_17_19 = 8208;'
          '  JPEG_20_22 = 8209;'
          '  JPEG_21_23 = 8210;'
          '  JPEG_24_26 = 8211;'
          '  JPEG_25_27 = 8212;'
          '  JPEG_28 = 8213;'
          '  JPEG_29 = 8214;'
          ''
          '  {$IFDEF ECLZLIBTransferSyntax}'
          '  zlibFastestTransferSyntax = 8215;'
          '  ppmFastestTransferSyntax = 8216;'
          '  bzipFastestTransferSyntax = 8217;'
          ''
          '  zlibMaxTransferSyntax = 8222;'
          '  ppmMaxTransferSyntax = 8223;'
          '  bzipMaxTransferSyntax = 8224;'
          ''
          '  zlibNormalTransferSyntax = 8225;'
          '  ppmNormalTransferSyntax = 8226;'
          '  bzipNormalTransferSyntax = 8227;'
          '  {$ENDIF}'
          ''
          '  JPEGLossless80 = 8218;'
          '  JPEGNearLossless81 = 8219;'
          '  JPEG2000Irreversible = 8220; //.90 lossless'
          '  JPEG2000Reversible = 8221; //.91 losy')
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 1
      end
      object Memo4: TMemo
        Left = 5
        Top = 54
        Width = 774
        Height = 549
        Lines.Strings = (
          
            '  addEntry(8192, TUIDEntry.Create(8192, '#39'private'#39', '#39'Private Tran' +
            'sfer Syntax'#39', '#39'PR'#39', 3));'
          
            '  addEntry(8193, TUIDEntry.Create(8193, '#39'1.2.840.10008.1.2'#39', '#39'Im' +
            'plicit VR Little Endian Transfer Syntax'#39', '#39'IL'#39', 3));'
          
            '  addEntry(8194, TUIDEntry.Create(8194, '#39'1.2.840.10008.1.2.1'#39', '#39 +
            'Explicit VR Little Endian Transfer Syntax'#39', '#39'EL'#39', 3));'
          
            '  addEntry(8195, TUIDEntry.Create(8195, '#39'1.2.840.10008.1.2.2'#39', '#39 +
            'Explicit VR Big Endian Transfer Syntax'#39', '#39'EB'#39', 3));'
          
            '  addEntry(8196, TUIDEntry.Create(8196, '#39'1.2.840.10008.1.2.4.50'#39 +
            ', '#39'JPEG Baseline Transfer Syntax (Process 1)'#39', '#39'JB'#39', 3));'
          
            '  addEntry(8197, TUIDEntry.Create(8197, '#39'1.2.840.10008.1.2.4.70'#39 +
            ', '#39'JPEG Lossless Transfer Syntax (Process 14, Selection Value 1)' +
            #39', '#39'JL'#39', 3));'
          
            '  addEntry(8198, TUIDEntry.Create(8198, '#39'1.2.840.10008.1.2.5'#39', '#39 +
            'RLE Lossless Transfer Syntax'#39', '#39'RL'#39', 3));'
          
            '  addEntry(8199, TUIDEntry.Create(8199, '#39'1.2.840.10008.1.2.4.51'#39 +
            ', '#39'JPEG Extended (Process 2 & 4)'#39', '#39'JP_2_4'#39', 3));'
          
            '  addEntry(8200, TUIDEntry.Create(8200, '#39'1.2.840.10008.1.2.4.52'#39 +
            ', '#39'JPEG Extended (Process 3 & 5)'#39', '#39'JP_3_5'#39', 3));'
          
            '  addEntry(8201, TUIDEntry.Create(8201, '#39'1.2.840.10008.1.2.4.53'#39 +
            ', '#39'JPEG Spectral Selection, Non-Hierarchical (Process 6 & 8)'#39', '#39 +
            'JP_6_8'#39', 3));'
          
            '  addEntry(8202, TUIDEntry.Create(8202, '#39'1.2.840.10008.1.2.4.54'#39 +
            ', '#39'JPEG Spectral Selection, Non-Hierarchical (Process 7 & 9)'#39', '#39 +
            'JP_7_9'#39', 3));'
          
            '  addEntry(8203, TUIDEntry.Create(8203, '#39'1.2.840.10008.1.2.4.55'#39 +
            ', '#39'JPEG Full Progression, Non-Hierarchical (Process 10 & 12)'#39', '#39 +
            'JP_10_12'#39', 3));'
          
            '  addEntry(8204, TUIDEntry.Create(8204, '#39'1.2.840.10008.1.2.4.56'#39 +
            ', '#39'JPEG Full Progression, Non-Hierarchical (Process 11 & 13)'#39', '#39 +
            'JP_11_13'#39', 3));'
          
            '  addEntry(8205, TUIDEntry.Create(8205, '#39'1.2.840.10008.1.2.4.57'#39 +
            ', '#39'JPEG Lossless, Non-Hierarchical (Process 14)'#39', '#39'JP_14'#39', 3));'
          
            '  addEntry(8206, TUIDEntry.Create(8206, '#39'1.2.840.10008.1.2.4.58'#39 +
            ', '#39'JPEG Lossless, Non-Hierarchical (Process 15)'#39', '#39'JP_15'#39', 3));'
          
            '  addEntry(8207, TUIDEntry.Create(8207, '#39'1.2.840.10008.1.2.4.59'#39 +
            ', '#39'JPEG Extended, Hierarchical (Process 16 & 18)'#39', '#39'JP_16_18'#39', 3' +
            '));'
          
            '  addEntry(8208, TUIDEntry.Create(8208, '#39'1.2.840.10008.1.2.4.60'#39 +
            ', '#39'JPEG Extended, Hierarchical (Process 17 & 19)'#39', '#39'JP_17_19'#39', 3' +
            '));'
          
            '  addEntry(8209, TUIDEntry.Create(8209, '#39'1.2.840.10008.1.2.4.61'#39 +
            ', '#39'JPEG Spectral Selection, Hierarchical (Process 20 & 22)'#39', '#39'JP' +
            '_20_22'#39', 3));'
          
            '  addEntry(8210, TUIDEntry.Create(8210, '#39'1.2.840.10008.1.2.4.62'#39 +
            ', '#39'JPEG Spectral Selection, Hierarchical (Process 21 & 23)'#39', '#39'JP' +
            '_21_23'#39', 3));'
          
            '  addEntry(8211, TUIDEntry.Create(8211, '#39'1.2.840.10008.1.2.4.63'#39 +
            ', '#39'JPEG Full Progression, Hierarchical (Process 24 & 26)'#39', '#39'JP_2' +
            '4_26'#39', 3));'
          
            '  addEntry(8212, TUIDEntry.Create(8212, '#39'1.2.840.10008.1.2.4.64'#39 +
            ', '#39'JPEG Full Progression, Hierarchical (Process 25 & 27)'#39', '#39'JP_2' +
            '5_27'#39', 3));'
          
            '  addEntry(8213, TUIDEntry.Create(8213, '#39'1.2.840.10008.1.2.4.65'#39 +
            ', '#39'JPEG Lossless, Hierarchical (Process 28)'#39', '#39'JP_28'#39', 3));'
          
            '  addEntry(8214, TUIDEntry.Create(8214, '#39'1.2.840.10008.1.2.4.66'#39 +
            ', '#39'JPEG Lossless, Hierarchical (Process 29)'#39', '#39'JP_29'#39', 3));'
          ''
          '  // '#1076#1086#1073#1072#1074#1083#1077#1085#1086' '#1076#1083#1103' '#1088#1072#1073#1086#1095#1077#1081' '#1089#1090#1072#1085#1094#1080#1080' Osirix'
          
            '  addEntry(MPEG2MainProgileMainLevel, TUIDEntry.Create(MPEG2Main' +
            'ProgileMainLevel, '#39'1.2.840.10008.1.2.4.100'#39', '#39'MPEG2 Main Profile' +
            ' @ Main Level (1.2.840.10008.1.2.4.10)'#39', '#39'MPEG2'#39', 3));'
          ''
          '  {$IFDEF ECLZLIBTransferSyntax}'
          
            '  addEntry(zlibFastestTransferSyntax, TUIDEntry.Create(zlibFaste' +
            'stTransferSyntax, '#39'1.2.840.10008.1.2.5.1'#39', '#39'ZLIB algorithm, fast' +
            'est compresssion'#39', '#39'ZLIB'#39', 3));'
          
            '  addEntry(ppmFastestTransferSyntax, TUIDEntry.Create(ppmFastest' +
            'TransferSyntax, '#39'1.2.840.10008.1.2.5.2'#39', '#39'PPM algorithm, fastest' +
            ' compresssion'#39', '#39'PPM'#39', 3));'
          
            '  addEntry(bzipFastestTransferSyntax, TUIDEntry.Create(bzipFaste' +
            'stTransferSyntax, '#39'1.2.840.10008.1.2.5.3'#39', '#39'BZIP algorithm, fast' +
            'est compresssion'#39', '#39'BZIP'#39', 3));'
          ''
          
            '  addEntry(zlibMaxTransferSyntax, TUIDEntry.Create(zlibMaxTransf' +
            'erSyntax, '#39'1.2.840.10008.1.2.5.4'#39', '#39'ZLIB algorithm, max compress' +
            'sion'#39', '#39'ZLIB1'#39', 3));'
          
            '  addEntry(ppmMaxTransferSyntax, TUIDEntry.Create(ppmMaxTransfer' +
            'Syntax, '#39'1.2.840.10008.1.2.5.5'#39', '#39'PPM algorithm, max compresssio' +
            'n'#39', '#39'PPM1'#39', 3));'
          
            '  addEntry(bzipMaxTransferSyntax, TUIDEntry.Create(bzipMaxTransf' +
            'erSyntax, '#39'1.2.840.10008.1.2.5.6'#39', '#39'BZIP algorithm, max compress' +
            'sion'#39', '#39'BZIP1'#39', 3));'
          ''
          
            '  addEntry(zlibNormalTransferSyntax, TUIDEntry.Create(zlibNormal' +
            'TransferSyntax, '#39'1.2.840.10008.1.2.5.7'#39', '#39'ZLIB algorithm, Normal' +
            ' compresssion'#39', '#39'ZLIB2'#39', 3));'
          
            '  addEntry(ppmNormalTransferSyntax, TUIDEntry.Create(ppmNormalTr' +
            'ansferSyntax, '#39'1.2.840.10008.1.2.5.8'#39', '#39'PPM algorithm, Normal co' +
            'mpresssion'#39', '#39'PPM2'#39', 3));'
          
            '  addEntry(bzipNormalTransferSyntax, TUIDEntry.Create(bzipNormal' +
            'TransferSyntax, '#39'1.2.840.10008.1.2.5.9'#39', '#39'BZIP algorithm, Normal' +
            ' compresssion'#39', '#39'BZIP2'#39', 3));'
          '  {$ENDIF}'
          
            '  addEntry(8218, TUIDEntry.Create(8218, '#39'1.2.840.10008.1.2.4.80'#39 +
            ', '#39'JPEG Lossless80, lossless'#39', '#39'JP_SL'#39', 3));'
          
            '  addEntry(8219, TUIDEntry.Create(8219, '#39'1.2.840.10008.1.2.4.81'#39 +
            ', '#39'JPEG Lossless81, near-lossless'#39', '#39'JP_SN'#39', 3));'
          
            '  addEntry(8220, TUIDEntry.Create(8220, '#39'1.2.840.10008.1.2.4.90'#39 +
            ', '#39'JPEG 2000, irreversible'#39', '#39'JP_KI'#39', 3));'
          
            '  addEntry(8221, TUIDEntry.Create(8221, '#39'1.2.840.10008.1.2.4.91'#39 +
            ', '#39'JPEG 2000, reversible'#39', '#39'JP_KR'#39', 3));')
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 2
      end
      object Button9: TButton
        Left = 664
        Top = 1
        Width = 113
        Height = 25
        Caption = 'SET and SAVE'
        TabOrder = 3
        OnClick = Button9Click
      end
      object edTransferSyntaxID: TEdit
        Left = 94
        Top = 26
        Width = 562
        Height = 22
        TabOrder = 4
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Structured Report WEB'
      ImageIndex = 12
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object WB: TWebBrowser
        Left = 0
        Top = 0
        Width = 1085
        Height = 611
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 176
        ExplicitTop = 112
        ExplicitWidth = 300
        ExplicitHeight = 150
        ControlData = {
          4C00000023700000263F00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    object tsXML: TTabSheet
      Caption = 'XML SCHILLER.RU'
      ImageIndex = 12
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object memXML: TMemo
        Left = 0
        Top = 0
        Width = 1085
        Height = 611
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma,204'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 864
    Top = 40
    object N1: TMenuItem
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #1040#1074#1090#1086#1047#1072#1075#1088#1091#1079#1082#1072
      OnClick = N3Click
    end
    object XML1: TMenuItem
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' XML '#1086#1090' '#1064#1048#1051#1051#1045#1056'.'#1056#1059
      OnClick = XML1Click
    end
    object N2: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N2Click
    end
  end
  object CnsDMTable1: TCnsDMTable
    AutoShowReffrenceLine = False
    Currentindex = 0
    FetchCount = 0
    Left = 792
    Top = 40
  end
  object rvs: TRVStyle
    TextStyles = <
      item
        StyleName = 'Normal text'
        FontName = 'Times New Roman'
        Size = 14
        Color = clBlack
      end
      item
        StyleName = 'Hint Text'
        FontName = 'Times New Roman'
        Size = 14
        Style = [fsItalic]
        Color = clSilver
      end
      item
        StyleName = 'Hypertext'
        FontName = 'Arial'
        Size = 14
        Style = [fsBold]
        Color = clBlue
        HoverColor = 16747146
        Jump = True
      end
      item
        StyleName = 'Bold Text'
        FontName = 'Arial'
        Size = 14
        Style = [fsBold, fsItalic]
        Color = clTeal
      end>
    ParaStyles = <
      item
        StyleName = 'Paragraph Style'
        Tabs = <>
      end
      item
        StyleName = 'Centered'
        Tabs = <>
      end>
    ListStyles = <>
    Color = clWhite
    InvalidPicture.Data = {
      07544269746D617036100000424D361000000000000036000000280000002000
      0000200000000100200000000000001000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800080808000808080008080800080808000808080008080
      800080808000808080008080800080808000808080008080800080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000}
    StyleTemplates = <>
    Left = 96
    Top = 80
  end
  object XML: TXMLDocument
    Left = 1000
    Top = 40
    DOMVendorDesc = 'MSXML'
  end
end
