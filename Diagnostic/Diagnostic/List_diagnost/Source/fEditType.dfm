object frmEditType: TfrmEditType
  Left = 377
  Top = 343
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1080#1087' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
  ClientHeight = 108
  ClientWidth = 274
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
    Width = 268
    Height = 57
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 8
      Top = 19
      Caption = #1058#1080#1087' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103':'
    end
    object lcbType: TcxLookupComboBox
      Left = 114
      Top = 18
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsType
      Properties.PostPopupValueOnTab = True
      TabOrder = 1
      Width = 145
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 63
    Width = 268
    Height = 42
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 103
      Top = 8
      Width = 75
      Height = 25
      Action = aSave
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 184
      Top = 8
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
    end
  end
  object al: TActionList
    Left = 56
    Top = 48
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
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
  object dsType: TDataSource
    DataSet = odsType
    Left = 176
    Top = 112
  end
  object odsType: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME'
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'NAZN_TYPES'#39')'
      'ORDER BY FN_ORDER')
    Optimize = False
    Session = frmMain.os
    Left = 232
    Top = 112
  end
end
