object frmTrebMedic: TfrmTrebMedic
  Left = 329
  Top = 280
  Width = 291
  Height = 167
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1042#1099#1073#1086#1088' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
  Color = clBtnFace
  Constraints.MinHeight = 160
  Constraints.MinWidth = 290
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 283
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 38
        Width = 279
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 266
      Height = 38
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 60
      Caption = 'ToolBar1'
      Flat = True
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acSave
      end
      object ToolButton2: TToolButton
        Left = 60
        Top = 0
        Action = acClose
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 42
    Width = 283
    Height = 91
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Label5: TLabel
      Left = 6
      Top = 19
      Width = 79
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label1: TLabel
      Left = 38
      Top = 44
      Width = 47
      Height = 13
      Caption = #1045#1076'. '#1048#1079#1084'.:'
    end
    object Label3: TLabel
      Left = 48
      Top = 68
      Width = 37
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086':'
    end
    object deMedicName: TEdit
      Left = 90
      Top = 16
      Width = 161
      Height = 21
      AutoSelect = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
    end
    object deEdIzm: TEdit
      Left = 90
      Top = 40
      Width = 105
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object seKol: TdxSpinEdit
      Left = 90
      Top = 64
      Width = 105
      Style.BorderStyle = xbsFlat
      Style.ButtonStyle = btsFlat
      Style.ButtonTransparence = ebtNone
      Style.HotTrack = False
      Style.Shadow = False
      TabOrder = 3
      OnChange = seKolChange
      ValueType = vtFloat
      StoredValues = 8
    end
    object bbMedicName: TBitBtn
      Left = 256
      Top = 16
      Width = 17
      Height = 20
      Action = acSelect
      Caption = '...'
      TabOrder = 0
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 248
    Top = 8
    object acSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acSaveExecute
    end
    object acClose: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCloseExecute
    end
    object acSelect: TAction
      Caption = #1042#1099#1073#1086#1088' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
      Hint = #1042#1099#1073#1086#1088' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
      OnExecute = acSelectExecute
    end
  end
end
