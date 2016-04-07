object frmMOEdit: TfrmMOEdit
  Left = 392
  Top = 230
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1052#1054
  ClientHeight = 182
  ClientWidth = 379
  Color = clBtnFace
  Constraints.MinHeight = 207
  Constraints.MinWidth = 385
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 379
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 373
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 366
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 60
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton2: TToolButton
        Left = 0
        Top = 0
        Action = acSave
      end
      object ToolButton5: TToolButton
        Left = 60
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 68
        Top = 0
        Action = acAdd
      end
      object ToolButton3: TToolButton
        Left = 128
        Top = 0
        Action = acCancel
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 379
    Height = 142
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 19
      Top = 15
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object laSklad: TLabel
      Left = 38
      Top = 42
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = #1057#1082#1083#1072#1076':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 367
      Top = 13
      Width = 7
      Height = 24
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object edCRM: TCheckBox
      Left = 16
      Top = 80
      Width = 267
      Height = 17
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      Caption = #1060#1086#1088#1084#1080#1088#1091#1077#1090' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103' '#1087#1086' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103#1084' '#1074#1088#1072#1095#1077#1081
      ParentBiDiMode = False
      TabOrder = 2
    end
    object cbRoot: TCheckBox
      Left = 16
      Top = 111
      Width = 267
      Height = 17
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      Caption = #1044#1086#1073#1072#1074#1083#1103#1090#1100' '#1074' '#1082#1086#1088#1077#1085#1100
      ParentBiDiMode = False
      TabOrder = 4
      OnClick = cbRootClick
    end
    object cbTreb: TCheckBox
      Left = 16
      Top = 94
      Width = 267
      Height = 17
      Alignment = taLeftJustify
      Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1072' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1081
      TabOrder = 3
    end
    object cbAllGroups: TCheckBox
      Left = 16
      Top = 65
      Width = 267
      Height = 17
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      Caption = #1042#1089#1077' '#1091#1095#1077#1090#1085#1099#1077' '#1075#1088#1091#1087#1087#1099
      ParentBiDiMode = False
      TabOrder = 1
      Visible = False
      OnClick = cbAllGroupsClick
    end
    object edName: TcxButtonEdit
      Tag = -1
      Left = 78
      Top = 12
      Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1100#1085#1086' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1075#1086
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 32781
      Properties.OnButtonClick = edNameButtonClick
      Style.BorderStyle = ebs3D
      TabOrder = 0
      OnDblClick = edNameDblClick
      Width = 282
    end
    object cedUchgrType: TcxButtonEdit
      Left = 126
      Top = 39
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1086#1089#1090#1091#1087#1085#1099#1093' '#1090#1080#1087#1086#1074' '#1091#1095'. '#1075#1088#1091#1087#1087' '#1052#1054' (ALT+ENTER)'
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 32781
      Properties.OnButtonClick = cedUchgrTypeButtonClick
      Style.BorderStyle = ebs3D
      TabOrder = 5
      Visible = False
      OnDblClick = cedUchgrTypeDblClick
      Width = 233
    end
    object lcbSklad: TcxLookupComboBox
      Left = 78
      Top = 39
      Properties.ClearKey = 46
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          Caption = #1057#1082#1083#1072#1076
          FieldName = 'FC_NAME'
        end
        item
          Caption = 'ID'
          Fixed = True
          Width = 20
          FieldName = 'FK_ID'
        end>
      Properties.ListSource = dmMain.dsSklad
      Style.BorderStyle = ebs3D
      TabOrder = 6
      Width = 282
    end
  end
  object FormStorage: TJvFormStorage
    AppStoragePath = 'frmMOEdit\'
    StoredValues = <>
    Left = 328
    Top = 104
  end
  object al: TActionList
    Left = 320
    Top = 16
    object acSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1080' '#1079#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acSaveExecute
    end
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1080' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1077#1097#1077' '#1086#1076#1085#1091' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 21
      ShortCut = 16397
      OnExecute = acAddExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' '#1073#1077#1079' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
  object oqUpdateFK_Sklad_ID: TOracleQuery
    SQL.Strings = (
      
        'update med.tmo m set m.fk_sklad_id = :pfk_sklad_id where m.moid ' +
        '= :pMOID')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000020000000D0000003A50464B5F534B4C41445F494403000000000000
      0000000000060000003A504D4F4944030000000000000000000000}
    Left = 118
    Top = 84
  end
end
