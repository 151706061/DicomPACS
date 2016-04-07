object frmAddEditCross: TfrmAddEditCross
  Left = 491
  Top = 137
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1077#1088#1077#1082#1088#1077#1089#1090#1086#1082
  ClientHeight = 143
  ClientWidth = 354
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
    Width = 348
    Height = 94
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitLeft = -2
    ExplicitWidth = 403
    object cxLabel1: TcxLabel
      Left = 16
      Top = 13
      Caption = #1059#1083#1080#1094#1072'1:'
    end
    object cxLabel2: TcxLabel
      Left = 16
      Top = 38
      Caption = #1059#1083#1080#1094#1072'2:'
    end
    object cxLabel3: TcxLabel
      Left = 16
      Top = 63
      Caption = #1056#1072#1081#1086#1085':'
    end
    object lcbStreet1: TcxLookupComboBox
      Left = 80
      Top = 12
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 12
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsStreet1
      Properties.PostPopupValueOnTab = True
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 3
      Width = 257
    end
    object lcbStreet2: TcxLookupComboBox
      Left = 80
      Top = 37
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 12
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsStreet2
      Properties.PostPopupValueOnTab = True
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 4
      Width = 257
    end
    object lcbRaion: TcxLookupComboBox
      Left = 80
      Top = 62
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 12
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsRaion
      Properties.PostPopupValueOnTab = True
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 5
      Width = 145
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 100
    Width = 348
    Height = 40
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 6
    ExplicitTop = 11
    ExplicitWidth = 403
    ExplicitHeight = 193
    object bOk: TcxButton
      Left = 181
      Top = 8
      Width = 75
      Height = 25
      Action = aOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Caramel'
    end
    object cxButton1: TcxButton
      Left = 262
      Top = 8
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Caramel'
    end
  end
  object al: TActionList
    Left = 24
    Top = 40
    object aOk: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object odsStreet1: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name '
      '  from taxi.tstreet'
      ' where fl_del = 0'
      'order by fc_name')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 51
    Top = 91
  end
  object dsStreet1: TDataSource
    DataSet = odsStreet1
    Left = 11
    Top = 91
  end
  object dsStreet2: TDataSource
    DataSet = odsStreet2
    Left = 91
    Top = 91
  end
  object odsStreet2: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name '
      '  from taxi.tstreet'
      ' where fl_del = 0'
      'order by fc_name')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 131
    Top = 91
  end
  object dsRaion: TDataSource
    DataSet = odsRaion
    Left = 251
    Top = 59
  end
  object odsRaion: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name '
      '  from taxi.ts_raion'
      ' where fl_del = 0'
      'order by fc_name')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 291
    Top = 59
  end
end
