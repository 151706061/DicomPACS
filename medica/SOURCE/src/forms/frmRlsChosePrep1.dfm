inherited frameRlsChosePrep1: TframeRlsChosePrep1
  Width = 724
  Height = 302
  ExplicitWidth = 724
  ExplicitHeight = 302
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 464
    Height = 302
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 464
      Height = 66
      Align = alTop
      TabOrder = 0
      DesignSize = (
        464
        66)
      object edFilter: TEdit
        Left = 8
        Top = 39
        Width = 448
        Height = 21
        Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' (Enter)'
        Anchors = [akLeft, akTop, akRight]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object rgFilter: TRadioGroup
        Left = 8
        Top = 2
        Width = 448
        Height = 32
        Anchors = [akLeft, akTop, akRight]
        Caption = #1060#1080#1083#1100#1090#1088':'
        Columns = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #1058#1086#1088#1075#1086#1074#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' (F5)'
          #1051#1072#1090#1080#1085#1089#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' (F6)'
          #1050#1086#1076' EAN (F7)')
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 66
      Width = 464
      Height = 236
      Align = alClient
      TabOrder = 1
      object grRlsPreps: TcxGrid
        Left = 1
        Top = 1
        Width = 462
        Height = 234
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        object grRlsPrepsDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsRlsPreps
          DataController.Filter.MaxValueListCount = 1000
          DataController.Filter.Active = True
          DataController.KeyFieldNames = 'FK_ID'
          DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #1050#1086#1083'-'#1074#1086': 0'
              Kind = skCount
              FieldName = 'FK_ID'
              Column = grRlsPrepsDBTableView1FC_PREP
            end>
          DataController.Summary.SummaryGroups = <>
          Filtering.ColumnPopup.MaxDropDownItemCount = 12
          OptionsBehavior.CellHints = True
          OptionsBehavior.ImmediateEditor = False
          OptionsBehavior.IncSearch = True
          OptionsData.Editing = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          Preview.AutoHeight = False
          Preview.MaxLineCount = 2
          Styles.ContentEven = dmMain.cxStyleGridEvenRow
          Styles.ContentOdd = dmMain.cxStyleGridOddRow
          Styles.Selection = dmMain.cxStyleGridSelectedRow
          object grRlsPrepsDBTableView1FK_ID: TcxGridDBColumn
            Caption = #1050#1086#1076
            DataBinding.FieldName = 'FK_ID'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.MaxLength = 0
            Properties.ReadOnly = True
            Visible = False
          end
          object grRlsPrepsDBTableView1FC_PREP: TcxGridDBColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1072
            DataBinding.FieldName = 'FC_PREP'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 300
            Properties.ReadOnly = True
            SortIndex = 0
            SortOrder = soAscending
            Width = 300
          end
          object grRlsPrepsDBTableView1FC_EANCODE: TcxGridDBColumn
            Caption = #1050#1086#1076' EAN'
            DataBinding.FieldName = 'FC_EANCODE'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 13
            Properties.ReadOnly = True
            Visible = False
          end
          object grRlsPrepsDBTableView1FC_TRADENAME: TcxGridDBColumn
            Caption = #1058#1086#1088#1075#1086#1074#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_TRADENAME'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 260
            Properties.ReadOnly = True
            Visible = False
            Width = 200
          end
          object grRlsPrepsDBTableView1FC_LATINNAME: TcxGridDBColumn
            Caption = #1051#1072#1090#1080#1085#1089#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_LATINNAME'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.MaxLength = 150
            Properties.ReadOnly = True
            Visible = False
            Width = 200
          end
        end
        object grRlsPrepsLevel1: TcxGridLevel
          GridView = grRlsPrepsDBTableView1
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 464
    Top = 0
    Width = 260
    Height = 302
    Align = alClient
    TabOrder = 1
    DesignSize = (
      260
      302)
    object Splitter1: TSplitter
      Left = 1
      Top = 1
      Height = 300
    end
    object gbDescription: TGroupBox
      Left = 5
      Top = 2
      Width = 259
      Height = 321
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = #1040#1085#1085#1086#1090#1072#1094#1080#1103':'
      TabOrder = 0
      DesignSize = (
        259
        321)
      object reDescription: TRichEdit
        Left = 6
        Top = 14
        Width = 247
        Height = 301
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clBtnFace
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object odsRlsPreps: TOracleDataSet
    SQL.Strings = (
      '/**/ SELECT n.id as FK_ID, /* + */'
      '/**/        n.eancode as FC_EANCODE, /* + */'
      
        '/**/        substr(tn.name,1,150)||'#39' '#39'||CASE WHEN nvl(p.dfmass,0' +
        ') > 0 THEN '#39' '#39'||p.dfmass||'#39' '#39'||substr(mup.shortname,1,6) ELSE '#39#39 +
        ' END|| /* + */'
      
        '/**/      CASE WHEN nvl(p.dfconc,0) > 0 THEN '#39' '#39'||p.dfconc||'#39' '#39'|' +
        '|substr(cn.shortname,1,20) ELSE '#39#39' END|| /* + */'
      
        '/**/      CASE WHEN p.DFSIZE is not null THEN '#39' '#39'||substr(p.dfsi' +
        'ze,1,30)||'#39' '#39'||substr(su.shortname,1,30) ELSE '#39#39' END || /* + */'
      
        '/**/      '#39' '#39'||CASE WHEN nvl(n.PPACKID,0) = 0 AND nvl(n.drugsinp' +
        'pack,0) = 0 THEN '#39#39' /* + */'
      
        '/**/                WHEN nvl(n.PPACKID,0) = 0 AND nvl(n.drugsinp' +
        'pack,0) > 0 THEN '#39' '#39'||n.drugsinppack||'#39' '#1096#1090'/'#1087#1077#1088#1074'.'#1091#1087'.'#39' /* + */'
      
        '/**/                WHEN nvl(n.PPACKID,0) > 0 AND nvl(n.drugsinp' +
        'pack,0) = 0 THEN '#39' '#39'||substr(dp.name,1,50) /* + */'
      
        '/**/      ELSE '#39' '#39'||n.drugsinppack||'#39' '#1096#1090'/'#39'||substr(dp.name,1,50)' +
        '||'#39#39' END|| /* + */'
      
        '/**/      CASE WHEN n.PPACKMASSUNID > 0 THEN '#39' '#39'||n.ppackmass||'#39 +
        ' '#39'||substr(mun.shortname,1,6) ELSE '#39#39' END|| /* + */'
      
        '/**/      CASE WHEN n.PPACKCUBUNID > 0 THEN '#39' '#39'||n.ppackvolume||' +
        #39' '#39'||substr(cu.shortname,1,8) ELSE '#39#39' END|| /* + */'
      
        '/**/      CASE WHEN N.UPACKID = 0 AND nvl(n.ppackinupack,0) = 0 ' +
        'THEN '#39#39' /* + */'
      
        '/**/           WHEN N.UPACKID = 0 AND nvl(n.ppackinupack,0) > 0 ' +
        'THEN '#39' '#39'||n.ppackinupack||'#39' '#1096#1090'/'#1074#1090#1086#1088'.'#1091#1087'.'#39' /* + */'
      
        '/**/           WHEN N.UPACKID > 0 AND nvl(n.ppackinupack,0) = 0 ' +
        'THEN '#39' '#39'||substr(dp2.NAME,1,50) /* + */'
      
        '/**/      ELSE '#39' '#39'||n.ppackinupack||'#39' '#1096#1090'/'#39'||substr(dp2.NAME,1,50' +
        ') END /* + */'
      '/**/      AS FC_PREP, /* + */'
      '/**/        substr(tn.name,1,150) as FC_TRADENAME, /* + */'
      '/**/        substr(latn.name,1,110) as FC_LATINNAME, /* + */'
      
        '--//--------------'#1080#1085#1085#1086#1074#1072#1094#1080#1086#1085#1085#1086#1077' :)------------------------------' +
        '------------------'
      '/**/        p.DFMASS, /* + */ -- /*'#1044#1054#1047#1048#1056#1054#1042#1050#1040' '#1042#1045#1065#1045#1057#1058#1042#1040'*/'
      '/**/        p.DFMASSID as FK_DFMASS, /* + */ -- /*'#1045#1044' '#1084#1072#1089#1089#1099' '#1051#1042'*/'
      '/**/        n.DRUGSINPPACK, /* + */ -- /*'#1060#1040#1057' '#1042' '#1059#1055#1040#1050'*/'
      
        '/**/        n.PPACKMASSUNID as FK_MASSUNIT, /* + */ -- /*'#1045#1044'. '#1052#1040#1057 +
        #1057'*/'
      '/**/        -1 as FARMGRID, /* + */ -- /*'#1060#1040#1056#1052'. '#1043#1056'.*/'
      
        '/**/        p.DRUGFORMID as FK_DRUGFORM, /* + */ --'#1050#1086#1076' '#1092#1086#1088#1084#1099' '#1074#1099#1087 +
        #1091#1089#1082#1072' ('#1074#1090#1086#1088#1080#1095#1085#1072#1103' '#1091#1087#1072#1082#1086#1074#1082#1072')'
      
        '/**/        n.PPACKID as FK_DRUGPACK_P /* + */ --'#1050#1086#1076' '#1087#1077#1088#1074#1080#1095#1085#1086#1081' '#1091 +
        #1087#1072#1082#1086#1074#1082#1080
      
        '--//------------------------------------------------------------' +
        '------------------'
      ''
      
        '/**/   FROM rls.nomen n, rls.prep p, RLS.tradenames tn, RLS.lati' +
        'nnames latn, /* + */'
      
        '/**/        RLS.massunits mup, rls.massunits mun, rls.drugpack d' +
        'p, rls.drugpack dp2, RLS.sizeunits su, RLS.CONCENUNITS cn,  /* +' +
        ' */'
      '/**/        rls.cubicunits cu  /* + */'
      '/**/  WHERE n.prepid = p.id  /* + */'
      '/**/  and p.tradenameid = tn.id /* + */'
      '/**/  and p.latinnameid = latn.id /* + */'
      '/**/  AND p.dfconcid = cn.id(+)/* + */'
      '/**/  AND p.dfsizeid = su.id(+)/* + */'
      '/**/  AND n.PPACKCUBUNID = cu.id(+)/* + */'
      '/**/  AND n.PPACKMASSUNID = mun.id(+)/* + */'
      '/**/  AND p.dfmassid = mup.id(+)/* + */'
      '/**/  AND n.PPACKID = dp.id(+)/* + */'
      '/**/  AND n.UPACKID = dp2.id(+)/* + */'
      ''
      ''
      ''
      ''
      '/*'
      'SELECT VNOMENRLS.FK_ID,'
      '       VNOMENRLS.EANCODE AS FC_EANCODE,'
      '       VPREPRLS.RESULT || VNOMENRLS.RESULT AS FC_PREP,'
      '       VPREPRLS.TRADENAME AS FC_TRADENAME,'
      '       VPREPRLS.LATINNAME AS FC_LATINNAME,'
      '       VPREPRLS.DFMASS, -- '#1044#1054#1047#1048#1056#1054#1042#1050#1040' '#1042#1045#1065#1045#1057#1058#1042#1040
      '       VPREPRLS.FK_DFMASS, -- '#1045#1044' '#1044#1054#1047#1048#1056#1054#1042#1050#1048
      '  VNOMENRLS.DRUGSINPPACK, --'#1060#1040#1057' '#1042' '#1059#1055#1040#1050
      '  VNOMENRLS.FK_MASSUNIT,  -- '#1045#1044'. '#1052#1040#1057#1057
      '  MED.TFARMGR.FARMGRID, -- '#1060#1040#1056#1052'. '#1043#1056'.'
      '  VPREPRLS.fk_drugform, '
      '  VNOMENRLS.fk_drugpack_p'
      
        '  FROM RLS.VPREPRLS, RLS.VNOMENRLS, RLS.TPREP_PHARMAGROUP, MED.T' +
        'FARMGR '
      ' WHERE VPREPRLS.FK_ID = VNOMENRLS.FK_PREP '
      '   AND VPREPRLS.FK_ID = RLS.TPREP_PHARMAGROUP.FK_PREP(+)'
      
        '   AND RLS.TPREP_PHARMAGROUP.FK_PHARMGROUP = MED.TFARMGR.FK_FRMG' +
        'R_RLS(+)'
      '    '
      '   AND 1 = 0'
      '*/'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000A00000005000000464B5F49440100000000000A00000046435F4541
      4E434F44450100000000000C00000046435F54524144454E414D450100000000
      000C00000046435F4C4154494E4E414D450100000000000700000046435F5052
      45500100000000000600000044464D41535301000000000009000000464B5F44
      464D4153530100000000000C0000004452554753494E505041434B0100000000
      000B000000464B5F4D415353554E4954010000000000080000004641524D4752
      4944010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    FilterOptions = [foCaseInsensitive]
    BeforeOpen = odsRlsPrepsBeforeOpen
    AfterOpen = odsRlsPrepsAfterOpen
    AfterScroll = odsRlsPrepsAfterScroll
    Left = 24
    Top = 112
    object odsRlsPrepsFK_ID: TFloatField
      FieldName = 'FK_ID'
      Required = True
    end
    object odsRlsPrepsFC_EANCODE: TStringField
      FieldName = 'FC_EANCODE'
      Size = 13
    end
    object odsRlsPrepsFC_PREP: TStringField
      FieldName = 'FC_PREP'
      Size = 300
    end
    object odsRlsPrepsFC_TRADENAME: TStringField
      FieldName = 'FC_TRADENAME'
      Size = 260
    end
    object odsRlsPrepsFC_LATINNAME: TStringField
      FieldName = 'FC_LATINNAME'
      Size = 150
    end
    object odsRlsPrepsDFMASS: TFloatField
      FieldName = 'DFMASS'
    end
    object odsRlsPrepsFK_DFMASS: TFloatField
      FieldName = 'FK_DFMASS'
    end
    object odsRlsPrepsDRUGSINPPACK: TFloatField
      FieldName = 'DRUGSINPPACK'
    end
    object odsRlsPrepsFK_MASSUNIT: TFloatField
      FieldName = 'FK_MASSUNIT'
    end
    object odsRlsPrepsFARMGRID: TFloatField
      FieldName = 'FARMGRID'
    end
  end
  object dsRlsPreps: TDataSource
    DataSet = odsRlsPreps
    Left = 24
    Top = 168
  end
  object odsDescription: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      'n.id AS "'#1050#1086#1076' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1099'",'
      'n.PREPID "'#1050#1086#1076' '#1087#1088#1077#1087#1072#1088#1072#1090#1072'",'
      'tn.name AS "'#1058#1086#1088#1075#1086#1074#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077'",'
      'ln.name AS "'#1051#1072#1090#1080#1085#1089#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077'",'
      ''
      '(SELECT  distinct asu.string_agg (pg.name)'
      
        '              FROM RLS.PREP_PHARMAGROUP ppg, RLS.clspharmagroup ' +
        'pg'
      '              WHERE ppg.PREPID = p.id'
      '                AND pg.id = ppg.UNIQID'
      '               )'
      'AS "'#1060#1072#1088#1084'.'#1075#1088#1091#1087#1087#1072'",'
      ''
      ''
      
        '(SELECT asu.string_agg(RLS.ACTMATTERS.RUSNAME || DECODE(RLS.ACTM' +
        'ATTERS.LATNAME,'#39#39','#39#39','#39' ('#39'||RLS.ACTMATTERS.LATNAME||'#39')'#39')) AS ACTM' +
        'ATTERSNAME'
      '              FROM RLS.PREP_ACTMATTERS, RLS.ACTMATTERS'
      '              WHERE RLS.PREP_ACTMATTERS.PREPID = p.id'
      
        '                AND RLS.PREP_ACTMATTERS.MATTERID = RLS.ACTMATTER' +
        'S.ID)'
      'AS "'#1053#1044#1042'",'
      ''
      '(SELECT asu.string_agg(RLS.ACTMATTERS.LATNAME) AS ACTMATTERSNAME'
      '              FROM RLS.PREP_ACTMATTERS, RLS.ACTMATTERS'
      '              WHERE RLS.PREP_ACTMATTERS.PREPID = p.id'
      
        '                AND RLS.PREP_ACTMATTERS.MATTERID = RLS.ACTMATTER' +
        'S.ID)'
      'AS LATINE_NAME_NDV,'
      ''
      'null AS "'#1053#1086#1079#1086#1083#1086#1075#1080#1095#1077#1089#1082#1072#1103' '#1082#1083#1072#1089#1089'.('#1052#1050#1041'-10)",'
      ''
      '(SELECT asu.string_agg(CLSATC.NAME)'
      '              FROM RLS.PREP_ATC, RLS.CLSATC'
      '              WHERE PREP_ATC.PREPID = p.id'
      '                AND PREP_ATC.UNIQID = CLSATC.ID) '
      'AS "'#1040#1058#1061'",'
      'dt.composition AS "'#1057#1086#1089#1090#1072#1074' '#1080' '#1092#1086#1088#1084#1072' '#1074#1099#1087#1091#1089#1082#1072'",'
      'dt.drugformdescr AS "'#1054#1087#1080#1089#1072#1085#1080#1077' '#1083#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1086#1081' '#1092#1086#1088#1084#1099'",'
      'dt.characters AS "'#1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072'",'
      
        '(SELECT asu.string_agg(T.NAME) FROM RLS.PHARMAACTIONS T, RLS.PHA' +
        'CT_DESC PD'
      '              WHERE PD.DESCID = dt.DESCID'
      '                AND T.ID = PD.PHACTID)'
      ''
      '--RLS_old.GET_PHARMACTDESC(dt.fk_id) '
      'AS "'#1054#1087#1080#1089#1072#1085#1080#1077' '#1092'.'#1076'.",'
      ''
      ''
      'dt.pharmaactions AS "'#1060#1072#1088#1084#1072#1082#1086#1083#1086#1075#1080#1095#1077#1089#1082#1086#1077' '#1076#1077#1081#1089#1090#1074#1080#1077'",'
      'dt.COMPONENTSPROPERTIES AS "'#1057#1074#1086#1081#1089#1090#1074#1072' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1086#1074'",'
      'dt.PHARMAKINETIC AS "'#1060#1072#1088#1084#1072#1082#1086#1082#1080#1085#1077#1090#1080#1082#1072'",'
      'dt.pharmadynamic AS "'#1060#1072#1088#1084#1072#1082#1086#1076#1080#1085#1072#1084#1080#1082#1072'",'
      'dt.clinicalpharmacology AS "'#1050#1083#1080#1085#1080#1095#1077#1089#1082#1072#1103' '#1092#1072#1088#1084#1072#1082#1086#1083#1086#1075#1080#1103'",'
      'dt.direction AS "'#1048#1085#1089#1090#1088#1091#1082#1094#1080#1103'",'
      'dt.indications AS "'#1055#1086#1082#1072#1079#1072#1085#1080#1103'",'
      'dt.recommendations AS "'#1056#1077#1082#1086#1084#1077#1085#1076#1091#1077#1090#1089#1103'",'
      'dt.contraindications AS "'#1055#1088#1086#1090#1080#1074#1086#1087#1086#1082#1072#1079#1072#1085#1080#1103'",'
      'dt.sideactions AS "'#1055#1086#1073#1086#1095#1085#1099#1077' '#1076#1077#1081#1089#1090#1074#1080#1103'",'
      'dt.interactions AS "'#1042#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1077'",'
      'dt.usemethodanddoses AS "'#1057#1087#1086#1089#1086#1073' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103' '#1080' '#1076#1086#1079#1099'",'
      'dt.overdose AS "'#1055#1077#1088#1077#1076#1086#1079#1080#1088#1086#1074#1082#1072'",'
      'dt.pregnancyuse AS "'#1055#1088#1080#1084'. '#1087#1088#1080' '#1073#1077#1088#1077#1084'. '#1080' '#1082#1086#1088#1084'.'#1075#1088#1091#1076#1100#1102'",'
      'dt.specialguidelines AS "'#1054#1089#1086#1073#1099#1077' '#1091#1082#1072#1079#1072#1085#1080#1103'",'
      'dt.precautions AS "'#1052#1077#1088#1099' '#1087#1088#1077#1076#1086#1089#1090#1086#1088#1086#1078#1085#1086#1089#1090#1080'",'
      'dt.literature AS "'#1051#1080#1090#1077#1088#1072#1090#1091#1088#1072'",'
      '--dt."comment"'
      'TO_CLOB(null) AS "'#1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081'",'
      'dl.text AS "'#1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080'",'
      
        'CASE WHEN p.listtype IS NULL THEN '#39#39' ELSE '#39#1057#1087#1080#1089#1086#1082' '#39'||p.listtype|' +
        '|'#39'.'#39' END ||'
      #39' '#39'||dsc.text AS "'#1059#1089#1083#1086#1074#1080#1103' '#1093#1088#1072#1085#1077#1085#1080#1103'",'
      'n.eancode AS "'#1050#1086#1076' EAN",'
      
        'fn.name||CASE WHEN f.COUNTID > 0 THEN '#39' ('#39'||c.name||'#39')'#39' ELSE '#39#39' ' +
        'END AS "'#1060#1080#1088#1084#1072' '#1087#1086#1084#1077#1089#1090#1080#1074#1096#1072#1103' '#1080#1085#1092'. '#1074' '#1056#1051#1057'"'
      ''
      
        'FROM Rls.Nomen n, Rls.prep p, Rls.tradenames tn, Rls.latinnames ' +
        'ln, '
      
        '     Rls.nomen_Desc nd, Rls.descriptions d, Rls.desctextes dt, R' +
        'ls.druglifetime dl,'
      
        '     Rls.drugstorcond dsc, Rls.firms f, Rls.firmnames fn, Rls.co' +
        'untries c'
      ''
      'WHERE n.PREPID = p.id'
      '  AND p.TRADENAMEID = tn.id'
      '  AND p.LATINNAMEID = ln.id'
      '  AND n.id = nd.NOMENID (+)'
      '  AND nd.DESCID = d.id (+)'
      '  AND nd.DESCID = dt.DESCID (+)'
      '  AND n.lifeid = dl.id '
      '  AND n.condid = dsc.id '
      '  AND d.FIRMID = f.id (+)'
      '  AND f.NAMEID = fn.id (+)'
      '  AND f.COUNTID = c.id (+)'
      '  AND n.id = :fk_id')
    Optimize = False
    Variables.Data = {0300000001000000060000003A464B5F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000002300000011000000CAEEE420EDEEECE5EDF2EAEBE0F2F3F0FB010000
      0000000D000000CAEEE420EFF0E5EFE0F0E0F2E001000000000011000000D2EE
      F0E3EEE2EEE520EDE0E7E2E0EDE8E501000000000012000000CBE0F2E8EDF1EA
      EEE520EDE0E7E2E0EDE8E50100000000000B000000D4E0F0EC2EE3F0F3EFEFE0
      01000000000003000000CDC4C20100000000001D000000CDEEE7EEEBEEE3E8F7
      E5F1EAE0FF20EAEBE0F1F12E28CCCAC12D31302901000000000003000000C0D2
      D501000000000016000000D1EEF1F2E0E220E820F4EEF0ECE020E2FBEFF3F1EA
      E00100000000001C000000CEEFE8F1E0EDE8E520EBE5EAE0F0F1F2E2E5EDEDEE
      E920F4EEF0ECFB0100000000000E000000D5E0F0E0EAF2E5F0E8F1F2E8EAE001
      00000000001A000000D4E0F0ECE0EAEEEBEEE3E8F7E5F1EAEEE520E4E5E9F1F2
      E2E8E501000000000014000000D1E2EEE9F1F2E2E020EAEEECEFEEEDE5EDF2EE
      E20100000000000F000000D4E0F0ECE0EAEEEAE8EDE5F2E8EAE0010000000000
      0F000000D4E0F0ECE0EAEEE4E8EDE0ECE8EAE001000000000018000000CAEBE8
      EDE8F7E5F1EAE0FF20F4E0F0ECE0EAEEEBEEE3E8FF0100000000000A000000C8
      EDF1F2F0F3EAF6E8FF01000000000009000000CFEEEAE0E7E0EDE8FF01000000
      00000D000000D0E5EAEEECE5EDE4F3E5F2F1FF01000000000010000000CFF0EE
      F2E8E2EEEFEEEAE0E7E0EDE8FF01000000000011000000CFEEE1EEF7EDFBE520
      E4E5E9F1F2E2E8FF0100000000000E000000C2E7E0E8ECEEE4E5E9F1F2E2E8E5
      01000000000018000000D1EFEEF1EEE120EFF0E8ECE5EDE5EDE8FF20E820E4EE
      E7FB0100000000000D000000CFE5F0E5E4EEE7E8F0EEE2EAE00100000000001E
      000000CFF0E8EC2E20EFF0E820E1E5F0E5EC2E20E820EAEEF0EC2EE3F0F3E4FC
      FE0100000000000F000000CEF1EEE1FBE520F3EAE0E7E0EDE8FF010000000000
      15000000CCE5F0FB20EFF0E5E4EEF1F2EEF0EEE6EDEEF1F2E80100000000000A
      000000CBE8F2E5F0E0F2F3F0E00100000000000B000000CAEEECECE5EDF2E0F0
      E8E90100000000000D000000D1F0EEEA20E3EEE4EDEEF1F2E801000000000010
      000000D3F1EBEEE2E8FF20F5F0E0EDE5EDE8FF01000000000007000000CAEEE4
      2045414E0100000000001C000000D4E8F0ECE020EFEEECE5F1F2E8E2F8E0FF20
      E8EDF42E20E220D0CBD10100000000000D000000CEEFE8F1E0EDE8E520F42EE4
      2E0100000000000F0000004C4154494E455F4E414D455F4E4456010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 593
    Top = 174
    object odsDescriptionDSDesigner: TFloatField
      FieldName = #1050#1086#1076' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1099
      Required = True
    end
    object odsDescriptionDSDesigner2: TFloatField
      FieldName = #1050#1086#1076' '#1087#1088#1077#1087#1072#1088#1072#1090#1072
    end
    object odsDescriptionDSDesigner3: TStringField
      FieldName = #1058#1086#1088#1075#1086#1074#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      Size = 260
    end
    object odsDescriptionDSDesigner4: TStringField
      FieldName = #1051#1072#1090#1080#1085#1089#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      Size = 160
    end
    object odsDescriptionDSDesigner5: TStringField
      FieldName = #1060#1072#1088#1084'.'#1075#1088#1091#1087#1087#1072
      Size = 90
    end
    object odsDescriptionDSDesigner6: TStringField
      FieldName = #1053#1044#1042
      Size = 100
    end
    object odsDescriptionDSDesigner10: TStringField
      FieldName = #1053#1086#1079#1086#1083#1086#1075#1080#1095#1077#1089#1082#1072#1103' '#1082#1083#1072#1089#1089'.('#1052#1050#1041'-10)'
      Size = 230
    end
    object odsDescriptionDSDesigner7: TStringField
      FieldName = #1040#1058#1061
      Size = 130
    end
    object odsDescriptionDSDesigner8: TMemoField
      FieldName = #1057#1086#1089#1090#1072#1074' '#1080' '#1092#1086#1088#1084#1072' '#1074#1099#1087#1091#1089#1082#1072
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner9: TMemoField
      FieldName = #1054#1087#1080#1089#1072#1085#1080#1077' '#1083#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1086#1081' '#1092#1086#1088#1084#1099
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner11: TMemoField
      FieldName = #1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner12: TStringField
      FieldName = #1054#1087#1080#1089#1072#1085#1080#1077' '#1092'.'#1076'.'
      Size = 200
    end
    object odsDescriptionDSDesigner13: TMemoField
      FieldName = #1060#1072#1088#1084#1072#1082#1086#1083#1086#1075#1080#1095#1077#1089#1082#1086#1077' '#1076#1077#1081#1089#1090#1074#1080#1077
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner14: TMemoField
      FieldName = #1057#1074#1086#1081#1089#1090#1074#1072' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1086#1074
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner15: TMemoField
      FieldName = #1060#1072#1088#1084#1072#1082#1086#1082#1080#1085#1077#1090#1080#1082#1072
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner16: TMemoField
      FieldName = #1060#1072#1088#1084#1072#1082#1086#1076#1080#1085#1072#1084#1080#1082#1072
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner17: TMemoField
      FieldName = #1050#1083#1080#1085#1080#1095#1077#1089#1082#1072#1103' '#1092#1072#1088#1084#1072#1082#1086#1083#1086#1075#1080#1103
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner18: TMemoField
      FieldName = #1048#1085#1089#1090#1088#1091#1082#1094#1080#1103
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner19: TMemoField
      FieldName = #1055#1086#1082#1072#1079#1072#1085#1080#1103
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner20: TMemoField
      FieldName = #1056#1077#1082#1086#1084#1077#1085#1076#1091#1077#1090#1089#1103
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner21: TMemoField
      FieldName = #1055#1088#1086#1090#1080#1074#1086#1087#1086#1082#1072#1079#1072#1085#1080#1103
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner22: TMemoField
      FieldName = #1055#1086#1073#1086#1095#1085#1099#1077' '#1076#1077#1081#1089#1090#1074#1080#1103
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner23: TMemoField
      FieldName = #1042#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1077
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner24: TMemoField
      FieldName = #1057#1087#1086#1089#1086#1073' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103' '#1080' '#1076#1086#1079#1099
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner25: TMemoField
      FieldName = #1055#1077#1088#1077#1076#1086#1079#1080#1088#1086#1074#1082#1072
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner26: TMemoField
      FieldName = #1055#1088#1080#1084'. '#1087#1088#1080' '#1073#1077#1088#1077#1084'. '#1080' '#1082#1086#1088#1084'.'#1075#1088#1091#1076#1100#1102
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner27: TMemoField
      FieldName = #1054#1089#1086#1073#1099#1077' '#1091#1082#1072#1079#1072#1085#1080#1103
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner28: TMemoField
      FieldName = #1052#1077#1088#1099' '#1087#1088#1077#1076#1086#1089#1090#1086#1088#1086#1078#1085#1086#1089#1090#1080
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner29: TMemoField
      FieldName = #1051#1080#1090#1077#1088#1072#1090#1091#1088#1072
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner30: TMemoField
      FieldName = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      BlobType = ftOraClob
    end
    object odsDescriptionDSDesigner31: TStringField
      FieldName = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
      Size = 40
    end
    object odsDescriptionDSDesigner32: TStringField
      FieldName = #1059#1089#1083#1086#1074#1080#1103' '#1093#1088#1072#1085#1077#1085#1080#1103
      Size = 150
    end
    object odsDescriptionEAN: TStringField
      FieldName = #1050#1086#1076' EAN'
      Size = 13
    end
    object odsDescriptionDSDesigner33: TStringField
      FieldName = #1060#1080#1088#1084#1072' '#1087#1086#1084#1077#1089#1090#1080#1074#1096#1072#1103' '#1080#1085#1092'. '#1074' '#1056#1051#1057
      Size = 150
    end
    object odsDescriptionLATINE_NAME_NDV: TStringField
      DisplayWidth = 200
      FieldName = 'LATINE_NAME_NDV'
      Size = 200
    end
  end
end
