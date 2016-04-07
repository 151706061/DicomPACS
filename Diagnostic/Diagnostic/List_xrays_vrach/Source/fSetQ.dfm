object frmSetQ: TfrmSetQ
  Left = 390
  Top = 194
  BorderStyle = bsDialog
  Caption = #1054#1094#1077#1085#1082#1072' '#1082#1072#1095#1077#1089#1090#1074#1072
  ClientHeight = 94
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
    Height = 43
    Align = alTop
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 16
      Top = 11
      Caption = #1054#1094#1077#1085#1082#1072':'
    end
    object lcbQ: TcxLookupComboBox
      Left = 68
      Top = 11
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
      Properties.ListSource = dsQ
      Properties.PostPopupValueOnTab = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Width = 253
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 49
    Width = 340
    Height = 42
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 45
    ExplicitTop = 52
    ExplicitWidth = 185
    ExplicitHeight = 41
    object cxButton1: TcxButton
      Left = 179
      Top = 9
      Width = 75
      Height = 25
      Action = aOk
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton2: TcxButton
      Left = 257
      Top = 9
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 136
    Top = 40
    object aOk: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1086#1094#1077#1085#1082#1091' '#1082#1072#1095#1077#1089#1090#1074#1072
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object odsQ: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39#39' as fc_name, 0 as fn_order'
      '  from dual'
      ''
      'union all'
      ''
      'select fk_id, fc_name, fn_order'
      '  from asu.tsmid'
      ' where level <> 1'
      'start with fc_synonim = '#39'XRAY_QUALITY'#39
      'connect by prior fk_id = fk_owner')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 32
    Top = 40
  end
  object dsQ: TDataSource
    DataSet = odsQ
    Left = 67
    Top = 41
  end
end
