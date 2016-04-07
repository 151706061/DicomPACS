object SelectRangeForm: TSelectRangeForm
  Left = 245
  Top = 60
  Width = 601
  Height = 547
  Caption = 'Select Range For 3D Rendering'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 384
    Width = 593
    Height = 136
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 13
      Width = 55
      Height = 13
      Caption = 'Select Start'
    end
    object Label2: TLabel
      Left = 6
      Top = 34
      Width = 52
      Height = 13
      Caption = 'Select End'
    end
    object ScrollBar1: TScrollBar
      Left = 82
      Top = 10
      Width = 500
      Height = 16
      PageSize = 0
      TabOrder = 0
      OnScroll = ScrollBar1Scroll
    end
    object ScrollBar2: TScrollBar
      Left = 82
      Top = 33
      Width = 500
      Height = 16
      PageSize = 0
      TabOrder = 1
      OnScroll = ScrollBar2Scroll
    end
    object BitBtn1: TBitBtn
      Left = 509
      Top = 105
      Width = 75
      Height = 25
      TabOrder = 2
      Kind = bkOK
    end
    object GroupBox1: TGroupBox
      Left = 7
      Top = 56
      Width = 362
      Height = 72
      Caption = 'Pixel Spacing'
      TabOrder = 3
      object Label3: TLabel
        Left = 12
        Top = 26
        Width = 7
        Height = 13
        Caption = 'X'
      end
      object Label4: TLabel
        Left = 12
        Top = 50
        Width = 7
        Height = 13
        Caption = 'Y'
      end
      object Label5: TLabel
        Left = 190
        Top = 27
        Width = 7
        Height = 13
        Caption = 'Z'
      end
      object Edit1: TEdit
        Left = 50
        Top = 19
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 50
        Top = 43
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 227
        Top = 21
        Width = 121
        Height = 21
        TabOrder = 2
      end
    end
    object Button1: TButton
      Left = 511
      Top = 74
      Width = 75
      Height = 25
      Caption = 'ROI'
      TabOrder = 4
      OnClick = Button1Click
    end
  end
  object DicomMultiViewer1: TDicomMultiViewer
    Left = 0
    Top = 0
    Width = 593
    Height = 384
    DisplayLabel = True
    DisplayRuler = True
    TextOverlayMode = False
    UpdateAllImageProperty = True
    CanMultiSelect = True
    WhiteGrid = False
    AutoGrid = False
    ScrollBarVisible = True
    Align = alClient
    Color = clBlack
    TabOrder = 1
    CurrentImage = -1
    Columns = 1
    Rows = 1
    OnAfterNewDrawObject = DicomMultiViewer1AfterNewDrawObject
  end
end
