object fmTreb_Quota_Edit: TfmTreb_Quota_Edit
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = #1050#1074#1086#1090#1072
  ClientHeight = 140
  ClientWidth = 466
  Color = clBtnFace
  Constraints.MaxHeight = 162
  Constraints.MaxWidth = 750
  Constraints.MinHeight = 162
  Constraints.MinWidth = 387
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  DesignSize = (
    466
    140)
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 466
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 462
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 453
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 62
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
        Left = 62
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 70
        Top = 0
        Action = acCancel
      end
    end
  end
  object bedMedic: TcxButtonEdit
    Left = 8
    Top = 58
    Anchors = [akLeft, akTop, akRight]
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    TabOrder = 1
    Width = 356
  end
  object teEI: TcxTextEdit
    Left = 387
    Top = 58
    Anchors = [akTop, akRight]
    Properties.ReadOnly = True
    TabOrder = 2
    Width = 71
  end
  object seKol: TcxSpinEdit
    Left = 8
    Top = 104
    Properties.Alignment.Horz = taCenter
    Properties.AssignedValues.MinValue = True
    Properties.ImmediatePost = True
    Properties.SpinButtons.Position = sbpHorzLeftRight
    TabOrder = 3
    Width = 71
  end
  object deDate1: TcxDateEdit
    Left = 195
    Top = 104
    Anchors = [akTop, akRight]
    Properties.DateButtons = [btnToday]
    Properties.ImmediatePost = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 4
    Width = 121
  end
  object deDate2: TcxDateEdit
    Left = 337
    Top = 104
    Anchors = [akTop, akRight]
    Properties.DateButtons = [btnToday]
    Properties.ImmediatePost = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 5
    Width = 121
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 40
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel2: TcxLabel
    Left = 387
    Top = 40
    Anchors = [akTop, akRight]
    Caption = #1045#1076'. '#1080#1079#1084'.'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 86
    Caption = #1050#1086#1083'-'#1074#1086
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel4: TcxLabel
    Left = 195
    Top = 86
    Anchors = [akTop, akRight]
    Caption = #1053#1072#1095#1072#1083#1086' '#1089#1088#1086#1082#1072
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel5: TcxLabel
    Left = 337
    Top = 86
    Anchors = [akTop, akRight]
    Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1089#1088#1086#1082#1072
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 144
    Top = 16
    object acSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1080' '#1079#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acSaveExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' '#1073#1077#1079' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCancelExecute
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmUchGrEdit\'
    StoredValues = <>
    Left = 208
  end
  object odsMedic_EI: TOracleDataSet
    SQL.Strings = (
      'SELECT m.fc_name as fc_medic, ei.fc_name as fc_edizm'
      '  FROM med.tmedic m, med.tei ei'
      'where m.medicid = :FK_MEDIC_ID'
      '  and m.eiid = ei.eiid(+)')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A464B5F4D454449435F49440300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F5244455201000000000009000000464C
      5F4E4F54444F430100000000000A00000046435F53594E4F4E494D0100000000
      00}
    Session = dmMain.os
    Left = 272
    Top = 17
  end
  object odsTTreb_Quota: TOracleDataSet
    SQL.Strings = (
      
        'SELECT a.ROWID, a.* FROM med.TTreb_Quota a where a.FK_ID = :FK_I' +
        'D')
    Optimize = False
    Variables.Data = {0300000001000000060000003A464B5F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F5244455201000000000009000000464C
      5F4E4F54444F430100000000000A00000046435F53594E4F4E494D0100000000
      00}
    Session = dmMain.os
    Left = 344
    Top = 65528
  end
  object oqCreate: TOracleQuery
    SQL.Strings = (
      'insert into MED.TTREB_QUOTA'
      '(fk_medic_id, fn_kol, fd_date1, fd_date2, fk_mo_group_id)'
      'values'
      
        '(:fk_medic_id, :fn_kol, :fd_date1, :fd_date2, med.pkg_medses.get' +
        '_cur_mogroup()) returning FK_ID into :ID')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000050000000C0000003A464B5F4D454449435F49440300000000000000
      00000000070000003A464E5F4B4F4C040000000000000000000000090000003A
      46445F44415445310C0000000000000000000000090000003A46445F44415445
      320C0000000000000000000000030000003A4944030000000000000000000000}
    Left = 416
    Top = 65528
  end
end
