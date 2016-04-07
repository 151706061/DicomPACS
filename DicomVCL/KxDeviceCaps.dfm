object DeviceCapsForm: TDeviceCapsForm
  Left = 509
  Top = 241
  BorderStyle = bsDialog
  Caption = 'CDROM Device Cap'
  ClientHeight = 188
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 264
    Height = 21
    Align = alTop
    AutoSize = False
    Caption = ' Label1'
    Layout = tlCenter
  end
  object Panel2: TPanel
    Left = 0
    Top = 22
    Width = 261
    Height = 163
    BevelOuter = bvLowered
    Enabled = False
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 148
      Width = 121
      Height = 13
      AutoSize = False
      Caption = 'Label2'
    end
    object Label3: TLabel
      Left = 134
      Top = 148
      Width = 123
      Height = 13
      AutoSize = False
      Caption = 'Label3'
    end
    object ReadCDR: TCheckBox
      Left = 6
      Top = 4
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Read CDR'
      TabOrder = 0
    end
    object ReadCDRW: TCheckBox
      Left = 6
      Top = 20
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Read CDRW'
      TabOrder = 1
    end
    object WriteCDR: TCheckBox
      Left = 132
      Top = 4
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Write CDR'
      TabOrder = 2
    end
    object WriteCDRW: TCheckBox
      Left = 132
      Top = 20
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Write CDRW'
      TabOrder = 3
    end
    object WriteDVDPR: TCheckBox
      Left = 132
      Top = 84
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Write DVD+R'
      TabOrder = 4
    end
    object UnderrunProtection: TCheckBox
      Left = 6
      Top = 132
      Width = 246
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Underrun Protection'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object ReadDVD: TCheckBox
      Left = 6
      Top = 116
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Read DVD'
      TabOrder = 6
    end
    object ReadDVDRAM: TCheckBox
      Left = 6
      Top = 68
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Read DVD-RAM'
      TabOrder = 7
    end
    object ReadDVDRW: TCheckBox
      Left = 6
      Top = 52
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Read DVD-RW'
      TabOrder = 8
    end
    object WriteDVDR: TCheckBox
      Left = 132
      Top = 36
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Write DVD-R'
      TabOrder = 9
    end
    object WriteDVDRAM: TCheckBox
      Left = 132
      Top = 68
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Write DVD-RAM'
      TabOrder = 10
    end
    object ReadDVDPR: TCheckBox
      Left = 6
      Top = 84
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Read DVD+R'
      TabOrder = 11
    end
    object WriteDVDPRW: TCheckBox
      Left = 132
      Top = 100
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Write DVD+RW'
      TabOrder = 12
    end
    object WriteDVDRW: TCheckBox
      Left = 132
      Top = 52
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Write DVD-RW'
      TabOrder = 13
    end
    object ReadDVDPRW: TCheckBox
      Left = 6
      Top = 100
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Read DVD+RW'
      TabOrder = 14
    end
    object ReadDVDR: TCheckBox
      Left = 6
      Top = 36
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Read DVD-R'
      TabOrder = 15
    end
    object WriteTest: TCheckBox
      Left = 132
      Top = 116
      Width = 120
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Write Test'
      TabOrder = 16
    end
  end
  object Button1: TButton
    Left = 268
    Top = 112
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Close'
    TabOrder = 1
    TabStop = False
    OnClick = Button1Click
  end
end
