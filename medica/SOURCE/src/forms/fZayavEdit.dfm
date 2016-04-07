object frmZayavEdit: TfrmZayavEdit
  Left = 283
  Top = 191
  BorderIcons = [biSystemMenu]
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1079#1072#1103#1074#1082#1080
  ClientHeight = 388
  ClientWidth = 572
  Color = clBtnFace
  Constraints.MinHeight = 330
  Constraints.MinWidth = 580
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'StMedsestra.chm'
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 104
    Top = 204
    Width = 29
    Height = 13
    Caption = #1050#1086#1084#1091':'
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 572
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 40
        Width = 568
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 559
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 60
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ShowCaptions = True
      TabOrder = 0
      object btnSave: TToolButton
        Left = 0
        Top = 0
        Action = actSave
        ParentShowHint = False
        ShowHint = True
      end
      object btnCancel: TToolButton
        Left = 60
        Top = 0
        Action = acesc
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 44
    Width = 572
    Height = 119
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      572
      119)
    object Label2: TLabel
      Left = 320
      Top = 9
      Width = 96
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080':'
    end
    object Label3: TLabel
      Left = 5
      Top = 40
      Width = 105
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082' ('#1072#1087#1090#1077#1082#1072'):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 37
      Top = 89
      Width = 73
      Height = 13
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    end
    object lbInvoice: TLabel
      Left = 51
      Top = 9
      Width = 60
      Height = 13
      Caption = #1047#1072#1103#1074#1082#1072' '#8470
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbFrom: TLabel
      Left = 208
      Top = 9
      Width = 14
      Height = 13
      Caption = #1086#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 59
      Top = 66
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = #1057#1086#1089#1090#1072#1074#1080#1083':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edZayavNum: TEdit
      Left = 118
      Top = 6
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object mComment: TEdit
      Left = 118
      Top = 86
      Width = 191
      Height = 21
      TabOrder = 1
    end
    object deInvoiceDate: TcxDateEdit
      Left = 223
      Top = 6
      Hint = #1044#1072#1090#1072' '#1079#1072#1103#1074#1082#1080' ('#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1087#1088#1080' '#1087#1077#1095#1072#1090#1080' '#1086#1090#1095#1077#1090#1072')'
      EditValue = 0d
      ParentShowHint = False
      Properties.DateButtons = [btnNow, btnToday]
      Properties.InputKind = ikMask
      Properties.ShowTime = False
      ShowHint = True
      Style.BorderStyle = ebs3D
      TabOrder = 2
      Width = 85
    end
    object deRegistrDate: TcxDateEdit
      Left = 420
      Top = 4
      Hint = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1103#1074#1082#1080
      EditValue = 0d
      ParentShowHint = False
      Properties.DateButtons = [btnNow, btnToday]
      Properties.ImmediatePost = True
      Properties.InputKind = ikMask
      Properties.Kind = ckDateTime
      Properties.PostPopupValueOnTab = True
      ShowHint = True
      Style.BorderStyle = ebs3D
      TabOrder = 3
      Width = 145
    end
    object cxGroupBox1: TcxGroupBox
      Left = 321
      Top = 31
      Alignment = alTopCenter
      Caption = ' '#1044#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100' '
      Style.BorderStyle = ebs3D
      TabOrder = 4
      DesignSize = (
        245
        77)
      Height = 77
      Width = 245
      object Label1: TLabel
        Left = 11
        Top = 48
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = #8470' '#1076#1086#1074'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 138
        Top = 48
        Width = 11
        Height = 13
        Alignment = taRightJustify
        Caption = #1086#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 5
        Top = 21
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = #1053#1072' '#1082#1086#1075#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edDov_Num: TEdit
        Left = 51
        Top = 44
        Width = 71
        Height = 21
        TabOrder = 0
      end
      object deDov_Date: TcxDateEdit
        Left = 153
        Top = 44
        Properties.DateButtons = [btnToday]
        Properties.DateOnError = deToday
        Properties.ImmediatePost = True
        Properties.InputKind = ikMask
        Properties.PostPopupValueOnTab = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.BorderStyle = ebs3D
        TabOrder = 1
        Width = 82
      end
      object LCB_MO_GET: TcxLookupComboBox
        Left = 51
        Top = 17
        Anchors = [akLeft, akTop, akRight]
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'MOID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dmMain.dsMO
        Properties.PostPopupValueOnTab = True
        EditValue = 0
        Style.BorderStyle = ebs3D
        Style.Color = clWindow
        Style.HotTrack = True
        TabOrder = 2
        Width = 184
      end
    end
    object lcbPostav: TcxLookupComboBox
      Left = 118
      Top = 36
      Anchors = [akLeft, akTop, akRight]
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'POSTAVID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dmMain.dsPostav
      Properties.PostPopupValueOnTab = True
      EditValue = 0
      Style.BorderStyle = ebs3D
      Style.Color = clWindow
      Style.HotTrack = True
      TabOrder = 5
      Width = 191
    end
    object lcb_MO_SOST: TcxLookupComboBox
      Left = 118
      Top = 61
      Anchors = [akLeft, akTop, akRight]
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'MOID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dmMain.dsMO
      Properties.PostPopupValueOnTab = True
      EditValue = 0
      Style.BorderStyle = ebs3D
      Style.Color = clWindow
      Style.HotTrack = True
      TabOrder = 6
      Width = 191
    end
  end
  object CoolBar2: TCoolBar
    Left = 0
    Top = 163
    Width = 572
    Height = 28
    AutoSize = True
    Bands = <
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 26
        Width = 568
      end>
    EdgeBorders = [ebLeft, ebTop, ebRight]
    object ToolBar2: TToolBar
      Left = 9
      Top = 0
      Width = 559
      Height = 26
      AutoSize = True
      BorderWidth = 1
      ButtonWidth = 104
      Caption = 'ToolBar2'
      Images = dmMain.ilMain
      List = True
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object btnAdd: TToolButton
        Left = 0
        Top = 0
        Action = actAdd
        ParentShowHint = False
        ShowHint = True
      end
      object btnEdit: TToolButton
        Left = 104
        Top = 0
        Action = acedit
        ParentShowHint = False
        ShowHint = True
      end
      object btnDel: TToolButton
        Left = 208
        Top = 0
        Action = actDelete
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 191
    Width = 572
    Height = 197
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object grZayav_DPC: TcxGrid
      Left = 0
      Top = 0
      Width = 572
      Height = 197
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object grZayav_DPCDBTableView1: TcxGridDBTableView
        OnDblClick = aceditExecute
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsZayav_DPC
        DataController.KeyFieldNames = 'FK_ZAYAVKA_DPC_ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.AlwaysShowEditor = True
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnSorting = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = dmMain.cxStyleGridEvenRow
        Styles.ContentOdd = dmMain.cxStyleGridOddRow
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        object grZayav_DPCDBTableView1_FC_MEDIC: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_MEDIC_NAME'
          Options.Editing = False
          Options.Filtering = False
          Options.Grouping = False
          VisibleForCustomization = False
          Width = 265
        end
        object grZayav_DPCDBTableView1_FC_EDIZM: TcxGridDBColumn
          Caption = #1045#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'FC_EI_NAME'
          Options.Editing = False
          Options.Filtering = False
          Options.Grouping = False
          VisibleForCustomization = False
          Width = 48
        end
        object grZayav_DPCDBTableView1_FN_KOL: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086
          DataBinding.FieldName = 'FN_KOL'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.AssignedValues.MinValue = True
          Properties.ImmediatePost = True
          Properties.MaxValue = 999999999.000000000000000000
          Properties.ValueType = vtFloat
          Options.Filtering = False
          Options.Grouping = False
          VisibleForCustomization = False
          Width = 101
        end
        object grZayav_DPCDBTableView1FK_MEDIC: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
          DataBinding.FieldName = 'FK_MEDIC'
          Visible = False
          Options.Editing = False
        end
        object grZayav_DPCDBTableView1FK_ZAYAVKA: TcxGridDBColumn
          DataBinding.FieldName = 'FK_ZAYAVKA'
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
        end
        object grZayav_DPCDBTableView1FK_ZAYAVKA_DPC_ID: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1087#1086#1079#1080#1094#1080#1080' '#1079#1072#1103#1074#1082#1080
          DataBinding.FieldName = 'FK_ZAYAVKA_DPC_ID'
          Visible = False
          Options.Editing = False
        end
      end
      object grZayav_DPCLevel1: TcxGridLevel
        GridView = grZayav_DPCDBTableView1
      end
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    OnUpdate = alUpdate
    Left = 424
    Top = 24
    object actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 9
      ShortCut = 113
      OnExecute = actSaveExecute
    end
    object acesc: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 8
      ShortCut = 32883
      OnExecute = acescExecute
    end
    object actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091
      ImageIndex = 21
      ShortCut = 115
      OnExecute = actAddExecute
    end
    object acedit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091
      ImageIndex = 3
      ShortCut = 114
      OnExecute = aceditExecute
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091
      ImageIndex = 22
      ShortCut = 119
      OnExecute = actDeleteExecute
    end
    object acrefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = acrefreshExecute
    end
  end
  object odsZayav_DPC: TOracleDataSet
    SQL.Strings = (
      
        'select z.ROWID, z.*, m.fc_name as FC_MEDIC_NAME, ei.fc_name as F' +
        'C_EI_NAME'
      'from'
      'med.tzayavka_dpc z, med.tmedic m, med.tei ei'
      'where z.fk_medic = m.medicid(+)'
      '  and m.eiid = ei.eiid(+)'
      '  and z.fk_zayavka = :fk_zayavka'
      'order by UPPER(m.fc_name)')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A464B5F5A415941564B41030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000006000000464E5F4B4F4C01000000000006000000524F574E
      554D01000000000011000000464B5F5A415941564B415F4450435F4944010000
      00000008000000464B5F4D454449430100000000000A000000464B5F5A415941
      564B410100000000000D00000046435F4D454449435F4E414D45010000000000
      0A00000046435F45495F4E414D45010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    CommitOnPost = False
    Session = dmMain.os
    AfterOpen = odsZayav_DPCAfterOpen
    AfterRefresh = odsZayav_DPCAfterOpen
    Left = 110
    Top = 290
  end
  object dsZayav_DPC: TDataSource
    DataSet = odsZayav_DPC
    Left = 28
    Top = 288
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmZayavEdit\'
    StoredProps.Strings = (
      'grZayav_DPCDBTableView1_FC_EDIZM.Visible'
      'grZayav_DPCDBTableView1_FC_EDIZM.Width'
      'grZayav_DPCDBTableView1_FC_MEDIC.Visible'
      'grZayav_DPCDBTableView1_FC_MEDIC.Width'
      'grZayav_DPCDBTableView1_FN_KOL.Visible'
      'grZayav_DPCDBTableView1_FN_KOL.Width'
      'grZayav_DPCDBTableView1FK_MEDIC.Visible'
      'grZayav_DPCDBTableView1FK_MEDIC.Width'
      'grZayav_DPCDBTableView1FK_ZAYAVKA.Visible'
      'grZayav_DPCDBTableView1FK_ZAYAVKA.Width'
      'grZayav_DPCDBTableView1FK_ZAYAVKA_DPC_ID.Visible'
      'grZayav_DPCDBTableView1FK_ZAYAVKA_DPC_ID.Width')
    StoredValues = <>
    Left = 416
    Top = 308
  end
  object odsZayavka: TOracleDataSet
    SQL.Strings = (
      'select z.*'
      'from med.tzayavka z'
      ' WHERE z.fk_zayavid = :fk_zayavid'
      ''
      ''
      'order by z.FD_CREATE desc'
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A464B5F5A415941564944030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000F0000000A00000046435F434F4D4D454E540100000000000A000000
      46445F494E564F4943450100000000000A000000464B5F5A4159415649440100
      000000000C00000046435F5A415941565F4E554D010000000000090000004644
      5F4352454154450100000000000C000000464B5F4D4F5F435245415445010000
      0000000C00000046435F444F5645525F4E554D01000000000009000000464B5F
      4D4F5F4745540100000000000B000000464B5F4D4F5F5A415941560100000000
      000B000000464B5F504F5354415649440100000000000D00000046445F444F56
      45525F444154450100000000000D00000046435F4D4F5F435245415445440100
      000000000B00000046435F4D4F5F5A415941560100000000000900000046435F
      4D4F5F4745540100000000000900000046435F504F53544156010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 174
    Top = 42
  end
  object oqSetZayavka: TOracleQuery
    SQL.Strings = (
      'begin'
      '  :fk_zayavid := med.PKG_ZAYAV.DO_SET_ZAYAV(:fk_zayavid,'
      '                                            :fc_zayav_num,'
      '                                            :fd_create ,'
      '                                            :fd_invoice,'
      '                                            :fc_dover_num, '
      '                                            :fk_mo_get , '
      '                                            :fk_mo_zayav,'
      '                                            :fk_postavid, '
      '                                            :fd_dover_date,'
      '                                            :fc_comment);'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      030000000A0000000B0000003A464B5F5A415941564944030000000000000000
      0000000D0000003A46435F5A415941565F4E554D050000000000000000000000
      0A0000003A46445F4352454154450C00000000000000000000000B0000003A46
      445F494E564F4943450C00000000000000000000000D0000003A46435F444F56
      45525F4E554D0500000000000000000000000A0000003A464B5F4D4F5F474554
      0300000000000000000000000C0000003A464B5F4D4F5F5A4159415603000000
      00000000000000000C0000003A464B5F504F5354415649440300000000000000
      000000000E0000003A46445F444F5645525F444154450C000000000000000000
      00000B0000003A46435F434F4D4D454E54050000000000000000000000}
    Left = 398
    Top = 172
  end
  object oqSetZayavka_DPC: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '  :fk_zayavka_dpc_id := med.PKG_ZAYAV.DO_SET_ZAYAV_DPC(:fk_zayav' +
        'ka,'
      
        '                                                       :fk_zayav' +
        'ka_dpc_id,'
      
        '                                                       :fk_medic' +
        ','
      '                                                       :fn_kol);'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000004000000120000003A464B5F5A415941564B415F4450435F49440300
      000000000000000000000B0000003A464B5F5A415941564B4103000000000000
      0000000000090000003A464B5F4D454449430300000000000000000000000700
      00003A464E5F4B4F4C040000000000000000000000}
    Left = 102
    Top = 174
  end
  object oqDelZayavka_DPC: TOracleQuery
    SQL.Strings = (
      'begin'
      '  med.PKG_ZAYAV.DO_DEL_ZAYAV_DPC(:fk_zayavka_dpc_id);'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000001000000120000003A464B5F5A415941564B415F4450435F49440300
      00000000000000000000}
    Left = 264
    Top = 180
  end
end
