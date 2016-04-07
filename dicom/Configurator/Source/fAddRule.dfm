object frmAddRule: TfrmAddRule
  Left = 344
  Top = 187
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1072#1074#1080#1083#1086' '#1087#1077#1088#1077#1089#1099#1083#1082#1080
  ClientHeight = 198
  ClientWidth = 375
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
    Width = 369
    Height = 148
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 122
      Width = 48
      Height = 13
      Caption = #1050#1072#1095#1077#1089#1090#1074#1086
    end
    object LbPrc: TLabel
      Left = 329
      Top = 122
      Width = 32
      Height = 13
      Caption = '100 %'
    end
    object cxLabel1: TcxLabel
      Left = 16
      Top = 16
      Caption = #1040#1045' '#1089#1077#1088#1074#1077#1088#1072':'
    end
    object beTo: TcxButtonEdit
      Left = 105
      Top = 15
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ViewStyle = vsHideCursor
      Properties.OnButtonClick = beToPropertiesButtonClick
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Width = 256
    end
    object cxLabel2: TcxLabel
      Left = 16
      Top = 40
      Caption = #1040#1045' '#1080#1089#1090#1086#1095#1085#1080#1082#1072':'
    end
    object beFrom: TcxButtonEdit
      Left = 105
      Top = 39
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ViewStyle = vsHideCursor
      Properties.OnButtonClick = beFromPropertiesButtonClick
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 3
      Width = 256
    end
    object cxLabel3: TcxLabel
      Left = 16
      Top = 65
      Caption = #1052#1086#1076#1072#1083#1100#1085#1086#1089#1090#1100':'
    end
    object cbType: TcxComboBox
      Left = 105
      Top = 64
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items.Strings = (
        ''
        'CT'
        'CR'
        'DR'
        'OT'
        'US'
        'XA'
        'VR'
        'MR'
        'MG'
        'NM'
        'SC'
        'DX'
        'ES')
      Properties.PostPopupValueOnTab = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 5
      Width = 88
    end
    object cxLabel4: TcxLabel
      Left = 16
      Top = 88
      Caption = #1057#1078#1072#1090#1080#1077':'
    end
    object cxComboBox1: TcxComboBox
      Left = 105
      Top = 87
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.PostPopupValueOnTab = True
      Properties.OnChange = cxComboBox1PropertiesChange
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 7
      Width = 256
    end
    object TBSetZipPrc: TcxTrackBar
      Left = 105
      Top = 110
      Enabled = False
      Position = 10
      Properties.Min = 1
      Properties.OnChange = cxTrackBar1PropertiesChange
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 8
      Height = 25
      Width = 218
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 154
    Width = 369
    Height = 41
    Margins.Top = 0
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bOk: TcxButton
      Left = 205
      Top = 6
      Width = 75
      Height = 25
      Action = aSave
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton1: TcxButton
      Left = 286
      Top = 6
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 251
    Top = 67
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1088#1072#1074#1080#1083#1086' '#1087#1077#1088#1077#1089#1099#1083#1082#1080
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
