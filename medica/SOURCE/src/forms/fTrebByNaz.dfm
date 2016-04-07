object frmTrebByNaz: TfrmTrebByNaz
  Left = 154
  Top = 72
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103' '#1087#1086' '#1083#1080#1089#1090#1072#1084' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1081
  ClientHeight = 520
  ClientWidth = 787
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 360
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object paAll: TPanel
    Left = 0
    Top = 40
    Width = 787
    Height = 480
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 42
    ExplicitWidth = 928
    ExplicitHeight = 687
    object paCaption: TPanel
      Left = 0
      Top = 0
      Width = 787
      Height = 159
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      ExplicitWidth = 928
      object lcCaption: TdxLayoutControl
        Left = 2
        Top = 2
        Width = 783
        Height = 155
        Align = alClient
        TabOrder = 0
        TabStop = False
        ExplicitWidth = 924
        DesignSize = (
          783
          155)
        object mComment: TEdit
          Left = 95
          Top = 120
          Width = 538
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          BorderStyle = bsNone
          TabOrder = 7
        end
        object lcbFinSource: TDBLookupComboBox
          Left = 93
          Top = 91
          Width = 667
          Height = 21
          KeyField = 'FK_ID'
          ListField = 'FC_NAME'
          ListSource = dmMain.dsTFinSource
          TabOrder = 6
        end
        object lcbMO_GroupTo: TDBLookupComboBox
          Left = 93
          Top = 64
          Width = 404
          Height = 21
          KeyField = 'GROUPID'
          ListField = 'FC_GROUP'
          ListSource = dsMO_GroupTo
          TabOrder = 4
          OnCloseUp = lcbMO_GroupToCloseUp
        end
        object LCBTo: TDBLookupComboBox
          Left = 527
          Top = 64
          Width = 244
          Height = 21
          Anchors = [akTop, akRight]
          KeyField = 'MOID'
          ListField = 'FC_NAME'
          ListSource = dsNameTo
          TabOrder = 5
          OnClick = LCBToClick
          OnKeyPress = LCBToKeyPress
        end
        object lcbMO_GroupFrom: TDBLookupComboBox
          Left = 93
          Top = 37
          Width = 428
          Height = 21
          KeyField = 'GROUPID'
          ListField = 'FC_GROUP'
          ListSource = dsMO_GroupFrom
          TabOrder = 2
          OnCloseUp = lcbMO_GroupFromCloseUp
        end
        object lcbFrom: TDBLookupComboBox
          Left = 527
          Top = 37
          Width = 244
          Height = 21
          Anchors = [akTop, akRight]
          KeyField = 'MOID'
          ListField = 'FC_NAME'
          ListSource = dsNameFrom
          TabOrder = 3
          OnClick = lcbFromClick
        end
        object deNumTreb: TEdit
          Left = 95
          Top = 12
          Width = 507
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          BorderStyle = bsNone
          ReadOnly = True
          TabOrder = 0
        end
        object deRegisterDate: TcxDateEdit
          Left = 691
          Top = 10
          Anchors = [akTop, akRight]
          EditValue = 0d
          Properties.DateButtons = [btnToday]
          Properties.InputKind = ikMask
          Properties.ReadOnly = True
          Properties.ShowTime = False
          Properties.OnValidate = deRegisterDatePropertiesValidate
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          Style.ButtonStyle = bts3D
          Style.PopupBorderStyle = epbsFrame3D
          TabOrder = 1
          Width = 80
        end
        object lcCaptionGroup_Root: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          ShowBorder = False
          object lcCaptionGroupTreb: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcCaptionItem7: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#8470':'
              CaptionOptions.AlignHorz = taRightJustify
              Control = deNumTreb
            end
            object lcCaptionItem8: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahRight
              Caption = #1086#1090' '
              Control = deRegisterDate
              ControlOptions.ShowBorder = False
            end
          end
          object lcCaptionGroup1: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object lcCaptionGroupFrom: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcCaptionItem5: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1054#1090#1082#1091#1076#1072':'
                CaptionOptions.AlignHorz = taRightJustify
                Control = lcbMO_GroupFrom
                ControlOptions.ShowBorder = False
              end
              object lcCaptionItem6: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
                Caption = 'lcbFrom'
                ShowCaption = False
                Control = lcbFrom
                ControlOptions.ShowBorder = False
              end
            end
            object lcCaptionGroup2: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcCaptionItem3: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1050#1091#1076#1072':'
                CaptionOptions.AlignHorz = taRightJustify
                Control = lcbMO_GroupTo
                ControlOptions.ShowBorder = False
              end
              object lcCaptionItem4: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
                Caption = 'LCBTo'
                CaptionOptions.AlignHorz = taRightJustify
                ShowCaption = False
                Control = LCBTo
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcCaption_lcbFinSource: TdxLayoutItem
            Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089'.:'
            CaptionOptions.AlignHorz = taRightJustify
            Control = lcbFinSource
            ControlOptions.ShowBorder = False
          end
          object lcCaption_mComment: TdxLayoutItem
            Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
            CaptionOptions.AlignHorz = taRightJustify
            Control = mComment
          end
        end
      end
    end
    object paTreb: TPanel
      Left = 0
      Top = 159
      Width = 787
      Height = 321
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 928
      ExplicitHeight = 528
      object CoolBar2: TCoolBar
        Left = 2
        Top = 2
        Width = 783
        Height = 26
        AutoSize = True
        Bands = <
          item
            Control = tbTreb
            ImageIndex = -1
            MinHeight = 22
            Width = 779
          end>
        ExplicitWidth = 924
        object tbTreb: TToolBar
          Left = 9
          Top = 0
          Width = 770
          Height = 22
          AutoSize = True
          ButtonWidth = 103
          Images = dmMain.ilMain
          List = True
          ParentShowHint = False
          ShowCaptions = True
          ShowHint = True
          TabOrder = 0
          object ToolButton5: TToolButton
            Left = 0
            Top = 0
            Action = acInsDPC
          end
          object ToolButton6: TToolButton
            Left = 103
            Top = 0
            Action = acEditDPC
          end
          object ToolButton7: TToolButton
            Left = 206
            Top = 0
            Action = acDelDPC
          end
          object ToolButton8: TToolButton
            Left = 309
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 23
            Style = tbsSeparator
            Visible = False
          end
          object ToolButton9: TToolButton
            Left = 317
            Top = 0
            Action = acFormDPC
          end
        end
      end
      object grMedTreb: TcxGrid
        Left = 2
        Top = 28
        Width = 783
        Height = 291
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfUltraFlat
        ExplicitWidth = 924
        ExplicitHeight = 498
        object grMedTrebDBTableView1: TcxGridDBTableView
          OnDblClick = grMedTrebDblClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsMedTreb_Naz
          DataController.Filter.MaxValueListCount = 1000
          DataController.Filter.Active = True
          DataController.Filter.AutoDataSetFilter = True
          DataController.KeyFieldNames = 'FK_ID'
          DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Filtering.ColumnPopup.MaxDropDownItemCount = 12
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsView.ShowEditButtons = gsebForFocusedRecord
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          Preview.AutoHeight = False
          Preview.MaxLineCount = 2
          Styles.ContentEven = dmMain.cxStyleGridEvenRow
          Styles.ContentOdd = dmMain.cxStyleGridOddRow
          Styles.Selection = dmMain.cxStyleGridSelectedRow
          object grMedTrebDBTableView1ROWNUM1: TcxGridDBColumn
            Caption = #8470' '#1087'.'#1087'.'
            DataBinding.FieldName = 'ROWNUM'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Options.Editing = False
            VisibleForCustomization = False
            Width = 41
          end
          object grMedTrebDBTableView1FK_TREB: TcxGridDBColumn
            DataBinding.FieldName = 'FK_TREB'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
            Width = 61
          end
          object grMedTrebDBTableView1FK_NAZN_MEDIC_NAME: TcxGridDBColumn
            DataBinding.FieldName = 'FK_NAZN_MEDIC_NAME'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
            Width = 66
          end
          object grMedTrebDBTableView1FC_NAZN_MEDIC_NAME: TcxGridDBColumn
            Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1085#1099#1081' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090':'
            DataBinding.FieldName = 'FC_NAZN_MEDIC_NAME'
            Options.Editing = False
            Width = 168
          end
          object grMedTrebDBTableView1FN_NAZNKOL_F: TcxGridDBColumn
            Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1086':'
            DataBinding.FieldName = 'FN_NAZNKOL_F'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Options.Editing = False
            Width = 79
          end
          object grMedTrebDBTableView1FC_NAZN_EI: TcxGridDBColumn
            Caption = #1045#1076'. '#1080#1079#1084'. ('#1092#1072#1089'.)'
            DataBinding.FieldName = 'FC_NAZN_EI'
            PropertiesClassName = 'TcxTextEditProperties'
            Options.Editing = False
          end
          object grMedTrebDBTableView1FC_MEDIC: TcxGridDBColumn
            Caption = #1058#1088#1077#1073#1091#1077#1084#1099#1081' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090':'
            DataBinding.FieldName = 'FC_MEDIC'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = grMedTrebDBTableView1FC_MEDICPropertiesButtonClick
            Width = 207
          end
          object grMedTrebDBTableView1FN_TREBKOL: TcxGridDBColumn
            Caption = #1047#1072#1090#1088#1077#1073#1086#1074#1072#1085#1086':'
            DataBinding.FieldName = 'FN_KOL'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 9999999.000000000000000000
            Properties.ValueType = vtFloat
            Properties.OnEditValueChanged = grMedTrebDBTableView1FN_TREBKOL1PropertiesEditValueChanged
            Width = 93
          end
          object grMedTrebDBTableView1FC_EDIZM_U: TcxGridDBColumn
            Caption = #1045#1076'. '#1080#1079#1084'. ('#1091#1087')'
            DataBinding.FieldName = 'FC_EDIZM_U'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 1024
            Properties.ReadOnly = True
            Options.Editing = False
            Width = 80
          end
          object grMedTrebDBTableView1FK_NAZMEDLECHID: TcxGridDBColumn
            DataBinding.FieldName = 'FK_NAZMEDLECHID'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
            Width = 104
          end
          object grMedTrebDBTableView1FK_ID: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'FK_ID'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
            Options.Editing = False
            Width = 61
          end
        end
        object grMedTrebLevel1: TcxGridLevel
          GridView = grMedTrebDBTableView1
        end
      end
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 787
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 783
      end>
    ExplicitWidth = 928
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 774
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 60
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acSave
      end
      object ToolButton2: TToolButton
        Left = 60
        Top = 0
        Action = acCancel
      end
      object ToolButton3: TToolButton
        Left = 120
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 128
        Top = 0
        Action = acRefresh
      end
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmTrebByNaz\'
    StoredProps.Strings = (
      'grMedTrebDBTableView1FC_EDIZM_U.Width'
      'grMedTrebDBTableView1FC_EDIZM_U.Visible'
      'grMedTrebDBTableView1FC_MEDIC.Visible'
      'grMedTrebDBTableView1FC_MEDIC.Width'
      'grMedTrebDBTableView1FC_NAZN_EI.Visible'
      'grMedTrebDBTableView1FC_NAZN_EI.Width'
      'grMedTrebDBTableView1FC_NAZN_MEDIC_NAME.Visible'
      'grMedTrebDBTableView1FC_NAZN_MEDIC_NAME.Width'
      'grMedTrebDBTableView1FK_ID.Visible'
      'grMedTrebDBTableView1FK_ID.Width'
      'grMedTrebDBTableView1FK_NAZMEDLECHID.Visible'
      'grMedTrebDBTableView1FK_NAZMEDLECHID.Width'
      'grMedTrebDBTableView1FK_NAZN_MEDIC_NAME.Visible'
      'grMedTrebDBTableView1FK_NAZN_MEDIC_NAME.Width'
      'grMedTrebDBTableView1FK_TREB.Visible'
      'grMedTrebDBTableView1FK_TREB.Width'
      'grMedTrebDBTableView1FN_NAZNKOL_F.Visible'
      'grMedTrebDBTableView1FN_NAZNKOL_F.Width'
      'grMedTrebDBTableView1FN_TREBKOL.Visible'
      'grMedTrebDBTableView1FN_TREBKOL.Width'
      'grMedTrebDBTableView1ROWNUM1.Visible'
      'grMedTrebDBTableView1ROWNUM1.Width')
    StoredValues = <>
    Left = 578
    Top = 282
  end
  object al: TActionList
    Images = dmMain.ilMain
    OnUpdate = alUpdate
    Left = 368
    Top = 24
    object acSave: TAction
      Category = 'general'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1077
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acSaveExecute
    end
    object acCancel: TAction
      Category = 'general'
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCancelExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 15
      ShortCut = 116
      Visible = False
      OnExecute = acRefreshExecute
    end
    object acSecret: TAction
      Caption = 'acSecret'
      ShortCut = 49232
      OnExecute = acSecretExecute
    end
    object acInsDPC: TAction
      Category = 'Treb'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 21
      ShortCut = 115
      OnExecute = acInsDPCExecute
    end
    object acEditDPC: TAction
      Category = 'Treb'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 3
      ShortCut = 114
      OnExecute = acEditDPCExecute
    end
    object acDelDPC: TAction
      Category = 'Treb'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 22
      ShortCut = 46
      OnExecute = acDelDPCExecute
    end
    object acFormDPC: TAction
      Category = 'Treb'
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1083#1080#1089#1090#1072' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1081
      ImageIndex = 39
      ShortCut = 117
      Visible = False
      OnExecute = acFormDPCExecute
    end
  end
  object odsNameFrom: TOracleDataSet
    SQL.Strings = (
      'select TMO.*'
      '  from MED.TMO TMO'
      ' where TMO.FL_TREB = 0'
      '   and TMO.FL_DEL = 0'
      ' order by lower (FC_NAME)'
      '/*'
      'SELECT TMO.MOID,TMO.FC_NAME '
      'FROM MED.V$TMO TMO'
      'WHERE  TMO.FL_TREB = 0'
      'ORDER BY FC_NAME'
      '*/'
      ''
      '/*'
      
        'SELECT MOID,LPAD('#39' '#39',LEVEL*2,'#39' '#39')||FC_NAME AS FC_NAME,PKG_HIERAR' +
        'CHY.BRANCH(LEVEL,TRIM(FC_NAME),'#39'/'#39') FROM MED.V$TMO TMO'
      'START WITH MOID = MED.PKG_MEDSES.GET_CURMO'
      'CONNECT BY PRIOR MOID = FK_PARENT'
      'ORDER BY 3'
      '*/')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0400000002000000040000004D4F49440100000000000700000046435F4E414D
      45010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 242
    Top = 152
  end
  object dsNameFrom: TDataSource
    DataSet = odsNameFrom
    Left = 244
    Top = 200
  end
  object odsNameTo: TOracleDataSet
    SQL.Strings = (
      'select TMO.*'
      '  from MED.TMO TMO'
      ' where TMO.FL_TREB = 1'
      '   and TMO.FL_DEL = 0'
      ' order by lower (FC_NAME)'
      ''
      '/*'#1090#1088#1077#1073#1091#1077#1084' '#1091' '#1052#1054', '#1085#1072' '#1091#1088#1086#1074#1077#1085#1100' '#1074#1099#1096#1077
      'SELECT MOID, FC_NAME FROM MED.TMO M'
      'WHERE LEVEL = 2'
      'START WITH MOID = :MOID'
      'CONNECT BY MOID = PRIOR FK_PARENT */')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0400000002000000040000004D4F49440100000000000700000046435F4E414D
      45010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 136
    Top = 154
  end
  object dsNameTo: TDataSource
    DataSet = odsNameTo
    Left = 140
    Top = 204
  end
  object odsMedTreb_Naz: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '        ROWNUM,'
      '        D.ROWID,'
      '        -- '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1077
      '        D.FK_ID,'
      '        D.FK_TREBID AS FK_TREB,'
      '        D.FK_MEDICID,'
      '        M.FC_NAME AS FC_MEDIC,'
      '        D.FN_KOL, --'#1074' '#1091#1087#1072#1082#1086#1074#1086#1095#1085#1099#1093' '#1077#1076'. '#1080#1079#1084'.'
      '        E.FC_NAME AS FC_EDIZM_U,'
      '        E2.FC_NAME AS FC_EDIZM_F,'
      ''
      '        -- '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1077
      '        NML.FK_ID as FK_NAZMEDLECHID,'
      '        LATN.FC_NAME as FC_NAZN_MEDIC_NAME,'
      '        NML.fk_medicid as FK_NAZN_MEDIC_NAME,'
      
        '        F.FN_MNOG * N.FN_DURATION * NML.FN_KOL  AS FN_NAZNKOL_F,' +
        '  -- '#1092#1072#1089#1086#1074#1086#1095#1085#1086#1077' '#1082#1086#1083'-'#1074#1086' '#1085#1072#1079#1085#1072#1095#1077#1085#1085#1086#1075#1086' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072'      '
      '        mu.FC_SHORTNAME as FC_NAZN_EI,'
      '        NML.fk_dozunits as FK_NAZN_EI'
      ''
      
        '      FROM MED.TTREB_DPC D, TNAZMED N, ASU.TNAZMEDLECH NML, ASU.' +
        'TFREQUENCY F, MED.TLATIN_NAMES LATN , MED.TMEDIC M , MED.TEI E, ' +
        'MED.TEI E2, MED.TMassUnits MU'
      '      WHERE D.FK_TREBID = :FK_TREBID'
      '--        AND D.fk_id = NML.fk_treb_dpc(+)'
      '        AND NML.FK_ID = D.FK_NAZMEDLECH_ID(+)'
      '        AND NML.FK_NAZMEDID = N.FK_ID(+)'
      '        AND N.FK_FREQUENCYID = F.FK_ID(+)'
      '        AND NML.fk_medicid = LATN.FK_ID(+)'
      '        AND NML.fk_dozunits = mu.FK_ID(+)'
      '        AND D.FK_MEDICID = M.MEDICID(+)'
      '        AND M.EIID = E.EIID(+)'
      '        AND M.FK_FPACKID = E2.EIID(+)'
      ''
      '/*SELECT '
      '        ROWNUM,'
      '        D.ROWID,'
      '        D.FK_ID AS FK_ID,'
      '        D.FK_TREBID AS FK_TREB,'
      '        D.FK_MEDICID,'
      '        D.FK_NAZN_MEDIC_NAME,        '
      '        LATN.FC_NAME as FC_NAZN_MEDIC_NAME,  '
      '        M.FC_NAME AS FC_MEDIC,'
      '        D.FN_TREBKOL AS FN_TREBKOL, --'#1074' '#1091#1087#1072#1082#1086#1074#1086#1095#1085#1099#1093' '#1077#1076'. '#1080#1079#1084'.'
      '        D.FN_NAZNKOL_U AS FN_NAZNKOL_U,'
      '        E.FC_NAME AS FC_EDIZM_U,'
      '        E2.FC_NAME AS FC_EDIZM_F,'
      '        mu.FC_SHORTNAME as FC_NAZN_EI,'
      '        D.FK_NAZN_EI'
      
        '      FROM MED.TTREB_DPC_BYNAZ D, MED.TLATIN_NAMES LATN , (SELEC' +
        'T * FROM MED.TMEDIC WHERE FL_VISIBLE = 1) M , MED.TEI E, MED.TEI' +
        ' E2, MED.TMassUnits MU'
      '      WHERE D.FK_TREBID = :FK_TREBID'
      '        AND D.FK_NAZN_MEDIC_NAME = LATN.FK_ID(+)'
      '        AND D.FK_NAZN_EI = mu.FK_ID(+)'
      '        AND D.FK_MEDICID = M.MEDICID(+)'
      '        AND M.EIID = E.EIID(+)'
      '        AND M.FK_FPACKID = E2.EIID(+)'
      ''
      '*/')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A464B5F54524542494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000E00000006000000524F574E554D0100000000000A000000464B5F4D
      4544494349440100000000000800000046435F4D454449430100000000000700
      0000464B5F545245420100000000000A00000046435F4544495A4D5F55010000
      0000000A00000046435F4544495A4D5F460100000000001200000046435F4E41
      5A4E5F4D454449435F4E414D450100000000000A00000046435F4E415A4E5F45
      490100000000000C000000464E5F4E415A4E4B4F4C5F46010000000000120000
      00464B5F4E415A4E5F4D454449435F4E414D450100000000000A000000464B5F
      4E415A4E5F45490100000000000F000000464B5F4E415A4D45444C4543484944
      01000000000005000000464B5F494401000000000006000000464E5F4B4F4C01
      0000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    AfterOpen = odsMedTreb_NazAfterOpen
    AfterScroll = odsMedTrebAfterScroll
    Left = 400
    Top = 474
  end
  object dsMedTreb_Naz: TDataSource
    DataSet = odsMedTreb_Naz
    Left = 400
    Top = 524
  end
  object dsMO_GroupFrom: TDataSource
    DataSet = odsMO_GroupFrom
    Left = 588
    Top = 136
  end
  object odsMO_GroupFrom: TOracleDataSet
    SQL.Strings = (
      'SELECT gr.*'
      '  FROM   med.V$tmo_group gr'
      'where '
      '  gr.fl_del = 0'
      'ORDER BY LOWER(fc_group)'
      ''
      '/*'
      'SELECT groupid, gr.fc_group'
      '  FROM   med.tmo_group gr, med.TMO_IN_GROUP mgr'
      'where '
      '  mgr.fl_del = 0  and'
      '  gr.fl_del = 0  and  '
      '  mgr.fk_mo = :MOID AND'
      '  mgr.fk_group = gr.groupid'
      'ORDER BY LOWER(fc_group)'
      '*/')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000047524F555049440100000000000800000046435F
      47524F5550010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 514
    Top = 138
  end
  object odsMO_GroupTo: TOracleDataSet
    SQL.Strings = (
      'SELECT gr.*'
      '  FROM   med.V$tmo_group gr'
      'where '
      '  gr.fl_del = 0'
      'ORDER BY LOWER(fc_group)'
      ''
      '/*SELECT groupid, gr.fc_group'
      '  FROM med.TMO_IN_GROUP mgr,  med.tmo_group gr'
      'where '
      '  mgr.fl_del = 0  and'
      '  gr.fl_del = 0  and  '
      '  mgr.fk_mo = :MOID AND'
      '  mgr.fk_group = gr.groupid'
      'ORDER BY fc_group'
      '*/')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000047524F555049440100000000000800000046435F
      47524F5550010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 514
    Top = 192
  end
  object dsMO_GroupTo: TDataSource
    DataSet = odsMO_GroupTo
    Left = 594
    Top = 208
  end
  object odsGetMedicIdByNazMedicID: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM('
      'SELECT nvl (t.FK_MEDICID, -1 ) as fk_medic, t.FK_ID'
      '  FROM med.TLATIN_NAMES t'
      'where t.FK_ID = :FK_NAZMEDID '
      ''
      'UNION '
      ''
      'SELECT -1 as fk_medic, -1 as FK_ID FROM DUAL'
      ') ORDER BY FK_ID DESC')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A464B5F4E415A4D454449440300000000000000
      00000000}
    Session = dmMain.os
    Left = 228
    Top = 448
  end
  object oqSaveMedicLink: TOracleQuery
    SQL.Strings = (
      'DECLARE nTmp NUMBER;'
      'begin'
      '  SELECT COUNT(1) into  nTmp'
      '    FROM med.tmedic_intern_name a'
      
        '  where a.fk_intern_name = :FK_NAZMEDID AND a.FK_MEDIC = :FK_MED' +
        'IC_ID;'
      ''
      
        '  IF (nTmp <= 0)AND(NVL(:FK_NAZMEDID,-1) >= 0)AND(NVL(:FK_MEDIC_' +
        'ID,-1) >= 0) THEN'
      
        '    INSERT INTO med.tmedic_intern_name (fk_intern_name, FK_MEDIC' +
        ') '
      
        '                                 VALUES(:FK_NAZMEDID, :FK_MEDIC_' +
        'ID);'
      '--    COMMIT;'
      ''
      '  END IF;'
      ' '
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000020000000C0000003A464B5F4D454449435F49440300000000000000
      000000000C0000003A464B5F4E415A4D45444944030000000000000000000000}
    Left = 160
    Top = 392
  end
end
