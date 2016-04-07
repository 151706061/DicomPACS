object frmCD: TfrmCD
  Left = 399
  Top = 20
  BorderStyle = bsDialog
  Caption = #1047#1072#1087#1080#1089#1100' '#1085#1072' '#1076#1080#1089#1082' - '#1055#1086#1076#1075#1086#1090#1086#1074#1082#1072
  ClientHeight = 600
  ClientWidth = 825
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 825
    Height = 600
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pcBurn: TcxPageControl
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 819
      Height = 537
      ActivePage = cxTabSheet2
      Align = alTop
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Black'
      Style = 11
      TabOrder = 0
      OnChange = pcBurnChange
      ClientRectBottom = 531
      ClientRectLeft = 3
      ClientRectRight = 813
      ClientRectTop = 26
      object cxTabSheet1: TcxTabSheet
        Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072
        ImageIndex = 0
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gbBurn: TcxGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 239
          Margins.Top = 0
          Align = alClient
          Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1076#1080#1089#1082#1072
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWhite
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.NativeStyle = False
          Style.LookAndFeel.SkinName = 'Black'
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.SkinName = 'Black'
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.SkinName = 'Black'
          StyleHot.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.SkinName = 'Black'
          TabOrder = 1
          ExplicitWidth = 813
          ExplicitHeight = 275
          Height = 263
          Width = 804
          object Splitter2: TSplitter
            Left = 321
            Top = 17
            Height = 245
            ExplicitLeft = 344
            ExplicitTop = 136
            ExplicitHeight = 100
          end
          object Panel2: TPanel
            Left = 1
            Top = 17
            Width = 320
            Height = 245
            Align = alLeft
            BevelOuter = bvNone
            Caption = 'Panel2'
            TabOrder = 0
            object clBox: TListView
              Left = 0
              Top = 0
              Width = 320
              Height = 239
              HelpContext = 1019
              Align = alClient
              Checkboxes = True
              Columns = <
                item
                  Caption = 'R'
                  MaxWidth = 23
                  MinWidth = 23
                  Width = 23
                end
                item
                  AutoSize = True
                  Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                end
                item
                  Alignment = taRightJustify
                  Caption = #1056#1072#1079#1084#1077#1088
                  MaxWidth = 100
                  MinWidth = 70
                  Width = 87
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              FlatScrollBars = True
              GridLines = True
              HotTrack = True
              RowSelect = True
              ParentFont = False
              PopupMenu = pmToCD
              TabOrder = 0
              ViewStyle = vsReport
              OnDblClick = clBoxDblClick
              OnEditing = clBoxEditing
              OnDragDrop = clBoxDragDrop
              OnDragOver = clBoxDragOver
              ExplicitHeight = 245
            end
          end
          object Panel3: TPanel
            Left = 324
            Top = 17
            Width = 479
            Height = 245
            Align = alClient
            Caption = 'Panel3'
            TabOrder = 1
            object Splitter1: TSplitter
              Left = 251
              Top = 23
              Height = 215
              Align = alRight
              ExplicitLeft = 160
              ExplicitTop = 64
              ExplicitHeight = 100
            end
            object DriveCB: TDriveComboBox
              Left = 1
              Top = 1
              Width = 475
              Height = 22
              HelpContext = 1006
              Align = alTop
              DirList = lbDir
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ExplicitWidth = 477
            end
            object lbDir: TDirectoryListBox
              Left = 1
              Top = 23
              Width = 250
              Height = 215
              HelpContext = 1011
              Align = alClient
              DragMode = dmAutomatic
              FileList = lbFiles
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ItemHeight = 16
              ParentFont = False
              TabOrder = 1
              OnDblClick = lbDirDblClick
              ExplicitWidth = 252
              ExplicitHeight = 221
            end
            object lbFiles: TFileListBox
              Left = 254
              Top = 23
              Width = 222
              Height = 215
              HelpContext = 1010
              Align = alRight
              DragMode = dmAutomatic
              FileType = [ftReadOnly, ftHidden, ftSystem, ftVolumeID, ftArchive, ftNormal]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ItemHeight = 13
              MultiSelect = True
              ParentFont = False
              TabOrder = 2
              ExplicitLeft = 256
              ExplicitHeight = 221
            end
          end
        end
        object gbPodgotovka: TcxGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 47
          Margins.Top = 0
          Align = alTop
          Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWhite
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
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
          Transparent = True
          ExplicitWidth = 813
          Height = 189
          Width = 804
          object cxLabel1: TcxLabel
            Left = 7
            Top = 21
            Caption = #1050#1086#1088#1085#1077#1074#1086#1081' '#1082#1072#1090#1072#1083#1086#1075':'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Pitch = fpFixed
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object lDir: TcxLabel
            Left = 143
            Top = 21
            Caption = '--'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            Properties.WordWrap = True
            Transparent = True
            Width = 588
          end
          object cxLabel2: TcxLabel
            Left = 7
            Top = 50
            Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081':'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Pitch = fpFixed
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object lKolvo: TcxLabel
            Left = 143
            Top = 50
            Caption = '--'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object cxLabel4: TcxLabel
            Left = 7
            Top = 77
            Caption = #1057#1090#1072#1090#1091#1089':'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Pitch = fpFixed
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object lbStatus: TcxLabel
            Left = 143
            Top = 77
            Caption = '--'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            Transparent = True
          end
          object cxLabel5: TcxLabel
            Left = 7
            Top = 132
            Caption = #1054#1073#1098#1105#1084':'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Pitch = fpFixed
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object lbVolume: TcxLabel
            Left = 143
            Top = 132
            Caption = '--'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object cxLabel3: TcxLabel
            Left = 7
            Top = 160
            Caption = 'C'#1085#1080#1084#1082#1086#1074':'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Pitch = fpFixed
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object lbSnimki: TcxLabel
            Left = 143
            Top = 160
            Caption = '--'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object bPrepare: TcxButton
            Left = 726
            Top = 155
            Width = 75
            Height = 25
            Action = aOK
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxLabel14: TcxLabel
            Left = 7
            Top = 105
            Caption = #1050#1072#1090#1072#1083#1086#1075':'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Pitch = fpFixed
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object lbCatalog: TcxLabel
            Left = 143
            Top = 105
            Caption = '--'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Transparent = True
          end
        end
        object Panel5: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 804
          Height = 41
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 2
          object cxLabel7: TcxLabel
            Left = 50
            Top = 10
            Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1082' '#1079#1072#1087#1080#1089#1080' '#1085#1072' '#1076#1080#1089#1082
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextColor = clTeal
            Style.IsFontAssigned = True
            Transparent = True
          end
          object cxImage1: TcxImage
            Left = 6
            Top = 1
            TabStop = False
            AutoSize = True
            Enabled = False
            ParentShowHint = False
            Picture.Data = {
              07544269746D6170360C0000424D360C00000000000036000000280000002000
              0000200000000100180000000000000C0000F00A0000F00A0000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000008B80817E7374776C6E726B6C746E6F716A6B6863636561616664646D6D
              6E00000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000009093939C8B8C
              8F8081A59B96CFCABEF0EEDFFFFFF7FFFFFFFFFFFFFFFFFFEEEEECC4C3BF8D8B
              8868656671717200000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000AB999A948083B2A69E
              F6F4D8FFFFEDFFFFEDFFFFEEFFFFF1FFFFF5FFFFFBFFFFFFFFFFFEFFFFFDFFFF
              FEF2F0E295948E6663656B6B6C00000000000000000000000000000000000000
              0000000000000000000000000000000000000000B19A9BA08B8CE4D7BDFFFFE0
              FFFFE1FFFFE2FFFFE6FFFFEBFFFFF0FFFFF5FFFFFAFFFFFFFFFFFAFFFFF5FFFF
              F0FFFFF0FFFFF5D4D3C265656671727200000000000000000000000000000000
              0000000000000000000000000000000000BCA0A1A99594F8E5C0FFF5CEFFF7D4
              FFFCDCFFFEE0FFFFE5FFFFEAFFFFEFFFFFF4FFFFFAFFFFFFFFFFF9FFFFF3FFFF
              EEFFFFEAFFFFE7FFFFEAF1F2D56C6B6A6F6F7000000000000000000000000000
              0000000000000000000000000000C5ACADAB9595F8DCB6FFEAC0FFEDC5FFF1CD
              FFF7D7FFFEDFFFFFE3FFFFE8FFFFEEFFFFF4FFFFFAFFFFFEFFFFF7FFFFF1FFFF
              ECFFFFE8FFFFE3FFFFE1FFFFE1F3EECD64646676767600000000000000000000
              00000000000000000000008B9090B0979AE9C8A6FFE2B4FFE3B7FFE7BEFFEDC6
              FFF3CFFFFBDAFFFEE2FFFFE6FFFFEDFFFFF4FFFFFCFFFFFDFFFFF5FFFFEFFFFF
              E9FFFFE5FFFEE0FFFEDDFFF9D6FFFAD4D3C9AE64666800000000000000000000
              0000000000000000000000C5A9ABCBAB9DFFDBA6FFD8AAFFDCB0FFE1B6FFE7BE
              FFEDC7FFF5D2FFFEDEFFFFE4FFFFEBFFFFF3FFFFFCFFFFFBFFFFF2FFFFECFFFF
              E6FFFEE1FFFEDDFFF7D4FFF2CDFFEFC8FFF5CA938D8174717200000000000000
              0000000000000000FF0000B2A7ABF9C99AFFD09DFFD2A2FFD6A7FFDBAEFFE0B5
              FFE7BEFFEFC9FFF8D5FFFFE3FFFFF5FFFFFDFFFFFFFFFFFDFFFFF2FFFFE7FFFE
              E2FFFEDDFFF6D3FFF0CBFFEBC4FFE7BFFFE7BCF0D5AE69686B00000000000000
              0000000000000000B7ABACCAACA1FFD099FFCC99FFCC9AFFCF9EFFD3A3FFD9AA
              FFDFB3FFE6BAFFF7E2FFFFFFFFFFFFF9F9F6F8F8F7FFFFFFFFFFFFFFFFF5FFFD
              DBFFF5D1FFEEC8FFE8C0FFE4BBFFE1B6FFDFB3FFE5B48C8479706C6D00000000
              0000000000000000C1A2A4E6BC9CFFCE99FFCC99FFCC99FFCC99FFCC9AFFD09E
              FFD3A3FFEAD0FFFFFFEFECE5CDCDCAC7C7C8C9C9C9CBCBCAE7E7E3FFFFFFFFFA
              ECFFEBC0FFE5BBFFE0B5FFDCB0FFD9ACFFD7A8FFDAA7C4A88C66676900000000
              0000000000000000C1A4A8F8C89BFFCD99FFCC99FFCC99FFCC99FFCC99FFCC98
              FFCD9BFFFFFFEFE9E2CCCBCBDBDBDCDDDDDDDEDEDEDCDCDCCCCCCDE5E2DCFFFF
              FFFFE5C0FFDAACFFD7A8FFD4A4FFD1A1FFD09EFFD09DECC09566666A00000000
              0000000000000000C6A7AAFFCD98FFCC99FFCC99FFCC99FFCC99FDCA9AFDC997
              FFE1C3FFFFFFCDC9C6D9DADA000000000000000000000000DBDCDCC8C8C7FDFD
              FAFFEEDCFFCD99FFCD9AFFCC9AFFCC99FFCC99FFCD99FFD09A69676C00000000
              0000000000000000CCA9AAFFCE98FFCC99F8C89CE9BFA2DBB7A7D5B4AAD5B0A6
              DADFE2E2E2F6C2C4CBE3E3E3000000000000000000000000E5E5E5C8C8C8EEEC
              E9FFF8F0FFC992FFCC99FFCC99FFCC99FFCC99FFCC99FFD49C716C6F00000000
              0000000000000000D0ACAEFECD98EBC0A1D1B0ABBFA5B3B39EB7AC99BAAB90B7
              BEEBEEB9C0F8A3ADD397A9EC0000FF000000000000000000E7E7E7C9CACAEDEC
              E9FFF8F0FFC992FFCC99FFCC99FFCC99FFCC99FFCC99FFD49C74707300000000
              0000000000000000D1ADB1E4C2A4C5B7B7AD95BA8C83C7696FD55761DD596EE0
              9ADEF48996FF8797DA8EA0E90034FF0000FF000000000000DADADAC8C8C7FCFB
              FAFFECD9FFCA94FFCC99FFCC99FFCC99FFCC99FFCD99FFCE99726F7400000000
              0000000000000000C2A5BAC3A6B3B7D7D57C9BDF3F4CE8457BEF3056EF65B9F6
              63A8F63D5AFF5F7AF48092DE899BE96D8CF3D7D7D7DBDBDBCCCCCCDFDDD9FFFF
              FFFFD6AAFFCB97FFCC99FFCC99FFCC99FFCC99FFCE9AECC09477717500000000
              00000000000000FF9B8DC8A497C56F6CD89CF8F952A0F54593F65BB3F864F1FD
              408FF83981FB3762FF5E7AF48898DAA3ACD2C6C7CBC8C8C8E0DFDCFFFFFFFFF3
              E4FFD5A3FFD1A0FFCD9BFFCC99FFCC99FFCC99FFD09BCAA88B7E777900000000
              00000000000042FF6170E88481D54259EA2B61F266FFFE7DE6FD65F4FF48EDFF
              72D9FD70CDFC2F5CFC3E56FF8A9BFFB6C8F5DDE0EFFDFDFBFFFFFFFFFCEEFFE8
              BDFFE0B5FFDAACFFD5A5FFD09FFFCD9BFFCC99FFD29AA18E858B828300000000
              00000000000036FF0033FF606AE73666F057A9F77AD2FB28E0FF00CEFF02CFFF
              56F0FF5BC5FD65DBFEA0FDFE95D8FEB4CAFFE0E6FEFFFFF8FFFFE8FFF9D7FFF0
              CBFFE8C0FFE1B7FFDCAFFFD7A9FFD3A3FFD29EEFC39890848900000000000000
              00000000000035FF0032FF2C4BF82F50F13C8DF761EBFE00CEFF00CBFF00CAFF
              0DD4FF4AE2FE4CAAFD315CFD5B6FFEAEBCFDDAE2F6FFFFECFFFFE5FFFEDFFFF6
              D5FFEFC9FFE8C0FFE2B8FFDDB1FFDAABFFDCA9AE988DA5949500000000000000
              00000000000032FF0026FF0018FF4384F85BDCFC48F0FF0AD2FF00CBFF00CAFF
              19D8FF81FDFF4FA8FD3263FD5D7BFEAEBEFCDAE2F6FFFFEDFFFFE7FFFEE1FFFC
              DCFFF4D1FFEEC8FFE8C0FFE4BAFFE4B6DBBEA19B8B8F00000000000000000000
              00000000000043FF65BCFF8AE9FF71C9FF50A2F86CC4FC43ECFF10D4FF15D5FF
              3FEAFF4DABFD3487FD3465FE708BFEB5C3FDE3E9F6FFFFEFFFFFE9FFFFE4FFFF
              E0FFF8D7FFF2CEFFEEC6FFECC2F3D8B49D8A8DB1989900000000000000000000
              0000000000002FFF0026FF001FFF0020FF0C3EFD89EAFB72CCFD4AE5FF7FFFFF
              5DC7FE80FFFF2E64FD4363FD93A8FEC3D0FDF0F4F6FFFFEFFFFFEAFFFFE5FFFE
              E1FFFDDDFFF7D5FFF7D1F2DFBEA69291BAA1A200000000000000000000000000
              00000000000000FF0033FF0030FF002EFF053EFF0C3BFD54B8F954BEFC75CFFE
              296AFC58A4FD94EAFE7683FDB0BEFDD6DFFBFDFDF5FFFFF0FFFFEBFFFFE7FFFF
              E4FFFFE1FFFFE0E1D1BBAB9395C2A2A300000000000000000000000000000000
              0000000000000000003AFF0037FF0032FF002EFF001DFF86E6FF2F65F82F5FF3
              3464FA475FFD85B0FDB6E3FEC8D2FDF1F3FBFFFFF5FFFFF2FFFFEEFFFFECFFFF
              EBF3EED4C6B0AABB9EA1BFA6A700000000000000000000000000000000000000
              0000000000000000000000003AFF002FFF0030FF0019FF8FF3FF0017FF2B48F8
              636DE48986D8A6A4E3C3CEF1E8EDFBFFFFFFFFFFFCFDFEF1F3EDDFE0D2C8C9B0
              ACC4A3A6D4B5B500000000000000000000000000000000000000000000000000
              0000000000000000000000000000003AFF0035FF0023FF7BD8FF001EFF0030FF
              0030FF5063EA988AC7C5A3B3D0A7A7CFA7A8CAA5A6C5A1A2C3A0A2C29FA0CDAE
              AE00000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000FF1557FF3E8BFF0033FF003AFF
              003EFF002FFF0000FF0000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000}
            Properties.GraphicTransparency = gtTransparent
            Properties.ShowFocusRect = False
            Properties.Stretch = True
            Style.BorderColor = clWhite
            Style.BorderStyle = ebsNone
            Style.HotTrack = True
            Style.LookAndFeel.Kind = lfOffice11
            Style.LookAndFeel.NativeStyle = False
            Style.LookAndFeel.SkinName = 'Black'
            Style.Shadow = True
            Style.TransparentBorder = True
            StyleDisabled.BorderColor = clWhite
            StyleDisabled.Color = clBtnFace
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.SkinName = 'Black'
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.SkinName = 'Black'
            StyleHot.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.SkinName = 'Black'
            TabOrder = 1
          end
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = #1047#1072#1087#1080#1089#1100
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object paMain: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 47
          Width = 804
          Height = 455
          Margins.Top = 0
          Align = alClient
          BevelOuter = bvNone
          Caption = 'paMain'
          TabOrder = 0
          ExplicitWidth = 813
          ExplicitHeight = 467
          object gbBurnCD: TcxGroupBox
            AlignWithMargins = True
            Left = 606
            Top = 0
            Margins.Top = 0
            Margins.Right = 0
            Align = alRight
            Caption = #1054#1087#1077#1088#1072#1094#1080#1080
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWhite
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
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
            ExplicitHeight = 464
            Height = 452
            Width = 198
            object bEraseDisc: TcxButton
              Left = 5
              Top = 169
              Width = 189
              Height = 40
              Caption = #1041#1099#1089#1090#1088#1086' '#1086#1095#1080#1089#1090#1080#1090#1100
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = bEraseDiscClick
              OnMouseLeave = bEraseDiscMouseLeave
              OnMouseMove = bEraseDiscMouseMove
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = 'Office2007Green'
            end
            object bOptions: TcxButton
              Left = 6
              Top = 307
              Width = 189
              Height = 40
              Hint = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
              Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              OnClick = bOptionsClick
              OnMouseLeave = bOptionsMouseLeave
              OnMouseMove = bOptionsMouseMove
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = 'Office2007Green'
            end
            object bBuildISO: TcxButton
              Left = 5
              Top = 215
              Width = 189
              Height = 40
              Hint = #1057#1086#1079#1076#1072#1090#1100' ISO-'#1086#1073#1088#1072#1079
              Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1073#1088#1072#1079' ISO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = bBuildISOClick
              OnMouseLeave = bBuildISOMouseLeave
              OnMouseMove = bBuildISOMouseMove
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = 'Office2007Green'
            end
            object bBurnISO: TcxButton
              Left = 5
              Top = 261
              Width = 189
              Height = 40
              Hint = #1047#1072#1087#1080#1089#1072#1090#1100' ISO-'#1086#1073#1088#1072#1079
              Caption = #1047#1072#1087#1080#1089#1072#1090#1100' '#1086#1073#1088#1072#1079' ISO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnClick = bBurnISOClick
              OnMouseLeave = bBurnISOMouseLeave
              OnMouseMove = bBurnISOMouseMove
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = 'Office2007Green'
            end
            object bBurn: TcxButton
              Left = 3
              Top = 353
              Width = 189
              Height = 40
              Hint = #1055#1088#1086#1078#1080#1075' ('#1079#1072#1087#1080#1089#1100') '#1076#1072#1085#1085#1099#1093' '#1085#1072' '#1076#1080#1089#1082
              Caption = #1047#1072#1087#1080#1089#1072#1090#1100' '#1076#1080#1089#1082
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              OnClick = bBurnClick
              Glyph.Data = {
                360C0000424D360C000000000000360000002800000020000000200000000100
                180000000000000C0000C40E0000C40E00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E00009E00009E0000
                9E00009E00009E00009E00009E00009E00009E00009E00009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E00009E00009E0000
                9E00009E00009E00009E00009E00009E00009E00009E00009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E00009E00009E0000
                9E00009E00009E00009E00009E00009E00009E00009E00009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E00009E00009E0000
                9E00009E00009E3837BF4341C4403FC52827C100009E00009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E00009E00009E1B1A
                B38B89D4D9D6EAFBF8F4FFFFF6FFFFF6EEEAF1BBB8E45251CD00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E00009E3D3CBBDBD8
                EAFFFFF8FFFFF6FCF8F4FAF6F3FAF6F3FFFBF4FFFFF6FFFDF59795DE00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E0000A32B2AB4E5E2EEFFFF
                F6F9F5F3F9F5F3F9F5F3F9F5F3F9F5F3F9F5F3F9F5F3FCF8F4FFFFF79794DF00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E0303A5B4B1DEFFFFF6F9F5
                F3F9F5F3F9F5F3F9F5F3F9F5F3F9F5F3F9F5F3F9F5F3F9F5F3FBF7F3FFFCF44E
                4DD100009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E0000A200009E3938B7FAF7F3FAF6F3F9F5
                F3F9F5F3F9F5F3F9F5F3F9F5F3F9F5F3F9F5F3F9F5F3F9F5F3F9F5F3FFFEF5B9
                B7E600009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E0000A00000A200009E7B79CCFFFFF6F9F5F3F9F5
                F3F9F5F3F9F5F3F9F5F3F9F5F3F9F5F3F9F5F3FCF8F4FFFEF5FCF8F4FCF8F4E5
                E2EF00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E0000A00000A200009EA19FD8FFFDF5F9F5F3F9F5
                F3F9F5F3F9F5F3F9F5F3F9F5F3F9F5F3FDF9F4FAF5F3D7D4EBF8F4F3FFFCF4F4
                F1F200009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009C00009E0000A00000A200009EA6A3D9FFFDF5F9F5F3F9F5
                F3F9F5F3F9F5F3F9F5F3F9F5F3FBF7F3F1EDF15A58CE00009E4C4BCDEDE9F1F4
                F0F200009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E0000A00000A200009E8381CEFFFFF6F9F4F3FDF9
                F4FFFBF5F9F5F3F9F5F3F9F5F3FFFCF5BCB9E500009E00009E00009E7E7DD9D7
                D4EC00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E0000A000009E00009E3F3DB9FCF8F4FBF7F3EEEA
                F0EAE6EFFFFFF6F9F5F3F9F5F3FFFDF5B8B5E300009E00009E00009E3837CA62
                61D500009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009EBEBBE1FFFFF87976
                CE2928B7C8C4E6FFFDF5F9F5F3FEFAF4CFCBE900009E00009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E3837B8FAF7F46866
                C900009E2827BAEBE8EFFCF8F4FCF8F4E9E5EF2626C200009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E0000A4706ECA9997
                D800009E00009E8F8DD7FFFEF5F9F5F3FDF9F43A39C700009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E00009E00009E4D4C
                C100009E00009E3D3BC0FBF7F3F9F5F3FFFFF5403FC800009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E00009E00009E0000
                9E00009E00009E00009EE4E0EEFDF9F4FDF9F43A39C700009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E0000A000009E00009E00009E00009E00009E00009E0000
                9E00009E00009E00009EDDD9ECFFFEF5E0DCED00009E00009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E00009E00009E0000
                9E00009E00009E2B2ABBF2EFF1FFFFF77D7CD600009E00009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E00009E00009E0000
                9E00009E00009E7270CFFFFFFAADABE100009E00009E00009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E00009E00009E0000
                9E00009E2626B9DBD7EB9290D900009E00009E00009E00009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E00009E00009E0000
                9E00009E6665CA4745C300009E00009E00009E00009E00009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E00009E00009E0000
                9E00009E00009E00009E00009E00009E00009E00009E00009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E00009E00009E0000
                9E00009E00009E00009E00009E00009E00009E00009E00009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                00000000009E00009E00009E00009E00009E00009E00009E00009E00009E0000
                9E00009E00009E00009E00009E00009E00009E00009E00009E00009E00009E00
                009E00009E00009E00009E00009E00009E00009E000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = 'Office2007Green'
            end
            object bReady: TcxButton
              Left = 5
              Top = 123
              Width = 189
              Height = 40
              Hint = #1043#1086#1090#1086#1074' '#1083#1080' '#1087#1088#1080#1074#1086#1076' '#1082' '#1087#1088#1086#1078#1080#1075#1091'?'
              Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1075#1086#1090#1086#1074#1085#1086#1089#1090#1100
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = bReadyClick
              OnMouseLeave = bReadyMouseLeave
              OnMouseMove = bReadyMouseMove
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = 'Office2007Green'
            end
            object bEject: TcxButton
              Left = 5
              Top = 31
              Width = 189
              Height = 40
              Hint = #1054#1090#1082#1088#1099#1090#1100' '#1087#1088#1080#1074#1086#1076
              Caption = #1048#1079#1074#1083#1077#1095#1100' '#1076#1080#1089#1082
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = bEjectClick
              OnMouseLeave = bEjectMouseLeave
              OnMouseMove = bEjectMouseMove
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = 'Office2007Green'
            end
            object bInfo: TcxButton
              Left = 5
              Top = 77
              Width = 189
              Height = 40
              Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1088#1080#1074#1086#1076#1077' '
              Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1076#1080#1089#1082#1077
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = bInfoClick
              OnMouseLeave = bInfoMouseLeave
              OnMouseMove = bInfoMouseMove
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = 'Office2007Green'
            end
            object bAbort: TcxButton
              Left = 5
              Top = 399
              Width = 189
              Height = 40
              Action = aStop
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 8
              Glyph.Data = {
                360C0000424D360C000000000000360000002800000020000000200000000100
                180000000000000C0000C40E0000C40E00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000A00000A00000A00000A00000A00000A00000A00000A00000A00000
                A00000A00000A00000A00000A00000A00000A00000A00000A00000A00000A000
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A00000A00000A00000A00000A00000
                A00000A00000A00000A00000A00000A00000A00000A00000A00000A00000A000
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A00000A00000A00000A00000A00000
                A00000A00000A00000A00000A00000A00000A00000A00000A00000A00000A000
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A00000A00000A00000A00000A00000
                A00000A00000A00000A00000A00000A00000A00000A00000A00000A00000A000
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A00000A00000A00000A00000A00000
                A00000A00000A00000A00000A00000A00000A00000A00000A00000A00000A000
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A00000A07B79C9AFADD97D7BCC0000
                A00000A00000A00000A00000A00000A00000A00000A00000A08D8BD7ADAADC65
                63D10000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A08584CBFFFEF0FEFCF0FFFEF1AAAA
                DB0000A00000A00000A00000A00000A00000A00000A0C5C3E3FFFCEDFCF9EBF9
                F5EA5C5BD10000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A0C7C6DFF6F4EEF0EEEDF1F0EEFEFC
                F2ACABDC0000A00000A00000A00000A00000A0C7C5E4FBF9EEEEECEBEDEBEAF7
                F4EAA19EDC0000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A000009E0000A00000A09A99D3FFFDF1F0EEEDF0EFEEF2F0
                F0FFFEF4ACACDF0000A00000A00000A0C7C6E5FCFBF0EFEDECEEECEBEFECEAFB
                F8EB706ED40000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A000009E0000A00000A00000A0C5C3E0FCFAF1F0EFEEF1F0
                F0F3F2F1FFFFF6A9A8DF0000A0C6C4E5FDFBF2F0EFEEEFEDECEFEDEBFBF8ECA8
                A6DD0000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A000009E0000A00000A00000A00000A00000A0C6C4E0FDFBF1F1EF
                EFF1F0F0F2F1F1F9F8F3E9E8EEF9F7F1F0EFEEF0EEEDEFEEECFCF9EDA8A6DD00
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A000009C00009E0000A00000A00000A00000A00000A0C6C5E1FCFB
                F1F0EFEFF1EFEFF1F0EFF5F4F0F0EFEEF0EEEDF0EEEDFCF9EEA8A6DD0000A000
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A000009C00009E0000A00000A00000A00000A00000A00000A0BEBD
                DFF3F1EEF0EEEDF0EEEDF0EEEDF0EEEDF0EEECF1EFECA4A2DB0000A00000A000
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A00000A00000A00000A00000A00000
                A0EBE9EBF0EEECEFEDECEEECEBEEECEBF1EFEBDBD8E60000A00000A00000A000
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A000009E0000A00000A00000A00000A00000A00000A0BEBC
                DDF1EEEBEEEBEAEEEBEAEEEBEAEEEBEAEEEAE9F0EDE9A4A1DA0000A00000A000
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A000009C00009E0000A00000A00000A00000A00000A0C4C1DDF9F5
                EBECE9E8EDE9E8EEEAE8F2EEE9EDE9E8EDE9E8EDE9E7F9F5E9A7A4DA0000A000
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A000009E00009E0000A00000A00000A00000A0C3BFDBF7F3E9EBE7
                E6EBE7E6EDE9E7F3EFE8E3DFE5F3EFE8EBE7E6EBE7E6ECE7E5F8F3E7A7A3D900
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A00000A0C2BDD9F6F1E7EAE5E4EBE6
                E5EBE7E5F8F3E8A29ED50000A0BFBBDCF7F1E7EAE5E4EAE5E4EBE5E3F7F0E5A5
                A1D90000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A09895CDF8F2E6E9E3E2EAE3E3EAE4
                E3F7F1E5A6A1D40000A00000A00000A0C1BCDCF5EFE5E9E3E2E9E3E2E9E3E2F7
                F1E4706DD20000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A0C3BED8F0EAE4E9E3E2EAE4E2F6F0
                E5A5A1D20000A00000A00000A00000A00000A0C0BBDBF5EFE4E9E3E2E9E3E2F3
                EDE39E9AD80000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A0827EC6FBF4E7F8F2E6F9F3E6A5A0
                D20000A00000A00000A00000A00000A00000A00000A0C0BBDBFAF4E5F8F2E4F4
                EEE45A58CF0000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A00000A07673C4A9A5D17774C60000
                A00000A00000A00000A00000A00000A00000A00000A00000A08885D2A8A3D861
                5FCE0000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A00000A00000A00000A00000A00000
                A00000A00000A00000A00000A00000A00000A00000A00000A00000A00000A000
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A00000A00000A00000A00000A00000
                A00000A00000A00000A00000A00000A00000A00000A00000A00000A00000A000
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A00000A00000A00000A00000A00000
                A00000A00000A00000A00000A00000A00000A00000A00000A00000A00000A000
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A00000A00000A00000A00000A00000
                A00000A00000A00000A00000A00000A00000A00000A00000A00000A00000A000
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000A00000A00000A00000A00000A00000A00000A00000A00000A00000
                A00000A00000A00000A00000A00000A00000A00000A00000A00000A00000A000
                00A00000A00000A00000A00000A00000A00000A0000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.NativeStyle = False
              LookAndFeel.SkinName = 'Office2007Green'
            end
          end
          object cxGroupBox4: TcxGroupBox
            AlignWithMargins = True
            Left = 266
            Top = 0
            Margins.Top = 0
            Align = alClient
            Caption = #1047#1072#1087#1080#1089#1100' '#1076#1080#1089#1082#1072
            ParentFont = False
            Style.BorderStyle = ebsOffice11
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWhite
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
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
            ExplicitWidth = 343
            ExplicitHeight = 464
            Height = 452
            Width = 334
            object cxLabel9: TcxLabel
              Left = 14
              Top = 31
              Caption = #1055#1088#1086#1075#1088#1077#1089#1089' '#1079#1072#1087#1080#1089#1080':'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -13
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Properties.Alignment.Horz = taRightJustify
              Transparent = True
              AnchorX = 120
            end
            object pbProg: TcxProgressBar
              Left = 6
              Top = 59
              Style.LookAndFeel.SkinName = 'Office2007Green'
              StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
              StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
              StyleHot.LookAndFeel.SkinName = 'Office2007Green'
              TabOrder = 1
              Width = 322
            end
            object cxLabel10: TcxLabel
              Left = 13
              Top = 97
              Caption = #1041#1091#1092#1077#1088' '#1079#1072#1087#1080#1089#1080':'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -13
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Properties.Alignment.Horz = taRightJustify
              Transparent = True
              AnchorX = 104
            end
            object pbBuf: TcxProgressBar
              Left = 6
              Top = 125
              Style.LookAndFeel.SkinName = 'Office2007Green'
              StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
              StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
              StyleHot.LookAndFeel.SkinName = 'Office2007Green'
              TabOrder = 3
              Width = 241
            end
            object memLog: TcxMemo
              Left = 6
              Top = 178
              Hint = #1048#1089#1090#1086#1088#1080#1103' '#1088#1072#1073#1086#1090#1099
              TabStop = False
              ParentFont = False
              ParentShowHint = False
              PopupMenu = pmLog
              Properties.ScrollBars = ssVertical
              ShowHint = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.LookAndFeel.Kind = lfOffice11
              Style.LookAndFeel.SkinName = 'Silver'
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.Kind = lfOffice11
              StyleDisabled.LookAndFeel.SkinName = 'Silver'
              StyleFocused.LookAndFeel.Kind = lfOffice11
              StyleFocused.LookAndFeel.SkinName = 'Silver'
              StyleHot.LookAndFeel.Kind = lfOffice11
              StyleHot.LookAndFeel.SkinName = 'Silver'
              TabOrder = 4
              Height = 262
              Width = 322
            end
            object cxLabel11: TcxLabel
              Left = 8
              Top = 154
              Caption = #1051#1086#1075#1080':'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -13
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Properties.Alignment.Horz = taRightJustify
              Transparent = True
              AnchorX = 45
            end
            object pbHBuf: TcxProgressBar
              Left = 253
              Top = 125
              Style.LookAndFeel.SkinName = 'Office2007Green'
              StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
              StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
              StyleHot.LookAndFeel.SkinName = 'Office2007Green'
              TabOrder = 6
              Width = 75
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 263
            Height = 455
            Align = alLeft
            BevelOuter = bvNone
            Caption = 'Panel4'
            TabOrder = 2
            ExplicitHeight = 467
            object cxGroupBox1: TcxGroupBox
              AlignWithMargins = True
              Left = 0
              Top = 0
              Margins.Left = 0
              Margins.Top = 0
              Align = alClient
              Caption = #1055#1088#1080#1074#1086#1076
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWhite
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
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
              Transparent = True
              ExplicitHeight = 363
              Height = 351
              Width = 260
              object lDrive: TcxLabel
                Left = 12
                Top = 31
                Caption = 'CD '#1087#1088#1080#1074#1086#1076':'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 83
              end
              object cbDrives: TcxComboBox
                Left = 7
                Top = 59
                Hint = #1057#1087#1080#1089#1086#1082' '#1087#1088#1080#1074#1086#1076#1086#1074
                ParentFont = False
                ParentShowHint = False
                Properties.DropDownListStyle = lsFixedList
                Properties.ImmediatePost = True
                Properties.ImmediateUpdateText = True
                Properties.PostPopupValueOnTab = True
                Properties.OnChange = cbDrivesPropertiesChange
                ShowHint = True
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clBlack
                Style.Font.Height = -13
                Style.Font.Name = 'Book Antiqua'
                Style.Font.Style = []
                Style.LookAndFeel.Kind = lfOffice11
                Style.LookAndFeel.SkinName = 'Office2007Green'
                Style.IsFontAssigned = True
                StyleDisabled.LookAndFeel.Kind = lfOffice11
                StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
                StyleFocused.LookAndFeel.Kind = lfOffice11
                StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
                StyleHot.LookAndFeel.Kind = lfOffice11
                StyleHot.LookAndFeel.SkinName = 'Office2007Green'
                TabOrder = 1
                Width = 245
              end
              object cxLabel6: TcxLabel
                Left = 13
                Top = 97
                Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1079#1072#1087#1080#1089#1080':'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 120
              end
              object cbSpeed: TcxComboBox
                Left = 7
                Top = 125
                Hint = #1057#1082#1086#1088#1086#1089#1090#1100' '#1079#1072#1087#1080#1089#1080
                ParentFont = False
                ParentShowHint = False
                Properties.DropDownListStyle = lsFixedList
                Properties.ImmediatePost = True
                Properties.ImmediateUpdateText = True
                Properties.PostPopupValueOnTab = True
                Properties.OnInitPopup = cbSpeedPropertiesInitPopup
                ShowHint = True
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clBlack
                Style.Font.Height = -13
                Style.Font.Name = 'Book Antiqua'
                Style.Font.Style = []
                Style.LookAndFeel.Kind = lfOffice11
                Style.LookAndFeel.SkinName = 'Office2007Green'
                Style.IsFontAssigned = True
                StyleDisabled.LookAndFeel.Kind = lfOffice11
                StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
                StyleFocused.LookAndFeel.Kind = lfOffice11
                StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
                StyleHot.LookAndFeel.Kind = lfOffice11
                StyleHot.LookAndFeel.SkinName = 'Office2007Green'
                TabOrder = 3
                Width = 245
              end
              object cxLabel13: TcxLabel
                Left = 14
                Top = 166
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1080#1089#1082#1072':'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 116
              end
              object teNameDisc: TcxTextEdit
                Left = 5
                Top = 192
                ParentFont = False
                Style.Color = clWhite
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clBlack
                Style.Font.Height = -13
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.LookAndFeel.SkinName = 'Office2007Green'
                Style.IsFontAssigned = True
                StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
                StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
                StyleHot.LookAndFeel.SkinName = 'Office2007Green'
                TabOrder = 5
                Width = 247
              end
            end
            object cxGroupBox2: TcxGroupBox
              AlignWithMargins = True
              Left = 0
              Top = 354
              Margins.Left = 0
              Margins.Top = 0
              Align = alBottom
              Caption = #1058#1080#1087' '#1076#1080#1089#1082#1072
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWhite
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
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
              Visible = False
              Height = 98
              Width = 260
              object rb1: TcxRadioButton
                Left = 8
                Top = 36
                Width = 113
                Height = 17
                Caption = #1054#1073#1099#1095#1085#1099#1081
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = rb1Click
                LookAndFeel.Kind = lfOffice11
                LookAndFeel.SkinName = 'Office2007Green'
                Transparent = True
              end
              object rb2: TcxRadioButton
                Left = 8
                Top = 67
                Width = 113
                Height = 17
                Caption = #1040#1088#1093#1080#1074#1085#1099#1081
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = rb2Click
                LookAndFeel.Kind = lfOffice11
                LookAndFeel.SkinName = 'Office2007Green'
                Transparent = True
              end
            end
          end
        end
        object Panel6: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 804
          Height = 41
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          object cxImage2: TcxImage
            Left = 3
            Top = 2
            TabStop = False
            AutoSize = True
            Enabled = False
            ParentShowHint = False
            Picture.Data = {
              07544269746D6170360C0000424D360C00000000000036000000280000002000
              0000200000000100180000000000000C0000F00A0000F00A0000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000008B80817E7374776C6E726B6C746E6F716A6B6863636561616664646D6D
              6E00000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000009093939C8B8C
              8F8081A59B96CFCABEF0EEDFFFFFF7FFFFFFFFFFFFFFFFFFEEEEECC4C3BF8D8B
              8868656671717200000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000AB999A948083B2A69E
              F6F4D8FFFFEDFFFFEDFFFFEEFFFFF1FFFFF5FFFFFBFFFFFFFFFFFEFFFFFDFFFF
              FEF2F0E295948E6663656B6B6C00000000000000000000000000000000000000
              0000000000000000000000000000000000000000B19A9BA08B8CE4D7BDFFFFE0
              FFFFE1FFFFE2FFFFE6FFFFEBFFFFF0FFFFF5FFFFFAFFFFFFFFFFFAFFFFF5FFFF
              F0FFFFF0FFFFF5D4D3C265656671727200000000000000000000000000000000
              0000000000000000000000000000000000BCA0A1A99594F8E5C0FFF7D8FFF8D7
              FFFCDCFFFEE0FFFFE5FFFFEAFFFFEFFFFFF4FFFFFAFFFFFFFFFFF9FFFFF3FFFF
              EEFFFFEAFFFFE7FFFFEAF1F2D56C6B6A6F6F7000000000000000000000000000
              0000000000000000000000000000C5ACADAB9595F8DCB6FFEECC9FCC85E1EACA
              FFF8DCFFFEDFFFFFE3FFFFE8FFFFEEFFFFF4FFFFFAFFFFFEFFFFF7FFFFF1FFFF
              ECFFFFE8FFFFE3FFFFE1FFFFE1F3EECD64646676767600000000000000000000
              00000000000000000000008B9090B0979AE9C8A6FFE2B4FFEACA7DBE6D2DA031
              E2EDCDFFFBDEFFFEE2FFFFE6FFFFEDFFFFF4FFFFFCFFFFFDFFFFF5FFFFEFFFFF
              E9FFFFE5FFFEE0FFFEDDFFF9D6FFFAD4D3C9AE64666800000000000000000000
              0000000000000000000000C5A9ABCBAB9DFFDBA6FFD8AAFFE5C57DBB6C3EC26E
              2C9F30E1EECEFFFEE2FFFFE4FFFFEBFFFFF3FFFFFCFFFFFBFFFFF2FFFFECFFFF
              E6FFFEE1FFFEDDFFF7D4FFF2CDFFEFC8FFF5CA938D8174717200000000000000
              0000000000000000000000D1CACDFBDCBEFFE1C1FFE3C4FFE8CE7DB86A3DBF6D
              3EBE6C2CA22FE2F1CFFFFFE6FFFFF5FFFFFDFFFFFFFFFFFDFFFFF2FFFFE7FFFE
              E2FFFEDDFFF6D3FFF0CBFFEBC4FFE7BFFFE7BCF0D5AE69686B00000000000000
              0000000000017801389D3D499F4651A74552A94550AB444EAB47228F1C47E67F
              45D9783FBD6E2DA631E3F6E3FFFFFFF9F9F6F8F8F7FFFFFFFFFFFFFFFFF5FFFD
              DBFFF5D1FFEEC8FFE8C0FFE4BBFFE1B6FFDFB3FFE5B48C8479706C6D00000000
              0000000000118C213CC26F38BD6839BE6A3BBD6B3CBD6C3EBE6D3DBA6B41CB71
              4BE87F49DA7A42BC6F2DA832CDE0CCCDCDCEC9C9C9CBCBCAE7E7E3FFFFFFFFFA
              ECFFEBC0FFE5BBFFE0B5FFDCB0FFD9ACFFD7A8FFDAA7C4A88C66676900000000
              00000000000E8C1F4EE1833CD8703FDB7343DF7744E07848E47C4AE67E4BE67F
              4CE6804EEA834DDD7F45BC7126A92ED0EFD0ECECECDCDCDCCCCCCDE5E2DCFFFF
              FFFFE5C0FFDAACFFD7A8FFD4A4FFD1A1FFD09EFFD09DECC09566666A00000000
              00000000000D8B1E5EE38E3CD77040D97343DC7646DF7948E17B4AE37D4CE57F
              4FE88250E98354EF8851E18247BD731FA925CCECCCFFFFFFDBDCDCC8C8C7FDFD
              FAFFEEDCFFCD99FFCD9AFFCC9AFFCC99FFCC99FFCD99FFD09A69676C00000000
              00000000000E8D1F6BE9983BD86F42DB7545DE7848E17B4AE37D4DE6804FE882
              51EA8453EC8655EE8858F48C56E4884DC1782FAD2FFFFFFFE5E5E5C8C8C8EEEC
              E9FFF8F0FFC992FFCC99FFCC99FFCC99FFCC99FFCC99FFD49C716C6F00000000
              00000000000C8E1D7BEBA339DA6E41DD7544E07847E37C49E57D4CE8814EEA83
              54ED8756EF8958F18B5EF9935CED9221A825D1EDD1FFFFFFE7E7E7C9CACAEDEC
              E9FFF8F0FFC992FFCC99FFCC99FFCC99FFCC99FFCC99FFD49C74707300000000
              00000000000D8F1E8EF0B25CE08863E38D67E7926AE8946DEC9770ED9A75F19E
              5CF08D59F38C5EF79363FD9A25B42BD2F2D2FFFFFF000000DADADAC8C8C7FCFB
              FAFFECD9FFCA94FFCC99FFCC99FFCC99FFCC99FFCD99FFCE99726F7400000000
              000000000011952572F5A674F0A278F3A67CF4A97EF8AB83F9B182FBAD9FF8BE
              5AF28D5EF79264FF9B31B337D6EAD6F4F4F4D7D7D7DBDBDBCCCCCCDFDDD9FFFF
              FFFFD6AAFFCB97FFCC99FFCC99FFCC99FFCC99FFCE9AECC09477717500000000
              000000000000830041A6454FAD4850B04750B3484FB54850B6492697217FF7A8
              5BF89164FF9B34B53BDBEBDACFCFCDC8C8C8CACACAC8C8C8E0DFDCFFFFFFFFF3
              E4FFD5A3FFD1A0FFCD9BFFCC99FFCC99FFCC99FFD09BCAA88B7E777900000000
              0000000000000000EFC5C7EED5D0FFEACBFFEBCEFFECD1FFF0D97DBD6E76FDA7
              63FE9A35B439E5F6DFFFFFFFFFFFFFF2F0F1EFEFEEFDFDFBFFFFFFFFFCEEFFE8
              BDFFE0B5FFDAACFFD5A5FFD09FFFCD9BFFCC99FFD29AA18E858B828300000000
              0000000000000000000000ECC0C3FBDCB6FFE5BAFFE7BFFFF0D47DC37169FFA1
              34B339E5F6D8FFFFE9FFFFF1FFFFFCFFFFFFFFFFFEFFFFF8FFFFE8FFF9D7FFF0
              CBFFE8C0FFE1B7FFDCAFFFD7A9FFD3A3FFD29EEFC39890848900000000000000
              0000000000000000000000FFD4D6E9C5BBFFEEC3FFEFC7FFF5DA7DCA7235B43D
              E6F6D8FFFFE8FFFFECFFFFF2FFFFFBFDFDFCFFFFF4FFFFECFFFFE5FFFEDFFFF6
              D5FFEFC9FFE8C0FFE2B8FFDDB1FFDAABFFDCA9AE988DA5949500000000000000
              0000000000000000000000000000F1C2C5F4DDC4FFF7D1FFFADDA2DB93E5F3D7
              FFFFE7FFFFE9FFFFEEFFFFF5FEFEFCFDFDFAFFFFF4FFFFEDFFFFE7FFFEE1FFFC
              DCFFF4D1FFEEC8FFE8C0FFE4BAFFE4B6DBBEA19B8B8F00000000000000000000
              0000000000000000000000000000FFDBDCE5BABAFAF0D3FFFFDEFFFEE7FFFFE5
              FFFFE8FFFFECFFFFF1FFFFF8FDFDFDFEFEFCFFFFF5FFFFEFFFFFE9FFFFE4FFFF
              E0FFF8D7FFF2CEFFEEC6FFECC2F3D8B49D8A8DB1989900000000000000000000
              0000000000000000000000000000000000FDCCCDE5BCBCFAF6DAFFFFE6FFFFE7
              FFFFEAFFFFEEFFFFF3FFFFF8FDFDFDFFFFFCFFFFF5FFFFEFFFFFEAFFFFE5FFFE
              E1FFFDDDFFF7D5FFF7D1F2DFBEA69291BAA1A200000000000000000000000000
              0000000000000000000000000000000000000000FFD3D4E5B9B9F3E4D5FFFFED
              FFFFEEFFFFF0FFFFF5FFFFFBFDFDFCFFFFFAFFFFF5FFFFF0FFFFEBFFFFE7FFFF
              E4FFFFE1FFFFE0E1D1BBAB9395C2A2A300000000000000000000000000000000
              0000000000000000000000000000000000000000000000FFCDCDF1C3C5E8C8C3
              F8F2E5FFFFF8FFFFF9FFFFFDFDFEFDFFFFFBFFFFF5FFFFF2FFFFEEFFFFECFFFF
              EBF3EED4C6B0AABB9EA1BFA6A700000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000FFD4D4
              EBBEBFE3C0BFECDAD7F6EFEDFCFCFBFFFFFFFFFFFCFDFEF1F3EDDFE0D2C8C9B0
              ACC4A3A6D4B5B500000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000EEC0C1D8AFAFD5ADADD0A7A7CFA7A8CAA5A6C5A1A2C3A0A2C29FA0CDAE
              AE00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000}
            Properties.GraphicTransparency = gtTransparent
            Properties.ShowFocusRect = False
            Properties.Stretch = True
            Style.BorderColor = clWhite
            Style.BorderStyle = ebsNone
            Style.HotTrack = True
            Style.LookAndFeel.Kind = lfOffice11
            Style.LookAndFeel.NativeStyle = False
            Style.LookAndFeel.SkinName = 'Black'
            Style.Shadow = True
            Style.TransparentBorder = True
            StyleDisabled.BorderColor = clWhite
            StyleDisabled.Color = clBtnFace
            StyleDisabled.LookAndFeel.Kind = lfOffice11
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.SkinName = 'Black'
            StyleFocused.LookAndFeel.Kind = lfOffice11
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.SkinName = 'Black'
            StyleHot.LookAndFeel.Kind = lfOffice11
            StyleHot.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.SkinName = 'Black'
            TabOrder = 0
          end
          object cxLabel8: TcxLabel
            Left = 49
            Top = 10
            Caption = #1047#1072#1087#1080#1089#1100' '#1085#1072' '#1076#1080#1089#1082
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.TextColor = clTeal
            Style.IsFontAssigned = True
            Transparent = True
          end
        end
      end
    end
    object pbSize: TcxProgressBar
      AlignWithMargins = True
      Left = 3
      Top = 543
      Margins.Top = 0
      Align = alTop
      Properties.BeginColor = clSkyBlue
      Properties.ShowText = False
      Properties.ShowTextStyle = cxtsPosition
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Width = 819
    end
    object cxLabel12: TcxLabel
      Left = 6
      Top = 571
      Caption = #1057#1074#1086#1073#1086#1076#1085#1086':'
    end
    object lbFreeSize: TcxLabel
      Left = 70
      Top = 571
      Caption = '--'
    end
    object bClose: TcxButton
      Left = 747
      Top = 568
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 352
    Top = 456
    object aOK: TAction
      Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072
      Hint = #1055#1086#1076#1075#1086#1090#1086#1074#1080#1090#1100' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103' '#1082' '#1079#1072#1087#1080#1089#1080' '#1085#1072' CD'
      ShortCut = 120
      OnExecute = aOKExecute
    end
    object aStop: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100
      OnExecute = aStopExecute
    end
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object pmToCD: TPopupMenu
    Left = 388
    Top = 405
    object N1: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' ('#1076#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082')'
      OnClick = N2Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 392
    Top = 456
  end
  object od: TOpenDialog
    DefaultExt = 'iso'
    Filter = '.ISO Files (*.iso)|*.ISO|All File (*.*)|*.*'
    Options = [ofReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 384
    Top = 348
  end
  object pmLog: TPopupMenu
    Left = 348
    Top = 408
    object ClearAll1: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1083#1086#1075#1080
      ShortCut = 119
      OnClick = ClearAll1Click
    end
  end
  object qUpdate: TpFIBQuery
    SQL.Strings = (
      'UPDATE STUDIES'
      'SET STATUS = :STATUS,'
      '    NAME_DISC = :NAME_DISC '
      'WHERE STUDYUID = :STUDYUID')
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 131
    Top = 400
    qoAutoCommit = True
  end
  object mcdb: TMCDBurner
    OnDebugMessage = mcdbDebugMessage
    DeviceBufferSize = 0
    DeviceFreeBufferSize = 0
    UnderrunProtection = True
    DoDebug = True
    OnEraseDone = mcdbEraseDone
    ReadSpeed = 0
    WriteSpeed = 0
    FinalizeDisc = False
    TestWrite = False
    ReplaceFile = False
    PerformOPC = False
    CacheSize = 4194304
    OnAddFile = mcdbAddFile
    OnWriteDone = mcdbWriteDone
    OnFinalizingTrack = mcdbFinalizingTrack
    Version = '1.23'
    WritePostGap = True
    Left = 56
    Top = 318
  end
  object StudyList: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 328
    Top = 120
    object StringField1: TStringField
      FieldName = 'P_ENAME'
      Size = 100
    end
    object StringField2: TStringField
      FieldName = 'P_ENAME_RUS'
      Size = 100
    end
    object DateTimeField1: TDateTimeField
      DisplayWidth = 20
      FieldName = 'P_DATEBORN'
    end
    object StringField3: TStringField
      DisplayWidth = 5
      FieldName = 'P_SEX'
      Size = 3
    end
    object DateTimeField2: TDateTimeField
      DisplayWidth = 20
      FieldName = 'LDATE'
    end
    object StringField4: TStringField
      DisplayWidth = 50
      FieldName = 'P_PID'
    end
    object IntegerField1: TIntegerField
      DisplayWidth = 10
      FieldName = 'CNT'
    end
    object StringField6: TStringField
      DisplayWidth = 20
      FieldName = 'STUDIES_IMAGE_TYPE'
      Size = 50
    end
    object StringField7: TStringField
      DisplayWidth = 250
      FieldName = 'NAME_DISC'
      Size = 100
    end
    object StringField8: TStringField
      DisplayWidth = 50
      FieldName = 'ACCESSIONNUMBER'
      Size = 100
    end
    object StringField9: TStringField
      FieldName = 'FILENAME'
      Size = 250
    end
    object StudyListSTUDYUID: TStringField
      DisplayWidth = 80
      FieldName = 'STUDYUID'
      Size = 80
    end
    object StudyListffile: TBlobField
      FieldName = 'ffile'
    end
    object StudyListVDESC: TStringField
      FieldName = 'VDESC'
      Size = 80
    end
    object StudyListSTUDYID: TStringField
      FieldName = 'STUDYID'
    end
  end
end
