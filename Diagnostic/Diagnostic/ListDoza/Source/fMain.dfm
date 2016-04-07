object frmMain: TfrmMain
  Left = 254
  Top = 91
  BorderStyle = bsNone
  Caption = #1051#1080#1089#1090' '#1083#1091#1095#1077#1074#1086#1081' '#1085#1072#1075#1088#1091#1079#1082#1080' '#1087#1072#1094#1080#1077#1085#1090#1072
  ClientHeight = 473
  ClientWidth = 973
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGr: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 967
    Height = 436
    Margins.Top = 0
    Align = alClient
    BevelOuter = bvNone
    PopupMenu = PopupMenu1
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object TV: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'DOZA'
          Column = VDOZA
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.FooterMultiSummaries = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VSNIMOK: TcxGridDBColumn
        Caption = '_'
        DataBinding.FieldName = 'FK_RESULTID'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = ilCntImage
        Properties.Items = <
          item
            ImageIndex = 0
            Value = '-1'
          end
          item
            ImageIndex = 1
            Value = '1'
          end>
        Visible = False
        Options.Moving = False
        VisibleForCustomization = False
        Width = 32
      end
      object TVFD_RUN: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1074#1099#1087'.'
        DataBinding.FieldName = 'FD_RUN'
        VisibleForCustomization = False
        Width = 188
      end
      object VISSLNAME: TcxGridDBColumn
        Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        VisibleForCustomization = False
        Width = 286
      end
      object VNUMMK: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1052#1050
        DataBinding.FieldName = 'NUMIB'
        Width = 99
      end
      object VDOZA: TcxGridDBColumn
        Caption = #1044#1086#1079#1072' ('#1084#1047#1074')'
        DataBinding.FieldName = 'DOZA'
        VisibleForCustomization = False
        Width = 80
      end
      object VVRACHFIO: TcxGridDBColumn
        Caption = #1053#1072#1079#1085#1072#1095#1080#1074#1096#1080#1081
        DataBinding.FieldName = 'VFIO'
        Width = 97
      end
      object VISPOLFIO: TcxGridDBColumn
        Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
        DataBinding.FieldName = 'IFIO'
        Width = 114
      end
      object VSOS: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1091#1089
        DataBinding.FieldName = 'SOS'
        Width = 57
      end
    end
    object cxGrLevel1: TcxGridLevel
      GridView = TV
    end
  end
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 967
    Height = 28
    Align = dalTop
    BarManager = BM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object paDates: TPanel
    Left = 120
    Top = 200
    Width = 210
    Height = 17
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 5
    Visible = False
    object cxLabel1: TcxLabel
      Left = 0
      Top = 0
      Caption = #1055#1077#1088#1080#1086#1076' '#1089': '
    end
    object lbBeg: TcxLabel
      Left = 55
      Top = 0
      Caption = '01.01.2009'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel3: TcxLabel
      Left = 123
      Top = 0
      Caption = #1087#1086':'
    end
    object lbEnd: TcxLabel
      Left = 144
      Top = 0
      Caption = '31.12.2009'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
  end
  object rveText: TRichViewEdit
    AlignWithMargins = True
    Left = 280
    Top = 144
    Width = 25
    Height = 25
    Margins.Left = 0
    ReadOnly = False
    TabOrder = 7
    TabStop = False
    Visible = False
    BackgroundStyle = bsStretched
    DoInPaletteMode = rvpaCreateCopies
    Options = [rvoAllowSelection, rvoScrollToEnd, rvoShowCheckpoints, rvoShowPageBreaks, rvoTagsArePChars, rvoAutoCopyText, rvoAutoCopyRVF, rvoAutoCopyImage, rvoAutoCopyRTF, rvoFormatInvalidate, rvoDblClickSelectsWord, rvoRClickDeselects, rvoFastFormatting]
    RTFReadProperties.UnicodeMode = rvruMixed
    RTFReadProperties.TextStyleMode = rvrsAddIfNeeded
    RTFReadProperties.ParaStyleMode = rvrsAddIfNeeded
    RVFOptions = [rvfoSavePicturesBody, rvfoSaveControlsBody, rvfoSaveBinary, rvfoSaveBack, rvfoLoadBack, rvfoSaveTextStyles, rvfoSaveParaStyles, rvfoSaveLayout, rvfoLoadLayout, rvfoSaveDocProperties, rvfoLoadDocProperties]
    Style = rvs
  end
  object os: TOracleSession
    Left = 40
    Top = 72
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWNUM, -- '#1089#1090#1072#1094#1080#1086#1085#1072#1088#1085#1099#1077
      '       TNAZIS.FK_ID,'
      '       TNAZIS.FK_NAZSOSID,'
      
        '       DECODE(TNAZIS.FK_NAZSOSID, 1, '#39#1042#1067#1055'.'#39', -11, '#39#1042#1067#1055'. '#1056#1051#39') AS ' +
        'SOS, '
      '       TNAZIS.FK_SMID,'
      '       TNAZIS.FK_PACID, '
      '       TO_CHAR(TNAZIS.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       TNAZIS.FD_RUN AS DATE_RUN, '
      '       ASU.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS FC_NAME, '
      
        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = TNAZIS.' +
        'FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       ASU.GET_IB(TKARTA.FK_ID) AS NUMIB,'
      '       ASU.DO_VRACHFIO(FK_VRACHID) AS VFIO,'
      '       ASU.DO_VRACHFIO(FK_ISPOLID) AS IFIO,'
      '       TNAZIS.FC_TYPE,'
      '       asu.get_owner_from_smid(tnazis.fk_smid) as smowner,'
      '       0 as fk_type,'
      '       tnazis.fk_resultid '
      '  FROM ASU.TNAZIS, ASU.TKARTA'
      '  WHERE FK_SMID IN (SELECT FK_ID FROM ASU.TSMID'
      '                     WHERE FL_SHOWANAL = 1'
      '                       AND FL_SHOWPRINT = 1'
      '                    START WITH FK_ID = ASU.GET_RG_ISSL'
      '                    CONNECT BY PRIOR FK_ID = FK_OWNER)'
      '    AND TNAZIS.FK_NAZSOSID IN (ASU.GET_VIPNAZ, ASU.GET_LABVIP)'
      '    AND TNAZIS.FK_PACID = TKARTA.FK_ID'
      '    AND TKARTA.FK_PEPLID = ASU.GET_PEPLID(:PFK_PACID)'
      '    '
      'UNION ALL'
      ''
      'SELECT ROWNUM, -- '#1072#1084#1073#1091#1083#1072#1090#1086#1088#1085#1099#1077
      '       TNAZIS.FK_ID, '
      '       TNAZIS.FK_NAZSOSID,'
      
        '       DECODE(TNAZIS.FK_NAZSOSID, 1, '#39#1042#1067#1055'.'#39', -11, '#39#1042#1067#1055'. '#1056#1051#39') AS ' +
        'SOS,'
      '       TNAZIS.FK_SMID,'
      '       TNAZIS.FK_PACID,'
      '       TO_CHAR(TNAZIS.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       TNAZIS.FD_RUN AS DATE_RUN,'
      '       ASU.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS FC_NAME,  '
      
        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = TNAZIS.' +
        'FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       ASU.GET_IB(TAMBULANCE.FK_ID) AS NUMIB,'
      '       ASU.DO_VRACHFIO(FK_VRACHID) AS VFIO,'
      '       ASU.DO_VRACHFIO(FK_ISPOLID) AS IFIO,'
      '       TNAZIS.FC_TYPE,'
      '       asu.get_owner_from_smid(tnazis.fk_smid) as smowner,'
      '       1 as fk_type,'
      '       tnazis.fk_resultid '
      '  FROM ASU.TNAZIS, ASU.TAMBULANCE'
      '  WHERE FK_SMID IN (SELECT FK_ID FROM ASU.TSMID'
      '                     WHERE FL_SHOWANAL = 1'
      '                       AND FL_SHOWPRINT = 1 '
      '                    START WITH FK_ID = ASU.GET_RG_ISSL'
      '                    CONNECT BY PRIOR FK_ID = FK_OWNER)'
      '    AND TNAZIS.FK_NAZSOSID IN (ASU.GET_VIPNAZ, ASU.GET_LABVIP)'
      '    AND TNAZIS.FK_PACID = TAMBULANCE.FK_ID'
      '    AND TAMBULANCE.FK_PEPLID = ASU.GET_PEPLID(:PFK_PACID)'
      ''
      'UNION ALL'
      ''
      'SELECT ROWNUM, -- '#1088#1077#1085#1090#1075#1077#1085#1093#1080#1088#1091#1088#1075#1080#1095#1077#1089#1082#1080#1077' '#1080' '#1091#1088#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
      '       VNAZ.FK_ID, '
      '       VNAZ.FK_NAZSOSID,'
      
        '       DECODE(VNAZ.FK_NAZSOSID, 1, '#39#1042#1067#1055'.'#39', -11, '#39#1042#1067#1055'. '#1056#1051#39') AS SO' +
        'S,'
      '       VNAZ.FK_SMID,'
      '       VNAZ.FK_PACID,'
      '       TO_CHAR(VNAZ.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       VNAZ.FD_RUN AS DATE_RUN,'
      '       ASU.GET_NAME_RGISSL(VNAZ.FK_SMID)||'#39':'#39'||'
      '       (select max(fc_char) '
      '          from asu.tib '
      '         where fk_pacid = vnaz.fk_id '
      '           and fk_smid in (select fk_id from asu.tsmid '
      
        '                           start with fc_synonim in ('#39'PROTHOPER_' +
        'NAME'#39', '#39'RENTGENXIR_NAME'#39', '#39'UROLOG_OPER'#39') connect by prior fk_id ' +
        '= fk_owner)) AS FC_NAME,  '
      
        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = VNAZ.FK' +
        '_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       ASU.GET_IB(VNAZ.FK_PACID) AS NUMIB,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_VRACHID) AS VFIO,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_ISPOLID) AS IFIO,'
      '       VNAZ.FC_TYPE,'
      '       asu.get_owner_from_smid(VNAZ.fk_smid) as smowner,'
      '       -1 as fk_type,'
      '       vnaz.fk_resultid      '
      '  from asu.vnaz'
      
        ' where vnaz.fk_pacid in (select fk_id from asu.tambulance where ' +
        'fk_peplid = asu.get_peplid(:PFK_PACID)'
      '                         union all '
      
        '                         select fk_id from asu.tkarta where fk_p' +
        'eplid = asu.get_peplid(:PFK_PACID))'
      
        '   and vnaz.fk_nazsosid not in (asu.get_pass_registrator, asu.ge' +
        't_pass_registrator_dd)'
      '   and vnaz.fk_smid in (select fk_id from asu.tsmid'
      '                         where fl_showanal = 1'
      
        '    '#9#9#9'   start with fc_synonim in ('#39'RENTGENXIR_OPER'#39', '#39'RENTGENX' +
        'IR_ISSLED'#39', '#39'UROLOG_OPER'#39')'
      #9#9#9'   connect by prior fk_id = fk_owner)'
      ''
      'UNION ALL'
      ''
      'SELECT ROWNUM, -- '#1054#1085#1082#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103' '
      '       VNAZ.FK_ID, '
      '       VNAZ.FK_NAZSOSID,'
      
        '       DECODE(VNAZ.FK_NAZSOSID, 1, '#39#1042#1067#1055'.'#39', -11, '#39#1042#1067#1055'. '#1056#1051#39') AS SO' +
        'S,'
      '       VNAZ.FK_SMID,'
      '       VNAZ.FK_PACID,'
      '       TO_CHAR(VNAZ.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       VNAZ.FD_RUN AS DATE_RUN,'
      '       ASU.GET_NAME_RGISSL(VNAZ.FK_SMID) AS FC_NAME,  '
      
        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = VNAZ.FK' +
        '_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       ASU.GET_IB(VNAZ.FK_PACID) AS NUMIB,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_VRACHID) AS VFIO,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_ISPOLID) AS IFIO,'
      '       VNAZ.FC_TYPE,'
      '       asu.get_owner_from_smid(VNAZ.fk_smid) as smowner,'
      '       -1 as fk_type,'
      '       vnaz.fk_resultid     '
      '  from asu.vnaz'
      
        ' where vnaz.fk_pacid in (select fk_id from asu.tambulance where ' +
        'fk_peplid = asu.get_peplid(:PFK_PACID)'
      '                         union all '
      
        '                         select fk_id from asu.tkarta where fk_p' +
        'eplid = asu.get_peplid(:PFK_PACID))'
      
        '   and vnaz.fk_nazsosid not in (asu.get_pass_registrator, asu.ge' +
        't_pass_registrator_dd)'
      '   and vnaz.fk_smid in (select fk_id from asu.tsmid'
      '                         where fl_showanal = 1'
      '    '#9#9#9'   start with fc_synonim = '#39'ISL_ONKOLOG'#39
      #9#9#9'   connect by prior fk_id = fk_owner)'
      ''
      'UNION ALL'
      ''
      'SELECT ROWNUM, -- '#1072#1088#1080#1090#1084#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
      '       VNAZ.FK_ID, '
      '       VNAZ.FK_NAZSOSID,'
      
        '       DECODE(VNAZ.FK_NAZSOSID, 1, '#39#1042#1067#1055'.'#39', -11, '#39#1042#1067#1055'. '#1056#1051#39') AS SO' +
        'S,'
      '       VNAZ.FK_SMID,'
      '       VNAZ.FK_PACID,'
      '       TO_CHAR(VNAZ.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       VNAZ.FD_RUN AS DATE_RUN,'
      '       ASU.GET_NAME_RGISSL(VNAZ.FK_SMID)||'#39':'#39'||'
      '       (select max(fc_char) '
      '          from asu.tib '
      '         where fk_pacid = vnaz.fk_id '
      '           and fk_smid in (select fk_id from asu.tsmid '
      
        '                           start with fc_synonim in ('#39'PROTHOPER_' +
        'NAME'#39', '#39'RENTGENXIR_NAME'#39') connect by prior fk_id = fk_owner)) AS' +
        ' FC_NAME,  '
      
        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = VNAZ.FK' +
        '_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       ASU.GET_IB(VNAZ.FK_PACID) AS NUMIB,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_VRACHID) AS VFIO,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_ISPOLID) AS IFIO,'
      '       VNAZ.FC_TYPE,'
      '       asu.get_owner_from_smid(VNAZ.fk_smid) as smowner,'
      '       -1 as fk_type,'
      '       vnaz.fk_resultid     '
      '  from asu.vnaz'
      
        ' where vnaz.fk_pacid in (select fk_id from asu.tambulance where ' +
        'fk_peplid = asu.get_peplid(:PFK_PACID)'
      '                         union all '
      
        '                         select fk_id from asu.tkarta where fk_p' +
        'eplid = asu.get_peplid(:PFK_PACID))'
      
        '   and vnaz.fk_nazsosid not in (asu.get_pass_registrator, asu.ge' +
        't_pass_registrator_dd)'
      '   and vnaz.fk_smid in (select fk_id from asu.tsmid'
      '                         where fl_showanal = 1'
      '    '#9#9#9'   start with fk_id = asu.get_oper_aritmolog'
      #9#9#9'   connect by prior fk_id = fk_owner)'
      ''
      'UNION ALL'
      ''
      'SELECT ROWNUM, -- '#1091#1088#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      '       VNAZ.FK_ID, '
      '       VNAZ.FK_NAZSOSID,'
      
        '       DECODE(VNAZ.FK_NAZSOSID, 1, '#39#1042#1067#1055'.'#39', -11, '#39#1042#1067#1055'. '#1056#1051#39') AS SO' +
        'S,'
      '       VNAZ.FK_SMID,'
      '       VNAZ.FK_PACID,'
      '       TO_CHAR(VNAZ.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       VNAZ.FD_RUN AS DATE_RUN,'
      '       ASU.GET_NAME_RGISSL(VNAZ.FK_SMID) AS FC_NAME,  '
      
        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = VNAZ.FK' +
        '_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       ASU.GET_IB(VNAZ.FK_PACID) AS NUMIB,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_VRACHID) AS VFIO,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_ISPOLID) AS IFIO,'
      '       VNAZ.FC_TYPE,'
      '       asu.get_owner_from_smid(VNAZ.fk_smid) as smowner,'
      '       -1 as fk_type,'
      '       vnaz.fk_resultid     '
      '  from asu.vnaz'
      
        ' where vnaz.fk_pacid in (select fk_id from asu.tambulance where ' +
        'fk_peplid = asu.get_peplid(:PFK_PACID)'
      '                         union all '
      
        '                         select fk_id from asu.tkarta where fk_p' +
        'eplid = asu.get_peplid(:PFK_PACID))'
      
        '   and vnaz.fk_nazsosid not in (asu.get_pass_registrator, asu.ge' +
        't_pass_registrator_dd)'
      '   and vnaz.fk_smid in (select fk_id from asu.tsmid'
      '                         where fl_showanal = 1'
      '    '#9#9#9'        start with fc_synonim = '#39'ISSLED_UROLOG'#39
      #9#9#9'            connect by prior fk_id = fk_owner)'
      ''
      'UNION ALL'
      ''
      'SELECT ROWNUM, -- '#1088#1072#1076#1080#1086#1085#1091#1082#1083#1080#1076#1085#1072#1103' '#1076#1080#1072#1075#1085#1086#1089#1090#1080#1082#1072
      '       VNAZ.FK_ID, '
      '       VNAZ.FK_NAZSOSID,'
      
        '       DECODE(VNAZ.FK_NAZSOSID, 1, '#39#1042#1067#1055'.'#39', -11, '#39#1042#1067#1055'. '#1056#1051#39') AS SO' +
        'S,'
      '       VNAZ.FK_SMID,'
      '       VNAZ.FK_PACID,'
      '       TO_CHAR(VNAZ.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       VNAZ.FD_RUN AS DATE_RUN,'
      '       FC_NAME,  '
      
        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = VNAZ.FK' +
        '_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       ASU.GET_IB(VNAZ.FK_PACID) AS NUMIB,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_VRACHID) AS VFIO,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_ISPOLID) AS IFIO,'
      '       VNAZ.FC_TYPE,'
      '       asu.get_owner_from_smid(VNAZ.fk_smid) as smowner,'
      '       0 as fk_type,'
      '       vnaz.fk_resultid     '
      '  from asu.vnaz'
      
        ' where vnaz.fk_pacid in (select fk_id from asu.tambulance where ' +
        'fk_peplid = asu.get_peplid(:PFK_PACID)'
      '                         union all '
      
        '                         select fk_id from asu.tkarta where fk_p' +
        'eplid = asu.get_peplid(:PFK_PACID))'
      '   and vnaz.fk_nazsosid in (asu.get_vipnaz, asu.get_labvip)'
      '   and vnaz.fk_smid in (select fk_id from asu.tsmid'
      '                         where fl_showanal = 1'
      '    '#9#9#9'   start with fc_synonim = '#39'ISL_RADIONUCLEAR'#39
      #9#9#9'   connect by prior fk_id = fk_owner)'
      ''
      'ORDER BY DATE_RUN DESC  ')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464B5F504143494403000000000000000000
      0000}
    Cursor = crSQLWait
    Session = os
    AfterScroll = odsListAfterScroll
    Left = 392
    Top = 128
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 392
    Top = 80
  end
  object BM: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = IL
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 40
    Top = 120
    DockControlHeights = (
      0
      0
      0
      0)
    object BMBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Main'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 166
      FloatTop = 61
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbParam'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cciDates'
        end
        item
          Visible = True
          ItemName = 'bbClear'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbProtocol'
        end
        item
          Visible = True
          ItemName = 'bbSnimki'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbCD'
        end
        item
          Visible = True
          ItemName = 'bbPrint'
        end
        item
          BeginGroup = True
          UserDefine = [udWidth]
          UserWidth = 26
          Visible = True
          ItemName = 'chMrt'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbRefresh: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbProtocol: TdxBarButton
      Action = aProtocol
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrint: TdxBarButton
      Action = aPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbParam: TdxBarButton
      Action = aParam
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000C8FC08C3F300BDF300C8FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000D6FF03C1F1D5FDFFD0
        FBFF69DFFA0CCFFF00CBFF00D5FF000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000000C1
        FA8CE8F9CFF7F8B7E6EEE3FFFEEFFFFFA2EDFC3DD2F700C7FF00CDFF00000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000CEFF24C6EFDDFFFFB0E8EF74BBD277BCD399D1E1C6EDF3EFFFFFDAFE
        FF75E1FA14C9FC00C9FF00CEFF00000000000000000000000000000000000000
        000000000000000000000000BBF397EEF9D0FFFFD1FFFFCEFFFEADE5EE88C9DB
        73B7D07BBCD2A4D8E5D5F5F8F5FFFFB0F1FD4AD6F800CAFF00CFFF00BDFF0000
        0000000000000000000000000000000000A8E219C0ECCAFFFF80CADB97DAE7B7
        F2F6D2FFFFD6FFFFC9F9FBA3DCE87DBFD570B5CE82C1D5B2DEE8E8FFFDEDFFFF
        22CAF600D8FF00000000000000000000000000000000000000B8F567DCF2C2FF
        FF90DAE774C2D66AB8D273BED594D7E5B7EFF4D4FFFFDAFFFFC1F1F699D4E272
        B8D19ED3E289E6FB00BFFD000000000000000000000000000000000000000000
        00B3EDACFCFDBBFFFFBEFFFFC2FFFFB0F4F794DCE775C1D667B7CF6FBBD290D5
        E4B4F1F9CAF0EEBEDAD9B1D8DB05AEDF00000000000000000000000000000000
        000000000000000021BFE5ACFBFB6CC3D882D6E39BE9F1B7FFFEC2FFFFC6FFFF
        B5F8FA97E1ED7799A67B7073776869776E6F736A6A6F605F6D5F5F726C6C0000
        0000000000000000000000000000A8D94ED3ECACFFFF84DDE86FC9DA60B8D160
        B9D073C7DA8EDDE8AAEFF39A8F8E8F7C7CABA6A5D4CBC2E2D4C4DED2C4C5C2BF
        8A8B8B696868706E6E00000000000000000000000000A4DA77E8F6A9FFFFAAFF
        FFADFFFFA9FDFD93E8F07CD3E265C1D78C83889E8E8EDCD0C3FFE7C8FFE1C1FF
        E3C5FFE4C7FFE1C0FFE8CFB4B4B36D6B6B706E6E000000000000000000009ED6
        97FEFF69CDDE70D2E185E3EC9CF6FAADFFFFB0FFFFACC8C7A38889E2D4C4FFE4
        C6FFE1C5FFE1C5FFE0C3FFDFC1FFE2C7FFE5CDFFE7C8AFAFAE686666696A6A00
        000000000005A6D7A4FFFF7CE1EC67CCDD56BBD355B9D05CBCD36FD3E3A78889
        C7BAB6FFE6C9FFE5CDFFE5CEFFE6CFFFE7CFFFE6CCFFE1C4FFE1C4FFE6CEFDE6
        D27D7D7E6A66660000000000001FB3DBA9FFFFA1FFFFA0FFFF9CFFFF8DF2F67B
        E0EA74C3D0B18888EAD9C7FFEAD5FFE9D5FFEBD8FFEFDCB4A698CCB8A7FFE8CF
        FFE1C5FFE5CCFFE5C6ADACAB6C666600000000000002AADF23BBE043CAE666E0
        F08AF5FBA3FFFFA2FFFFA8E2E0BB9697F7E0C9FFF4EAFFEFE1FFF1E2D9CBBF78
        7A7C585757F2DBC6FFE7CEFFE2C7FFE4C8C9C3BF6E6868000000000000000000
        00000000A9DC00A6E000A4DE02ABE021BAE15BB9CFC39C9CF8E2CBFFF7F0FFF7
        EEFFFCF176716E535353383838887E76EBD4C0FFE5C9FFE6CAC8C2BD74696900
        000000000000000000000000000000000000000000000000BFFF659CB5C29291
        F4E2CEFFF9F2FFFFFC8D8A87383838FFF5EBEEE2D5313132847A71FFEAD0FFE9
        CEAEA9A77A6D6D00000000000000000000000000000000000000000000000000
        0000000000CC9797E1CECAFFF1DBADABAA292A2BF1EDEBFFFAF3FFF6EAEEDFD0
        D5C5B5FFE9D0F6E2CF8F85848274740000000000000000000000000000000000
        00000000000000000000000000D7A4A4C69B9CFEEDDBDACEC3DADBDAFFFFFFFF
        F9F3FFF4EAFFF0E0FFECD8FFE9D0B6ADAB8A7575867777000000000000000000
        000000000000000000000000000000000000000000000000D29C9CCBA7A8FDEC
        DEFFEED8FFF9F0FFF8F2FFF5ECFFEEDCFAE3CDBFB4B0947D7E9E878700000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000D49D9DC49596D7C0C0E9D5C8F0DFCEE9D9C9D0C1B9AD9A9A9E7E7FAA8A
        8A00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000CF9A9ABE8F8FBA8C8CB68A8BB08788AA8686
        A68585B586860000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
    end
    object cciDates: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = #1042#1099#1073#1088#1072#1085#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
      Visible = ivNever
      Control = paDates
    end
    object bbClear: TdxBarButton
      Action = aClearDates
      Category = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000206B0030AAE0000A600000000000000
        00000000000000000000A700009A0000A70000000000000000000000000000A9
        1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
        B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
        00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
        1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
        F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
        52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
        0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
        AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
        5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
        0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
        A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
        6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
        0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
        C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
        13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
        000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
        FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
        00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
        0000000000000000CF0000C00000CE0000000000000000000000000000C40001
        B80000B500000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object bbSnimki: TdxBarButton
      Action = aSnimki
      Category = 0
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D4D1949391C1C1
        C1D0D0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F6FF
        4F74F3A7A5A3B4B2B1888787CCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF2F4FF4671FF2E7CFF58AAEDF4F0EBB4B3B2BABABAFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF1F3FF4270FF337FFF56B6FF65D3FF6DBDF0C1BAB4A4A4A3FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFEFF2FF3F6DFF3481FF57B6FF6BD2FF5DC0FF3C92
        FF4872DFC1BFBAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECEFFF3A67EF3685FF58B9FF6BD2FF
        5CBFFF4193FF306AFFD9E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCECD7A7B85296CD458
        B9FF6BD3FF5BBCFF3E91FF3169FFDDE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF2F2F2BFBFC09F9FA1959698A4A5A6D0D0D0FCFCFCCFCF
        CFB2AFAC9AA5A958B8E759BBFF3D8FFF356AFFE0E6FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFCFCFCB2B3B47A7B81A9A093D1BC9CDDC5A1CDBBA0
        9F9C9A7274796A6B6BB6B6B6FBF7F492A2AB2C76DF3567F6E4E9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB959698A39C91ECCA91F5CE90F2
        CE95F2D19EF2D09AF2C887ECCFA47174789E9FA0C3C2C2C0BDB76D7699E7EBFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B3B4A89F91F6D0
        93EFCE95EECD93EECB92EDC98DEECB92F2D4A7F2D29DF4CE936F717568696ABF
        BFBFCAC9C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8E8
        89898AF4D59AF1D39EF0D39FF0D39FF0D39EEFD19AEECE95EDC88CF0D2A1F1D2
        9EE9CDA57A7D80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFB9B9BBBFB094F6DBA5F1DAA8F1DBAAF1DBAAF1DBA9F1D6A6F0D39E
        EFD099EECA8EF2D7AEF3CB8D8E8E8EE6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF9D9EA2E4CDA2F7E1B4F5E1B5F7E2B7F5E1B6F3
        E0B1F3DCB0F1DBA9F0D3A2EFD099EFD09CF4D49FBBAD96BEBEBFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95969AF1DCAFF6E7BEF7EA
        C7FAEFCDF7EBC9F7E7C1F5E2B7F3DDB0F1DBA9F0D39EEFD096F5D8A8CAB798B0
        B0B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A1A5
        EAD9B0F9EECEFCF4D9FAF0D3FAF1D0F8EDC9F7E9C3F5E2B7F3DCADF1D6A4EFD1
        98F5D8A6BDB094BABBBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFBFC0C1C9BFA2FFF5D9FBF8E4FCFAEFFDFCEFFBF1D4F8EECCF7E8BE
        F3DFB1F1DBA8F0D19EF8D69F97918ADBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E59D9B92FFF9D8FDFBEAFFFEF8FDFDF6FC
        F6DCFBF1D3F7E8C1F5E1B4F1DBA9F3D7A3EACE9E7F8185FDFDFDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B9C3BDA9FFFF
        E7FDFDEEFEFCECFCF7E1FCF3D6F7E8C1F6E2B7F4DBA9F6D8A094938DCCCCCCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F8F8F8ACACAFC0BBAAFFFFE4FFFCE2FDF5DAF9EDC9FAE8BDF9E4B2F1D8A89B96
        90A7A8A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF9F9F9BDBDBE9C9B96C6C0AAE6DAB8EDDFB8DCCCAA
        B9B09A858687BBBCBCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE3E4E4BFBFC0A0
        A1A496979B9E9FA2B9B9BBECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      PaintStyle = psCaptionGlyph
    end
    object chMrt: TcxBarEditItem
      Caption = #1053#1077' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1052#1056#1058
      Category = 0
      Hint = #1053#1077' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1052#1056#1058
      Visible = ivAlways
      ShowCaption = True
      Width = 100
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
      Properties.OnEditValueChanged = chMrtPropertiesEditValueChanged
    end
    object bbCD: TdxBarButton
      Action = aCD
      Category = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5F5C0BABBA39B9AA1
        9B999D9897949192B3B2B3F4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE4DCDCB6A7A2EDEBD4FFFFF5FFFFFDFFFFFFFFFFFFE6E5D8918F8CD2D2
        D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7DDDECDB9A8FFFBD3FFFFE0FFFFE8FF
        FFF1FFFFFEFFFFF6FFFFEFFFFFEEA5A398CFD0D0FFFFFFFFFFFFFFFFFFF7F4F5
        C9AEA2FFE5B4FFE8C0FFF5D2FFFFE2FFFFF0FFFFFDFFFFF1FFFFE7FFFFDFFFFF
        DA938D87F1F1F1FFFFFFFFFFFFD4C5C7F9C89BFFD3A1FFDAACFFE7BCFFFFE8FC
        FDF9FCFBFCFFFFF4FFFEDBFFF1CAFFE9C0EAD0ABADADB0FFFFFFFFFFFFD2B4AE
        FFD099FFCC99FFCB97FFE4C3E8E8EDE0DEDFE1DFDFE3E3E6FFF4DAFFDDB1FFD7
        A9FFDDA7938D8AFFFFFFFFFFFFDAB4A4FFCE99FFCC99FFCA93FFF4EBE2E3E4FF
        FFFFFFFFFFE3E4E5FBF4EDFFC993FFCB98FFD29B9C8B7FFFFFFFFFFFFFDFB7A7
        FFCD98FFCB98FFCA92FDF4ECE3E4E5FFFFFFFFFFFFE5E6E7FBF4EEFFCA93FFCC
        99FFD39C9E8E82FFFFFFFFFFFFE2BEB8FFD4A1FFD7A8FFDCAFFFF3D9E5E7EAE5
        E5E5E5E5E6E3E4E8FFE8CAFFCB96FFCC99FFD39BA29793FFFFFFFFFFFFE8D2D4
        FCDCB3FFE6BCFFEFC9FFFDDAFFFFF4FBFBFBFBFAF9FFFFECFFE8BCFFDAACFFD2
        A1F0C296BEB8BBFFFFFFFFFFFFFDF8F8ECC8C0FFF8D1FFFFDBFFFFE5FFFFF0FF
        FFFDFFFFF0FFFFE3FFF5D2FFE8C0FFE6B5B4A096F6F5F5FFFFFFFFFFFFFFFFFF
        FFEEEFF1D9CAFFFFE7FFFFEDFFFFF4FEFEFDFFFFF3FFFFE8FFFFDFFFFAD3CBB5
        A5E4DEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEFEBCDC7F9F4E6FFFFFFFF
        FFFFFFFFF9FFFFF2F3EED6C7B5ADEAE2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEF9F9ECD6D7E2C5C5DFC5C5D9C1BFD3BBBBDCCDCEFAF8F8FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      PaintStyle = psCaptionGlyph
    end
  end
  object al: TActionList
    Images = IL
    Left = 40
    Top = 168
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 0
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aProtocol: TAction
      Caption = #1055#1088#1086#1090#1086#1082#1086#1083
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1087#1088#1086#1090#1086#1082#1086#1083' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      ImageIndex = 7
      ShortCut = 115
      OnExecute = aProtocolExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 6
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 2
      OnExecute = aTextExecute
    end
    object aWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 3
      OnExecute = aWebExecute
    end
    object aXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 4
      OnExecute = aXMLExecute
    end
    object aXLS: TAction
      Caption = 'Excel-'#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel-'#1092#1072#1081#1083
      ImageIndex = 5
      OnExecute = aXLSExecute
    end
    object aParam: TAction
      Caption = #1055#1077#1088#1080#1086#1076
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
      ShortCut = 118
      OnExecute = aParamExecute
    end
    object aClearDates: TAction
      Hint = #1059#1073#1088#1072#1090#1100' '#1091#1089#1083#1086#1074#1080#1077' '#1076#1072#1090
      ShortCut = 119
      OnExecute = aClearDatesExecute
    end
    object aSnimki: TAction
      Caption = #1057#1085#1080#1084#1082#1080
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1089#1085#1080#1084#1082#1080
      OnExecute = aSnimkiExecute
    end
    object aCD: TAction
      Caption = #1053#1072' '#1076#1080#1089#1082
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089#1085#1080#1084#1082#1080' '#1085#1072' '#1076#1080#1089#1082
      OnExecute = aCDExecute
    end
  end
  object IL: TImageList
    Left = 392
    Top = 184
    Bitmap = {
      494C010109000C004C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FDF1E500FDF1E500FFED
      D500FFE9CE00FFE3C500FEDEBC00FFDAB100FFD5A600FFD19F00FFCC9800FFD8
      A100BC4B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FBF3EA00FBF3EA00FFEF
      DC00FFEDD500FEE5CA00FFE3C500FFDAB100FFDAB100FFD5A600FFCC9800FFD8
      A100BC4B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FCF6F000FBF3EA00FDF1
      E500FFEDD500FFE9CE00FFE3C500FEDEBC00FFDAB100FED7AB00FFD5A600FFD5
      A600BC4B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FCF8F700FCF8F700FBF3
      EA00FDF1E500FFEDD500FEE5CA00FFE3C500FEDEBC00FFDAB100FFD8A100FED7
      AB00BC4B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FCF8F700FCF8F700FCF8
      F700FDF1E500FFEFDC00FFEDD500FEE5CA00FFE9C200DEC2B100DEBDA600FFE9
      B200BC4B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FCF8F700FCF8F700FCF8
      F700FCF8F700FBF3EA00FDF1E500FFF2D700D9C2C100090A9000090A9000D5BB
      AC00BC4B000000000000090A900000028F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FAEFE500FBF3EA00FBF3
      EA00FDF1E500FAE7D400FEE5CA00FFE3C500C1A5A700090A9000112DEA00090A
      900065416600090A90000622EB00000392000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000EF90370097543D00090A90001933
      E200090A9000122DE50000039200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B000045265800090A
      90003C66FF00090A900000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000090A9000354C
      E000090A90002C46E700090A9000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000090A90004F65E7000609
      900000000000090A90002C46E700060990000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000090A9000090A90000000
      000000000000000000000609900000028F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00FF000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086868600FFFFFF00F1F1F100FFFF
      FF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFF
      FF00F1F1F100FFFFFF0000000000FF00FF000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1
      F100FFFFFF00F1F1F10000000000FF00FF000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000086868600FFFFFF00F1F1F1009966
      3300996633009966330099663300996633009966330099663300996633009966
      3300F1F1F100FFFFFF0000000000FF00FF000000000000000000000000008484
      8400FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1
      F100FFFFFF00F1F1F10000000000FF00FF000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000008484840000000000FFFFFF000000
      00000000000000000000000000000000000086868600FFFFFF00F1F1F1009966
      3300996633009966330099663300996633009966330099663300996633009966
      3300F1F1F100FFFFFF0000000000FF00FF0000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000848484000000FF0084848400000000000000
      0000848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      00000000000000000000000000000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1
      F100FFFFFF00F1F1F10000000000FF00FF0000840000FFFFFF00008400000084
      0000008400000084000000840000008400000084000000840000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000000000008484
      8400000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000086868600FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF00800000008000000080000000FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF0000000000FF00FF0000840000FFFFFF00008400000084
      000000840000C6C6C60000840000008400000084000000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000008484840000000000000000000000000084848400000000000000
      000000000000000000000000000000000000FFFFFF0000000000848484000000
      00000000000000000000000000000000000086868600FFFFFF00F0CAA6009900
      0000FFFFFF00FF663300FF99330000993300FF00000080000000FFFFFF009900
      0000F0CAA600F1F1F10000000000FF00FF0000840000FFFFFF00FFFFFF000084
      0000C6C6C600008400000084000000840000FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000084848400000000000000
      00000000000000000000000000000000000086868600F0CAA60099000000FFFF
      FF00F1F1F10080800000FFFF3300FFCC33000099330080000000F1F1F100FFFF
      FF0099000000F0CAA60000000000FF00FF0000840000FFFFFF0000840000C6C6
      C600008400000084000000840000FFFFFF00FFFFFF0000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086868600FFFFFF00F0CAA6009900
      0000FFFFFF0080800000FFFFFF00FFFF3300FF99330080000000FFFFFF009900
      0000F0CAA600F1F1F10000000000FF00FF0000840000FFFFFF00C6C6C6000084
      000000840000008400000084000000840000FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086868600FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF008080000080800000FF663300FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF0000000000FF00FF0000840000FFFFFF00008400000084
      0000FFFFFF00FFFFFF000084000000840000FFFFFF0000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000084848400000000000000
      00000000000000000000000000000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF000000
      0000000000000000000000000000FF00FF0000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000848484000000
      00000000000000000000000000000000000086868600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F100FFFFFF00F1F1F100C0C0
      C000FFFFFF0086868600FF00FF00FF00FF000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000FFFFFF00FFFF
      FF0084848400FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086868600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00086868600FF00FF00FF00FF00FF00FF000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008686860086868600868686008686
      8600868686008686860086868600868686008686860086868600868686008686
      8600FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE8400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000007777
      7700555555005555550055555500555555005555550055555500555555005555
      5500555555005555550055555500000000000000000000000000000000008484
      84008484840084848400FFCE8400FF0000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000007777
      7700CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC005555550000000000000000000000000084848400FF00
      0000FF000000FF000000FF000000FF000000FF00000084848400848484000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000CC3333007777
      7700FFFFFF00EAEAEA00EAEAEA00D6E7E700D6E7E700EAEAEA00D6E7E700D6E7
      E700D6E7E700CCCCCC00555555000000000000000000FFDEAD00FF000000FF00
      0000FFCE8400FFCE8400FF000000FF000000FF000000FF000000848484000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C0000000000000000000000000000000000000000000CC333300000000000404
      040004040400996600009966000099660000EAEAEA00D6E7E700EAEAEA00D6E7
      E700D6E7E700CCCCCC005555550000000000FFDEAD00FF000000FF000000FF00
      00000000000000000000FFCE8400FF000000FF00000084848400000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C0000000000000000000000000000000000000808000CC33330066333300CC33
      3300FF663300FF663300FF663300FF66330099660000EAEAEA00D6E7E700EAEA
      EA00D6E7E700CCCCCC005555550000000000FFDEAD00FF000000848484000000
      00000000000000000000FFCE8400FF000000848484000000000000000000FF00
      0000848484000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000080800000808000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000005F5F5F006699990099330000FF66
      3300FF663300C0C0C000C0C0C000CC333300FF66330099660000EAEAEA00D6E7
      E700D6E7E700CCCCCC005555550000000000FFDEAD00FF000000848484000000
      00000000000000000000FFCE840084848400000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00000000000000000000000000000000000777777006699CC00CC663300FF66
      3300CC660000F0FBFF00F0FBFF00F1F1F100F0FBFF00EAEAEA00D6E7E700EAEA
      EA00D6E7E700CCCCCC005555550000000000FFDEAD00FF000000848484000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C00000000000000000000000000000000000000000007777770099CCFF00FF66
      3300CC660000CC660000CC660000CC660000CC660000CC660000EAEAEA00D6E7
      E700D6E7E700CCCCCC005555550000000000FFDEAD00FF000000848484000000
      00000000000000000000FF00000084848400000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C0000000000000000000000000000000000000000000800000006699990099FF
      FF00CC660000F0FBFF00F0FBFF00CC333300FFCC0000CC660000F1F1F100EAEA
      EA00D6E7E700CCCCCC00555555000000000000000000FFA5A500FF0000000000
      000000000000FF000000FF000000848484000000000000000000FF000000FF00
      0000848484000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000808000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000800000009999
      6600CCCC9900CC333300CC333300FFFF6600CC660000F1F1F100F0FBFF00EAEA
      EA00CCCCCC009999990055555500000000000000000000000000000000000000
      0000FF000000FF000000FF000000848484008484840084848400FF000000FF00
      0000848484000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000008000
      0000CC660000CC660000CC660000CC660000F0FBFF00FF663300F1F1F100CCCC
      CC0099999900777777005555550000000000000000000000000000000000FFCE
      8400FF000000FF000000FF000000FF000000FF000000FF000000FF0000008484
      8400000000000000000000000000000000000000000000000000008080000000
      0000000000000000000080800000000000008080000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000008686
      8600FFFFFF00F0FBFF00F0FBFF00CC660000CC660000F0FBFF00F0FBFF005555
      5500333333003333330033333300000000000000000000000000000000000000
      0000FFCE8400FF000000FF000000FFCE8400FFCE8400FFCE8400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080800000FFFFFF00000000000000000080800000000000000000
      00000000000000000000000000000000000080808000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000008686
      8600FFFFFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF009999
      9900FFFFFF005555550000000000000000000000000000000000000000000000
      000000000000FFCE8400FF000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080800000FFFFFF00FFFFFF00000000000000000080800000808000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      8000FFFFFF0080808000FFFFFF0080808000FFFFFF0080808000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008686
      8600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009999
      9900555555000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE8400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008686
      8600868686008686860086868600868686008686860086868600868686008686
      860000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      0007000000000000000700000000000000070000000000000007000000000000
      0007000000000000000700000000000000040000000000000000000000000000
      00010000000000008003000000000000FFC1000000000000FF88000000000000
      FF9C000000000000FFFF000000000000FFFEE000C00FFFFF0002E000C007FFF7
      0002E0008003FFE70002E000BFF3FFC700020000BFF3F00F00020000BE31E61F
      000200008001CE3F0002000080019F1F00020000C0019F9F00020000E001BFDF
      00020000F003AFDF00020000F00FAF9F001E0000F00F879F00000001F00FC3BF
      0000E003F007E77F0000E007F807F07FFFFFC001800FFFFFFC7F80310007E001
      E03F80310007E001C01F80310007C001801F80010007A0010C3F800100070001
      1C678001000700011CE38FF1000700011FE38FF1000780011CE38C7100078001
      98C78C710007C001F0078C710007E001E00F89350007E001F03F81810007E003
      F8FFE18F800FE007FCFFE00FD55FE00F00000000000000000000000000000000
      000000000000}
  end
  object frxList: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40091.574197453700000000
    ReportOptions.LastChange = 41313.431333692130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxListGetValue
    Left = 328
    Top = 288
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 105.826840000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 755.906000000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baWidth
          Top = 18.897650000000000000
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            
              #1056#8250#1056#1105#1057#1027#1057#8218' '#1056#187#1057#1107#1057#8225#1056#181#1056#1030#1056#1109#1056#8470' '#1056#1029#1056#176#1056#1110#1057#1026#1057#1107#1056#183#1056#1108#1056#1105'. '#1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218' [PACFIO' +
              ']')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 44.354360000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176#1057#1026#1056#1029#1056#176#1057#1039' '#1056#1169#1056#1109#1056#183#1056#176':')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 117.165430000000000000
          Top = 44.354360000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[DOZA]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Top = 71.811070000000000000
          Width = 34.015770000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 34.015770000000000000
          Top = 71.811070000000000000
          Width = 83.149660000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 117.165430000000000000
          Top = 71.811070000000000000
          Width = 332.598640000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 449.764070000000000000
          Top = 71.811070000000000000
          Width = 56.692950000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#183#1056#176' ('#1056#1112#1056#8212#1056#1030')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 506.457020000000000000
          Top = 71.811070000000000000
          Width = 120.944960000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#183#1056#1029#1056#176#1057#8225#1056#1105#1056#1030#1057#8364#1056#1105#1056#8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 627.401980000000000000
          Top = 71.811070000000000000
          Width = 128.504020000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#1027#1056#1111#1056#1109#1056#187#1056#1029#1056#1105#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 188.976500000000000000
          Top = 44.220472440944880000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1112#1056#8212#1056#1030)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 185.196970000000000000
        Width = 755.906000000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo12: TfrxMemoView
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 34.015770000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."FD_RUN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 117.165430000000000000
          Width = 332.598640000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 449.764070000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."DOZA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 506.457020000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."VFIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 627.401980000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."IFIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 264.567100000000000000
        Width = 755.906000000000000000
        object Memo16: TfrxMemoView
          Left = 529.134200000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Width = 529.134200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[MEDOTRADESIGN], [DATESYS]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = odsList
    BCDToCurrency = False
    Left = 328
    Top = 352
  end
  object PopupMenu1: TPopupMenu
    Images = IL
    Left = 672
    Top = 152
    object N1: TMenuItem
      Action = aPrint
    end
    object N3: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 1
      object N4: TMenuItem
        Action = aText
      end
      object Web1: TMenuItem
        Action = aWeb
      end
      object XML1: TMenuItem
        Action = aXML
      end
      object Excel1: TMenuItem
        Action = aXLS
      end
    end
    object N2: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 8
      OnClick = N2Click
    end
  end
  object sdPopUp: TSaveDialog
    Left = 673
    Top = 211
  end
  object frxRepProsmotr: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39299.753055555600000000
    ReportOptions.LastChange = 41351.359776412000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepProsmotrGetValue
    Left = 394
    Top = 287
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 153.669450000000000000
        Top = 16.000000000000000000
        Width = 748.346940000000000000
        Child = frxRepProsmotr.Child1
        StartNewPage = True
        Stretched = True
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 748.346940000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 58.031540000000000000
          Width = 113.400940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#164#1056#152#1056#1115' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 79.708720000000000000
          Width = 112.629870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 469.031850000000000000
          Top = 80.488250000000000000
          Width = 52.918330000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1114#1056#1113)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          Top = 32.133890000000000000
          Width = 748.346940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1057#8218#1056#1109#1056#1108#1056#1109#1056#187' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039' '#1074#8222#8211' [NUMISSL]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 107.724490000000000000
          Width = 748.346940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[NAMEISSL]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Align = baWidth
          Top = 132.622140000000000000
          Width = 748.346940000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            '[TEXTISSL]')
          ParentFont = False
          WordBreak = True
        end
        object Memo13: TfrxMemoView
          Left = 113.385900000000000000
          Top = 58.031540000000000000
          Width = 631.181510000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PACFIO]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 78.929190000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DATE_ROJD]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 525.724800000000000000
          Top = 80.708720000000000000
          Width = 219.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[NUMIB]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Align = baWidth
          Top = 16.118120000000000000
          Width = 748.346940000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[OTDELNAME]')
          ParentFont = False
        end
      end
      object Child1: TfrxChild
        Height = 64.000000000000000000
        Top = 188.000000000000000000
        Width = 748.346940000000000000
        object Memo9: TfrxMemoView
          Left = 3.779530000000000000
          Top = 0.756030000000000000
          Width = 109.760000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#173#1056#8221' = [DOZA] '#1056#1112#1056#8212#1056#1030)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Top = 27.212740000000000000
          Width = 146.655770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176': [DATEISSL]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 453.543600000000000000
          Top = 27.212740000000000000
          Width = 86.240000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#176#1057#8225': [SOTR]')
          ParentFont = False
        end
      end
    end
  end
  object odsListDates: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWNUM,'
      '       TNAZIS.FK_ID,'
      '       TNAZIS.FK_NAZSOSID, '
      
        '       DECODE(TNAZIS.FK_NAZSOSID, 1, '#39#1042#1067#1055'.'#39', -11, '#39#1042#1067#1055'. '#1056#1051#39') AS ' +
        'SOS,'
      '       TNAZIS.FK_SMID,'
      '       TNAZIS.FK_PACID, '
      '       TO_CHAR(TNAZIS.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       TNAZIS.FD_RUN AS DATE_RUN, '
      '       ASU.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS FC_NAME, '
      
        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = TNAZIS.' +
        'FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       ASU.GET_IB(TKARTA.FK_ID) AS NUMIB,'
      '       ASU.DO_VRACHFIO(FK_VRACHID) AS VFIO,'
      '       ASU.DO_VRACHFIO(FK_ISPOLID) AS IFIO,'
      '       TNAZIS.FC_TYPE,'
      '       asu.get_owner_from_smid(tnazis.fk_smid) as smowner,'
      '       0 as fk_type,'
      '       tnazis.fk_resultid'
      '  FROM ASU.TNAZIS, ASU.TKARTA'
      '  WHERE FK_SMID IN (SELECT FK_ID FROM ASU.TSMID'
      '                     WHERE FL_SHOWANAL = 1'
      '                       AND FL_SHOWPRINT = 1'
      '                    START WITH FK_ID = ASU.GET_RG_ISSL'
      '                    CONNECT BY PRIOR FK_ID = FK_OWNER)'
      '    AND TNAZIS.FK_NAZSOSID IN (ASU.GET_VIPNAZ, ASU.GET_LABVIP)'
      '    AND TNAZIS.FK_PACID = TKARTA.FK_ID'
      '    AND TKARTA.FK_PEPLID = ASU.GET_PEPLID(:PFK_PACID)'
      '    AND TNAZIS.FD_RUN >= :PDATE1'
      '    AND TNAZIS.FD_RUN <= :PDATE2'
      '    '
      'UNION ALL'
      ''
      'SELECT ROWNUM,'
      '       TNAZIS.FK_ID, '
      '       TNAZIS.FK_NAZSOSID,'
      
        '       DECODE(TNAZIS.FK_NAZSOSID, 1, '#39#1042#1067#1055'.'#39', -11, '#39#1042#1067#1055'. '#1056#1051#39') AS ' +
        'SOS,'
      '       TNAZIS.FK_SMID,'
      '       TNAZIS.FK_PACID,'
      '       TO_CHAR(TNAZIS.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       TNAZIS.FD_RUN AS DATE_RUN,'
      '       ASU.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS FC_NAME,  '
      
        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = TNAZIS.' +
        'FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       ASU.GET_IB(TAMBULANCE.FK_ID) AS NUMIB,'
      '       ASU.DO_VRACHFIO(FK_VRACHID) AS VFIO,'
      '       ASU.DO_VRACHFIO(FK_ISPOLID) AS IFIO,'
      '       TNAZIS.FC_TYPE,'
      '       asu.get_owner_from_smid(tnazis.fk_smid) as smowner,'
      '       1 as fk_type,'
      '       tnazis.fk_resultid '
      '  FROM ASU.TNAZIS, ASU.TAMBULANCE'
      '  WHERE FK_SMID IN (SELECT FK_ID FROM ASU.TSMID'
      '                     WHERE FL_SHOWANAL = 1'
      '                       AND FL_SHOWPRINT = 1 '
      '                    START WITH FK_ID = ASU.GET_RG_ISSL'
      '                    CONNECT BY PRIOR FK_ID = FK_OWNER)'
      '    AND TNAZIS.FK_NAZSOSID IN (ASU.GET_VIPNAZ, ASU.GET_LABVIP)'
      '    AND TNAZIS.FK_PACID = TAMBULANCE.FK_ID'
      '    AND TAMBULANCE.FK_PEPLID = ASU.GET_PEPLID(:PFK_PACID)'
      '    AND TNAZIS.FD_RUN >= :PDATE1'
      '    AND TNAZIS.FD_RUN <= :PDATE2'
      ''
      'UNION ALL'
      ''
      'SELECT ROWNUM,'
      '       VNAZ.FK_ID, '
      '       VNAZ.FK_NAZSOSID,'
      
        '       DECODE(VNAZ.FK_NAZSOSID, 1, '#39#1042#1067#1055'.'#39', -11, '#39#1042#1067#1055'. '#1056#1051#39') AS SO' +
        'S,'
      '       VNAZ.FK_SMID,'
      '       VNAZ.FK_PACID,'
      '       TO_CHAR(VNAZ.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       VNAZ.FD_RUN AS DATE_RUN,'
      '       ASU.GET_NAME_RGISSL(VNAZ.FK_SMID)||'#39':'#39'||'
      '       (select max(fc_char) '
      '          from asu.tib '
      '         where fk_pacid = vnaz.fk_id '
      '           and fk_smid in (select fk_id from asu.tsmid '
      
        '                           start with fc_synonim in ('#39'PROTHOPER_' +
        'NAME'#39', '#39'RENTGENXIR_NAME'#39', '#39'UROLOG_OPER'#39') connect by prior fk_id ' +
        '= fk_owner)) AS FC_NAME,  '
      
        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = VNAZ.FK' +
        '_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       ASU.GET_IB(VNAZ.FK_PACID) AS NUMIB,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_VRACHID) AS VFIO,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_ISPOLID) AS IFIO,'
      '       VNAZ.FC_TYPE,'
      '       asu.get_owner_from_smid(VNAZ.fk_smid) as smowner,'
      '       -1 as fk_type,'
      '       vnaz.fk_resultid     '
      '  from asu.vnaz'
      
        ' where vnaz.fk_pacid in (select fk_id from asu.tambulance where ' +
        'fk_peplid = asu.get_peplid(:PFK_PACID)'
      '                         union all '
      
        '                         select fk_id from asu.tkarta where fk_p' +
        'eplid = asu.get_peplid(:PFK_PACID))'
      
        '   and vnaz.fk_nazsosid not in (asu.get_pass_registrator, asu.ge' +
        't_pass_registrator_dd)'
      '   and vnaz.fk_smid in (select fk_id from asu.tsmid'
      '                         where fl_showanal = 1'
      
        '    '#9#9#9'   start with fc_synonim in ('#39'RENTGENXIR_OPER'#39', '#39'RENTGENX' +
        'IR_ISSLED'#39', '#39'UROLOG_OPER'#39')'
      #9#9#9'   connect by prior fk_id = fk_owner)'
      '    AND VNAZ.FD_RUN >= :PDATE1'
      '    AND VNAZ.FD_RUN <= :PDATE2'
      ''
      'UNION ALL'
      ''
      'SELECT ROWNUM,'
      '       VNAZ.FK_ID, '
      '       VNAZ.FK_NAZSOSID,'
      
        '       DECODE(VNAZ.FK_NAZSOSID, 1, '#39#1042#1067#1055'.'#39', -11, '#39#1042#1067#1055'. '#1056#1051#39') AS SO' +
        'S,'
      '       VNAZ.FK_SMID,'
      '       VNAZ.FK_PACID,'
      '       TO_CHAR(VNAZ.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       VNAZ.FD_RUN AS DATE_RUN,'
      '       ASU.GET_NAME_RGISSL(VNAZ.FK_SMID) AS FC_NAME,  '
      
        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = VNAZ.FK' +
        '_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       ASU.GET_IB(VNAZ.FK_PACID) AS NUMIB,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_VRACHID) AS VFIO,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_ISPOLID) AS IFIO,'
      '       VNAZ.FC_TYPE,'
      '       asu.get_owner_from_smid(VNAZ.fk_smid) as smowner,'
      '       -1 as fk_type,'
      '       vnaz.fk_resultid     '
      '  from asu.vnaz'
      
        ' where vnaz.fk_pacid in (select fk_id from asu.tambulance where ' +
        'fk_peplid = asu.get_peplid(:PFK_PACID)'
      '                         union all '
      
        '                         select fk_id from asu.tkarta where fk_p' +
        'eplid = asu.get_peplid(:PFK_PACID))'
      
        '   and vnaz.fk_nazsosid not in (asu.get_pass_registrator, asu.ge' +
        't_pass_registrator_dd)'
      '   and vnaz.fk_smid in (select fk_id from asu.tsmid'
      '                         where fl_showanal = 1'
      '    '#9#9#9'   start with fc_synonim = '#39'ISL_ONKOLOG'#39
      #9#9#9'   connect by prior fk_id = fk_owner)'
      '    AND VNAZ.FD_RUN >= :PDATE1'
      '    AND VNAZ.FD_RUN <= :PDATE2'
      ''
      'UNION ALL'
      ''
      'SELECT ROWNUM,'
      '       VNAZ.FK_ID, '
      '       VNAZ.FK_NAZSOSID,'
      
        '       DECODE(VNAZ.FK_NAZSOSID, 1, '#39#1042#1067#1055'.'#39', -11, '#39#1042#1067#1055'. '#1056#1051#39') AS SO' +
        'S,'
      '       VNAZ.FK_SMID,'
      '       VNAZ.FK_PACID,'
      '       TO_CHAR(VNAZ.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       VNAZ.FD_RUN AS DATE_RUN,'
      '       ASU.GET_NAME_RGISSL(VNAZ.FK_SMID)||'#39':'#39'||'
      '       (select max(fc_char) '
      '          from asu.tib '
      '         where fk_pacid = vnaz.fk_id '
      '           and fk_smid in (select fk_id from asu.tsmid '
      
        '                           start with fc_synonim in ('#39'PROTHOPER_' +
        'NAME'#39', '#39'RENTGENXIR_NAME'#39') connect by prior fk_id = fk_owner)) AS' +
        ' FC_NAME,  '
      
        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = VNAZ.FK' +
        '_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       ASU.GET_IB(VNAZ.FK_PACID) AS NUMIB,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_VRACHID) AS VFIO,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_ISPOLID) AS IFIO,'
      '       VNAZ.FC_TYPE,'
      '       asu.get_owner_from_smid(VNAZ.fk_smid) as smowner,'
      '       -1 as fk_type,'
      '       vnaz.fk_resultid     '
      '  from asu.vnaz'
      
        ' where vnaz.fk_pacid in (select fk_id from asu.tambulance where ' +
        'fk_peplid = asu.get_peplid(:PFK_PACID)'
      '                         union all '
      
        '                         select fk_id from asu.tkarta where fk_p' +
        'eplid = asu.get_peplid(:PFK_PACID))'
      
        '   and vnaz.fk_nazsosid not in (asu.get_pass_registrator, asu.ge' +
        't_pass_registrator_dd)'
      '   and vnaz.fk_smid in (select fk_id from asu.tsmid'
      '                         where fl_showanal = 1'
      '    '#9#9#9'   start with fk_id = asu.get_oper_aritmolog'
      #9#9#9'   connect by prior fk_id = fk_owner)'
      '    AND VNAZ.FD_RUN >= :PDATE1'
      '    AND VNAZ.FD_RUN <= :PDATE2'
      ''
      'UNION ALL'
      ''
      'SELECT ROWNUM, -- '#1091#1088#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      '       VNAZ.FK_ID, '
      '       VNAZ.FK_NAZSOSID,'
      
        '       DECODE(VNAZ.FK_NAZSOSID, 1, '#39#1042#1067#1055'.'#39', -11, '#39#1042#1067#1055'. '#1056#1051#39') AS SO' +
        'S,'
      '       VNAZ.FK_SMID,'
      '       VNAZ.FK_PACID,'
      '       TO_CHAR(VNAZ.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       VNAZ.FD_RUN AS DATE_RUN,'
      '       ASU.GET_NAME_RGISSL(VNAZ.FK_SMID) AS FC_NAME,  '
      
        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = VNAZ.FK' +
        '_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       ASU.GET_IB(VNAZ.FK_PACID) AS NUMIB,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_VRACHID) AS VFIO,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_ISPOLID) AS IFIO,'
      '       VNAZ.FC_TYPE,'
      '       asu.get_owner_from_smid(VNAZ.fk_smid) as smowner,'
      '       -1 as fk_type,'
      '       vnaz.fk_resultid     '
      '  from asu.vnaz'
      
        ' where vnaz.fk_pacid in (select fk_id from asu.tambulance where ' +
        'fk_peplid = asu.get_peplid(:PFK_PACID)'
      '                         union all '
      
        '                         select fk_id from asu.tkarta where fk_p' +
        'eplid = asu.get_peplid(:PFK_PACID))'
      
        '   and vnaz.fk_nazsosid not in (asu.get_pass_registrator, asu.ge' +
        't_pass_registrator_dd)'
      '   and vnaz.fk_smid in (select fk_id from asu.tsmid'
      '                         where fl_showanal = 1'
      '    '#9#9#9'        start with fc_synonim = '#39'ISSLED_UROLOG'#39
      #9#9#9'            connect by prior fk_id = fk_owner)'
      '   AND VNAZ.FD_RUN >= :PDATE1'
      '   AND VNAZ.FD_RUN <= :PDATE2'
      ''
      'UNION ALL'
      ''
      'SELECT ROWNUM, -- '#1088#1072#1076#1080#1086#1085#1091#1082#1083#1080#1076#1085#1072#1103' '#1076#1080#1072#1075#1085#1086#1089#1090#1080#1082#1072
      '       VNAZ.FK_ID, '
      '       VNAZ.FK_NAZSOSID,'
      
        '       DECODE(VNAZ.FK_NAZSOSID, 1, '#39#1042#1067#1055'.'#39', -11, '#39#1042#1067#1055'. '#1056#1051#39') AS SO' +
        'S,'
      '       VNAZ.FK_SMID,'
      '       VNAZ.FK_PACID,'
      '       TO_CHAR(VNAZ.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') AS FD_RUN, '
      '       VNAZ.FD_RUN AS DATE_RUN,'
      '       FC_NAME,  '
      
        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = VNAZ.FK' +
        '_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA,'
      '       ASU.GET_IB(VNAZ.FK_PACID) AS NUMIB,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_VRACHID) AS VFIO,'
      '       ASU.DO_VRACHFIO(VNAZ.FK_ISPOLID) AS IFIO,'
      '       VNAZ.FC_TYPE,'
      '       asu.get_owner_from_smid(VNAZ.fk_smid) as smowner,'
      '       0 as fk_type,'
      '       vnaz.fk_resultid     '
      '  from asu.vnaz'
      
        ' where vnaz.fk_pacid in (select fk_id from asu.tambulance where ' +
        'fk_peplid = asu.get_peplid(:PFK_PACID)'
      '                         union all '
      
        '                         select fk_id from asu.tkarta where fk_p' +
        'eplid = asu.get_peplid(:PFK_PACID))'
      '   and vnaz.fk_nazsosid in (asu.get_vipnaz, asu.get_labvip)'
      '   and vnaz.fk_smid in (select fk_id from asu.tsmid'
      '                         where fl_showanal = 1'
      '    '#9#9#9'   start with fc_synonim = '#39'ISL_RADIONUCLEAR'#39
      #9#9#9'   connect by prior fk_id = fk_owner)'
      '   AND VNAZ.FD_RUN >= :PDATE1'
      '   AND VNAZ.FD_RUN <= :PDATE2'
      ''
      'ORDER BY DATE_RUN DESC  ')
    Optimize = False
    Variables.Data = {
      03000000030000000A0000003A50464B5F504143494403000000000000000000
      0000070000003A5044415445310C0000000000000000000000070000003A5044
      415445320C0000000000000000000000}
    Cursor = crSQLWait
    Session = os
    AfterScroll = odsListDatesAfterScroll
    Left = 448
    Top = 128
  end
  object frxListDates: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40091.574197453700000000
    ReportOptions.LastChange = 41313.433779212970000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxListDatesGetValue
    Left = 272
    Top = 288
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 105.826840000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 755.906000000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baWidth
          Top = 18.897650000000000000
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            
              #1056#8250#1056#1105#1057#1027#1057#8218' '#1056#187#1057#1107#1057#8225#1056#181#1056#1030#1056#1109#1056#8470' '#1056#1029#1056#176#1056#1110#1057#1026#1057#1107#1056#183#1056#1108#1056#1105'. '#1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218' [PACFIO' +
              ']. '#1056#1119#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1057#1027' [PDATE1] '#1056#1111#1056#1109' [PDATE2]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 44.354360000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176#1057#1026#1056#1029#1056#176#1057#1039' '#1056#1169#1056#1109#1056#183#1056#176':')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 117.165430000000000000
          Top = 44.354360000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[DOZA]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Top = 71.811070000000000000
          Width = 34.015770000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 34.015770000000000000
          Top = 71.811070000000000000
          Width = 83.149660000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 117.165430000000000000
          Top = 71.811070000000000000
          Width = 332.598640000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 449.764070000000000000
          Top = 71.811070000000000000
          Width = 56.692950000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#183#1056#176' ('#1056#1112#1056#8212#1056#1030')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 506.457020000000000000
          Top = 71.811070000000000000
          Width = 120.944960000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#183#1056#1029#1056#176#1057#8225#1056#1105#1056#1030#1057#8364#1056#1105#1056#8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 627.401980000000000000
          Top = 71.811070000000000000
          Width = 128.504020000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#1027#1056#1111#1056#1109#1056#187#1056#1029#1056#1105#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 188.976500000000000000
          Top = 44.220472440944900000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1112#1056#8212#1056#1030)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 185.196970000000000000
        Width = 755.906000000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo12: TfrxMemoView
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 34.015770000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."FD_RUN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 117.165430000000000000
          Width = 332.598640000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 449.764070000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."DOZA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 506.457020000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."VFIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 627.401980000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."IFIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 264.567100000000000000
        Width = 755.906000000000000000
        object Memo16: TfrxMemoView
          Left = 529.134200000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Width = 529.134200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[MEDOTRADESIGN], [DATESYS]')
          ParentFont = False
        end
      end
    end
  end
  object frxXrayOperProt: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39299.753055555600000000
    ReportOptions.LastChange = 41351.355268321750000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxXrayOperProtGetValue
    Left = 477
    Top = 288
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 313.700990000000000000
        Width = 755.906000000000000000
        object Memo5: TfrxMemoView
          Left = 502.677490000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Width = 502.677490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[MEDOTRADESIGN]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 234.330860000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        AllowSplit = True
        StartNewPage = True
        Stretched = True
        object Memo8: TfrxMemoView
          Align = baWidth
          Top = 145.826840000000000000
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            '[TEXTISSL]')
          ParentFont = False
          WordBreak = True
        end
        object Memo10: TfrxMemoView
          Left = 75.590600000000000000
          Top = 204.637910000000000000
          Width = 59.726580000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 755.906000000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Align = baWidth
          Top = 16.456710000000000000
          Width = 755.906000000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[OTDELNAME]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Align = baWidth
          Top = 32.236240000000000000
          Width = 755.906000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clTeal
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#160#1056#1115#1056#1118#1056#1115#1056#1113#1056#1115#1056#8250)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 113.165430000000000000
          Top = 59.692950000000000000
          Width = 638.740570000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSetName = 'Customers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PACFIO]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 3.779530000000000000
          Top = 59.692950000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218)
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 113.165430000000000000
          Top = 82.811070000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DataSetName = 'Customers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DATE_ROJD]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 3.779530000000000000
          Top = 82.811070000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 646.299630000000000000
          Top = 82.590600000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSetName = 'Customers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[NUMIB]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 578.268090000000000000
          Top = 82.590600000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1114#1056#1113)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Top = 113.606370000000000000
          Width = 755.906000000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[NAMEISSL]')
          ParentFont = False
          VAlign = vaCenter
        end
        object mLb: TfrxMemoView
          Left = 75.590600000000000000
          Top = 173.858380000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#183#1056#176)
          ParentFont = False
        end
        object mDoza: TfrxMemoView
          Left = 139.842610000000000000
          Top = 173.858380000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSetName = 'Customers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[DOZA]')
          ParentFont = False
        end
        object mMzv: TfrxMemoView
          Left = 249.448980000000000000
          Top = 173.858380000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1112#1056#8212#1056#1030)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 139.842610000000000000
          Top = 204.094620000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DataSetName = 'Customers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DATEISSL]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 415.748300000000000000
          Top = 204.094620000000000000
          Width = 59.726580000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#176#1057#8225)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 480.000310000000000000
          Top = 204.094620000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DataSetName = 'Customers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[SOTR]')
          ParentFont = False
        end
      end
    end
  end
  object ilCntImage: TImageList
    Left = 432
    Top = 184
    Bitmap = {
      494C010102004C00FC0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF00000000000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000000000000000FFFF
      FF00000000000000000000000000848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFE0F00000000FFFFCFE700000000
      FFFFF00100000000FFFF800000000000FFFF800000000000FFFFC00000000000
      FFFF800000000000FFFFC00000000000FFFF81C100000000FFFFC1C700000000
      FFFF660F00000000FFFF73FE00000000FFFF71FC00000000FFFF387000000000
      FFFF1C0000000000FFFF8FC00000000000000000000000000000000000000000
      000000000000}
  end
  object frxHTMLExport1: TfrxHTMLExport
    ShowDialog = False
    UseFileCache = True
    ShowProgress = False
    OverwritePrompt = False
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Print = False
    Left = 400
    Top = 336
  end
  object rvs: TRVStyle
    TextStyles = <
      item
        StyleName = 'Normal text'
        Charset = RUSSIAN_CHARSET
        FontName = 'Courier New'
        HoverUnderlineColor = clBlack
      end>
    ParaStyles = <
      item
        StyleName = 'Paragraph Style'
        Tabs = <>
      end
      item
        StyleName = 'Centered'
        Alignment = rvaCenter
        Tabs = <>
      end
      item
        StyleName = 'Left'
        Tabs = <>
      end>
    ListStyles = <>
    DefCodePage = 1251
    InvalidPicture.Data = {
      07544269746D617036100000424D361000000000000036000000280000002000
      0000200000000100200000000000001000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800080808000808080008080800080808000808080008080
      800080808000808080008080800080808000808080008080800080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000}
    StyleTemplates = <>
    Left = 280
    Top = 88
  end
end
