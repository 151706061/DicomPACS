object frmMedKardListFilter: TfrmMedKardListFilter
  Left = 384
  Top = 295
  Width = 215
  Height = 130
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1060#1080#1083#1100#1090#1088' '#1089#1087#1080#1089#1082#1072' '#1082#1072#1088#1090#1086#1095#1077#1082' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074
  Color = clBtnFace
  Constraints.MaxHeight = 130
  Constraints.MinHeight = 130
  Constraints.MinWidth = 215
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 207
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 38
        Width = 203
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 190
      Height = 38
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 46
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
        Action = aChoose
      end
      object ToolButton2: TToolButton
        Left = 46
        Top = 0
        Action = aCancel
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 42
    Width = 207
    Height = 61
    Align = alClient
    TabOrder = 1
    DesignSize = (
      207
      61)
    object edFilter: TEdit
      Left = 5
      Top = 36
      Width = 198
      Height = 21
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' (Enter)'
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object rgFilter: TRadioGroup
      Left = 5
      Top = 1
      Width = 198
      Height = 32
      Anchors = [akLeft, akTop, akRight]
      Caption = #1060#1080#1083#1100#1090#1088':'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        #1042#1089#1077' (F5)'
        #1050#1086#1076' EAN (F6)')
      ParentFont = False
      TabOrder = 1
      OnClick = rgFilterClick
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 128
    Top = 12
    object aChoose: TAction
      Caption = #1042#1099#1073#1086#1088
      Hint = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 9
      ShortCut = 13
      OnExecute = aChooseExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 8
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmMedKardListFilter\'
    StoredProps.Strings = (
      'rgFilter.ItemIndex'
      'edFilter.Text')
    StoredValues = <>
    Left = 151
    Top = 56
  end
end
