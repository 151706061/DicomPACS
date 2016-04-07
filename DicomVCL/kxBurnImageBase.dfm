object BurnCDForm: TBurnCDForm
  Left = 265
  Top = 304
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Burn CD/DVD'
  ClientHeight = 291
  ClientWidth = 561
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pbottom: TPanel
    Left = 0
    Top = 269
    Width = 561
    Height = 22
    HelpContext = 1036
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object Label5: TLabel
      Left = 359
      Top = 1
      Width = 40
      Height = 13
      Align = alRight
      Alignment = taRightJustify
      Caption = ' Buffer : '
      Layout = tlCenter
    end
    object Label6: TLabel
      Left = 1
      Top = 1
      Width = 71
      Height = 13
      Align = alLeft
      Caption = ' CD Progress : '
      Layout = tlCenter
    end
    object lSize: TLabel
      Left = 235
      Top = 1
      Width = 124
      Height = 20
      Align = alClient
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Size'
      Layout = tlCenter
    end
    object pcd: TProgressBar
      Left = 72
      Top = 1
      Width = 163
      Height = 20
      HelpContext = 1040
      Align = alLeft
      Smooth = True
      Step = 1
      TabOrder = 0
    end
    object pHBuf: TProgressBar
      Left = 506
      Top = 1
      Width = 54
      Height = 20
      Hint = 'Device buffer status'
      HelpContext = 1041
      Align = alRight
      Max = 0
      Smooth = True
      Step = 1
      TabOrder = 1
    end
    object pBuf: TProgressBar
      Left = 399
      Top = 1
      Width = 107
      Height = 20
      Hint = 'Software buffer status'
      HelpContext = 1042
      Align = alRight
      Smooth = True
      Step = 1
      TabOrder = 2
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 104
    Width = 561
    Height = 165
    Hint = 'Log'
    HelpContext = 1044
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    WordWrap = False
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 561
    Height = 70
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 29
        Width = 557
      end
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 29
        Width = 557
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 548
      Height = 29
      ButtonHeight = 21
      Caption = 'ToolBar1'
      TabOrder = 0
      object cbDrives: TComboBox
        Left = 0
        Top = 0
        Width = 277
        Height = 22
        HelpContext = 1024
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 14
        ParentFont = False
        TabOrder = 0
        OnChange = cbDrivesChange
      end
      object bCaps: TSpeedButton
        Left = 277
        Top = 0
        Width = 37
        Height = 21
        Caption = 'Info'
        OnClick = bCapsClick
      end
      object cbSpeed: TComboBox
        Left = 314
        Top = 0
        Width = 119
        Height = 21
        HelpContext = 1028
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        OnDropDown = cbSpeedDropDown
      end
      object BitBtn1: TBitBtn
        Left = 433
        Top = 0
        Width = 75
        Height = 21
        TabOrder = 2
        OnClick = BitBtn1Click
        Kind = bkClose
      end
    end
    object ToolBar2: TToolBar
      Left = 9
      Top = 31
      Width = 548
      Height = 29
      ButtonHeight = 25
      Caption = 'ToolBar2'
      TabOrder = 1
      object bQErase: TSpeedButton
        Left = 0
        Top = 0
        Width = 78
        Height = 25
        Caption = 'QuickFormat'
        OnClick = bQEraseClick
      end
      object bCErase: TSpeedButton
        Left = 78
        Top = 0
        Width = 52
        Height = 25
        Caption = 'Format'
        OnClick = bCEraseClick
      end
      object bLoad: TSpeedButton
        Left = 130
        Top = 0
        Width = 42
        Height = 25
        Caption = 'Load'
        OnClick = bLoadClick
      end
      object bEject: TSpeedButton
        Left = 172
        Top = 0
        Width = 36
        Height = 25
        Caption = 'Eject'
        OnClick = bEjectClick
      end
      object bReady: TSpeedButton
        Left = 208
        Top = 0
        Width = 50
        Height = 25
        Caption = 'Ready'
        OnClick = bReadyClick
      end
      object bSaveISO: TSpeedButton
        Left = 258
        Top = 0
        Width = 53
        Height = 25
        Caption = 'Buld ISO'
        OnClick = bSaveISOClick
      end
      object bBurnISO: TSpeedButton
        Left = 311
        Top = 0
        Width = 57
        Height = 25
        Caption = 'Burn ISO'
        OnClick = bBurnISOClick
      end
      object bClear: TSpeedButton
        Left = 368
        Top = 0
        Width = 41
        Height = 25
        Caption = 'Clear'
        OnClick = bClearClick
      end
      object bAdvance: TSpeedButton
        Left = 409
        Top = 0
        Width = 41
        Height = 25
        Caption = 'Setup'
        OnClick = bAdvanceClick
      end
      object bBurn: TSpeedButton
        Left = 450
        Top = 0
        Width = 49
        Height = 25
        Caption = 'Burn'
        OnClick = bBurnClick
      end
      object bAbort: TButton
        Left = 499
        Top = 0
        Width = 42
        Height = 25
        Caption = 'Cancel'
        TabOrder = 0
        OnClick = bAbortClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 70
    Width = 561
    Height = 34
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 88
    Top = 16
  end
  object od: TOpenDialog
    DefaultExt = 'iso'
    Filter = '.ISO Files (*.iso)|*.ISO|All File (*.*)|*.*'
    Options = [ofReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 127
    Top = 18
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.iso'
    Filter = 'ISO File|*.ISO'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'CD Image File'
    Left = 250
    Top = 19
  end
  object DicomCDBurner: TCnsCDBurner
    WriteMethod = wmDAO
    OnDebugMessage = DicomCDBurnerDebugMessage
    DeviceBufferSize = 0
    DeviceFreeBufferSize = 0
    UnderrunProtection = True
    OnEraseDone = DicomCDBurnerEraseDone
    ReadSpeed = 0
    WriteSpeed = 0
    FinalizeDisc = True
    TestWrite = False
    ReplaceFile = False
    PerformOPC = False
    DateCreation = 40067.907801527780000000
    DateModification = 40067.907801527780000000
    CacheSize = 4194304
    OnWriteDone = DicomCDBurnerWriteDone
    Version = '1.23.1'
    WritePostGap = True
    NoUseLowerFile = True
    NoUseISOVersionNumber = True
    MediumType = mt_650MB
    BootImageType = biAuto
    UseDosCharset = False
    ISOLevel = ISOLevel01
    BootPlatform = btpPC80_86
    JolietExpand110 = False
    Optimized = False
    Left = 217
    Top = 20
  end
end
