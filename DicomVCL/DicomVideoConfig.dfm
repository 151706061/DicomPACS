object FGraphConfig: TFGraphConfig
  Left = 347
  Top = 209
  Caption = 'Capture graph configuration'
  ClientHeight = 330
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label3: TLabel
    Left = 9
    Top = 195
    Width = 86
    Height = 16
    Caption = 'DV Resolution'
  end
  object Label4: TLabel
    Left = 214
    Top = 195
    Width = 113
    Height = 16
    Caption = 'BitmapPixelFormat'
  end
  object Label6: TLabel
    Left = 46
    Top = 256
    Width = 106
    Height = 16
    Caption = 'CaptureFileName'
  end
  object Label5: TLabel
    Left = 10
    Top = 281
    Width = 142
    Height = 16
    Caption = 'TempCaptureFileName'
  end
  object Label7: TLabel
    Left = 55
    Top = 232
    Width = 97
    Height = 16
    Alignment = taRightJustify
    Caption = 'Prealloc file size'
  end
  object Label8: TLabel
    Left = 245
    Top = 232
    Width = 19
    Height = 16
    Caption = 'Mb'
  end
  object cbWantPreview: TCheckBox
    Left = 10
    Top = 9
    Width = 145
    Height = 17
    Caption = 'WantPreview'
    State = cbGrayed
    TabOrder = 0
    OnClick = cbWantPreviewClick
  end
  object cbWantCapture: TCheckBox
    Left = 10
    Top = 31
    Width = 145
    Height = 17
    Caption = 'WantCapture'
    State = cbGrayed
    TabOrder = 1
    OnClick = cbWantCaptureClick
  end
  object cbWantBitmaps: TCheckBox
    Left = 10
    Top = 52
    Width = 145
    Height = 17
    Caption = 'WantBitmaps'
    State = cbGrayed
    TabOrder = 2
  end
  object cbWantDVAudio: TCheckBox
    Left = 10
    Top = 95
    Width = 145
    Height = 17
    Caption = 'WantDVAudio'
    State = cbGrayed
    TabOrder = 3
  end
  object cbDoPreallocCaptureFile: TCheckBox
    Left = 10
    Top = 138
    Width = 145
    Height = 17
    Caption = 'PreallocCaptureFile'
    State = cbGrayed
    TabOrder = 4
    OnClick = cbDoPreallocCaptureFileClick
  end
  object cbUseTempFile: TCheckBox
    Left = 10
    Top = 160
    Width = 145
    Height = 17
    Caption = 'UseTempFile'
    State = cbGrayed
    TabOrder = 5
    OnClick = cbUseTempFileClick
  end
  object GroupBox1: TGroupBox
    Left = 157
    Top = 4
    Width = 264
    Height = 76
    Caption = ' Capture Sources '
    TabOrder = 6
    object Label1: TLabel
      Left = 8
      Top = 19
      Width = 36
      Height = 16
      Caption = 'Video'
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 35
      Height = 16
      Caption = 'Audio'
    end
    object cbVSources: TComboBox
      Left = 66
      Top = 16
      Width = 190
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 0
    end
    object cbASources: TComboBox
      Left = 66
      Top = 44
      Width = 190
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 158
    Top = 85
    Width = 264
    Height = 76
    Caption = ' Compressors '
    TabOrder = 7
    object cbVComps: TComboBox
      Left = 66
      Top = 16
      Width = 190
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 0
    end
    object cbAComps: TComboBox
      Left = 66
      Top = 44
      Width = 190
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 1
    end
    object cbVComp: TCheckBox
      Left = 6
      Top = 20
      Width = 60
      Height = 17
      Caption = 'Video'
      State = cbGrayed
      TabOrder = 2
      OnClick = cbVCompClick
    end
    object cbAComp: TCheckBox
      Left = 6
      Top = 48
      Width = 60
      Height = 17
      Caption = 'Audio'
      State = cbGrayed
      TabOrder = 3
      OnClick = cbACompClick
    end
  end
  object cbWantAudio: TCheckBox
    Left = 10
    Top = 74
    Width = 145
    Height = 17
    Caption = 'WantAudio'
    State = cbGrayed
    TabOrder = 8
    OnClick = cbWantAudioClick
  end
  object cbDVResolution: TComboBox
    Left = 102
    Top = 191
    Width = 88
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    TabOrder = 9
    Items.Strings = (
      'dont worry'
      'Full'
      'Half'
      'Quater'
      'DC')
  end
  object cbPixelFormat: TComboBox
    Left = 336
    Top = 191
    Width = 82
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    TabOrder = 10
    Items.Strings = (
      'pfDevice'
      'pf1bit'
      'pf4bit'
      'pf8bit'
      'pf15bit'
      'pf16bit'
      'pf24bit'
      'pf32bit'
      'pfCustom')
  end
  object Button1: TButton
    Left = 431
    Top = 10
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 13
  end
  object Button2: TButton
    Left = 431
    Top = 41
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 11
  end
  object cbWantAudioPreview: TCheckBox
    Left = 10
    Top = 117
    Width = 145
    Height = 17
    Caption = 'WantAudioPreview'
    State = cbGrayed
    TabOrder = 12
  end
  object feCaptureFile: TEdit
    Left = 155
    Top = 250
    Width = 280
    Height = 24
    TabOrder = 14
  end
  object feTempFile: TEdit
    Left = 155
    Top = 278
    Width = 280
    Height = 24
    TabOrder = 15
  end
  object sePreallocSize: TEdit
    Left = 154
    Top = 225
    Width = 85
    Height = 24
    TabOrder = 16
    Text = '0'
  end
end
