object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1076#1072#1085#1085#1099#1093' PACS '#1089#1077#1088#1074#1077#1088#1072
  ClientHeight = 499
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma,204'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object PageControl1: TPageControl
    Left = 0
    Top = 97
    Width = 704
    Height = 128
    ActivePage = TabSheet2
    Align = alTop
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'ORACLE'
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 696
        Height = 99
        Align = alClient
        Caption = 'Oracle'
        TabOrder = 0
        object Label4: TLabel
          Left = 8
          Top = 24
          Width = 23
          Height = 14
          Caption = 'User'
        end
        object Label5: TLabel
          Left = 8
          Top = 48
          Width = 50
          Height = 14
          Caption = 'Password'
        end
        object Label6: TLabel
          Left = 8
          Top = 72
          Width = 46
          Height = 14
          Caption = 'Database'
        end
        object edUser: TEdit
          Left = 64
          Top = 21
          Width = 163
          Height = 22
          TabOrder = 0
          Text = 'pacs'
        end
        object edPsw: TEdit
          Left = 64
          Top = 45
          Width = 163
          Height = 22
          PasswordChar = '*'
          TabOrder = 1
          Text = 'pacs123'
        end
        object edSchema: TEdit
          Left = 64
          Top = 69
          Width = 163
          Height = 22
          TabOrder = 2
          Text = 'asu_surgut_kardio'
        end
        object btnConnORA: TButton
          Left = 607
          Top = 17
          Width = 75
          Height = 25
          Caption = 'Connect'
          TabOrder = 3
          OnClick = btnConnORAClick
        end
        object Button2: TButton
          Left = 607
          Top = 48
          Width = 75
          Height = 25
          Caption = #1055#1077#1088#1077#1085#1086#1089
          TabOrder = 4
          OnClick = Button2Click
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'POSTGRES'
      ImageIndex = 1
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 696
        Height = 99
        Align = alClient
        Caption = 'Postgres'
        TabOrder = 0
        object Label8: TLabel
          Left = 8
          Top = 71
          Width = 23
          Height = 14
          Caption = 'User'
        end
        object Label9: TLabel
          Left = 240
          Top = 71
          Width = 50
          Height = 14
          Caption = 'Password'
        end
        object Label10: TLabel
          Left = 240
          Top = 16
          Width = 46
          Height = 14
          Caption = 'Database'
        end
        object Label11: TLabel
          Left = 240
          Top = 43
          Width = 39
          Height = 14
          Caption = 'Schema'
        end
        object Label12: TLabel
          Left = 8
          Top = 43
          Width = 19
          Height = 14
          Caption = 'Port'
        end
        object Label13: TLabel
          Left = 8
          Top = 16
          Width = 33
          Height = 14
          Caption = 'Server'
        end
        object edUserPostgres: TEdit
          Left = 64
          Top = 68
          Width = 163
          Height = 22
          TabOrder = 0
          Text = 'postgres'
        end
        object edPasswPostgres: TEdit
          Left = 296
          Top = 69
          Width = 163
          Height = 22
          PasswordChar = '*'
          TabOrder = 1
          Text = 'postgres'
        end
        object edDatabasePostgres: TEdit
          Left = 296
          Top = 13
          Width = 163
          Height = 22
          TabOrder = 2
          Text = 'test'
        end
        object btnConnPostgres: TButton
          Left = 607
          Top = 17
          Width = 75
          Height = 25
          Caption = 'Connect'
          TabOrder = 3
          OnClick = btnConnPostgresClick
        end
        object Button4: TButton
          Left = 607
          Top = 48
          Width = 75
          Height = 25
          Caption = #1055#1077#1088#1077#1085#1086#1089
          TabOrder = 4
          OnClick = Button4Click
        end
        object edSchemaPostgres: TEdit
          Left = 296
          Top = 40
          Width = 163
          Height = 22
          TabOrder = 5
          Text = 'mypacs'
        end
        object edPortPostgres: TEdit
          Left = 64
          Top = 40
          Width = 163
          Height = 22
          TabOrder = 6
          Text = '5432'
        end
        object edServerPostgres: TEdit
          Left = 64
          Top = 13
          Width = 163
          Height = 22
          TabOrder = 7
          Text = 'localhost'
        end
        object Button3: TButton
          Left = 526
          Top = 48
          Width = 75
          Height = 25
          Caption = #1054#1095#1080#1090#1089#1082#1072
          TabOrder = 8
          OnClick = Button3Click
        end
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 704
    Height = 97
    Align = alTop
    Caption = 'Firebird'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 44
      Height = 14
      Caption = #1060#1072#1081#1083' '#1041#1044
    end
    object Label2: TLabel
      Left = 8
      Top = 46
      Width = 23
      Height = 14
      Caption = 'User'
    end
    object Label3: TLabel
      Left = 8
      Top = 68
      Width = 50
      Height = 14
      Caption = 'Password'
    end
    object adPswFB: TEdit
      Left = 64
      Top = 65
      Width = 161
      Height = 22
      PasswordChar = '*'
      TabOrder = 0
      Text = 'masterkey'
    end
    object btnConnFB: TButton
      Left = 607
      Top = 51
      Width = 75
      Height = 25
      Caption = 'Connect'
      TabOrder = 1
      OnClick = btnConnFBClick
    end
    object edDBFB: TEdit
      Left = 64
      Top = 21
      Width = 537
      Height = 22
      TabOrder = 2
      Text = 'C:\pacs\PACSDB.GDB'
    end
    object edFBUsername: TEdit
      Left = 64
      Top = 43
      Width = 161
      Height = 22
      TabOrder = 3
      Text = 'sysdba'
    end
    object Button1: TButton
      Left = 607
      Top = 20
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 4
      OnClick = Button1Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 225
    Width = 704
    Height = 274
    Align = alClient
    Caption = #1055#1077#1088#1077#1085#1086#1089
    TabOrder = 2
    object Memo1: TMemo
      Left = 2
      Top = 16
      Width = 700
      Height = 256
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object pFIBDatabase1: TpFIBDatabase
    DefaultTransaction = pFIBTransaction1
    DefaultUpdateTransaction = pFIBTransaction1
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 256
    Top = 80
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 304
    Top = 80
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 352
    Top = 80
  end
  object OracleSession1: TOracleSession
    Left = 264
    Top = 280
  end
  object pFIBQuery1: TpFIBQuery
    Transaction = pFIBTransaction1
    Database = pFIBDatabase1
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 392
    Top = 80
  end
  object pFIBTransaction2: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 472
    Top = 80
  end
  object OracleQuery1: TOracleQuery
    Session = OracleSession1
    Optimize = False
    Left = 264
    Top = 344
  end
  object UniConnection1: TUniConnection
    ProviderName = 'PostgreSQL'
    SpecificOptions.Strings = (
      'PostgreSQL.UseUnicode=True')
    Left = 472
    Top = 280
  end
  object UniQuery1: TUniQuery
    Connection = UniConnection1
    Transaction = UniTransaction1
    UpdateTransaction = UniTransaction1
    Left = 552
    Top = 352
  end
  object UniTransaction1: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 552
    Top = 280
  end
end
