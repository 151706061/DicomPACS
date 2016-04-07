object fPrintActSpisUchGrp: TfPrintActSpisUchGrp
  Left = 0
  Top = 0
  Caption = #1040#1082#1090' '#1089#1087#1080#1089#1072#1085#1080#1103' '#1087#1086' '#1091#1095#1077#1090#1085#1099#1084' '#1075#1088#1091#1087#1087#1072#1084
  ClientHeight = 160
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 41
    Top = 83
    Width = 60
    Height = 13
    Caption = #1047#1072' '#1087#1077#1088#1080#1086#1076' '#1089
  end
  object Label2: TLabel
    Left = 20
    Top = 110
    Width = 81
    Height = 13
    Caption = #1059#1095#1077#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
  end
  object Label3: TLabel
    Left = 199
    Top = 83
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object Label4: TLabel
    Left = 11
    Top = 53
    Width = 90
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090'. '#1086#1090#1074'.:'
  end
  object cbPRO: TCheckBox
    Left = 108
    Top = 134
    Width = 49
    Height = 17
    Caption = #1056#1055#1054
    TabOrder = 2
  end
  object D1: TcxDateEdit
    Left = 108
    Top = 80
    Hint = #1044#1072#1090#1072' '#1079#1072#1103#1074#1082#1080' ('#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1087#1088#1080' '#1087#1077#1095#1072#1090#1080' '#1086#1090#1095#1077#1090#1072')'
    EditValue = 0d
    ParentShowHint = False
    Properties.DateButtons = [btnNow, btnToday]
    Properties.InputKind = ikMask
    Properties.ShowTime = False
    ShowHint = True
    Style.BorderStyle = ebs3D
    TabOrder = 0
    Width = 85
  end
  object D2: TcxDateEdit
    Left = 217
    Top = 80
    Hint = #1044#1072#1090#1072' '#1079#1072#1103#1074#1082#1080' ('#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1087#1088#1080' '#1087#1077#1095#1072#1090#1080' '#1086#1090#1095#1077#1090#1072')'
    EditValue = 0d
    ParentShowHint = False
    Properties.DateButtons = [btnNow, btnToday]
    Properties.InputKind = ikMask
    Properties.ShowTime = False
    ShowHint = True
    Style.BorderStyle = ebs3D
    TabOrder = 1
    Width = 85
  end
  object cxodsUchGrList: TcxLookupComboBox
    Left = 108
    Top = 107
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 15
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'UCHGRID'
    Properties.ListColumns = <
      item
        Caption = #1057#1087#1080#1089#1086#1082
        FieldName = 'FC_UCHGR'
      end>
    Properties.ListSource = dsodsUchGr
    Properties.PostPopupValueOnTab = True
    EditValue = 0
    Style.BorderStyle = ebs3D
    TabOrder = 3
    Width = 194
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 312
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 40
        Width = 308
      end>
    object ToolBar2: TToolBar
      Left = 9
      Top = 0
      Width = 299
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 81
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ShowCaptions = True
      TabOrder = 0
      object ToolButton3: TToolButton
        Left = 0
        Top = 0
        Action = actSave
      end
      object ToolButton4: TToolButton
        Left = 81
        Top = 0
        Action = actSaveExcel
      end
      object ToolButton2: TToolButton
        Left = 162
        Top = 0
        Action = acesc
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object lcbMO_GROUP: TcxLookupComboBox
    Left = 108
    Top = 50
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 15
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'GROUPID'
    Properties.ListColumns = <
      item
        FieldName = 'FC_GROUP'
      end>
    Properties.ListSource = DSMatOtv
    Properties.PostPopupValueOnTab = True
    EditValue = 0
    Style.BorderStyle = ebs3D
    TabOrder = 5
    Width = 194
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 168
    Top = 48
    object actSave: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100
      ImageIndex = 72
      ShortCut = 113
      OnExecute = actSaveExecute
    end
    object acesc: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1087#1077#1095#1072#1090#1100
      ImageIndex = 73
      ShortCut = 32883
      OnExecute = acescExecute
    end
    object actSaveExcel: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1074' Excel'
      Hint = #1055#1077#1095#1072#1090#1100' '#1074' Excel'
      ImageIndex = 71
      OnExecute = actSaveExcelExecute
    end
  end
  object odsUchGr: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as UCHGRID, '#39#1042#1089#1077' '#1075#1088#1091#1087#1087#1099' '#1091#1095#1077#1090#1085#1086#1089#1090#1080#39' as FC_UCHGR from du' +
        'al'
      'union all'
      'select UCHGRID,FC_UCHGR from MED.V$TUchGr'
      'where parentid = 0'
      'ORDER BY FC_UCHGR')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C010000000000}
    Session = dmMain.os
    Left = 32
    Top = 103
  end
  object dsodsUchGr: TDataSource
    DataSet = odsUchGr
    Left = 66
    Top = 103
  end
  object aodsMO_GROUP: TOracleDataSet
    SQL.Strings = (
      'SELECT * from'
      '(SELECT groupid, fc_group, fl_del, 0 as FN_ORDER'
      
        'FROM med.v$tmo_group WHERE (fl_del = 0) and (UPPER(fc_group) lik' +
        'e '#39'%'#1040#1055#1058#1045#1050#1040'%'#39')'
      'UNION'
      'SELECT groupid, fc_group, fl_del, 1 as FN_ORDER'
      
        'FROM med.v$tmo_group WHERE fl_del = 0 and (not (UPPER(fc_group) ' +
        'like '#39'%'#1040#1055#1058#1045#1050#1040'%'#39'))'
      ')'
      'ORDER BY FN_ORDER, UPPER(fc_group)'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C010000000000}
    Session = dmMain.os
    Left = 32
    Top = 47
  end
  object DSMatOtv: TDataSource
    DataSet = aodsMO_GROUP
    Left = 66
    Top = 47
  end
end
