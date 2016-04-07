object frmAddEditMG: TfrmAddEditMG
  Left = 218
  Top = 51
  BorderStyle = bsDialog
  Caption = #1055#1091#1085#1082#1090' '#1084#1077#1078#1075#1086#1088#1086#1076#1072
  ClientHeight = 237
  ClientWidth = 455
  Color = clCream
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
    Width = 449
    Height = 198
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clCream
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 24
      Top = 15
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object teName: TcxTextEdit
      Left = 113
      Top = 15
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 1
      Width = 311
    end
    object cxLabel2: TcxLabel
      Left = 24
      Top = 40
      Caption = #1050#1080#1083#1086#1084#1077#1090#1088#1072#1078':'
    end
    object cxLabel3: TcxLabel
      Left = 24
      Top = 66
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080':'
    end
    object memComment: TcxMemo
      Left = 113
      Top = 66
      Properties.ScrollBars = ssVertical
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 4
      Height = 89
      Width = 311
    end
    object seKm: TcxSpinEdit
      Left = 113
      Top = 40
      Properties.ImmediatePost = True
      Style.LookAndFeel.SkinName = 'Coffee'
      StyleDisabled.LookAndFeel.SkinName = 'Coffee'
      StyleFocused.LookAndFeel.SkinName = 'Coffee'
      StyleHot.LookAndFeel.SkinName = 'Coffee'
      TabOrder = 5
      Width = 121
    end
    object cxLabel4: TcxLabel
      Left = 24
      Top = 162
      Caption = #1056#1072#1081#1086#1085':'
    end
    object lcbRaion: TcxLookupComboBox
      Left = 113
      Top = 161
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
      Properties.ListSource = dsRaion
      Properties.PostPopupValueOnTab = True
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 7
      Width = 249
    end
  end
  object bOk: TcxButton
    Left = 296
    Top = 207
    Width = 75
    Height = 25
    Action = aOk
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.SkinName = 'Caramel'
  end
  object cxButton1: TcxButton
    Left = 377
    Top = 207
    Width = 75
    Height = 25
    Action = aCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.SkinName = 'Caramel'
  end
  object al: TActionList
    Left = 27
    Top = 91
    object aOk: TAction
      Caption = 'Ok'
      Hint = 'OK'
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
  object odsRaion: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name '
      '  from taxi.ts_raion'
      ' where fl_del = 0'
      'order by fc_name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 67
    Top = 91
  end
  object dsRaion: TDataSource
    DataSet = odsRaion
    Left = 99
    Top = 91
  end
end
