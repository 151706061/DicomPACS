object frmUchGrEdit_new: TfrmUchGrEdit_new
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1059#1095#1077#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
  ClientHeight = 238
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lcMain: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 341
    Height = 186
    Align = alClient
    TabOrder = 1
    TabStop = False
    object edtParentUchGr: TcxPopupEdit
      Left = 22
      Top = 142
      Properties.PopupControl = lcParentTreeList
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.TransparentBorder = True
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 2
      Width = 267
    end
    object btnParentClear: TcxButton
      Left = 295
      Top = 142
      Width = 20
      Height = 21
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' "'#1056#1086#1076#1080#1090#1077#1083#1100#1089#1082#1080#1081' '#1091#1079#1077#1083'"'
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnParentClearClick
      LookAndFeel.Kind = lfOffice11
      PopupAlignment = paCenter
    end
    object m_edName: TEdit
      Left = 24
      Top = 30
      Width = 289
      Height = 17
      BorderStyle = bsNone
      TabOrder = 0
    end
    object m_edQuotaCode: TEdit
      Left = 24
      Top = 87
      Width = 289
      Height = 17
      BorderStyle = bsNone
      MaxLength = 7
      TabOrder = 1
    end
    object lcMainGroup_Root: TdxLayoutGroup
      ShowCaption = False
      Hidden = True
      ShowBorder = False
      object lcgNameGroup: TdxLayoutGroup
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
        object lcim_edName: TdxLayoutItem
          Caption = 'm_edName'
          CaptionOptions.Layout = clTop
          ShowCaption = False
          Control = m_edName
        end
      end
      object lcgQuotaGroup: TdxLayoutGroup
        Caption = #1050#1086#1076' '#1082#1074#1086#1090#1099' (2-'#1072#1103' '#1087#1072#1088#1072' '#1094#1080#1092#1088'):'
        object lcim_edQuotaCode: TdxLayoutItem
          Caption = 'm_edQuotaCode'
          ShowCaption = False
          Control = m_edQuotaCode
        end
      end
      object lcgParentsGroup: TdxLayoutGroup
        Caption = #1056#1086#1076#1080#1090#1077#1083#1100#1089#1082#1080#1081' '#1091#1079#1077#1083':'
        LayoutDirection = ldHorizontal
        object lciedtParentUchGr: TdxLayoutItem
          Caption = 'edtParentUchGr'
          ShowCaption = False
          Control = edtParentUchGr
          ControlOptions.ShowBorder = False
        end
        object lcibtnParentClear: TdxLayoutItem
          Caption = 'btnParentClear'
          ShowCaption = False
          Control = btnParentClear
          ControlOptions.ShowBorder = False
        end
      end
    end
  end
  object lcBottom: TdxLayoutControl
    Left = 0
    Top = 186
    Width = 341
    Height = 52
    Align = alBottom
    Anchors = [akLeft, akRight]
    TabOrder = 2
    TabStop = False
    DesignSize = (
      341
      52)
    object m_btnOK: TButton
      Left = 10
      Top = 10
      Width = 57
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1050
      Default = True
      TabOrder = 0
      OnClick = m_btnOKClick
    end
    object m_btnCancel: TButton
      Left = 73
      Top = 10
      Width = 57
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      OnClick = m_btnCancelClick
    end
    object lcBottomGroup_Root: TdxLayoutGroup
      AutoAligns = [aaVertical]
      ShowCaption = False
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      object lcBottomItem1: TdxLayoutItem
        Caption = 'm_btnOK'
        ShowCaption = False
        Control = m_btnOK
        ControlOptions.ShowBorder = False
      end
      object lcBottomItem2: TdxLayoutItem
        Caption = 'm_btnCancel'
        ShowCaption = False
        Control = m_btnCancel
        ControlOptions.ShowBorder = False
      end
    end
  end
  object lcParentTreeList: TdxLayoutControl
    Left = 184
    Top = 180
    Width = 262
    Height = 249
    TabOrder = 0
    TabStop = False
    Visible = False
    object grdUchGrTreeList: TcxDBTreeList
      Left = 10
      Top = 10
      Width = 242
      Height = 199
      BorderStyle = cxcbsNone
      Align = alClient
      Bands = <
        item
        end>
      BufferedPaint = False
      DataController.DataSource = dsParentUchGr
      DataController.ParentField = 'PARENTID'
      DataController.KeyField = 'UCHGRID'
      LookAndFeel.Kind = lfUltraFlat
      OptionsBehavior.ExpandOnDblClick = False
      OptionsBehavior.MultiSort = False
      OptionsCustomizing.BandCustomizing = False
      OptionsCustomizing.BandHorzSizing = False
      OptionsCustomizing.ColumnHorzSizing = False
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsSelection.HideFocusRect = False
      OptionsSelection.InvertSelect = False
      OptionsView.ScrollBars = ssVertical
      OptionsView.Headers = False
      RootValue = 0
      TabOrder = 0
      OnDblClick = grdUchGrTreeListDblClick
      object grdUchGrTreeListFC_UCHGR: TcxDBTreeListColumn
        Caption.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_UCHGR'
        Width = 200
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object grdUchGrTreeListUCHGRID: TcxDBTreeListColumn
        Visible = False
        DataBinding.FieldName = 'UCHGRID'
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
    object btnSelect: TcxButton
      Left = 96
      Top = 209
      Width = 75
      Height = 25
      Align = alCustom
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 1
      OnClick = btnSelectClick
    end
    object btnCLoseList: TcxButton
      Left = 177
      Top = 209
      Width = 75
      Height = 25
      Align = alCustom
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 2
      OnClick = btnCLoseListClick
    end
    object lcParentTreeListGroup_Root: TdxLayoutGroup
      AutoAligns = [aaVertical]
      AlignHorz = ahClient
      ShowCaption = False
      Hidden = True
      ShowBorder = False
      UseIndent = False
      object lcParentTreeListItem3: TdxLayoutItem
        Caption = 'grdUchGrTreeList'
        ShowCaption = False
        Control = grdUchGrTreeList
        ControlOptions.ShowBorder = False
      end
      object lcParentTreeListGroup1: TdxLayoutGroup
        AutoAligns = [aaVertical]
        AlignHorz = ahRight
        ShowCaption = False
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        object lcParentTreeListItem4: TdxLayoutItem
          Caption = 'btnSelect'
          ShowCaption = False
          Control = btnSelect
          ControlOptions.ShowBorder = False
        end
        object lcParentTreeListItem5: TdxLayoutItem
          Caption = 'btnCLoseList'
          ShowCaption = False
          Control = btnCLoseList
          ControlOptions.ShowBorder = False
        end
      end
    end
  end
  object odsParentUchGr: TOracleDataSet
    SQL.Strings = (
      
        'SELECT ug.FC_UCHGR, ug.UCHGRID, ug.FL_MAT, ug.FK_PHARM, ug.FK_SK' +
        'LAD_ID, ug.fc_quota_code_2, ug.PARENTID,'
      '    --ug.*,'
      '    ug.rid as "rowid",'
      '    TUCHGRTYPE.FC_NAME AS FL_MAT'
      ''
      '  FROM med.V$TUCHGR ug, med.TUCHGRTYPE'
      '  WHERE UG.FL_MAT = TUCHGRTYPE.FK_ID (+)'
      
        '--   and ((med.PKG_MEDSES.get_IsUseSklad = 0)or(ug.fk_sklad_id i' +
        's null)or(ug.fk_sklad_id = med.PKG_MEDSES.get_cur_mo_sklad_id))'
      ''
      '  '
      '  ORDER BY UPPER(ug.FC_UCHGR)')
    Optimize = False
    Session = dmMain.os
    Left = 120
  end
  object dsParentUchGr: TDataSource
    DataSet = odsParentUchGr
    Left = 168
  end
end
