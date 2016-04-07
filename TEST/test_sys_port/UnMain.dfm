object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Check Open Ports'
  ClientHeight = 685
  ClientWidth = 986
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma,204'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 986
    Height = 685
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Step 1'
      ExplicitWidth = 281
      ExplicitHeight = 164
      object GroupBox1: TGroupBox
        Left = 0
        Top = 56
        Width = 978
        Height = 600
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 232
        ExplicitTop = 437
        ExplicitWidth = 642
        ExplicitHeight = 176
        object Splitter1: TSplitter
          Left = 465
          Top = 16
          Height = 582
          ExplicitLeft = 432
          ExplicitTop = 232
          ExplicitHeight = 100
        end
        object GroupBox3: TGroupBox
          Left = 468
          Top = 16
          Width = 508
          Height = 582
          Align = alClient
          Caption = 'errors'
          TabOrder = 0
          ExplicitLeft = 440
          ExplicitTop = 40
          ExplicitWidth = 185
          ExplicitHeight = 105
          object Memo2: TMemo
            Left = 2
            Top = 16
            Width = 504
            Height = 564
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma,204'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 0
            ExplicitLeft = -75
            ExplicitTop = -143
            ExplicitWidth = 417
            ExplicitHeight = 301
          end
        end
        object GroupBox4: TGroupBox
          Left = 2
          Top = 16
          Width = 463
          Height = 582
          Align = alLeft
          Caption = 'console'
          TabOrder = 1
          object Memo1: TMemo
            Left = 2
            Top = 16
            Width = 459
            Height = 564
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma,204'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 0
            ExplicitLeft = -121
            ExplicitTop = -143
            ExplicitWidth = 417
            ExplicitHeight = 301
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 978
        Height = 56
        Align = alTop
        TabOrder = 1
        ExplicitTop = 344
        object Label1: TLabel
          Left = 16
          Top = 28
          Width = 47
          Height = 14
          Caption = 'Command'
        end
        object Button1: TButton
          Left = 660
          Top = 19
          Width = 133
          Height = 25
          Caption = 'Execute'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Edit1: TEdit
          Left = 72
          Top = 20
          Width = 577
          Height = 22
          TabOrder = 1
          Text = 'netstat -aon'
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      ExplicitWidth = 281
      ExplicitHeight = 164
      object Memo3: TMemo
        Left = 0
        Top = 0
        Width = 978
        Height = 656
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
end
