object frmNaznList: TfrmNaznList
  Left = 0
  Top = 0
  Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1103' '#1076#1083#1103' '#1075#1088#1091#1087#1087#1099' '#1052#1054
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 635
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 629
      end>
    ParentShowHint = False
    ShowHint = True
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 622
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 57
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1077
        Action = acSelect
      end
      object ToolButton2: TToolButton
        Left = 57
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 31
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 65
        Top = 0
        Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
        Action = acRefresh
      end
      object ToolButton4: TToolButton
        Left = 122
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object pnChoosePeriod: TPanel
        Left = 130
        Top = 0
        Width = 147
        Height = 36
        Hint = #1059#1082#1072#1079#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object abuSetDocPeriod: TJvArrowButton
          Left = 133
          Top = 0
          Width = 14
          Height = 36
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076' '#1080#1079' '#1089#1087#1080#1089#1082#1072
          Align = alRight
          ArrowWidth = 15
          DropDown = pmDocsFilterPeriod
          Flat = True
          FillFont.Charset = DEFAULT_CHARSET
          FillFont.Color = clWindowText
          FillFont.Height = -11
          FillFont.Name = 'MS Sans Serif'
          FillFont.Style = []
          Layout = blGlyphRight
          ExplicitLeft = 167
          ExplicitTop = -2
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 129
          Height = 36
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object dedDate1: TcxDateEdit
            Left = 53
            Top = 0
            Hint = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
            EditValue = 0d
            Enabled = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DateButtons = [btnToday]
            Properties.InputKind = ikMask
            Properties.PostPopupValueOnTab = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnEditValueChanged = dedDate1PropertiesEditValueChanged
            Properties.OnValidate = dedDate1PropertiesValidate
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            OnKeyDown = dedDate1KeyDown
            Width = 79
          end
          object dedDate2: TcxDateEdit
            Left = 53
            Top = 16
            Hint = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
            EditValue = 0d
            Enabled = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DateButtons = [btnToday]
            Properties.InputKind = ikMask
            Properties.PostPopupValueOnTab = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnEditValueChanged = dedDate1PropertiesEditValueChanged
            Properties.OnValidate = dedDate1PropertiesValidate
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 3
            OnKeyDown = dedDate1KeyDown
            Width = 79
          end
          object chbDate1: TcxCheckBox
            Left = 6
            Top = 0
            Caption = 'C'
            ParentColor = False
            Properties.Alignment = taRightJustify
            Style.Color = clBtnFace
            TabOrder = 0
            OnClick = chbDate1Click
            Width = 41
          end
          object chbDate2: TcxCheckBox
            Left = 0
            Top = 16
            Caption = #1055#1086
            ParentColor = False
            Properties.Alignment = taRightJustify
            Style.Color = clBtnFace
            TabOrder = 2
            OnClick = chbDate2Click
            Width = 47
          end
        end
      end
    end
  end
  object grNaznList: TcxGrid
    Left = 0
    Top = 40
    Width = 635
    Height = 260
    Align = alClient
    DragMode = dmAutomatic
    TabOrder = 1
    object grNaznListDBTableView1: TcxGridDBTableView
      Tag = 1
      DragMode = dmAutomatic
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Visible = True
      NavigatorButtons.PriorPage.Visible = True
      NavigatorButtons.Prior.Visible = True
      NavigatorButtons.Next.Visible = True
      NavigatorButtons.NextPage.Visible = True
      NavigatorButtons.Last.Visible = True
      NavigatorButtons.Insert.Visible = True
      NavigatorButtons.Delete.Visible = True
      NavigatorButtons.Edit.Visible = True
      NavigatorButtons.Post.Visible = True
      NavigatorButtons.Cancel.Visible = True
      NavigatorButtons.Refresh.Visible = True
      NavigatorButtons.SaveBookmark.Visible = True
      NavigatorButtons.GotoBookmark.Visible = True
      NavigatorButtons.Filter.Visible = True
      OnCellDblClick = grNaznListDBTableView1CellDblClick
      DataController.DataSource = dsNaznList
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.ColumnAutoWidth = True
      object grNaznListDBTableView1FK_NAZMEDID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_NAZMEDID'
        Visible = False
        VisibleForCustomization = False
      end
      object grNaznListDBTableView1FK_NAZMEDLECHID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_NAZMEDLECHID'
        Visible = False
        VisibleForCustomization = False
      end
      object grNaznListDBTableView1FK_PACID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_PACID'
        Visible = False
        VisibleForCustomization = False
      end
      object grNaznListDBTableView1FC_NAZNSOTR: TcxGridDBColumn
        Caption = #1053#1072#1079#1085#1072#1095#1080#1083
        DataBinding.FieldName = 'FC_NAZNSOTR'
      end
      object grNaznListDBTableView1FC_PACFIO: TcxGridDBColumn
        Caption = #1055#1072#1094#1080#1077#1085#1090
        DataBinding.FieldName = 'FC_PACFIO'
      end
      object grNaznListDBTableView1FC_ROOM: TcxGridDBColumn
        Caption = #1055#1072#1083#1072#1090#1072
        DataBinding.FieldName = 'FC_ROOM'
        Width = 40
      end
      object grNaznListDBTableView1FC_OTDELENIE: TcxGridDBColumn
        Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1077
        DataBinding.FieldName = 'FC_OTDELENIE'
        Visible = False
      end
      object grNaznListDBTableView1FD_BEGIN: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1082#1091#1088#1089#1072
        DataBinding.FieldName = 'FD_BEGIN'
      end
      object grNaznListDBTableView1FC_NAZMEDLECH: TcxGridDBColumn
        Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077
        DataBinding.FieldName = 'FC_NAZMEDLECH'
      end
      object grNaznListDBTableView1FK_NAZN_MEDICID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_NAZN_MEDICID'
        Visible = False
        VisibleForCustomization = False
      end
      object grNaznListDBTableView1FC_NAZ_MEDIC: TcxGridDBColumn
        Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1085#1099#1081' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090
        DataBinding.FieldName = 'FC_NAZ_MEDIC'
      end
      object grNaznListDBTableView1FN_COURSEKOL: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086' '#1085#1072' '#1074#1077#1089#1100' '#1082#1091#1088#1089' '#1083#1077#1095#1077#1085#1080#1103
        DataBinding.FieldName = 'FN_COURSEKOL'
      end
      object grNaznListDBTableView1FN_DAY_DOZE: TcxGridDBColumn
        Caption = #1057#1091#1090#1086#1095#1085#1072#1103' '#1076#1086#1079#1072
        DataBinding.FieldName = 'FN_DAY_DOZE'
        Width = 40
      end
      object grNaznListDBTableView1FC_ED_IZM: TcxGridDBColumn
        Caption = #1045#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_ED_IZM'
        Width = 40
      end
      object grNaznListDBTableView1FK_NAZNSOTRID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_NAZNSOTRID'
        Visible = False
        VisibleForCustomization = False
      end
      object grNaznListDBTableView1FK_STATE: TcxGridDBColumn
        DataBinding.FieldName = 'FK_STATE'
        Visible = False
        VisibleForCustomization = False
      end
      object grNaznListDBTableView1FC_STATUS: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1091#1089' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
        DataBinding.FieldName = 'FC_STATUS'
      end
      object grNaznListDBTableView1FK_MEDICID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_MEDICID'
        Visible = False
        VisibleForCustomization = False
      end
      object grNaznListDBTableView1FN_ZATR_KOL: TcxGridDBColumn
        Caption = #1059#1078#1077' '#1079#1072#1090#1088#1077#1073#1086#1074#1072#1085#1085#1086#1077' '#1082#1086#1083'-'#1074#1086
        DataBinding.FieldName = 'FN_ZATR_KOL'
        Visible = False
      end
      object grNaznListDBTableView1FC_ZATR_EI: TcxGridDBColumn
        Caption = #1059#1087'. '#1077#1076'. '#1080#1079#1084'. '#1079#1072#1090#1088#1077#1073#1086#1074#1072#1085#1085#1086#1075#1086
        DataBinding.FieldName = 'FC_ZATR_EI'
        Visible = False
      end
      object grNaznListDBTableView1FN_OTP_KOL: TcxGridDBColumn
        Caption = #1054#1090#1087#1091#1097#1077#1085#1086' '#1074' '#1091#1087'.'#1077#1076'.'#1080#1079#1084'.'
        DataBinding.FieldName = 'FN_OTP_KOL'
        Visible = False
        Width = 40
      end
      object grNaznListDBTableView1FC_OTP_EI: TcxGridDBColumn
        Caption = #1059#1087'.'#1077#1076'.'#1080#1079#1084
        DataBinding.FieldName = 'FC_OTP_EI'
        Visible = False
        Width = 40
      end
      object grNaznListDBTableView1FN_OTP_FAS_KOL: TcxGridDBColumn
        Caption = #1054#1090#1087#1091#1097#1077#1085#1086' '#1074' '#1092#1072#1089'.'#1077#1076'.'#1080#1079#1084'.'
        DataBinding.FieldName = 'FN_OTP_FAS_KOL'
        Visible = False
        Width = 40
      end
      object grNaznListDBTableView1FC_OTP_FAS_EI: TcxGridDBColumn
        Caption = #1060#1072#1089'.'#1077#1076'.'#1080#1079#1084'.'
        DataBinding.FieldName = 'FC_OTP_FAS_EI'
        Visible = False
        Width = 40
      end
    end
    object grNaznListLevel1: TcxGridLevel
      GridView = grNaznListDBTableView1
    end
  end
  object dsNaznList: TDataSource
    DataSet = odsNaznList
    Left = 222
    Top = 208
  end
  object odsNaznList: TOracleDataSet
    SQL.Strings = (
      
        'select N.FK_ID as FK_NAZMEDID, --'#1050#1054#1044' '#1053#1040#1047#1053#1040#1063#1045#1053#1048#1071' ('#1047#1040#1056#1054#1042#1053#1045#1053#1054' '#1055#1054' '#1057#1048 +
        #1050#1042#1045#1053#1057#1059' '#1057' VNAZ)'
      '       L.FK_ID as FK_NAZMEDLECHID,'
      '       N.FK_PACID as FK_PACID,'
      '       ASU.GET_PACFIO(N.FK_PACID) as FC_PACFIO,'
      
        '       ASU.PKG_REGIST_PACFUNC.GET_PAC_FCPALATA(N.FK_PACID) FC_RO' +
        'OM, --'#1055#1040#1051#1040#1058#1040
      
        '       ASU.PKG_REGIST_PACFUNC.GET_PAC_FCOTDEL(N.FK_PACID) FC_OTD' +
        'ELENIE, --'#1054#1058#1044#1045#1051#1045#1053#1048#1045
      '       TRUNC(N.FD_CREATE) as FD_CREATE, --'#1044#1040#1058#1040
      '       N.FD_BEGIN, -- '#1044#1072#1090#1072'  '#1085#1072#1095#1072#1083#1072' '#1082#1091#1088#1089#1072
      '       L.FK_MEDICID as FK_NAZN_MEDICID,'
      '       LATN.FK_MEDICID,'
      '       LATN.FC_NAME as FC_NAZ_MEDIC,'
      
        '       F.FN_MNOG * N.FN_DURATION * L.FN_KOL as FN_COURSEKOL, -- ' +
        #1050#1054#1051'-'#1042#1054' '#1079#1072' '#1082#1091#1088#1089' ('#1092#1072#1089#1086#1074#1086#1095#1085#1099#1077' '#1077#1076'. '#1080#1079#1084'.)'
      
        '       F.FN_MNOG * L.FN_KOL as FN_DAY_DOZE, -- '#1089#1091#1090#1086#1095#1085#1072#1103' '#1076#1086#1079#1072' ('#1092#1072 +
        #1089'.'#1077#1076'.'#1080#1079#1084')       '
      '       MU.FC_SHORTNAME as FC_ED_IZM,            '
      '       N.FK_VRACHID as FK_NAZNSOTRID, --'#1050#1054#1044' '#1053#1040#1047#1053#1040#1063#1048#1042#1064#1045#1043#1054
      
        '       ASU.GET_SOTRNAME(N.FK_VRACHID) as FC_NAZNSOTR, --'#1053#1040#1047#1053#1040#1063#1048#1042 +
        #1064#1048#1049
      '       N.FK_STATE,'
      '       ASU.PKG_COMMON.DECODE_STATUS(N.FK_STATE) as FC_STATUS,'
      '       COALESCE(TD.FN_KOL, 0) as FN_ZATR_KOL,'
      '       TD.FC_EI as FC_ZATR_EI,'
      
        '       ASU.PKG_MEDICNAZN.GET_NAZ_FULLNAME(L.FK_ID, 1, 0, 1) as F' +
        'C_NAZMEDLECH,'
      '       OTP.FN_KOL as FN_OTP_KOL,'
      '       OTP.FN_FAS_KOL as FN_OTP_FAS_KOL,'
      '       ei.FC_NAME as FC_OTP_EI,'
      '       fas_ei.FC_NAME as FC_OTP_FAS_EI'
      '  from ASU.TNAZMED N'
      ' inner join ASU.TNAZMEDLECH L'
      '    on N.FK_ID = L.FK_NAZMEDID'
      '  left join ASU.TFREQUENCY F'
      '    on N.FK_FREQUENCYID = F.FK_ID'
      '  left join MED.TLATIN_NAMES LATN'
      '    on L.FK_MEDICID = LATN.FK_ID'
      '  left join MED.TMASSUNITS MU'
      '    on L.FK_KOLUNITS = MU.FK_ID'
      '  left join (select TD.FK_NAZMEDLECH_ID,'
      '                    sum(TD.FN_KOL) as FN_KOL,'
      '                    max(EI.FC_NAME) as FC_EI'
      '               from MED.TTREB_DPC TD'
      '              inner join MED.TMEDIC M'
      '                 on TD.FK_MEDICID = M.MEDICID'
      '              inner join MED.TEI EI'
      '                 on M.EIID = EI.EIID'
      '              where TD.FK_NAZMEDLECH_ID > 0'
      '              group by TD.FK_NAZMEDLECH_ID) TD'
      '    on L.FK_ID = TD.FK_NAZMEDLECH_ID'
      '  left join ( select dpc.FK_NAZMEDLECH_ID,'
      '                     sum ( dpc.FN_KOL ) as FN_KOL,'
      
        '                     sum ( dpc.FN_KOL * m.fn_fpackinupack ) as F' +
        'N_FAS_KOL,'
      '                     max ( m.EIID ) as EIID,'
      '                     max ( m.FK_FPACKID ) as FAS_EIID'
      '                from med.tdpc dpc'
      '               inner join med.TKART k'
      '                  on dpc.KARTID  = k.KARTID'
      '               inner join med.tmedic m'
      '                  on k.MEDICID = m.MEDICID               '
      '               where dpc.FK_NAZMEDLECH_ID > 0'
      
        '               group by dpc.FK_NAZMEDLECH_ID ) OTP -- '#1086#1090#1087#1091#1097#1077#1085#1086' '#1087 +
        #1086' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1102
      '    on L.FK_ID = OTP.FK_NAZMEDLECH_ID                 '
      '  left join med.TEI ei'
      '    on otp.EIID = ei.EIID'
      '  left join med.TEI fas_ei'
      '    on otp.FAS_EIID = fas_ei.EIID'
      ' where N.FK_STATE <> ASU.GET_VIPNAZ'
      '   and N.FK_STATE <> ASU.GET_NAZCANCEL'
      '   and (N.FK_MOID = :PMOID or :PMOID = -1) -- '#1087#1086' '#1075#1088#1091#1087#1087#1077' '#1052#1054
      '   and (N.FK_PACID = :PPACID or :PPACID = -1) -- '#1087#1086' '#1087#1072#1094#1080#1077#1085#1090#1091
      '   and ((TRUNC(N.FD_BEGIN) >= TRUNC(:PDATEFROM)) or'
      '       (:PFILTERED_BY_DATEFROM = 0))'
      '   and ((TRUNC(N.FD_BEGIN) <= TRUNC(:PDATETO)) or'
      '       (:PFILTERED_BY_DATETO = 0)) -- '#1079#1072' '#1087#1077#1088#1080#1086#1076' '
      ' order by FC_PACFIO, FC_NAZNSOTR')
    Optimize = False
    Variables.Data = {
      03000000060000000A0000003A504441544546524F4D0C000000000000000000
      0000160000003A5046494C54455245445F42595F4441544546524F4D03000000
      040000000000000000000000080000003A5044415445544F0C00000000000000
      00000000140000003A5046494C54455245445F42595F44415445544F03000000
      040000000000000000000000060000003A504D4F494403000000000000000000
      0000070000003A505041434944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000F00000008000000464B5F5041434944010000000000090000004643
      5F50414346494F0100000000000700000046435F524F4F4D0100000000000C00
      000046435F4F5444454C454E49450100000000000900000046445F4352454154
      450100000000000D000000464B5F4E415A4E534F545249440100000000000B00
      000046435F4E415A4E534F54520100000000000900000046435F535441545553
      01000000000008000000464B5F53544154450100000000000B000000464B5F4E
      415A4D454449440100000000000F000000464B5F4E415A4D45444C4543484944
      0100000000000A000000464B5F4D4544494349440100000000000C000000464E
      5F434F555253454B4F4C0100000000000900000046435F45445F495A4D010000
      0000000C00000046435F4E415A5F4D45444943010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 294
    Top = 208
  end
  object al: TActionList
    Images = dmMain.ilMain
    OnUpdate = alUpdate
    Left = 272
    Top = 112
    object acSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 30
      ShortCut = 13
      OnExecute = acSelectExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 15
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
  end
  object pmDocsFilterPeriod: TPopupMenu
    Left = 286
    Top = 40
    object N19: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = N19Click
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N20: TMenuItem
      Tag = 5
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1076#1077#1085#1100
      OnClick = N19Click
    end
    object N18: TMenuItem
      Tag = 4
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
      OnClick = N19Click
    end
    object N16: TMenuItem
      Tag = 2
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1075#1086#1076
      OnClick = N19Click
    end
    object N21: TMenuItem
      Caption = '-'
    end
    object N17: TMenuItem
      Tag = 3
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1084#1077#1089#1103#1094
      OnClick = N19Click
    end
    object N15: TMenuItem
      Tag = 1
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1075#1086#1076
      OnClick = N19Click
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = '%FORM_NAME%\'
    StoredProps.Strings = (
      'chbDate1.Checked'
      'chbDate2.Checked'
      'dedDate1.Date'
      'dedDate2.Date'
      'grNaznListDBTableView1FC_ED_IZM.Visible'
      'grNaznListDBTableView1FC_ED_IZM.Width'
      'grNaznListDBTableView1FC_NAZ_MEDIC.Visible'
      'grNaznListDBTableView1FC_NAZ_MEDIC.Width'
      'grNaznListDBTableView1FC_OTDELENIE.Visible'
      'grNaznListDBTableView1FC_OTDELENIE.Width'
      'grNaznListDBTableView1FC_PACFIO.Visible'
      'grNaznListDBTableView1FC_PACFIO.Width'
      'grNaznListDBTableView1FC_ROOM.Visible'
      'grNaznListDBTableView1FC_ROOM.Width'
      'grNaznListDBTableView1FC_STATUS.Visible'
      'grNaznListDBTableView1FC_STATUS.Width'
      'grNaznListDBTableView1FD_BEGIN.Visible'
      'grNaznListDBTableView1FD_BEGIN.Width'
      'grNaznListDBTableView1FN_COURSEKOL.Visible'
      'grNaznListDBTableView1FN_COURSEKOL.Width'
      'grNaznListDBTableView1FC_NAZNSOTR.Visible'
      'grNaznListDBTableView1FC_NAZNSOTR.Width'
      'grNaznListDBTableView1FN_ZATR_KOL.Width'
      'grNaznListDBTableView1FN_ZATR_KOL.Visible'
      'grNaznListDBTableView1FC_ZATR_EI.Width'
      'grNaznListDBTableView1FC_ZATR_EI.Visible'
      'grNaznListDBTableView1FC_NAZMEDLECH.Width'
      'grNaznListDBTableView1FC_NAZMEDLECH.Visible'
      'grNaznListDBTableView1FN_DAY_DOZE.Visible'
      'grNaznListDBTableView1FN_DAY_DOZE.Width'
      'grNaznListDBTableView1FN_OTP_FAS_KOL.Visible'
      'grNaznListDBTableView1FN_OTP_FAS_KOL.Width'
      'grNaznListDBTableView1FN_OTP_KOL.Visible'
      'grNaznListDBTableView1FN_OTP_KOL.Width'
      'grNaznListDBTableView1FC_OTP_EI.Visible'
      'grNaznListDBTableView1FC_OTP_EI.Width'
      'grNaznListDBTableView1FC_OTP_FAS_EI.Visible'
      'grNaznListDBTableView1FC_OTP_FAS_EI.Width')
    StoredValues = <>
    Left = 368
    Top = 136
  end
end
