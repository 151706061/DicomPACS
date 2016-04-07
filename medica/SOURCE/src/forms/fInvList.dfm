object frmInvList: TfrmInvList
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1086#1085#1085#1099#1093' '#1086#1087#1080#1089#1077#1081
  ClientHeight = 519
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object clbMain: TCoolBar
    Left = 0
    Top = 0
    Width = 792
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = tlbMain
        ImageIndex = -1
        MinHeight = 36
        Width = 790
      end>
    EdgeBorders = [ebTop, ebBottom]
    ParentShowHint = False
    ShowHint = True
    object tlbMain: TToolBar
      Left = 9
      Top = 0
      Width = 783
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 62
      Caption = 'tlbMain'
      Images = dmMain.ilMain
      ShowCaptions = True
      TabOrder = 0
      object btnAdd: TToolButton
        Left = 0
        Top = 0
        Action = acAdd
      end
      object btnEdit: TToolButton
        Left = 62
        Top = 0
        Action = acEdit
      end
      object btnDel: TToolButton
        Left = 124
        Top = 0
        Action = acDel
      end
      object sepSign: TToolButton
        Left = 186
        Top = 0
        Width = 8
        Caption = 'sepSign'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 194
        Top = 0
        Action = acSign
      end
      object sepRefresh: TToolButton
        Left = 256
        Top = 0
        Width = 8
        Caption = 'sepRefresh'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object btnRefresh: TToolButton
        Left = 264
        Top = 0
        Action = acRefresh
      end
      object sepPrint: TToolButton
        Left = 326
        Top = 0
        Width = 8
        Caption = 'sepPrint'
        ImageIndex = 33
        Style = tbsSeparator
      end
      object btnPrint: TToolButton
        Left = 334
        Top = 0
        Action = acPrint
      end
      object sepClose: TToolButton
        Left = 396
        Top = 0
        Width = 8
        Caption = 'sepClose'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object btnClose: TToolButton
        Left = 404
        Top = 0
        Action = acClose
      end
    end
  end
  object grdInventoryList: TcxGrid
    Left = 0
    Top = 40
    Width = 792
    Height = 479
    Align = alClient
    TabOrder = 1
    object grdInventoryListDBTV1: TcxGridDBTableView
      OnDblClick = grdInventoryListDBTV1DblClick
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsInventoryList
      DataController.KeyFieldNames = 'INVLISTID'
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = '<'#1053#1077#1090' '#1076#1072#1085#1085#1099#1093'>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.HeaderEndEllipsis = True
      OptionsView.Indicator = True
      object grdInventoryListDBTV1INVLISTID: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'INVLISTID'
        Visible = False
      end
      object grdInventoryListDBTV1MATOTVID_OWNER: TcxGridDBColumn
        DataBinding.FieldName = 'MATOTVID_OWNER'
        Visible = False
        VisibleForCustomization = False
      end
      object grdInventoryListDBTV1MATOTVID: TcxGridDBColumn
        DataBinding.FieldName = 'MATOTVID'
        Visible = False
        VisibleForCustomization = False
      end
      object grdInventoryListDBTV1FC_DOCNUM: TcxGridDBColumn
        Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'FC_DOCNUM'
        Width = 77
      end
      object grdInventoryListDBTV1FN_TYPE: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'FN_TYPE'
        Visible = False
        VisibleForCustomization = False
      end
      object grdInventoryListDBTV1FC_INVTYPE: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'FC_INVTYPE'
        Width = 33
      end
      object grdInventoryListDBTV1FD_DATA1: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080#1080
        DataBinding.FieldName = 'FD_DATA1'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 50
      end
      object grdInventoryListDBTV1FD_DATA2: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080
        DataBinding.FieldName = 'FD_DATA2'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 52
      end
      object grdInventoryListDBTV1FC_PREDS: TcxGridDBColumn
        Caption = #1055#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1100' '#1082#1086#1084#1080#1089#1089#1080#1080
        DataBinding.FieldName = 'FC_PREDS'
        Visible = False
        Width = 51
      end
      object grdInventoryListDBTV1FD_DT_BEG: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1086#1090#1095#1077#1090'. '#1087#1077#1088#1080#1086#1076#1072
        DataBinding.FieldName = 'FD_DT_BEG'
        PropertiesClassName = 'TcxDateEditProperties'
        Visible = False
        Width = 51
      end
      object grdInventoryListDBTV1FD_DT_END: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1086#1090#1095#1077#1090'. '#1087#1077#1088#1080#1086#1076#1072
        DataBinding.FieldName = 'FD_DT_END'
        PropertiesClassName = 'TcxDateEditProperties'
        Visible = False
        Width = 51
      end
      object grdInventoryListDBTV1FC_NMB_PRIKAZ: TcxGridDBColumn
        Caption = #8470' '#1087#1088#1080#1082#1072#1079#1072
        DataBinding.FieldName = 'FC_NMB_PRIKAZ'
        Width = 51
      end
      object grdInventoryListDBTV1FD_DAT_PRIKAZ: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072
        DataBinding.FieldName = 'FD_DAT_PRIKAZ'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 52
      end
      object grdInventoryListDBTV1FK_FINSOURCE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_FINSOURCE_ID'
        Visible = False
        VisibleForCustomization = False
      end
      object grdInventoryListDBTV1FC_MOGR: TcxGridDBColumn
        Caption = #1055#1086' '#1075#1088#1091#1087#1087#1077' '#1052#1054
        DataBinding.FieldName = 'FC_MOGR'
        Width = 51
      end
      object grdInventoryListDBTV1FC_MO_OWNER: TcxGridDBColumn
        Caption = #1040#1074#1090#1086#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'FC_MO_OWNER'
        Width = 51
      end
      object grdInventoryListDBTV1FC_FINSOURCE: TcxGridDBColumn
        Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085'-'#1103
        DataBinding.FieldName = 'FC_FINSOURCE'
        Width = 51
      end
      object grdInventoryListDBTV1FL_EDIT: TcxGridDBColumn
        DataBinding.FieldName = 'FL_EDIT'
        Visible = False
        VisibleForCustomization = False
      end
      object grdInventoryListDBTV1FC_EDIT: TcxGridDBColumn
        Caption = #1055#1086#1076#1087#1080#1089#1072#1085
        DataBinding.FieldName = 'FC_EDIT'
        Width = 20
      end
      object grdInventoryListDBTV1FC_SIGNED_BY: TcxGridDBColumn
        Caption = #1050#1077#1084' '#1087#1086#1076#1087#1080#1089#1072#1085
        DataBinding.FieldName = 'FC_SIGNED_BY'
        Visible = False
      end
      object grdInventoryListDBTV1FD_SIGNED: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1080
        DataBinding.FieldName = 'FD_SIGNED'
        PropertiesClassName = 'TcxDateEditProperties'
        Visible = False
        Width = 40
      end
    end
    object grdInventoryListLvl1: TcxGridLevel
      GridView = grdInventoryListDBTV1
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    OnUpdate = alUpdate
    Left = 618
    Top = 50
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 15
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 21
      OnExecute = acAddExecute
    end
    object acEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 3
      ShortCut = 13
      OnExecute = acEditExecute
    end
    object acDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 22
      OnExecute = acDelExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 1
      ShortCut = 27
      OnExecute = acCloseExecute
    end
    object acSign: TAction
      Caption = #1055#1086#1076#1087#1080#1089#1072#1090#1100
      ImageIndex = 47
      OnExecute = acSignExecute
    end
    object acPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 32
      ShortCut = 16464
      OnExecute = acPrintExecute
    end
  end
  object odsInventoryList: TOracleDataSet
    SQL.Strings = (
      'select il.rowid,'
      '--       il.*,'
      '       il.INVLISTID , '
      '       il.MATOTVID_OWNER, '
      '       il.MATOTVID, '
      '       il.FC_DOCNUM, '
      '       il.FD_DATA1, '
      '       il.FD_DATA2, '
      '       il.FC_PREDS, '
      '       il.FC_CHLEN1, '
      '       il.FC_CHLEN2, '
      '       il.FC_CHLEN3, '
      '       il.FN_TYPE, '
      '       il.FD_DT_BEG, '
      '       il.FD_DT_END, '
      '       il.FD_DAT_PRIKAZ, '
      '       il.FC_NMB_PRIKAZ, '
      '       il.FK_FINSOURCE_ID, '
      '       il.FL_EDIT, '
      '       il.FK_SIGNED_BY_MO, '
      '       il.FD_SIGNED, '
      '       il.FD_CREATE,'
      '       med.PKG_INVOPIS.GET_INVTYPENAME(il.FN_TYPE) FC_INVTYPE,'
      '       mo.FC_NAME as FC_MO_OWNER,'
      '       mg.FC_GROUP as FC_MOGR,'
      '       fs.FC_NAME as FC_FINSOURCE,'
      '       decode (il.FL_EDIT, 0, '#39#1044#1072#39', 1, '#39#1053#1077#1090#39') FC_EDIT,'
      '       ms.FC_NAME FC_SIGNED_BY'
      '  from MED.TINVLIST il'
      ' inner join ( select mig.FK_GROUP'
      '                from med.TMO mo'
      '               inner join med.TMO_IN_GROUP mig'
      '                  on mo.MOID = mig.FK_MO               '
      '               where mo.FK_SOTRID = :pFK_SOTRID'
      '                 and mo.FL_DEL = 0'
      '                 and mig.FL_DEL = 0'
      '               group by mig.FK_GROUP ) gr'
      '    on il.MATOTVID = gr.FK_GROUP               '
      '  left join med.TMO mo'
      '    on il.MATOTVID_OWNER = mo.MOID'
      '  left join med.TMO_GROUP mg'
      '    on il.MATOTVID = mg.GROUPID'
      '  left join med.TFINSOURCE fs'
      '    on il.FK_FINSOURCE_ID = fs.FK_ID'
      '  left join med.TMO ms'
      '    on il.FK_SIGNED_BY_MO = ms.MOID'
      ' order by il.FD_DATA1, il.FD_DATA2, il.INVLISTID'
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F534F54524944030000000400000001
      00000000000000}
    CountAllRecords = True
    RefreshOptions = [roBeforeEdit, roAfterUpdate, roAllFields]
    CommitOnPost = False
    Session = dmMain.os
    Left = 714
    Top = 50
  end
  object dsInventoryList: TDataSource
    DataSet = odsInventoryList
    Left = 650
    Top = 50
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = '%FORM_NAME%\'
    StoredProps.Strings = (
      'grdInventoryListDBTV1FC_DOCNUM.Visible'
      'grdInventoryListDBTV1FC_DOCNUM.Width'
      'grdInventoryListDBTV1FC_FINSOURCE.Visible'
      'grdInventoryListDBTV1FC_FINSOURCE.Width'
      'grdInventoryListDBTV1FC_MO_OWNER.Visible'
      'grdInventoryListDBTV1FC_MO_OWNER.Width'
      'grdInventoryListDBTV1FC_MOGR.Visible'
      'grdInventoryListDBTV1FC_MOGR.Width'
      'grdInventoryListDBTV1FC_NMB_PRIKAZ.Visible'
      'grdInventoryListDBTV1FC_NMB_PRIKAZ.Width'
      'grdInventoryListDBTV1FC_PREDS.Visible'
      'grdInventoryListDBTV1FC_PREDS.Width'
      'grdInventoryListDBTV1FD_DAT_PRIKAZ.Visible'
      'grdInventoryListDBTV1FD_DAT_PRIKAZ.Width'
      'grdInventoryListDBTV1FD_DATA1.Visible'
      'grdInventoryListDBTV1FD_DATA1.Width'
      'grdInventoryListDBTV1FD_DATA2.Visible'
      'grdInventoryListDBTV1FD_DATA2.Width'
      'grdInventoryListDBTV1FD_DT_BEG.Visible'
      'grdInventoryListDBTV1FD_DT_BEG.Width'
      'grdInventoryListDBTV1FD_DT_END.Visible'
      'grdInventoryListDBTV1FD_DT_END.Width'
      'grdInventoryListDBTV1INVLISTID.Visible'
      'grdInventoryListDBTV1INVLISTID.Width'
      'grdInventoryListDBTV1FC_INVTYPE.Visible'
      'grdInventoryListDBTV1FC_INVTYPE.Width'
      'grdInventoryListDBTV1FC_EDIT.Visible'
      'grdInventoryListDBTV1FC_EDIT.Width'
      'grdInventoryListDBTV1FC_SIGNED_BY.Visible'
      'grdInventoryListDBTV1FC_SIGNED_BY.Width'
      'grdInventoryListDBTV1FD_SIGNED.Visible'
      'grdInventoryListDBTV1FD_SIGNED.Width')
    StoredValues = <>
    Left = 682
    Top = 50
  end
end
