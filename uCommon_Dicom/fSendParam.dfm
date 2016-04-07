object frmSendParam: TfrmSendParam
  Left = 325
  Top = 137
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1054#1090#1087#1088#1072#1074#1082#1072' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
  ClientHeight = 190
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 340
    Height = 62
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object cxLabel3: TcxLabel
      Left = 11
      Top = 9
      Caption = #1059#1089#1090#1088#1086#1081#1089#1090#1074#1086' DICOM :'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.SkinName = 'Black'
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.SkinName = 'Black'
    end
    object EdtAETitle: TcxButtonEdit
      Left = 11
      Top = 33
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = EdtAETitlePropertiesButtonClick
      Style.LookAndFeel.SkinName = 'Black'
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 0
      Width = 310
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 140
    Width = 346
    Height = 50
    Align = alClient
    TabOrder = 1
    object bCancel: TcxButton
      Left = 252
      Top = 12
      Width = 75
      Height = 25
      Hint = #1054#1090#1084#1077#1085#1072
      Action = aCancel
      Caption = #1054#1090#1084#1077#1085#1072
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bOk: TcxButton
      Left = 171
      Top = 12
      Width = 75
      Height = 25
      Action = aOk
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 71
    Width = 340
    Height = 66
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 11
      Top = 10
      Width = 39
      Height = 13
      Caption = #1057#1078#1072#1090#1080#1077
    end
    object Label2: TLabel
      Left = 8
      Top = 39
      Width = 48
      Height = 13
      Caption = #1050#1072#1095#1077#1089#1090#1074#1086
    end
    object LbPrc: TLabel
      Left = 292
      Top = 39
      Width = 32
      Height = 13
      Caption = '100 %'
    end
    object CBTypeZip: TcxComboBox
      Left = 72
      Top = 7
      Properties.OnChange = CBTypeZipPropertiesChange
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 0
      Text = #1085#1077#1090
      Width = 252
    end
    object TBSetZipPrc: TcxTrackBar
      Left = 72
      Top = 27
      Enabled = False
      Position = 10
      Properties.Min = 1
      Properties.OnChange = cxTrackBar1PropertiesChange
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Height = 25
      Width = 214
    end
  end
  object alOKCancel: TActionList
    Left = 160
    Top = 6
    object aOk: TAction
      Caption = 'Ok'
      Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100', '#1085#1077' '#1086#1090#1087#1088#1072#1074#1083#1103#1103
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
