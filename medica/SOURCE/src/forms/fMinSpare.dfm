object frmMinSpare: TfrmMinSpare
  Left = 237
  Top = 142
  HelpContext = 6
  Caption = #1056#1072#1089#1095#1077#1090' '#1087#1086#1090#1088#1077#1073#1085#1086#1089#1090#1077#1081
  ClientHeight = 629
  ClientWidth = 1111
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnHelp = FormHelp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 1111
    Height = 589
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object sb: TStatusBar
      Left = 0
      Top = 570
      Width = 1111
      Height = 19
      Panels = <
        item
          Width = 300
        end
        item
          Width = 300
        end
        item
          Width = 50
        end>
    end
    object grMinSpare: TcxGrid
      Left = 0
      Top = 0
      Width = 1111
      Height = 544
      Align = alClient
      TabOrder = 1
      object cxGridDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsMinSpare
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
            Kind = skSum
            Column = cxGridDBTableViewFN_SUMM
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.ContentEven = dmMain.cxStyleGridEvenRow
        Styles.ContentOdd = dmMain.cxStyleGridOddRow
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        object cxGridDBColumnNUM: TcxGridDBColumn
          Caption = #8470' '#1087'/'#1087
          DataBinding.FieldName = 'NUM'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 37
        end
        object cxGridDBColumnFC_MEDICNAME: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_MEDICNAME'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 117
        end
        object cxGridDBColumnFC_international_name: TcxGridDBColumn
          Caption = #1052#1053#1053
          DataBinding.FieldName = 'fc_international_name'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 117
        end
        object cxGridDBColumnFC_EDIZM: TcxGridDBColumn
          Caption = #1045#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'FC_EDIZM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 57
        end
        object cxGridDBColumnFC_FINSOURCE: TcxGridDBColumn
          Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
          DataBinding.FieldName = 'FC_FINSOURCE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 82
        end
        object cxGridDBColumnFC_UCHGR: TcxGridDBColumn
          Caption = #1059#1095#1077#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
          DataBinding.FieldName = 'FC_UCHGR'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 82
        end
        object cxGridDBColumnFN_AVGRASHMONTH: TcxGridDBColumn
          Caption = #1057#1088#1077#1076#1085#1077#1084#1077#1089#1103#1095#1085#1099#1081' '#1088#1072#1089#1093#1086#1076
          DataBinding.FieldName = 'FN_AVGRASHMONTH'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.AssignedValues.MinValue = True
          Properties.ReadOnly = True
          Properties.ValueType = vtFloat
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 82
        end
        object cxGridDBColumnFN_RASHPERIOD: TcxGridDBColumn
          Caption = #1056#1072#1089#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076
          DataBinding.FieldName = 'FN_RASHPERIOD'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.AssignedValues.MinValue = True
          Properties.ReadOnly = True
          Properties.ValueType = vtFloat
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 82
        end
        object cxGridDBColumnFN_KOLOST: TcxGridDBColumn
          Caption = #1053#1072#1083#1080#1095#1080#1077
          DataBinding.FieldName = 'FN_KOLOST'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.AssignedValues.MinValue = True
          Properties.ReadOnly = True
          Properties.ValueType = vtFloat
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 82
        end
        object cxGridDBColumnFN_MONTHLACK: TcxGridDBColumn
          Caption = #1053#1077#1093#1074#1072#1090#1082#1072' '#1085#1072' '#1084#1077#1089#1103#1094
          DataBinding.FieldName = 'FN_MONTHLACK'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.AssignedValues.MinValue = True
          Properties.ReadOnly = True
          Properties.ValueType = vtFloat
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 82
        end
        object cxGridDBColumnFN_PERIODLACK: TcxGridDBColumn
          Caption = #1053#1077#1093#1074#1072#1090#1082#1072' '#1085#1072' '#1087#1077#1088#1080#1086#1076
          DataBinding.FieldName = 'FN_PERIODLACK'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.AssignedValues.MinValue = True
          Properties.ReadOnly = True
          Properties.ValueType = vtFloat
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 82
        end
        object cxGridDBColumnFN_MINZAPAS: TcxGridDBColumn
          Caption = #1052#1080#1085'. '#1079#1072#1087#1072#1089
          DataBinding.FieldName = 'FN_MINZAPAS'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 82
        end
        object cxGridDBColumnFN_NEEDTOBUY: TcxGridDBColumn
          Caption = #1047#1072#1103#1074#1083#1077#1085#1086
          DataBinding.FieldName = 'FN_NEEDTOBUY'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.AssignedValues.MinValue = True
          Properties.DisplayFormat = '### ### ##0.#########'
          Properties.ImmediatePost = True
          Properties.MaxValue = 99999999.000000000000000000
          Properties.ValueType = vtFloat
          Properties.OnEditValueChanged = cxGridDBColumnFN_NEEDTOBUYPropertiesEditValueChanged
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 82
        end
        object cxGridDBColumnFN_LASTPRICE: TcxGridDBColumn
          Caption = #1055#1086#1089#1083'. '#1094#1077#1085#1072', '#1088
          DataBinding.FieldName = 'FN_PRICE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.AssignedValues.MinValue = True
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.MaxValue = 999999999.000000000000000000
          Properties.UseThousandSeparator = True
          Width = 82
        end
        object cxGridDBTableViewFN_SUMM: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072
          DataBinding.FieldName = 'FN_SUMM'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.UseThousandSeparator = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 82
        end
        object cxGridDBColumnCorrrect: TcxGridDBColumn
          Caption = #1054#1090#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1085#1086
          DataBinding.FieldName = 'FC_CORRECT'
          PropertiesClassName = 'TcxTextEditProperties'
          VisibleForCustomization = False
          Width = 82
        end
        object cxGridDBColumnFC_ATC: TcxGridDBColumn
          Caption = #1040#1058#1061
          DataBinding.FieldName = 'FK_ATC'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = dmMain.dsATC
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
        end
        object cxGridDBColumnFC_ATC_ROOT: TcxGridDBColumn
          Caption = #1043#1088#1091#1087#1087#1072' '#1040#1058#1061
          DataBinding.FieldName = 'FK_ATC_ROOT'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = dmMain.dsATC
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
        end
        object cxGridDBColumnFC_FARM: TcxGridDBColumn
          Caption = #1060#1072#1088#1084#1072#1082'. '#1075#1088#1091#1087#1087#1072
          DataBinding.FieldName = 'FARMGRID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'FARMGRID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_FARMGR'
            end>
          Properties.ListSource = dmMain.dsFarmGr
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 70
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 544
      Width = 1111
      Height = 26
      Align = alBottom
      TabOrder = 2
      object cbEmpMov: TcxCheckBox
        Left = 9
        Top = 2
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1091#1083#1077#1074#1086#1077' '#1076#1074#1080#1078#1077#1085#1080#1077
        TabOrder = 0
        OnClick = cbEmpMovClick
        Width = 208
      end
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 1111
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 1105
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 1098
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 85
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton2: TToolButton
        Left = 0
        Top = 0
        Action = acFilter
      end
      object ToolButton7: TToolButton
        Left = 85
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbuPrintZakup: TToolButton
        Left = 93
        Top = 0
        Action = acPrintZakup
      end
      object tbuSaveToXls: TToolButton
        Left = 178
        Top = 0
        Action = acSaveToXls
        Caption = #1054#1090#1095#1077#1090' '#1074' Excel'
        ImageIndex = 32
      end
      object ToolButton6: TToolButton
        Left = 263
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 271
        Top = 0
        Action = acRefresh
      end
      object ToolButton3: TToolButton
        Left = 356
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 364
        Top = 0
        Action = acClose
      end
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 428
    Top = 186
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 1
      ShortCut = 32883
      OnExecute = acCloseExecute
    end
    object acFilter: TAction
      Caption = #1042#1099#1073#1086#1088' '#1087#1077#1088#1080#1086#1076#1072
      Hint = #1042#1099#1073#1086#1088' '#1087#1077#1088#1080#1086#1076#1072
      ImageIndex = 55
      ShortCut = 118
      OnExecute = acFilterExecute
    end
    object acSaveToXls: TAction
      Caption = #1042' Excel'
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1074' Microsoft Excel'
      ImageIndex = 44
      OnExecute = acSaveToXlsExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 15
      OnExecute = acRefreshExecute
    end
    object acSecret: TAction
      Caption = 'acSecret'
      Enabled = False
      ShortCut = 49232
      Visible = False
      OnExecute = acSecretExecute
    end
    object acPrintZakup: TAction
      Caption = #1054#1090#1095#1077#1090
      Hint = #1055#1077#1095#1072#1090#1100' '#1086#1090#1095#1077#1090#1072' '#1076#1083#1103' '#1079#1072#1082#1091#1087#1072
      ImageIndex = 32
      OnExecute = acPrintZakupExecute
    end
  end
  object odsMinSpare: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWNUM AS NUM,'
      '       '#1057'.*,'
      '       (NVL(FN_Price, 0) * NVL(FN_NeedToBuy, 0)) as FN_SUMM'
      '  FROM (SELECT CASE'
      '                 WHEN (B.FN_AVGRASHMONTH - B.FN_KOLOST) > 0 THEN'
      '                  (B.FN_AVGRASHMONTH - B.FN_KOLOST)'
      '                 ELSE'
      '                  NULL'
      '               END AS FN_MONTHLACK,'
      
        '               --  CASE WHEN (B.FN_AVGRASHMONTH - B.FN_KOLOST) >' +
        ' 0 THEN ROUND((B.FN_AVGRASHMONTH - B.FN_KOLOST) * B.FN_PRICE,2) ' +
        'ELSE NULL END AS FN_MONTHSUMM,'
      '               CASE'
      '                 WHEN (B.FN_RASHPERIOD - B.FN_KOLOST) > 0 THEN'
      '                  (B.FN_RASHPERIOD - B.FN_KOLOST)'
      '                 ELSE'
      '                  NULL'
      '               END AS FN_PERIODLACK,'
      
        '               --  CASE WHEN (B.FN_RASHPERIOD - B.FN_KOLOST) > 0' +
        ' THEN ROUND((B.FN_RASHPERIOD - B.FN_KOLOST) * B.FN_PRICE,2) ELSE' +
        ' NULL END AS FN_PERIODSUMM,  '
      '               B.*,'
      '               MZ.colvo as FN_MINZAPAS,'
      '               MZAK.FN_NeedToBuy,'
      
        '               ---  CASE WHEN (B.FN_AVGRASHMONTH + NVL(MZ.colvo,' +
        '0) - B.FN_KOLOST) > 0 THEN (B.FN_AVGRASHMONTH + NVL(MZ.colvo,0) ' +
        '- B.FN_KOLOST) ELSE NULL END as FN_NeedToBuy,'
      
        '               --  (SELECT K.FN_PRICE FROM (SELECT MAX(FN_PARTY_' +
        'NUM), FN_PRICE, MEDICID FROM MED.TKART  GROUP BY FN_PRICE, MEDIC' +
        'ID) K WHERE K.MEDICID = B.MEDICID) as FN_PRICE'
      '               ---  K2.FN_PRICE as FN_LastPrice '
      '               MZAK.FN_PRICE,'
      '               MZAK.FC_CORRECT,'
      '               MZAK.ROWID as ROW_ID'
      '          FROM MED.TMEDIC_ZAKUP MZAK,'
      '               (SELECT A.FC_NAME AS FC_MEDICNAME,'
      '                       A.MEDICID,'
      '                       A.FC_FINSOURCE,'
      '                       A.FC_UCHGR,'
      '                       A.fc_international_name,'
      '                       CEIL(SUM(A.FN_KOLRASH) * 30 /'
      
        '                            (trunc(TO_DATE(:DATE2)) - trunc(TO_D' +
        'ATE(:DATE1)) + 1)) AS FN_AVGRASHMONTH, -- +1 '#1076#1083#1103' '#1090#1086#1075#1086', '#1095#1090#1086#1073#1099' '#1084#1086#1078 +
        #1085#1086' '#1073#1099#1083#1086
      '                       '
      '                       SUM(A.FN_KOLRASH) AS FN_RASHPERIOD,'
      '                       SUM(A.FN_KOLOST) AS FN_KOLOST,'
      '                       A.FC_EDIZM,'
      '                       A.FK_ATC,'
      '                       A.FK_ATC_ROOT,'
      '                       A.FARMGRID'
      '                  FROM (SELECT M.FC_NAME,'
      '                               M.MEDICID,'
      '                               FINS.FC_NAME FC_FINSOURCE,'
      '                               UG.FC_UCHGR,'
      '                               CASE'
      
        '                                 WHEN (d.fd_data >= trunc(:date1' +
        ') and'
      
        '                                      d.fd_data < trunc(:date2 +' +
        ' 1)) and'
      '                                      (D.Mnoj < 0) THEN'
      '                                  C.FN_KOL'
      '                                 ELSE'
      '                                  0'
      '                               END AS FN_KOLRASH,'
      '                               D.Mnoj * C.FN_KOL AS FN_KOLOST,'
      '                               CASE'
      
        '                                 WHEN (d.fd_data >= trunc(:date1' +
        ') and'
      
        '                                      d.fd_data < trunc(:date2 +' +
        ' 1)) and'
      '                                      (D.Mnoj > 0) THEN'
      '                                  C.FN_KOL * K.FN_PRICE'
      '                                 ELSE'
      '                                  0'
      '                               END AS FN_SumPrih,'
      '                               CASE'
      
        '                                 WHEN (d.fd_data >= trunc(:date1' +
        ') and'
      
        '                                      d.fd_data < trunc(:date2 +' +
        ' 1)) and'
      '                                      (D.Mnoj > 0) THEN'
      '                                  C.FN_KOL'
      '                                 ELSE'
      '                                  0'
      '                               END AS FN_KolPrih,'
      '                               E.FC_NAME AS FC_EDIZM,'
      '                               d.fd_data,'
      '                               m.fc_international_name,'
      '                               M.fk_atc,'
      '                               (select max(ID)'
      '                                  from RLS.CLSATC'
      '                                 where ID in (select ID'
      '                                                from RLS.CLSATC'
      
        '                                               where PARENTID = ' +
        '0'
      '                                                 and ID <> 0)'
      '                                 start with ID = M.FK_ATC'
      '                                connect by ID = prior PARENTID'
      '                                       and ID <> 0) FK_ATC_ROOT,'
      '                               M.FARMGRID'
      '                          FROM (select tdocs.*,'
      
        '                                       MED.PKG_PRIHRASH.Get_Prih' +
        'RashPriznak(TDOCS.FP_VID,'
      
        '                                                                ' +
        '            TDOCS.FP_VIDMOVE,'
      
        '                                                                ' +
        '            TDOCS.fk_mogroupid_from,'
      
        '                                                                ' +
        '            TDOCS.fk_mogroupid_to,'
      
        '                                                                ' +
        '            :MO_GROUPID) as mnoj'
      '                                  from med.tdocs'
      
        '                                 where :MO_GROUPID in (TDOCS.fk_' +
        'mogroupid_from,'
      '                                        TDOCS.fk_mogroupid_to)'
      
        '                                   and TRUNC(tdocs.fd_data) BETW' +
        'EEN'
      
        '                                       TO_DATE('#39'01.01.2000'#39', '#39'DD' +
        '.MM.YYYY'#39') AND'
      '                                       TRUNC(TO_DATE(:DATE2))'
      
        '                                   AND tdocs.fl_edit = 0 -- '#1090#1086#1083#1100 +
        #1082#1086' '#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      '                                ) d,'
      '                               MED.TDPC C,'
      '                               MED.TKART K,'
      '                               MED.TMEDIC M,'
      '                               MED.TEI E,'
      '                               MED.TFINSOURCE FINS,'
      '                               MED.TUCHGR UG'
      '                         WHERE D.DPID = C.DPID'
      '                           AND C.KARTID = K.KARTID'
      '                           AND K.MEDICID = M.MEDICID'
      '                           AND M.EIID = E.EIID(+)'
      '                           AND K.FK_FINSOURCE_ID = FINS.FK_ID(+)'
      '                           AND M.UCHGRID = UG.UCHGRID(+)'
      '                           AND K.FL_DEL = 0'
      '                        --  AND M.FL_VISIBLE = 1'
      '                        ) A'
      
        '                 GROUP BY FC_NAME, FC_EDIZM, MEDICID, FC_FINSOUR' +
        'CE, FC_UCHGR, fc_international_name, '
      '                   A.FK_ATC, A.FK_ATC_ROOT, A.FARMGRID) B,'
      
        '               (SELECT * FROM med.TMINZAPAS WHERE mogroupid = :M' +
        'O_GROUPID) MZ, -- '#1073#1077#1088#1077#1084' '#1084#1080#1085#1080#1084#1072#1083#1100#1085#1099#1081' '#1079#1072#1087#1072#1089' '#1087#1086' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1091
      '               -- '#1085#1072#1093#1086#1076#1080#1084' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1094#1077#1085#1091
      '               (select distinct K2.fn_price, K2.medicid'
      
        '                  from (SELECT MAX(FN_PARTY_NUM) as FN_PARTY_NUM' +
        ','
      '                               max(kartid) as kartid,'
      '                               medicid'
      '                          FROM MED.TKART'
      
        '                         GROUP BY medicid) K1, -- '#1076#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1087#1088 +
        #1077#1087#1072#1088#1072#1090#1072' '#1085#1072#1093#1086#1076#1080#1084' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1087#1072#1088#1090#1080#1102' - '#1089#1095#1080#1090#1072#1077#1084' '#1095#1090#1086' '#1074' '#1085#1077#1081' '#1094#1077#1085#1072' '#1073#1091#1076#1077#1090' ' +
        #1087#1086#1089#1083#1077#1076#1085#1077#1081
      '                       MED.TKART K2 -- '#1086#1090#1089#1102#1076#1072' '#1074#1086#1079#1100#1084#1077#1084' '#1094#1077#1085#1091
      '                 where K2.kartid = K1.kartid) K3'
      '         where B.MEDICID = MZ.MEDICID(+)'
      '           AND B.MEDICID = MZAK.FK_MEDICID(+)'
      '           AND B.MEDICID = K3.MEDICID(+)'
      '        --   AND B.FN_RASHPERIOD > 0'
      '        --AND K2.MEDICID = K1.MEDICID'
      '        --AND K2.FN_PARTY_NUM = K1.FN_PARTY_NUM  '
      '         ORDER BY LOWER(FC_MEDICNAME)) '#1057)
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445310C00000007000000787101010101
      0100000000060000003A44415445320C00000007000000787201010101010000
      00000B0000003A4D4F5F47524F55504944030000000400000098070000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000D000000464E5F52415348504552494F4401000000000009
      000000464E5F4B4F4C4F53540100000000000800000046435F4544495A4D0100
      000000000C00000046435F4D454449434E414D450100000000000F000000464E
      5F415647524153484D4F4E54480100000000000C000000464E5F4D4F4E54484C
      41434B0100000000000D000000464E5F504552494F444C41434B010000000000
      030000004E554D010000000000070000004D4544494349440100000000000B00
      0000464E5F4D494E5A415041530100000000000C000000464E5F4E454544544F
      42555901000000000007000000464E5F53554D4D01000000000008000000464E
      5F50524943450100000000000A00000046435F434F5252454354010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 56
    Top = 222
  end
  object dsMinSpare: TDataSource
    DataSet = odsMinSpare
    Left = 56
    Top = 272
  end
  object sd: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Excel Files (*.xls)|*.xls'
    Left = 374
    Top = 362
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmMinSpare\'
    StoredProps.Strings = (
      'cxGridDBColumnFC_EDIZM.Visible'
      'cxGridDBColumnFC_EDIZM.Width'
      'cxGridDBColumnFC_MEDICNAME.Visible'
      'cxGridDBColumnFC_MEDICNAME.Width'
      'cxGridDBColumnFN_AVGRASHMONTH.Visible'
      'cxGridDBColumnFN_AVGRASHMONTH.Width'
      'cxGridDBColumnFN_KOLOST.Visible'
      'cxGridDBColumnFN_KOLOST.Width'
      'cxGridDBColumnFN_LASTPRICE.Visible'
      'cxGridDBColumnFN_LASTPRICE.Width'
      'cxGridDBColumnFN_MINZAPAS.Visible'
      'cxGridDBColumnFN_MINZAPAS.Width'
      'cxGridDBColumnFN_NEEDTOBUY.Visible'
      'cxGridDBColumnFN_NEEDTOBUY.Width'
      'cxGridDBColumnFN_PERIODLACK.Visible'
      'cxGridDBColumnFN_PERIODLACK.Width'
      'cxGridDBColumnFN_RASHPERIOD.Visible'
      'cxGridDBColumnFN_RASHPERIOD.Width'
      'cxGridDBColumnNUM.Visible'
      'cxGridDBColumnNUM.Width'
      'cxGridDBTableViewFN_SUMM.Visible'
      'cxGridDBTableViewFN_SUMM.Width')
    StoredValues = <>
    Left = 524
    Top = 186
  end
  object frZakup: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frZakupGetValue
    Left = 338
    Top = 230
    ReportForm = {
      19000000440F0000190000FFFF01000100FFFFFFFFFF09000000340800009A0B
      00004800000024000000240000002400000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F0000FFDC000000780000007C0100002C
      010000040000000200CC0000000D004D61737465724865616465723100020100
      00000008010000F6020000240000003000040001000000000000000000FFFFFF
      1F00000000000000000000000000FFFF00000000000200000001000000000000
      0001000000C800000014000000010000000000000200400100000B004D617374
      657244617461310002010000000040010000F602000014000000310005000100
      0000000000000000FFFFFF1F000000000900667264735A616B75700000000000
      0000FFFF000000000002000000010000000000000001000000C8000000140000
      00010000000000000200AB0100000B0050616765466F6F746572310002010000
      0000F4030000F6020000140000003000030001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200170200000C005265706F72
      745469746C65310002010000000024000000F6020000A8000000300000000100
      0000000000000000FFFFFF1F00000000000000000000000000FFFF0000000000
      02000000010000000000000001000000C8000000140000000100000000000002
      00840200000D004D6173746572466F6F746572310002010000000070010000F6
      020000140000003000060001000000000000000000FFFFFF1F00000000000000
      000000000000FFFF000000000002000000010000000000000001000000C80000
      00140000000100000000000000003D03000005004D656D6F31000200D6010000
      28000000FC0000004C0000000300000001000000000000000000FFFFFF1F2C02
      000000000003000900D3D2C2C5D0C6C4C0DE0D1900C7E0EC2E20E3EBE0E2EDEE
      E3EE20E2F0E0F7E0205B4F4B425D0D13005B7661725F7A616D5F676C5F767261
      6368615D00000000FFFF00000000000200000001000000000500417269616C00
      0C000000000000000000000000000100020000000000FFFFFF00000000020000
      000000000000003204000005004D656D6F3200020048000000740000008A0200
      00580000000300000001000000000000000000FFFFFF1F2C0200000000000400
      2C00CFE5F0E5F7E5EDFC20ECE5E4E8EAE0ECE5EDF2EEE22C20EFE5F0E5E2FFE7
      EEF7EDFBF520F1F0E5E4F1F2E22C0D1F00E8E7E4E5EBE8E920ECE5E4E8F6E8ED
      F1EAEEE3EE20EDE0E7EDE0F7E5EDE8FF0D1A00E4EBFF20E7E0EAF3EFE020EFEE
      20E0EFF2E5EAE5205B4F4B425D0D0900EDE0205B444154455D00000000FFFF00
      000000000000000001000000000500417269616C000C00000002000000000002
      0000000100020000000000FFFFFF0000000002000000000000000000B5040000
      05004D656D6F330002004800000008010000200000002400000003000F000100
      0000000000000000FFFFFF1F2C02000000000001000500B920EF2FEF00000000
      FFFF00000000000200000001000000000500417269616C000A00000002000000
      00000A0000000100020000000000FFFFFF00000000020000000000000000003F
      05000005004D656D6F340002006800000008010000E40000002400000003000F
      0001000000000000000000FFFFFF1F2C02000000000001000C00CDE0E8ECE5ED
      EEE2E0EDE8E500000000FFFF0000000000020000000100000000050041726961
      6C000A0000000200000000000A0000000100020000000000FFFFFF0000000002
      000000000000000000D805000005004D656D6F350002004C0100000801000048
      0000002400000003000F0001000000000000000000FFFFFF1F2C020000000000
      02000600D0E0F1F5EEE40D12005B4D6F6E74685F436F756E745D20ECE5F12E00
      000000FFFF00000000000200000001000000000500417269616C000A00000002
      00000000000A0000000100020000000000FFFFFF000000000200000000000000
      00005E06000005004D656D6F3600020094010000080100002C00000024000000
      03000F0001000000000000000000FFFFFF1F2C02000000000001000800CEF1F2
      E02DF2EEEA00000000FFFF00000000000200000001000000000500417269616C
      000A0000000200000000000A0000000100020000000000FFFFFF000000000200
      0000000000000000E506000005004D656D6F37000200C0010000080100002C00
      00002400000003000F0001000000000000000000FFFFFF1F2C02000000000001
      000900C7E0FFE22DEBE5EDEE00000000FFFF0000000000020000000100000000
      0500417269616C000A0000000200000000000A0000000100020000000000FFFF
      FF00000000020000000000000000006A07000005004D656D6F38000200EC0100
      0008010000440000002400000003000F0001000000000000000000FFFFFF1F2C
      02000000000001000700D6E5EDE02C20F000000000FFFF000000000002000000
      01000000000500417269616C000A0000000200000000000A0000000100020000
      000000FFFFFF0000000002000000000000000000F007000005004D656D6F3900
      02003002000008010000540000002400000003000F0001000000000000000000
      FFFFFF1F2C02000000000001000800D1F3ECECE02C20F000000000FFFF000000
      00000200000001000000000500417269616C000A0000000200000000000A0000
      000100020000000000FFFFFF0000000002000000000000000000810800000600
      4D656D6F313000020084020000080100004C0000002400000003000F00010000
      00000000000000FFFFFF1F2C02000000000001001200CEF2EAEEF0F0E5EA2D20
      F2E8F0EEE2E0EDEE00000000FFFF000000000002000000010000000005004172
      69616C000A0000000200000000000A0000000100020000000000FFFFFF000000
      00020000000000000000001309000006004D656D6F3131000200480000004001
      0000200000001400000003000F0001000000000000000000FFFFFF1F2C020000
      000000010013005B6F64734D696E53706172652E224E554D225D00000000FFFF
      00000000000200000001000000000500417269616C000A000000000000000000
      0A0000000100020000000000FFFFFF0000000002000000000000000000AE0900
      0006004D656D6F31320002006800000040010000E40000001400000003000F00
      01000000000000000000FFFFFF1F2C02000000000001001C005B6F64734D696E
      53706172652E2246435F4D454449434E414D45225D00000000FFFF0000000000
      0200000001000000000500417269616C000A0000000000000000000800000001
      00020000000000FFFFFF00000000020000000000000000004A0A000006004D65
      6D6F31330002004C01000040010000480000001400000003000F000100000000
      0000000000FFFFFF1F2C02020100000001001D005B6F64734D696E5370617265
      2E22464E5F52415348504552494F44225D00000000FFFF000000000002000000
      01000000000500417269616C000A0000000000000000000A0000000100020000
      000000FFFFFF0000000002000000000000000000E20A000006004D656D6F3134
      00020094010000400100002C0000001400000003000F00010000000000000000
      00FFFFFF1F2C020201000000010019005B6F64734D696E53706172652E22464E
      5F4B4F4C4F5354225D00000000FFFF0000000000020000000100000000050041
      7269616C000A0000000000000000000A0000000100020000000000FFFFFF0000
      0000020000000000000000007D0B000006004D656D6F3135000200C001000040
      0100002C0000001400000003000F0001000000000000000000FFFFFF1F2C0202
      0100000001001C005B6F64734D696E53706172652E22464E5F4E454544544F42
      5559225D00000000FFFF00000000000200000001000000000500417269616C00
      0A0000000000000000000A0000000100020000000000FFFFFF00000000020000
      00000000000000140C000006004D656D6F3136000200EC010000400100004400
      00001400000003000F0001000000000000000000FFFFFF1F2C02030100000001
      0018005B6F64734D696E53706172652E22464E5F5052494345225D00000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      000A0000000100020000000000FFFFFF0000000002000000000000000000AA0C
      000006004D656D6F31370002003002000040010000540000001400000003000F
      0001000000000000000000FFFFFF1F2C020301000000010017005B6F64734D69
      6E53706172652E22464E5F53554D4D225D00000000FFFF000000000002000000
      01000000000500417269616C000A0000000000000000000A0000000100020000
      000000FFFFFF0000000002000000000000000000430D000006004D656D6F3138
      00020084020000400100004C0000001400000003000F00010000000000000000
      00FFFFFF1F2C02000000000001001A005B6F64734D696E53706172652E224643
      5F434F5252454354225D00000000FFFF00000000000200000001000000000500
      417269616C000A0000000000000000000A0000000100020000000000FFFFFF00
      00000002000000000000000000DE0D000006004D656D6F313900020070020000
      F403000060000000140000000300000001000000000000000000FFFFFF1F2C02
      000000000001001C00D1F2F02E205B50414745235D20E8E7205B544F54414C50
      414745535D00000000FFFF00000000000200000001000000000500417269616C
      000A000000000000000000090000000100020000000000FFFFFF000000000200
      00000000000000008C0E000006004D656D6F32300002003002000070010000A0
      000000140000000300000001000000000000000000FFFFFF1F2C020401110023
      232320232323202323302E303020F02E0001001E005B73756D285B6F64734D69
      6E53706172652E22464E5F53554D4D225D295D00000000FFFF00000000000200
      000001000000000500417269616C000A00000002000000000008000000010002
      0000000000FFFFFF0000000002000000000000000000120F000006004D656D6F
      3231000200D00100007001000060000000140000000300000001000000000000
      000000FFFFFF1F2C02000000000001000700C8F2EEE3EE3A2000000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000009
      0000000100020000000000FFFFFF000000000200000000000000FEFEFF000000
      000000000000000000FC000000000000000000000000000000005800100FC42B
      CC37E340E49D2FBE6E5AE440}
  end
  object oqFill_TMEDIC_ZAKUP: TOracleQuery
    SQL.Strings = (
      'begin'
      ''
      '  delete from MED.TMEDIC_ZAKUP;'
      ''
      '--   INSERT INTO new_emp (ename, empno, sal) '
      '--   SELECT ename, empno, sal FROM emp'
      '--   WHERE deptno = :deptno ; '
      ''
      
        '  insert INTO MED.TMEDIC_ZAKUP (FK_MEDICID, FN_NEEDTOBUY, FN_PRI' +
        'CE)'
      ''
      
        '-- '#1087#1088#1086#1074#1077#1076#1077#1085#1072' '#1086#1087#1090#1080#1084#1080#1079#1072#1094#1080#1103' '#1082#1086#1083'-'#1074#1072' '#1089#1090#1086#1083#1073#1094#1086#1074' '#1080' '#1079#1072#1084#1077#1085#1077#1099' '#1074#1089#1077' CASE '#1085#1072' A' +
        'SU.GREATER_THEN '#1080' DECODE'
      '  SELECT --ROWNUM AS NUM,'
      '--'#1057'.*,'
      '--(NVL(FN_LastPrice,0)*NVL(FN_NeedToBuy,0)) as FN_SUMM'
      '  MEDICID, FN_NeedToBuy, FN_LastPrice'
      ' FROM'
      '( SELECT'
      
        '--  CASE WHEN (B.FN_AVGRASHMONTH - B.FN_KOLOST) > 0 THEN (B.FN_A' +
        'VGRASHMONTH - B.FN_KOLOST) ELSE NULL END AS FN_MONTHLACK,'
      
        '--  CASE WHEN (B.FN_AVGRASHMONTH - B.FN_KOLOST) > 0 THEN ROUND((' +
        'B.FN_AVGRASHMONTH - B.FN_KOLOST) * B.FN_PRICE,2) ELSE NULL END A' +
        'S FN_MONTHSUMM,'
      
        '--  CASE WHEN (B.FN_RASHPERIOD - B.FN_KOLOST) > 0 THEN (B.FN_RAS' +
        'HPERIOD - B.FN_KOLOST) ELSE NULL END AS FN_PERIODLACK,'
      
        '--  CASE WHEN (B.FN_RASHPERIOD - B.FN_KOLOST) > 0 THEN ROUND((B.' +
        'FN_RASHPERIOD - B.FN_KOLOST) * B.FN_PRICE,2) ELSE NULL END AS FN' +
        '_PERIODSUMM,  '
      '--  B.*,'
      '--  MZ.colvo as FN_MINZAPAS,'
      '  B.MEDICID,'
      
        '  DECODE(ASU.GREATER_THEN((B.FN_AVGRASHMONTH + NVL(MZ.colvo,0) -' +
        ' B.FN_KOLOST), 0), 1, (B.FN_AVGRASHMONTH + NVL(MZ.colvo,0) - B.F' +
        'N_KOLOST), null) as FN_NeedToBuy,'
      
        '--  CASE WHEN (B.FN_AVGRASHMONTH + NVL(MZ.colvo,0) - B.FN_KOLOST' +
        ') > 0 THEN (B.FN_AVGRASHMONTH + NVL(MZ.colvo,0) - B.FN_KOLOST) E' +
        'LSE NULL END as FN_NeedToBuy,'
      
        '--  (SELECT K.FN_PRICE FROM (SELECT MAX(FN_PARTY_NUM), FN_PRICE,' +
        ' MEDICID FROM MED.TKART  GROUP BY FN_PRICE, MEDICID) K WHERE K.M' +
        'EDICID = B.MEDICID) as FN_PRICE'
      '  K3.FN_PRICE as FN_LastPrice '
      'FROM ('
      'SELECT'
      'A.FC_NAME AS FC_MEDICNAME, '
      'A.MEDICID,'
      
        'CEIL(SUM(A.FN_KOLRASH_PERIOD)*30/(trunc(:DATE2) - trunc(:DATE1)+' +
        '1)) AS FN_AVGRASHMONTH, -- +1 '#1076#1083#1103' '#1090#1086#1075#1086', '#1095#1090#1086#1073#1099' '#1084#1086#1078#1085#1086' '#1073#1099#1083#1086
      ''
      'SUM(A.FN_KOLRASH_PERIOD) AS FN_RASHPERIOD,'
      'SUM(A.FN_KOLOST) AS FN_KOLOST,'
      'A.FC_EDIZM'
      'FROM ('
      'SELECT '
      'M.FC_NAME,'
      'M.MEDICID,'
      
        'CASE WHEN (D.Mnoj < 0)and(TRUNC(d.fd_data) BETWEEN TRUNC(:DATE1)' +
        ' AND TRUNC(:DATE2)) THEN C.FN_KOL ELSE 0 END as FN_KOLRASH_PERIO' +
        'D,'
      
        'DECODE(ASU.GREATER_THEN(0, D.Mnoj), 1, C.FN_KOL, 0) as FN_KOLRAS' +
        'H,'
      '--CASE WHEN D.Mnoj < 0 THEN C.FN_KOL ELSE 0 END AS FN_KOLRASH,'
      'D.Mnoj*C.FN_KOL AS FN_KOLOST,'
      '--CASE WHEN D.Mnoj > 0 THEN C.FN_SUMM ELSE 0 END  AS FN_SumPrih,'
      
        '--CASE WHEN D.Mnoj > 0 THEN C.FN_KOL ELSE 0 END  AS FN_KolPrih,'#9 +
        ' '
      'E.FC_NAME AS FC_EDIZM,'
      'd.fd_data'
      'FROM (select tdocs.*,'
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MO_GROUPID )' +
        ' as mnoj'
      '      from med.tdocs'
      
        '      where :MO_GROUPID in (TDOCS.fk_mogroupid_from, TDOCS.fk_mo' +
        'groupid_to )'
      
        '        and TRUNC(tdocs.fd_data) BETWEEN TO_DATE('#39'01.01.2000'#39', '#39 +
        'DD.MM.YYYY'#39') AND TRUNC(:DATE2)'
      '        AND tdocs.fl_edit = 0 -- '#1090#1086#1083#1100#1082#1086' '#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      '      ) d,'
      '      MED.TDPC C, MED.TKART K, MED.TMEDIC M, MED.TEI E'
      'WHERE D.DPID = C.DPID'
      '  AND C.KARTID = K.KARTID'
      '  AND K.MEDICID = M.MEDICID'
      '  AND M.EIID = E.EIID(+)'
      '  AND K.FL_DEL = 0'
      '--  AND M.FL_VISIBLE = 1'
      '  ) A'
      'GROUP BY FC_NAME, FC_EDIZM, MEDICID '
      ') B,'
      
        ' (SELECT * FROM med.TMINZAPAS WHERE MOGROUPID = :MO_GROUPID) MZ,' +
        ' -- '#1073#1077#1088#1077#1084' '#1084#1080#1085#1080#1084#1072#1083#1100#1085#1099#1081' '#1079#1072#1087#1072#1089' '#1087#1086' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1091
      ' -- '#1085#1072#1093#1086#1076#1080#1084' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1094#1077#1085#1091
      ' (select distinct K2.fn_price, K2.medicid'
      'from'
      
        '(SELECT MAX(FN_PARTY_NUM) as FN_PARTY_NUM, max(kartid) as kartid' +
        ', medicid FROM MED.TKART GROUP BY medicid) K1, -- '#1076#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1087#1088 +
        #1077#1087#1072#1088#1072#1090#1072' '#1085#1072#1093#1086#1076#1080#1084' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1087#1072#1088#1090#1080#1102' - '#1089#1095#1080#1090#1072#1077#1084' '#1095#1090#1086' '#1074' '#1085#1077#1081' '#1094#1077#1085#1072' '#1073#1091#1076#1077#1090' ' +
        #1087#1086#1089#1083#1077#1076#1085#1077#1081
      '  MED.TKART K2 -- '#1086#1090#1089#1102#1076#1072' '#1074#1086#1079#1100#1084#1077#1084' '#1094#1077#1085#1091
      'where '
      ' K2.kartid = K1.kartid) K3'
      ''
      'where '
      '    B.MEDICID = MZ.MEDICID(+)'
      'AND B.MEDICID = K3.MEDICID(+)'
      'AND B.FN_RASHPERIOD > 0'
      '--AND K2.MEDICID = K1.MEDICID'
      '--AND K2.FN_PARTY_NUM = K1.FN_PARTY_NUM  '
      'ORDER BY LOWER(FC_MEDICNAME)) '#1057';'
      ''
      'commit;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445320C00000000000000000000000600
      00003A44415445310C00000000000000000000000B0000003A4D4F5F47524F55
      504944030000000000000000000000}
    Cursor = crSQLWait
    Left = 166
    Top = 226
  end
  object frdsZakup: TfrDBDataSet
    DataSet = odsMinSpare
    Left = 340
    Top = 284
  end
  object tmrRefreshSumm: TTimer
    Enabled = False
    OnTimer = tmrRefreshSummTimer
    Left = 446
    Top = 314
  end
end
