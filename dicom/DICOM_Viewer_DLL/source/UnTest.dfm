object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 239
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma,204'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 10
    Top = 64
    Width = 89
    Height = 14
    Caption = 'AccessionNumber'
  end
  object Label2: TLabel
    Left = 10
    Top = 39
    Width = 44
    Height = 14
    Caption = 'StudyUID'
  end
  object Label3: TLabel
    Left = 10
    Top = 11
    Width = 41
    Height = 14
    Caption = 'PatientID'
  end
  object Label4: TLabel
    Left = 10
    Top = 123
    Width = 23
    Height = 14
    Caption = 'User'
  end
  object Label5: TLabel
    Left = 10
    Top = 147
    Width = 50
    Height = 14
    Caption = 'Password'
  end
  object Label6: TLabel
    Left = 10
    Top = 171
    Width = 46
    Height = 14
    Caption = 'Database'
  end
  object Button1: TButton
    Left = 384
    Top = 89
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1088#1086#1089
    TabOrder = 0
    OnClick = Button1Click
  end
  object edAccessionNumber: TEdit
    Left = 105
    Top = 61
    Width = 354
    Height = 22
    TabOrder = 1
    Text = 'AN-15.1.2015.3308239812'
  end
  object edStudyUID: TEdit
    Left = 105
    Top = 36
    Width = 354
    Height = 22
    TabOrder = 2
  end
  object edPatientID: TEdit
    Left = 105
    Top = 8
    Width = 354
    Height = 22
    TabOrder = 3
  end
  object edUser: TEdit
    Left = 105
    Top = 120
    Width = 144
    Height = 22
    TabOrder = 4
    Text = 'ASU'
  end
  object edPassword: TEdit
    Left = 105
    Top = 144
    Width = 144
    Height = 22
    TabOrder = 5
    Text = 'ASU'
  end
  object edDatabase: TEdit
    Left = 105
    Top = 168
    Width = 144
    Height = 22
    TabOrder = 6
    Text = 'asu_SOKB'
  end
  object Button2: TButton
    Left = 384
    Top = 136
    Width = 75
    Height = 25
    Caption = 'test asp dll'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 384
    Top = 176
    Width = 75
    Height = 25
    Hint = #1047#1072#1087#1080#1089#1100' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103' '#1089' '#1079#1072#1076#1072#1085#1085#1099#1084' ACCESSIONNUMBER'
    Caption = 'DICOM CD'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = Button3Click
  end
  object OracleSession1: TOracleSession
    LogonUsername = 'ASU'
    LogonPassword = 'ASU'
    LogonDatabase = 'ASU_HABAROVSK_KKB2'
    Left = 40
    Top = 72
  end
end
