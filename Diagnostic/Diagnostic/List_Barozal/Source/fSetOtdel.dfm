object frmSetOtdel: TfrmSetOtdel
  Left = 404
  Top = 265
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1088#1072#1090#1100' '#1072#1084#1073'. '#1086#1090#1076#1077#1083#1077#1085#1080#1077
  ClientHeight = 90
  ClientWidth = 388
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
    Width = 382
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 13
      Top = 12
      Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1077':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
    end
    object lcbOtdel: TcxLookupComboBox
      Left = 91
      Top = 11
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'fk_id'
      Properties.ListColumns = <
        item
          FieldName = 'fc_name'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsOtdel
      Properties.PostPopupValueOnTab = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Width = 275
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 382
    Height = 40
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 80
    ExplicitTop = 48
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bOk: TcxButton
      Left = 218
      Top = 7
      Width = 75
      Height = 25
      Action = aOk
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton1: TcxButton
      Left = 296
      Top = 7
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 32
    Top = 32
    object aOk: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
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
  object odsOtdel: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39#39' as fc_name'
      '  from dual'
      'union all'
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      '   and fl_del = 0'
      'start with fc_synonim = '#39'BAROZAL_OTDEL'#39
      'connect by prior fk_id = fk_owner')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 112
    Top = 32
  end
  object dsOtdel: TDataSource
    DataSet = odsOtdel
    Left = 155
    Top = 35
  end
end
