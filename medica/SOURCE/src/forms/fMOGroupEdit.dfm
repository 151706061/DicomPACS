object frmMOGroupEdit: TfrmMOGroupEdit
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1052#1054
  ClientHeight = 188
  ClientWidth = 388
  Color = clBtnFace
  Constraints.MaxHeight = 300
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 200
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grdMOGroupEdit: TcxDBVerticalGrid
    Left = 0
    Top = 40
    Width = 388
    Height = 148
    Align = alClient
    LookAndFeel.Kind = lfUltraFlat
    OptionsView.RowHeaderWidth = 159
    TabOrder = 0
    DataController.DataSource = dsMOGroupEdit
    object grdMOGroupEditDBEditorGROUPID: TcxDBEditorRow
      Properties.Caption = #1050#1086#1076' '#1075#1088#1091#1087#1087#1099
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.Alignment.Horz = taLeftJustify
      Properties.EditProperties.ReadOnly = True
      Properties.DataBinding.FieldName = 'GROUPID'
      Properties.Options.Editing = False
      Properties.Options.ShowEditButtons = eisbNever
    end
    object grdMOGroupEditDBEditorFC_GROUP: TcxDBEditorRow
      Properties.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.EditProperties.MaxLength = 100
      Properties.DataBinding.FieldName = 'FC_GROUP'
    end
    object grdMOGroupEditDBEditorFK_SKLAD_ID: TcxDBEditorRow
      Properties.Caption = #1057#1082#1083#1072#1076
      Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.EditProperties.ClearKey = 46
      Properties.EditProperties.KeyFieldNames = 'FK_ID'
      Properties.EditProperties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.EditProperties.ListOptions.CaseInsensitive = True
      Properties.EditProperties.ListOptions.ShowHeader = False
      Properties.EditProperties.ListSource = dmMain.dsSklad
      Properties.DataBinding.FieldName = 'FK_SKLAD_ID'
      Properties.Options.ShowEditButtons = eisbAlways
    end
    object grdMOGroupEditDBEditorFC_QUOTA_CODE_1: TcxDBEditorRow
      Properties.Caption = #1050#1086#1076' '#1082#1074#1086#1090#1099' (1-'#1072#1103' '#1087#1072#1088#1072' '#1094#1080#1092#1088')'
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.EditProperties.MaxLength = 2
      Properties.DataBinding.FieldName = 'FC_QUOTA_CODE_1'
    end
    object grdMOGroupEditDBEditorFL_POST: TcxDBEditorRow
      Properties.Caption = #1055#1086#1089#1090
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.EditProperties.NullStyle = nssUnchecked
      Properties.EditProperties.ValueChecked = 1
      Properties.EditProperties.ValueUnchecked = 0
      Properties.DataBinding.FieldName = 'FL_POST'
    end
    object grdMOGroupEditDBEditorlFC_PARENT: TcxDBEditorRow
      Properties.Caption = #1056#1086#1076#1080#1090#1077#1083#1100#1089#1082#1080#1081' '#1091#1079#1077#1083
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1088#1086#1076#1080#1090#1077#1083#1100#1089#1082#1080#1081' '#1091#1079#1077#1083
          Kind = bkEllipsis
        end
        item
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
            FEFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6D0D0D0CACACACACACACACACACACACACA
            CACACACACACACACACACACACACACACBCBCBD2D2D2E8E8E8FFFFFFEBEBF82828CD
            9393DCF6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F7F7
            F7E5E5F2FFFFFFFFFFFFFFFFFF5A5AD22020E06E6ED6FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFCFCFE5858D42121D88080DAFFFFFFFFFFFFFFFFFF
            5A5AD32222E54C4CD1F8F8FDFFFFFFFFFFFFFFFFFFFFFFFFF2F2FA3F3FD11111
            D80505D02626D6F7F7FCFFFFFFFFFFFFFFFFFF5C5CD22121E53838D1E8E8F7FF
            FFFFFFFFFFDCDCF33232D30C0CD50909D42828D5BBBBE9FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF5E5ED31D1DE22A2AD4CACAEEBDBDEA2929D70808D30E0ED73636
            D1E3E3F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5FD21A1ADD24
            24D92121D90505D01616D94F4FD1F8F8FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF3A3ACA0C0CD70202CE1D1DDA7A7AD8FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7373D61919D904
            04D00F0FD82929D5F2F2FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF6E6ED51919D90303CE2323D93838CC1818DF4949D1FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6666D41717D90202CD1F1FDAA0
            A0E2F3F3FB3131D11D1DE09090DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            6060D31616D90101CD1B1BDA8888DCFFFFFFFFFFFFDBDBF32626D92424D8DDDD
            F4FFFFFFFFFFFFFFFFFFFFFFFFABABE31A1ADC0000CC1717DA7171D7FFFFFFFF
            FFFFFFFFFFFFFFFF6A6AD41818E13939D1FDFDFEFFFFFFFFFFFFFFFFFFFAFAFD
            5757D31B1BDB5B5BD2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7F23737D31F1F
            E27D7DDAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECEEEFEFEFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFEFEFF9797DFC0C0EBFFFFFFFFFFFF}
          Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077
          Kind = bkGlyph
        end>
      Properties.EditProperties.OnButtonClick = grdMOGroupEditDBEditorlFC_PARENTEditPropertiesButtonClick
      Properties.DataBinding.FieldName = 'lFC_PARENT'
      Properties.Options.ShowEditButtons = eisbAlways
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 388
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 382
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 375
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
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acRefresh
      end
      object ToolButton2: TToolButton
        Left = 62
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 70
        Top = 0
        Action = acSave
      end
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    OnUpdate = alUpdate
    Left = 152
    Top = 48
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 15
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
    object acSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 9
      ShortCut = 16467
      OnExecute = acSaveExecute
    end
  end
  object odsMOGroupEdit: TOracleDataSet
    SQL.Strings = (
      'select g.ROWID, '
      '       g.GROUPID,'
      '       g.FC_GROUP,'
      '       g.FL_DEL,'
      '       g.FK_SKLAD_ID,'
      '       g.FC_QUOTA_CODE_1,'
      '       g.FL_POST,'
      '       g.FK_PARENTID'
      '  from MED.tmo_group g'
      ' where g.GROUPID = :pGROUPID')
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A5047524F555049440300000000000000000000
      00}
    SequenceField.Field = 'GROUPID'
    SequenceField.Sequence = 'SEQ_TMO_GROUP'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000080000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C0100000000000B00000046
      4B5F534B4C41445F49440100000000000F00000046435F51554F54415F434F44
      455F3101000000000007000000464C5F504F53540100000000000B000000464B
      5F504152454E5449440100000000000F00000046435F504152454E545F47524F
      5550010000000000}
    UniqueFields = 'GROUPID'
    RefreshOptions = [roAfterUpdate, roAllFields]
    UpdatingTable = 'MED.TMO_GROUP'
    CommitOnPost = False
    Session = dmMain.os
    BeforePost = odsMOGroupEditBeforePost
    Left = 80
    Top = 48
    object odsMOGroupEditGROUPID: TFloatField
      FieldName = 'GROUPID'
      Required = True
    end
    object odsMOGroupEditFC_GROUP: TStringField
      FieldName = 'FC_GROUP'
      Size = 100
    end
    object odsMOGroupEditFL_DEL: TFloatField
      FieldName = 'FL_DEL'
    end
    object odsMOGroupEditFK_SKLAD_ID: TFloatField
      FieldName = 'FK_SKLAD_ID'
    end
    object odsMOGroupEditFC_QUOTA_CODE_1: TStringField
      FieldName = 'FC_QUOTA_CODE_1'
      Size = 2
    end
    object odsMOGroupEditFL_POST: TFloatField
      FieldName = 'FL_POST'
    end
    object odsMOGroupEditFK_PARENTID: TFloatField
      FieldName = 'FK_PARENTID'
    end
    object odsMOGroupEditlFC_PARENT: TStringField
      FieldKind = fkLookup
      FieldName = 'lFC_PARENT'
      LookupDataSet = odsMOGRoups
      LookupKeyFields = 'GROUPID'
      LookupResultField = 'FC_GROUP'
      KeyFields = 'FK_PARENTID'
      Size = 100
      Lookup = True
    end
  end
  object dsMOGroupEdit: TDataSource
    DataSet = odsMOGroupEdit
    Left = 80
    Top = 80
  end
  object odsMOGRoups: TOracleDataSet
    SQL.Strings = (
      'select g.* from MED.tmo_group g'
      'where g.fl_del=0')
    Optimize = False
    Session = dmMain.os
    Left = 112
    Top = 48
  end
  object dsMOGRoups: TDataSource
    DataSet = odsMOGRoups
    Left = 120
    Top = 80
  end
  object oqSetQUOTA_MOGr: TOracleQuery
    SQL.Strings = (
      'begin  '
      '  select count(1) into :fn_tkart_mogr from med.tkart k'
      '  where SubStr(k.FC_QUOTA_CODE, 1, 2) = :FC_OLD_QUOTA_MOGR;'
      ''
      '  update med.tkart k'
      
        '  set k.FC_QUOTA_CODE = :FC_NEW_QUOTA_MOGR||SubStr(k.FC_QUOTA_CO' +
        'DE, 3)'
      '  where SubStr(k.FC_QUOTA_CODE, 1, 2) = :FC_OLD_QUOTA_MOGR;'
      ''
      '--  commit;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000030000000E0000003A464E5F544B4152545F4D4F4752030000000000
      000000000000120000003A46435F4F4C445F51554F54415F4D4F475205000000
      0000000000000000120000003A46435F4E45575F51554F54415F4D4F47520500
      00000000000000000000}
    Left = 192
    Top = 48
  end
end
