object frmSettings: TfrmSettings
  Left = 352
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Advanced options'
  ClientHeight = 304
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 12
    Width = 81
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Volume Label :'
    Transparent = True
  end
  object Label3: TLabel
    Left = 276
    Top = 264
    Width = 41
    Height = 13
    AutoSize = False
    Caption = '0'
    Transparent = True
  end
  object Label4: TLabel
    Left = 12
    Top = 264
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Cache Size :'
    Transparent = True
  end
  object Label2: TLabel
    Left = 156
    Top = 182
    Width = 181
    Height = 13
    AutoSize = False
    Transparent = True
  end
  object eVolLabel: TEdit
    Left = 84
    Top = 8
    Width = 149
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 16
    ParentFont = False
    TabOrder = 0
    Text = 'Binarymagics.com'
  end
  object cJoliet: TCheckBox
    Left = 84
    Top = 36
    Width = 105
    Height = 17
    Hint = 'Long File Name'
    Caption = 'Joliet File System'
    Checked = True
    State = cbChecked
    TabOrder = 1
  end
  object Button1: TButton
    Left = 260
    Top = 8
    Width = 69
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 15
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 260
    Top = 36
    Width = 69
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 16
    OnClick = Button2Click
  end
  object cCloseDisc: TCheckBox
    Left = 84
    Top = 54
    Width = 125
    Height = 17
    Caption = 'Close Disc (Finalize)'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object cUnderrunProtection: TCheckBox
    Left = 84
    Top = 90
    Width = 125
    Height = 17
    Caption = 'Underrun Protection'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object cTestWrite: TCheckBox
    Left = 84
    Top = 108
    Width = 77
    Height = 17
    Caption = 'Test Write'
    TabOrder = 6
  end
  object cEject: TCheckBox
    Left = 84
    Top = 126
    Width = 145
    Height = 17
    Caption = 'Eject after Write/Erase'
    TabOrder = 7
  end
  object cImportSession: TCheckBox
    Left = 84
    Top = 72
    Width = 97
    Height = 17
    Caption = 'Import Session'
    TabOrder = 3
    OnClick = cImportSessionClick
  end
  object eSession: TEdit
    Left = 180
    Top = 70
    Width = 34
    Height = 21
    Hint = 'Session Number to Import; for Last Session enter -1'
    Enabled = False
    TabOrder = 4
    Text = '0'
  end
  object cOPC: TCheckBox
    Left = 84
    Top = 144
    Width = 85
    Height = 17
    Caption = 'Perform OPC'
    TabOrder = 8
  end
  object sCacheSize: TTrackBar
    Left = 77
    Top = 256
    Width = 196
    Height = 29
    Max = 64
    Min = 2
    Frequency = 4
    Position = 2
    TabOrder = 14
    OnChange = sCacheSizeChange
  end
  object cQuickSaveISO: TCheckBox
    Left = 84
    Top = 162
    Width = 109
    Height = 17
    Caption = 'Quick Save .ISO'
    TabOrder = 9
  end
  object cBootable: TCheckBox
    Left = 84
    Top = 180
    Width = 65
    Height = 17
    Caption = 'Bootable'
    TabOrder = 10
    OnClick = cBootableClick
  end
  object cShowFiles: TCheckBox
    Left = 84
    Top = 198
    Width = 165
    Height = 17
    Caption = 'Show files before burning'
    TabOrder = 11
  end
  object cArchiveOnly: TCheckBox
    Left = 84
    Top = 215
    Width = 197
    Height = 17
    Caption = 'Archive files only && Clear Archive Bit'
    TabOrder = 12
  end
  object CheckBox1: TCheckBox
    Left = 84
    Top = 232
    Width = 197
    Height = 17
    Caption = 'Explorer style Directory/File view'
    TabOrder = 13
    Visible = False
  end
  object Button3: TButton
    Left = 260
    Top = 68
    Width = 69
    Height = 25
    Cancel = True
    Caption = 'Close Track'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    OnClick = Button3Click
  end
  object dlg: TOpenDialog
    DefaultExt = '*.Img'
    Filter = 'All Image Files|*.IMG;*.IMA;*.BIN|All Files|*.*'
    Left = 260
    Top = 164
  end
end
