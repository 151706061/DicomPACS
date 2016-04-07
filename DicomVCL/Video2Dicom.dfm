object CaptureVideoForm: TCaptureVideoForm
  Left = 116
  Top = 21
  Caption = 'Capture Video To Dicom'
  ClientHeight = 492
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 503
    Top = 60
    Width = 4
    Height = 413
    Align = alRight
    ExplicitHeight = 406
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 641
    Height = 60
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 15
      Top = 10
      Width = 57
      Height = 13
      Caption = 'Video Mode'
    end
    object lbFrames: TLabel
      Left = 442
      Top = 43
      Width = 3
      Height = 13
      Caption = ' '
    end
    object SpeedButton1: TSpeedButton
      Left = 551
      Top = 5
      Width = 23
      Height = 22
      OnClick = SpeedButton1Click
    end
    object cbVModes: TComboBox
      Left = 90
      Top = 6
      Width = 159
      Height = 21
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 0
      OnChange = cbVModesChange
    end
    object Button2: TButton
      Left = 252
      Top = 4
      Width = 98
      Height = 25
      Caption = 'Configure Graph'
      TabOrder = 1
      OnClick = Button2Click
    end
    object btCaptureFrame: TBitBtn
      Left = 8
      Top = 32
      Width = 105
      Height = 25
      Caption = 'Capture Bitmap'
      TabOrder = 2
      OnClick = btCaptureFrameClick
    end
    object Button1: TButton
      Left = 354
      Top = 3
      Width = 81
      Height = 25
      Caption = 'SaveGraph'
      TabOrder = 3
      OnClick = Button1Click
    end
    object btStart: TBitBtn
      Left = 120
      Top = 32
      Width = 105
      Height = 25
      Caption = 'Start Capture'
      TabOrder = 4
      OnClick = btStartClick
    end
    object btStop: TBitBtn
      Left = 232
      Top = 32
      Width = 105
      Height = 25
      Caption = 'Stop Capture'
      Enabled = False
      TabOrder = 5
      OnClick = btStopClick
    end
    object lbDialogs: TComboBox
      Left = 439
      Top = 7
      Width = 111
      Height = 21
      Style = csDropDownList
      ItemHeight = 0
      TabOrder = 6
    end
    object Button4: TButton
      Left = 344
      Top = 32
      Width = 97
      Height = 25
      Caption = 'Exit'
      TabOrder = 7
      OnClick = Button4Click
    end
  end
  object cap: TDicomVideoCapture
    Left = 0
    Top = 60
    Width = 503
    Height = 413
    DVResolution = dvrDontWorry
    WantBitmaps = True
    BitmapPixelFormat = pf24bit
    WantAudio = False
    WantDVAudio = True
    WantAudioPreview = False
    WantPreview = True
    WantCapture = True
    UseFrameRate = False
    FrameRate = 25.000000000000000000
    CaptureFileName = 'capture.avi'
    UseTempFile = True
    TempCaptureFileName = 'captemp.avi'
    UseTimeLimit = True
    TimeLimit = 30
    DoPreallocFile = False
    PreallocFileSize = 1
    OnAborted = capAborted
    OnDeviceLost = capDeviceLost
    OnChangeDevice = capChangeDevice
    OnCaptureProgress = capCaptureProgress
    OnStopPreview = capStopPreview
    OnStartPreview = capStartPreview
    OnBitmapGrabbed = capBitmapGrabbed
    OnFrameRendered = capFrameRendered
    Color = clBlack
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 473
    Width = 641
    Height = 19
    Panels = <>
  end
  object CaptureView: TDCMMultiImage
    Left = 507
    Top = 60
    Width = 134
    Height = 413
    AutoChangeSeriesMode = True
    AutoGrid = True
    CanDelete = True
    GridVisible = True
    ViewGridSetting = '1,2'
    LeftMouseInteract = miNone
    ShowSeriesDescription = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Align = alRight
    Color = clBlack
    ParentColor = False
    TabOrder = 3
    Bitmaps = <>
    Row = 1
    Column = 3
    ViewGridMode = vgmStandardGrid
  end
  object Timer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerTimer
    Left = 123
    Top = 251
  end
end
