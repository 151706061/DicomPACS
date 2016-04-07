object frmMain: TfrmMain
  Left = 228
  Top = 2
  ClientHeight = 682
  ClientWidth = 955
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 682
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    OnResize = pnlMainResize
    ExplicitHeight = 680
  end
  object Panel1: TPanel
    Left = 600
    Top = 0
    Width = 355
    Height = 682
    Align = alRight
    TabOrder = 1
    OnClick = a1Execute
    ExplicitHeight = 671
    object Label7: TLabel
      Left = 228
      Top = 8
      Width = 13
      Height = 14
      Caption = 'F1'
    end
    object pcMain: TcxPageControl
      Left = 1
      Top = 1
      Width = 353
      Height = 680
      ActivePage = tsOnLine
      Align = alClient
      TabOrder = 0
      OnPageChanging = pcMainPageChanging
      ExplicitHeight = 669
      ClientRectBottom = 680
      ClientRectRight = 353
      ClientRectTop = 25
      object tsOnLine: TcxTabSheet
        Caption = #1053#1072' '#1083#1080#1085#1080#1080
        ImageIndex = 0
        ExplicitHeight = 653
        object gNotOnLine: TcxGrid
          Left = 0
          Top = 0
          Width = 353
          Height = 415
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          ExplicitHeight = 413
          object tvNotOnLine: TcxGridDBTableView
            DragMode = dmAutomatic
            PopupMenu = popNotOnline
            OnDragOver = tvNotOnLineDragOver
            NavigatorButtons.ConfirmDelete = False
            OnCellClick = tvNotOnLineCellClick
            OnCellDblClick = tvNotOnLineCellDblClick
            OnCustomDrawCell = tvNotOnLineCustomDrawCell
            OnFocusedRecordChanged = tvNotOnLineFocusedRecordChanged
            DataController.DataSource = dsNotOnLine
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                Column = tvNotOnLineColumn2
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnMoving = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.DataRowHeight = 30
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            object tvNotOnLineFC_NAME: TcxGridDBColumn
              Caption = #1055#1086#1079#1099#1074#1085#1086#1081
              DataBinding.FieldName = 'FC_NAME'
              Visible = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              SortIndex = 0
              SortOrder = soAscending
              Width = 38
            end
            object tvNotOnLineFK_ID: TcxGridDBColumn
              DataBinding.FieldName = 'FK_ID'
              Visible = False
              HeaderAlignmentVert = vaCenter
              Options.Sorting = False
            end
            object tvNotOnLineColumn3: TcxGridDBColumn
              Caption = #1055#1086#1079#1099#1074#1085#1086#1081
              DataBinding.FieldName = 'fc_name_to_show'
              Options.Sorting = False
              Width = 40
            end
            object tvNotOnLineEVENTTYPE_NAME: TcxGridDBColumn
              Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
              DataBinding.FieldName = 'EVENTTYPE_NAME'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Sorting = False
              Width = 63
            end
            object tvNotOnLineColumn1: TcxGridDBColumn
              Caption = #1042#1088#1077#1084#1103
              DataBinding.FieldName = 'fc_date'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Sorting = False
              Width = 39
            end
            object tvNotOnLineColumn2: TcxGridDBColumn
              Caption = #1060#1048#1054
              DataBinding.FieldName = 'fc_fio'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Sorting = False
              Width = 80
            end
            object tvNotOnLineFn_Besplatcnt: TcxGridDBColumn
              DataBinding.FieldName = 'Fn_Besplatcnt'
              Visible = False
              Options.Sorting = False
            end
            object tvNotOnLineColumn4: TcxGridDBColumn
              DataBinding.FieldName = 'fk_taxiid'
              Visible = False
            end
            object tvNotOnLineColumn5: TcxGridDBColumn
              DataBinding.FieldName = 'fc_synonym'
              Visible = False
            end
          end
          object gNotOnLineL: TcxGridLevel
            GridView = tvNotOnLine
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 415
          Width = 353
          Height = 240
          Align = alBottom
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          ExplicitTop = 413
          object Shape4: TShape
            Left = 1
            Top = 1
            Width = 351
            Height = 238
            Align = alClient
            Pen.Color = clMoneyGreen
            Pen.Width = 2
            ExplicitLeft = 5
            ExplicitTop = 6
          end
          object Shape2: TShape
            Left = 120
            Top = 196
            Width = 25
            Height = 32
            Pen.Color = clBlue
            Pen.Width = 2
          end
          object Shape3: TShape
            Left = 151
            Top = 196
            Width = 25
            Height = 32
            Pen.Color = 16744703
            Pen.Width = 2
          end
          object Shape5: TShape
            Left = 182
            Top = 196
            Width = 25
            Height = 32
            Pen.Color = clRed
            Pen.Width = 2
          end
          object Label1: TLabel
            Left = 13
            Top = 194
            Width = 87
            Height = 36
            Alignment = taRightJustify
            Caption = #1041#1077#1089#1087#1083#1072#1090#1085#1099#1077' '#13#10#1087#1086#1077#1079#1076#1082#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblFoundF1: TLabel
            Left = 228
            Top = 6
            Width = 13
            Height = 14
            Caption = 'F1'
          end
          object lblFromCarF1: TLabel
            Left = 228
            Top = 44
            Width = 13
            Height = 14
            Caption = 'F1'
          end
          object lblBrokenF1: TLabel
            Left = 228
            Top = 82
            Width = 13
            Height = 14
            Caption = 'F1'
          end
          object lblTakenOffF1: TLabel
            Left = 228
            Top = 118
            Width = 13
            Height = 14
            Caption = 'F1'
          end
          object lblVihodF1: TLabel
            Left = 228
            Top = 156
            Width = 13
            Height = 14
            Caption = 'F1'
          end
          object lblEnterF1: TLabel
            Left = 324
            Top = 6
            Width = 13
            Height = 14
            Caption = 'F1'
          end
          object lblDinnerF1: TLabel
            Left = 324
            Top = 44
            Width = 13
            Height = 14
            Caption = 'F1'
          end
          object lblMoveOutF1: TLabel
            Left = 324
            Top = 82
            Width = 13
            Height = 14
            Caption = 'F1'
          end
          object lblDayEndF1: TLabel
            Left = 324
            Top = 119
            Width = 13
            Height = 14
            Caption = 'F1'
          end
          object lblStreetF1: TLabel
            Left = 324
            Top = 156
            Width = 13
            Height = 14
            Caption = 'F1'
          end
          object lblFoundShift: TLabel
            Left = 228
            Top = 24
            Width = 25
            Height = 14
            Caption = 'Shift'
          end
          object lblFromCarShift: TLabel
            Left = 228
            Top = 60
            Width = 25
            Height = 14
            Caption = 'Shift'
          end
          object lblBrokenShift: TLabel
            Left = 228
            Top = 98
            Width = 25
            Height = 14
            Caption = 'Shift'
          end
          object lblTakenOffShift: TLabel
            Left = 228
            Top = 136
            Width = 25
            Height = 14
            Caption = 'Shift'
          end
          object lblVihodShift: TLabel
            Left = 228
            Top = 176
            Width = 25
            Height = 14
            Caption = 'Shift'
          end
          object lblEnterShift: TLabel
            Left = 323
            Top = 24
            Width = 25
            Height = 14
            Caption = 'Shift'
          end
          object lblDinnerShift: TLabel
            Left = 323
            Top = 60
            Width = 25
            Height = 14
            Caption = 'Shift'
          end
          object lblMoveOutShift: TLabel
            Left = 323
            Top = 98
            Width = 25
            Height = 14
            Caption = 'Shift'
          end
          object lblDayEndShift: TLabel
            Left = 323
            Top = 136
            Width = 25
            Height = 14
            Caption = 'Shift'
          end
          object lblStreetShift: TLabel
            Left = 323
            Top = 176
            Width = 25
            Height = 14
            Caption = 'Shift'
          end
          object cxButton10: TcxButton
            Left = 160
            Top = 156
            Width = 66
            Height = 32
            Action = aVihod
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object teVihod: TcxTextEdit
            Left = 13
            Top = 6
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            OnKeyPress = teVihodKeyPress
            Width = 97
          end
          object cxButton63: TcxButton
            Left = 13
            Top = 36
            Width = 33
            Height = 32
            Caption = '7'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = a1Execute
            OnMouseDown = cxButton63MouseUp
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton64: TcxButton
            Left = 68
            Top = 36
            Width = 33
            Height = 32
            Caption = '8'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = a1Execute
            OnMouseDown = cxButton63MouseUp
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton65: TcxButton
            Left = 120
            Top = 36
            Width = 33
            Height = 32
            Caption = '9'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            OnClick = a1Execute
            OnMouseDown = cxButton63MouseUp
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton62: TcxButton
            Left = 13
            Top = 67
            Width = 33
            Height = 32
            Caption = '4'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            OnClick = a1Execute
            OnMouseDown = cxButton63MouseUp
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton66: TcxButton
            Left = 68
            Top = 67
            Width = 33
            Height = 32
            Caption = '5'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            OnClick = a1Execute
            OnMouseDown = cxButton63MouseUp
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton67: TcxButton
            Left = 120
            Top = 67
            Width = 33
            Height = 32
            Caption = '6'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            OnClick = a1Execute
            OnMouseDown = cxButton63MouseUp
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton61: TcxButton
            Left = 13
            Top = 99
            Width = 33
            Height = 32
            Action = a1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
            OnMouseDown = cxButton63MouseUp
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton68: TcxButton
            Left = 68
            Top = 99
            Width = 33
            Height = 32
            Action = a2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
            OnMouseDown = cxButton63MouseUp
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton69: TcxButton
            Left = 120
            Top = 99
            Width = 33
            Height = 32
            Caption = '3'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
            OnClick = a1Execute
            OnMouseDown = cxButton63MouseUp
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton70: TcxButton
            Left = 13
            Top = 131
            Width = 88
            Height = 32
            Action = a0
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 11
            OnMouseDown = cxButton63MouseUp
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton59: TcxButton
            Left = 120
            Top = 131
            Width = 33
            Height = 32
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 12
            OnClick = aClearExecute
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
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton1: TcxButton
            Left = 160
            Top = 44
            Width = 66
            Height = 32
            Action = aFromCar3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 13
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton2: TcxButton
            Left = 256
            Top = 44
            Width = 66
            Height = 32
            Action = aToDinner3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 14
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton3: TcxButton
            Left = 160
            Top = 80
            Width = 66
            Height = 32
            Action = aBroken3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 15
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton4: TcxButton
            Left = 256
            Top = 81
            Width = 66
            Height = 32
            Action = aMoveOut3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 16
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton5: TcxButton
            Left = 160
            Top = 118
            Width = 66
            Height = 32
            Action = aTakeOff3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 17
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton6: TcxButton
            Left = 256
            Top = 118
            Width = 66
            Height = 32
            Action = aDayEnd3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 18
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton7: TcxButton
            Left = 160
            Top = 6
            Width = 66
            Height = 32
            Action = aFind
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 19
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cxButton8: TcxButton
            Left = 256
            Top = 6
            Width = 66
            Height = 32
            Action = aEnter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 20
            Visible = False
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object cbAllTaxi: TcxCheckBox
            Left = 13
            Top = 168
            Caption = #1042#1089#1077' '#1090#1072#1082#1089#1080
            ParentFont = False
            Properties.OnChange = cbAllTaxiPropertiesChange
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 21
            Width = 97
          end
          object cxLabel3: TcxLabel
            Left = 127
            Top = 200
            Caption = '1'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object cxLabel4: TcxLabel
            Left = 158
            Top = 200
            Caption = '2'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object cxLabel5: TcxLabel
            Left = 183
            Top = 200
            Caption = '>2'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object cxButton9: TcxButton
            Left = 256
            Top = 156
            Width = 66
            Height = 32
            Action = aStreet
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 25
            LookAndFeel.SkinName = 'Office2007Green'
          end
          object bRefresh: TcxButton
            Left = 256
            Top = 196
            Width = 66
            Height = 32
            Action = aRefresh
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 26
            LookAndFeel.SkinName = 'Office2007Green'
          end
        end
      end
      object tsOnSmena: TcxTabSheet
        Caption = #1047#1072' '#1089#1084#1077#1085#1091
        ImageIndex = 1
        ExplicitHeight = 653
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 353
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Shape1: TShape
            Left = 0
            Top = 0
            Width = 353
            Height = 41
            Align = alClient
            Pen.Color = clMoneyGreen
            Pen.Width = 2
            ExplicitLeft = 18
            ExplicitTop = 1
            ExplicitWidth = 191
            ExplicitHeight = 171
          end
          object cmbHour: TcxComboBox
            Left = 16
            Top = 10
            Properties.Items.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12'
              '13'
              '14'
              '15'
              '16'
              '17'
              '18'
              '19'
              '20'
              '21'
              '22'
              '23')
            Properties.OnCloseUp = cmbHourPropertiesCloseUp
            TabOrder = 0
            Text = '8'
            Width = 42
          end
          object cxLabel1: TcxLabel
            Left = 3
            Top = 10
            Caption = #1057
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object cxLabel2: TcxLabel
            Left = 60
            Top = 9
            Caption = #1095#1072#1089#1086#1074
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Transparent = True
          end
          object lblTime: TcxLabel
            Left = 101
            Top = 12
            Caption = #1095#1072#1089#1086#1074
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Transparent = True
          end
        end
        object gSmena: TcxGrid
          Left = 0
          Top = 41
          Width = 353
          Height = 614
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ExplicitHeight = 580
          object tvSmena: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            OnCustomDrawCell = tvSmenaCustomDrawCell
            DataController.DataSource = dsSmena
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                Column = tvSmenaColumn2
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.DataRowHeight = 30
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            object tvSmenaFK_ID: TcxGridDBColumn
              DataBinding.FieldName = 'FK_ID'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
            end
            object tvSmenaColumn2: TcxGridDBColumn
              Caption = #1055#1086#1079#1099#1074#1085#1086#1081
              DataBinding.FieldName = 'fc_name_to_show'
              Options.Sorting = False
              Width = 39
            end
            object tvSmenaFC_NAME: TcxGridDBColumn
              Caption = #1055#1086#1079#1099#1074#1085#1086#1081
              DataBinding.FieldName = 'FC_NAME'
              Visible = False
              HeaderAlignmentHorz = taCenter
              SortIndex = 0
              SortOrder = soAscending
              Width = 38
            end
            object tvSmenaEVENTTYPE_NAME: TcxGridDBColumn
              Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
              DataBinding.FieldName = 'EVENTTYPE_NAME'
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
              Width = 58
            end
            object tvSmenaFL_ISONLINE: TcxGridDBColumn
              DataBinding.FieldName = 'FL_ISONLINE'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
            end
            object tvSmenaFC_DATE: TcxGridDBColumn
              Caption = #1042#1088#1077#1084#1103
              DataBinding.FieldName = 'FC_DATE'
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
              Width = 34
            end
            object tvSmenaFC_FIO: TcxGridDBColumn
              Caption = #1060#1048#1054
              DataBinding.FieldName = 'FC_FIO'
              HeaderAlignmentHorz = taCenter
              Options.Sorting = False
              Width = 66
            end
            object tvSmenaColumn1: TcxGridDBColumn
              DataBinding.FieldName = 'fn_besplatcnt'
              Visible = False
              Options.Sorting = False
            end
            object tvSmenaColumn3: TcxGridDBColumn
              Caption = #1042#1099#1096#1077#1083
              DataBinding.FieldName = 'fc_arrivesmena'
              HeaderAlignmentHorz = taCenter
              Width = 66
            end
          end
          object gSmenaL: TcxGridLevel
            GridView = tvSmena
          end
        end
      end
      object tsHistory: TcxTabSheet
        Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1073#1099#1090#1080#1081
        ImageIndex = 2
        ExplicitHeight = 621
        object cxGroupBox1: TcxGroupBox
          Left = 0
          Top = 0
          Align = alTop
          Caption = #1048#1090#1086#1075#1086
          TabOrder = 0
          Height = 145
          Width = 353
          object gHistoryItogo: TcxGrid
            Left = 2
            Top = 19
            Width = 349
            Height = 124
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object tvHistoryItogo: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              OnCustomDrawCell = tvSmenaCustomDrawCell
              DataController.DataSource = dsHistoryItogo
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.NoDataToDisplayInfoText = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1072#1082#1089#1080#1089#1090#1072
              OptionsView.CellAutoHeight = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object cxGridDBColumn1: TcxGridDBColumn
                Caption = #1057#1086#1073#1099#1090#1080#1077
                DataBinding.FieldName = 'FC_EVENTNAME'
                HeaderAlignmentHorz = taCenter
                Options.Sorting = False
                Width = 76
              end
              object cxGridDBColumn5: TcxGridDBColumn
                Caption = #1084#1080#1085'.'
                DataBinding.FieldName = 'fn_sum'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Width = 44
              end
            end
            object gHistoryItogoL: TcxGridLevel
              GridView = tvHistoryItogo
            end
          end
        end
        object cxGroupBox2: TcxGroupBox
          Left = 0
          Top = 145
          Align = alClient
          Caption = #1055#1086#1076#1088#1086#1073#1085#1086
          TabOrder = 1
          ExplicitHeight = 476
          Height = 510
          Width = 353
          object gDriverEventTmp: TcxGrid
            Left = 2
            Top = 19
            Width = 349
            Height = 489
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitHeight = 455
            object tvDriverEventTmp: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              OnCustomDrawCell = tvSmenaCustomDrawCell
              DataController.DataSource = dsDriverEventTmp
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.NoDataToDisplayInfoText = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1072#1082#1089#1080#1089#1090#1072
              OptionsView.CellAutoHeight = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object tvDriverEventTmpFC_EVENTNAME: TcxGridDBColumn
                Caption = #1057#1086#1073#1099#1090#1080#1077
                DataBinding.FieldName = 'FC_EVENTNAME'
                HeaderAlignmentHorz = taCenter
                Options.Sorting = False
                Width = 76
              end
              object tvDriverEventTmpFC_SYNONYM: TcxGridDBColumn
                DataBinding.FieldName = 'FC_SYNONYM'
                Visible = False
                HeaderAlignmentHorz = taCenter
                Options.Sorting = False
                Width = 81
              end
              object tvDriverEventTmpFD_START: TcxGridDBColumn
                Caption = #1057
                DataBinding.FieldName = 'FD_START'
                HeaderAlignmentHorz = taCenter
                SortIndex = 0
                SortOrder = soAscending
                Width = 61
              end
              object tvDriverEventTmpFD_END: TcxGridDBColumn
                Caption = #1055#1086
                DataBinding.FieldName = 'FD_END'
                HeaderAlignmentHorz = taCenter
                Options.Sorting = False
                Width = 82
              end
              object tvDriverEventTmpColumn1: TcxGridDBColumn
                Caption = #1084#1080#1085'.'
                DataBinding.FieldName = 'fn_minute'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Width = 44
              end
            end
            object gDriverEventL: TcxGridLevel
              GridView = tvDriverEventTmp
            end
          end
        end
      end
    end
  end
  object os: TOracleSession
    AfterLogOn = osAfterLogOn
    LogonUsername = 'TAXI'
    LogonPassword = 'TAXI123'
    LogonDatabase = 'xe'
    Left = 32
    Top = 16
  end
  object odsNotOnLine: TOracleDataSet
    SQL.Strings = (
      ' select s.fk_id, s.fk_taxiid,'
      '        decode(t.fc_synonym,'
      '               '#39'GO_FROM_CAR'#39', s.fc_name||'#39'->'#39','
      '               '#39'START_CLIENT_MOVE'#39', s.fc_name||'#39'*'#39','
      '               '#39'MOVE_TO_CLIENT'#39', s.fc_name||'#39'*'#39','
      
        '               '#39'CANCEL_CLIENT_MOVE'#39', s.fc_name||'#39'*'#39', s.fc_name) ' +
        'fc_name_to_show,'
      '        to_number(s.fc_name) fc_name, '
      
        '        decode(t.fc_synonym, '#39'GO_FROM_CAR'#39', t.fc_name, decode(t.' +
        'fl_isonline, 0, t.fc_name, null, '#39#1085#1077#1090' '#1076#1072#1085#1085#1099#1093#39')) as eventtype_nam' +
        'e, '
      '        t.fl_isonline,'
      
        '        decode(t.fc_synonym, '#39'GO_FROM_CAR'#39', to_char(e.fd_date,'#39'h' +
        'h24:mi'#39'), decode(t.fl_isonline, 0, to_char(e.fd_date,'#39'hh24:mi'#39'))' +
        ') as fc_date,'
      '        null fk_raion,'
      '        s.fc_fio, s.fn_besplatcnt,'
      '        t.fc_synonym, e.fk_journal,t.fc_synonym'
      
        '          from taxi.ts_drivers s, taxi.tdriverevent e, taxi.ts_d' +
        'rivereventtype t'
      '         where s.fl_del = 0 '
      '           and s.fd_out is null'
      '           and s.fk_taxiid = :taxiid  '
      '           and s.fk_lastdriverevent = e.fk_id (+)'
      '           and e.fk_drivereventtype = t.fk_id (+)'
      
        '           and t.fc_synonym not in ('#39'DAY_END'#39','#39'TAKE_OFF_FROM_LIN' +
        'E'#39','#39'GET_DAMAGE'#39')')
    Optimize = False
    Variables.Data = {
      0300000001000000070000003A54415849494403000000040000000100000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000E0000004556454E54545950455F4E414D45010000000000
      0B000000464C5F49534F4E4C494E450100000000000700000046435F44415445
      0100000000000600000046435F46494F010000000000}
    Session = os
    Left = 152
    Top = 160
  end
  object dsNotOnLine: TDataSource
    DataSet = odsNotOnLine
    Left = 80
    Top = 160
  end
  object ActionList1: TActionList
    OnUpdate = ActionList1Update
    Left = 472
    Top = 208
    object aToDinner: TAction
      Caption = #1053#1072' '#1086#1073#1077#1076
      OnExecute = aToDinnerExecute
    end
    object aFromDinner: TAction
      Caption = #1057' '#1086#1073#1077#1076#1072
      OnExecute = aFromDinnerExecute
    end
    object aFromCar: TAction
      Caption = #1048#1079' '#1084#1072#1096#1080#1085#1099
      OnExecute = aFromCarExecute
    end
    object aToCar: TAction
      Caption = #1042' '#1084#1072#1096#1080#1085#1091
      OnExecute = aToCarExecute
    end
    object aBroken: TAction
      Caption = #1055#1086#1083#1086#1084#1072#1083#1089#1103
      OnExecute = aBrokenExecute
    end
    object aRepear: TAction
      Caption = #1054#1090#1088#1077#1084#1086#1085'-'#1089#1103
      OnExecute = aRepearExecute
    end
    object aTakeOff: TAction
      Caption = #1057#1085#1103#1090' '#1089' '#1083#1080#1085#1080#1080
      OnExecute = aTakeOffExecute
    end
    object aDayEnd: TAction
      Caption = #1057#1084#1077#1085#1072' '#1079#1072#1082#1086#1085#1095#1077#1085#1072
      OnExecute = aDayEndExecute
    end
    object aDayStart: TAction
      Caption = #1042#1099#1096#1077#1083' '#1085#1072' '#1083#1080#1085#1080#1102
      OnExecute = aDayStartExecute
    end
    object aExit: TAction
      Category = 'MainMenu'
      Caption = #1042#1099#1093#1086#1076
      OnExecute = aExitExecute
    end
    object aChangeUser: TAction
      Category = 'MainMenu'
      Caption = #1057#1084#1077#1085#1072' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      OnExecute = aChangeUserExecute
    end
    object aMoveOut: TAction
      Caption = #1054#1090#1083#1091#1095#1080#1083#1089#1103
      OnExecute = aMoveOutExecute
    end
    object a1: TAction
      Category = 'Key'
      Caption = '1'
      OnExecute = a1Execute
    end
    object a2: TAction
      Category = 'Key'
      Caption = '2'
      OnExecute = a1Execute
    end
    object a3: TAction
      Category = 'Key'
      Caption = '3'
      OnExecute = a1Execute
    end
    object a4: TAction
      Category = 'Key'
      Caption = '4'
      OnExecute = a1Execute
    end
    object a5: TAction
      Category = 'Key'
      Caption = '5'
      OnExecute = a1Execute
    end
    object a6: TAction
      Category = 'Key'
      Caption = '6'
      OnExecute = a1Execute
    end
    object a7: TAction
      Category = 'Key'
      Caption = '7'
      OnExecute = a1Execute
    end
    object a8: TAction
      Category = 'Key'
      Caption = '8'
      OnExecute = a1Execute
    end
    object a9: TAction
      Category = 'Key'
      Caption = '9'
      OnExecute = a1Execute
    end
    object a0: TAction
      Category = 'Key'
      Caption = '0'
      OnExecute = a1Execute
    end
    object aVihod: TAction
      Category = 'Key'
      Caption = #1053#1072' '#1083#1080#1085#1080#1102
      OnExecute = aVihodExecute
    end
    object aClear: TAction
      Category = 'Key'
      OnExecute = aClearExecute
    end
    object aEnter: TAction
      Caption = #1042#1074#1086#1076
    end
    object aFind: TAction
      Caption = #1053#1072#1081#1090#1080
      Hint = #1053#1072#1081#1090#1080
      OnExecute = aFindExecute
    end
    object aHistory: TAction
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1089#1086#1073#1099#1090#1080#1081
      OnExecute = aHistoryExecute
    end
    object aStreet: TAction
      Caption = #1059#1083#1080#1094#1072
      Hint = #1053#1072#1081#1090#1080' '#1091#1083#1080#1094#1091
      OnExecute = aStreetExecute
    end
    object aToDinner2: TAction
      Caption = #1053#1072' '#1086#1073#1077#1076
      OnExecute = aToDinner2Execute
    end
    object aFromCar2: TAction
      Caption = #1048#1079' '#1084#1072#1096#1080#1085#1099
      OnExecute = aFromCar2Execute
    end
    object aBroken2: TAction
      Caption = #1055#1086#1083#1086#1084#1072#1083#1089#1103
      OnExecute = aBroken2Execute
    end
    object aTakeOff2: TAction
      Caption = #1057#1085#1103#1090' '#1089' '#1083#1080#1085#1080#1080
      OnExecute = aTakeOff2Execute
    end
    object aDayEnd2: TAction
      Caption = #1057#1084#1077#1085#1072' '#1079#1072#1082#1086#1085#1095#1077#1085#1072
      OnExecute = aDayEnd2Execute
    end
    object aMoveOut2: TAction
      Caption = #1054#1090#1083#1091#1095#1080#1083#1089#1103
      OnExecute = aMoveOut2Execute
    end
    object aHistory2: TAction
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1089#1086#1073#1099#1090#1080#1081
      OnExecute = aHistory2Execute
    end
    object aFromCar3: TAction
      Caption = #1048#1079' '#1084#1072#1096
      OnExecute = aFromCar3Execute
    end
    object aBroken3: TAction
      Caption = #1055#1086#1083#1086#1084#1082#1072
      OnExecute = aBroken3Execute
    end
    object aTakeOff3: TAction
      Caption = #1057#1085#1103#1090
      OnExecute = aTakeOff3Execute
    end
    object aToDinner3: TAction
      Caption = #1054#1073#1077#1076
      OnExecute = aToDinner3Execute
    end
    object aMoveOut3: TAction
      Caption = #1054#1090#1083#1091#1095#1080#1083
      OnExecute = aMoveOut3Execute
    end
    object aDayEnd3: TAction
      Caption = #1057#1084#1077#1085#1072' '#1079#1072
      OnExecute = aDayEnd3Execute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1084#1072#1096#1080#1085#1072#1093
      OnExecute = aRefreshExecute
    end
  end
  object popAction: TPopupMenu
    Left = 752
    Top = 200
    object N2: TMenuItem
      Action = aFromCar
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Action = aToDinner
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Action = aBroken
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Action = aMoveOut
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N12: TMenuItem
      Action = aTakeOff
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N13: TMenuItem
      Action = aDayEnd
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object N16: TMenuItem
      Action = aHistory
    end
  end
  object popNotLink: TPopupMenu
    Left = 680
    Top = 200
    object MenuItem1: TMenuItem
      Action = aDayStart
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object MenuItem4: TMenuItem
      Action = aToCar
    end
    object MenuItem5: TMenuItem
      Caption = '-'
    end
    object MenuItem7: TMenuItem
      Action = aFromDinner
    end
    object MenuItem8: TMenuItem
      Caption = '-'
    end
    object MenuItem10: TMenuItem
      Action = aRepear
      Caption = #1054#1090#1088#1077#1084#1086#1085#1090#1080#1088#1086#1074#1072#1083#1089#1103
    end
    object N14: TMenuItem
      Caption = '-'
    end
  end
  object MainMenu1: TMainMenu
    Left = 536
    Top = 184
    object N4: TMenuItem
      Action = aChangeUser
    end
    object N7: TMenuItem
      Action = aExit
    end
  end
  object dsSmena: TDataSource
    DataSet = odsSmena
    Left = 96
    Top = 216
  end
  object odsSmena: TOracleDataSet
    SQL.Strings = (
      ' select s.fk_id, to_number(s.fc_name) fc_name, '
      
        '        decode(t.fc_synonym,'#39'GO_FROM_CAR'#39',s.fc_name||'#39'->'#39','#39'START' +
        '_CLIENT_MOVE'#39',s.fc_name||'#39'*'#39','#39'MOVE_TO_CLIENT'#39',s.fc_name||'#39'*'#39',s.f' +
        'c_name) fc_name_to_show,'
      
        '        decode(t.fc_synonym,'#39'GO_FROM_CAR'#39', t.fc_name, decode(t.f' +
        'l_isonline, 0, t.fc_name, null, '#39#1085#1077#1090' '#1076#1072#1085#1085#1099#1093#39')) as eventtype_name' +
        ', '
      '        t.fl_isonline,'
      
        '        decode(t.fc_synonym,'#39'GO_FROM_CAR'#39', to_char(e.fd_date,'#39'hh' +
        '24:mi'#39'), decode(t.fl_isonline, 0, to_char(e.fd_date,'#39'hh24:mi'#39')))' +
        ' as fc_date,'
      '        s.fc_fio, s.fn_besplatcnt,'
      '        to_char(s.fd_arrivesmena,'#39'hh24:mi'#39') fc_arrivesmena'
      
        '          from taxi.ts_drivers s, taxi.tdriverevent e, taxi.ts_d' +
        'rivereventtype t'
      '         where s.fl_del = 0 '
      '           and s.fd_out is null'
      '           and s.fk_taxiid = :taxiid  '
      '           and s.fk_lastdriverevent = e.fk_id (+)'
      '           and e.fk_drivereventtype = t.fk_id (+)'
      '           and exists'
      
        '           (select 1 from taxi.tdriverevent ee, taxi.ts_driverev' +
        'enttype tt'
      '           where ee.fk_driver = s.fk_id'
      '                 and ee.fk_drivereventtype = tt.fk_id'
      '                 and tt.fc_synonym = '#39'ARRIVED'#39
      '                 and ee.fd_date > :pDate)'
      ' union'
      ' select s.fk_id, to_number(s.fc_name) fc_name, '
      
        '        decode(t.fc_synonym,'#39'GO_FROM_CAR'#39',s.fc_name||'#39'->'#39','#39'START' +
        '_CLIENT_MOVE'#39',s.fc_name||'#39'*'#39','#39'MOVE_TO_CLIENT'#39',s.fc_name||'#39'*'#39',s.f' +
        'c_name) fc_name_to_show,'
      
        '        decode(t.fc_synonym,'#39'GO_FROM_CAR'#39', t.fc_name, decode(t.f' +
        'l_isonline, 0, t.fc_name, null, '#39#1085#1077#1090' '#1076#1072#1085#1085#1099#1093#39')) as eventtype_name' +
        ', '
      '        t.fl_isonline,'
      
        '        decode(t.fc_synonym,'#39'GO_FROM_CAR'#39', to_char(e.fd_date,'#39'hh' +
        '24:mi'#39'), decode(t.fl_isonline, 0, to_char(e.fd_date,'#39'hh24:mi'#39')))' +
        ' as fc_date,'
      '        s.fc_fio, s.fn_besplatcnt,'
      
        '        to_char(s.fd_arrivesmena,'#39'hh24:mi'#39') fc_arrivesmena      ' +
        '  '
      
        '          from taxi.ts_drivers s, taxi.tdriverevent e, taxi.ts_d' +
        'rivereventtype t'
      '         where s.fl_del = 0 '
      '           and s.fd_out is null'
      '           and s.fk_taxiid = :taxiid  '
      '           and s.fk_lastdriverevent = e.fk_id (+)'
      '           and e.fk_drivereventtype = t.fk_id (+)'
      
        '           and t.fc_synonym not in ('#39'DAY_END'#39','#39'TAKE_OFF_FROM_LIN' +
        'E'#39','#39'GET_DAMAGE'#39') ')
    Optimize = False
    Variables.Data = {
      0300000002000000070000003A54415849494403000000000000000000000006
      0000003A50444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000E0000004556454E54545950455F4E414D45010000000000
      0B000000464C5F49534F4E4C494E450100000000000700000046435F44415445
      0100000000000600000046435F46494F010000000000}
    Session = os
    Left = 152
    Top = 216
  end
  object odsGetSmenaDate: TOracleDataSet
    SQL.Strings = (
      'select qtime, to_char(qtime,'#39'dd.mm.yyyy hh24:mi'#39') time from'
      '(select case'
      '         when :phour <= to_number(to_char(sysdate, '#39'hh24'#39')) then'
      
        '          to_date(to_char(sysdate, '#39'dd.mm.yyyy'#39') || '#39' '#39' || :phou' +
        'r,'
      '                  '#39'dd.mm.yyyy hh24'#39')'
      '         else'
      
        '          to_date(to_char(sysdate - 1, '#39'dd.mm.yyyy'#39') || '#39' '#39' || :' +
        'phour,'
      '                  '#39'dd.mm.yyyy hh24'#39')'
      '       end qtime'
      '  from dual)')
    Optimize = False
    Variables.Data = {0300000001000000060000003A50484F5552030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000050000005154494D450100000000000400000054494D4501
      0000000000}
    Session = os
    Left = 360
    Top = 232
  end
  object tRefresh: TTimer
    Interval = 3000
    OnTimer = tRefreshTimer
    Left = 96
    Top = 432
  end
  object dsDriverEventTmp: TDataSource
    DataSet = odsDriverEventTmp
    Left = 56
    Top = 272
  end
  object odsDriverEventTmp: TOracleDataSet
    SQL.Strings = (
      'select t.fc_eventname, t.fc_synonym, t.fd_start, t.fd_end,'
      
        'ceil((nvl(t.fd_end,decode(t.fc_synonym,'#39'GO_DINNER'#39',sysdate,'#39'GO_F' +
        'ROM_CAR'#39',sysdate,'#39'MOVE_OUT'#39',sysdate,null)) - t.fd_start)*60*24) ' +
        'fn_minute'
      'from taxi.tdrivereventtmp t where t.fl_move = 0')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000040000000C00000046435F4556454E544E414D450100000000000A00
      000046435F53594E4F4E594D0100000000000800000046445F53544152540100
      000000000600000046445F454E44010000000000}
    Session = os
    Left = 152
    Top = 272
  end
  object qSetHistory: TOracleQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      
        '  taxi.pkg_drivergrid.fill_driverinfo_lastsmena(pdriver => :pdri' +
        'ver);'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000001000000080000003A50445249564552030000000000000000000000}
    Left = 328
    Top = 80
  end
  object dsHistoryItogo: TDataSource
    DataSet = odsHistoryItogo
    Left = 72
    Top = 328
  end
  object odsHistoryItogo: TOracleDataSet
    SQL.Strings = (
      'select fc_eventname, sum(fn_minute) fn_sum '
      'from '
      '(select t.fc_eventname, t.fc_synonym, t.fd_start, t.fd_end,'
      
        'ceil((nvl(t.fd_end,decode(t.fc_synonym,'#39'GO_DINNER'#39',sysdate,'#39'GO_F' +
        'ROM_CAR'#39',sysdate,'#39'MOVE_OUT'#39',sysdate,null)) - t.fd_start)*60*24) ' +
        'fn_minute'
      'from taxi.tdrivereventtmp t where t.fl_move = 0)'
      'where fn_minute is not null'
      'group by fc_eventname')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000040000000C00000046435F4556454E544E414D450100000000000A00
      000046435F53594E4F4E594D0100000000000800000046445F53544152540100
      000000000600000046445F454E44010000000000}
    Session = os
    Left = 152
    Top = 328
  end
  object tmrSelectCurrentPanel: TTimer
    Enabled = False
    OnTimer = tmrSelectCurrentPanelTimer
    Left = 472
    Top = 304
  end
  object odsKeys: TOracleDataSet
    SQL.Strings = (
      'select s.oid,'
      '       s.fc_key,'
      '       s.fc_synonym,'
      '       s.fc_name,'
      '       s.fl_shift,'
      '       s.fl_ctrl,'
      '       s.fl_alt,'
      '       s.fk_raion,'
      '       s.fc_symbol'
      '  from taxi.ttaxidispetcherkey s'
      '')
    Optimize = False
    Session = os
    Left = 360
    Top = 176
  end
  object popNotOnline: TPopupMenu
    Left = 600
    Top = 200
    object MenuItem3: TMenuItem
      Action = aFromCar2
    end
    object MenuItem6: TMenuItem
      Caption = '-'
    end
    object MenuItem9: TMenuItem
      Action = aToDinner2
    end
    object MenuItem11: TMenuItem
      Caption = '-'
    end
    object MenuItem12: TMenuItem
      Action = aBroken2
    end
    object MenuItem13: TMenuItem
      Caption = '-'
    end
    object MenuItem14: TMenuItem
      Action = aMoveOut2
    end
    object MenuItem15: TMenuItem
      Caption = '-'
    end
    object MenuItem16: TMenuItem
      Action = aTakeOff2
    end
    object MenuItem17: TMenuItem
      Caption = '-'
    end
    object MenuItem18: TMenuItem
      Action = aDayEnd2
    end
    object MenuItem19: TMenuItem
      Caption = '-'
    end
    object MenuItem20: TMenuItem
      Action = aHistory2
    end
  end
  object odsNeedUpdate: TOracleDataSet
    SQL.Strings = (
      'select FK_TAXI, FL_NEEDREFRESH from taxi.tupdateinfo')
    Optimize = False
    Session = os
    Left = 96
    Top = 480
  end
  object qUpdateUpdateInfo: TOracleQuery
    SQL.Strings = (
      'update taxi.tupdateinfo'
      '   set fl_needrefresh = 0'
      ' where fk_taxi = :ptaxiid')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000001000000080000003A50544158494944030000000000000000000000}
    Left = 96
    Top = 536
  end
  object tmKeys: TTimer
    Enabled = False
    Interval = 600
    OnTimer = tmKeysTimer
    Left = 472
    Top = 360
  end
  object tmrFKey: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = tmrFKeyTimer
    Left = 472
    Top = 416
  end
  object tAutoRef: TTimer
    Enabled = False
    OnTimer = tAutoRefTimer
    Left = 144
    Top = 432
  end
end
