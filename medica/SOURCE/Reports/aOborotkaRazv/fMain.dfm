object frmMain: TfrmMain
  Left = 72
  Top = 83
  HelpContext = 40
  Caption = #1054#1073#1086#1088#1086#1090#1082#1072' '#1089' '#1088#1072#1079#1073#1080#1074#1082#1086#1081' '#1088#1072#1089#1093#1086#1076#1072
  ClientHeight = 564
  ClientWidth = 1189
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  HelpFile = 'StMedsestra.chm'
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnHelp = FormHelp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 1189
    Height = 524
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object cxGr: TcxGrid
      Left = 0
      Top = 0
      Width = 1189
      Height = 504
      Align = alClient
      TabOrder = 0
      DragOpeningWaitTime = 500
      object cxGrDBBandedTableView: TcxGridDBBandedTableView
        NavigatorButtons.ConfirmDelete = False
        OnCustomDrawCell = cxGrDBBandedTableViewCustomDrawCell
        DataController.DataSource = dsOborot
        DataController.KeyFieldNames = 'VFN_ROWNUM'
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = #1057#1091#1084#1084#1072': 0.00 '#1088'.'
            Kind = skSum
            Position = spFooter
            Column = cxGrDBBandedTableViewColumn4
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00 '#1088'.'
            Kind = skSum
            Column = cxGrDBBandedTableViewColumn4
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.Summary.OnAfterSummary = cxGrDBBandedTableViewDataControllerSummaryAfterSummary
        OptionsBehavior.CellHints = True
        OptionsBehavior.ImmediateEditor = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.BandsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.Footer = True
        OptionsView.GroupFooters = gfAlwaysVisible
        Styles.Footer = cxBoldStyle
        Bands = <
          item
            Caption = #8470' '#1087'.'#1087'.'
            Options.HoldOwnColumnsOnly = True
            Position.BandIndex = 15
            Position.ColIndex = 0
            Styles.Header = cxBoldStyle
            Width = 60
          end
          item
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Options.HoldOwnColumnsOnly = True
            Position.BandIndex = 15
            Position.ColIndex = 1
            Styles.Header = cxBoldStyle
            Width = 160
          end
          item
            Caption = #1045#1076'. '#1080#1079#1084'.'
            Position.BandIndex = 15
            Position.ColIndex = 2
            Styles.Header = cxBoldStyle
            Width = 60
          end
          item
            Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
            Position.BandIndex = 15
            Position.ColIndex = 3
            Styles.Header = cxBoldStyle
            Width = 60
          end
          item
            Caption = #1060#1072#1088#1084#1072#1082#1086#1083#1086#1075#1080#1095#1077#1089#1082#1072#1103' '#1075#1088#1091#1087#1087#1072
            Position.BandIndex = 15
            Position.ColIndex = 4
            Styles.Header = cxBoldStyle
            Width = 100
          end
          item
            Caption = #1054#1089#1090'. '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088'.'
            Position.BandIndex = 15
            Position.ColIndex = 5
            Styles.Header = cxBoldStyle
            Width = 134
          end
          item
            Caption = #1055#1088#1080#1093#1086#1076
            Position.BandIndex = 15
            Position.ColIndex = 6
            Styles.Header = cxBoldStyle
            Width = 139
          end
          item
            Caption = #1056#1072#1089#1093#1086#1076'/'#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1090#1076#1077#1083#1077#1085#1080#1081
            Options.HoldOwnColumnsOnly = True
            Position.BandIndex = 15
            Position.ColIndex = 7
            Styles.Header = cxBoldStyle
            Width = 190
          end
          item
            Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1074#1082#1083#1102#1095#1072#1103' '#1056#1055#1054
            Position.BandIndex = 15
            Position.ColIndex = 8
            Styles.Header = cxBoldStyle
            Width = 149
          end
          item
            Caption = #1054#1089#1090'. '#1085#1072' '#1082#1086#1085#1077#1094' '#1087#1077#1088'.'
            Position.BandIndex = 15
            Position.ColIndex = 10
            Styles.Header = cxBoldStyle
            Width = 125
          end
          item
            Caption = #1058#1080#1087' '#1086#1087#1083#1072#1090#1099
            Options.HoldOwnColumnsOnly = True
            Position.BandIndex = 15
            Position.ColIndex = 11
            Styles.Header = cxBoldStyle
            Visible = False
            VisibleForCustomization = False
            Width = 60
          end
          item
            Caption = #1059#1095#1088#1077#1078#1076#1077#1085#1080#1077' '#1061#1052#1040#1054'-'#1070#1075#1088#1099' "'#1053#1103#1075#1072#1085#1089#1082#1072#1103' '#1086#1082#1088#1091#1078#1085#1072#1103' '#1073#1086#1083#1100#1085#1080#1094#1072'" '#1040#1055#1058#1045#1050#1040
            Options.HoldOwnColumnsOnly = True
            Options.Moving = False
            Styles.Background = cxStyle2
            Styles.Header = cxBold12
            VisibleForCustomization = False
          end
          item
            Caption = #1043#1088#1091#1087#1087#1080#1088#1086#1074#1086#1095#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
            Options.HoldOwnColumnsOnly = True
            Options.Moving = False
            Position.BandIndex = 11
            Position.ColIndex = 0
            Styles.Background = cxStyle2
            Styles.Header = cxBold12
            VisibleForCustomization = False
          end
          item
            Caption = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1100#1085#1086'-'#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1093' '#1083#1080#1094':'
            Options.HoldOwnColumnsOnly = True
            Options.Moving = False
            Position.BandIndex = 14
            Position.ColIndex = 0
            Styles.Background = cxStyle2
            Styles.Header = cxBoldStyle
            VisibleForCustomization = False
          end
          item
            Caption = #1058#1080#1087' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072': '
            Options.HoldOwnColumnsOnly = True
            Options.Moving = False
            Position.BandIndex = 12
            Position.ColIndex = 0
            Styles.Background = cxStyle2
            Styles.Header = cxBoldStyle
            VisibleForCustomization = False
          end
          item
            Caption = #1079#1072' '#1087#1077#1088#1080#1086#1076
            Options.HoldOwnColumnsOnly = True
            Options.Moving = False
            Position.BandIndex = 13
            Position.ColIndex = 0
            Styles.Background = cxStyle2
            Styles.Header = cxBoldStyle
            VisibleForCustomization = False
          end
          item
            Caption = #1056#1072#1089#1093#1086#1076' '#1074#1089#1077#1075#1086
            Position.BandIndex = 15
            Position.ColIndex = 9
            Styles.Header = cxBoldStyle
            Width = 100
          end>
        object cxGrDBBandedTableViewColumn1: TcxGridDBBandedColumn
          DataBinding.FieldName = 'VFN_ROWNUM'
          PropertiesClassName = 'TcxSpinEditProperties'
          Visible = False
          Position.BandIndex = 10
          Position.ColIndex = 0
          Position.RowIndex = 0
          IsCaptionAssigned = True
        end
        object cxGrDBBandedTableViewColumn2: TcxGridDBBandedColumn
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrDBBandedTableViewColumn3: TcxGridDBBandedColumn
          Caption = #1050#1086#1083'-'#1074#1086':'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.AssignedValues.DisplayFormat = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 45
          Options.Filtering = False
          Width = 45
          Position.BandIndex = 5
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrDBBandedTableViewColumn4: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1084#1072':'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          MinWidth = 65
          Options.Filtering = False
          Styles.Footer = cxStyle1
          Width = 87
          Position.BandIndex = 5
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object cxGrDBBandedTableViewColumn5: TcxGridDBBandedColumn
          Caption = #1050#1086#1083'-'#1074#1086':'
          HeaderAlignmentHorz = taCenter
          MinWidth = 45
          Options.Filtering = False
          Width = 45
          Position.BandIndex = 8
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrDBBandedTableViewColumn6: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1084#1072':'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          MinWidth = 65
          Options.Filtering = False
          Styles.Footer = cxStyle1
          Width = 81
          Position.BandIndex = 8
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object cxGrDBBandedTableViewColumn7: TcxGridDBBandedColumn
          Caption = #1050#1086#1083'-'#1074#1086':'
          HeaderAlignmentHorz = taCenter
          MinWidth = 45
          Options.Filtering = False
          Width = 45
          Position.BandIndex = 6
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrDBBandedTableViewColumn8: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1084#1072':'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          MinWidth = 65
          Options.Filtering = False
          Styles.Footer = cxStyle1
          Width = 96
          Position.BandIndex = 6
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object cxGrDBBandedTableViewColumn9: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrDBBandedTableViewColumn17: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Position.BandIndex = 3
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrDBBandedTableViewColumn10: TcxGridDBBandedColumn
          Caption = #1050#1086#1083'-'#1074#1086':'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          MinWidth = 45
          Options.Filtering = False
          Width = 45
          Position.BandIndex = 9
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrDBBandedTableViewColumn11: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1084#1072':'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          MinWidth = 65
          Options.Filtering = False
          Styles.Footer = cxStyle1
          Width = 81
          Position.BandIndex = 9
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object cxGrDBBandedTableViewColumn12: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 10
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object cxGrDBBandedTableViewColumn13: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = -1
          Position.ColIndex = -1
          Position.RowIndex = -1
          IsCaptionAssigned = True
        end
        object cxGrDBBandedTableViewColumn14: TcxGridDBBandedColumn
          Caption = #1050#1086#1083'-'#1074#1086':'
          HeaderAlignmentHorz = taCenter
          MinWidth = 45
          Options.Filtering = False
          Position.BandIndex = 16
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrDBBandedTableViewColumn15: TcxGridDBBandedColumn
          Caption = #1057#1088'. '#1094#1077#1085#1072':'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          MinWidth = 65
          Options.Filtering = False
          Position.BandIndex = 16
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object cxGrDBBandedTableViewColumn16: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1084#1072':'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          MinWidth = 65
          Options.Filtering = False
          Styles.Footer = cxStyle1
          Position.BandIndex = 16
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object cxGrDBBandedTableViewColumn18: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 100
          Position.BandIndex = 4
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
      end
      object cxGrLevel: TcxGridLevel
        Caption = 'Major'
        GridView = cxGrDBBandedTableView
      end
    end
    object sb: TdxStatusBar
      Left = 0
      Top = 504
      Width = 1189
      Height = 20
      Images = ilMain
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Width = 300
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Font.Charset = DEFAULT_CHARSET
          PanelStyle.Font.Color = clWindowText
          PanelStyle.Font.Height = -11
          PanelStyle.Font.Name = 'MS Sans Serif'
          PanelStyle.Font.Style = [fsBold]
          PanelStyle.ParentFont = False
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 1189
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 1183
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 1176
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 51
      Caption = 'ToolBar1'
      Images = ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acFilter
      end
      object ToolButton2: TToolButton
        Left = 51
        Top = 0
        Action = acExpExcel
      end
      object ToolButton5: TToolButton
        Left = 102
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 110
        Top = 0
        Action = acExit
      end
    end
  end
  object al: TActionList
    Images = ilMain
    Left = 497
    Top = 22
    object acFilter: TAction
      Caption = #1060#1080#1083#1100#1090#1088
      Hint = 
        #1042#1099#1073#1086#1088' '#1087#1077#1088#1080#1086#1076#1072', '#1084#1072#1090#1077#1088#1080#1072#1083#1100#1085#1086'-'#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1075#1086' '#1083#1080#1094#1072' '#1080' '#1090#1080#1087#1072' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090 +
        #1072
      ImageIndex = 2
      ShortCut = 118
      OnExecute = acFilterExecute
    end
    object acExit: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1042#1099#1093#1086#1076' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      ImageIndex = 0
      ShortCut = 32883
      OnExecute = acExitExecute
    end
    object acExpExcel: TAction
      Caption = #1042' Excel'
      Enabled = False
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1089#1087#1080#1089#1082#1072' '#1074' Ms Excel'
      ImageIndex = 3
      ShortCut = 117
      OnExecute = acExpExcelExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 1
      OnExecute = acRefreshExecute
    end
  end
  object os: TOracleSession
    LogonUsername = 'ASU'
    LogonPassword = 'ASU'
    LogonDatabase = 'ASU'
    Left = 33
    Top = 120
  end
  object odsOborot: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWNUM AS VFN_ROWNUM,'#1057'.* FROM ('
      ''
      '    SELECT '
      
        '    B.HFC_NAME||'#39', '#39'||TRIM(to_char(B.HFN_PRICE,'#39'B9G999G999G990D9' +
        '9'#39','#39'NLS_NUMERIC_CHARACTERS = '#39#39'. '#39#39' '#39'))||CASE WHEN B.HFN_PRICE =' +
        ' 0 THEN 0 ELSE NULL END||'#39' '#1088'.'#39' '
      
        '    ||CASE WHEN B.FN_PARTY_NUM IS NULL THEN NULL ELSE '#39',('#39'||B.FN' +
        '_PARTY_NUM||'#39')'#39' END AS VFC_LONGNAME, '
      '    B.* '
      '    FROM ( '
      '    SELECT '
      '    A.FC_NAME AS HFC_NAME, '
      '    A.FN_PARTY_NUM,    '
      '    SUM(A.FN_KOLOSTBEGIN) AS VFN_KOLOSTBEGIN, '
      '    SUM(A.FN_SUMOSTBEGIN) AS VFN_SUMOSTBEGIN, '
      '    SUM(A.FN_KOLPRIH) AS VFN_KOLPRIH, '
      '    SUM(A.FN_SUMPRIH) AS VFN_SUMPRIH, '
      '--   %sSumm'
      #9#9'SUM(A.FN_KOLRASH) AS VFN_KOLRASH, '
      #9#9'SUM(A.FN_SUMRASH) AS VFN_SUMRASH, '
      
        #9#9'SUM(A.FN_KOLOSTBEGIN) + SUM(A.FN_KOLPRIH) - SUM(A.FN_KOLRASH) ' +
        'AS VFN_KOLOSTEND, '
      
        #9#9'SUM(A.FN_SUMOSTBEGIN) + SUM(A.FN_SUMPRIH) - SUM(A.FN_SUMRASH) ' +
        'AS VFN_SUMOSTEND, '
      
        '--'#9#9'DECODE(SUM(A.FN_KOLOSTBEGIN) + SUM(A.FN_KOLPRIH) - SUM(A.FN_' +
        'KOLRASH),0,0,(SUM(A.FN_SUMOSTBEGIN) + SUM(A.FN_SUMPRIH) - SUM(A.' +
        'FN_SUMRASH))/(SUM(A.FN_KOLOSTBEGIN) + SUM(A.FN_KOLPRIH) - SUM(A.' +
        'FN_KOLRASH))) AS HFN_PRICE, '
      '        A.FN_PRICE AS HFN_PRICE,'
      #9#9'A.FC_EDIZM AS VFC_EDIZM, '
      #9#9'A.FK_PAYTYPE AS HFK_PAYTYPE, '
      #9#9'A.FC_PAYTYPE AS VFC_PAYTYPE '
      #9#9'FROM ( '
      #9#9'SELECT '
      #9#9'K.MEDICID,M.FC_NAME, K.FN_PARTY_NUM, K.FN_PRICE,'
      ''
      
        '    CASE WHEN TRUNC(D.FD_DATA) < TRUNC(:DATE1) THEN C.FN_KOL*D.m' +
        'noj ELSE 0 END AS FN_KOLOSTBEGIN,'
      
        '    CASE WHEN TRUNC(D.FD_DATA) < TRUNC(:DATE1) THEN C.FN_SUMM*D.' +
        'Mnoj ELSE 0 END AS FN_SUMOSTBEGIN,'
      ''
      
        '    CASE WHEN D.mnoj>0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1' +
        ') AND TRUNC(:DATE2) THEN C.FN_KOL ELSE 0 END AS FN_KOLPRIH,'
      
        '    CASE WHEN D.mnoj>0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1' +
        ') AND TRUNC(:DATE2) THEN C.FN_SUMM ELSE 0 END AS FN_SUMPRIH,'
      '--    %sCase'
      
        '    CASE WHEN D.mnoj<0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1' +
        ') AND TRUNC(:DATE2) THEN C.FN_KOL ELSE 0 END AS FN_KOLRASH,  '
      
        '    CASE WHEN D.mnoj<0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1' +
        ') AND TRUNC(:DATE2) THEN C.FN_SUMM ELSE 0 END AS FN_SUMRASH,'
      '    E.FC_NAME AS FC_EDIZM, '
      '    P.FK_ID AS FK_PAYTYPE, '
      '    P.FC_NAME AS FC_PAYTYPE '
      '    FROM (SELECT TDOCS.*, '
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUP_ID )' +
        ' as mnoj             '
      '      FROM MED.TDOCS '
      
        '      WHERE TRUNC(TDOCS.FD_DATA) BETWEEN TO_DATE('#39'01.01.2000'#39', '#39 +
        'DD.MM.YYYY'#39') AND TRUNC(:DATE2)'
      '        AND (not tdocs.FP_VIDMOVE in (4,5))'
      '        AND TDOCS.FL_EDIT = 0'
      
        '        AND :MOGROUP_ID in (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGR' +
        'OUPID_FROM) '
      '      ) D,'
      '    '
      
        '     MED.TDPC C, MED.TKART K, MED.TMEDIC M, MED.TEI E,  MED.TPAY' +
        'TYPE P '
      '    WHERE D.DPID = C.DPID '
      '      AND C.KARTID = K.KARTID '
      '      AND K.MEDICID = M.MEDICID '
      '      AND M.EIID = E.EIID(+)       '
      '      AND M.FK_PAYTYPE = P.FK_ID(+) '
      '      AND K.FL_DEL = 0 '
      '      AND M.FK_TYPE = :TMEDICTYPE '
      '      ) A '
      
        '    GROUP BY FC_NAME, FN_PARTY_NUM, MEDICID,FN_PRICE,FC_EDIZM,FK' +
        '_PAYTYPE,FC_PAYTYPE '
      '    ) B '
      
        '    WHERE (B.VFN_KOLPRIH <> 0) OR (B.VFN_KOLRASH <> 0) OR (B.VFN' +
        '_KOLOSTBEGIN <> 0) OR (B.VFN_KOLOSTEND <> 0) '
      '    ORDER BY VFC_PAYTYPE, B.HFC_NAME, FN_PARTY_NUM'
      '    ) '#1057
      ''
      ''
      ''
      '--'#1089#1084'. '#1056#1072#1085' - '#1058#1072#1081#1084' : PrepareSql'
      '/*'
      'SELECT ROWNUM AS VFN_KROWNUM,'#1057'.* FROM ('
      'SELECT '
      
        'B.HFC_NAME||'#39', '#39'||TRIM(to_char(B.HFN_PRICE,'#39'B9G999G999G990D99'#39','#39 +
        'NLS_NUMERIC_CHARACTERS = '#39#39'. '#39#39' '#39'))||CASE WHEN B.HFN_PRICE = 0 T' +
        'HEN 0 ELSE NULL END||'#39' '#1088'.'#39
      
        '||CASE WHEN HFC_SERIAL IS NULL THEN NULL ELSE '#39',('#39'||HFC_SERIAL||' +
        #39')'#39' END AS VFC_LONGNAME,'
      'B.*'
      'FROM ('
      'SELECT'
      
        'PKGMEDKART.GET_KARTSERIALLST(MEDICID,:DATE2,:MOID) AS HFC_SERIAL' +
        ','
      'A.FC_NAME AS HFC_NAME,'
      'SUM(A.FN_KOLOSTBEGIN) AS VFN_KOLOSTBEGIN, '
      'SUM(A.FN_SUMOSTBEGIN) AS VFN_SUMOSTBEGIN,'
      'SUM(A.FN_KOLPRIH) AS VFN_KOLPRIH,'
      'SUM(A.FN_SUMPRIH) AS VFN_SUMPRIH,'
      'SUM(A.FN_KOLRASH) AS VFN_KOLRASH,'
      'SUM(A.FN_SUMRASH) AS VFN_SUMRASH,'
      
        'SUM(A.FN_KOLOSTBEGIN) + SUM(A.FN_KOLPRIH) - SUM(A.FN_KOLRASH) AS' +
        ' VFN_KOLOSTEND,'
      
        'SUM(A.FN_SUMOSTBEGIN) + SUM(A.FN_SUMPRIH) - SUM(A.FN_SUMRASH) AS' +
        ' VFN_SUMOSTEND,'
      
        'DECODE(SUM(A.FN_KOLOSTBEGIN) + SUM(A.FN_KOLPRIH) - SUM(A.FN_KOLR' +
        'ASH),0,0,(SUM(A.FN_SUMOSTBEGIN) + SUM(A.FN_SUMPRIH) - SUM(A.FN_S' +
        'UMRASH))/(SUM(A.FN_KOLOSTBEGIN) + SUM(A.FN_KOLPRIH) - SUM(A.FN_K' +
        'OLRASH))) AS HFN_PRICE,'
      'A.FC_EDIZM AS VFC_EDIZM, '
      'A.FK_PAYTYPE AS HFK_PAYTYPE,'
      'A.FC_PAYTYPE AS VFC_PAYTYPE'
      'FROM ('
      'SELECT '
      'K.MEDICID,'
      'K.FC_NAME,'
      
        'CASE WHEN MOTOID = :MOID AND FP_VID IN (1,3) AND FP_VIDMOVE IN (' +
        '1,5,6,7) AND FD_DATA BETWEEN TO_DATE('#39'01.01.2000'#39', '#39'DD.MM.YYYY'#39')' +
        ' AND TRUNC(:DATE1) - 1/(24*60*60) THEN C.FN_KOL '
      
        '     WHEN MOFROMID = :MOID AND FP_VID = 3 AND FP_VIDMOVE IN (4,5' +
        ',6,7)AND FD_DATA BETWEEN TO_DATE('#39'01.01.2000'#39', '#39'DD.MM.YYYY'#39') AND' +
        ' TRUNC(:DATE1) - 1/(24*60*60) THEN -C.FN_KOL ELSE 0 END AS FN_KO' +
        'LOSTBEGIN,'
      
        'CASE WHEN MOTOID = :MOID AND FP_VID IN (1,3) AND FP_VIDMOVE IN (' +
        '1,5,6,7) AND FD_DATA BETWEEN TO_DATE('#39'01.01.2000'#39', '#39'DD.MM.YYYY'#39')' +
        ' AND TRUNC(:DATE1) - 1/(24*60*60) THEN C.FN_SUMM'
      
        '     WHEN MOFROMID = :MOID AND FP_VID = 3 AND FP_VIDMOVE IN (4,5' +
        ',6,7) AND FD_DATA BETWEEN TO_DATE('#39'01.01.2000'#39', '#39'DD.MM.YYYY'#39') AN' +
        'D TRUNC(:DATE1) - 1/(24*60*60) THEN -C.FN_SUMM ELSE 0 END AS FN_' +
        'SUMOSTBEGIN,'
      
        'CASE WHEN MOTOID = :MOID AND FP_VID IN (1,3) AND FP_VIDMOVE IN (' +
        '1,5,6,7) AND FD_DATA BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) + 1' +
        ' - 1/(24*60*60) THEN C.FN_KOL ELSE 0 END AS FN_KOLPRIH,'
      
        'CASE WHEN MOTOID = :MOID AND FP_VID IN (1,3) AND FP_VIDMOVE IN (' +
        '1,5,6,7) AND FD_DATA BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) + 1' +
        ' - 1/(24*60*60) THEN C.FN_SUMM ELSE 0 END AS FN_SUMPRIH,'
      
        'CASE WHEN MOFROMID = :MOID AND FP_VID = 3 AND FP_VIDMOVE IN (4,5' +
        ',6,7) AND FD_DATA BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) + 1 - ' +
        '1/(24*60*60) THEN C.FN_KOL ELSE 0 END AS FN_KOLRASH,  '
      
        'CASE WHEN MOFROMID = :MOID AND FP_VID = 3 AND FP_VIDMOVE IN (4,5' +
        ',6,7) AND FD_DATA BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) + 1 - ' +
        '1/(24*60*60) THEN C.FN_SUMM ELSE 0 END AS FN_SUMRASH,'
      'E.FC_NAME AS FC_EDIZM,'
      'P.FK_ID AS FK_PAYTYPE, '
      'P.FC_NAME AS FC_PAYTYPE'
      'FROM TDOCS D, TDPC C, TKART K, TMEDIC M, TEI E,  TPAYTYPE P'
      'WHERE D.DPID = C.DPID'
      '  AND C.KARTID = K.KARTID'
      '  AND K.MEDICID = M.MEDICID'
      '  AND M.EIID = E.EIID'
      '  AND M.FK_PAYTYPE = P.FK_ID'
      
        '  AND D.FD_DATA BETWEEN TO_DATE('#39'01.01.2000'#39', '#39'DD.MM.YYYY'#39') AND ' +
        'TRUNC(:DATE2) + 1 - 1/(24*60*60)'
      '  AND K.FL_DEL = 0'
      '  AND D.FL_EDIT = 0'
      '  AND M.FK_TYPE = :TMEDICTYPE'
      
        '  AND (CASE WHEN FP_VID = 3 AND FP_VIDMOVE IN (4,5,6,7) THEN MOF' +
        'ROMID END = :MOID   --'#1048#1044#1045#1058' '#1042' '#1052#1048#1053#1059#1057' ('#1056#1040#1057#1061#1054#1044')'
      
        '  OR CASE WHEN FP_VID IN (1,3) AND FP_VIDMOVE IN (1,5,6,7) THEN ' +
        'MOTOID END = :MOID) --'#1048#1044#1045#1058' '#1042' '#1055#1051#1070#1057' ('#1055#1056#1048#1061#1054#1044')'
      '  AND M.FL_VISIBLE = 1'
      '  ) A'
      'GROUP BY MEDICID,FC_NAME,FC_EDIZM,FK_PAYTYPE,FC_PAYTYPE'
      ') B'
      
        'WHERE (B.VFN_KOLPRIH > 0) OR (B.VFN_KOLRASH > 0) OR (B.VFN_KOLOS' +
        'TBEGIN > 0) OR (B.VFN_KOLOSTEND > 0)'
      'ORDER BY VFC_PAYTYPE, B.HFC_NAME'
      ') '#1057
      ''
      '*/')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A44415445320C00000000000000000000000600
      00003A44415445310C00000000000000000000000B0000003A4D4F47524F5550
      5F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000100000000C0000005646435F4C4F4E474E414D450100000000000800
      00004846435F4E414D450100000000000F00000056464E5F4B4F4C4F53544245
      47494E0100000000000F00000056464E5F53554D4F5354424547494E01000000
      00000B00000056464E5F4B4F4C505249480100000000000B00000056464E5F53
      554D505249480100000000000B00000056464E5F4B4F4C524153480100000000
      000B00000056464E5F53554D524153480100000000000D00000056464E5F4B4F
      4C4F5354454E440100000000000D00000056464E5F53554D4F5354454E440100
      00000000090000005646435F4544495A4D0100000000000B00000048464B5F50
      4159545950450100000000000B0000005646435F504159545950450100000000
      000900000048464E5F50524943450100000000000A00000056464E5F524F574E
      554D0100000000000C000000464E5F50415254595F4E554D010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    AfterScroll = odsOborotAfterScroll
    Left = 26
    Top = 303
  end
  object dsOborot: TDataSource
    DataSet = odsOborot
    Left = 24
    Top = 352
  end
  object ilMain: TImageList
    Left = 449
    Top = 30
    Bitmap = {
      494C010106001C00300010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000840000008400000084000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000084000000840000008400000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF000000000084848400000084000000FF00000084000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000084000000840000008400000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF000000000084848400000084000000FF000000FF000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000084000000840000008400000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400000084000000FF000000FF000000
      FF00000084000000840000008400000084000000840000008400000084000000
      8400000084000000840000008400000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      840000008400FFFFFF00FFFFFF0000000000FFFFFF0000008400000084000000
      8400FFFFFF00FFFFFF000000000084848400000084000000FF000000FF000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000840000008400000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000008400FFFFFF00FFFFFF0000000000FFFFFF000000840000008400FFFF
      FF00FFFFFF00FFFFFF000000000084848400000084000000FF00000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000008400000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000008400FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00000084000000
      8400FFFFFF00FFFFFF00000000008484840000008400000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      840000008400FFFFFF0000000000FFFFFF00FFFFFF0000008400000084000000
      8400FFFFFF00FFFFFF0000000000848484000000840000008400000084000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000084000000840000008400000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B007B7B7B007B7B7B00000000000000
      000000000000000000000000000000000000000000000000000000000000316B
      4200316B4200316B4200296342002963420029634200215A3900215A3900215A
      3900185231001852310018523100184A29000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B0000007B0000007B0000007B7B7B007B7B7B007B7B7B000000
      000000000000000000000000000000000000000000006BA57B0063A5730063A5
      73005A9C73005A9C73005A946B005A946B004A945A004A945A004A945A00398C
      5200398C5200318C4A00318C4A00184A29000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000008484
      840000000000000000000000000000000000000000000000000000000000FFFF
      00007B7B00007B7B00007B7B00007B7B00007B0000007B7B7B00000000000000
      000000000000000000000000000000000000427B52006BA57B00EFF7EF00EFF7
      EF00E7F7E700E7EFE700E7EFE700DEEFDE00DEEFDE00DEEFDE00DEEFDE00DEEF
      DE00DEE7DE00DEE7DE00318C4A00184A29000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000848400008484000000
      000084848400000000000000000000000000000000000000000000000000FFFF
      00007B7B00007B7B00007B7B00007B7B00007B00000000000000000000000000
      000000000000000000000000000000000000427B520073AD8400EFF7EF00EFF7
      EF00EFF7EF00E7F7E700E7EFE700E7EFE700DEEFDE00DEEFDE00DEEFDE00DEEF
      DE00DEEFDE00DEE7DE00398C5200185231008484840084848400848484008484
      8400848484008484840000000000000000000000000000FFFF00008484000084
      8400008484000000000084848400848484000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000848400008484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF00007B7B7B007B7B7B007B7B7B007B7B7B000000
      00000000000000000000000000000000000042845A0073AD8400EFF7EF00EFF7
      EF00EFF7EF00EFF7EF00EFF7EF00E7EFE70084AD8C0029523100295231002952
      310029523100DEEFDE00398C5200185231000000000000000000000000000000
      0000000000008484840000000000000000000000000000FFFF00008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000848400008484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000007B0000007B0000007B0000007B0000007B7B7B00000000000000
      0000000000000000000000000000000000004A8463007BB58C00F7FFF70052A5
      5A0029523100295231002952310029523100187B18006BB573004A945A004A94
      4A00215A3900DEEFDE004A945A00215A39000000000000000000000000000000
      0000000000008484840000000000000000000000000000FFFF00000084000000
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400008484000000
      000084848400000000000000000000000000000000000000000000000000FFFF
      00007B7B00007B7B00007B7B00007B0000007B7B7B007B7B7B007B7B7B000000
      000000000000000000000000000000000000528C630084BD9400F7FFF700F7F7
      F70052A55A0063B5730052A55A00187B18007BC684004A945A004A944A00215A
      390084AD8C00DEEFDE004A945A00215A39000000000000000000000000000000
      0000FFFF00000000000000000000000000000000000000FFFF000000FF000000
      FF00008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400008484000000
      000084848400000000000000000000000000000000000000000000000000FFFF
      0000FFFF00007B7B00007B7B00007B0000007B7B7B007B7B7B007B7B7B007B7B
      7B00000000000000000000000000000000005A946B008CB59400F7FFF700F7FF
      F700F7FFF70052A55A003184310084BD94004A945A004A944A00215A3900639C
      6300639C6300DEEFDE004A945A00215A39000000000000000000000000000000
      0000FFFF0000FFFF000000000000000000000000000000FFFF00008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400008484000000
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000FFFF00007B7B00007B7B00007B0000007B0000007B7B7B007B7B
      7B007B7B7B000000000000000000000000005A9C730094C69C00FFFFFF00F7FF
      F700F7FFF7003184310094C69C005AAD630052A55A00316B4200006B0000E7F7
      E700E7EFE700E7EFE7005A946B00296342000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000000000000000000000FFFF00008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000848400008484000000
      0000848484000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF00007B7B00007B7B00007B7B00007B0000007B7B
      7B007B7B7B007B7B7B007B7B7B000000000063A5730094C69C00FFFFFF00FFFF
      FF00429442009CD6A5006BB573005AAD630042844A0052A55A0031843100006B
      0000E7F7E700E7EFE7005A946B002963420000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000FFFF00008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000000000008484000000
      0000848484000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B0000000000FFFF00007B7B00007B7B00007B7B00007B00
      00007B0000007B7B7B007B7B7B007B7B7B006BA57B009CD6A500FFFFFF004A94
      4A00ADD6B50073BD7B0073BD7B004A945A0052845A006BB56B0052A55A003184
      3100006B0000E7F7E7005A9C7300316B42000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000000000000000000000FFFF0000FFFF000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000848400008484000000
      00008484840000000000000000000000000000000000000000007B0000007B7B
      7B007B7B7B007B7B7B007B7B7B00FFFF0000FFFF00007B7B00007B7B00007B7B
      00007B0000007B0000007B7B7B007B7B7B0073AD84009CD6A500FFFFFF006BB5
      6B0063AD6B0063AD6B00529C5A00F7FFF700F7FFF70052845A0052845A005284
      5A0052845A00EFF7EF005A9C7300316B42000000000000000000000000000000
      0000FFFF0000FFFF00000000000000000000000000000000000000FFFF0000FF
      FF00008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000848400008484000000
      000084848400000000000000000000000000FFFF00007B7B00007B7B00007B7B
      00007B0000007B7B7B007B7B7B007B7B7B007B7B7B00FFFF00007B7B00007B7B
      00007B7B00007B0000007B7B7B007B7B7B0073AD8400ADD6B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFF700F7FFF700F7F7F700EFF7
      EF00EFF7EF00EFF7EF0063A57300000000000000000000000000000000000000
      0000FFFF000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000848400008484000000
      000084848400000000000000000000000000FFFF0000FFFF00007B7B00007B7B
      00007B7B00007B7B00007B0000007B0000007B0000007B7B00007B7B00007B7B
      00007B7B00007B00000000000000000000007BB58C00ADD6B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFF700F7FFF700F7F7
      F700EFF7EF00EFF7EF0063A57300000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000008484
      8400000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B0000FFFF
      0000000000000000000000000000000000007BB58C00ADD6B500ADD6B5009CD6
      A5009CD6A50094C69C0094C69C0094C69C008CB5940084BD94007BB58C0073AD
      840073AD840073AD84006BA57B00000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF00007B7B00007B7B00007B7B0000FFFF00000000
      00000000000000000000000000000000000084BD94007BB58C0073AD840073AD
      84006BA57B0063A573005A9C73005A946B00528C63004A8463004A8463004284
      5A00427B5200427B52000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF000000FFFF000000000000FFFF00000000
      0000FFFF000000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000001000000000000000200000000000
      000040000000000000000000000000000000FFFF000000000000FFFF00000000
      0000FFFF000000000000FFFF00000000FF3FFF3FFE3FE000FF1FFF1FF81F8000
      FF0FFC0FE03F0000FF07F807E07F00000300F807F01F0000F803F807F83F0000
      E003FC07E01F0000E003FF07E00F0000E003FC07F80700000003F807FC010000
      0003F007E20000000003F807C0000000E003F80700000001E003F80700030001
      E003FC0FC00F0001F803FF1FF01F000300000000000000000000000000000000
      000000000000}
  end
  object FormStorage: TJvFormStorage
    AppStoragePath = 'frmMain\'
    StoredValues = <>
    Left = 496
    Top = 264
  end
  object sd: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Excel Files (*.xls)|*.xls'
    Left = 62
    Top = 259
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 440
    Top = 472
    PixelsPerInch = 96
    object cxBoldStyle: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxBold12: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle1: TcxStyle
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 13434828
    end
  end
  object cxGridPopupMenu: TcxGridPopupMenu
    Grid = cxGr
    PopupMenus = <>
    AlwaysFireOnPopup = True
    Left = 536
    Top = 464
  end
  object StrHolder1: TJvStrHolder
    Capacity = 183
    Macros = <
      item
        Name = 'sMedicsTypes'
        Value = ' '
      end
      item
        Name = 'sMedicsFarmgr'
      end
      item
        Name = 'sCaseAndSum'
        Value = ' '
      end
      item
        Name = 'sSumm'
        Value = ' '
      end
      item
        Name = 'sCase'
        Value = ' '
      end>
    Left = 660
    Top = 402
    InternalVer = 1
    StrData = (
      ''
      
        '2d2d20efeef0ffe4eeea20efeeebe5e920e2e0e6e5ed202d20efeeebff20efe5' +
        'f0e5e1e8f0e0fef2f1ff20efee20efeef0ffe4eaf320f1ebe5e4eee2e0ede8ff' +
        '20f1f2eeebe1f6eee220e220637847726964'
      
        '53454c45435420524f574e554d2041532056464e5f524f574e554d2c206d6564' +
        '5f616e645f6f73742e2a'
      
        '202046524f4d202853454c454354202020757365645f6d65646963732e2a2c20' +
        '6f73745f62795f6d65646963732e2a2c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2d2d46532f2a'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2727206173207666635f66696e736f757263652c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2d2d46532a2f'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2d2d46472f2a'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2727206173207666635f6661726d67722c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2d2d46472a2f'
      
        '20202020286f73745f62795f6d65646963732e56464e5f4b4f4c4f5354424547' +
        '494e202b206f73745f62795f6d65646963732e56464e5f4b4f4c50524948202d' +
        '206f73745f62795f6d65646963732e56464e5f4b4f4c52415348292041532056' +
        '464e5f4b4f4c4f5354454e442c'
      
        '20202020286f73745f62795f6d65646963732e56464e5f53554d4f5354424547' +
        '494e202b206f73745f62795f6d65646963732e56464e5f53554d50524948202d' +
        '206f73745f62795f6d65646963732e56464e5f53554d52415348292041532056' +
        '464e5f53554d4f5354454e44'
      ''
      
        '20202020202020202020202046524f4d202853454c4543542044495354494e43' +
        '54206d2e6d656469636964206173206d656469636964312c206d2e66635f6e61' +
        '6d65204153207666635f6c6f6e676e616d652c2075672e756368677269642061' +
        '732075636867726964312c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2020652e66635f6e616d65204153207666635f6564697a6d2d2d4653202c2066' +
        '732e66635f6e616d65204153207666635f66696e736f75726365'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '20202d2d4647202c2066672e66635f6661726d6772204153207666635f666172' +
        '6d6772'
      
        '202020202020202020202020202020202020202020202020202020202046524f' +
        '4d206d65642e74646f637320642c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '20206d65642e7464706320632c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '20206d65642e746b617274206b2c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '20206d65642e746d65646963206d2c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '20206d65642e7475636867722075672c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '20206d65642e7465692065'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '20202d2d4653202c206d65642e7466696e736f75726365206673'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '20202d2d4647202c206d65642e746661726d6772206667'
      
        '2020202020202020202020202020202020202020202020202020202057484552' +
        '4520642e64706964203d20632e64706964'
      
        '202020202020202020202020202020202020202020202020202020202020414e' +
        '4420286e6f7420642e46505f5649444d4f564520696e2028342c352929'
      
        '202020202020202020202020202020202020202020202020202020202020414e' +
        '4420632e6b6172746964203d206b2e6b6172746964'
      
        '202020202020202020202020202020202020202020202020202020202020414e' +
        '44206b2e6d656469636964203d206d2e6d656469636964'
      
        '202020202020202020202020202020202020202020202020202020202020616e' +
        '6420237563686772696423203d2075672e75636867726964'
      
        '2d2d202020202020202020202020202020202020202020202020202020202020' +
        '414e44206b2e666c5f64656c203d2030'
      
        '202020202020202020202020202020202020202020202020202020202020414e' +
        '44206d2e65696964203d20652e65696964282b29'
      
        '2020202020202020202020202020202020202020202020202020202020202d2d' +
        '465320414e44206b2e666b5f66696e736f757263655f6964203d2066732e666b' +
        '5f6964282b29'
      
        '2020202020202020202020202020202020202020202020202020202020202d2d' +
        '464720414e44206d2e6661726d67726964203d2066672e6661726d6772696428' +
        '2b29'
      
        '2020202020202020202020202020202020202020202020202020202020202573' +
        '4d65646963735479706573'
      
        '2020202020202020202020202020202020202020202020202020202020202573' +
        '4d65646963734661726d6772'
      
        '2020202020202020202020202020202020202020202020202920757365645f6d' +
        '65646963732c'
      ''
      
        '20202020202020202020202020202020202853454c4543542020206b2e6d6564' +
        '69636964206173206d656469636964322c'
      
        '20202020202020202020202020202020202020202020202020202075672e7563' +
        '68677269642061732075636867726964322c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '202d2d46532066732e66635f6e616d652061732066635f66696e736f75726365' +
        '322c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '202d2d46472066672e66635f6661726d67722061732066635f6661726d677232' +
        '2c'
      
        '20202020202020202020202020202020202020202020202020202053554d2843' +
        '415345205748454e205452554e4328442e46445f4441544129203c205452554e' +
        '43283a444154453129'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '202020205448454e20632e666e5f6b6f6c202a20642e6d6e6f6a2020454c5345' +
        '203020454e44292041532076666e5f6b6f6c6f7374626567696e2c'
      
        '20202020202020202020202020202020202020202020202020202053554d2843' +
        '415345205748454e205452554e4328442e46445f4441544129203c205452554e' +
        '43283a444154453129'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '202020205448454e20632e666e5f6b6f6c202a206b2e666e5f7072696365202a' +
        '20642e6d6e6f6a20454c5345203020454e44292041532076666e5f73756d6f73' +
        '74626567696e2c'
      
        '20202020202020202020202020202020202020202020202020202053554d2843' +
        '415345205748454e20642e6d6e6f6a203e203020414e44205452554e4328442e' +
        '46445f4441544129204245545745454e205452554e43283a4441544531292041' +
        '4e44205452554e43283a444154453229'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '202020205448454e20632e666e5f6b6f6c20454c5345203020454e4429204153' +
        '2076666e5f6b6f6c707269682c'
      
        '20202020202020202020202020202020202020202020202020202053554d2843' +
        '415345205748454e20642e6d6e6f6a203e203020414e44205452554e4328442e' +
        '46445f4441544129204245545745454e205452554e43283a4441544531292041' +
        '4e44205452554e43283a444154453229'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '202020205448454e20632e666e5f6b6f6c202a206b2e666e5f70726963652045' +
        '4c5345203020454e44292041532076666e5f73756d707269682c'
      
        '2020202020202020202020202020202020202020202020202020202573436173' +
        '65416e6453756d'
      ''
      
        '20202020202020202020202020202020202020202020202020202053554d2843' +
        '415345205748454e20642e6d6e6f6a203c203020414e44205452554e4328442e' +
        '46445f4441544129204245545745454e205452554e43283a4441544531292041' +
        '4e44205452554e43283a444154453229'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '202020205448454e20632e666e5f6b6f6c20454c5345203020454e4429204153' +
        '2076666e5f6b6f6c726173682c'
      
        '20202020202020202020202020202020202020202020202020202053554d2843' +
        '415345205748454e20642e6d6e6f6a203c203020414e44205452554e4328442e' +
        '46445f4441544129204245545745454e205452554e43283a4441544531292041' +
        '4e44205452554e43283a444154453229'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '202020205448454e20632e666e5f6b6f6c202a206b2e666e5f70726963652045' +
        '4c5345203020454e44292041532076666e5f73756d726173682c'
      
        '202020202020202020202020202020202020202020202020202020524f554e44' +
        '28415647284e564c284b2e464e5f50524943452c3029292c3229206173205646' +
        '4e5f50524943452c'
      
        '20202020202020202020202020202020202020202020202020202053554d2843' +
        '415345205748454e20642e6d6e6f6a203c203020414e4420642e66705f766964' +
        '203d203320414e44205452554e4328442e46445f444154412920424554574545' +
        '4e205452554e43283a44415445312920414e44205452554e43283a4441544532' +
        '29'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '202020205448454e20632e666e5f6b6f6c20454c5345203020454e4429204153' +
        '2076666e5f6b6f6c737069732c'
      
        '20202020202020202020202020202020202020202020202020202053554d2843' +
        '415345205748454e20642e6d6e6f6a203c203020414e4420642e66705f766964' +
        '203d203320414e44205452554e4328442e46445f444154412920424554574545' +
        '4e205452554e43283a44415445312920414e44205452554e43283a4441544532' +
        '29'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '202020205448454e20632e666e5f6b6f6c202a206b2e666e5f70726963652045' +
        '4c5345203020454e44292041532076666e5f73756d73706973'
      
        '2020202020202020202020202020202020202020202046524f4d202853454c45' +
        '43542074646f63732e2a2c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2020206d65642e706b675f70726968726173682e6765745f7072696872617368' +
        '7072697a6e616b'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2020202020202020202020202874646f63732e66705f7669642c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2020202020202020202020202074646f63732e66705f7669646d6f76652c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2020202020202020202020202074646f63732e666b5f6d6f67726f757069645f' +
        '66726f6d2c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2020202020202020202020202074646f63732e666b5f6d6f67726f757069645f' +
        '746f2c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '202020202020202020202020203a6d6f67726f75705f6964'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '20202020202020202020202029204153206d6e6f6a'
      
        '2020202020202020202020202020202020202020202020202020202020204652' +
        '4f4d206d65642e74646f6373'
      
        '2020202020202020202020202020202020202020202020202020202020574845' +
        '52452074646f63732e666c5f65646974203d2030'
      
        '2020202020202020202020202020202020202020202020202020202020202041' +
        '4e4420286e6f742074646f63732e46505f5649444d4f564520696e2028342c35' +
        '2929'
      
        '2020202020202020202020202020202020202020202020202020202020202041' +
        '4e44205452554e432854444f43532e46445f4441544129204245545745454e20' +
        '544f5f44415445282730312e30312e32303030272c202744442e4d4d2e595959' +
        '59272920414e44205452554e43283a444154453229'
      
        '2020202020202020202020202020202020202020202020202020202020202041' +
        '4e44203a6d6f67726f75705f696420494e'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2020202020202874646f63732e666b5f6d6f67726f757069645f746f2c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2020202020202074646f63732e666b5f6d6f67726f757069645f66726f6d'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '202020202020292920642c'
      
        '2020202020202020202020202020202020202020202020202020206d65642e74' +
        '64706320632c'
      
        '2020202020202020202020202020202020202020202020202020206d65642e74' +
        '6b617274206b2c'
      
        '2020202020202020202020202020202020202020202020202020206d65642e74' +
        '6d65646963206d2c'
      
        '2020202020202020202020202020202020202020202020202020206d65642e74' +
        '7563686772207567'
      
        '2020202020202020202020202020202020202020202020202020202d2d46532c' +
        '206d65642e7466696e736f75726365206673'
      
        '2020202020202020202020202020202020202020202020202020202d2d464720' +
        '2c206d65642e746661726d6772206667'
      
        '202020202020202020202020202020202020202020574845524520642e647069' +
        '64203d20632e6470696420414e4420632e6b6172746964203d206b2e6b617274' +
        '6964'
      
        '2020202020202020202020202020202020202020202020414e44206d2e6d6564' +
        '69636964203d206b2e6d656469636964'
      
        '2020202020202020202020202020202020202020202020616e64202375636867' +
        '72696423203d2075672e75636867726964'
      
        '20202020202020202020202020202020202020202020202d2d465320616e6420' +
        '6b2e666b5f66696e736f757263655f6964203d2066732e666b5f6964282b29'
      
        '20202020202020202020202020202020202020202020202d2d464720414e4420' +
        '6d2e6661726d67726964203d2066672e6661726d67726964282b29'
      
        '20202020202020202020202020202020202047524f5550204259206b2e6d6564' +
        '696369642c'
      
        '20202020202020202020202020202020202020202020202075672e7563686772' +
        '6964'
      
        '202020202020202020202020202020202020202020202d2d4653202c66732e66' +
        '635f6e616d65'
      
        '202020202020202020202020202020202020202020202d2d4647202c66672e66' +
        '635f6661726d6772'
      
        '2020202020202020202020202020202020202020202020202020202029206f73' +
        '745f62795f6d6564696373'
      ''
      
        '2020202020202020202020574845524520757365645f6d65646963732e6d6564' +
        '6963696431203d206f73745f62795f6d65646963732e6d65646963696432'
      
        '20202020202020202020202020616e6420757365645f6d65646963732e756368' +
        '6772696431203d206f73745f62795f6d65646963732e7563686772696432'
      
        '2020202020202020202020202020202020202d2d465320616e64206e766c2875' +
        '7365645f6d65646963732e7666635f66696e736f757263652c274e412729203d' +
        '206e766c286f73745f62795f6d65646963732e66635f66696e736f7572636532' +
        '2c274e412729'
      
        '2020202020202020202020202020202020202d2d464720616e64206e766c2875' +
        '7365645f6d65646963732e7666635f6661726d67722c274e412729203d206e76' +
        '6c286f73745f62795f6d65646963732e66635f6661726d6772322c274e412729'
      
        '20202020202020204f52444552204259204c4f5745522028757365645f6d6564' +
        '6963732e7666635f6c6f6e676e616d652929206d65645f616e645f6f7374'
      ''
      ''
      ''
      '2f2a'
      
        '53454c45435420524f574e554d2041532056464e5f524f574e554d2cd12e2a20' +
        '46524f4d2028'
      ''
      '2020202053454c45435420'
      
        '20202020422e4846435f4e414d457c7c272c20277c7c5452494d28746f5f6368' +
        '617228422e48464e5f50524943452c2742394739393947393939473939304439' +
        '39272c274e4c535f4e554d455249435f43484152414354455253203d2027272e' +
        '202727202729297c7c43415345205748454e20422e48464e5f5052494345203d' +
        '2030205448454e203020454c5345204e554c4c20454e447c7c2720f02e2720'
      
        '202020207c7c43415345205748454e20422e464e5f50415254595f4e554d2049' +
        '53204e554c4c205448454e204e554c4c20454c534520272c28277c7c422e464e' +
        '5f50415254595f4e554d7c7c27292720454e44204153205646435f4c4f4e474e' +
        '414d452c20'
      '20202020422e2a20'
      '2020202046524f4d202820'
      '2020202053454c45435420'
      '20202020412e46435f4e414d45204153204846435f4e414d452c'
      '20202020412e464e5f50415254595f4e554d2c20202020'
      
        '2020202053554d28412e464e5f4b4f4c4f5354424547494e292041532056464e' +
        '5f4b4f4c4f5354424547494e2c20'
      
        '2020202053554d28412e464e5f53554d4f5354424547494e292041532056464e' +
        '5f53554d4f5354424547494e2c20'
      
        '2020202053554d28412e464e5f4b4f4c50524948292041532056464e5f4b4f4c' +
        '505249482c20'
      
        '2020202053554d28412e464e5f53554d50524948292041532056464e5f53554d' +
        '505249482c20'
      '202020257353756d6d'
      
        '2020202053554d28412e464e5f4b4f4c52415348292041532056464e5f4b4f4c' +
        '524153482c'
      
        '2020202053554d28412e464e5f53554d52415348292041532056464e5f53554d' +
        '524153482c'
      
        '2020202053554d28412e464e5f4b4f4c4f5354424547494e29202b2053554d28' +
        '412e464e5f4b4f4c5052494829202d2053554d28412e464e5f4b4f4c52415348' +
        '292041532056464e5f4b4f4c4f5354454e442c'
      
        '2020202053554d28412e464e5f53554d4f5354424547494e29202b2053554d28' +
        '412e464e5f53554d5052494829202d2053554d28412e464e5f53554d52415348' +
        '292041532056464e5f53554d4f5354454e442c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '412e464e5f50524943452041532048464e5f50524943452c'
      '20202020412e46435f4544495a4d204153205646435f4544495a4d2c20'
      
        '20202020412e464b5f504159545950452041532048464b5f504159545950452c' +
        '20'
      '20202020412e46435f50415954595045204153205646435f5041595459504520'
      '2020202046524f4d202820'
      '2020202053454c45435420'
      
        '202020204b2e4d4544494349442c4d2e46435f4e414d452c204b2e464e5f5041' +
        '5254595f4e554d2c204b2e464e5f50524943452c'
      ''
      
        '2020202043415345205748454e205452554e4328442e46445f4441544129203c' +
        '205452554e43283a444154453129205448454e20432e464e5f4b4f4c2a442e6d' +
        '6e6f6a20454c5345203020454e4420415320464e5f4b4f4c4f5354424547494e' +
        '2c'
      
        '2020202043415345205748454e205452554e4328442e46445f4441544129203c' +
        '205452554e43283a444154453129205448454e20432e464e5f4b4f4c2a4b2e46' +
        '4e5f50524943452a442e4d6e6f6a20454c5345203020454e4420415320464e5f' +
        '53554d4f5354424547494e2c'
      ''
      
        '2020202043415345205748454e20442e6d6e6f6a3e3020414e44205452554e43' +
        '28442e46445f4441544129204245545745454e205452554e43283a4441544531' +
        '2920414e44205452554e43283a444154453229205448454e20432e464e5f4b4f' +
        '4c20454c5345203020454e4420415320464e5f4b4f4c505249482c'
      
        '2020202043415345205748454e20442e6d6e6f6a3e3020414e44205452554e43' +
        '28442e46445f4441544129204245545745454e205452554e43283a4441544531' +
        '2920414e44205452554e43283a444154453229205448454e20432e464e5f4b4f' +
        '4c2a4b2e464e5f505249434520454c5345203020454e4420415320464e5f5355' +
        '4d505249482c'
      '20202020257343617365'
      
        '2020202043415345205748454e20442e6d6e6f6a3c3020414e44205452554e43' +
        '28442e46445f4441544129204245545745454e205452554e43283a4441544531' +
        '2920414e44205452554e43283a444154453229205448454e20432e464e5f4b4f' +
        '4c20454c5345203020454e4420415320464e5f4b4f4c524153482c'
      
        '2020202043415345205748454e20442e6d6e6f6a3c3020414e44205452554e43' +
        '28442e46445f4441544129204245545745454e205452554e43283a4441544531' +
        '2920414e44205452554e43283a444154453229205448454e20432e464e5f4b4f' +
        '4c2a4b2e464e5f505249434520454c5345203020454e4420415320464e5f5355' +
        '4d524153482c'
      '20202020452e46435f4e414d452041532046435f4544495a4d2c20'
      '20202020502e464b5f494420415320464b5f504159545950452c20'
      '20202020502e46435f4e414d452041532046435f5041595459504520'
      '2020202046524f4d202853454c4543542054444f43532e2a2c20'
      
        '202020202020202020202020204d45442e504b475f50524948524153482e4765' +
        '745f50726968526173685072697a6e616b282054444f43532e46505f5649442c' +
        '2054444f43532e46505f5649444d4f56452c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2020202020202020202020202020202020202054444f43532e666b5f6d6f6772' +
        '6f757069645f66726f6d2c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2020202020202020202020202020202020202054444f43532e666b5f6d6f6772' +
        '6f757069645f746f2c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '202020202020202020202020202020202020203a4d4f47524f55505f49442029' +
        '206173206d6e6f6a20202020202020202020202020'
      '20202020202046524f4d204d45442e54444f435320'
      
        '2020202020205748455245205452554e432854444f43532e46445f4441544129' +
        '204245545745454e20544f5f44415445282730312e30312e32303030272c2027' +
        '44442e4d4d2e59595959272920414e44205452554e43283a444154453229'
      '2020202020202020414e442054444f43532e464c5f45444954203d2030'
      
        '2020202020202020414e44203a4d4f47524f55505f494420696e202854444f43' +
        '532e464b5f4d4f47524f555049445f544f2c2054444f43532e464b5f4d4f4752' +
        '4f555049445f46524f4d2920'
      '2020202020202920442c'
      '20202020'
      
        '20202020204d45442e5444504320432c204d45442e544b415254204b2c204d45' +
        '442e544d45444943204d2c204d45442e54454920452c20204d45442e54504159' +
        '54595045205020'
      '20202020574845524520442e44504944203d20432e4450494420'
      '202020202020414e4420432e4b4152544944203d204b2e4b415254494420'
      '202020202020414e44204b2e4d454449434944203d204d2e4d45444943494420'
      
        '202020202020414e44204d2e45494944203d20452e45494944282b2920202020' +
        '202020'
      
        '202020202020414e44204d2e464b5f50415954595045203d20502e464b5f4944' +
        '282b2920'
      '202020202020414e44204b2e464c5f44454c203d203020'
      
        '202020202020414e44204d2e464b5f54595045203d203a544d45444943545950' +
        '4520'
      '20202020202029204120'
      
        '2020202047524f55502042592046435f4e414d452c20464e5f50415254595f4e' +
        '554d2c204d4544494349442c464e5f50524943452c46435f4544495a4d2c464b' +
        '5f504159545950452c46435f50415954595045'
      '2020202029204220'
      
        '2020202057484552452028422e56464e5f4b4f4c50524948203e203029204f52' +
        '2028422e56464e5f4b4f4c52415348203e203029204f522028422e56464e5f4b' +
        '4f4c4f5354424547494e203e203029204f522028422e56464e5f4b4f4c4f5354' +
        '454e44203e20302920'
      
        '202020204f52444552204259204c4f57455228422e4846435f4e414d45292c20' +
        '464e5f50415254595f4e554d'
      '202020202920d1'
      ''
      '2a2f')
  end
  object odsGroupMo: TOracleDataSet
    SQL.Strings = (
      'SELECT * -- groupid, fc_group, fl_del'
      'FROM med.tmo_group '
      'WHERE '
      
        'EXISTS (SELECT 1 FROM MED.TDOCS D, MED.TDPC C, MED.TKART K, MED.' +
        'TMEDIC M'
      '              WHERE D.DPID = C.DPID'
      '                AND C.KARTID = K.KARTID'
      '                AND K.MEDICID = M.MEDICID'
      '                AND K.FL_DEL = 0'
      '                AND D.FL_EDIT = 0'
      '--                AND D.FP_VID = 3 '
      '--                AND D.FP_VIDMOVE IN (4,5,6,7)'
      '--                AND M.FK_TYPE = :TMEDICTYPE'
      
        '                AND MED.PKG_PRIHRASH.Get_PrihRashPriznak( D.FP_V' +
        'ID, D.FP_VIDMOVE,'
      
        '                                                          D.fk_m' +
        'ogroupid_from,'
      
        '                                                          D.fk_m' +
        'ogroupid_to,'
      
        '                                                         :MOGROU' +
        'P_ID ) < 0'
      '  '
      '                AND D.fk_mogroupid_to > 0'
      '                AND D.fk_mogroupid_to = tmo_group.groupid'
      ''
      
        '                AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AND T' +
        'RUNC(:DATE2)'
      '--                AND D.MOFROMID = :MOID'
      '--                AND D.MOTOID = TMO.MOID'
      '                AND M.FL_VISIBLE = 1'
      '             ) --'#1077#1089#1083#1080' '#1077#1089#1090#1100' '#1079#1072' '#1080#1085#1090' '#1087#1077#1088#1080#1086#1076' '#1080' '#1090'.'#1076'. '#1088#1072#1089#1093#1086#1076' '#1085#1072' '#1052#1054
      'ORDER BY LOWER(fc_group)'
      ''
      '/*'
      'SELECT TMO.MOID,TMO.FC_NAME '
      'FROM TMO'
      'WHERE EXISTS (SELECT 1 FROM TDOCS D, TDPC C,TKART K, TMEDIC M'
      '              WHERE D.DPID = C.DPID'
      '                AND C.KARTID = K.KARTID'
      '                AND K.MEDICID = M.MEDICID'
      '                AND K.FL_DEL = 0'
      '                AND D.FL_EDIT = 0'
      '                AND D.FP_VID = 3 '
      '                AND D.FP_VIDMOVE IN (4,5,6,7)'
      '                AND M.FK_TYPE = :TMEDICTYPE'
      
        '                AND D.FD_DATA BETWEEN TRUNC(:DATE1) AND TRUNC(:D' +
        'ATE2) + 1 - 1/(24*60*60)'
      '                AND D.MOFROMID = :MOID'
      '                AND D.MOTOID = TMO.MOID'
      '                AND M.FL_VISIBLE = 1'
      '             ) --'#1077#1089#1083#1080' '#1077#1089#1090#1100' '#1079#1072' '#1080#1085#1090' '#1087#1077#1088#1080#1086#1076' '#1080' '#1090'.'#1076'. '#1088#1072#1089#1093#1086#1076' '#1085#1072' '#1052#1054
      '--  AND ROWNUM < 5'
      'ORDER BY FC_NAME'
      '*/'
      ''
      ''
      ''
      '/*'
      'select * from vchmo'
      'order by fc_name'
      '*/')
    Optimize = False
    Variables.Data = {
      03000000030000000B0000003A4D4F47524F55505F4944030000000000000000
      000000060000003A44415445310C0000000000000000000000060000003A4441
      5445320C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C010000000000}
    Session = os
    Left = 142
    Top = 335
    object odsGroupMoGROUPID: TFloatField
      FieldName = 'GROUPID'
      Required = True
    end
    object odsGroupMoFC_GROUP: TStringField
      FieldName = 'FC_GROUP'
      Size = 100
    end
    object odsGroupMoFL_DEL: TFloatField
      FieldName = 'FL_DEL'
    end
  end
  object StrHolder2: TJvStrHolder
    Capacity = 44
    Macros = <
      item
        Name = 'sMedicsTypes'
        Value = ' '
      end
      item
        Name = 'sMedicsFarmgr'
      end>
    Left = 214
    Top = 394
    InternalVer = 1
    StrData = (
      ''
      
        '53454c454354202a202d2d2067726f757069642c2066635f67726f75702c2066' +
        '6c5f64656c'
      '46524f4d206d65642e746d6f5f67726f757020'
      '574845524520'
      
        '455849535453202853454c45435420312046524f4d204d45442e54444f435320' +
        '442c204d45442e5444504320432c204d45442e544b415254204b2c204d45442e' +
        '544d45444943204d2c204d45442e545543484752205547'
      
        '2020202020202020202020202020574845524520442e44504944203d20432e44' +
        '504944'
      
        '20202020202020202020202020202020414e4420432e4b4152544944203d204b' +
        '2e4b4152544944'
      
        '20202020202020202020202020202020414e44204b2e4d454449434944203d20' +
        '4d2e4d454449434944'
      
        '20202020202020202020202020202020616e6420237563686772696423203d20' +
        '75672e55434847524944'
      '20202020202020202020202020202020414e44204b2e464c5f44454c203d2030'
      
        '20202020202020202020202020202020414e4420442e464c5f45444954203d20' +
        '30'
      
        '2d2d20202020202020202020202020202020414e4420442e46505f564944203d' +
        '2033'
      
        '2d2d20202020202020202020202020202020414e4420442e46505f5649444d4f' +
        '564520494e2028342c352c362c3729'
      
        '2d2d20202020202020202020202020202020414e44204d2e464b5f5459504520' +
        '3d203a544d4544494354595045'
      '2020202020202020202020202020202025734d65646963735479706573'
      '2020202020202020202020202020202025734d65646963734661726d6772'
      
        '20202020202020202020202020202020414e44204d45442e504b475f50524948' +
        '524153482e4765745f50726968526173685072697a6e616b2820442e46505f56' +
        '49442c20442e46505f5649444d4f56452c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2020202020202020202020202020202020202020202020202020442e666b5f6d' +
        '6f67726f757069645f66726f6d2c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '2020202020202020202020202020202020202020202020202020442e666b5f6d' +
        '6f67726f757069645f746f2c'
      
        '2020202020202020202020202020202020202020202020202020202020202020' +
        '202020202020202020202020202020202020202020202020203a4d4f47524f55' +
        '505f49442029203c2030'
      '2020'
      
        '20202020202020202020202020202020414e4420442e666b5f6d6f67726f7570' +
        '69645f746f203e2030'
      
        '20202020202020202020202020202020414e4420442e666b5f6d6f67726f7570' +
        '69645f746f203d20746d6f5f67726f75702e67726f75706964'
      ''
      
        '20202020202020202020202020202020414e44205452554e4328442e46445f44' +
        '41544129204245545745454e205452554e43283a44415445312920414e442054' +
        '52554e43283a444154453229'
      
        '2d2d20202020202020202020202020202020414e4420442e4d4f46524f4d4944' +
        '203d203a4d4f4944'
      
        '2d2d20202020202020202020202020202020414e4420442e4d4f544f4944203d' +
        '20544d4f2e4d4f4944'
      
        '20202020202020202020202020202020414e44204d2e464c5f56495349424c45' +
        '203d2031'
      
        '2020202020202020202020202029202d2de5f1ebe820e5f1f2fc20e7e020e8ed' +
        'f220efe5f0e8eee420e820f22ee42e20f0e0f1f5eee420ede020ccce'
      '4f52444552204259204c4f5745522866635f67726f757029')
  end
  object oqPKG_SMINI: TOracleQuery
    SQL.Strings = (
      'begin'
      '  if :pValue is null then'
      '    if :pdefault is null then :pdefault := '#39#39'; end if;'
      
        '    :pValue := asu.PKG_SMINI.readstring(:psection,:pident,:pdefa' +
        'ult);'
      '  else'
      '    asu.PKG_SMINI.WRITESTRING( :psection, :pident, :pvalue);'
      '  end if;'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000004000000070000003A5056414C554505000000000000000000000009
      0000003A5053454354494F4E050000000000000000000000070000003A504944
      454E54050000000000000000000000090000003A5044454641554C5405000000
      0000000000000000}
    Cursor = crSQLWait
    Left = 904
    Top = 252
  end
end
