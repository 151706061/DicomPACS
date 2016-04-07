object Dicom2AVIStatusForm: TDicom2AVIStatusForm
  Left = 652
  Top = 146
  Width = 370
  Height = 404
  Caption = 'Status'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBar1: TProgressBar
    Left = 12
    Top = 344
    Width = 323
    Height = 31
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 261
    Top = 312
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkAbort
  end
  object GroupBox1: TGroupBox
    Left = 17
    Top = 11
    Width = 311
    Height = 105
    Caption = 'Compression'
    TabOrder = 2
    object Label1: TLabel
      Left = 13
      Top = 27
      Width = 27
      Height = 13
      Caption = 'Type:'
    end
    object Label2: TLabel
      Left = 15
      Top = 60
      Width = 32
      Height = 13
      Caption = 'Quality'
    end
    object ComboBox1: TComboBox
      Left = 66
      Top = 22
      Width = 178
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'Microsoft Video 1'
        'ShowDialog'
        'DivX')
    end
    object TrackBar1: TTrackBar
      Left = 66
      Top = 54
      Width = 180
      Height = 45
      TabOrder = 1
      ThumbLength = 10
    end
  end
  object GroupBox2: TGroupBox
    Left = 17
    Top = 129
    Width = 311
    Height = 55
    Caption = 'Dimensions'
    TabOrder = 3
    object Label3: TLabel
      Left = 14
      Top = 31
      Width = 63
      Height = 13
      Caption = 'Image Width:'
    end
    object Label4: TLabel
      Left = 150
      Top = 32
      Width = 66
      Height = 13
      Caption = 'Image Height:'
    end
    object SpinEdit1: TEdit
      Left = 92
      Top = 24
      Width = 49
      Height = 21
      TabOrder = 0
    end
    object SpinEdit2: TEdit
      Left = 225
      Top = 24
      Width = 64
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 17
    Top = 197
    Width = 311
    Height = 105
    Caption = 'Frame Rate'
    TabOrder = 4
    object Label5: TLabel
      Left = 21
      Top = 51
      Width = 93
      Height = 13
      Caption = 'Frames Per Second'
    end
    object Label6: TLabel
      Left = 21
      Top = 76
      Width = 97
      Height = 13
      Caption = 'Total Running TIme:'
    end
    object Label7: TLabel
      Left = 197
      Top = 76
      Width = 57
      Height = 13
      Caption = '(in seconds)'
    end
    object CheckBox1: TCheckBox
      Left = 20
      Top = 22
      Width = 179
      Height = 17
      Caption = 'Use DICOM Frame Rate'
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 123
      Top = 74
      Width = 56
      Height = 21
      TabOrder = 1
    end
    object SpinEdit3: TEdit
      Left = 118
      Top = 47
      Width = 121
      Height = 21
      TabOrder = 2
    end
  end
  object Button1: TButton
    Left = 12
    Top = 313
    Width = 75
    Height = 25
    Caption = 'Create'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 93
    Top = 312
    Width = 75
    Height = 25
    Caption = 'View'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 177
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 7
    OnClick = Button3Click
  end
end
