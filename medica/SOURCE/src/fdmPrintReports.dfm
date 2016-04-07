object dmPrintReports: TdmPrintReports
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 697
  Width = 481
  object odsInvoice2: TOracleDataSet
    SQL.Strings = (
      'select ROWNUM,'
      
        '       DECODE(A.MEDIC_NUMBER, 1, A.FN_TREB_KOL, 0) as FN_TREB_KO' +
        'L2,'
      '       A.*,'
      '       (A.FN_FPACKINUPACK * A.FN_TREBKOL) as FN_FAS_TREBKOL,'
      
        '       (A.FN_FPACKINUPACK * A.FN_VIDANO_KOL) as FN_FAS_VIDANO_KO' +
        'L,'
      '       '
      
        '       ASU.FLOAT_NUMBER_TO_WORDS((A.FN_FPACKINUPACK * A.FN_TREBK' +
        'OL),'
      '                                 2,'
      '                                 '#39#1094#1077#1083#1072#1103#39','
      '                                 '#39#1094#1077#1083#1099#1093#39','
      '                                 '#39#1094#1077#1083#1099#1093#39') as FC_FAS_TREBKOL,'
      
        '       ASU.FLOAT_NUMBER_TO_WORDS((A.FN_FPACKINUPACK * A.FN_VIDAN' +
        'O_KOL),'
      '                                 2,'
      '                                 '#39#1094#1077#1083#1072#1103#39','
      '                                 '#39#1094#1077#1083#1099#1093#39','
      '                                 '#39#1094#1077#1083#1099#1093#39') as FC_FAS_VIDANO_KOL'
      ''
      '  from (select ALL_MEDICS.MEDICID as ALL_MEDICID,'
      
        '               ROW_NUMBER() OVER(partition by ALL_MEDICS.MEDICID' +
        ' order by M.FC_NAME) as MEDIC_NUMBER,'
      '               TREB_MEDICS.MEDICID as TREB_MEDICID,'
      '               VIDANO_MEDICS.MEDICID as VIDANO_MEDICID,'
      '               DECODE(:PRINT_LAT_NAME,'
      '                      1,'
      '                      DECODE(M.FL_PRINT_LAT_NAME,'
      '                             1,'
      '                             NVL(M.FC_NAME_LAT, M.FC_NAME),'
      '                             M.FC_NAME),'
      
        '                      M.FC_NAME) as FC_MEDIC_NAME,              ' +
        '   '
      '               E.FC_NAME as FC_EDIZM_NAME,'
      '               E.FC_OKEI as FC_EDIZM_OKEI,'
      '               NVL(TREB_MEDICS.FN_TREB_KOL, 0) as FN_TREB_KOL,'
      '               TREB_MEDICS.TREBID,'
      
        '               NVL(VIDANO_MEDICS.FN_VIDANO_KOL, 0) as FN_VIDANO_' +
        'KOL,'
      '               VIDANO_MEDICS.FN_PRICE,'
      '               VIDANO_MEDICS.FN_VIDANO_SUM,'
      '               DECODE(VIDANO_MEDICS.DPID,'
      '                      null,'
      '                      TREB_MEDICS.FN_TREB_KOL,'
      '                      VIDANO_MEDICS.FN_TREBKOL) as FN_TREBKOL,'
      '               VIDANO_MEDICS.FC_SERIAL,'
      '               VIDANO_MEDICS.FD_GODEN,'
      
        '               TO_CHAR(VIDANO_MEDICS.FD_GODEN, '#39'DD.MM.YYYY'#39') as ' +
        'FC_GODEN_DDMMYYYY,'
      
        '               TO_CHAR(VIDANO_MEDICS.FD_GODEN, '#39'DD.MM.YY'#39') as FC' +
        '_GODEN_DDMMYY,'
      '               VIDANO_MEDICS.FN_PARTY_NUM,'
      '               VIDANO_MEDICS.FC_FINSOURCE,'
      '               VIDANO_MEDICS.FC_INV_NOMER,'
      '               VIDANO_MEDICS.FC_PRODUCER,'
      '               M.FC_NAME_LAT,'
      '               M.FC_NAME as FC_NAME_RUS,'
      '               M.FN_FPACKINUPACK,'
      '               M.FC_INTERNATIONAL_NAME as FC_MNN,'
      '               FE.FC_NAME as FC_FAS_EDIZM_NAME,'
      '               case'
      '                when NARC_UCHGR.uchgrid > 0 then 1'
      '                else 0'
      '               end IS_NARCOTIC'
      '        '
      '          from (select TD.FK_MEDICID as MEDICID'
      '                  from MED.TTREB T, MED.TTREB_DPC TD'
      
        '                 where (T.FK_DPID = :ADPID or T.FK_ID = :ATREBID' +
        ')'
      '                   and TD.FK_TREBID = T.FK_ID'
      '                   and TD.FN_KOL > 0'
      '                union'
      '                select K.MEDICID as MEDICID'
      '                  from MED.TDPC DPC, MED.TKART K'
      '                 where DPC.DPID = :ADPID'
      
        '                   and DPC.KARTID = K.KARTID) ALL_MEDICS, -- '#1084#1077#1076 +
        #1080#1082#1072#1084#1077#1085#1090#1099', '#1079#1072#1087#1088#1086#1096#1077#1085#1085#1099#1077' '#1080' '#1074#1099#1076#1072#1085#1085#1099#1077
      '               '
      '               (select T.FK_ID as TREBID,'
      '                       TD.FK_MEDICID as MEDICID,'
      '                       sum(TD.FN_KOL) as FN_TREB_KOL'
      '                  from MED.TTREB T, MED.TTREB_DPC TD'
      
        '                 where (T.FK_DPID = :ADPID or T.FK_ID = :ATREBID' +
        ')'
      '                   and TD.FK_TREBID = T.FK_ID'
      
        '                   and TD.FN_KOL > 0 -- '#1079#1072#1090#1088#1077#1073#1086#1074#1072#1085#1085#1099#1077' '#1085#1086' '#1085#1077#1074#1099#1076#1072#1085 +
        #1085#1099#1077' '#1085#1077' '#1086#1090#1086#1073#1088#1072#1078#1072#1077#1084
      
        '                 group by T.FK_ID, TD.FK_MEDICID) TREB_MEDICS, -' +
        '- '#1079#1072#1090#1088#1077#1073#1086#1074#1072#1085#1085#1099#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099
      '               '
      '               (select DPC.DPID,'
      '                       K.MEDICID,'
      '                       DPC.FN_KOL as FN_VIDANO_KOL,'
      '                       K.FN_PRICE,'
      '                       DPC.FN_KOL * K.FN_PRICE as FN_VIDANO_SUM,'
      '                       DPC.FN_TREBKOL,'
      '                       K.FC_SERIAL,'
      '                       K.FD_GODEN,'
      '                       K.FN_PARTY_NUM,'
      '                       FS.FC_NAME as FC_FINSOURCE,'
      '                       K.FC_INV_NOMER,'
      '                       K.FC_PRODUCER'
      '                '
      
        '                  from MED.TDPC DPC, MED.TKART K, MED.TFINSOURCE' +
        ' FS'
      '                 where DPC.DPID = :ADPID'
      '                   and DPC.KARTID = K.KARTID'
      
        '                   and K.FK_FINSOURCE_ID = FS.FK_ID(+)) VIDANO_M' +
        'EDICS, -- '#1074#1099#1076#1072#1085#1085#1099#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099
      '               MED.TMEDIC M,'
      '               MED.TEI E,'
      '               MED.TEI FE,'
      '               ( select u.uchgrid from med.tuchgr u  '
      
        '                  start with UPPER (u.fc_synonim ) = '#39'NARCOTIC_M' +
        'EDIC'#39
      
        '                connect by prior u.uchgrid = u.parentid ) NARC_U' +
        'CHGR'
      '        '
      '         where ALL_MEDICS.MEDICID = TREB_MEDICS.MEDICID(+)'
      '           and ALL_MEDICS.MEDICID = VIDANO_MEDICS.MEDICID(+)'
      
        '           and ALL_MEDICS.MEDICID = M.MEDICID -- '#1076#1086#1089#1090#1072#1077#1084' '#1080#1084#1103' '#1084#1077#1076 +
        #1080#1082#1072#1084#1077#1085#1090#1072
      '           and M.EIID = E.EIID(+) -- '#1080' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1091#1087#1072#1082#1086#1074#1082#1080
      
        '           and M.FK_FPACKID = FE.EIID(+) -- '#1085#1072#1079#1074#1072#1085#1080#1077' '#1092#1072#1089#1086#1074#1082#1080'    ' +
        '    '
      '           and M.uchgrid = NARC_UCHGR.uchgrid(+)    '
      '         order by UPPER(M.FC_NAME)) A         '
      '       ')
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A414450494403000000040000009FCA02000000
      00000F0000003A5052494E545F4C41545F4E414D450300000004000000010000
      0000000000080000003A415452454249440300000004000000FFFFFFFF000000
      00}
    QBEDefinition.QBEFieldDefs = {
      0400000011000000070000004D45444943494401000000000006000000524F57
      4E554D0100000000000D00000046435F4D454449435F4E414D45010000000000
      0D00000046435F4544495A4D5F4E414D450100000000000B000000464E5F5452
      45425F4B4F4C0100000000000D000000464E5F564944414E4F5F4B4F4C010000
      0000000D000000464E5F564944414E4F5F53554D0100000000000C000000464B
      5F49445F4D415354455201000000000008000000464E5F505249434501000000
      00000A000000464E5F545245424B4F4C0100000000000900000046435F534552
      49414C0100000000000800000046445F474F44454E0100000000001100000046
      435F474F44454E5F44444D4D595959590100000000000F00000046435F474F44
      454E5F44444D4D59590100000000000C000000464E5F50415254595F4E554D01
      00000000000C00000046435F46494E534F555243450100000000000C00000046
      435F494E565F4E4F4D4552010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 18
    Top = 8
  end
  object frxDBdsInvoice2: TfrxDBDataset
    UserName = 'frxDBdsInvoice2'
    CloseDataSource = False
    DataSet = odsInvoice2
    BCDToCurrency = False
    Left = 92
    Top = 6
  end
  object frxTrebNakl: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39387.554601956000000000
    ReportOptions.LastChange = 40204.480609155090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var v_trebID : integer;                        '
      '  '
      
        'procedure Memo63OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1054#1090#1087#1091#1089#1090#1080#1083':'#39', s);  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      ''
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_FC_MO_FROM'#39',  s2);'
      'end;'
      ''
      
        'procedure Memo77OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1055#1086#1083#1091#1095#1080#1083':'#39', s);                '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_FC_MO_TO'#39',  s2);      '
      'end;'
      ''
      'procedure Memo86OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  SET('#39'FN_SUMM'#39', <FN_SUMM>+IIF(<frxDBdsInvoice2."FN_VIDANO_SUM">' +
        '=null, 0,<frxDBdsInvoice2."FN_VIDANO_SUM">) );  '
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SET('#39'FN_SUMM'#39', 0);  '
      'end;'
      ''
      
        'procedure Memo81OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1063#1077#1088#1077#1079' '#1082#1086#1075#1086':'#39', s);              ' +
        '    '
      '  TfrxMemoView(Sender).Text := s2;          '
      '  Modified := True;'
      
        '  SavFIOZAVAPT(s2); // '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1074#1074#1077#1076#1077#1085#1085#1086#1075#1086' '#1074' '#1088#1077#1077#1089#1090#1088'           ' +
        '                                                                ' +
        '                 '
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_ZAV_APTEKA'#39',  s2);  '
      'end;'
      ''
      
        'procedure Memo89OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1047#1072#1074'. '#1086#1090#1076#1077#1083#1077#1085#1080#1077#1084' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103':'#39', s' +
        ');  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_FC_ZAV_OTD_TO'#39',  s2);  '
      'end;'
      ''
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  PageHeader1.Visible := (<Page> > 1);  '
      'end;'
      ''
      
        'procedure Memo101OnPreviewClick(Sender: TfrxView; Button: TMouse' +
        'Button; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1047#1072#1084'. '#1075#1083'. '#1074#1088#1072#1095#1072' '#1087#1086' '#1083#1077#1095#1077#1073#1085#1086#1081' '#1088#1072#1073#1086 +
        #1090#1077':'#39', s);  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      
        '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_ZAM_GLAV_VRACH_LECH_RAB'#39', ' +
        ' s2);  '
      'end;'
      ''
      
        'procedure Memo102OnPreviewClick(Sender: TfrxView; Button: TMouse' +
        'Button; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1047#1072#1084'. '#1075#1083'. '#1074#1088#1072#1095#1072' '#1087#1086' '#1087#1088#1086#1092#1080#1083#1102':'#39', s)' +
        ';  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_ZAM_GLAV_PROFIL'#39',  s2);'
      '    '
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  v_trebID:=0;              '
      'end;'
      ''
      'procedure Memo85OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if (v_trebID<><frxDBdsInvoice2."trebID">) then'
      '  begin'
      '    Memo85.Memo.Text := '#39'[frxDBdsInvoice2."FN_VIDANO_KOL"]'#39';'
      '    v_trebID:=<frxDBdsInvoice2."trebID">;          '
      '  end else'
      '  begin'
      '     Memo85.Memo.Text := '#39#39';                     '
      '  end;            '
      'end;'
      ''
      'procedure Memo81OnBeforePrint(Sender: TfrxComponent);'
      
        'var v_str_tmp : string;                                         ' +
        '          '
      'begin'
      '  v_str_tmp:=GetFIOZAVAPT;'
      '  if trim(v_str_tmp)<>'#39#39' then'
      '    VAR_ZAV_APTEKA := v_str_tmp;                               '
      'end;'
      ''
      'begin'
      '                      '
      'end.')
    OnGetValue = frxTrebNaklGetValue
    OnPrintReport = frxTrebNaklPrintReport
    OnUserFunction = frxTrebNaklUserFunction
    Left = 20
    Top = 62
    Datasets = <
      item
        DataSet = frxDBdsInvoice2
        DataSetName = 'frxDBdsInvoice2'
      end
      item
        DataSet = frmMoveList.frZapiska
      end
      item
        DataSet = frxDBdsSimpleTrebHeader
        DataSetName = 'frxDBdsSimpleTrebHeader'
      end
      item
        DataSet = frxDBdsTDPC
        DataSetName = 'frxDBdsTDPC'
      end
      item
        DataSet = frxDBdsTTrebDpc
        DataSetName = 'frxDBdsTTrebDpc'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'FN_SUMM'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 17.999604166666700000
      RightMargin = 7.000875000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      Frame.Width = 3.000000000000000000
      LargeDesignHeight = True
      TitleBeforeHeader = False
      OnBeforePrint = 'Page1OnBeforePrint'
      object Header2: TfrxHeader
        Height = 20.000000000000000000
        Top = 540.472790000000000000
        Width = 699.211238975208200000
        object Memo93: TfrxMemoView
          Left = 88.165430000000000000
          Width = 179.803340000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 36.133890000000000000
          Width = 52.031540000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 268.968770000000000000
          Width = 42.590600000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 2.000000000000000000
          Width = 34.133890000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 311.559370000000000000
          Width = 34.692950000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 346.252320000000000000
          Width = 69.488250000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 460.433520000000000000
          Width = 46.692950000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '8')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 415.740570000000000000
          Width = 44.692950000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '7')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Left = 507.126470000000000000
          Width = 62.370130000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '9')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 569.496600000000000000
          Width = 71.488250000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '10')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 640.984850000000000000
          Width = 51.811070000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '11')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Left = 88.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line5: TfrxLineView
          Left = 36.000000000000000000
          Top = 19.000000000000000000
          Width = 257.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          Left = 2.000000000000000000
          Top = 19.000000000000000000
          Width = 86.170000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
        end
        object Line12: TfrxLineView
          Left = 267.970000000000000000
          Top = 19.000000000000000000
          Width = 79.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
        end
        object Line23: TfrxLineView
          Left = 460.430000000000000000
          Top = 19.000000000000000000
          Width = 232.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
        end
        object Line11: TfrxLineView
          Left = 311.560000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line27: TfrxLineView
          Left = 415.740000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line28: TfrxLineView
          Left = 507.130000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line29: TfrxLineView
          Left = 569.500000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line32: TfrxLineView
          Left = 640.980000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line34: TfrxLineView
          Left = 693.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line35: TfrxLineView
          Left = 2.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
      end
      object MasterData1: TfrxMasterData
        Height = 16.000000000000000000
        Top = 582.047620000000000000
        Width = 699.211238975208200000
        DataSet = frxDBdsInvoice2
        DataSetName = 'frxDBdsInvoice2'
        RowCount = 0
        Stretched = True
        object Memo52: TfrxMemoView
          Left = 1.000000000000000000
          Width = 35.133890000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 36.133890000000000000
          Width = 52.031540000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 88.165430000000000000
          Width = 179.803340000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          GapX = 4.000000000000000000
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FC_MEDIC_NAME"]')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 346.250000000000000000
          Width = 69.488250000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FC_EDIZM_NAME"]')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 507.126470000000000000
          Width = 62.370130000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FN_PRICE"]')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 415.740570000000000000
          Width = 44.692950000000000000
          Height = 16.000000000000000000
          OnBeforePrint = 'Memo85OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsInvoice2."fn_trebkol"]')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          Left = 569.496600000000000000
          Width = 71.488250000000000000
          Height = 16.000000000000000000
          OnBeforePrint = 'Memo86OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FN_VIDANO_SUM"]')
          ParentFont = False
        end
        object Line8: TfrxLineView
          Left = 640.984850000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Memo50: TfrxMemoView
          Left = 460.433520000000000000
          Width = 46.692950000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FN_VIDANO_KOL"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 267.970000000000000000
          Width = 42.590000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 311.559370000000000000
          Width = 34.692950000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 641.000000000000000000
          Width = 49.811070000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          ParentFont = False
        end
        object Line9: TfrxLineView
          Left = 2.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line10: TfrxLineView
          Left = 88.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line13: TfrxLineView
          Left = 268.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line14: TfrxLineView
          Left = 346.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line24: TfrxLineView
          Left = 461.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line25: TfrxLineView
          Left = 692.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line22: TfrxLineView
          Left = 311.560000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line26: TfrxLineView
          Left = 415.740000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line30: TfrxLineView
          Left = 507.130000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line31: TfrxLineView
          Left = 569.500000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line33: TfrxLineView
          Left = 640.980000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
      end
      object Footer1: TfrxFooter
        Height = 26.000000000000000000
        Top = 619.842920000000000000
        Width = 699.211238975208200000
        object Memo79: TfrxMemoView
          Left = 419.000000000000000000
          Top = 3.000000000000000000
          Width = 222.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 3.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[<FN_SUMM>]')
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          Width = 692.134510000000000000
          Height = 5.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 191.000000000000000000
        Top = 325.039580000000000000
        Width = 699.211238975208200000
        RowCount = 1
        object Memo80: TfrxMemoView
          Left = 3.779530000000000000
          Top = 9.000000000000000000
          Width = 54.811070000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#167#1056#181#1057#1026#1056#181#1056#183' '#1056#1108#1056#1109#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo81: TfrxMemoView
          Left = 157.212740000000000000
          Top = 7.000000000000000000
          Width = 239.370440000000000000
          Height = 24.677180000000000000
          OnBeforePrint = 'Memo81OnBeforePrint'
          OnPreviewClick = 'Memo81OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_ZAV_APTEKA]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo87: TfrxMemoView
          Left = 3.779530000000000000
          Top = 39.236240000000010000
          Width = 54.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8212#1056#176#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#187)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo89: TfrxMemoView
          Left = 157.212740000000000000
          Top = 33.234440000000010000
          Width = 150.976500000000000000
          Height = 24.900000000000000000
          OnPreviewClick = 'Memo89OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_FC_ZAV_OTD_TO]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo90: TfrxMemoView
          Left = 320.543600000000000000
          Top = 39.234440000000010000
          Width = 61.811070000000000000
          Height = 18.900000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#160#1056#176#1056#183#1057#1026#1056#181#1057#8364#1056#1105#1056#187)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo91: TfrxMemoView
          Left = 384.693260000000000000
          Top = 39.234440000000010000
          Width = 177.450000000000000000
          Height = 18.900000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1112'. '#1056#1110#1056#187'. '#1056#1030#1057#1026#1056#176#1057#8225#1056#176' '#1056#1111#1056#1109' '#1056#187#1056#181#1057#8225#1056#181#1056#177#1056#1029#1056#1109#1056#8470' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1056#181)
          ParentFont = False
          VAlign = vaBottom
        end
        object Line36: TfrxLineView
          Left = 666.110700000000000000
          Top = 58.133889999999780000
          Height = 34.015770000000000000
          ShowHint = False
          Frame.Color = clWhite
          Frame.Typ = [ftLeft]
        end
        object Memo92: TfrxMemoView
          Left = 384.693260000000000000
          Top = 61.913419999999970000
          Width = 177.450000000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1112'. '#1056#1110#1056#187'. '#1056#1030#1057#1026#1056#176#1057#8225#1056#176' '#1056#1111#1057#1026#1056#1109' '#1056#1111#1057#1026#1056#1109#1057#8222#1056#1105#1056#187#1057#1035)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo101: TfrxMemoView
          Left = 564.701300000000000000
          Top = 39.234440000000010000
          Width = 132.417440000000000000
          Height = 18.900000000000000000
          OnPreviewClick = 'Memo101OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_ZAM_GLAV_VRACH_LECH_RAB]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo102: TfrxMemoView
          Left = 564.701299999999900000
          Top = 65.692950000000000000
          Width = 132.417440000000000000
          Height = 22.677180000000000000
          OnPreviewClick = 'Memo102OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            '[VAR_ZAM_GLAV_PROFIL]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo103: TfrxMemoView
          Left = 64.929190000000000000
          Top = 39.234440000000010000
          Width = 91.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1030'. '#1056#1109#1057#8218#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181#1056#1112)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo104: TfrxMemoView
          Left = 64.929190000000000000
          Top = 9.000000000000000000
          Width = 91.165430000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1030'. '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo105: TfrxMemoView
          Left = 88.165430000000000000
          Top = 126.598330000000000000
          Width = 223.393940000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1056#181' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 311.559370000000000000
          Top = 126.600000000000000000
          Width = 104.181200000000000000
          Height = 64.250000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169#1056#1105#1056#1029#1056#1105#1057#8224#1056#176' '#1056#1105#1056#183#1056#1112#1056#181#1057#1026#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Left = 415.740570000000000000
          Top = 126.598330000000000000
          Width = 91.385900000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 507.126470000000000000
          Top = 126.598330000000000000
          Width = 62.370130000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176','
            #1057#1026#1057#1107#1056#177'.'
            #1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo109: TfrxMemoView
          Left = 569.496600000000000000
          Top = 126.598330000000000000
          Width = 71.488250000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176
            #1056#177#1056#181#1056#183' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176
            #1056#1116#1056#8221#1056#1038','
            #1057#1026#1057#1107#1056#177'. '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 640.984850000000000000
          Top = 126.598330000000000000
          Width = 51.811070000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1056#1109#1056#1030#1057#8249#1056#8470
            #1056#1029#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1111#1056#1109
            #1057#1027#1056#1108#1056#187#1056#176#1056#1169#1057#1027#1056#1108#1056#1109#1056#8470
            #1056#1108#1056#176#1057#1026#1057#8218#1056#1109#1057#8218#1056#181#1056#1108#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 2.000000000000000000
          Top = 126.598330000000000000
          Width = 86.165430000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1057#1026#1057#1026#1056#181#1057#1027#1056#1111#1056#1109#1056#1029#1056#1169#1056#1105#1057#1026#1057#1107#1057#1035#1057#8240#1056#1105#1056#8470
            #1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 2.000000000000000000
          Top = 153.055040000000000000
          Width = 34.133890000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8225#1056#181#1057#8218','
            #1057#1027#1057#1107#1056#177#1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Left = 36.133890000000000000
          Top = 153.055040000000000000
          Width = 52.031540000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1169' '#1056#176#1056#1029#1056#176#1056#187#1056#1105#1057#8218#1056#1105'-'
            #1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Left = 88.165430000000000000
          Top = 153.055040000000000000
          Width = 179.803340000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo115: TfrxMemoView
          Left = 267.968770000000000000
          Top = 153.055040000000000000
          Width = 42.590000000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#1109#1056#1112#1056#181#1056#1029#1056#1108'-'
            #1056#187#1056#176#1057#8218#1057#1107#1057#1026#1056#1029#1057#8249#1056#8470
            #1056#1029#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Left = 346.252320000000000000
          Top = 153.055040000000000000
          Width = 69.488250000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 310.559370000000000000
          Top = 153.055040000000000000
          Width = 35.692950000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 415.740570000000000000
          Top = 153.055040000000000000
          Width = 44.692950000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176#1057#8218#1057#1026#1056#181'-'
            #1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 460.433520000000000000
          Top = 153.055040000000000000
          Width = 46.692950000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1109#1057#8218#1056#1111#1057#1107'-'
            #1057#8240#1056#181#1056#1029#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData3: TfrxMasterData
        Height = 20.700000000000000000
        Top = 279.685220000000000000
        Width = 699.211238975208200000
        RowCount = 1
        Stretched = True
        object Memo27: TfrxMemoView
          Left = 44.000000000000000000
          Width = 63.590600000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd.mm.yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FD_INVOICE]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 645.394250000000000000
          Width = 51.267780000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 543.330000000000000000
          Width = 41.490000000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 107.590600000000000000
          Width = 32.692950000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 140.200000000000000000
          Width = 201.570000000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FC_MOGROUP_FROM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 341.850650000000000000
          Width = 201.570000000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FC_MOGROUP_TO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 584.820000000000000000
          Width = 61.488250000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 584.820000000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line37: TfrxLineView
          Left = 645.394250000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line38: TfrxLineView
          Left = 543.330000000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line39: TfrxLineView
          Left = 341.850650000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line40: TfrxLineView
          Left = 140.200000000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line41: TfrxLineView
          Left = 107.590600000000000000
          Top = 1.000000000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
      end
      object MasterData4: TfrxMasterData
        Height = 19.000000000000000000
        Top = 668.976810000000000000
        Width = 699.211238975208200000
        RowCount = 1
        Stretched = True
        object Memo47: TfrxMemoView
          Left = 22.000000000000000000
          Width = 671.000000000000000000
          Height = 19.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1109#1057#8218#1056#1111#1057#1107#1057#8240#1056#181#1056#1029#1056#1109' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' [MONEYSTR(<FN_SUMM>)' +
              ']')
          ParentFont = False
        end
      end
      object MasterData5: TfrxMasterData
        Height = 102.000000000000000000
        Top = 710.551640000000000000
        Width = 699.211238975208200000
        RowCount = 1
        object Memo23: TfrxMemoView
          Left = 22.000000000000000000
          Top = 16.000000000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1107#1057#1027#1057#8218#1056#1105#1056#187)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 97.590600000000000000
          Top = 16.000000000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 97.590600000000000000
          Top = 34.897650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 229.874150000000000000
          Top = 16.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 324.362400000000000000
          Top = 16.000000000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo63OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FC_MO_FROM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 229.874150000000000000
          Top = 34.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 324.362400000000000000
          Top = 34.897650000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 22.236550000000000000
          Top = 58.000000000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#1105#1056#187)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 97.827150000000000000
          Top = 58.000000000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 97.827150000000000000
          Top = 76.897650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 230.110700000000000000
          Top = 58.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 324.598950000000000000
          Top = 58.000000000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo77OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FC_MO_TO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 230.110700000000000000
          Top = 76.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 324.598950000000000000
          Top = 76.897650000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 158.007978000000000000
        Top = 60.472480000000000000
        Width = 699.211238975208200000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo13: TfrxMemoView
          Left = 499.606804000000000000
          Top = 1.000000000000000000
          Width = 193.748176000000000000
          Height = 41.574830000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1118#1056#1105#1056#1111#1056#1109#1056#1030#1056#176#1057#1039' '#1056#1112#1056#181#1056#182#1056#1109#1057#8218#1057#1026#1056#176#1057#1027#1056#187#1056#181#1056#1030#1056#176#1057#1039' '#1057#8222#1056#1109#1057#1026#1056#1112#1056#176' '#1074#8222#8211' '#1056#1114'-11'
            
              #1056#1032#1057#8218#1056#1030#1056#181#1057#1026#1056#182#1056#1169#1056#181#1056#1029#1056#176' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1029#1056#1109#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1056#181#1056#1112' '#1056#8220#1056#1109#1057#1027#1056#1108#1056#1109#1056#1112#1057#1027 +
              #1057#8218#1056#176#1057#8218#1056#176' '#1056#160#1056#1109#1057#1027#1057#1027#1056#1105#1056#1105
            #1056#1109#1057#8218' 30.10.97 '#1074#8222#8211' 71'#1056#176)
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 154.787570000000000000
          Top = 48.503958000000010000
          Width = 210.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1118#1056#160#1056#8226#1056#8216#1056#1115#1056#8217#1056#1106#1056#1116#1056#152#1056#8226'-'#1056#1116#1056#1106#1056#1113#1056#8250#1056#1106#1056#8221#1056#1116#1056#1106#1056#1031' '#1074#8222#8211)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 365.236550000000000000
          Top = 48.503958000000010000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[VAR_FC_DOC]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 608.850960000000000000
          Top = 49.503958000000010000
          Width = 85.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169#1057#8249)
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 608.850960000000000000
          Top = 68.401608000000010000
          Width = 85.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '0315006')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 608.850960000000000000
          Top = 87.299258000000010000
          Width = 85.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 3.000000000000000000
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 4.000000000000000000
          Top = 87.299258000000010000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 90.929190000000000000
          Top = 67.299258000000010000
          Width = 401.535870000000000000
          Height = 38.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_UCHR_NAME]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo59: TfrxMemoView
          Left = 526.465060000000000000
          Top = 68.401608000000010000
          Width = 73.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#1109#1057#1026#1056#1112#1056#176' '#1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1032#1056#8221)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo60: TfrxMemoView
          Left = 525.701300000000000000
          Top = 91.078788000000000000
          Width = 74.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1119#1056#1115)
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 43.913420000000000000
          Top = 113.755968000000000000
          Width = 63.590600000000000000
          Height = 43.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176
            #1057#1027#1056#1109#1057#1027#1057#8218#1056#176'-'
            #1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 107.504020000000000000
          Top = 113.755968000000000000
          Width = 32.692950000000000000
          Height = 43.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169' '#1056#1030#1056#1105#1056#1169#1056#176
            #1056#1109#1056#1111#1056#181#1057#1026#1056#176'-'#1057#8224#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 140.196970000000000000
          Top = 113.755968000000000000
          Width = 201.567100000000000000
          Height = 21.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1026#1056#176#1056#1030#1056#1105#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 341.764070000000000000
          Top = 113.755968000000000000
          Width = 201.570000000000000000
          Height = 21.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 645.307670000000000000
          Top = 113.755968000000000000
          Width = 50.511811020000000000
          Height = 43.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1057#8225#1056#181#1057#8218#1056#1029#1056#176#1057#1039
            #1056#181#1056#1169#1056#1105#1056#1029#1056#1105#1057#8224#1056#176
            #1056#1030#1057#8249#1056#1111#1057#1107#1057#1027#1056#1108#1056#176
            #1056#1111#1057#1026#1056#1109#1056#1169#1057#1107#1056#1108#1057#8224#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 543.331170000000000000
          Top = 113.755968000000000000
          Width = 101.976500000000000000
          Height = 43.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1057#1026#1057#1026#1056#181#1057#1027#1056#1111#1056#1109#1056#1029#1056#1169#1056#1105#1057#1026#1057#1107#1057#1035#1057#8240#1056#1105#1056#8470
            #1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 543.331170000000000000
          Top = 134.992208000000000000
          Width = 41.488250000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8225#1056#181#1057#8218','
            #1057#1027#1057#1107#1056#177#1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 584.819420000000000000
          Top = 134.992208000000000000
          Width = 60.488250000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1169' '#1056#176#1056#1029#1056#176#1056#187#1056#1105#1057#8218#1056#1105'-'
            #1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 341.764070000000000000
          Top = 134.992208000000000000
          Width = 100.280000000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026#1057#1107#1056#1108#1057#8218#1057#1107#1057#1026#1056#1029#1056#1109#1056#181
            #1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 442.047620000000000000
          Top = 134.992208000000000000
          Width = 101.283550000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1030#1056#1105#1056#1169
            #1056#1169#1056#181#1057#1039#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 140.196970000000000000
          Top = 134.992208000000000000
          Width = 101.283550000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026#1057#1107#1056#1108#1057#8218#1057#1107#1057#1026#1056#1029#1056#1109#1056#181
            #1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 241.480520000000000000
          Top = 134.992208000000000000
          Width = 100.283550000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1030#1056#1105#1056#1169
            #1056#1169#1056#181#1057#1039#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line15: TfrxLineView
          Left = 341.764070000000000000
          Top = 135.992208000000000000
          Height = 22.015770000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line16: TfrxLineView
          Left = 608.850960000000000000
          Top = 87.299258000000010000
          Width = 85.724490000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 20.000000000000000000
        Top = 18.897650000000000000
        Width = 699.211238975208200000
        OnBeforePrint = 'PageHeader1OnBeforePrint'
        object Memo1: TfrxMemoView
          Align = baClient
          Width = 699.211238975208200000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 3.000000000000000000
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034': [VAR_FC_MOGROUP_TO]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 873.071430000000000000
        Width = 699.211238975208200000
        object Memo2: TfrxMemoView
          Align = baClient
          Width = 699.211238975208200000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [<Page#>] '#1056#1105#1056#183' [<TotalPages#>]')
          ParentFont = False
        end
      end
    end
  end
  object frxTrebZam: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39388.575169803210000000
    ReportOptions.LastChange = 39388.645806921300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxTrebZamGetValue
    Left = 100
    Top = 56
    Datasets = <
      item
        DataSet = frxDBdsInvoice2
        DataSetName = 'frxDBdsInvoice2'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 84.283519000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          Left = -1.133859000000000000
          Top = 0.755905999999999500
          Width = 680.315400000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1038#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' '#1056#1111#1057#1026#1056#181#1056#1111#1056#176#1057#1026#1056#176#1057#8218#1056#1109#1056#1030', '#1056#1030#1057#1026#1056#181#1056#1112#1056#181#1056#1029#1056#1029#1056#1109' '#1056#1109#1057#8218#1057#1027#1057#1107#1057#8218#1057#1027 +
              #1057#8218#1056#1030#1057#1107#1057#1035#1057#8240#1056#1105#1057#8230' '#1056#1030' '#1056#1106#1056#1111#1057#8218#1056#181#1056#1108#1056#181' '#1056#1105' '#1056#160#1056#1119#1056#1115)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 1.133859000000000000
          Top = 38.173253000000000000
          Width = 680.315400000000000000
          Height = 37.417347000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1074#8222#8211' [VAR_FC_DOC]'
            #1056#1109#1057#8218' [VAR_RUS_STR_DATE]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 18.897637800000000000
        Top = 162.519790000000000000
        Width = 680.315400000000000000
        object Memo3: TfrxMemoView
          Left = 0.755906000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 57.448856000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1111#1057#1026#1056#181#1056#1111#1056#176#1057#1026#1056#176#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 303.118306000000000000
          Width = 377.197094000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1105#1056#1029#1057#8222#1056#1109#1057#1026#1056#1112#1056#176#1057#8224#1056#1105#1057#1039' '#1056#1109' '#1056#1029#1056#176#1056#187#1056#1105#1057#8225#1056#1105#1056#1105' '#1056#1111#1057#1026#1056#181#1056#1111#1056#176#1057#1026#1056#176#1057#8218#1056#176' '#1056#1030' '#1056#176#1056 +
              #1111#1057#8218#1056#181#1056#1108#1056#181)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 204.094620000000000000
        Width = 680.315400000000000000
        DataSet = frxDBdsInvoice2
        DataSetName = 'frxDBdsInvoice2'
        RowCount = 0
        Stretched = True
        object Memo6: TfrxMemoView
          Left = 0.755906000000000000
          Top = 0.023624000000012300
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 57.448856000000000000
          Top = 0.023624000000000010
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FC_MEDIC_NAME'
          DataSet = frxDBdsInvoice2
          DataSetName = 'frxDBdsInvoice2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FC_MEDIC_NAME"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 303.118306000000000000
          Top = 0.023624000000012300
          Width = 377.197094000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 67.653587000000000000
        Top = 283.464750000000000000
        Width = 680.315400000000000000
        object Memo9: TfrxMemoView
          Left = 49.511843000000000000
          Top = 27.000000000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1056#1030#1056#1105#1056#183#1056#1109#1057#1026' '#1057#8218#1056#181#1057#8230#1056#1029#1056#1109#1056#187#1056#1109#1056#1110' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1105' ')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 234.708813000000000000
          Top = 27.000000000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
      end
    end
  end
  object oqRepM11_Init: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '  select MAX(NVL(fk_id,0)) into :mds_forms_fk_id from stat.t_mds' +
        '_forms where fc_name = '#39'M-11'#39';'
      
        '  SELECT STAT.pkg_mds_params.GetNewID INTO :mds_params_fk_id fro' +
        'm DUAL;'
      
        '  STAT.pkg_mds_params.InsertIntegerParam(:mds_params_fk_id, '#39'Tre' +
        'bID'#39',   null);'
      
        '  STAT.pkg_mds_params.InsertIntegerParam(:mds_params_fk_id, '#39'Rec' +
        'Count'#39', null);'
      
        '  STAT.pkg_mds_params.InsertStringParam (:mds_params_fk_id, '#39'FN_' +
        'SUMM'#39',  null);'
      
        '  STAT.pkg_mds_params.InsertStringParam (:mds_params_fk_id, '#39'FC_' +
        'SUMM'#39',  null);'
      '  commit;'
      'end;  ')
    Optimize = False
    Variables.Data = {
      0300000002000000100000003A4D44535F464F524D535F464B5F494403000000
      040000001F06000000000000110000003A4D44535F504152414D535F464B5F49
      4403000000040000000B07000000000000}
    Left = 319
    Top = 12
  end
  object oqRepM11_End: TOracleQuery
    SQL.Strings = (
      'begin'
      '  STAT.pkg_mds_params.ClearID(:mds_params_fk_id);'
      '  commit;'
      'end;  ')
    Optimize = False
    Variables.Data = {
      0300000001000000110000003A4D44535F504152414D535F464B5F4944030000
      000000000000000000}
    Left = 321
    Top = 110
  end
  object oqRepM11_UpdateParams: TOracleQuery
    SQL.Strings = (
      'begin'
      '    UPDATE stat.t_mds_params'
      '    SET fn_value = :TrebId'
      '    WHERE'
      '        fk_id = :mds_params_fk_id'
      '     and UPPER(fc_name) = '#39'TREBID'#39
      '    and fp_type = 1;'
      ''
      '    UPDATE stat.t_mds_params'
      '    SET fn_value = :RECCOUNT'
      '    WHERE'
      '        fk_id = :mds_params_fk_id'
      '     and UPPER(fc_name) = '#39'RECCOUNT'#39
      '    and fp_type = 1;'
      ''
      '    UPDATE stat.t_mds_params'
      '    SET fc_value = :FN_SUMM'
      '    WHERE'
      '        fk_id = :mds_params_fk_id'
      '     and UPPER(fc_name) = '#39'FN_SUMM'#39
      '    and fp_type = 2;'
      ''
      '    UPDATE stat.t_mds_params'
      '    SET fc_value = :FC_SUMM'
      '    WHERE'
      '        fk_id = :mds_params_fk_id'
      '     and UPPER(fc_name) = '#39'FC_SUMM'#39
      '    and fp_type = 2;'
      ''
      '    commit; '
      'end;')
    Optimize = False
    Variables.Data = {
      0300000005000000110000003A4D44535F504152414D535F464B5F4944030000
      000000000000000000070000003A545245424944030000000000000000000000
      090000003A524543434F554E54030000000000000000000000080000003A464E
      5F53554D4D050000000000000000000000080000003A46435F53554D4D050000
      000000000000000000}
    Left = 319
    Top = 60
  end
  object odsSimpleTrebData: TOracleDataSet
    SQL.Strings = (
      'SELECT /*D.ROWID,*/ '
      'D.*,'
      
        'DECODE(:PRINT_LAT_NAME, 1, DECODE(M.FL_PRINT_LAT_NAME, 1,NVL(M.F' +
        'C_NAME_LAT, M.FC_NAME), M.FC_NAME), M.FC_NAME) as FC_MEDIC,'
      '--M.FC_NAME AS FC_MEDIC,'
      ''
      'E.FC_NAME AS FC_EDIZM'
      'FROM MED.TTREB_DPC D, MED.TMEDIC M, MEd.TEI E'
      'WHERE D.FK_TREBID = :FK_TREBID'
      '  AND D.FK_MEDICID = M.MEDICID'
      '  AND M.EIID = E.EIID (+)'
      'ORDER BY LOWER(M.FC_NAME )')
    Optimize = False
    Variables.Data = {
      03000000020000000A0000003A464B5F54524542494403000000000000000000
      00000F0000003A5052494E545F4C41545F4E414D450300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000700000005000000464B5F494401000000000009000000464B5F5452
      454249440100000000000A000000464B5F4D4544494349440100000000000600
      0000464E5F4B4F4C01000000000008000000464B5F4450434944010000000000
      0800000046435F4D454449430100000000000800000046435F4544495A4D0100
      00000000}
    Cursor = crSQLWait
    Left = 32
    Top = 140
  end
  object odsSimpleTrebHeader: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  T.*,'
      '  S.FC_NAME FC_SKLAD,'
      '  TRUNC(T.FD_DATE) as TRUNC_DATE,'
      '  NVL(TMO.FC_NAME,'#39#39') as FC_MOTO,'
      '  NVL(M2.FC_NAME,'#39#39')  AS FC_MOFROM,'
      '  NVL(M3.FC_NAME,'#39#39')  AS FC_MOOWNER,'
      
        '  decode(NVL(TMO.FC_NAME,'#39#39'), '#39#39', MOGR_TO.FC_GROUP, MOGR_TO.FC_G' +
        'ROUP||'#39' ('#39'||TMO.FC_NAME||'#39')'#39' ) AS FC_GROUPTO_WITH_NAME,'
      
        '  decode(NVL(M2.FC_NAME,'#39#39'), '#39#39', MOGR_FROM.FC_GROUP, MOGR_FROM.F' +
        'C_GROUP||'#39' ('#39'||M2.FC_NAME||'#39')'#39' ) AS FC_GROUPFROM_WITH_NAME,'
      '  MOGR_FROM.FC_GROUP as FC_GROUPFROM,'
      '  fs.fc_name as FC_FINSOURCE,'
      '  fsd.fc_name as FC_DOC_FINSOURCE,'
      '  d.FD_INVOICE as FD_DOC_INVOICE,'
      '  d.FD_DATA as FD_DOC_DATA,'
      '  d.fc_doc as FC_DOC_NUM,'
      '  t.FK_MOFROMID as fk_treb_mofromid,'
      '  decode((select count(1) from med.tmo m, asu.tsotr_medica S '
      '          where m.moid = t.FK_MOFROMID and s.fk_id = m.fk_sotrid'
      '            AND S.FK_OTDID in ( SELECT o.fk_id'
      '                                FROM med.totdel_medica o'
      
        '                                CONNECT BY PRIOR o.fk_id = o.fk_' +
        'ownerid'
      
        '                                START WITH o.fk_id = ASU.get_sto' +
        'tdel )), 0,0, 1) as fl_stac,'
      '  decode((select count(1) from med.tmo m, asu.tsotr_medica S '
      
        '          where m.moid = med.pkg_medses.get_curmo and s.fk_id = ' +
        'm.fk_sotrid'
      '            AND S.FK_OTDID in ( SELECT o.fk_id'
      '                                FROM med.totdel_medica o'
      
        '                                CONNECT BY PRIOR o.fk_id = o.fk_' +
        'ownerid'
      
        '                                START WITH o.fk_id = ASU.get_apt' +
        'eka_otdel )), 0,0, 1) as fl_apteka,'
      
        '  (select asu.get_sotrname(asu.get_zavotdid(m.fk_sotrid)) from m' +
        'ed.tmo m where m.moid = T.FK_MOFROMID) FC_ZAV_OTDEL,'
      '  (SELECT ASU.GET_SOTRNAME(max(S.FK_ID))'
      '     FROM LOGIN.TSOTR S, LOGIN.TSOTR S2'
      '    WHERE TMO.FK_SOTRID = S2.FK_ID'
      '      AND S2.FK_OTDELID = S.FK_OTDELID'
      '      AND S.FL_DEL = 0'
      
        '      AND S.FK_SPRAVID IN (SELECT FK_ID FROM ASU.TS_SPRAV WHERE ' +
        'FC_SYNONIM = '#39'SMS'#39')) FC_SMS_TO,'
      '  (SELECT ASU.GET_SOTRNAME(max(S.FK_ID))'
      '     FROM LOGIN.TSOTR S, LOGIN.TSOTR S2'
      '    WHERE M2.FK_SOTRID = S2.FK_ID'
      '      AND S2.FK_OTDELID = S.FK_OTDELID'
      '      AND S.FL_DEL = 0'
      
        '      AND S.FK_SPRAVID IN (SELECT FK_ID FROM ASU.TS_SPRAV WHERE ' +
        'FC_SYNONIM = '#39'SMS'#39')) FC_SMS_FROM,'
      
        '  decode ( to_char (t.FK_MOGROUPID_FROM), asu.PKG_SMINI.readstri' +
        'ng ( '#39'MEDICA.EXE'#39', '#39'MOGROUPID_PLAT_USLUG'#39', '#39'-1'#39'), 1, 0 ) as FL_F' +
        'ROM_OTD_PLAT_USLUG '
      
        'FROM MED.TTREB T, MED.TMO, MED.TMO M2, MED.TMO M3, MED.TMO_GROUP' +
        ' MOGR_FROM, MED.TMO_GROUP MOGR_TO, MED.TFINSOURCE fs, MED.TFINSO' +
        'URCE fsd'
      '    ,MED.TDOCS D, MED.TSKLAD S'
      ''
      'WHERE (T.fk_id = :FK_TREBID or T.FK_DPID = :dpid)'
      '  and (T.FK_DPID = d.dpid(+))'
      '  AND T.FK_MOTOID = TMO.MOID (+)'
      '  AND T.FK_MOFROMID = M2.MOID (+)'
      '  AND T.FK_MOOWNERID = M3.MOID (+)'
      '  AND T.fk_mogroupid_from = MOGR_FROM.GROUPID(+)'
      '  AND T.fk_mogroupid_to   = MOGR_TO.GROUPID(+)'
      '  AND T.FK_FINSOURCE_ID = fs.FK_ID(+)'
      '  AND D.FK_FINSOURCE_ID = fsd.fk_id(+)'
      '  AND TMO.FK_SKLAD_ID = S.FK_ID(+)')
    Optimize = False
    Variables.Data = {
      03000000020000000A0000003A464B5F5452454249440300000004000000FFFF
      FFFF00000000050000003A4450494403000000040000000FDD000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001200000005000000464B5F49440100000000000700000046435F5452
      45420100000000000700000046445F444154450100000000000C000000464B5F
      4D4F4F574E4552494401000000000009000000464B5F4D4F544F494401000000
      00000B000000464B5F4D4F46524F4D49440100000000000A00000046435F434F
      4D4D454E5401000000000007000000464B5F445049440100000000000C000000
      464B5F4D4F47524F5550494401000000000011000000464B5F4D4F47524F5550
      49445F46524F4D0100000000000F000000464B5F4D4F47524F555049445F544F
      01000000000007000000464C5F4349544F0100000000000A0000005452554E43
      5F444154450100000000000700000046435F4D4F544F01000000000009000000
      46435F4D4F46524F4D0100000000001400000046435F47524F5550544F5F5749
      54485F4E414D450100000000001600000046435F47524F555046524F4D5F5749
      54485F4E414D450100000000000C00000046435F47524F555046524F4D010000
      000000}
    Cursor = crSQLWait
    AfterClose = odsSimpleTrebHeaderAfterClose
    Left = 36
    Top = 202
  end
  object frxSimpleTreb: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38559.680454282400000000
    ReportOptions.LastChange = 40596.378355648150000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxTrebZamGetValue
    OnUserFunction = frxSimpleTrebUserFunction
    Left = 84
    Top = 186
    Datasets = <
      item
        DataSet = frxDBdsSimpleTrebData
        DataSetName = 'frxDBdsSimpleTrebData'
      end
      item
        DataSet = frxDBdsSimpleTrebHeader
        DataSetName = 'frxDBdsSimpleTrebHeader'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 87.007854000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          Left = -0.755906000000000000
          Top = 0.078725999999999630
          Width = 684.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1074#8222#8211' [frxDBdsSimpleTrebHeader."FC_TREB"]'
            #1056#1109#1057#8218'  [frxDBdsSimpleTrebHeader."TRUNC_DATE"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Top = 44.000000000000000000
          Width = 680.315400000000000000
          Height = 19.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1108#1057#1107#1056#1169#1056#176': [frxDBdsSimpleTrebHeader."FC_GROUPFROM_WITH_NAME"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 63.000000000000000000
          Width = 680.315400000000000000
          Height = 19.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1057#1107#1056#1169#1056#176': [frxDBdsSimpleTrebHeader."FC_GROUPTO_WITH_NAME"]')
          ParentFont = False
        end
      end
      object MasterHeader1: TfrxHeader
        Height = 47.000000000000000000
        Top = 257.008040000000000000
        Width = 680.315400000000000000
        ReprintOnNewPage = True
        object Memo45: TfrxMemoView
          Left = 35.000000000000000000
          Top = 8.000000000000000000
          Width = 416.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Top = 8.000000000000000000
          Width = 35.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 540.000000000000000000
          Top = 8.000000000000000000
          Width = 70.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1057#1026#1056#181#1056#177'. '#1056#1108#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 451.000000000000000000
          Top = 8.000000000000000000
          Width = 89.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 610.315400000000000000
          Top = 8.000000000000000000
          Width = 70.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#8249#1056#1169'. '#1056#1108#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 20.000000000000000000
        Top = 325.039580000000000000
        Width = 680.315400000000000000
        AllowSplit = True
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frxDBdsSimpleTrebData
        DataSetName = 'frxDBdsSimpleTrebData'
        RowCount = 0
        Stretched = True
        object Memo27: TfrxMemoView
          Left = 35.000000000000000000
          Width = 416.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          Memo.UTF8 = (
            '[frxDBdsSimpleTrebData."FC_MEDIC"]')
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Width = 35.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 540.000000000000000000
          Width = 70.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsSimpleTrebData."FN_KOL"]')
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 451.000000000000000000
          Width = 89.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsSimpleTrebData."FC_EDIZM"]')
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 610.315400000000000000
          Width = 70.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.000000000000000000
        Top = 487.559370000000000000
        Width = 680.315400000000000000
        object Memo8: TfrxMemoView
          Left = 379.315400000000000000
          Width = 301.000000000000000000
          Height = 22.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 18.000000000000000000
        Top = 408.189240000000000000
        Width = 680.315400000000000000
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 6.000000000000000000
          Width = 650.000000000000000000
          Height = 18.000000000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[VAR_SIGNS]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 20.000000000000000000
        Top = 366.614410000000000000
        Width = 680.315400000000000000
        AllowSplit = True
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        RowCount = 1
      end
      object mdFinSource: TfrxMasterData
        Height = 28.000000000000000000
        Top = 166.299320000000000000
        Visible = False
        Width = 680.315400000000000000
        RowCount = 1
        object Memo9: TfrxMemoView
          Top = 6.000000000000000000
          Width = 680.320000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#152#1057#1027#1057#8218#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039': [frxDBdsSimpleTre' +
              'bHeader."FC_FINSOURCE"]')
          ParentFont = False
        end
      end
      object mdComment: TfrxMasterData
        Height = 20.000000000000000000
        Top = 215.433210000000000000
        Width = 680.315400000000000000
        RowCount = 1
        Stretched = True
        object Memo7: TfrxMemoView
          Width = 680.315400000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1112#1056#181#1057#8218#1056#1108#1056#1105': [frxDBdsSimpleTrebHeader."FC_COMMENT"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBdsSimpleTrebData: TfrxDBDataset
    UserName = 'frxDBdsSimpleTrebData'
    CloseDataSource = False
    DataSet = odsSimpleTrebData
    BCDToCurrency = False
    Left = 150
    Top = 142
  end
  object frxDBdsSimpleTrebHeader: TfrxDBDataset
    UserName = 'frxDBdsSimpleTrebHeader'
    CloseDataSource = False
    DataSet = odsSimpleTrebHeader
    BCDToCurrency = False
    Left = 154
    Top = 204
  end
  object odsTSMINI: TOracleDataSet
    SQL.Strings = (
      
        'select sm.fk_id, sm.fc_section, sm.fc_key, sm.fc_value from asu.' +
        'tsmini sm'
      'where'
      ' UPPER(sm.fc_section) = UPPER(:aSection)'
      ' AND UPPER(sm.fc_key) = UPPER(:aKey)')
    Optimize = False
    Variables.Data = {
      0300000002000000090000003A4153454354494F4E0500000000000000000000
      00050000003A414B4559050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Cursor = crSQLWait
    Left = 26
    Top = 292
  end
  object frInvoice_MID: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    Title = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077
    RebuildPrinter = False
    OnGetValue = frxTrebNaklGetValue
    OnUserFunction = frInvoice_MIDUserFunction
    OnObjectClick = frInvoice_MIDObjectClick
    OnMouseOverObject = frInvoice_MIDMouseOverObject
    Left = 321
    Top = 168
    ReportForm = {
      19000000343F0000190000FFFF01000100FFFFFFFFFF09000000340800009A0B
      00002400000024000000240000002400000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200A70100000C005265706F72745469746C65310002010000
      00001C000000F60200001D0100003000000001000000000000000000FFFFFF1F
      0000000000000000000008000500626567696E0D0F002020464E5F53554D4D20
      3A3D20303B0D0F0020204C6173744E756D203A3D20303B0D00000D4200202069
      5F464B5F49445F4D4153544552203A3D20303B202F2F20EDEEECE5F020205B6F
      647353656C446F63507269685265702E22464B5F49445F4D4153544552225D0D
      2F002020695F726F775F6E756D5F64657461696C203A3D20313B202F2F20EDEE
      ECE5F020F1F2F0EEEAE82064657461696C0D2E002020695F726F775F6E756D5F
      6D6173746572203A3D20303B202F2FEDEEECE5F020F1F2F0EEEAE8206D617374
      65720D0300656E6400FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200140200000D004D6173746572486561
      646572310002010000000044010000F602000032000000700004000100000000
      0000000000FFFFFF1F00000000000000000000000000FFFF0000000000020000
      00010000000000000001000000C8000000140000000100000000000002007A03
      00000B004D617374657244617461310002010000000090010000F60200001100
      00003100050001000000000000000000FFFFFF1F000000001100667244426473
      496E766F6963655F4D49440000000009000500626567696E0D60002F2F202069
      66205B46494E414C504153535D20616E6420285B50414745235D203D205B544F
      54414C50414745535D2D312920414E4420285B4652454553504143455D203C20
      5265706F727453756D6D617279312E48656967687429207468656E0D0E002F2F
      202020204E6577506167653B0D1D002F2F202020207768696C65204672656553
      70616365203E20323020646F0D19002F2F20202020202053686F7742616E6428
      4368696C6431293B0D24002F2F5B667244426473496E766F6963655F4D49442E
      22464B5F49445F4D4153544552225D0D00000D00000D0300656E6400FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200E80300000E005265706F727453756D6D617279310002010000000050
      020000F6020000060100003000010001000000000000000000FFFFFF1F000000
      00000000000000000000FFFF0000000000020000000100000000000000010000
      00C800000014000000010000000000000200550400000D004D6173746572466F
      6F7465723100020100000000C0010000F6020000110000003000060001000000
      000000000000FFFFFF1F00000000000000000000000000FFFF00000000000200
      0000010000000000000001000000C800000014000000010000000000000200C0
      0400000B0050616765466F6F7465723100020100000000F4030000F602000015
      0000003000030001000000000000000000FFFFFF1F0000000000000000000000
      0000FFFF000000000002000000010000000000000001000000C8000000140000
      000100000000000002002C0500000B004D617374657244617461320002010000
      000018020000F6020000140000003100050001000000000000000000FFFFFF1F
      0000000001003100000000000000FFFF00000000000200000001000000000000
      0001000000C800000014000000010000000000000200990500000D004D617374
      65724865616465723200020100000000EC010000F60200001C00000030000400
      01000000000000000000FFFFFF1F00000000000000000000000000FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      0000001B06000005004D656D6F32000200980200008900000038000000150000
      0003000F0001000000000000000000FFFFFF1F2C02000000000001000400EAEE
      E4FB00000000FFFF00000000000200000001000000000500417269616C000A00
      00000200000000000A000000CC00020000000000FFFFFF000000000200000000
      00000000009706000005004D656D6F3300020098020000B20000003800000014
      00000003000F0001000000000000000000FFFFFF1F2C02000000000000000000
      0000FFFF00000000000200000001000000000500417269616C000A0000000200
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      001307000005004D656D6F3400020098020000C6000000380000001400000003
      000F0001000000000000000000FFFFFF1F2C020000000000000000000000FFFF
      00000000000200000001000000000500417269616C000A000000020000000000
      0A000000CC00020000000000FFFFFF00000000020000000000000000008F0700
      0005004D656D6F3500020098020000DA000000380000001400000003000F0001
      000000000000000000FFFFFF1F2C020000000000000000000000FFFF00000000
      000200000001000000000500417269616C000A0000000200000000000A000000
      CC00020000000000FFFFFF00000000020000000000000000001408000005004D
      656D6F36000200980200009E000000380000001400000003000F000100000000
      0000000000FFFFFF1F2C020000000000010007003035303432333400000000FF
      FF00000000000200000001000000000500417269616C00080000000000000000
      000A000000CC00020000000000FFFFFF00000000020000000000000000009008
      000005004D656D6F3700020098020000EE000000380000001C00000003000F00
      01000000000000000000FFFFFF1F2C020000000000000000000000FFFF000000
      00000200000001000000000500417269616C000A0000000200000000000A0000
      00CC00020000000000FFFFFF0000000002000000000000000000150900000500
      4D656D6F390002005F0200009E00000037000000150000000300000001000000
      000000000000FFFFFF1F2C02000000000001000700EFEE20CECAD3C400000000
      FFFF00000000000200000001000000000500417269616C000800000000000000
      000008000000CC00020000000000FFFFFF000000000200000000000000000097
      09000005004D656D6F380002005F020000B40000003700000014000000030000
      0001000000000000000000FFFFFF1F2C02000000000001000400C4E0F2E00000
      0000FFFF00000000000200000001000000000500417269616C00080000000000
      0000000008000000CC00020000000000FFFFFF00000000020000000000000000
      001D0A000006004D656D6F31300002005F020000F10000003700000015000000
      0300000001000000000000000000FFFFFF1F2C02000000000001000700EFEE20
      CECACFCE00000000FFFF00000000000200000001000000000500417269616C00
      0900000000000000000008000000CC00020000000000FFFFFF00000000020000
      00000000000000A20A000006004D656D6F31310002005F020000DC0000003700
      0000140000000300000001000000000000000000FFFFFF1F2C02000000000001
      000600EFEE20CAD1CF00000000FFFF0000000000020000000100000000050041
      7269616C000900000000000000000008000000CC00020000000000FFFFFF0000
      000002000000000000000000280B000006004D656D6F31320002005F020000C8
      00000037000000140000000300000001000000000000000000FFFFFF1F2C0200
      0000000001000700EFEE20CECACFCE00000000FFFF0000000000020000000100
      0000000500417269616C000800000000000000000008000000CC000200000000
      00FFFFFF0000000002000000000000000000C90B000006004D656D6F31330002
      00600000008B000000EC000000140000000300000001000000000000000000FF
      FFFF1F2C02000000000001001800CDC0CACBC0C4CDC0DF2028D2D0C5C1CEC2C0
      CDC8C52920B900000000FFFF00000000000200000001000000000F0054696D65
      73204E657720526F6D616E000C00000000000000000008000000CC0002000000
      0000FFFFFF00000000020000000000000000005E0C000006004D656D6F313400
      0200500100008B00000098000000140000000300020001000000000000000000
      FFFFFF1F2C02000000000001000C005B5641525F46435F444F435D00000000FF
      FF00000000000200000001000000000F0054696D6573204E657720526F6D616E
      000C0000000000000000000A000000CC00020000000000FFFFFF000000000200
      0000000000000000F00C000006004D656D6F3135000200F60100009F0000003C
      000000100000000300000001000000000000000000FFFFFF1F2C020000000000
      01000900D4EEF0ECE02034333400000000FFFF00000000000200000001000000
      000F0054696D6573204E657720526F6D616E0008000000000000000000000000
      00CC00020000000000FFFFFF00000000020000000000000000008F0D00000600
      4D656D6F313600020024000000B8000000950000001100000003000000010000
      00000000000000FFFFFF1F2C02000000000001001600D3F7E5F0E5E6E4E5EDE8
      E520EFEEEBF3F7E0F2E5EBFC00000000FFFF0000000000020000000100000000
      0F0054696D6573204E657720526F6D616E000A00000000000000000000000000
      CC00020000000000FFFFFF0000000002000000000000000000310E000006004D
      656D6F313800020024000000DA000000A4000000150000000300000001000000
      000000000000FFFFFF1F2C02000000000001001900D1F2F0F3EAF2F3F0EDEEE5
      20EFEEE4F0E0E7E4E5EBE5EDE8E500000000FFFF000000000002000000010000
      00000F0054696D6573204E657720526F6D616E000A0000000000000000001000
      0000CC00020000000000FFFFFF0000000002000000000000000000D90E000006
      004D656D6F31390002002400000008010000C500000014000000030000000100
      0000000000000000FFFFFF1F2C02000000000001001F00CCE0F2E5F0E8E0EBFC
      EDEEE520EEF2E2E5F2F1F2E2E5EDEDEEE520EBE8F6EE00000000FFFF00000000
      000200000001000000000F0054696D6573204E657720526F6D616E000A000000
      00000000000010000000CC00020000000000FFFFFF0000000002000000000000
      0000009D0F000006004D656D6F3230000200EC000000070100004C0100001400
      00000300020001000000000000000000FFFFFF1F2C02000000000001000E005B
      5641525F46435F4D4F5F544F5D0003000500626567696E0D1D0020202F2F205B
      6F647353656C446F634D6F76652E224E414D45544F225D0D0300656E6400FFFF
      00000000000200000001000000000F0054696D6573204E657720526F6D616E00
      0A00000000000000000012000000CC00020000000000FFFFFF00000000020000
      000000000000003510000006004D656D6F3231000200480100001C0100007C00
      0000140000000300000001000000000000000000FFFFFF1F2C02000000000001
      000F00C4EEEBE6EDEEF1F2FC202F20D4C8CE00000000FFFF0000000000020000
      0001000000000F0054696D6573204E657720526F6D616E000A00000000000000
      000002000000CC00020000000000FFFFFF0000000002000000000000000000CA
      10000006004D656D6F34350002004700000044010000CD000000320000000300
      0F002C010000000000000000FFFFFF1F2C02000000000001000C00CDE0E8ECE5
      EDEEE2E0EDE8E500000000FFFF00000000000200000001000000000F0054696D
      6573204E657720526F6D616E000A0000000200000000000A000000CC00020000
      000000FFFFFF00000000020000000000000000006711000006004D656D6F3733
      0002003E01000044010000580000002100000003000F002C0100000000000000
      00FFFFFF1F2C02000000000001001400C1F3F5E3E0EBF2E5F0F1EAE0FF20E7E0
      EFE8F1FC00000000FFFF00000000000200000001000000000F0054696D657320
      4E657720526F6D616E000A0000000200000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000FA11000006004D656D6F3734000200
      9601000044010000910000002100000003000F002C010000000000000000FFFF
      FF1F2C02000000000001000A00CAEEEBE8F7E5F1F2E2EE00000000FFFF000000
      00000200000001000000000F0054696D6573204E657720526F6D616E000A0000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      000000008812000006004D656D6F323200020024000000440100002300000032
      00000003000F002C010000000000000000FFFFFF1F2C02000000000001000500
      B920EF2FEF00000000FFFF00000000000200000001000000000F0054696D6573
      204E657720526F6D616E000A0000000200000000000A000000CC000200000000
      00FFFFFF00000000020000000000000000001C13000006004D656D6F32330002
      002702000044010000420000003200000003000F002C010000000000000000FF
      FFFF1F2C02000000000002000500D6E5EDE02C0D0300F0F3E100000000FFFF00
      000000000200000001000000000F0054696D6573204E657720526F6D616E000A
      0000000200000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000000AA13000006004D656D6F32340002003E010000650100002A0000
      001100000003000F002C010000000000000000FFFFFF1F2C0200000000000100
      0500C4E5E1E5F200000000FFFF00000000000200000001000000000F0054696D
      6573204E657720526F6D616E00080000000200000000000A000000CC00020000
      000000FFFFFF00000000020000000000000000003914000006004D656D6F3235
      00020068010000650100002E0000001100000003000F002C0100000000000000
      00FFFFFF1F2C02000000000001000600CAF0E5E4E8F200000000FFFF00000000
      000200000001000000000F0054696D6573204E657720526F6D616E0008000000
      0200000000000A000000CC00020000000000FFFFFF0000000002000000000000
      000000CD14000006004D656D6F33300002009601000065010000460000001100
      000001000F002C010000000000000000FFFFFF1F2C02000000000001000B00C7
      E0F2F0E5E1EEE2E0EDEE00000000FFFF00000000000200000001000000000F00
      54696D6573204E657720526F6D616E00080000000200000000000A000000CC00
      020000000000FFFFFF00000000020000000000000000005E15000006004D656D
      6F3331000200DC010000650100004B0000001100000003000F002C0100000000
      00000000FFFFFF1F2C02000000000001000800CEF2EFF3F9E5EDEE00000000FF
      FF00000000000200000001000000000F0054696D6573204E657720526F6D616E
      00080000000200000000000A000000CC00020000000000FFFFFF000000000200
      0000000000000000F315000006004D656D6F3332000200690200004401000067
      0000003200000003000F002C010000000000000000FFFFFF1F2C020000000000
      02000600D1F3ECECE02C0D0300F0F3E100000000FFFF00000000000200000001
      000000000F0054696D6573204E657720526F6D616E000A000000020000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000841600
      0006004D656D6F323600020014010000440100002A0000003200000007000F00
      2C010000000000000000FFFFFF1F2C02000000000001000800C5E42E20E8E7EC
      2E00000000FFFF00000000000200000001000000000F0054696D6573204E6577
      20526F6D616E000A0000000200000000000A000000CC00020000000000FFFFFF
      0000000002000000000000000000A517000006004D656D6F3832000200470000
      0090010000CD0000001100000003000F002C010000000000000000FFFFFF1F2C
      020000000000010020005B6F6473496E766F6963655F4D49442E2246435F4D45
      4449435F4E414D45225D0003000500626567696E0D68002F2F2020696620285B
      6F6473496E766F696365322E2246435F53455249414C225D203C3E2027272920
      7468656E207354656D70203A3D20272C27202B205B6F6473496E766F69636532
      2E2246435F53455249414C225D20656C7365207354656D70203A3D2027273B0D
      0300656E6400FFFF00000000000200000001000000000F0054696D6573204E65
      7720526F6D616E000C00000000000000000008000000CC00020000000000FFFF
      FF0000000002000000000000000000E71D000006004D656D6F38310002002400
      000090010000230000001100000003000F002C010000000000000000FFFFFF1F
      2C020000000000010012005B695F726F775F6E756D5F6D61737465725D003200
      0500626567696E0D7400696620695F464B5F49445F4D41535445523C3E5B6F64
      73496E766F6963655F4D49442E22464B5F49445F4D4153544552225D20746865
      6E202F2FEDEEE2FBE920ECE0F1F2E5F020EFEEF8E5EB2C20EDE0E4EE20E8E7EC
      E5EDE8F2FC20F0E8F1EEE2E0EDE8E520EDE5EAEEF2EEF0FBF520ECE5ECEE0D07
      002020426567696E0D3500202020695F464B5F49445F4D4153544552203A3D20
      5B6F6473496E766F6963655F4D49442E22464B5F49445F4D4153544552225D3B
      0D2C00202020695F726F775F6E756D5F6D6173746572203A3D20695F726F775F
      6E756D5F6D6173746572202B20313B0D1C002020204D656D6F38315F2E766973
      69626C65203A3D2066616C73653B0D1C002020204D656D6F38325F2E76697369
      626C65203A3D2066616C73653B0D1C002020204D656D6F38335F2E7669736962
      6C65203A3D2066616C73653B0D1C002020204D656D6F38345F2E76697369626C
      65203A3D2066616C73653B0D1C002020204D656D6F38355F2E76697369626C65
      203A3D2066616C73653B0D1C002020204D656D6F38365F2E76697369626C6520
      3A3D2066616C73653B0D1C002020204D656D6F38375F2E76697369626C65203A
      3D2066616C73653B0D1C002020204D656D6F38385F2E76697369626C65203A3D
      2066616C73653B0D1C002020204D656D6F38395F2E76697369626C65203A3D20
      66616C73653B0D00000D1A002020204D656D6F38312E4672616D655479706520
      3A3D2031353B0D1A002020204D656D6F38322E4672616D6554797065203A3D20
      31353B0D1A002020204D656D6F38332E4672616D6554797065203A3D2031353B
      0D1A002020204D656D6F38342E4672616D6554797065203A3D2031353B0D1A00
      2020204D656D6F38352E4672616D6554797065203A3D2031353B0D1A00202020
      4D656D6F38362E4672616D6554797065203A3D2031353B0D1A002020204D656D
      6F38372E4672616D6554797065203A3D2031353B0D1A002020204D656D6F3838
      2E4672616D6554797065203A3D2031353B0D1A002020204D656D6F38392E4672
      616D6554797065203A3D2031353B0D05002020656E640D4200656C7365202020
      2F2FFDF2EE20F1EFE8F1EEEA2064657461696C2C20F22EE52E20F1EFE8F1EEEA
      20EFEEE4F7E8EDE5EDEDFBF520E2EDF3F2F0E820ECE0F1F2E5F0E00D07002020
      426567696E0D1B002020204D656D6F38315F2E76697369626C65203A3D207472
      75653B0D1B002020204D656D6F38325F2E76697369626C65203A3D2074727565
      3B0D1B002020204D656D6F38335F2E76697369626C65203A3D20747275653B0D
      1B002020204D656D6F38345F2E76697369626C65203A3D20747275653B0D1B00
      2020204D656D6F38355F2E76697369626C65203A3D20747275653B0D1B002020
      204D656D6F38365F2E76697369626C65203A3D20747275653B0D1B002020204D
      656D6F38375F2E76697369626C65203A3D20747275653B0D1B002020204D656D
      6F38385F2E76697369626C65203A3D20747275653B0D1B002020204D656D6F38
      395F2E76697369626C65203A3D20747275653B0D00000D19002020204D656D6F
      38312E4672616D6554797065203A3D20353B0D19002020204D656D6F38322E46
      72616D6554797065203A3D20353B0D19002020204D656D6F38332E4672616D65
      54797065203A3D20353B0D19002020204D656D6F38342E4672616D6554797065
      203A3D20353B0D19002020204D656D6F38352E4672616D6554797065203A3D20
      353B0D19002020204D656D6F38362E4672616D6554797065203A3D20353B0D19
      002020204D656D6F38372E4672616D6554797065203A3D20353B0D1900202020
      4D656D6F38382E4672616D6554797065203A3D20353B0D19002020204D656D6F
      38392E4672616D6554797065203A3D20353B0D06002020656E643B0D00000D20
      0020204C6173744E756D203A3D205B695F726F775F6E756D5F6D61737465725D
      3B0D0300656E6400FFFF00000000000200000001000000000F0054696D657320
      4E657720526F6D616E000A0000000000000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000201F000006004D656D6F3838000200
      2702000090010000420000001100000003000F002C010000000000000000FFFF
      FF1F2C02030100000001001B005B6F6473496E766F6963655F4D49442E22464E
      5F5052494345225D0003000500626567696E0D85002F2F20206966205B6F6473
      5265706F72742E22464E5F4B4F4C225D203D202D31207468656E2074656D7050
      72696365203A3D20272720656C73652074656D705072696365203A3D20464F52
      4D4154464C4F41542827302E3030272C205B6F64735265706F72742E2253554D
      4D225D2F5B6F64735265706F72742E22464E5F4B4F4C225D293B0D0300656E64
      00FFFF00000000000200000001000000000F0054696D6573204E657720526F6D
      616E000A00000000000000000009000000CC00020000000000FFFFFF00000000
      02000000000000000000A71F000006004D656D6F38340002003E010000900100
      002A0000001100000003000F002C010000000000000000FFFFFF1F2C02000000
      0000000000000000FFFF00000000000200000001000000000F0054696D657320
      4E657720526F6D616E000C0000000000000000000A000000CC00020000000000
      FFFFFF00000000020000000000000000002E20000006004D656D6F3835000200
      68010000900100002E0000001100000003000F002C010000000000000000FFFF
      FF1F2C020000000000000000000000FFFF00000000000200000001000000000F
      0054696D6573204E657720526F6D616E000C0000000000000000000A000000CC
      00020000000000FFFFFF00000000020000000000000000004E21000006004D65
      6D6F38360002009601000090010000460000001100000001000F002C01000000
      0000000000FFFFFF1F2C02020100000001001E005B6F6473496E766F6963655F
      4D49442E22464E5F545245425F4B4F4C225D0003000500626567696E0D69002F
      2F20206966205B6F64735265706F72742E22464E5F545245424B4F4C225D203D
      202D31207468656E2074656D70547265624B6F6C203A3D20272720656C736520
      74656D70547265624B6F6C203A3D205B6F64735265706F72742E22464E5F5452
      45424B4F4C225D3B0D0300656E6400FFFF00000000000200000001000000000F
      0054696D6573204E657720526F6D616E000A0000000000000000000A000000CC
      00020000000000FFFFFF00000000020000000000000000006022000006004D65
      6D6F3837000200DC010000900100004B0000001100000003000F002C01000000
      0000000000FFFFFF1F2C020201000000010020005B6F6473496E766F6963655F
      4D49442E22464E5F564944414E4F5F4B4F4C225D0003000500626567696E0D59
      002F2F20206966205B6F64735265706F72742E22464E5F4B4F4C225D203D202D
      31207468656E2074656D704B6F6C203A3D20272720656C73652074656D704B6F
      6C203A3D205B6F64735265706F72742E22464E5F4B4F4C225D3B0D0300656E64
      00FFFF00000000000200000001000000000F0054696D6573204E657720526F6D
      616E000A0000000000000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000E923000006004D656D6F383900020069020000900100
      00670000001100000003000F002C010000000000000000FFFFFF1F2C02030100
      0000010020005B6F6473496E766F6963655F4D49442E22464E5F564944414E4F
      5F53554D225D0005000500626567696E0D38002020464E5F53554D4D203A3D20
      464E5F53554D4D202B205B6F6473496E766F6963655F4D49442E22464E5F5649
      44414E4F5F53554D225D3B0D6A002F2F20206966205B6F64735265706F72742E
      2253554D4D225D203D202D31207468656E2074656D7053756D203A3D20272720
      656C73652074656D7053756D203A3D20464F524D4154464C4F41542827302E30
      30272C205B6F64735265706F72742E2253554D4D225D293B0D28002F2F202020
      20693131203A3D20693131202B205B6F6473496E766F696365322E2253554D4D
      225D3B0D0300656E6400FFFF00000000000200000001000000000F0054696D65
      73204E657720526F6D616E000A00000000000000000009000000CC0002000000
      0000FFFFFF00000000020000000000000000009224000006004D656D6F383300
      020014010000900100002A0000001100000007000F002C010000000000000000
      FFFFFF1F2C020000000000010020005B6F6473496E766F6963655F4D49442E22
      46435F4544495A4D5F4E414D45225D00000000FFFF0000000000020000000100
      0000000F0054696D6573204E657720526F6D616E000A0000000000000000000A
      000000CC00020000000000FFFFFF000000000200000000000000000027250000
      06004D656D6F3339000200240000009D020000A8000000100000000300000001
      000000000000000000FFFFFF1F2C02000000000001001600C7E0E2E5E4F3FEF9
      E8E920EEF2E4E5EBE5EDE8E5EC3A00000000FFFF000000000002000000010000
      00000500417269616C000A0000000000000000000A000000CC00020000000000
      FFFFFF0000000002000000000000000000AF25000006004D656D6F3430000200
      24000000CD02000040000000100000000300000001000000000000000000FFFF
      FF1F2C02000000000001000900CEF2EFF3F1F2E8EB3A00000000FFFF00000000
      000200000001000000000500417269616C000A0000000000000000000A000000
      CC00020000000000FFFFFF00000000020000000000000000003626000006004D
      656D6F3431000200240000002D03000040000000100000000300000001000000
      000000000000FFFFFF1F2C02000000000001000800CFEEEBF3F7E8EB3A000000
      00FFFF00000000000200000001000000000500417269616C000A000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      EB26000006004D656D6F34320002002A02000097020000A00000001400000003
      00020001000000000000000000FFFFFF1F2C020000000000010036005B464F52
      4D41544441544554494D452827272722272764642727222727206D6D6D6D2079
      797979202727E32E2727272C44415445295D00000000FFFF0000000000020000
      0001000000000500417269616C000A00000000000000000009000000CC000200
      00000000FFFFFF0000000002000000000000000000A027000006004D656D6F34
      330002002A020000CA020000A000000014000000030002000100000000000000
      0000FFFFFF1F2C020000000000010036005B464F524D41544441544554494D45
      2827272722272764642727222727206D6D6D6D2079797979202727E32E272727
      2C44415445295D00000000FFFF00000000000200000001000000000500417269
      616C000A00000000000000000009000000CC00020000000000FFFFFF00000000
      020000000000000000005528000006004D656D6F343400020029020000FC0200
      00A0000000140000000300020001000000000000000000FFFFFF1F2C02000000
      0000010036005B464F524D41544441544554494D452827272722272764642727
      222727206D6D6D6D2079797979202727E32E2727272C44415445295D00000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000009000000CC00020000000000FFFFFF0000000002000000000000000000F6
      28000006004D656D6F343900020025000000EF000000A0000000150000000300
      000001000000000000000000FFFFFF1F2C02000000000001001800D3F7F0E5E6
      E4E5EDE8E52028EEF2EFF0E0E2E8F2E5EBFC2900000000FFFF00000000000200
      000001000000000F0054696D6573204E657720526F6D616E000A000000000000
      00000000000000CC00020000000000FFFFFF0000000002000000000000000000
      9429000006004D656D6F3530000200DD000000EF000000720100001500000003
      00020001000000000000000000FFFFFF1F2C020000000000010015005B564152
      5F46435F4D4F47524F55505F46524F4D5D00000000FFFF000000000002000000
      01000000000F0054696D6573204E657720526F6D616E000A0000000000000000
      0012000000CC00020000000000FFFFFF0000000002000000000000000000302A
      000006004D656D6F3531000200DD000000DA0000007201000015000000030002
      0001000000000000000000FFFFFF1F2C020000000000010013005B5641525F46
      435F4D4F47524F55505F544F5D00000000FFFF00000000000200000001000000
      000F0054696D6573204E657720526F6D616E000A000000000000000000120000
      00CC00020000000000FFFFFF0000000002000000000000000000C72A00000600
      4D656D6F3137000200DC000000AE000000720100002C00000003000200010000
      00000000000000FFFFFF1F2C02000000000001000E005B7661725F7265636569
      7665725D00000000FFFF00000000000200000001000000000F0054696D657320
      4E657720526F6D616E000A00000000000000000012000000CC00020000000000
      FFFFFF0000000002000000000000000000562B000006004D656D6F3532000200
      24000000C0010000030200001100000003000F002C010000000000000000FFFF
      FF1F2C02000000000001000600C8F2EEE3EE3A00000000FFFF00000000000200
      000001000000000F0054696D6573204E657720526F6D616E000C000000020000
      00000009000000CC00020000000000FFFFFF0000000002000000000000000000
      F82B000006004D656D6F353300020027020000C0010000A90000001100000003
      000F002C010000000000000000FFFFFF1F2C0204011000232323202323232023
      23302E303020F000010009005B464E5F53554D4D5D00000000FFFF0000000000
      0200000001000000000F0054696D6573204E657720526F6D616E000C00000002
      000000000009000000CC00020000000000FFFFFF000000000200000000000000
      00009D2C000006004D656D6F35340002003A020000F403000098000000140000
      000300000001000000000000000000FFFFFF1F2C02000000000001001C00F1F2
      F02E205B50414745235D20E8E7205B544F54414C50414745535D00000000FFFF
      00000000000200000001000000000F0054696D6573204E657720526F6D616E00
      0A00000000000000000009000000CC00020000000000FFFFFF00000000020000
      00000000000000442D000006004D656D6F353500020024000000C8000000B800
      0000140000000300000001000000000000000000FFFFFF1F2C02000000000001
      001E0028F6E5EDF2F0E0EBE8E7EEE2E0EDEDE0FF20E1F3F5E3E0EBF2E5F0E8FF
      2900000000FFFF00000000000200000001000000000F0054696D6573204E6577
      20526F6D616E000A00000000000000000000000000CC00020000000000FFFFFF
      0000000002000000000000000000F92D000006004D656D6F3536000200540200
      00690000007C000000130000000900020001000000000000000000FFFFFF1F2C
      020000000000010036005B464F524D41544441544554494D4528272727222727
      64642727222727206D6D6D6D2079797979202727E32E2727272C44415445295D
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      00000000000009000000CC00020000000000FFFFFF0000000002000000000000
      000000D22E000006004D656D6F353700020025000000A4000000880000001300
      00000900020001000000000000000000FFFFFF1F2C020000000000010010005B
      5641525F46435F494E564F4943455D0003000500626567696E0D3A00202F2F20
      5B464F524D41544441544554494D452827272722272764642727222727206D6D
      6D6D2079797979202727E32E2727272C44415445295D0D0300656E6400FFFF00
      000000000200000001000000000500417269616C000A00000000000000000008
      000000CC00020000000000FFFFFF00000000020000000000000000009A2F0000
      06004D656D6F353800020016010000BD020000E0000000200000000300000001
      000000000000000000FFFFFF1F2C020000000000010010005B5641525F46435F
      4D4F5F46524F4D5D0003000500626567696E0D1F0020202F2F205B6F64735365
      6C446F634D6F76652E224E414D4546524F4D225D0D0300656E6400FFFF000000
      00000200000001000000000F0054696D6573204E657720526F6D616E000A0000
      0000000000000012000000CC00020000000000FFFFFF00000000020000000000
      000000005730000006004D656D6F3539000200160100008D020000E000000020
      0000000300000001000000000000000000FFFFFF1F2C02000000000001001300
      5B5641525F46435F5A41565F4F54445F544F5D0003000500626567696E0D1100
      20202F2F205B7661725F4D61674F74645D0D0300656E6400FFFF000000000002
      00000001000000000F0054696D6573204E657720526F6D616E000A0000000000
      0000000012000000CC00020000000000FFFFFF00000000020000000000000000
      001B31000006004D656D6F3630000200160100001D030000E000000020000000
      0300000001000000000000000000FFFFFF1F2C02000000000001000E005B5641
      525F46435F4D4F5F544F5D0003000500626567696E0D1D0020202F2F205B6F64
      7353656C446F634D6F76652E224E414D45544F225D0D0300656E6400FFFF0000
      0000000200000001000000000F0054696D6573204E657720526F6D616E000A00
      000000000000000012000000CC00020000000000FFFFFF000000000200000000
      0000000000AD31000006004D656D6F3631000200710200002400000060000000
      140000000300000001000000000000000000FFFFFF1F2C020000000000010009
      00D3D2C2C5D0C6C4C0DE00000000FFFF00000000000200000001000000000F00
      54696D6573204E657720526F6D616E000A00000000000000000012000000CC00
      020000000000FFFFFF00000000020000000000000000006732000006004D656D
      6F36320002007001000037000000A00000001D00000003000000010000000000
      00000000FFFFFF1F2C02000000000002001A00C7E0ECE5F1F2E8F2E5EBFC20E3
      EBE0E2EDEEE3EE20E2F0E0F7E00D1400EFEE20ECE5E4E8F6E8EDF1EAEEE920F7
      E0F1F2E800000000FFFF00000000000200000001000000000F0054696D657320
      4E657720526F6D616E000A00000000000000000008000000CC00020000000000
      FFFFFF0000000002000000000000000000FA32000006004D656D6F3633000200
      21020000540000003D000000100000000300000001000000000000000000FFFF
      FF1F2C02000000000001000A002028EFEEE4EFE8F1FC2900000000FFFF000000
      00000200000001000000000F0054696D6573204E657720526F6D616E000A0000
      0000000000000010000000CC00020000000000FFFFFF00000000020000000000
      000000008833000006004D656D6F3634000200A6020000540000002800000010
      0000000300000001000000000000000000FFFFFF1F2C02000000000001000500
      28D4C8CE2900000000FFFF00000000000200000001000000000F0054696D6573
      204E657720526F6D616E000A00000000000000000010000000CC000200000000
      00FFFFFF00000000020000000000000000002134000005004D656D6F31000200
      F501000044000000DC000000100000000300020001000000000000000000FFFF
      FF1F2C020000000000010011005B7661725F7A616D5F676C5F767261345D0000
      0000FFFF00000000000200000001000000000F0054696D6573204E657720526F
      6D616E000A00000000000000000009000000CC00020000000000FFFFFF000000
      0002000000000000000000E534000006004D656D6F363700020016010000ED02
      0000E0000000200000000300000001000000000000000000FFFFFF1F2C020000
      00000001000E005B5641525F46435F4D4F5F544F5D0003000500626567696E0D
      1D0020202F2F205B6F647353656C446F634D6F76652E224E414D45544F225D0D
      0300656E6400FFFF00000000000200000001000000000F0054696D6573204E65
      7720526F6D616E000A00000000000000000012000000CC00020000000000FFFF
      FF00000000020000000000000000006F35000006004D656D6F36350002002400
      0000FD02000050000000100000000300000001000000000000000000FFFFFF1F
      2C02000000000001000B00C7E0F2F0E5E1EEE2E0EB3A00000000FFFF00000000
      000200000001000000000500417269616C000A0000000000000000000A000000
      CC00020000000000FFFFFF00000000020000000000000000002436000006004D
      656D6F36380002002902000025030000A0000000140000000300020001000000
      000000000000FFFFFF1F2C020000000000010036005B464F524D415444415445
      54494D452827272722272764642727222727206D6D6D6D2079797979202727E3
      2E2727272C44415445295D00000000FFFF000000000002000000010000000005
      00417269616C000A00000000000000000009000000CC00020000000000FFFFFF
      0000000002000000000000000000D736000006004D656D6F3639000200240000
      0058020000AE020000340000000300000001000000000000000000FFFFFF1F2C
      00000000000001003400C2F1E5E3EE20EFEEE7E8F6E8E93A205B4C6173744E75
      6D5D2C20EDE020F1F3ECECF33A205B49544F4728464E5F53554D4D295D2E0000
      0000010000000000000200000001000000000500417269616C000A0000000000
      0000000008000000CC00020000000000FFFFFF00000000020000000000000000
      00A637000006004D656D6F343700020066000000DD0200009001000010000000
      0300080001000000000000000000FFFFFF1F2C02000000000001005000202020
      20202020202020202020202020202020202020202020202028EFEEE4EFE8F1FC
      2920202020202020202020202020202020202020202020202020202020202020
      202020202020202028D4C8CE2900000000FFFF00000000000200000001000000
      000500417269616C000800000000000000000008000000CC00020000000000FF
      FFFF00000000020000000000000000005538000006004D656D6F3436000200C6
      000000AD02000030010000100000000300080001000000000000000000FFFFFF
      1F2C0200000000000100300020202020202028EFEEE4EFE8F1FC292020202020
      202020202020202020202020202020202020202020202028D4C8CE2900000000
      FFFF00000000000200000001000000000500417269616C000800000000000000
      000008000000CC00020000000000FFFFFF000000000200000000000000000024
      39000006004D656D6F3636000200760000000D03000080010000100000000300
      080001000000000000000000FFFFFF1F2C020000000000010050002020202020
      2020202020202020202020202020202020202020202028EFEEE4EFE8F1FC2920
      2020202020202020202020202020202020202020202020202020202020202020
      20202020202028D4C8CE2900000000FFFF000000000002000000010000000005
      00417269616C000800000000000000000008000000CC00020000000000FFFFFF
      0000000002000000000000000000F339000006004D656D6F3438000200660000
      003D03000090010000100000000300080001000000000000000000FFFFFF1F2C
      0200000000000100500020202020202020202020202020202020202020202020
      202020202028EFEEE4EFE8F1FC29202020202020202020202020202020202020
      20202020202020202020202020202020202020202028D4C8CE2900000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      08000000CC00020000000000FFFFFF0000000002000000000000000000823A00
      0006004D656D6F37300002002400000018020000AE0200001400000003000000
      01000000000000000000FFFFFF1F2C020000000000010010005B5641525F4643
      5F434F4D4D454E545D00000000FFFF0000000000020000000100000000050041
      7269616C000A000000000000000000000000000100020000000000FFFFFF0000
      000002000000000000000000183B000006004D656D6F373100020024000000EC
      010000AE0200001C0000000300000001000000000000000000FFFFFF1F2C0200
      0000000001001700C7E0ECE5F7E0EDE8FF20EA20F2F0E5E1EEE2E0EDE8FE3A00
      000000FFFF00000000000200000001000000000500417269616C000A00000002
      0000000000100000000100020000000000FFFFFF000000000200000000000000
      0000B93B000006004D656D6F373200020024000000F403000044010000140000
      000300000001000000000000000000FFFFFF1F2C02000000000001002200B920
      5B5641525F46435F444F435D20EEF2205B5641525F46435F494E564F4943455D
      00000000FFFF00000000000200000001000000000500417269616C000A000000
      000000000000000000000100020000000000FFFFFF0000000002000000000000
      000000413C000007004D656D6F38325F0002004700000090010000CD00000011
      000000030005002C010000000000000000FFFFFF002C02000000000000000000
      0000FFFF00000000000200000001000000000F0054696D6573204E657720526F
      6D616E000C00000000000000000008000000CC00020000000000FFFFFF000000
      0002000000000000000000C93C000007004D656D6F38315F0002002400000090
      0100002300000011000000030005002C010000000000000000FFFFFF002C0200
      00000000000000000000FFFF00000000000200000001000000000F0054696D65
      73204E657720526F6D616E000A0000000000000000000A000000CC0002000000
      0000FFFFFF0000000002000000000000000000513D000007004D656D6F38345F
      0002003E010000900100002A00000011000000030005002C0100000000000000
      00FFFFFF002C020000000000000000000000FFFF000000000002000000010000
      00000F0054696D6573204E657720526F6D616E000C0000000000000000000A00
      0000CC00020000000000FFFFFF0000000002000000000000000000D93D000007
      004D656D6F38355F00020068010000900100002E00000011000000030005002C
      010000000000000000FFFFFF002C020000000000000000000000FFFF00000000
      000200000001000000000F0054696D6573204E657720526F6D616E000C000000
      0000000000000A000000CC00020000000000FFFFFF0000000002000000000000
      000000613E000007004D656D6F38365F00020096010000900100004600000011
      000000010005002C010000000000000000FFFFFF002C02020100000000000000
      0000FFFF00000000000200000001000000000F0054696D6573204E657720526F
      6D616E000A0000000000000000000A000000CC00020000000000FFFFFF000000
      0002000000000000000000E93E000007004D656D6F38335F0002001401000090
      0100002A00000011000000070005002C010000000000000000FFFFFF002C0200
      00000000000000000000FFFF00000000000200000001000000000F0054696D65
      73204E657720526F6D616E000A0000000000000000000A000000CC0002000000
      0000FFFFFF000000000200000000000000FEFEFF020000000A00207661726961
      626C6573000000000300693131000000000000000000000000FC000000000000
      0000000000000000000058002C0F48C6F5D3E24057A88319787CE440}
  end
  object frDBdsInvoice_MID: TfrDBDataSet
    DataSet = odsInvoice_MID
    Left = 320
    Top = 214
  end
  object frxTrebNakl_Old: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39387.554601956000000000
    ReportOptions.LastChange = 39388.690247395800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      
        'procedure Memo63OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1054#1090#1087#1091#1089#1090#1080#1083 +
        ':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo77OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1055#1086#1083#1091#1095#1080#1083':' +
        #39', s);'
      '  Modified := True;'
      'end;'
      ''
      'procedure Memo86OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SET('#39'FN_SUMM'#39', <FN_SUMM>+<frxDBdsInvoice2."FN_VIDANO_SUM">);  '
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SET('#39'FN_SUMM'#39', 0);  '
      'end;'
      ''
      
        'procedure Memo81OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1063#1077#1088#1077#1079' '#1082#1086 +
        #1075#1086':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      
        'procedure Memo89OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1047#1072#1074'. '#1086#1090#1076 +
        #1077#1083#1077#1085#1080#1077#1084' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103':'#39', s);'
      '  Modified := True;'
      'end;'
      ''
      'begin'
      '                      '
      'end.')
    OnGetValue = frxTrebNaklGetValue
    OnUserFunction = frxTrebNaklUserFunction
    Left = 82
    Top = 116
    Datasets = <
      item
        DataSet = frxDBdsInvoice2
        DataSetName = 'frxDBdsInvoice2'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'FN_SUMM'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Width = 3.000000000000000000
      LargeDesignHeight = True
      TitleBeforeHeader = False
      object Header2: TfrxHeader
        Height = 20.000000000000000000
        Top = 516.000000000000000000
        Width = 1009.134510000000000000
        object Memo93: TfrxMemoView
          Left = 118.165430000000000000
          Width = 294.803340000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 50.133890000000000000
          Width = 68.031540000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 412.968770000000000000
          Width = 75.590600000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 2.000000000000000000
          Width = 48.133890000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 488.559370000000000000
          Width = 56.692950000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 545.252320000000000000
          Width = 94.488250000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 696.433520000000000000
          Width = 56.692950000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '8')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 639.740570000000000000
          Width = 56.692950000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '7')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Left = 753.126470000000000000
          Width = 79.370130000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '9')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 832.496600000000000000
          Width = 94.488250000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '10')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 926.984850000000000000
          Width = 72.811070000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '11')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Left = 118.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line5: TfrxLineView
          Left = 118.000000000000000000
          Top = 19.000000000000000000
          Width = 294.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          Left = 2.000000000000000000
          Top = 19.000000000000000000
          Width = 116.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
        end
        object Line12: TfrxLineView
          Left = 412.000000000000000000
          Top = 19.000000000000000000
          Width = 132.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
        end
        object Line23: TfrxLineView
          Left = 697.000000000000000000
          Top = 19.000000000000000000
          Width = 301.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
        end
        object Line11: TfrxLineView
          Left = 488.560000000000000000
          Top = 1.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line27: TfrxLineView
          Left = 639.740000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line28: TfrxLineView
          Left = 753.130000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line29: TfrxLineView
          Left = 832.500000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line32: TfrxLineView
          Left = 926.980000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line34: TfrxLineView
          Left = 999.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line35: TfrxLineView
          Left = 2.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
      end
      object MasterData1: TfrxMasterData
        Height = 23.000000000000000000
        Top = 556.000000000000000000
        Width = 1009.134510000000000000
        DataSet = frxDBdsInvoice2
        DataSetName = 'frxDBdsInvoice2'
        RowCount = 0
        Stretched = True
        object Memo52: TfrxMemoView
          Left = 1.000000000000000000
          Width = 49.133890000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 50.133890000000000000
          Width = 68.031540000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 412.968770000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Memo67: TfrxMemoView
          Left = 118.165430000000000000
          Width = 294.803340000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FC_MEDIC_NAME"]')
          ParentFont = False
        end
        object Line6: TfrxLineView
          Left = 545.252320000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Memo72: TfrxMemoView
          Left = 545.252320000000000000
          Width = 94.488250000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FC_EDIZM_NAME"]')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 753.126470000000000000
          Width = 79.370130000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FN_AVG_PRICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 639.740570000000000000
          Width = 56.692950000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FN_TREB_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 832.496600000000000000
          Width = 94.488250000000000000
          Height = 23.000000000000000000
          OnBeforePrint = 'Memo86OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FN_VIDANO_SUM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line8: TfrxLineView
          Left = 926.984850000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Memo50: TfrxMemoView
          Left = 696.433520000000000000
          Width = 56.692950000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FN_VIDANO_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 412.970000000000000000
          Width = 75.590600000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 488.559370000000000000
          Width = 56.692950000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 927.000000000000000000
          Width = 71.811070000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Line9: TfrxLineView
          Left = 2.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line10: TfrxLineView
          Left = 117.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line13: TfrxLineView
          Left = 413.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line14: TfrxLineView
          Left = 545.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line24: TfrxLineView
          Left = 697.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line25: TfrxLineView
          Left = 998.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line22: TfrxLineView
          Left = 488.560000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line26: TfrxLineView
          Left = 639.740000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line30: TfrxLineView
          Left = 753.130000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line31: TfrxLineView
          Left = 832.500000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line33: TfrxLineView
          Left = 926.980000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
      end
      object Footer1: TfrxFooter
        Height = 39.000000000000000000
        Top = 600.000000000000000000
        Width = 1009.134510000000000000
        object Memo78: TfrxMemoView
          Left = 2.000000000000000000
          Width = 996.134510000000000000
          Height = 4.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 754.000000000000000000
          Width = 173.000000000000000000
          Height = 34.000000000000000000
          OnBeforePrint = 'Memo79OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 3.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[<FN_SUMM>]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 191.000000000000000000
        Top = 304.000000000000000000
        Width = 1009.134510000000000000
        RowCount = 1
        object Memo80: TfrxMemoView
          Left = 3.779530000000000000
          Top = 9.000000000000000000
          Width = 71.811070000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#167#1056#181#1057#1026#1056#181#1056#183' '#1056#1108#1056#1109#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo81: TfrxMemoView
          Left = 219.212740000000000000
          Top = 9.000000000000000000
          Width = 559.370440000000000000
          Height = 22.677180000000000000
          OnPreviewClick = 'Memo81OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_ZAV_APTEKA]')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Left = 3.779530000000000000
          Top = 39.236240000000010000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#176#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#187)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo89: TfrxMemoView
          Left = 219.212740000000000000
          Top = 39.234440000000010000
          Width = 220.976500000000000000
          Height = 18.900000000000000000
          OnPreviewClick = 'Memo89OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_FC_ZAV_OTD_TO]')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Left = 453.543600000000000000
          Top = 39.234439999999890000
          Width = 71.811070000000000000
          Height = 18.900000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#160#1056#176#1056#183#1057#1026#1056#181#1057#8364#1056#1105#1056#187)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo91: TfrxMemoView
          Left = 536.693260000000000000
          Top = 39.234439999999890000
          Width = 249.448980000000000000
          Height = 18.900000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1112'. '#1056#1110#1056#187'. '#1056#1030#1057#1026#1056#176#1057#8225#1056#176' '#1056#1111#1056#1109' '#1056#187#1056#181#1057#8225#1056#181#1056#177#1056#1029#1056#1109#1056#8470' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1056#181)
          ParentFont = False
          VAlign = vaBottom
        end
        object Line36: TfrxLineView
          Left = 718.110700000000000000
          Top = 58.133889999999780000
          Height = 34.015770000000000000
          ShowHint = False
          Frame.Color = clWhite
          Frame.Typ = [ftLeft]
        end
        object Memo92: TfrxMemoView
          Left = 536.693260000000000000
          Top = 61.913419999999970000
          Width = 215.433210000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1112'. '#1056#1110#1056#187'. '#1056#1030#1057#1026#1056#176#1057#8225#1056#176' '#1056#1111#1057#1026#1056#1109' '#1056#1111#1057#1026#1056#1109#1057#8222#1056#1105#1056#187#1057#1035)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo101: TfrxMemoView
          Left = 793.701300000000000000
          Top = 39.234439999999890000
          Width = 181.417440000000000000
          Height = 18.900000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Left = 793.701300000000000000
          Top = 65.692950000000000000
          Width = 181.417440000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo103: TfrxMemoView
          Left = 86.929190000000000000
          Top = 39.234439999999890000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1030'. '#1056#1109#1057#8218#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181#1056#1112)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo104: TfrxMemoView
          Left = 86.929190000000000000
          Top = 9.000000000000000000
          Width = 132.165430000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1030'. '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo105: TfrxMemoView
          Left = 118.165430000000000000
          Top = 126.598330000000000000
          Width = 370.393940000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1056#181' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 488.559370000000000000
          Top = 126.600000000000000000
          Width = 151.181200000000000000
          Height = 64.250000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169#1056#1105#1056#1029#1056#1105#1057#8224#1056#176' '#1056#1105#1056#183#1056#1112#1056#181#1057#1026#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Left = 639.740570000000000000
          Top = 126.598330000000000000
          Width = 113.385900000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 753.126470000000000000
          Top = 126.598330000000000000
          Width = 79.370130000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176','
            #1057#1026#1057#1107#1056#177'.'
            #1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 832.496600000000000000
          Top = 126.598330000000000000
          Width = 94.488250000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176
            #1056#177#1056#181#1056#183' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176
            #1056#1116#1056#8221#1056#1038','
            #1057#1026#1057#1107#1056#177'. '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          Left = 926.984850000000000000
          Top = 126.598330000000000000
          Width = 72.811070000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1056#1109#1056#1030#1057#8249#1056#8470
            #1056#1029#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1111#1056#1109
            #1057#1027#1056#1108#1056#187#1056#176#1056#1169#1057#1027#1056#1108#1056#1109#1056#8470
            #1056#1108#1056#176#1057#1026#1057#8218#1056#1109#1057#8218#1056#181#1056#1108#1056#181)
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 2.000000000000000000
          Top = 126.598330000000000000
          Width = 116.165430000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1057#1026#1057#1026#1056#181#1057#1027#1056#1111#1056#1109#1056#1029#1056#1169#1056#1105#1057#1026#1057#1107#1057#1035#1057#8240#1056#1105#1056#8470
            #1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 2.000000000000000000
          Top = 153.055040000000000000
          Width = 48.133890000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8225#1056#181#1057#8218','
            #1057#1027#1057#1107#1056#177#1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
        end
        object Memo113: TfrxMemoView
          Left = 50.133890000000000000
          Top = 153.055040000000000000
          Width = 68.031540000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1169' '#1056#176#1056#1029#1056#176#1056#187#1056#1105#1057#8218#1056#1105'-'
            #1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo114: TfrxMemoView
          Left = 118.165430000000000000
          Top = 153.055040000000000000
          Width = 294.803340000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          Left = 412.968770000000000000
          Top = 153.055040000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#1109#1056#1112#1056#181#1056#1029#1056#1108'-'
            #1056#187#1056#176#1057#8218#1057#1107#1057#1026#1056#1029#1057#8249#1056#8470
            #1056#1029#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
        end
        object Memo116: TfrxMemoView
          Left = 545.252320000000000000
          Top = 153.055040000000000000
          Width = 94.488250000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          Left = 488.559370000000000000
          Top = 153.055040000000000000
          Width = 56.692950000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1169)
          ParentFont = False
        end
        object Memo118: TfrxMemoView
          Left = 639.740570000000000000
          Top = 153.055040000000000000
          Width = 56.692950000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176#1057#8218#1057#1026#1056#181'-'
            #1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo119: TfrxMemoView
          Left = 696.433520000000000000
          Top = 153.055040000000000000
          Width = 56.692950000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1109#1057#8218#1056#1111#1057#1107'-'
            #1057#8240#1056#181#1056#1029#1056#1109)
          ParentFont = False
        end
      end
      object MasterData3: TfrxMasterData
        Height = 28.456710000000000000
        Top = 256.000000000000000000
        Width = 1009.134510000000000000
        RowCount = 1
        Stretched = True
        object Memo27: TfrxMemoView
          Left = 57.000000000000000000
          Width = 75.590600000000000000
          Height = 25.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mm.dd.yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FD_INVOICE]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 907.394250000000000000
          Width = 98.267780000000000000
          Height = 25.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 718.417750000000000000
          Width = 94.488250000000000000
          Height = 25.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 132.590600000000000000
          Width = 56.692950000000000000
          Height = 25.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 189.283550000000000000
          Width = 264.567100000000000000
          Height = 25.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FC_MOGROUP_FROM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 453.850650000000000000
          Width = 264.567100000000000000
          Height = 25.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FC_MOGROUP_TO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 812.906000000000000000
          Width = 94.488250000000000000
          Height = 25.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 812.906000000000000000
          Height = 26.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line37: TfrxLineView
          Left = 907.394250000000000000
          Height = 26.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line38: TfrxLineView
          Left = 718.417750000000000000
          Height = 26.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line39: TfrxLineView
          Left = 453.850650000000000000
          Height = 26.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line40: TfrxLineView
          Left = 189.283550000000000000
          Height = 26.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line41: TfrxLineView
          Left = 132.590600000000000000
          Height = 26.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
      end
      object MasterData4: TfrxMasterData
        Height = 19.000000000000000000
        Top = 660.000000000000000000
        Width = 1009.134510000000000000
        RowCount = 1
        Stretched = True
        object Memo47: TfrxMemoView
          Left = 22.000000000000000000
          Width = 984.000000000000000000
          Height = 19.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1109#1057#8218#1056#1111#1057#1107#1057#8240#1056#181#1056#1029#1056#1109' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' [MONEYSTR(<FN_SUMM>)' +
              ']')
          ParentFont = False
        end
      end
      object MasterData5: TfrxMasterData
        Height = 66.000000000000000000
        Top = 700.000000000000000000
        Width = 1009.134510000000000000
        RowCount = 1
        object Memo23: TfrxMemoView
          Left = 22.000000000000000000
          Top = 16.000000000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1107#1057#1027#1057#8218#1056#1105#1056#187)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 97.590600000000000000
          Top = 16.000000000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 97.590600000000000000
          Top = 34.897650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 229.874150000000000000
          Top = 16.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 324.362400000000000000
          Top = 16.000000000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo63OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FC_MO_FROM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 229.874150000000000000
          Top = 34.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 324.362400000000000000
          Top = 34.897650000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 532.236550000000000000
          Top = 16.000000000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#1105#1056#187)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 607.827150000000000000
          Top = 16.000000000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 607.827150000000000000
          Top = 34.897650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 740.110700000000000000
          Top = 16.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 834.598950000000000000
          Top = 16.000000000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo77OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FC_MO_TO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 740.110700000000000000
          Top = 34.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 834.598950000000000000
          Top = 34.897650000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 178.007978000000000000
        Top = 16.000000000000000000
        Width = 1009.134510000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo13: TfrxMemoView
          Left = 785.606804000000000000
          Top = 1.000000000000000000
          Width = 223.748176000000000000
          Height = 41.574830000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1118#1056#1105#1056#1111#1056#1109#1056#1030#1056#176#1057#1039' '#1056#1112#1056#181#1056#182#1056#1109#1057#8218#1057#1026#1056#176#1057#1027#1056#187#1056#181#1056#1030#1056#176#1057#1039' '#1057#8222#1056#1109#1057#1026#1056#1112#1056#176' '#1074#8222#8211' '#1056#1114'-11'
            
              #1056#1032#1057#8218#1056#1030#1056#181#1057#1026#1056#182#1056#1169#1056#181#1056#1029#1056#176' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1029#1056#1109#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1056#181#1056#1112' '#1056#8220#1056#1109#1057#1027#1056#1108#1056#1109#1056#1112#1057#1027 +
              #1057#8218#1056#176#1057#8218#1056#176' '#1056#160#1056#1109#1057#1027#1057#1027#1056#1105#1056#1105
            #1056#1109#1057#8218' 30.10.97 '#1074#8222#8211' 71'#1056#176)
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 264.787570000000000000
          Top = 49.503958000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1118#1056#160#1056#8226#1056#8216#1056#1115#1056#8217#1056#1106#1056#1116#1056#152#1056#8226'-'#1056#1116#1056#1106#1056#1113#1056#8250#1056#1106#1056#8221#1056#1116#1056#1106#1056#1031' '#1074#8222#8211)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 514.236549999999900000
          Top = 49.503958000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[VAR_FC_DOC]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 880.850960000000000000
          Top = 49.503958000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169#1057#8249)
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 880.850960000000000000
          Top = 68.401608000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '0315006')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 880.850960000000000000
          Top = 87.299258000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 3.000000000000000000
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 4.000000000000000000
          Top = 87.299258000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 90.929190000000000000
          Top = 87.299258000000000000
          Width = 676.535870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1032' '#1056#1168#1056#1114#1056#1106#1056#1115'-'#1056#174#1056#1110#1057#1026#1057#8249' '#1056#1115#1056#1108#1057#1026#1057#1107#1056#182#1056#1029#1056#176#1057#1039' '#1056#1113#1056#187#1056#1105#1056#1029#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#176#1057#1039' '#1056#8216#1056 +
              #1109#1056#187#1057#1034#1056#1029#1056#1105#1057#8224#1056#176)
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 767.465060000000000000
          Top = 68.401608000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#1109#1057#1026#1056#1112#1056#176' '#1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1032#1056#8221)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo60: TfrxMemoView
          Left = 797.701300000000000000
          Top = 91.078788000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1119#1056#1115)
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 56.913420000000000000
          Top = 113.755968000000000000
          Width = 75.590600000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176
            #1057#1027#1056#1109#1057#1027#1057#8218#1056#176'-'
            #1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 132.504020000000000000
          Top = 113.755968000000000000
          Width = 56.692950000000010000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169' '#1056#1030#1056#1105#1056#1169#1056#176
            #1056#1109#1056#1111#1056#181#1057#1026#1056#176#1057#8224#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 189.196970000000000000
          Top = 113.755968000000000000
          Width = 264.567100000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1026#1056#176#1056#1030#1056#1105#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 453.764070000000000000
          Top = 113.755968000000000000
          Width = 264.567100000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 907.307670000000000000
          Top = 113.755968000000000000
          Width = 97.511811020000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1057#8225#1056#181#1057#8218#1056#1029#1056#176#1057#1039
            #1056#181#1056#1169#1056#1105#1056#1029#1056#1105#1057#8224#1056#176
            #1056#1030#1057#8249#1056#1111#1057#1107#1057#1027#1056#1108#1056#176
            #1056#1111#1057#1026#1056#1109#1056#1169#1057#1107#1056#1108#1057#8224#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 718.331170000000000000
          Top = 113.755968000000000000
          Width = 188.976500000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1057#1026#1057#1026#1056#181#1057#1027#1056#1111#1056#1109#1056#1029#1056#1169#1056#1105#1057#1026#1057#1107#1057#1035#1057#8240#1056#1105#1056#8470
            #1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 718.331170000000000000
          Top = 143.992208000000000000
          Width = 94.488250000000000000
          Height = 34.015770000000010000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8225#1056#181#1057#8218','
            #1057#1027#1057#1107#1056#177#1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 812.819420000000000000
          Top = 143.992208000000000000
          Width = 94.488250000000000000
          Height = 34.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1169' '#1056#176#1056#1029#1056#176#1056#187#1056#1105#1057#8218#1056#1105'-'
            #1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 453.764070000000000000
          Top = 143.992208000000000000
          Width = 132.283550000000000000
          Height = 34.015770000000010000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026#1057#1107#1056#1108#1057#8218#1057#1107#1057#1026#1056#1029#1056#1109#1056#181
            #1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 586.047620000000000000
          Top = 143.992208000000000000
          Width = 132.283550000000000000
          Height = 34.015770000000010000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1030#1056#1105#1056#1169
            #1056#1169#1056#181#1057#1039#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 189.196970000000000000
          Top = 143.992208000000000000
          Width = 132.283550000000000000
          Height = 34.015770000000010000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026#1057#1107#1056#1108#1057#8218#1057#1107#1057#1026#1056#1029#1056#1109#1056#181
            #1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 321.480520000000000000
          Top = 143.992208000000000000
          Width = 132.283550000000000000
          Height = 34.015770000000010000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1030#1056#1105#1056#1169
            #1056#1169#1056#181#1057#1039#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line15: TfrxLineView
          Left = 453.764070000000000000
          Top = 143.992208000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line16: TfrxLineView
          Left = 880.850960000000000000
          Top = 87.299258000000000000
          Width = 124.724490000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object odsInvoice_MID: TOracleDataSet
    SQL.Strings = (
      '--22686'
      'SELECT ROWNUM, A.*'
      'FROM'
      '(SELECT ALL_MEDICS.MEDICID, ALL_MEDICS.MEDICID as FK_ID_MASTER,'
      
        '       DECODE(M.FL_PRINT_LAT_NAME, 1,M.FC_NAME_LAT, M.FC_NAME) a' +
        's FC_MEDIC_NAME,'
      '       E.FC_NAME as FC_EDIZM_NAME,'
      '       NVL(TREB_MEDICS.FN_TREB_KOL,0) as FN_TREB_KOL, '
      
        '       NVL(VIDANO_MEDICS.FN_VIDANO_KOL,0) as FN_VIDANO_KOL, VIDA' +
        'NO_MEDICS.fn_price, VIDANO_MEDICS.FN_VIDANO_SUM       '
      '       '
      'FROM'
      '('
      'SELECT td.fk_medicid as MEDICID  '
      'FROM  MED.TTreb t, MED.TTreb_Dpc td'
      'WHERE t.fk_dpid = :ADPID'
      '  AND td.fk_trebid = t.fk_id'
      'UNION'
      'SELECT  K.medicid as MEDICID'
      'FROM'
      'MED.TDPC DPC, MED.TKART K'
      'WHERE DPC.dpid = :ADPID'
      '  AND DPC.kartid = K.kartid  '
      ') ALL_MEDICS, -- '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099', '#1079#1072#1087#1088#1086#1096#1077#1085#1085#1099#1077' '#1080' '#1074#1099#1076#1072#1085#1085#1099#1077
      ''
      '(SELECT td.fk_medicid as MEDICID, sum(td.fn_kol) as FN_TREB_KOL'
      'FROM  MED.TTreb t, MED.TTreb_Dpc td'
      'WHERE t.fk_dpid = :ADPID'
      '  AND td.fk_trebid = t.fk_id'
      
        'GROUP BY td.fk_medicid) TREB_MEDICS, -- '#1079#1072#1090#1088#1077#1073#1086#1074#1072#1085#1085#1099#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090 +
        #1099
      ''
      '(SELECT  K.medicid,'
      '        DPC.fn_kol as FN_VIDANO_KOL,'
      '        K.fn_price,'
      '        DPC.fn_kol*K.fn_price as FN_VIDANO_SUM'
      'FROM'
      'MED.TDPC DPC, MED.TKART K'
      'WHERE DPC.dpid = :ADPID'
      '  AND DPC.kartid = K.kartid'
      ') VIDANO_MEDICS, -- '#1074#1099#1076#1072#1085#1085#1099#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099
      'MED.TMEDIC M, MED.TEI E'
      ''
      'WHERE'
      '    ALL_MEDICS.MEDICID = TREB_MEDICS.MEDICID(+)'
      'AND ALL_MEDICS.MEDICID = VIDANO_MEDICS.MEDICID(+)'
      'AND ALL_MEDICS.MEDICID = M.MEDICID -- '#1076#1086#1089#1090#1072#1077#1084' '#1080#1084#1103' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
      'AND M.EIID = E.EIID(+) -- '#1080' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1091#1087#1072#1082#1086#1074#1082#1080
      'ORDER BY UPPER(M.FC_NAME)'
      ') A')
    Optimize = False
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000008000000070000004D45444943494401000000000006000000524F57
      4E554D0100000000000D00000046435F4D454449435F4E414D45010000000000
      0D00000046435F4544495A4D5F4E414D450100000000000B000000464E5F5452
      45425F4B4F4C0100000000000D000000464E5F564944414E4F5F4B4F4C010000
      0000000D000000464E5F564944414E4F5F53554D0100000000000C000000464E
      5F4156475F5052494345010000000000}
    Cursor = crSQLWait
    Left = 322
    Top = 262
  end
  object frxReport1: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39387.554601956000000000
    ReportOptions.LastChange = 40711.464867500000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      
        'procedure Memo63OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1054#1090#1087#1091#1089#1090#1080#1083':'#39', s);  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      ''
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_FC_MO_FROM'#39',  s2);'
      'end;'
      ''
      
        'procedure Memo77OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1055#1086#1083#1091#1095#1080#1083':'#39', s);                '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_FC_MO_TO'#39',  s2);      '
      'end;'
      ''
      'procedure Memo86OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  SET('#39'FN_SUMM'#39', <FN_SUMM>+IIF(<frxDBdsInvoice2."FN_VIDANO_SUM">' +
        '=null, 0,<frxDBdsInvoice2."FN_VIDANO_SUM">) );  '
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SET('#39'FN_SUMM'#39', 0);  '
      'end;'
      ''
      
        'procedure Memo81OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1060#1048#1054':'#39', s);                  '
      '  TfrxMemoView(Sender).Text := s2;          '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_ZAV_APTEKA'#39',  s2);  '
      'end;'
      ''
      
        'procedure Memo89OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1047#1072#1074'. '#1086#1090#1076#1077#1083#1077#1085#1080#1077#1084' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103':'#39', s' +
        ');  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_FC_ZAV_OTD_TO'#39',  s2);  '
      'end;'
      ''
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  PageHeader1.Visible := (<Page> > 1);  '
      'end;'
      ''
      
        'procedure Memo101OnPreviewClick(Sender: TfrxView; Button: TMouse' +
        'Button; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1056#1072#1079#1088#1077#1096#1080#1083':'#39', s);  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_RAZRESHIL'#39',  s2);  '
      'end;'
      ''
      
        'procedure Memo102OnPreviewClick(Sender: TfrxView; Button: TMouse' +
        'Button; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1047#1072#1084'. '#1075#1083'. '#1074#1088#1072#1095#1072' '#1087#1086' '#1087#1088#1086#1092#1080#1083#1102':'#39', s)' +
        ';  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_ZAM_GLAV_PROFIL'#39',  s2);'
      '    '
      'end;'
      ''
      
        'procedure Memo91OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1100#39', '#39#1056#1072#1079#1088#1077#1096#1080#1083':'#39', s);  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_RAZRESHIL_DOLJNOST'#39',  s2);'
      '    '
      'end;'
      ''
      'begin'
      '                      '
      'end.')
    OnGetValue = frxTrebNaklGetValue
    OnPrintReport = frxTrebNaklPrintReport
    OnUserFunction = frxTrebNaklUserFunction
    Left = 216
    Top = 130
    Datasets = <
      item
        DataSet = frxDBdsFinsource_in_Doc
        DataSetName = 'frxDBdsFinsource_in_Doc'
      end
      item
        DataSet = frxDBdsInvoice2
        DataSetName = 'frxDBdsInvoice2'
      end
      item
        DataSet = frxDBdsSimpleTrebHeader
        DataSetName = 'frxDBdsSimpleTrebHeader'
      end
      item
        DataSet = frxDBdsTDPC
        DataSetName = 'frxDBdsTDPC'
      end
      item
        DataSet = frxDBdsTTrebDpc
        DataSetName = 'frxDBdsTTrebDpc'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'FN_SUMM'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 17.999604166666700000
      RightMargin = 7.000875000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      Frame.Width = 3.000000000000000000
      LargeDesignHeight = True
      TitleBeforeHeader = False
      object Header2: TfrxHeader
        Height = 20.000000000000000000
        Top = 495.118430000000000000
        Width = 699.211238975208200000
        object Memo93: TfrxMemoView
          Left = 88.165430000000000000
          Width = 179.803340000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 36.133890000000000000
          Width = 52.031540000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 268.968770000000000000
          Width = 42.590600000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 2.000000000000000000
          Width = 34.133890000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 311.559370000000000000
          Width = 34.692950000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 346.252320000000000000
          Width = 69.488250000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 460.433520000000000000
          Width = 46.692950000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '8')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 415.740570000000000000
          Width = 44.692950000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '7')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Left = 507.126470000000000000
          Width = 62.370130000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '9')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 569.496600000000000000
          Width = 71.488250000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '10')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 640.984850000000000000
          Width = 51.811070000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '11')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Left = 88.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line5: TfrxLineView
          Left = 36.000000000000000000
          Top = 19.000000000000000000
          Width = 257.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          Left = 2.000000000000000000
          Top = 19.000000000000000000
          Width = 86.170000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
        end
        object Line12: TfrxLineView
          Left = 267.970000000000000000
          Top = 19.000000000000000000
          Width = 79.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
        end
        object Line23: TfrxLineView
          Left = 460.430000000000000000
          Top = 19.000000000000000000
          Width = 232.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
        end
        object Line11: TfrxLineView
          Left = 311.560000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line27: TfrxLineView
          Left = 415.740000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line28: TfrxLineView
          Left = 507.130000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line29: TfrxLineView
          Left = 569.500000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line32: TfrxLineView
          Left = 640.980000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line34: TfrxLineView
          Left = 693.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line35: TfrxLineView
          Left = 2.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
      end
      object MasterData1: TfrxMasterData
        Height = 16.000000000000000000
        Top = 536.693260000000000000
        Width = 699.211238975208200000
        DataSet = frxDBdsInvoice2
        DataSetName = 'frxDBdsInvoice2'
        RowCount = 0
        Stretched = True
        object Memo52: TfrxMemoView
          Left = 1.000000000000000000
          Width = 35.133890000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 36.133890000000000000
          Width = 52.031540000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FC_FINSOURCE"]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 88.165430000000000000
          Width = 179.803340000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          GapX = 4.000000000000000000
          Memo.UTF8 = (
            
              '[frxDBdsInvoice2."FC_MEDIC_NAME"] ([frxDBdsInvoice2."FC_SERIAL"]' +
              ')')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 346.250000000000000000
          Width = 69.488250000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FC_EDIZM_NAME"]')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 507.126470000000000000
          Width = 62.370130000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FN_PRICE"]')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 415.740570000000000000
          Width = 44.692950000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsInvoice2."fn_trebkol"]')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          Left = 569.496600000000000000
          Width = 71.488250000000000000
          Height = 16.000000000000000000
          OnBeforePrint = 'Memo86OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FN_VIDANO_SUM"]')
          ParentFont = False
        end
        object Line8: TfrxLineView
          Left = 640.984850000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Memo50: TfrxMemoView
          Left = 460.433520000000000000
          Width = 46.692950000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FN_VIDANO_KOL"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 267.970000000000000000
          Width = 42.590000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 311.559370000000000000
          Width = 34.692950000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 641.000000000000000000
          Width = 49.811070000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
        end
        object Line9: TfrxLineView
          Left = 2.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line10: TfrxLineView
          Left = 88.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line13: TfrxLineView
          Left = 268.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line14: TfrxLineView
          Left = 346.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line24: TfrxLineView
          Left = 461.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line25: TfrxLineView
          Left = 692.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line22: TfrxLineView
          Left = 311.560000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line26: TfrxLineView
          Left = 415.740000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line30: TfrxLineView
          Left = 507.130000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line31: TfrxLineView
          Left = 569.500000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line33: TfrxLineView
          Left = 640.980000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
      end
      object Footer1: TfrxFooter
        Height = 6.000000000000000000
        Top = 574.488560000000000000
        Width = 699.211238975208200000
        object Memo78: TfrxMemoView
          Width = 692.134510000000000000
          Height = 5.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 148.850340000000000000
        Top = 325.039580000000000000
        Width = 699.211238975208200000
        RowCount = 1
        object Memo80: TfrxMemoView
          Left = 3.779530000000000000
          Top = 9.000000000000000000
          Width = 54.811070000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#167#1056#181#1057#1026#1056#181#1056#183' '#1056#1108#1056#1109#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo81: TfrxMemoView
          Left = 157.212740000000000000
          Top = 7.000000000000000000
          Width = 239.370440000000000000
          Height = 24.677180000000000000
          OnPreviewClick = 'Memo81OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_ZAV_APTEKA]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo87: TfrxMemoView
          Left = 3.779530000000000000
          Top = 39.236240000000010000
          Width = 54.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8212#1056#176#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#187)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo89: TfrxMemoView
          Left = 157.212740000000000000
          Top = 33.234440000000010000
          Width = 150.976500000000000000
          Height = 24.900000000000000000
          OnPreviewClick = 'Memo89OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_FC_ZAV_OTD_TO]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo90: TfrxMemoView
          Left = 320.543600000000000000
          Top = 39.234440000000010000
          Width = 61.811070000000000000
          Height = 18.900000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#160#1056#176#1056#183#1057#1026#1056#181#1057#8364#1056#1105#1056#187)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo91: TfrxMemoView
          Left = 384.693260000000000000
          Top = 39.234440000000010000
          Width = 177.450000000000000000
          Height = 18.900000000000000000
          OnPreviewClick = 'Memo91OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[VAR_RAZRESHIL_DOLJNOST]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Line36: TfrxLineView
          Left = 666.110700000000000000
          Top = 58.133889999999780000
          Height = 34.015770000000000000
          ShowHint = False
          Frame.Color = clWhite
          Frame.Typ = [ftLeft]
        end
        object Memo101: TfrxMemoView
          Left = 564.701300000000000000
          Top = 39.234440000000010000
          Width = 132.417440000000000000
          Height = 18.900000000000000000
          OnPreviewClick = 'Memo101OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_RAZRESHIL]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo103: TfrxMemoView
          Left = 64.929190000000000000
          Top = 39.234440000000010000
          Width = 91.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1030'. '#1056#1109#1057#8218#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181#1056#1112)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo104: TfrxMemoView
          Left = 64.929190000000000000
          Top = 9.000000000000000000
          Width = 91.165430000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1030'. '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo105: TfrxMemoView
          Left = 88.165430000000000000
          Top = 84.598329999999970000
          Width = 223.393940000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1056#181' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 311.559370000000000000
          Top = 84.600000000000030000
          Width = 104.181200000000000000
          Height = 64.250000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169#1056#1105#1056#1029#1056#1105#1057#8224#1056#176' '#1056#1105#1056#183#1056#1112#1056#181#1057#1026#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Left = 415.740570000000000000
          Top = 84.598329999999970000
          Width = 91.385900000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 507.126470000000000000
          Top = 84.598329999999970000
          Width = 62.370130000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176','
            #1057#1026#1057#1107#1056#177'.'
            #1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo109: TfrxMemoView
          Left = 569.496600000000000000
          Top = 84.598329999999970000
          Width = 71.488250000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176
            #1056#177#1056#181#1056#183' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176
            #1056#1116#1056#8221#1056#1038','
            #1057#1026#1057#1107#1056#177'. '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 640.984850000000000000
          Top = 84.598329999999970000
          Width = 51.811070000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1056#1109#1056#1030#1057#8249#1056#8470
            #1056#1029#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1111#1056#1109
            #1057#1027#1056#1108#1056#187#1056#176#1056#1169#1057#1027#1056#1108#1056#1109#1056#8470
            #1056#1108#1056#176#1057#1026#1057#8218#1056#1109#1057#8218#1056#181#1056#1108#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 2.000000000000000000
          Top = 84.598329999999970000
          Width = 86.165430000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1057#1026#1057#1026#1056#181#1057#1027#1056#1111#1056#1109#1056#1029#1056#1169#1056#1105#1057#1026#1057#1107#1057#1035#1057#8240#1056#1105#1056#8470
            #1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 2.000000000000000000
          Top = 111.055040000000000000
          Width = 34.133890000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8225#1056#181#1057#8218','
            #1057#1027#1057#1107#1056#177#1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Left = 36.133890000000000000
          Top = 111.055040000000000000
          Width = 52.031540000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1169' '#1056#176#1056#1029#1056#176#1056#187#1056#1105#1057#8218#1056#1105'-'
            #1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Left = 88.165430000000000000
          Top = 111.055040000000000000
          Width = 179.803340000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo115: TfrxMemoView
          Left = 267.968770000000000000
          Top = 111.055040000000000000
          Width = 42.590000000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#1109#1056#1112#1056#181#1056#1029#1056#1108'-'
            #1056#187#1056#176#1057#8218#1057#1107#1057#1026#1056#1029#1057#8249#1056#8470
            #1056#1029#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Left = 346.252320000000000000
          Top = 111.055040000000000000
          Width = 69.488250000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 310.559370000000000000
          Top = 111.055040000000000000
          Width = 35.692950000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 415.740570000000000000
          Top = 111.055040000000000000
          Width = 44.692950000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176#1057#8218#1057#1026#1056#181'-'
            #1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 460.433520000000000000
          Top = 111.055040000000000000
          Width = 46.692950000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1109#1057#8218#1056#1111#1057#1107'-'
            #1057#8240#1056#181#1056#1029#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData3: TfrxMasterData
        Height = 20.700000000000000000
        Top = 279.685220000000000000
        Width = 699.211238975208200000
        RowCount = 1
        Stretched = True
        object Memo27: TfrxMemoView
          Left = 44.000000000000000000
          Width = 63.590600000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd.mm.yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FD_INVOICE]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 645.394250000000000000
          Width = 51.267780000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 543.330000000000000000
          Width = 41.490000000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 107.590600000000000000
          Width = 32.692950000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 140.200000000000000000
          Width = 201.570000000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FC_MOGROUP_FROM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 341.850650000000000000
          Width = 201.570000000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FC_MOGROUP_TO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 584.820000000000000000
          Width = 61.488250000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 584.820000000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line37: TfrxLineView
          Left = 645.394250000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line38: TfrxLineView
          Left = 543.330000000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line39: TfrxLineView
          Left = 341.850650000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line40: TfrxLineView
          Left = 140.200000000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line41: TfrxLineView
          Left = 107.590600000000000000
          Top = 1.000000000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
      end
      object MasterData4: TfrxMasterData
        Height = 19.000000000000000000
        Top = 687.874460000000000000
        Width = 699.211238975208200000
        RowCount = 1
        Stretched = True
        object Memo47: TfrxMemoView
          Left = 22.000000000000000000
          Width = 671.000000000000000000
          Height = 19.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1109#1057#8218#1056#1111#1057#1107#1057#8240#1056#181#1056#1029#1056#1109' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' [MONEYSTR(<FN_SUMM>)' +
              ']')
          ParentFont = False
        end
      end
      object MasterData5: TfrxMasterData
        Height = 142.000000000000000000
        Top = 729.449290000000000000
        Width = 699.211238975208200000
        RowCount = 1
        object Memo23: TfrxMemoView
          Left = 3.000000000000000000
          Top = 16.000000000000000000
          Width = 88.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1107#1057#1027#1057#8218#1056#1105#1056#187)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 98.000000000000000000
          Top = 16.000000000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 98.000000000000000000
          Top = 34.897650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 230.000000000000000000
          Top = 16.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 325.000000000000000000
          Top = 16.000000000000000000
          Width = 250.000000000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo63OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FC_MO_FROM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 230.000000000000000000
          Top = 34.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 325.000000000000000000
          Top = 34.897650000000000000
          Width = 250.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 3.000000000000000000
          Top = 58.000000000000000000
          Width = 88.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#1105#1056#187)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 98.000000000000000000
          Top = 58.000000000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 98.000000000000000000
          Top = 76.897650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 230.000000000000000000
          Top = 58.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 325.000000000000000000
          Top = 58.000000000000000000
          Width = 250.000000000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo77OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FC_MO_TO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 230.000000000000000000
          Top = 76.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 325.000000000000000000
          Top = 76.897650000000000000
          Width = 250.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 98.000000000000000000
          Top = 100.000000000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1030'. '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 98.000000000000000000
          Top = 118.897650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 230.000000000000000000
          Top = 100.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 325.000000000000000000
          Top = 100.000000000000000000
          Width = 250.000000000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo81OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_ZAV_APTEKA]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 230.000000000000000000
          Top = 118.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 325.000000000000000000
          Top = 118.897650000000000000
          Width = 250.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 158.007978000000000000
        Top = 60.472480000000000000
        Width = 699.211238975208200000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo13: TfrxMemoView
          Left = 499.606804000000000000
          Top = 1.000000000000000000
          Width = 193.748176000000000000
          Height = 41.574830000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1118#1056#1105#1056#1111#1056#1109#1056#1030#1056#176#1057#1039' '#1056#1112#1056#181#1056#182#1056#1109#1057#8218#1057#1026#1056#176#1057#1027#1056#187#1056#181#1056#1030#1056#176#1057#1039' '#1057#8222#1056#1109#1057#1026#1056#1112#1056#176' '#1074#8222#8211' '#1056#1114'-11'
            
              #1056#1032#1057#8218#1056#1030#1056#181#1057#1026#1056#182#1056#1169#1056#181#1056#1029#1056#176' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1029#1056#1109#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1056#181#1056#1112' '#1056#8220#1056#1109#1057#1027#1056#1108#1056#1109#1056#1112#1057#1027 +
              #1057#8218#1056#176#1057#8218#1056#176' '#1056#160#1056#1109#1057#1027#1057#1027#1056#1105#1056#1105
            #1056#1109#1057#8218' 30.10.97 '#1074#8222#8211' 71'#1056#176)
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 154.787570000000000000
          Top = 48.503958000000010000
          Width = 210.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1118#1056#160#1056#8226#1056#8216#1056#1115#1056#8217#1056#1106#1056#1116#1056#152#1056#8226'-'#1056#1116#1056#1106#1056#1113#1056#8250#1056#1106#1056#8221#1056#1116#1056#1106#1056#1031' '#1074#8222#8211)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 365.236550000000000000
          Top = 48.503958000000010000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[VAR_FC_DOC]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 608.850960000000000000
          Top = 49.503958000000010000
          Width = 85.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169#1057#8249)
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 608.850960000000000000
          Top = 68.401608000000010000
          Width = 85.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '0315006')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 608.850960000000000000
          Top = 87.299258000000010000
          Width = 85.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 3.000000000000000000
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 4.000000000000000000
          Top = 87.299258000000010000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 90.929190000000000000
          Top = 67.299258000000010000
          Width = 401.535870000000000000
          Height = 38.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_UCHR_NAME]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo59: TfrxMemoView
          Left = 526.465060000000000000
          Top = 68.401608000000010000
          Width = 73.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#1109#1057#1026#1056#1112#1056#176' '#1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1032#1056#8221)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo60: TfrxMemoView
          Left = 525.701300000000000000
          Top = 91.078788000000000000
          Width = 74.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1119#1056#1115)
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 43.913420000000000000
          Top = 113.755968000000000000
          Width = 63.590600000000000000
          Height = 43.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176
            #1057#1027#1056#1109#1057#1027#1057#8218#1056#176'-'
            #1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 107.504020000000000000
          Top = 113.755968000000000000
          Width = 32.692950000000000000
          Height = 43.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169' '#1056#1030#1056#1105#1056#1169#1056#176
            #1056#1109#1056#1111#1056#181#1057#1026#1056#176'-'#1057#8224#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 140.196970000000000000
          Top = 113.755968000000000000
          Width = 201.567100000000000000
          Height = 21.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1026#1056#176#1056#1030#1056#1105#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 341.764070000000000000
          Top = 113.755968000000000000
          Width = 201.570000000000000000
          Height = 21.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 645.307670000000000000
          Top = 113.755968000000000000
          Width = 50.511811020000000000
          Height = 43.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1057#8225#1056#181#1057#8218#1056#1029#1056#176#1057#1039
            #1056#181#1056#1169#1056#1105#1056#1029#1056#1105#1057#8224#1056#176
            #1056#1030#1057#8249#1056#1111#1057#1107#1057#1027#1056#1108#1056#176
            #1056#1111#1057#1026#1056#1109#1056#1169#1057#1107#1056#1108#1057#8224#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 543.331170000000000000
          Top = 113.755968000000000000
          Width = 101.976500000000000000
          Height = 43.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1057#1026#1057#1026#1056#181#1057#1027#1056#1111#1056#1109#1056#1029#1056#1169#1056#1105#1057#1026#1057#1107#1057#1035#1057#8240#1056#1105#1056#8470
            #1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 543.331170000000000000
          Top = 134.992208000000000000
          Width = 41.488250000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8225#1056#181#1057#8218','
            #1057#1027#1057#1107#1056#177#1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 584.819420000000000000
          Top = 134.992208000000000000
          Width = 60.488250000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1169' '#1056#176#1056#1029#1056#176#1056#187#1056#1105#1057#8218#1056#1105'-'
            #1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 341.764070000000000000
          Top = 134.992208000000000000
          Width = 100.280000000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026#1057#1107#1056#1108#1057#8218#1057#1107#1057#1026#1056#1029#1056#1109#1056#181
            #1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 442.047620000000000000
          Top = 134.992208000000000000
          Width = 101.283550000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1030#1056#1105#1056#1169
            #1056#1169#1056#181#1057#1039#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 140.196970000000000000
          Top = 134.992208000000000000
          Width = 101.283550000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026#1057#1107#1056#1108#1057#8218#1057#1107#1057#1026#1056#1029#1056#1109#1056#181
            #1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 241.480520000000000000
          Top = 134.992208000000000000
          Width = 100.283550000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1030#1056#1105#1056#1169
            #1056#1169#1056#181#1057#1039#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line15: TfrxLineView
          Left = 341.764070000000000000
          Top = 135.992208000000000000
          Height = 22.015770000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line16: TfrxLineView
          Left = 608.850960000000000000
          Top = 87.299258000000010000
          Width = 85.724490000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 20.000000000000000000
        Top = 18.897650000000000000
        Width = 699.211238975208200000
        OnBeforePrint = 'PageHeader1OnBeforePrint'
        object Memo1: TfrxMemoView
          Align = baClient
          Width = 699.211238975208200000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 3.000000000000000000
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034': [VAR_FC_MOGROUP_TO]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 933.543910000000000000
        Width = 699.211238975208200000
        object Memo2: TfrxMemoView
          Align = baClient
          Width = 699.211238975208200000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [<Page#>] '#1056#1105#1056#183' [<TotalPages#>]')
          ParentFont = False
        end
      end
      object MasterData6: TfrxMasterData
        Height = 19.653543310000000000
        Top = 604.724800000000000000
        Width = 699.211238975208200000
        DataSet = frxDBdsFinsource_in_Doc
        DataSetName = 'frxDBdsFinsource_in_Doc'
        RowCount = 0
        Stretched = True
        object Memo11: TfrxMemoView
          Width = 415.740000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' [frxDBdsFinsource_in_Doc."FC_FINSOURCE"]:')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 415.740000000000000000
          Width = 222.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsFinsource_in_Doc."FN_SUM"]')
          ParentFont = False
        end
      end
      object MasterData7: TfrxMasterData
        Height = 20.000000000000000000
        Top = 646.299630000000000000
        Width = 699.211238975208200000
        RowCount = 1
        object Memo79: TfrxMemoView
          Left = 415.740000000000000000
          Width = 222.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 3.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[<FN_SUMM>]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Width = 415.740000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1035)
          ParentFont = False
        end
      end
    end
  end
  object odsGLF_in_Doc: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  glf.fc_synonim,'
      ''
      '  SUM(C.FN_KOL*K.FN_PRICE) AS FN_SUM, '
      ''
      
        '  sum( CASE WHEN fc_synonim = '#39'ANGRO'#39' THEN C.FN_KOL*K.FN_PRICE E' +
        'LSE 0 END) AS fn_summ_angro,'
      
        '  sum( CASE WHEN fc_synonim = '#39'EXTEMPOR'#39' THEN C.FN_KOL*K.FN_PRIC' +
        'E ELSE 0 END) AS fn_summ_ext,'
      
        '  sum( CASE WHEN fc_synonim = '#39'GLF'#39' THEN C.FN_KOL*K.FN_PRICE ELS' +
        'E 0 END) AS fn_summ_glf,'
      
        '  sum( CASE WHEN fc_synonim = '#39'PEREV'#39' THEN C.FN_KOL*K.FN_PRICE E' +
        'LSE 0 END) AS fn_summ_PEREV,'
      
        '  sum( CASE WHEN fc_synonim = '#39'RASHODNIK'#39' THEN C.FN_KOL*K.FN_PRI' +
        'CE ELSE 0 END) AS fn_summ_RASHODNIK'
      ''
      'FROM MED.TDPC C, MED.TKART K, MED.TMEDIC M, med.tgroup_lf glf'
      'WHERE '
      '      C.dpid = :ADPID'
      '  AND K.KARTID = C.KARTID'
      '  AND K.FL_DEL = 0'
      '  AND M.MEDICID = K.MEDICID'
      '  and m.fk_group_lf = glf.fk_group_lf_id(+)'
      'GROUP BY glf.fc_synonim')
    Optimize = False
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000A00000046435F53594E4F4E494D01000000000006000000
      464E5F53554D0100000000000D000000464E5F53554D4D5F414E47524F010000
      0000000B000000464E5F53554D4D5F4558540100000000000B000000464E5F53
      554D4D5F474C460100000000000D000000464E5F53554D4D5F50455245560100
      00000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 106
    Top = 280
  end
  object frxDBdsGLF_in_Doc: TfrxDBDataset
    UserName = 'frxDBdsGLF_in_Doc'
    CloseDataSource = False
    DataSet = odsGLF_in_Doc
    BCDToCurrency = False
    Left = 194
    Top = 268
  end
  object odsFinsource_in_Doc: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  1 as fn_row,'
      '  fs.fc_name as fc_finsource,'
      '  SUM(C.FN_KOL*K.FN_PRICE) AS FN_SUM'
      ''
      'FROM MED.TDPC C, MED.TKART K, MED.TMEDIC M, med.tFinSource fs'
      'WHERE '
      '      C.dpid = :ADPID'
      '  AND K.KARTID = C.KARTID'
      '  AND K.fk_finsource_id = fs.fk_id(+)'
      '  AND K.FL_DEL = 0'
      '  AND M.MEDICID = K.MEDICID'
      'GROUP BY fs.fc_name'
      '')
    Optimize = False
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000C00000046435F46494E534F555243450100000000000600
      0000464E5F53554D01000000000006000000464E5F524F57010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 106
    Top = 336
  end
  object frxDBdsFinsource_in_Doc: TfrxDBDataset
    UserName = 'frxDBdsFinsource_in_Doc'
    CloseDataSource = False
    DataSet = odsFinsource_in_Doc
    BCDToCurrency = False
    Left = 202
    Top = 332
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 320
    Top = 328
  end
  object odsTTrebDpc: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      
        '  t.fk_id as trebID, td.fk_medicid as MEDICID, sum(td.fn_kol) as' +
        ' FN_TREB_KOL, m.fc_name as fc_medic_name, m.FC_NAME_LAT'
      'FROM  MED.TTreb t, MED.TTreb_Dpc td, med.tmedic m'
      'WHERE (t.fk_dpid = :ADPID or t.fk_id = :ATREBID)'
      '  AND (td.fk_trebid = t.fk_id)'
      '  and (td.fk_medicid = m.medicid)'
      'GROUP BY t.fk_id, td.fk_medicid, m.fc_name, m.FC_NAME_LAT')
    Optimize = False
    Variables.Data = {
      0300000002000000060000003A41445049440300000000000000000000000800
      00003A41545245424944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000011000000070000004D45444943494401000000000006000000524F57
      4E554D0100000000000D00000046435F4D454449435F4E414D45010000000000
      0D00000046435F4544495A4D5F4E414D450100000000000B000000464E5F5452
      45425F4B4F4C0100000000000D000000464E5F564944414E4F5F4B4F4C010000
      0000000D000000464E5F564944414E4F5F53554D0100000000000C000000464B
      5F49445F4D415354455201000000000008000000464E5F505249434501000000
      00000A000000464E5F545245424B4F4C0100000000000900000046435F534552
      49414C0100000000000800000046445F474F44454E0100000000001100000046
      435F474F44454E5F44444D4D595959590100000000000F00000046435F474F44
      454E5F44444D4D59590100000000000C000000464E5F50415254595F4E554D01
      00000000000C00000046435F46494E534F555243450100000000000C00000046
      435F494E565F4E4F4D4552010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 170
    Top = 4
  end
  object frxDBdsTTrebDpc: TfrxDBDataset
    UserName = 'frxDBdsTTrebDpc'
    CloseDataSource = False
    DataSet = odsTTrebDpc
    BCDToCurrency = False
    Left = 172
    Top = 50
  end
  object odsTDPC: TOracleDataSet
    SQL.Strings = (
      'SELECT  DPC.DPID,'
      '        K.medicid,'
      '        DPC.fn_kol as FN_VIDANO_KOL,'
      '        K.fn_price,'
      '        DPC.fn_kol*K.fn_price as FN_VIDANO_SUM,'
      '        DPC.fn_trebkol,'
      '        K.FC_SERIAL,'
      '        K.FD_GODEN,'
      '        K.FN_PARTY_NUM, '
      '        FS.FC_NAME as FC_FINSOURCE, '
      '        K.fc_inv_nomer,'
      '        m.fc_name as fc_medic_name, m.FC_NAME_LAT'
      ''
      'FROM'
      'MED.TDPC DPC, MED.TKART K, MED.TFINSOURCE FS, MED.TMEDIC M'
      'WHERE DPC.dpid = :ADPID'
      '  and (k.medicid = m.medicid)'
      '  AND (DPC.kartid = K.kartid)'
      '  AND (K.FK_FINSOURCE_ID = FS.FK_ID(+))')
    Optimize = False
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000011000000070000004D45444943494401000000000006000000524F57
      4E554D0100000000000D00000046435F4D454449435F4E414D45010000000000
      0D00000046435F4544495A4D5F4E414D450100000000000B000000464E5F5452
      45425F4B4F4C0100000000000D000000464E5F564944414E4F5F4B4F4C010000
      0000000D000000464E5F564944414E4F5F53554D0100000000000C000000464B
      5F49445F4D415354455201000000000008000000464E5F505249434501000000
      00000A000000464E5F545245424B4F4C0100000000000900000046435F534552
      49414C0100000000000800000046445F474F44454E0100000000001100000046
      435F474F44454E5F44444D4D595959590100000000000F00000046435F474F44
      454E5F44444D4D59590100000000000C000000464E5F50415254595F4E554D01
      00000000000C00000046435F46494E534F555243450100000000000C00000046
      435F494E565F4E4F4D4552010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 234
    Top = 14
  end
  object frxDBdsTDPC: TfrxDBDataset
    UserName = 'frxDBdsTDPC'
    CloseDataSource = False
    DataSet = odsTDPC
    BCDToCurrency = False
    Left = 236
    Top = 68
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  glf.fc_synonim,'
      ''
      '  SUM(C.FN_KOL*K.FN_PRICE) AS FN_SUM, '
      ''
      
        '  sum( CASE WHEN fc_synonim = '#39'ANGRO'#39' THEN C.FN_KOL*K.FN_PRICE E' +
        'LSE 0 END) AS fn_summ_angro,'
      
        '  sum( CASE WHEN fc_synonim = '#39'EXTEMPOR'#39' THEN C.FN_KOL*K.FN_PRIC' +
        'E ELSE 0 END) AS fn_summ_ext,'
      
        '  sum( CASE WHEN fc_synonim = '#39'GLF'#39' THEN C.FN_KOL*K.FN_PRICE ELS' +
        'E 0 END) AS fn_summ_glf,'
      
        '  sum( CASE WHEN fc_synonim = '#39'PEREV'#39' THEN C.FN_KOL*K.FN_PRICE E' +
        'LSE 0 END) AS fn_summ_PEREV,'
      
        '  sum( CASE WHEN fc_synonim = '#39'RASHODNIK'#39' THEN C.FN_KOL*K.FN_PRI' +
        'CE ELSE 0 END) AS fn_summ_RASHODNIK'
      ''
      'FROM MED.TDPC C, MED.TKART K, MED.TMEDIC M, med.tgroup_lf glf'
      'WHERE '
      '      C.dpid = :ADPID'
      '  AND K.KARTID = C.KARTID'
      '  AND K.FL_DEL = 0'
      '  AND M.MEDICID = K.MEDICID'
      '  and m.fk_group_lf = glf.fk_group_lf_id(+)'
      'GROUP BY glf.fc_synonim')
    Optimize = False
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000A00000046435F53594E4F4E494D01000000000006000000
      464E5F53554D0100000000000D000000464E5F53554D4D5F414E47524F010000
      0000000B000000464E5F53554D4D5F4558540100000000000B000000464E5F53
      554D4D5F474C460100000000000D000000464E5F53554D4D5F50455245560100
      00000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 218
    Top = 184
  end
  object frxReport2: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38559.680454282400000000
    ReportOptions.LastChange = 40596.538638807870000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      
        'procedure meNAZN_FIOOnPreviewClick(Sender: TfrxView; Button: TMo' +
        'useButton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2, s3: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := DO_SHOW_SELECT_SOTR_STR(s, s3);'
      '  TfrxMemoView(Sender).Text := s2;'
      '  Modified := True;'
      ''
      '  IniWriteString2('#39'FRXSIMLPETREB'#39', '#39'VAR_NAZN_FIO'#39',   s2);'
      '  IniWriteString2('#39'FRXSIMLPETREB'#39', '#39'VAR_NAZN_DOLJN'#39', s3);'
      'end;'
      ''
      
        'procedure meOTP_FIOOnPreviewClick(Sender: TfrxView; Button: TMou' +
        'seButton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2, s3: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := DO_SHOW_SELECT_SOTR_STR(s,s3);'
      '  TfrxMemoView(Sender).Text := s2;'
      '  Modified := True;'
      ''
      '  IniWriteString2('#39'FRXSIMLPETREB'#39', '#39'VAR_OTP_FIO'#39',   s2);'
      '  IniWriteString2('#39'FRXSIMLPETREB'#39', '#39'VAR_OTP_DOLJN'#39', s3);      '
      'end;'
      ''
      
        'procedure mePOLUCH_FIOOnPreviewClick(Sender: TfrxView; Button: T' +
        'MouseButton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2, s3: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := DO_SHOW_SELECT_SOTR_STR(s,s3);'
      '  TfrxMemoView(Sender).Text := s2;'
      '  Modified := True;'
      ''
      '  IniWriteString2('#39'FRXSIMLPETREB'#39', '#39'VAR_POLUCH_FIO'#39',   s2);'
      '  IniWriteString2('#39'FRXSIMLPETREB'#39', '#39'VAR_POLUCH_DOLJN'#39', s3);    '
      'end;'
      ''
      
        'procedure meNAZN_DOLJNOnPreviewClick(Sender: TfrxView; Button: T' +
        'MouseButton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  if Length(s) = 0 then'
      '    s := IniReadString2('#39'FRXSIMLPETREB'#39', '#39'VAR_NAZN_DOLJN'#39',  '#39#39');'
      ''
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1100#39', '#39#1053#1072#1079#1085#1072#1095#1080#1083':'#39', s);          ' +
        '        '
      '  TfrxMemoView(Sender).Text := s2;          '
      '  Modified := True;'
      '  IniWriteString2('#39'FRXSIMLPETREB'#39', '#39'VAR_NAZN_DOLJN'#39',  s2);'
      'end;'
      ''
      
        'procedure meOTP_DOLJNOnPreviewClick(Sender: TfrxView; Button: TM' +
        'ouseButton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  if Length(s) = 0 then'
      '    s := IniReadString2('#39'FRXSIMLPETREB'#39', '#39'VAR_OTP_DOLJN'#39',  '#39#39');'
      ''
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1100#39', '#39#1054#1090#1087#1091#1089#1090#1080#1083':'#39', s);          ' +
        '        '
      '  TfrxMemoView(Sender).Text := s2;          '
      '  Modified := True;'
      '  IniWriteString2('#39'FRXSIMLPETREB'#39', '#39'VAR_OTP_DOLJN'#39',  s2);'
      'end;'
      ''
      
        'procedure mePOLUCH_DOLJNOnPreviewClick(Sender: TfrxView; Button:' +
        ' TMouseButton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  if Length(s) = 0 then'
      
        '    s := IniReadString2('#39'FRXSIMLPETREB'#39', '#39'VAR_POLUCH_DOLJN'#39',  '#39#39 +
        ');'
      ''
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1100#39', '#39#1055#1086#1083#1091#1095#1080#1083':'#39', s);           ' +
        '       '
      '  TfrxMemoView(Sender).Text := s2;          '
      '  Modified := True;'
      '  IniWriteString2('#39'FRXSIMLPETREB'#39', '#39'VAR_POLUCH_DOLJN'#39',  s2);'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxTrebZamGetValue
    OnUserFunction = frxSimpleTrebUserFunction
    Left = 84
    Top = 250
    Datasets = <
      item
        DataSet = frxDBdsSimpleTrebData
        DataSetName = 'frxDBdsSimpleTrebData'
      end
      item
        DataSet = frxDBdsSimpleTrebHeader
        DataSetName = 'frxDBdsSimpleTrebHeader'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 87.007854000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          Left = -0.755906000000000000
          Top = 0.078725999999999600
          Width = 684.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1074#8222#8211' [frxDBdsSimpleTrebHeader."FC_TREB"]'
            #1056#1109#1057#8218'  [frxDBdsSimpleTrebHeader."TRUNC_DATE"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Top = 44.000000000000000000
          Width = 680.315400000000000000
          Height = 19.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1108#1057#1107#1056#1169#1056#176': [frxDBdsSimpleTrebHeader."FC_GROUPFROM_WITH_NAME"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 63.000000000000000000
          Width = 680.315400000000000000
          Height = 19.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1057#1107#1056#1169#1056#176': [frxDBdsSimpleTrebHeader."FC_GROUPTO_WITH_NAME"]')
          ParentFont = False
        end
      end
      object MasterHeader1: TfrxHeader
        Height = 47.000000000000000000
        Top = 257.008040000000000000
        Width = 680.315400000000000000
        ReprintOnNewPage = True
        object Memo45: TfrxMemoView
          Left = 35.000000000000000000
          Top = 8.000000000000000000
          Width = 416.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Top = 8.000000000000000000
          Width = 35.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 540.000000000000000000
          Top = 8.000000000000000000
          Width = 70.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1057#1026#1056#181#1056#177'. '#1056#1108#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 451.000000000000000000
          Top = 8.000000000000000000
          Width = 89.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 610.315400000000000000
          Top = 8.000000000000000000
          Width = 70.000000000000000000
          Height = 39.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#8249#1056#1169'. '#1056#1108#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 20.000000000000000000
        Top = 325.039580000000000000
        Width = 680.315400000000000000
        AllowSplit = True
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frxDBdsSimpleTrebData
        DataSetName = 'frxDBdsSimpleTrebData'
        RowCount = 0
        Stretched = True
        object Memo27: TfrxMemoView
          Left = 35.000000000000000000
          Width = 416.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          Memo.UTF8 = (
            '[frxDBdsSimpleTrebData."FC_MEDIC"]')
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Width = 35.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 540.000000000000000000
          Width = 70.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsSimpleTrebData."FN_KOL"]')
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 451.000000000000000000
          Width = 89.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsSimpleTrebData."FC_EDIZM"]')
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 610.315400000000000000
          Width = 70.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.300000011920929000
          HAlign = haCenter
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.000000000000000000
        Top = 506.457020000000000000
        Width = 680.315400000000000000
        object Memo8: TfrxMemoView
          Left = 379.315400000000000000
          Width = 301.000000000000000000
          Height = 22.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 78.000000000000000000
        Top = 366.614410000000000000
        Width = 680.315400000000000000
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 4.000000000000000000
          Top = 7.000000000000000000
          Width = 72.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#183#1056#1029#1056#176#1057#8225#1056#1105#1056#187':')
          ParentFont = False
          VAlign = vaBottom
        end
        object meNAZN_DOLJN: TfrxMemoView
          Left = 80.000000000000000000
          Top = 7.000000000000000000
          Width = 288.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'meNAZN_DOLJNOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_NAZN_DOLJN]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object meNAZN_FIO: TfrxMemoView
          Left = 372.000000000000000000
          Top = 7.000000000000000000
          Width = 304.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'meNAZN_FIOOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_NAZN_FIO]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo12: TfrxMemoView
          Left = 4.000000000000000000
          Top = 30.000000000000000000
          Width = 72.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1107#1057#1027#1057#8218#1056#1105#1056#187':')
          ParentFont = False
          VAlign = vaBottom
        end
        object meOTP_DOLJN: TfrxMemoView
          Left = 80.000000000000000000
          Top = 30.000000000000000000
          Width = 288.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'meOTP_DOLJNOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_OTP_DOLJN]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object meOTP_FIO: TfrxMemoView
          Left = 372.000000000000000000
          Top = 30.000000000000000000
          Width = 304.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'meOTP_FIOOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_OTP_FIO]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo15: TfrxMemoView
          Left = 4.000000000000000000
          Top = 53.000000000000000000
          Width = 72.000000000000000000
          Height = 23.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#1105#1056#187':')
          ParentFont = False
          VAlign = vaBottom
        end
        object mePOLUCH_DOLJN: TfrxMemoView
          Left = 80.000000000000000000
          Top = 53.000000000000000000
          Width = 288.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'mePOLUCH_DOLJNOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_POLUCH_DOLJN]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object mePOLUCH_FIO: TfrxMemoView
          Left = 372.000000000000000000
          Top = 53.000000000000000000
          Width = 304.000000000000000000
          Height = 23.000000000000000000
          OnPreviewClick = 'mePOLUCH_FIOOnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_POLUCH_FIO]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object mdFinSource: TfrxMasterData
        Height = 28.000000000000000000
        Top = 166.299320000000000000
        Visible = False
        Width = 680.315400000000000000
        RowCount = 1
        object Memo9: TfrxMemoView
          Top = 6.000000000000000000
          Width = 680.320000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#152#1057#1027#1057#8218#1056#1109#1057#8225#1056#1029#1056#1105#1056#1108' '#1057#8222#1056#1105#1056#1029#1056#176#1056#1029#1057#1027#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039': [frxDBdsSimpleTre' +
              'bHeader."FC_FINSOURCE"]')
          ParentFont = False
        end
      end
      object mdComment: TfrxMasterData
        Height = 20.000000000000000000
        Top = 215.433210000000000000
        Width = 680.315400000000000000
        RowCount = 1
        Stretched = True
        object Memo7: TfrxMemoView
          Width = 680.315400000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1112#1056#181#1057#8218#1056#1108#1056#1105': [frxDBdsSimpleTrebHeader."FC_COMMENT"]')
          ParentFont = False
        end
      end
    end
  end
  object frxReport3: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39387.554601956000000000
    ReportOptions.LastChange = 40715.369904583330000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      
        'procedure Memo63OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1054#1090#1087#1091#1089#1090#1080#1083':'#39', s);  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      ''
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_FC_MO_FROM'#39',  s2);'
      'end;'
      ''
      
        'procedure Memo77OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s,s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1055#1086#1083#1091#1095#1080#1083':'#39', s);                '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_FC_MO_TO'#39',  s2);      '
      'end;'
      ''
      'procedure Memo86OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  SET('#39'FN_SUMM'#39', <FN_SUMM>+IIF(<frxDBdsInvoice2."FN_VIDANO_SUM">' +
        '=null, 0,<frxDBdsInvoice2."FN_VIDANO_SUM">) );  '
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SET('#39'FN_SUMM'#39', 0);  '
      'end;'
      ''
      
        'procedure Memo81OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1060#1048#1054':'#39', s);                  '
      '  TfrxMemoView(Sender).Text := s2;          '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_ZAV_APTEKA'#39',  s2);  '
      'end;'
      ''
      
        'procedure Memo89OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1047#1072#1074'. '#1086#1090#1076#1077#1083#1077#1085#1080#1077#1084' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103':'#39', s' +
        ');  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_FC_ZAV_OTD_TO'#39',  s2);  '
      'end;'
      ''
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  PageHeader1.Visible := (<Page> > 1);  '
      'end;'
      ''
      
        'procedure Memo101OnPreviewClick(Sender: TfrxView; Button: TMouse' +
        'Button; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1056#1072#1079#1088#1077#1096#1080#1083':'#39', s);  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_RAZRESHIL'#39',  s2);  '
      'end;'
      ''
      
        'procedure Memo102OnPreviewClick(Sender: TfrxView; Button: TMouse' +
        'Button; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054#39', '#39#1047#1072#1084'. '#1075#1083'. '#1074#1088#1072#1095#1072' '#1087#1086' '#1087#1088#1086#1092#1080#1083#1102':'#39', s)' +
        ';  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_ZAM_GLAV_PROFIL'#39',  s2);'
      '    '
      'end;'
      ''
      
        'procedure Memo91OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s, s2: String;'
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      '  s2 := InputBox('#39#1042#1074#1077#1076#1080#1090#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1100#39', '#39#1056#1072#1079#1088#1077#1096#1080#1083':'#39', s);  '
      '  TfrxMemoView(Sender).Text := s2;         '
      '  Modified := True;'
      '  IniWriteString2('#39'MANAGER_DOC'#39', '#39'VAR_RAZRESHIL_DOLJNOST'#39',  s2);'
      '    '
      'end;'
      ''
      'begin'
      '                      '
      'end.')
    OnGetValue = frxTrebNaklGetValue
    OnPrintReport = frxTrebNaklPrintReport
    OnUserFunction = frxTrebNaklUserFunction
    Left = 416
    Top = 178
    Datasets = <
      item
        DataSet = frxDBdsFinsource_in_Doc
        DataSetName = 'frxDBdsFinsource_in_Doc'
      end
      item
        DataSet = frxDBdsInvoice2
        DataSetName = 'frxDBdsInvoice2'
      end
      item
        DataSet = frxDBdsSimpleTrebHeader
        DataSetName = 'frxDBdsSimpleTrebHeader'
      end
      item
        DataSet = frxDBdsTDPC
        DataSetName = 'frxDBdsTDPC'
      end
      item
        DataSet = frxDBdsTTrebDpc
        DataSetName = 'frxDBdsTTrebDpc'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'FN_SUMM'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 17.999604166666700000
      RightMargin = 7.000875000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      Frame.Width = 3.000000000000000000
      LargeDesignHeight = True
      TitleBeforeHeader = False
      object Header2: TfrxHeader
        Height = 20.000000000000000000
        Top = 495.118430000000000000
        Width = 699.211238975208200000
        object Memo93: TfrxMemoView
          Left = 88.165430000000000000
          Width = 179.803340000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 36.133890000000000000
          Width = 52.031540000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 268.968770000000000000
          Width = 42.590600000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 2.000000000000000000
          Width = 34.133890000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 311.559370000000000000
          Width = 34.692950000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 346.252320000000000000
          Width = 69.488250000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 460.433520000000000000
          Width = 46.692950000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '8')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 415.740570000000000000
          Width = 44.692950000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '7')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Left = 507.126470000000000000
          Width = 62.370130000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '9')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 569.496600000000000000
          Width = 71.488250000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '10')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 640.984850000000000000
          Width = 51.811070000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '11')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Left = 88.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line5: TfrxLineView
          Left = 36.000000000000000000
          Top = 19.000000000000000000
          Width = 257.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          Left = 2.000000000000000000
          Top = 19.000000000000000000
          Width = 86.170000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
        end
        object Line12: TfrxLineView
          Left = 267.970000000000000000
          Top = 19.000000000000000000
          Width = 79.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
        end
        object Line23: TfrxLineView
          Left = 460.430000000000000000
          Top = 19.000000000000000000
          Width = 232.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
        end
        object Line11: TfrxLineView
          Left = 311.560000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line27: TfrxLineView
          Left = 415.740000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line28: TfrxLineView
          Left = 507.130000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line29: TfrxLineView
          Left = 569.500000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line32: TfrxLineView
          Left = 640.980000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line34: TfrxLineView
          Left = 693.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line35: TfrxLineView
          Left = 2.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
      end
      object MasterData1: TfrxMasterData
        Height = 16.000000000000000000
        Top = 536.693260000000000000
        Width = 699.211238975208200000
        DataSet = frxDBdsInvoice2
        DataSetName = 'frxDBdsInvoice2'
        RowCount = 0
        Stretched = True
        object Memo52: TfrxMemoView
          Left = 1.000000000000000000
          Width = 35.133890000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 36.133890000000000000
          Width = 52.031540000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FC_FINSOURCE"]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 88.165430000000000000
          Width = 179.803340000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          GapX = 4.000000000000000000
          Memo.UTF8 = (
            
              '[frxDBdsInvoice2."FC_MEDIC_NAME"] ([frxDBdsInvoice2."FC_SERIAL"]' +
              ')')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 346.250000000000000000
          Width = 69.488250000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FC_EDIZM_NAME"]')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 507.126470000000000000
          Width = 62.370130000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FN_PRICE"]')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 415.740570000000000000
          Width = 44.692950000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsInvoice2."fn_treb_kol2"]')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          Left = 569.496600000000000000
          Width = 71.488250000000000000
          Height = 16.000000000000000000
          OnBeforePrint = 'Memo86OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FN_VIDANO_SUM"]')
          ParentFont = False
        end
        object Line8: TfrxLineView
          Left = 640.984850000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Memo50: TfrxMemoView
          Left = 460.433520000000000000
          Width = 46.692950000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FN_VIDANO_KOL"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 267.970000000000000000
          Width = 42.590000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 311.559370000000000000
          Width = 34.692950000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 641.000000000000000000
          Width = 49.811070000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
        end
        object Line9: TfrxLineView
          Left = 2.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line10: TfrxLineView
          Left = 88.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line13: TfrxLineView
          Left = 268.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line14: TfrxLineView
          Left = 346.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line24: TfrxLineView
          Left = 461.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line25: TfrxLineView
          Left = 692.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 3.000000000000000000
        end
        object Line22: TfrxLineView
          Left = 311.560000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line26: TfrxLineView
          Left = 415.740000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line30: TfrxLineView
          Left = 507.130000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line31: TfrxLineView
          Left = 569.500000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line33: TfrxLineView
          Left = 640.980000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
      end
      object Footer1: TfrxFooter
        Height = 6.000000000000000000
        Top = 574.488560000000000000
        Width = 699.211238975208200000
        object Memo78: TfrxMemoView
          Width = 692.134510000000000000
          Height = 5.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 148.850340000000000000
        Top = 325.039580000000000000
        Width = 699.211238975208200000
        RowCount = 1
        object Memo80: TfrxMemoView
          Left = 3.779530000000000000
          Top = 9.000000000000000000
          Width = 54.811070000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#167#1056#181#1057#1026#1056#181#1056#183' '#1056#1108#1056#1109#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo81: TfrxMemoView
          Left = 157.212740000000000000
          Top = 7.000000000000000000
          Width = 239.370440000000000000
          Height = 24.677180000000000000
          OnPreviewClick = 'Memo81OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_ZAV_APTEKA]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo87: TfrxMemoView
          Left = 3.779530000000000000
          Top = 39.236240000000000000
          Width = 54.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8212#1056#176#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#187)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo89: TfrxMemoView
          Left = 157.212740000000000000
          Top = 33.234440000000000000
          Width = 150.976500000000000000
          Height = 24.900000000000000000
          OnPreviewClick = 'Memo89OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_FC_ZAV_OTD_TO]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo90: TfrxMemoView
          Left = 320.543600000000000000
          Top = 39.234440000000000000
          Width = 61.811070000000000000
          Height = 18.900000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#160#1056#176#1056#183#1057#1026#1056#181#1057#8364#1056#1105#1056#187)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo91: TfrxMemoView
          Left = 384.693260000000000000
          Top = 39.234440000000000000
          Width = 177.450000000000000000
          Height = 18.900000000000000000
          OnPreviewClick = 'Memo91OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[VAR_RAZRESHIL_DOLJNOST]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Line36: TfrxLineView
          Left = 666.110700000000000000
          Top = 58.133889999999800000
          Height = 34.015770000000000000
          ShowHint = False
          Frame.Color = clWhite
          Frame.Typ = [ftLeft]
        end
        object Memo101: TfrxMemoView
          Left = 564.701300000000000000
          Top = 39.234440000000000000
          Width = 132.417440000000000000
          Height = 18.900000000000000000
          OnPreviewClick = 'Memo101OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[VAR_RAZRESHIL]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo103: TfrxMemoView
          Left = 64.929190000000000000
          Top = 39.234440000000000000
          Width = 91.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1030'. '#1056#1109#1057#8218#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181#1056#1112)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo104: TfrxMemoView
          Left = 64.929190000000000000
          Top = 9.000000000000000000
          Width = 91.165430000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1030'. '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo105: TfrxMemoView
          Left = 88.165430000000000000
          Top = 84.598330000000000000
          Width = 223.393940000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1056#181' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 311.559370000000000000
          Top = 84.600000000000000000
          Width = 104.181200000000000000
          Height = 64.250000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169#1056#1105#1056#1029#1056#1105#1057#8224#1056#176' '#1056#1105#1056#183#1056#1112#1056#181#1057#1026#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Left = 415.740570000000000000
          Top = 84.598330000000000000
          Width = 91.385900000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 507.126470000000000000
          Top = 84.598330000000000000
          Width = 62.370130000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176','
            #1057#1026#1057#1107#1056#177'.'
            #1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo109: TfrxMemoView
          Left = 569.496600000000000000
          Top = 84.598330000000000000
          Width = 71.488250000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176
            #1056#177#1056#181#1056#183' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176
            #1056#1116#1056#8221#1056#1038','
            #1057#1026#1057#1107#1056#177'. '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 640.984850000000000000
          Top = 84.598330000000000000
          Width = 51.811070000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1056#1109#1056#1030#1057#8249#1056#8470
            #1056#1029#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1111#1056#1109
            #1057#1027#1056#1108#1056#187#1056#176#1056#1169#1057#1027#1056#1108#1056#1109#1056#8470
            #1056#1108#1056#176#1057#1026#1057#8218#1056#1109#1057#8218#1056#181#1056#1108#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 2.000000000000000000
          Top = 84.598330000000000000
          Width = 86.165430000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1057#1026#1057#1026#1056#181#1057#1027#1056#1111#1056#1109#1056#1029#1056#1169#1056#1105#1057#1026#1057#1107#1057#1035#1057#8240#1056#1105#1056#8470
            #1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 2.000000000000000000
          Top = 111.055040000000000000
          Width = 34.133890000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8225#1056#181#1057#8218','
            #1057#1027#1057#1107#1056#177#1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Left = 36.133890000000000000
          Top = 111.055040000000000000
          Width = 52.031540000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1169' '#1056#176#1056#1029#1056#176#1056#187#1056#1105#1057#8218#1056#1105'-'
            #1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Left = 88.165430000000000000
          Top = 111.055040000000000000
          Width = 179.803340000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo115: TfrxMemoView
          Left = 267.968770000000000000
          Top = 111.055040000000000000
          Width = 42.590000000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#1109#1056#1112#1056#181#1056#1029#1056#1108'-'
            #1056#187#1056#176#1057#8218#1057#1107#1057#1026#1056#1029#1057#8249#1056#8470
            #1056#1029#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Left = 346.252320000000000000
          Top = 111.055040000000000000
          Width = 69.488250000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 310.559370000000000000
          Top = 111.055040000000000000
          Width = 35.692950000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 415.740570000000000000
          Top = 111.055040000000000000
          Width = 44.692950000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#176#1057#8218#1057#1026#1056#181'-'
            #1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 460.433520000000000000
          Top = 111.055040000000000000
          Width = 46.692950000000000000
          Height = 37.795300000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1109#1057#8218#1056#1111#1057#1107'-'
            #1057#8240#1056#181#1056#1029#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData3: TfrxMasterData
        Height = 20.700000000000000000
        Top = 279.685220000000000000
        Width = 699.211238975208200000
        RowCount = 1
        Stretched = True
        object Memo27: TfrxMemoView
          Left = 44.000000000000000000
          Width = 63.590600000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd.mm.yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FD_INVOICE]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 645.394250000000000000
          Width = 51.267780000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 543.330000000000000000
          Width = 41.490000000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 107.590600000000000000
          Width = 32.692950000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 140.200000000000000000
          Width = 201.570000000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FC_MOGROUP_FROM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 341.850650000000000000
          Width = 201.570000000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FC_MOGROUP_TO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 584.820000000000000000
          Width = 61.488250000000000000
          Height = 20.700787400000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 584.820000000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line37: TfrxLineView
          Left = 645.394250000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line38: TfrxLineView
          Left = 543.330000000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line39: TfrxLineView
          Left = 341.850650000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line40: TfrxLineView
          Left = 140.200000000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line41: TfrxLineView
          Left = 107.590600000000000000
          Top = 1.000000000000000000
          Height = 21.456710000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
      end
      object MasterData4: TfrxMasterData
        Height = 19.000000000000000000
        Top = 687.874460000000000000
        Width = 699.211238975208200000
        RowCount = 1
        Stretched = True
        object Memo47: TfrxMemoView
          Left = 22.000000000000000000
          Width = 671.000000000000000000
          Height = 19.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1109#1057#8218#1056#1111#1057#1107#1057#8240#1056#181#1056#1029#1056#1109' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' [MONEYSTR(<FN_SUMM>)' +
              ']')
          ParentFont = False
        end
      end
      object MasterData5: TfrxMasterData
        Height = 142.000000000000000000
        Top = 729.449290000000000000
        Width = 699.211238975208200000
        RowCount = 1
        object Memo23: TfrxMemoView
          Left = 3.000000000000000000
          Top = 16.000000000000000000
          Width = 88.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1107#1057#1027#1057#8218#1056#1105#1056#187)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 98.000000000000000000
          Top = 16.000000000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 98.000000000000000000
          Top = 34.897650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 230.000000000000000000
          Top = 16.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 325.000000000000000000
          Top = 16.000000000000000000
          Width = 250.000000000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo63OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FC_MO_FROM]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 230.000000000000000000
          Top = 34.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 325.000000000000000000
          Top = 34.897650000000000000
          Width = 250.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 3.000000000000000000
          Top = 58.000000000000000000
          Width = 88.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#1105#1056#187)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 98.000000000000000000
          Top = 58.000000000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 98.000000000000000000
          Top = 76.897650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 230.000000000000000000
          Top = 58.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 325.000000000000000000
          Top = 58.000000000000000000
          Width = 250.000000000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo77OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_FC_MO_TO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 230.000000000000000000
          Top = 76.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 325.000000000000000000
          Top = 76.897650000000000000
          Width = 250.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 98.000000000000000000
          Top = 100.000000000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1030'. '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 98.000000000000000000
          Top = 118.897650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 230.000000000000000000
          Top = 100.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 325.000000000000000000
          Top = 100.000000000000000000
          Width = 250.000000000000000000
          Height = 18.897650000000000000
          OnPreviewClick = 'Memo81OnPreviewClick'
          ShowHint = False
          Cursor = crHandPoint
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_ZAV_APTEKA]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 230.000000000000000000
          Top = 118.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 325.000000000000000000
          Top = 118.897650000000000000
          Width = 250.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDouble
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 158.007978000000000000
        Top = 60.472480000000000000
        Width = 699.211238975208200000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo13: TfrxMemoView
          Left = 499.606804000000000000
          Top = 1.000000000000000000
          Width = 193.748176000000000000
          Height = 41.574830000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1118#1056#1105#1056#1111#1056#1109#1056#1030#1056#176#1057#1039' '#1056#1112#1056#181#1056#182#1056#1109#1057#8218#1057#1026#1056#176#1057#1027#1056#187#1056#181#1056#1030#1056#176#1057#1039' '#1057#8222#1056#1109#1057#1026#1056#1112#1056#176' '#1074#8222#8211' '#1056#1114'-11'
            
              #1056#1032#1057#8218#1056#1030#1056#181#1057#1026#1056#182#1056#1169#1056#181#1056#1029#1056#176' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1029#1056#1109#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1056#181#1056#1112' '#1056#8220#1056#1109#1057#1027#1056#1108#1056#1109#1056#1112#1057#1027 +
              #1057#8218#1056#176#1057#8218#1056#176' '#1056#160#1056#1109#1057#1027#1057#1027#1056#1105#1056#1105
            #1056#1109#1057#8218' 30.10.97 '#1074#8222#8211' 71'#1056#176)
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 154.787570000000000000
          Top = 48.503958000000000000
          Width = 210.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1118#1056#160#1056#8226#1056#8216#1056#1115#1056#8217#1056#1106#1056#1116#1056#152#1056#8226'-'#1056#1116#1056#1106#1056#1113#1056#8250#1056#1106#1056#8221#1056#1116#1056#1106#1056#1031' '#1074#8222#8211)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 365.236550000000000000
          Top = 48.503958000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            '[VAR_FC_DOC]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 608.850960000000000000
          Top = 49.503958000000000000
          Width = 85.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169#1057#8249)
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 608.850960000000000000
          Top = 68.401608000000000000
          Width = 85.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '0315006')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 608.850960000000000000
          Top = 87.299258000000000000
          Width = 85.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 3.000000000000000000
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 4.000000000000000000
          Top = 87.299258000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 90.929190000000000000
          Top = 67.299258000000000000
          Width = 401.535870000000000000
          Height = 38.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[VAR_UCHR_NAME]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo59: TfrxMemoView
          Left = 526.465060000000000000
          Top = 68.401608000000000000
          Width = 73.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#1109#1057#1026#1056#1112#1056#176' '#1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1032#1056#8221)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo60: TfrxMemoView
          Left = 525.701300000000000000
          Top = 91.078788000000000000
          Width = 74.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1119#1056#1115)
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 43.913420000000000000
          Top = 113.755968000000000000
          Width = 63.590600000000000000
          Height = 43.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176
            #1057#1027#1056#1109#1057#1027#1057#8218#1056#176'-'
            #1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 107.504020000000000000
          Top = 113.755968000000000000
          Width = 32.692950000000000000
          Height = 43.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169' '#1056#1030#1056#1105#1056#1169#1056#176
            #1056#1109#1056#1111#1056#181#1057#1026#1056#176'-'#1057#8224#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 140.196970000000000000
          Top = 113.755968000000000000
          Width = 201.567100000000000000
          Height = 21.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1026#1056#176#1056#1030#1056#1105#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 341.764070000000000000
          Top = 113.755968000000000000
          Width = 201.570000000000000000
          Height = 21.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 645.307670000000000000
          Top = 113.755968000000000000
          Width = 50.511811020000000000
          Height = 43.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1057#8225#1056#181#1057#8218#1056#1029#1056#176#1057#1039
            #1056#181#1056#1169#1056#1105#1056#1029#1056#1105#1057#8224#1056#176
            #1056#1030#1057#8249#1056#1111#1057#1107#1057#1027#1056#1108#1056#176
            #1056#1111#1057#1026#1056#1109#1056#1169#1057#1107#1056#1108#1057#8224#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 543.331170000000000000
          Top = 113.755968000000000000
          Width = 101.976500000000000000
          Height = 43.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1057#1026#1057#1026#1056#181#1057#1027#1056#1111#1056#1109#1056#1029#1056#1169#1056#1105#1057#1026#1057#1107#1057#1035#1057#8240#1056#1105#1056#8470
            #1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 543.331170000000000000
          Top = 134.992208000000000000
          Width = 41.488250000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8225#1056#181#1057#8218','
            #1057#1027#1057#1107#1056#177#1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 584.819420000000000000
          Top = 134.992208000000000000
          Width = 60.488250000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1169' '#1056#176#1056#1029#1056#176#1056#187#1056#1105#1057#8218#1056#1105'-'
            #1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 341.764070000000000000
          Top = 134.992208000000000000
          Width = 100.280000000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026#1057#1107#1056#1108#1057#8218#1057#1107#1057#1026#1056#1029#1056#1109#1056#181
            #1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 442.047620000000000000
          Top = 134.992208000000000000
          Width = 101.283550000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1030#1056#1105#1056#1169
            #1056#1169#1056#181#1057#1039#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 140.196970000000000000
          Top = 134.992208000000000000
          Width = 101.283550000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026#1057#1107#1056#1108#1057#8218#1057#1107#1057#1026#1056#1029#1056#1109#1056#181
            #1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 241.480520000000000000
          Top = 134.992208000000000000
          Width = 100.283550000000000000
          Height = 22.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1030#1056#1105#1056#1169
            #1056#1169#1056#181#1057#1039#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line15: TfrxLineView
          Left = 341.764070000000000000
          Top = 135.992208000000000000
          Height = 22.015770000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line16: TfrxLineView
          Left = 608.850960000000000000
          Top = 87.299258000000000000
          Width = 85.724490000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 20.000000000000000000
        Top = 18.897650000000000000
        Width = 699.211238975208200000
        OnBeforePrint = 'PageHeader1OnBeforePrint'
        object Memo1: TfrxMemoView
          Align = baClient
          Width = 699.211238975208200000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 3.000000000000000000
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1057#1107#1057#8225#1056#176#1057#8218#1056#181#1056#187#1057#1034': [VAR_FC_MOGROUP_TO]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 933.543910000000000000
        Width = 699.211238975208200000
        object Memo2: TfrxMemoView
          Align = baClient
          Width = 699.211238975208200000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [<Page#>] '#1056#1105#1056#183' [<TotalPages#>]')
          ParentFont = False
        end
      end
      object MasterData6: TfrxMasterData
        Height = 19.653543310000000000
        Top = 604.724800000000000000
        Width = 699.211238975208200000
        DataSet = frxDBdsFinsource_in_Doc
        DataSetName = 'frxDBdsFinsource_in_Doc'
        RowCount = 0
        Stretched = True
        object Memo11: TfrxMemoView
          Width = 415.740000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' [frxDBdsFinsource_in_Doc."FC_FINSOURCE"]:')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 415.740000000000000000
          Width = 222.000000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsFinsource_in_Doc."FN_SUM"]')
          ParentFont = False
        end
      end
      object MasterData7: TfrxMasterData
        Height = 20.000000000000000000
        Top = 646.299630000000000000
        Width = 699.211238975208200000
        RowCount = 1
        object Memo79: TfrxMemoView
          Left = 415.740000000000000000
          Width = 222.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 3.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[<FN_SUMM>]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Width = 415.740000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1035)
          ParentFont = False
        end
      end
    end
  end
  object oqTSMINI: TOracleQuery
    SQL.Strings = (
      'begin'
      '  asu.pkg_smini.writestring(:pSection,:pKey,:pValue);'
      'end;')
    Optimize = False
    Variables.Data = {
      0300000003000000090000003A5053454354494F4E0500000000000000000000
      00050000003A504B4559050000000000000000000000070000003A5056414C55
      45050000000000000000000000}
    Left = 24
    Top = 344
  end
  object frxNarcoticAct: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41653.490479143500000000
    ReportOptions.LastChange = 41856.701860972220000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 24
    Top = 104
    Datasets = <
      item
        DataSet = frxDBdsInvoice2
        DataSetName = 'frxDBdsInvoice2'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'ACT_NO'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 283.464750000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Width = 718.110700000000000000
          Height = 94.488250000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1032#1056#1118#1056#8217#1056#8226#1056#160#1056#8211#1056#8221#1056#1106#1056#174
            
              #1056#8212#1056#176#1056#1112#1056#181#1057#1027#1057#8218#1056#1105#1057#8218#1056#181#1056#187#1057#1034' '#1056#1110#1056#187#1056#176#1056#1030#1056#1029#1056#1109#1056#1110#1056#1109' '#1056#1030#1057#1026#1056#176#1057#8225#1056#176' '#1056#1111#1056#1109' '#1056#1112#1056#181#1056#1169#1056#1105 +
              #1057#8224#1056#1105#1056#1029#1057#1027#1056#1108#1056#1109#1056#8470' '#1057#8225#1056#176#1057#1027#1057#8218#1056#1105' [ZAM_GL_VRA4_PO_MED_4ASTI]'
            '[S_NAME]'
            '[RASH_DATE]'
            '__________________')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 109.606370000000000000
          Width = 718.110700000000000000
          Height = 49.133890000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1106#1056#1113#1056#1118' '#1074#8222#8211' [ACT_NO]'
            
              #1056#1111#1056#187#1056#1109#1056#1112#1056#177#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039' '#1056#1029#1056#176#1057#1026#1056#1108#1056#1109#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1105#1057#8230' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027 +
              #1057#8218#1056#1030', '#1056#1111#1057#1027#1056#1105#1057#8230#1056#1109#1057#8218#1057#1026#1056#1109#1056#1111#1056#1029#1057#8249#1057#8230' '#1056#1030#1056#181#1057#8240#1056#181#1057#1027#1057#8218#1056#1030' '#1056#1105' '#1056#1111#1057#1026#1056#181#1056#1108#1057#1107#1057#1026#1057#1027#1056 +
              #1109#1057#1026#1056#1109#1056#1030)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Align = baWidth
          Top = 192.756030000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          GroupIndex = 3
          ShowHint = False
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1057#1039' '#1056#1030' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#181':')
        end
        object Memo33: TfrxMemoView
          Align = baLeft
          Top = 211.653680000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          GroupIndex = 3
          ShowHint = False
          Memo.UTF8 = (
            #1056#1111#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1039' ')
        end
        object Memo34: TfrxMemoView
          Align = baWidth
          Left = 98.267780000000000000
          Top = 211.653680000000000000
          Width = 619.842920000000000000
          Height = 18.897650000000000000
          GroupIndex = 3
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[PREDSED]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Top = 230.551330000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          GroupIndex = 3
          ShowHint = False
          Memo.UTF8 = (
            #1057#8225#1056#187#1056#181#1056#1029#1056#1109#1056#1030' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105)
        end
        object Memo36: TfrxMemoView
          Align = baWidth
          Left = 113.385900000000000000
          Top = 230.551330000000000000
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          GroupIndex = 3
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[KOMISS1] [KOMISS2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Align = baWidth
          Top = 249.448980000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          GroupIndex = 3
          ShowHint = False
          Memo.UTF8 = (
            '[RASH_DATE] '#1056#1111#1057#1026#1056#1109#1056#1105#1056#183#1056#1030#1056#181#1056#187#1056#176' '#1056#1111#1056#187#1056#1109#1056#1112#1056#177#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 200.315090000000000000
        Top = 510.236550000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Left = 718.110700000000000000
          Top = 86.929190000000400000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '_________________________________________')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Align = baWidth
          Top = 11.338590000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haBlock
          Memo.UTF8 = (
            #1057#1107#1056#1111#1056#176#1056#1108#1056#1109#1056#1030#1056#176#1056#1029#1056#1029#1057#8249#1057#8230' '#1057#1027' '#1056#1105#1057#1027#1056#1111#1056#1109#1056#187#1057#1034#1056#183#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181#1056#1112' [PKG]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo25: TfrxMemoView
          Top = 52.913420000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          GroupIndex = 5
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = -3.779530000000000000
          Top = 34.015770000000000000
          Width = 721.890230000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '('#1056#1109#1057#1027#1056#1029#1056#1109#1056#1030#1056#1029#1057#8249#1056#181' '#1057#8230#1056#176#1057#1026#1056#176#1056#1108#1057#8218#1056#181#1057#1026#1056#1105#1057#1027#1057#8218#1056#1105#1056#1108#1056#1105' '#1057#8218#1057#1026#1056#176#1056#1029#1057#1027#1056#1111#1056#1109#1057#1026#1057 +
              #8218#1056#1029#1056#1109#1056#8470' '#1057#8218#1056#176#1057#1026#1057#8249', '#1057#1107#1056#1111#1056#176#1056#1108#1056#1109#1056#1030#1056#1108#1056#1105' '#1056#1105#1056#187#1056#1105' '#1057#1107#1056#1111#1056#176#1056#1108#1056#1109#1056#1030#1056#1109#1057#8225#1056#1029#1057#8249#1057#8230 +
              ' '#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1056#1109#1056#1030', '#1056#1108#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1057#1107#1056#1111#1056#176#1056#1108#1056#1109#1056#1030#1056#1109#1057#8225#1056#1029#1057#8249 +
              #1057#8230' '#1056#1112#1056#181#1057#1027#1057#8218')')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Align = baWidth
          Top = 71.811070000000000000
          Width = 718.110700000000000000
          Height = 11.338590000000000000
          GroupIndex = 5
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#1109#1056#1112#1056#181#1057#1026'('#1056#1109#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1056#1105#1056#181') '#1056#1111#1056#187#1056#1109#1056#1112#1056#177)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 102.047310000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 166.299320000000000000
          Top = 102.047310000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 166.299320000000000000
          Top = 120.944960000000000000
          Width = 162.519790000000000000
          Height = 11.338590000000000000
          GroupIndex = 1
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 419.527830000000000000
          Top = 102.047310000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[PREDSED]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 419.527830000000000000
          Top = 120.944960000000000000
          Width = 302.362400000000000000
          Height = 11.338590000000000000
          GroupIndex = 1
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8222'.'#1056#1105'.'#1056#1109')')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Top = 139.842610000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          GroupIndex = 2
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 166.299320000000000000
          Top = 139.842610000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          GroupIndex = 2
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 166.299320000000000000
          Top = 158.740260000000000000
          Width = 162.519790000000000000
          Height = 11.338590000000000000
          GroupIndex = 2
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 166.299320000000000000
          Top = 188.976500000000000000
          Width = 162.519790000000000000
          Height = 11.338590000000000000
          GroupIndex = 2
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 166.299320000000000000
          Top = 170.078850000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          GroupIndex = 2
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 419.527830000000000000
          Top = 139.842610000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          GroupIndex = 2
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[KOMISS1]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 419.527830000000000000
          Top = 170.078850000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          GroupIndex = 2
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[KOMISS2]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 419.527830000000000000
          Top = 158.740260000000000000
          Width = 302.362400000000000000
          Height = 11.338590000000000000
          GroupIndex = 2
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8222'.'#1056#1105'.'#1056#1109')')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 419.527830000000000000
          Top = 188.976500000000000000
          Width = 302.362400000000000000
          Height = 11.338590000000000000
          GroupIndex = 2
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8222'.'#1056#1105'.'#1056#1109')')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 45.354330710000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        object Memo26: TfrxMemoView
          Width = 34.015748030000000000
          Height = 45.354330710000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 529.134036460000000000
          Width = 37.795275590000000000
          Height = 45.354330710000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 34.015770000000000000
          Width = 495.118288430000000000
          Height = 45.354330710000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 566.929500000000000000
          Width = 151.181175590000000000
          Height = 45.354330710000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1111#1057#1107#1057#8240#1056#181#1056#1029#1056#1109' '#1056#1108#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 20.000000000000000000
        Top = 430.866420000000000000
        Width = 718.110700000000000000
        DataSet = frxDBdsInvoice2
        DataSetName = 'frxDBdsInvoice2'
        RowCount = 0
        object Memo29: TfrxMemoView
          Width = 34.015748030000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 34.015748030000000000
          Width = 495.118288430000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FC_NAME_RUS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 529.134200000000000000
          Width = 37.795275590000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FC_EDIZM_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object meKolOtpusheno: TfrxMemoView
          Left = 566.929500000000000000
          Width = 151.181143860000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsInvoice2."FN_VIDANO_KOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxAutoFillPlan: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41929.546806909700000000
    ReportOptions.LastChange = 41933.421378333300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure Memo2OnAfterData(Sender: TfrxComponent);'
      'begin'
      '  if (Sender is TfrxMemoView) then'
      '  begin              '
      
        '    if ( <frxdsTrebDpcList."FN_KOL"> = <frxdsAutoFillPlan."FN_SU' +
        'M_RASH_BY_DPC"> )then  // '#1074#1099#1076#1072#1085#1086' '#1085#1091#1078#1085#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' - '#1079#1077#1083#1077#1085#1099#1081'  '
      '       TfrxMemoView(Sender).Color := $00D9FFD9           '
      '    else'
      
        '    if ( <frxdsTrebDpcList."FN_KOL"> > <frxdsAutoFillPlan."FN_SU' +
        'M_RASH_BY_DPC"> )then // '#1085#1077#1076#1086#1076#1072#1083#1080' - '#1082#1088#1072#1089#1085#1099#1081
      '       TfrxMemoView(Sender).Color := $00D9D9FF'
      '    else'
      
        '    if ( <frxdsTrebDpcList."FN_KOL"> < <frxdsAutoFillPlan."FN_SU' +
        'M_RASH_BY_DPC"> )then // '#1076#1072#1083#1080' '#1073#1086#1083#1100#1096#1077' - '#1089#1080#1085#1080#1081
      '       TfrxMemoView(Sender).Color := $00FFD9D9;'
      '  end;                           '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxAutoFillPlanGetValue
    Left = 8
    Top = 400
    Datasets = <
      item
        DataSet = frxdsAutoFillDeficit
        DataSetName = 'frxdsAutoFillDeficit'
      end
      item
        DataSet = frxdsAutoFillPlan
        DataSetName = 'frxdsAutoFillPlan'
      end
      item
        DataSet = frxdsRashByAutoFillPlan
        DataSetName = 'frxdsRashByAutoFillPlan'
      end
      item
        DataSet = frxdsTrebDpcList
        DataSetName = 'frxdsTrebDpcList'
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
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      DataSet = frxdsAutoFillPlan
      DataSetName = 'frxdsAutoFillPlan'
      object Header1: TfrxHeader
        Height = 46.456710000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        PrintChildIfInvisible = True
        ReprintOnNewPage = True
        object Memo6: TfrxMemoView
          Left = 419.527830000000000000
          Top = 20.000000000000000000
          Width = 52.913420000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 472.441250000000000000
          Top = 20.000000000000000000
          Width = 83.149660000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#176#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Top = 20.000000000000000000
          Width = 75.590600000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169' '#1056#1111#1056#1109#1056#183#1056#1105#1057#8224#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 75.590600000000000000
          Top = 20.000000000000000000
          Width = 343.937230000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 555.590910000000000000
          Top = 20.000000000000000000
          Width = 94.488193860000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#181#1057#8230#1056#1030#1056#176#1057#8218#1056#1108#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#183#1056#1105#1057#8224#1056#1105#1056#1105' '#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039':')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        DataSet = frxdsTrebDpcList
        DataSetName = 'frxdsTrebDpcList'
        KeepChild = True
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
        object Memo2: TfrxMemoView
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          OnAfterData = 'Memo2OnAfterData'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsTrebDpcList."FK_TREB_DPCID"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 75.590600000000000000
          Width = 343.937230000000000000
          Height = 15.118120000000000000
          OnAfterData = 'Memo2OnAfterData'
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsTrebDpcList."FC_MEDIC"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 419.527830000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          OnAfterData = 'Memo2OnAfterData'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsTrebDpcList."FC_EI"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 472.441250000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          OnAfterData = 'Memo2OnAfterData'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsTrebDpcList."FN_KOL"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 555.590910000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          OnAfterData = 'Memo2OnAfterData'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            
              '[<frxdsTrebDpcList."FN_KOL"> - <frxdsAutoFillPlan."FN_SUM_RASH_B' +
              'Y_DPC">]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 82.267780000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Child = frxAutoFillPlan.Child1
        KeepChild = True
        Stretched = True
        object Memo4: TfrxMemoView
          Align = baWidth
          Top = 15.456710000000000000
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#187#1056#176#1056#1029' '#1056#176#1056#1030#1057#8218#1056#1109#1056#183#1056#176#1056#1111#1056#1109#1056#187#1056#1029#1056#181#1056#1029#1056#1105#1057#1039' [VAR_FINSOURCE_CONDITION]'
            
              #1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1056#1029#1056#1109#1056#1110#1056#1109' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176' '#1074#8222#8211' [VAR_FC_DOC] '#1056#1109#1057#8218' [V' +
              'AR_FD_INVOICE]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Align = baWidth
          Top = 63.370130000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            #1056#1115#1057#8218' '#1056#1108#1056#1109#1056#1110#1056#1109': [VAR_FC_MOGROUP_FROM]')
        end
        object Memo60: TfrxMemoView
          Left = 483.779840000000000000
          Width = 234.330860000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#1039': [<Date>] [<Time>]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 15.118120000000000000
        Top = 347.716760000000000000
        Width = 718.110700000000000000
        DataSet = frxdsAutoFillPlan
        DataSetName = 'frxdsAutoFillPlan'
        KeepTogether = True
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 22.677180000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Hint = #1055#1086#1076#1086#1073#1088#1072#1085#1086' '#1080#1079' '#1086#1089#1090#1072#1090#1082#1086#1074
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsAutoFillPlan."KARTID"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 90.708720000000000000
          Width = 328.819110000000000000
          Height = 15.118120000000000000
          Hint = #1055#1086#1076#1086#1073#1088#1072#1085#1086' '#1080#1079' '#1086#1089#1090#1072#1090#1082#1086#1074
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsAutoFillPlan."FC_RASH_MEDIC"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 650.079160000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Hint = #1055#1086#1076#1086#1073#1088#1072#1085#1086' '#1080#1079' '#1086#1089#1090#1072#1090#1082#1086#1074
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsAutoFillPlan."FD_GODEN"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 555.590910000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Hint = #1055#1086#1076#1086#1073#1088#1072#1085#1086' '#1080#1079' '#1086#1089#1090#1072#1090#1082#1086#1074
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsAutoFillPlan."FC_SERIAL"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 419.527830000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Hint = #1055#1086#1076#1086#1073#1088#1072#1085#1086' '#1080#1079' '#1086#1089#1090#1072#1090#1082#1086#1074
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsAutoFillPlan."FC_EI"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 472.441250000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          Hint = #1055#1086#1076#1086#1073#1088#1072#1085#1086' '#1080#1079' '#1086#1089#1090#1072#1090#1082#1086#1074
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsAutoFillPlan."FN_KOL"]')
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        Height = 15.118120000000000000
        Top = 309.921460000000000000
        Width = 718.110700000000000000
        PrintChildIfInvisible = True
        ReprintOnNewPage = True
        object Memo9: TfrxMemoView
          Left = 22.677180000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169' '#1056#1111#1056#176#1057#1026#1057#8218#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 90.708720000000000000
          Width = 328.819110000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 555.590910000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#181#1057#1026#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 650.079160000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8220#1056#1109#1056#1169#1056#181#1056#1029' '#1056#1169#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 419.527830000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 472.441250000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Height = 15.118120000000000000
        Top = 487.559370000000000000
        Width = 718.110700000000000000
        DataSet = frxdsRashByAutoFillPlan
        DataSetName = 'frxdsRashByAutoFillPlan'
        RowCount = 0
        Stretched = True
        object Memo31: TfrxMemoView
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsRashByAutoFillPlan."KARTID"]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 75.590600000000000000
          Width = 343.937230000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsRashByAutoFillPlan."FC_MEDIC"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 419.527830000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsRashByAutoFillPlan."FC_EI"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 472.441250000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsRashByAutoFillPlan."FN_KOL"]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 555.590910000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsRashByAutoFillPlan."FC_SERIAL"]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 650.079160000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsRashByAutoFillPlan."FD_GODEN"]')
          ParentFont = False
        end
      end
      object Header3: TfrxHeader
        Height = 46.354342910000000000
        Top = 419.527830000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        object Memo15: TfrxMemoView
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#183#1056#1105#1057#8224#1056#1105#1056#1105' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1056#176' '#1056#1111#1056#1109' '#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1035':')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Top = 19.897650000000000000
          Width = 75.590600000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169' '#1056#1111#1056#176#1057#1026#1057#8218#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 75.590600000000000000
          Top = 19.897650000000000000
          Width = 343.937230000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 555.590910000000000000
          Top = 19.897650000000000000
          Width = 94.488250000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#181#1057#1026#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 650.079160000000000000
          Top = 19.897650000000000000
          Width = 68.031540000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8220#1056#1109#1056#1169#1056#181#1056#1029' '#1056#1169#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 419.527830000000000000
          Top = 19.897650000000000000
          Width = 52.913420000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 472.441250000000000000
          Top = 19.897650000000000000
          Width = 83.149660000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 11.338590000000000000
        Top = 385.512060000000000000
        Width = 718.110700000000000000
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 702.992580000000000000
        Width = 718.110700000000000000
        object Memo38: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[<Page>]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 22.677180000000000000
          Width = 18.897637800000000000
          Height = 15.118110240000000000
          ShowHint = False
          Color = 14286809
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 41.574830000000000000
          Width = 128.504007800000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#176#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1109' = '#1056#8217#1057#8249#1056#1169#1056#176#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 207.874150000000000000
          Width = 18.897637800000000000
          Height = 15.118110240000000000
          ShowHint = False
          Color = 14277119
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 226.771800000000000000
          Width = 128.504007800000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#176#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1109' > '#1056#8217#1057#8249#1056#1169#1056#176#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 396.850650000000000000
          Width = 18.897637800000000000
          Height = 15.118110240000000000
          ShowHint = False
          Color = 16767449
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 415.748300000000000000
          Width = 128.504007800000000000
          Height = 15.118110240000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#176#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1109' < '#1056#8217#1057#8249#1056#1169#1056#176#1056#1029#1056#1109)
          ParentFont = False
        end
      end
      object Child1: TfrxChild
        Height = 18.897650000000000000
        Top = 124.724490000000000000
        Width = 718.110700000000000000
        object Memo40: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1112#1057#1107': [VAR_FC_MOGROUP_TO]')
        end
      end
      object MasterData3: TfrxMasterData
        Height = 15.118120000000000000
        Top = 627.401980000000000000
        Width = 718.110700000000000000
        DataSet = frxdsAutoFillDeficit
        DataSetName = 'frxdsAutoFillDeficit'
        RowCount = 0
        object Memo41: TfrxMemoView
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsAutoFillDeficit."FK_TREB_DPCID"]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 75.590600000000000000
          Width = 343.937230000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsAutoFillDeficit."FC_MEDIC"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 419.527830000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsAutoFillDeficit."FC_EI"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 472.441250000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsAutoFillDeficit."FN_ZATR_KOL"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 555.590910000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsAutoFillDeficit."FN_RASH_KOL"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxdsAutoFillDeficit."FN_DELTA"]')
          ParentFont = False
        end
      end
      object Header4: TfrxHeader
        Height = 45.354360000000000000
        Top = 559.370440000000000000
        Width = 718.110700000000000000
        object Memo42: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#1116#1056#181#1057#8230#1056#1030#1056#176#1057#8218#1056#1108#1056#176' '#1056#1111#1056#1109' '#1056#183#1056#176#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1029#1057#8249#1056#1112' '#1056#1111#1056#1109#1056#183#1056#1105#1057#8224#1056#1105#1057#1039#1056 +
              #1112':')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169' '#1056#1111#1056#1109#1056#183#1056#1105#1057#8224#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 75.590600000000000000
          Top = 18.897650000000000000
          Width = 343.937230000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 419.527830000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 472.441250000000000000
          Top = 18.897650000000000000
          Width = 83.149660000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#176#1057#8218#1057#1026#1056#181#1056#177#1056#1109#1056#1030#1056#176#1056#1029#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 555.590910000000000000
          Top = 18.897650000000000000
          Width = 83.149606300000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176' '#1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1108#1056#176#1057#8230)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 638.740570000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#181#1057#8230#1056#1030#1056#176#1057#8218#1056#1108#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer2: TfrxFooter
        Height = 11.338582677165400000
        Top = 525.354670000000000000
        Width = 718.110700000000000000
      end
    end
  end
  object odsAutoFillPlanPrint: TOracleDataSet
    SQL.Strings = (
      '  select tdpc.FK_ID as FK_TREB_DPCID,'
      '         k.KARTID,'
      '         k.MEDICID,'
      
        '         coalesce ( mt.FC_NAME, '#39'('#1054#1089#1090#1072#1090#1082#1072' '#1085#1077#1076#1086#1089#1090#1072#1090#1086#1095#1085#1086')'#39' ) as FC' +
        '_RASH_MEDIC,'
      '         ei.FC_NAME as FC_EI,'
      '         k.FC_SERIAL,'
      '         k.FD_GODEN, '
      '         NULLIF ( t.FN_KOL, 0 ) FN_KOL,'
      
        '         coalesce ( sum ( t.FN_KOL ) over ( partition by t.FK_TR' +
        'EB_DPCID ), 0 )  as FN_SUM_RASH_BY_DPC    '
      
        '    from table ( cast (:pTrebDPCList as med.O_TREB_DPC_TABLE) ) ' +
        'tdpc               '
      
        '    left join table ( cast (:pObj as med.o_rash_autofillplan_tab' +
        'le ) ) t'
      '      on tdpc.fk_id = t.FK_TREB_DPCID'
      '    left join med.tkart k'
      '      on t.FK_KARTID = k.kartid'
      '    left join med.tmedic mt'
      '      on k.medicid = mt.medicid'
      '    left join med.TEI ei'
      '      on mt.EIID = ei.EIID'
      '   where tdpc.FK_ID = :FK_TREB_DPCID'
      '   order by k.FD_GODEN, upper(mt.FC_NAME), t.FN_KOL')
    Optimize = False
    Variables.Data = {
      0300000003000000050000003A504F424A6C00000000000000000000000E0000
      003A464B5F545245425F44504349440300000000000000000000000D0000003A
      50545245424450434C4953546C0000000000000000000000}
    Master = odsTrebDpcList
    MasterFields = 'FK_TREB_DPCID'
    Session = dmMain.os
    Left = 80
    Top = 440
  end
  object odsTrebDpcList: TOracleDataSet
    SQL.Strings = (
      'select min (t.FK_ID) as FK_TREB_DPCID,'
      '       m.MEDICID,'
      '       m.FC_NAME as FC_MEDIC,'
      '       ei.FC_NAME as FC_EI,'
      '       sum (t.FN_KOL) FN_KOL'
      '  from table ( cast (:pTrebDPCList as med.O_TREB_DPC_TABLE) ) t'
      ' inner join med.TMEDIC m'
      '    on t.FK_MEDICID = m.MEDICID'
      '  left join med.TEI ei'
      '    on m.EIID = ei.EIID'
      ' group by m.MEDICID, m.FC_NAME, ei.FC_NAME'
      ' order by upper(m.FC_NAME)')
    Optimize = False
    Variables.Data = {
      03000000010000000D0000003A50545245424450434C4953546C000000000000
      0000000000}
    Session = dmMain.os
    Left = 40
    Top = 440
  end
  object frxdsAutoFillPlan: TfrxDBDataset
    UserName = 'frxdsAutoFillPlan'
    CloseDataSource = False
    DataSet = odsAutoFillPlanPrint
    BCDToCurrency = False
    Left = 80
    Top = 400
  end
  object frxdsTrebDpcList: TfrxDBDataset
    UserName = 'frxdsTrebDpcList'
    CloseDataSource = False
    DataSet = odsTrebDpcList
    BCDToCurrency = False
    Left = 40
    Top = 400
  end
  object odsRashByAutoFillPlan: TOracleDataSet
    SQL.Strings = (
      '    select k.KARTID,'
      '           k.MEDICID,'
      '           m.FC_NAME FC_MEDIC,'
      '           ei.FC_NAME FC_EI,'
      '           k.FC_SERIAL,'
      '           k.FD_GODEN,'
      '           sum (t.FN_KOL) FN_KOL         '
      
        '      from table ( cast (:pObj as med.o_rash_autofillplan_table ' +
        ') ) t         '
      '     inner join med.TKART k'
      '        on t.FK_KARTID = k.KARTID '
      '     inner join med.TMEDIC m'
      '        on k.MEDICID = m.MEDICID'
      '      left join med.TEI ei'
      '        on m.EIID = ei.EIID'
      '     group by k.KARTID,'
      '           k.MEDICID,'
      '           m.FC_NAME,'
      '           ei.FC_NAME,'
      '           k.FC_SERIAL,'
      '           k.FD_GODEN '
      '     order by upper(m.FC_NAME), k.FD_GODEN')
    Optimize = False
    Variables.Data = {0300000001000000050000003A504F424A6C0000000000000000000000}
    Session = dmMain.os
    Left = 112
    Top = 440
  end
  object frxdsRashByAutoFillPlan: TfrxDBDataset
    UserName = 'frxdsRashByAutoFillPlan'
    CloseDataSource = False
    DataSet = odsRashByAutoFillPlan
    BCDToCurrency = False
    Left = 112
    Top = 400
  end
  object odsAutoFillDeficit: TOracleDataSet
    SQL.Strings = (
      '-- '#1085#1077#1093#1074#1072#1090#1082#1072' '#1086#1089#1090#1072#1090#1082#1086#1074
      '  select tdpc.FK_TREB_DPCID,'
      '         m.MEDICID,'
      '         m.FC_NAME FC_MEDIC,'
      '         ei.FC_NAME FC_EI,'
      '         tdpc.FN_KOL as FN_ZATR_KOL,'
      '         coalesce ( t.FN_KOL, 0 ) as FN_RASH_KOL,'
      '         tdpc.FN_KOL - coalesce ( t.FN_KOL, 0 ) FN_DELTA'
      ''
      
        '    from ( select min (dpc.FK_ID) as FK_TREB_DPCID, -- '#1079#1072#1090#1088#1077#1073#1086#1074#1072 +
        #1085#1086
      
        '                  dpc.FK_MEDICID medicid,                       ' +
        '       '
      '                  sum (dpc.FN_KOL) FN_KOL'
      
        '             from table ( cast (:pTrebDPCList as med.O_TREB_DPC_' +
        'TABLE) ) dpc'
      '            group by dpc.FK_MEDICID ) tdpc               '
      '    left join ( select t.FK_TREB_DPCID,'
      
        '                       sum ( t.FN_KOL ) FN_KOL                  ' +
        '    '
      
        '                  from table ( cast (:pObj as med.o_rash_autofil' +
        'lplan_table )) t '
      '                 inner join med.TKART k'
      '                    on t.FK_KARTID = k.KARTID '
      '                 group by t.FK_TREB_DPCID ) t'
      '      on tdpc.FK_TREB_DPCID = t.FK_TREB_DPCID'
      '    left join med.tmedic m'
      '      on tdpc.medicid = m.medicid'
      '    left join med.TEI ei'
      '      on m.EIID = ei.EIID'
      '   where tdpc.FN_KOL > coalesce ( t.FN_KOL, 0 )'
      '  order by upper(m.FC_NAME)')
    Optimize = False
    Variables.Data = {
      03000000020000000D0000003A50545245424450434C4953546C000000000000
      0000000000050000003A504F424A6C0000000000000000000000}
    Session = dmMain.os
    Left = 152
    Top = 440
  end
  object frxdsAutoFillDeficit: TfrxDBDataset
    UserName = 'frxdsAutoFillDeficit'
    CloseDataSource = False
    DataSet = odsAutoFillDeficit
    BCDToCurrency = False
    Left = 152
    Top = 400
  end
  object frxInvOpis: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41953.806508043980000000
    ReportOptions.LastChange = 41953.806508043980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxInvOpisGetValue
    Left = 8
    Top = 488
    Datasets = <
      item
        DataSet = frxdsInvListPrint
        DataSetName = 'frxdsInvListPrint'
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
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 808.819420000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 302.362400000000000000
          Width = 404.409710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1056#1118#1056#8217#1056#8226#1056#160#1056#8211#1056#8221#1056#1106#1056#174)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 302.362400000000000000
          Top = 26.456710000000000000
          Width = 404.409710000000000000
          Height = 162.519790000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8220#1056#187#1056#176#1056#1030#1056#1029#1057#8249#1056#8470' '#1056#1030#1057#1026#1056#176#1057#8225' [var_receiver]'
            ''
            '__________________[var_glav_vrach]'
            ''
            '"_____"____________________20__'#1056#1110'.')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 206.976500000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1106#1056#1108#1057#8218'-'#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#176#1057#1039' '#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 260.787570000000000000
          Width = 415.748300000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#1108#1056#176#1056#183' '#1074#8222#8211' [frxdsInvListPrint."FC_NMB_PRIKAZ"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 417.307360000000000000
          Top = 260.787570000000000000
          Width = 287.244280000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1109#1057#8218' [frxdsInvListPrint."FD_DAT_PRIKAZ"] '#1056#1110'.')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 309.921460000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '[frxdsInvListPrint."FC_INVTYPE"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 302.362400000000000000
          Top = 309.921460000000000000
          Width = 404.409710000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              #1056#152#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039' '#1056#1029#1056#176#1057#8225#1056#176#1057#8218#1056#176' [frxdsInvListPrint."FD' +
              '_DATA1"] '#1056#1110'.')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 302.362400000000000000
          Top = 336.378170000000000000
          Width = 404.409710000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              #1056#152#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039' '#1056#1109#1056#1108#1056#1109#1056#1029#1057#8225#1056#181#1056#1029#1056#176' [frxdsInvListPrint' +
              '."FD_DATA2"] '#1056#1110'.')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Top = 381.953000000000000000
          Width = 385.512060000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108 +
              #1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Top = 408.189240000000000000
          Width = 328.819110000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#167#1056#187#1056#181#1056#1029#1057#8249' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105 +
              ':')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 345.905690000000000000
          Top = 439.866420000000000000
          Width = 351.496290000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '2. [frxdsInvListPrint."FC_CHLEN2"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 345.905690000000000000
          Top = 469.882190000000000000
          Width = 351.496290000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '3. [frxdsInvListPrint."FC_CHLEN3"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Top = 510.236550000000000000
          Width = 400.630180000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#152#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039' '#1056#1111#1057#1026#1056#1109#1056#1030#1056#1109#1056#1169#1056#1105#1056#187#1056#176#1057#1027#1057#1034' '#1056#1030' '#1056#1111#1057#1026#1056#1105#1057#1027#1057 +
              #1107#1057#8218#1057#1027#1057#8218#1056#1030#1056#1105#1056#1105': ')
          ParentFont = False
        end
        object Memo249: TfrxMemoView
          Left = 345.905690000000000000
          Top = 406.409710000000000000
          Width = 351.496290000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '1. [frxdsInvListPrint."FC_CHLEN1"]')
          ParentFont = False
        end
        object Memo250: TfrxMemoView
          Left = 392.850650000000000000
          Top = 382.512060000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[frxdsInvListPrint."FC_PREDS"]')
          ParentFont = False
        end
      end
    end
  end
  object frxRpNewInventariz: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41575.742831377300000000
    ReportOptions.LastChange = 41943.447077615740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      
        '  LineFirst, LineLast, LineNum, CorrectLine, OpisPageNum, CurUch' +
        'Gr : Integer;'
      ''
      '  v_cur_extemp, v_cur_stats, v_6,v_7,v_8,'
      '  v4s,v5s,v6s,v7s,v8s,'
      '  v_cmn_cur_extemp, v_cmn_4s,'
      '  v_cmn_cur_stats, v_cmn_5s,'
      '  v_extemp_ub, v_stats_ub,'
      '  v_cmn_cur_melko, v_cmn_6s,   '
      '  v_cmn_cur_vata, v_cmn_7s   : extended;'
      '    '
      'procedure HEADEROnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  if <TypInv>='#39'0'#39' then  // '#1087#1083#1072#1085#1086#1074#1072#1103'                             ' +
        ' '
      '  begin'
      '    Memo6.Font.Style:=fsUnderline;                              '
      '    Memo7.Font.Style:=0;            '
      '  end else     // '#1074#1085#1077#1079#1072#1087#1085#1072#1103'                         '
      '  begin'
      '    Memo6.Font.Style:=0;                              '
      '    Memo7.Font.Style:=fsUnderline;            '
      '  end;                  '
      'end;'
      ''
      'procedure Header1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  v_cur_extemp:=0;'
      '  v_cur_stats:=0;'
      '  v4s:=0;'
      '  v5s:=0;'
      '  v6s:=0;'
      '  v7s:=0;'
      '  v8s:=0;'
      'end;'
      ''
      'procedure Memo52OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  v_cur_extemp := getRash( <frxDBSpirty."kartid">, 0, 0, 0, 0 );' +
        '        '
      '  v4s := v4s + v_cur_extemp;        '
      'end;'
      ''
      'procedure Memo54OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  v_6 := ( v_cur_stats - <frxDBSpirty."fn_nedostF"> ) *1.8/100;'
      '  v6s:=v6s+v_6;                        '
      'end;'
      ''
      'procedure Memo55OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  v_7 :=  v_cur_stats * 0.65/100 ;'
      '  v7s:=v7s+v_7;                        '
      'end;'
      ''
      'procedure Memo56OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  v_8 := <frxDBSpirty."fn_nedostF"> - ( v_6 + v_7 ) ;'
      '  if v_8<0 then v_8:=0;                                         '
      '  v8s:=v8s+v_8;                          '
      'end;'
      ''
      'procedure Memo53OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  v_cur_stats  := getRash( <frxDBSpirty."kartid">, 1, 0, 0, 0 );'
      '  v5s := v5s + v_cur_stats;        '
      'end;'
      ''
      'procedure Memo101OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  v_cur_extemp := getRash( <frxDBNARKO."kartid">, 0, 0, 0, 0 ); ' +
        '       '
      '  v4s := v4s + v_cur_extemp;        '
      'end;'
      ''
      'procedure Header3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  v_cur_extemp:=0;'
      '  v_cur_stats:=0;'
      '  v4s:=0;'
      '  v5s:=0;'
      '  v6s:=0;'
      '  v7s:=0;'
      '  v8s:=0;'
      'end;'
      ''
      'procedure Memo102OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  v_cur_stats  := getRash( <frxDBNARKO."kartid">, 1, 0, 0, 0 );'
      '  v5s := v5s + v_cur_stats;        '
      'end;'
      ''
      'procedure Memo103OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  v_6 := ( v_cur_stats - <frxDBNARKO."fn_nedostF"> ) *0.95/100;'
      '  v6s:=v6s+v_6;                        '
      'end;'
      ''
      'procedure Memo104OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  v_7 :=  v_cur_stats * 0.4/100 ;'
      '  v7s:=v7s+v_7;                        '
      'end;'
      ''
      'procedure Memo105OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  v_8 := <frxDBNARKO."fn_nedostF"> - ( v_6 + v_7 ) ;'
      '  if v_8<0 then v_8:=0;                                         '
      '  v8s:=v8s+v_8;                          '
      'end;'
      ''
      'procedure Memo129OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  v_cmn_cur_extemp := getRash( -1, 0, 0, 0, <frxRaschet."fmon"> ' +
        ');        '
      '  v_cmn_4s := v_cmn_4s + v_cmn_cur_extemp;        '
      'end;'
      ''
      'procedure Memo130OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  v_cmn_cur_stats := getRash( -1, 1, 0, 0, <frxRaschet."fmon"> )' +
        ';        '
      '  v_cmn_5s := v_cmn_5s + v_cmn_cur_stats;'
      'end;'
      ''
      'procedure Memo213OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  v_extemp_ub := v_cmn_4s * 1.8/100 ;                           ' +
        '                                  '
      'end;'
      ''
      'procedure Memo214OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  v_stats_ub := v_cmn_5s * 1.8/100 ;                            ' +
        '                                 '
      'end;'
      ''
      'procedure Memo131OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  v_cmn_cur_melko := getRash( -1, -1, 0, 2, <frxRaschet."fmon"> ' +
        ');        '
      '  v_cmn_6s := v_cmn_6s + v_cmn_cur_melko;'
      'end;'
      ''
      'procedure Memo133OnBeforePrint(Sender: TfrxComponent);'
      'begin  '
      
        '  v_cmn_cur_vata := getRash( -1, -1, 0, 3, <frxRaschet."fmon"> )' +
        ';        '
      '  v_cmn_7s := v_cmn_7s + v_cmn_cur_vata;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 8
    Top = 528
    Datasets = <
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'PK2'
        Value = Null
      end
      item
        Name = 'M1'
        Value = Null
      end
      item
        Name = 'M2'
        Value = Null
      end
      item
        Name = 'M3'
        Value = Null
      end
      item
        Name = 'Place'
        Value = Null
      end
      item
        Name = 'Dat'
        Value = Null
      end
      item
        Name = 'MEDOTRADE_SIGN'
        Value = Null
      end
      item
        Name = 'Dat_end'
        Value = Null
      end
      item
        Name = 'DatPeriodStrt'
        Value = Null
      end
      item
        Name = 'DatPeriodEnd'
        Value = Null
      end
      item
        Name = 'fPeoples'
        Value = ''
      end
      item
        Name = 'TypInv'
        Value = ''
      end
      item
        Name = 'var_receiver'
        Value = ''
      end
      item
        Name = 'var_glav_vrach'
        Value = ''
      end
      item
        Name = 'NPrikaz'
        Value = ''
      end
      item
        Name = 'DatPrikaz'
        Value = ''
      end
      item
        Name = 'var_ZAV_APTEKA'
        Value = ''
      end
      item
        Name = 'cmn_sum_fact'
        Value = ''
      end
      item
        Name = 'MOShort'
        Value = ''
      end
      item
        Name = 'MOFULL'
        Value = ''
      end
      item
        Name = 'act_ost_buch'
        Value = ''
      end
      item
        Name = 'act_fact_nal'
        Value = ''
      end
      item
        Name = 'act_res_nedost'
        Value = ''
      end
      item
        Name = 'act_est_ubil'
        Value = ''
      end
      item
        Name = 'res_trat_ned'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object HEADER: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      OnBeforePrint = 'HEADEROnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        Height = 808.819420000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 302.362400000000000000
          Width = 404.409710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1056#1118#1056#8217#1056#8226#1056#160#1056#8211#1056#8221#1056#1106#1056#174)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 302.362400000000000000
          Top = 26.456710000000000000
          Width = 404.409710000000000000
          Height = 162.519790000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8220#1056#187#1056#176#1056#1030#1056#1029#1057#8249#1056#8470' '#1056#1030#1057#1026#1056#176#1057#8225' [var_receiver]'
            ''
            '__________________[var_glav_vrach]'
            ''
            '"_____"____________________20__'#1056#1110'.')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 206.976500000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1106#1056#1108#1057#8218'-'#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#176#1057#1039' '#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 260.787570000000000000
          Width = 253.228510000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#1108#1056#176#1056#183' '#1074#8222#8211' [NPrikaz]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 322.819110000000000000
          Top = 260.787570000000000000
          Width = 381.732530000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1109#1057#8218' [DatPrikaz] '#1056#1110'.')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 309.921460000000000000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#187#1056#176#1056#1029#1056#1109#1056#1030#1056#176#1057#1039)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 336.378170000000000000
          Width = 109.606370000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8217#1056#1029#1056#181#1056#183#1056#176#1056#1111#1056#1029#1056#176#1057#1039)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 260.787570000000000000
          Top = 309.921460000000000000
          Width = 445.984540000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039' '#1056#1029#1056#176#1057#8225#1056#176#1057#8218#1056#176'  [Dat] '#1056#1110'.')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 260.787570000000000000
          Top = 336.378170000000000000
          Width = 445.984540000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039' '#1056#1109#1056#1108#1056#1109#1056#1029#1057#8225#1056#181#1056#1029#1056#176'  [Dat_end] '#1056#1110'.')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Top = 381.953000000000000000
          Width = 385.512060000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108 +
              #1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Top = 408.189240000000000000
          Width = 328.819110000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#167#1056#187#1056#181#1056#1029#1057#8249' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105 +
              ':')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 345.905690000000000000
          Top = 439.866420000000000000
          Width = 351.496290000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '2. [M2]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 345.905690000000000000
          Top = 469.882190000000000000
          Width = 351.496290000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '3. [M3]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Top = 510.236550000000000000
          Width = 400.630180000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#152#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039' '#1056#1111#1057#1026#1056#1109#1056#1030#1056#1109#1056#1169#1056#1105#1056#187#1056#176#1057#1027#1057#1034' '#1056#1030' '#1056#1111#1057#1026#1056#1105#1057#1027#1057 +
              #1107#1057#8218#1057#1027#1057#8218#1056#1030#1056#1105#1056#1105': ')
          ParentFont = False
        end
        object Memo249: TfrxMemoView
          Left = 345.905690000000000000
          Top = 406.409710000000000000
          Width = 351.496290000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '1. [M1]')
          ParentFont = False
        end
        object Memo250: TfrxMemoView
          Left = 392.850650000000000000
          Top = 382.512060000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[PK2]')
          ParentFont = False
        end
        object Memo288: TfrxMemoView
          Left = 7.559060000000000000
          Top = 540.590910000000000000
          Width = 691.653990000000000000
          Height = 253.228510000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '[fPeoples]')
          ParentFont = False
        end
      end
      object PageFooter9: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 888.189550000000000000
        Width = 718.110700000000000000
        object Memo248: TfrxMemoView
          Left = 3.779530000000000000
          Width = 525.354670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
        end
      end
    end
    object PODPISKA: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 351.496290000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo16: TfrxMemoView
          Top = 68.031540000000000000
          Width = 714.331170000000000000
          Height = 45.354360000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              #1056#1031' ('#1056#1112#1057#8249'), '#1056#1029#1056#1105#1056#182#1056#181#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#176#1056#1030#1057#8364#1056#1105#1056#181#1057#1027#1057#1039', '#1056#183#1056#176#1056#1030#1056#181#1056#1169#1057#1107#1057#1035#1057#8240#1056 +
              #1105#1056#8470' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470' ______________________________'
            '[var_ZAV_APTEKA]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 257.008040000000000000
          Top = 114.944960000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '('#1057#8222#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039', '#1056#1105#1056#1112#1057#1039', '#1056#1109#1057#8218#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109')')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 132.283550000000000000
          Width = 714.331170000000000000
          Height = 170.078850000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              #1056#1116#1056#176#1057#8230#1056#1109#1056#1169#1057#1039#1057#8240#1056#1105#1056#181#1057#1027#1057#1039' ('#1056#1029#1056#176#1057#8230#1056#1109#1056#1169#1057#1039#1057#8240#1056#181#1056#1110#1056#1109#1057#1027#1057#1039') '#1056#1030' '#1056#1110#1056#1109#1057#1026#1056#1109#1056#1169#1056 +
              #181'('#1057#1027#1056#181#1056#187#1056#181')   [Place] '
            
              #1056#1169#1056#176#1057#1035'('#1056#1169#1056#176#1056#181#1056#1112') '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1057#1107#1057#1035' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1108#1057#1107', '#1056#1030' '#1057#8218#1056#1109#1056#1112',' +
              ' '#1057#8225#1057#8218#1056#1109' '#1056#1108' '#1056#1112#1056#1109#1056#1112#1056#181#1056#1029#1057#8218#1057#1107' '#1056#1029#1056#176#1057#8225#1056#176#1056#187#1056#176' '#1056#1111#1057#1026#1056#1109#1056#1030#1056#181#1056#1169#1056#181#1056#1029#1056#1105#1057#1039' '#1056#1105#1056#1029 +
              #1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105' '#1056#1030#1057#1027#1056#181' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1056#1029#1057#8249#1056#181' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056 +
              #1029#1057#8218#1057#8249' '#1056#1029#1056#176' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1057#8249', '#1057#8218#1056#176#1057#1026#1057#1107' '#1056#1105' '#1056#1169#1057#1026#1057#1107#1056#1110#1056#1105#1056#181' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218 +
              #1056#1105', '#1056#1111#1056#1109#1057#1027#1057#8218#1057#1107#1056#1111#1056#1105#1056#1030#1057#8364#1056#1105#1056#181' '#1056#1029#1056#176' '#1056#1112#1056#1109#1057#1035' ('#1056#1029#1056#176#1057#8364#1057#1107') '#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218 +
              #1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1109#1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1057#8249', '#1056#1030#1057#8249#1056#177#1057#8249#1056#1030#1057#8364#1056#1105#1056#181' '#1057#1027#1056 +
              #1111#1056#1105#1057#1027#1056#176#1056#1029#1057#8249' '#1056#1030' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169'. '#1056#1116#1056#1105#1056#1108#1056#176#1056#1108#1056#1105#1057#8230' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#1109#1056#1030 +
              ' '#1056#1029#1056#176' '#1057#1026#1057#1107#1056#1108#1056#176#1057#8230' '#1057#1107' '#1056#1112#1056#181#1056#1029#1057#1039' ('#1056#1029#1056#176#1057#1027') '#1056#1029#1056#181' '#1056#1109#1057#1027#1057#8218#1056#176#1056#187#1056#1109#1057#1027#1057#1034'.'
            
              #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1108#1056#1105' '#1056#1029#1056#176' '#1056#1112#1056#1109#1056#1112#1056#181#1056#1029#1057#8218' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105' '#1056#1111 +
              #1056#1109' '#1056#1112#1056#1109#1056#1105#1056#1112' ('#1056#1029#1056#176#1057#8364#1056#1105#1056#1112') '#1056#183#1056#176#1056#1111#1056#1105#1057#1027#1057#1039#1056#1112' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1057#1039#1057#1035#1057#8218' :'
            #1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1057#8249' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' '#1057#1026#1057#1107#1056#177'.  [cmn_sum_fact]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 268.346630000000000000
          Top = 304.921460000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 325.039580000000000000
          Width = 714.331170000000000000
          Height = 26.456710000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109'-'#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#181' '#1056#187#1056#1105#1057#8224#1056#1109'  ')
          ParentFont = False
        end
        object Memo174: TfrxMemoView
          Left = 381.732530000000000000
          Top = 36.692950000000000000
          Width = 336.378170000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1056#1109#1057#1026#1056#1109#1056#1169' ('#1057#1027#1056#181#1056#187#1056#1109')  [Place] ')
          ParentFont = False
        end
        object Memo175: TfrxMemoView
          Top = 36.692950000000000000
          Width = 313.700990000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            ' [Dat]')
          ParentFont = False
        end
      end
      object PageFooter8: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 514.016080000000000000
        Width = 718.110700000000000000
        object Memo247: TfrxMemoView
          Left = 3.779530000000000000
          Width = 525.354670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
        end
        object Memo312: TfrxMemoView
          Left = 548.031850000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
        end
      end
      object Memo15: TfrxMemoView
        Top = 18.677180000000000000
        Width = 718.110700000000000000
        Height = 34.015770000000000000
        ShowHint = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.UTF8 = (
          #1056#1119#1056#1115#1056#8221#1056#1119#1056#152#1056#1038#1056#1113#1056#1106)
        ParentFont = False
      end
      object MasterData9: TfrxMasterData
        Height = 22.677180000000000000
        Top = 430.866420000000000000
        Width = 718.110700000000000000
        RowCount = 0
        object Memo230: TfrxMemoView
          Width = 714.331094330000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[frxMO."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object SPIRT: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 30.236240000000000000
        Top = 468.661720000000000000
        Width = 718.110700000000000000
        RowCount = 0
        Stretched = True
        object Memo47: TfrxMemoView
          Left = 23.000000000000000000
          Width = 134.173228350000000000
          Height = 30.236240000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FC_NAME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBSpirty."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 157.165430000000000000
          Width = 23.433070870000000000
          Height = 30.236240000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBSpirty."fc_edizm"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 180.622140000000000000
          Width = 56.692950000000000000
          Height = 30.236240000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_FACTKOL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBSpirty."FN_FACTKOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 237.315090000000000000
          Width = 56.692950000000000000
          Height = 30.236240000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBSpirty."FN_BUHKOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 294.008040000000000000
          Width = 56.692950000000000000
          Height = 30.236240000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBSpirty."fn_nedostF"]'
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 350.700990000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          OnBeforePrint = 'Memo52OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_cur_extemp]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 426.291590000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          OnBeforePrint = 'Memo53OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_cur_stats]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 501.882190000000000000
          Width = 60.472480000000000000
          Height = 30.236240000000000000
          OnBeforePrint = 'Memo54OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_6]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 562.354670000000000000
          Width = 52.913420000000000000
          Height = 30.236240000000000000
          OnBeforePrint = 'Memo55OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_7]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 615.268090000000000000
          Width = 79.370130000000000000
          Height = 30.236240000000000000
          OnBeforePrint = 'Memo56OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_8]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 694.638220000000000000
          Width = 22.677180000000000000
          Height = 30.236240000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo305: TfrxMemoView
          Width = 23.433070870000000000
          Height = 30.236240000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 121.031540000000000000
        Top = 325.039580000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'Header1OnBeforePrint'
        Stretched = True
        object Memo23: TfrxMemoView
          Left = 23.000000000000000000
          Width = 134.173228346456700000
          Height = 120.944960000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 157.165430000000000000
          Width = 23.433070870000000000
          Height = 120.944960000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'.'#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 180.622140000000000000
          Width = 56.692950000000000000
          Height = 120.944960000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1029#1056#1105#1056#182#1056#1029#1057#8249#1056#8470
            #1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' '#1056#1029#1056#176
            #1056#1169#1056#176#1057#8218#1057#1107
            #1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 237.315090000000000000
          Width = 56.692950000000000000
          Height = 120.944960000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1105#1056#8470
            #1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 294.008040000000000000
          Width = 56.692950000000000000
          Height = 120.944960000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#181#1056#1169#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 350.700990000000000000
          Width = 151.181200000000000000
          Height = 52.913420000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8230#1056#1109#1056#1169' '#1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '
            #1057#1027' [DatPeriodStrt]'
            #1056#1111#1056#1109' [DatPeriodEnd]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 350.700990000000000000
          Top = 53.000000000000000000
          Width = 75.590600000000000000
          Height = 68.031540000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1036#1056#1108#1057#1027#1057#8218#1056#181#1056#1112#1056#1111#1056#1109'- '#1057#1026#1056#176#1056#187#1057#1034#1056#1029#1056#176#1057#1039
            #1057#1026#1056#181#1057#8224#1056#181#1056#1111#1057#8218#1057#1107#1057#1026#1056#176)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 501.882190000000000000
          Width = 113.385900000000000000
          Height = 52.913420000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1057#1027#1057#8218#1056#181#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#176#1057#1039
            #1057#8218#1057#1026#1056#176#1057#8218#1056#176' ('#1056#1108#1056#1110')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 501.882190000000000000
          Top = 53.000000000000000000
          Width = 60.472480000000000000
          Height = 68.031540000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1036#1056#1108#1057#1027#1057#8218#1056#181#1056#1112#1056#1111#1056#1109'- '#1057#1026#1056#176#1056#187#1057#1034#1056#1029#1056#176#1057#1039
            #1057#1026#1056#181#1057#8224#1056#181#1056#1111#1057#8218#1057#1107#1057#1026#1056#176'  1,8%')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 562.354670000000000000
          Top = 53.000000000000000000
          Width = 52.913420000000000000
          Height = 68.031540000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1109#1057#8218#1056#1111#1057#1107#1057#1027#1056#1108
            #1056#176#1056#1029#1056#1110#1057#1026#1056#1109' 0,65%')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 615.268090000000000000
          Width = 79.370130000000000000
          Height = 120.944960000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#181#1056#1169#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176' '#1057#1027
            #1057#1107#1057#8225#1056#181#1057#8218#1056#1109#1056#1112' '
            #1056#181#1057#1027#1057#8218#1056#181#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#8470' '
            #1057#8218#1057#1026#1056#176#1057#8218#1057#8249)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 694.638220000000000000
          Width = 22.677180000000000000
          Height = 120.944960000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1056#183#1056#187#1056#1105#1057#8364#1056#1108#1056#1105)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo306: TfrxMemoView
          Width = 23.433070870000000000
          Height = 120.944960000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111#1056#1111)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo319: TfrxMemoView
          Left = 426.086890000000000000
          Top = 52.913420000000000000
          Width = 75.590600000000000000
          Height = 68.031540000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1057#8218#1056#176#1057#8224#1056#1105#1056#1109'- '
            #1056#1029#1056#176#1057#1026#1056#1029#1056#176#1057#1039)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 275.905690000000000000
        Top = 521.575140000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo36: TfrxMemoView
          Left = 23.000000000000000000
          Width = 134.173228346456700000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1030#1057#8249#1057#1039#1056#1030#1056#187#1056#181#1056#1029#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 156.944960000000000000
          Width = 23.433070870000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 180.401670000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBSpirty."FN_FACTKOL">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 237.094620000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBSpirty."FN_BUHKOL">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 293.787570000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBSpirty."fn_nedostF">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 350.480520000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v4s]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 426.071120000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v5s]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 501.661720000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v6s]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 562.134200000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v7s]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 615.047620000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v8s]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 694.417750000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 2.000000000000000000
          Top = 22.677180000000000000
          Width = 710.551640000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              #1056#152#1056#183#1056#187#1056#1105#1057#8364#1056#1108#1056#1105' : '#1056#1029#1056#1109#1056#187#1057#1034' '#1056#1108#1056#1110', '#1056#1116#1056#181#1056#1169#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176' : [FLOAT_NUMB' +
              'ER_TO_WORDS( SUM(<frxDBSpirty."fn_nedostF">,MasterData1) )] '#1056#1108#1056#1110)
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 268.346630000000000000
          Top = 45.354360000000000000
          Width = 181.417440000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1105#1056#183#1056#187#1056#1105#1057#8364#1056#1108#1056#1105', '#1056#1029#1056#181#1056#1169#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176)
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 3.779530000000000000
          Top = 63.031540000000000000
          Width = 710.551640000000000000
          Height = 173.858380000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107'  [SUM_TO_WORDS( SUM(<frxDBS' +
              'pirty."fn_nedostF">*<frxDBSpirty."fn_price">,MasterData1) )]'
            ''
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108 +
              #1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'  [PK2]'
            ''
            #1056#167#1056#187#1056#181#1056#1029#1057#8249'  [M1], [M2], [M3]'
            ''
            
              #1056#1119#1057#1026#1056#1105#1056#1029#1057#1039#1056#187' '#1056#1029#1056#176' '#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#181' '#1057#8230#1057#1026#1056#176#1056#1029#1056#181#1056#1029#1056#1105#1056#181' '#1057#1027 +
              #1056#1111#1056#1105#1057#1026#1057#8218#1056#176' '#1057#1036#1057#8218#1056#1105#1056#187#1056#1109#1056#1030#1056#1109#1056#1110#1056#1109' '#1056#1030' '#1056#1108#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#181' :  [SUM_TO' +
              '_WORDS( SUM(<frxDBSpirty."fn_buhprice">,MasterData1) )]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 3.779530000000000000
          Top = 249.448980000000000000
          Width = 710.551640000000000000
          Height = 26.456710000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109'-'#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1056#181' '#1056#187#1056#1105#1057#8224#1056#176' :')
          ParentFont = False
        end
        object Memo307: TfrxMemoView
          Width = 23.433070870000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle2: TfrxReportTitle
        Height = 245.669450000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo21: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 710.551640000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1038#1056#8250#1056#152#1056#167#1056#152#1056#1118#1056#8226#1056#8250#1056#172#1056#1116#1056#1106#1056#1031' '#1056#8217#1056#8226#1056#8221#1056#1115#1056#1114#1056#1115#1056#1038#1056#1118#1056#172'-'#1056#1106#1056#1113#1056#1118' '#1056#1116#1056#1106' '#1056#1038#1056#1119#1056#152#1056#160 +
              #1056#1118)
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 7.559060000000000000
          Top = 75.590600000000000000
          Width = 706.772110000000000000
          Height = 170.078850000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1114#1057#8249', '#1056#1029#1056#1105#1056#182#1056#181#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#176#1056#1030#1057#8364#1056#1105#1056#181#1057#1027#1057#1039', '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1057#1039' '#1056#1030' '#1057#1027 +
              #1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#181' '#1056#1111#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1039' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105 +
              #1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105' [PK2]'
            #1057#8225#1056#187#1056#181#1056#1029#1057#8249' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'  [M1]'
            '[M2]'
            '[M3]'
            
              #1056#1030' '#1056#1111#1057#1026#1056#1105#1057#1027#1057#1107#1057#8218#1057#1027#1057#8218#1056#1030#1056#1105#1056#1105' '#1056#1112#1056#176#1057#8218'.-'#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030'. '#1056#187#1056#1105#1057#8224#1056#176' ___' +
              '_________________________ '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1056#187#1056#1105' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#1105#1056#8470' ' +
              #1056#176#1056#1108#1057#8218' '#1056#1109' '#1057#1027#1056#187#1056#1105#1057#8225#1056#181#1056#1029#1056#1105#1056#1105' '#1057#8222#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1056#1029#1056#176#1056#187#1056#1105#1057#8225#1056#1105 +
              #1057#1039' '#1057#1027#1056#1111#1056#1105#1057#1026#1057#8218#1056#176' '#1057#8225#1056#1105#1057#1027#1057#8218#1056#1109#1056#1110#1056#1109' '#1057#1027' '#1056#1108#1056#1029#1056#1105#1056#1110#1056#1109#1056#8470' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176' '#1056#1111#1056#1109' '#1056 +
              #176#1056#1111#1057#8218#1056#181#1056#1108#1056#181' ___________ '#1056#1111#1056#1109' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#1109#1057#1039#1056#1029#1056#1105#1057#1035' '#1056#1029#1056#176' [Dat] '#1056#1110'. '#1057 +
              #1107#1057#1027#1057#8218#1056#176#1056#1029#1056#1109#1056#1030#1056#1105#1056#187#1056#176' '#1057#1027#1056#187#1056#181#1056#1169#1057#1107#1057#1035#1057#8240#1056#181#1056#181' :')
          ParentFont = False
        end
        object Memo165: TfrxMemoView
          Left = 3.779530000000000000
          Top = 41.574830000000000000
          Width = 336.378170000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1056#1109#1057#1026#1056#1109#1056#1169' ('#1057#1027#1056#181#1056#187#1056#1109')  [Place] ')
          ParentFont = False
        end
        object Memo166: TfrxMemoView
          Left = 396.850650000000000000
          Top = 41.574830000000000000
          Width = 313.700990000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            ' [Dat] '#1056#1110)
          ParentFont = False
        end
      end
      object PageFooter7: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 903.307670000000000000
        Width = 718.110700000000000000
        object Memo246: TfrxMemoView
          Width = 525.354670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
        end
        object Memo313: TfrxMemoView
          Left = 551.811380000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
        end
      end
      object MasterData10: TfrxMasterData
        Height = 22.677180000000000000
        Top = 820.158010000000000000
        Width = 718.110700000000000000
        RowCount = 0
        object Memo293: TfrxMemoView
          Width = 714.331094330000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[frxMO."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object DEFETSIT: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle3: TfrxReportTitle
        Height = 249.448980000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo63: TfrxMemoView
          Left = 3.779530000000000000
          Width = 710.551640000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1038#1056#8250#1056#152#1056#167#1056#152#1056#1118#1056#8226#1056#8250#1056#172#1056#1116#1056#1106#1056#1031' '#1056#8217#1056#8226#1056#8221#1056#1115#1056#1114#1056#1115#1056#1038#1056#1118#1056#172'-'#1056#1106#1056#1113#1056#1118' '#1056#1116#1056#1106' '#1056#8221#1056#8226#1056#164#1056#8226 +
              #1056#166#1056#152#1056#1118#1056#1116#1056#171#1056#8226' '#1056#1119#1056#160#1056#8226#1056#1119#1056#1106#1056#160#1056#1106#1056#1118#1056#171)
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 7.559060000000000000
          Top = 60.472480000000000000
          Width = 706.772110000000000000
          Height = 188.976500000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1114#1057#8249', '#1056#1029#1056#1105#1056#182#1056#181#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#176#1056#1030#1057#8364#1056#1105#1056#181#1057#1027#1057#1039', '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1057#1039' '#1056#1030' '#1057#1027 +
              #1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#181' '#1056#1111#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1039' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105 +
              #1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105' [PK2]'
            #1057#8225#1056#187#1056#181#1056#1029#1057#8249' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'  [M1]'
            '[M2]'
            '[M3]'
            
              #1056#1030' '#1056#1111#1057#1026#1056#1105#1057#1027#1057#1107#1057#8218#1057#1027#1057#8218#1056#1030#1056#1105#1056#1105' '#1056#1112#1056#176#1057#8218'.-'#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030'. '#1056#187#1056#1105#1057#8224#1056#176' ___' +
              '_______________________________________ '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1056#187#1056#1105' '#1056#1029#1056#176#1057 +
              #1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#1105#1056#8470' '#1056#176#1056#1108#1057#8218' '#1056#1109' '#1057#1027#1056#187#1056#1105#1057#8225#1056#181#1056#1029#1056#1105#1056#1105' '#1057#8222#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056 +
              #1109' '#1056#1029#1056#176#1056#187#1056#1105#1057#8225#1056#1105#1057#1039' '#1056#1169#1056#181#1057#8222#1056#181#1057#8224#1056#1105#1057#8218#1056#1029#1057#8249#1057#8230' '#1056#1111#1057#1026#1056#181#1056#1111#1056#176#1057#1026#1056#176#1057#8218#1057#8218#1056#1109#1056#1030' '#1057#1027' ' +
              #1056#1108#1056#1029#1056#1105#1056#1110#1056#1109#1056#8470' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176' '#1056#1111#1056#1109' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#181' ______________________' +
              '____ '#1056#1111#1056#1109' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#1109#1057#1039#1056#1029#1056#1105#1057#1035' '#1056#1029#1056#176' [Dat] '#1056#1110'.  '#1057#1107#1057#1027#1057#8218#1056#176#1056#1029#1056#1109#1056#1030#1056#1105#1056#187#1056 +
              #176' '#1057#1027#1056#187#1056#181#1056#1169#1057#1107#1057#1035#1057#8240#1056#181#1056#181' :')
          ParentFont = False
        end
        object Memo167: TfrxMemoView
          Left = 7.559060000000000000
          Top = 34.015770000000000000
          Width = 336.378170000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1056#1109#1057#1026#1056#1109#1056#1169' ('#1057#1027#1056#181#1056#187#1056#1109')  [Place] ')
          ParentFont = False
        end
        object Memo168: TfrxMemoView
          Left = 438.425480000000000000
          Top = 34.015770000000000000
          Width = 275.905690000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            ' [Dat] '#1056#1110)
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        Height = 30.236240000000000000
        Top = 328.819110000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo65: TfrxMemoView
          Left = 18.897650000000000000
          Width = 244.535420870000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 262.787570000000000000
          Width = 113.385826770000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1029#1056#1105#1056#182#1056#1029#1057#8249#1056#8470' '#1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 376.173470000000000000
          Width = 113.385826770000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1105#1056#8470' '#1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 490.338900000000000000
          Width = 113.385826770000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1056#183#1056#187#1056#1105#1057#8364#1056#1108#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 603.724800000000000000
          Width = 113.385826770000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#181#1056#1169#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo308: TfrxMemoView
          Width = 18.897637800000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111#1056#1111)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
        RowCount = 0
        Stretched = True
        object Memo70: TfrxMemoView
          Left = 18.897650000000000000
          Width = 244.535420870000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDEFETSIT."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 262.787570000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDEFETSIT."FN_FACTKOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 376.173470000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDEFETSIT."FN_BUHKOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 490.338900000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDEFETSIT."fn_izlishkiF"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 603.724800000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDEFETSIT."fn_nedostF"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer2: TfrxFooter
        Height = 170.078850000000000000
        Top = 423.307360000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo75: TfrxMemoView
          Left = 18.897650000000000000
          Width = 244.535420870000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1030#1057#8249#1057#1039#1056#1030#1056#187#1056#181#1056#1029#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 262.787570000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBDEFETSIT."FN_FACTKOL">,MasterData2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 376.173470000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBDEFETSIT."FN_BUHKOL">,MasterData2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 490.338900000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBDEFETSIT."fn_izlishkiF">,MasterData2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 603.724800000000000000
          Width = 113.385826770000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBDEFETSIT."fn_nedostF">,MasterData2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 3.779530000000000000
          Top = 22.677180000000000000
          Width = 710.551640000000000000
          Height = 147.401670000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108 +
              #1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'  [PK2]'
            ''
            #1056#167#1056#187#1056#181#1056#1029#1057#8249'  [M1] ______________________________________'
            '[M2] ______________________________________'
            '[M3] ______________________________________'
            ''
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109'-'#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1056#181' '#1056#187#1056#1105#1057#8224#1056#176' : ')
          ParentFont = False
        end
        object Memo309: TfrxMemoView
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter6: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 699.213050000000000000
        Width = 718.110700000000000000
        object Memo245: TfrxMemoView
          Left = 3.779530000000000000
          Width = 525.354670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
        end
        object Memo314: TfrxMemoView
          Left = 548.031850000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
        end
      end
      object MasterData11: TfrxMasterData
        Height = 22.677180000000000000
        Top = 616.063390000000000000
        Width = 718.110700000000000000
        RowCount = 0
        Stretched = True
        object Memo294: TfrxMemoView
          Width = 714.331094330000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[frxMO."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object NARKO: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle4: TfrxReportTitle
        Height = 120.944960000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo81: TfrxMemoView
          Width = 710.551640000000000000
          Height = 26.456710000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#8250#1056#152#1056#167#1056#152#1056#1118#1056#8226#1056#8250#1056#172#1056#1116#1056#1106#1056#1031' '#1056#8217#1056#8226#1056#8221#1056#1115#1056#1114#1056#1115#1056#1038#1056#1118#1056#172'-'#1056#1106#1056#1113#1056#1118)
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Top = 30.236240000000000000
          Width = 706.772110000000000000
          Height = 90.708720000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1029#1056#176' '#1057#8222#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#181' '#1056#1029#1056#176#1056#187#1056#1105#1057#8225#1056#1105#1056#181' '#1056#1029#1056#176#1057#1026#1056#1108#1056#1109#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056 +
              #1108#1056#1105#1057#8230' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030', '#1056#1111#1057#1027#1056#1105#1057#8230#1056#1109#1057#8218#1057#1026#1056#1109#1056#1111#1056#1029#1057#8249#1057#8230' '#1056#1111#1057#1026#1056#181#1056#1111#1056#176#1057#1026#1056#176#1057#8218#1056 +
              #1109#1056#1030' '#1056#1105' '#1057#1039#1056#1169#1056#1109#1056#1030#1056#1105#1057#8218#1057#8249#1057#8230' '#1056#1030#1056#181#1057#8240#1056#181#1057#1027#1057#8218#1056#1030', '#1056#1111#1056#1109#1056#1169#1056#187#1056#181#1056#182#1056#176#1057#8240#1056#1105#1057#8230' '#1056#1111#1057 +
              #1026#1056#181#1056#1169#1056#1112#1056#181#1057#8218#1056#1029#1056#1109'-'#1056#1108#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#1112#1057#1107' '#1057#1107#1057#8225#1056#181#1057#8218#1057#1107' '#1056#1030' '#1056#176#1056 +
              #1111#1057#8218#1056#181#1056#1108#1056#181' _________________ '#1056#1029#1056#176' [Dat] '#1056#1110'.  '
            
              #1056#8217' '#1057#1026#1056#181#1056#183#1057#1107#1056#187#1057#1034#1057#8218#1056#176#1057#8218#1056#181' '#1056#1111#1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1108#1056#1105' '#1057#1107#1057#1027#1057#8218#1056#176#1056#1029#1056#1109#1056#1030#1056#187#1056#181#1056#1029#1056#1109' ' +
              ':')
          ParentFont = False
        end
      end
      object Header3: TfrxHeader
        Height = 98.354360000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'Header3OnBeforePrint'
        object Memo83: TfrxMemoView
          Left = 18.897650000000000000
          Width = 98.267704330000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 117.165430000000000000
          Width = 23.433070870000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'.'#1056#1105#1056#183#1056#1112'.')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 140.622140000000000000
          Width = 56.692950000000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1029#1056#1105#1056#182#1056#1029#1057#8249#1056#8470
            #1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 197.315090000000000000
          Width = 56.692950000000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1108#1057#8218#1056#1105'-'
            #1057#8225#1056#181#1057#1027#1056#1108#1056#1105#1056#8470
            #1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 316.008040000000000000
          Width = 56.692950000000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#181#1056#1169#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 372.700990000000000000
          Width = 151.181200000000000000
          Height = 52.913420000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8230#1056#1109#1056#1169' '#1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '
            #1057#1027' [DatPeriodStrt]'
            #1056#1111#1056#1109' [DatPeriodEnd]'
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          Left = 372.700990000000000000
          Top = 53.000000000000000000
          Width = 75.590600000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1036#1056#1108#1057#1027#1057#8218#1056#181#1056#1112#1056#1111#1056#1109#1057#1026#1056#176#1056#187#1057#1034#1056#1029#1056#176#1057#1039
            #1057#1026#1056#181#1057#8224#1056#181#1056#1111#1057#8218#1057#1107#1057#1026#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 448.291590000000000000
          Top = 53.000000000000000000
          Width = 75.590600000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1106#1056#1029#1056#1110#1057#1026#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo91: TfrxMemoView
          Left = 523.882190000000000000
          Width = 113.385900000000000000
          Height = 52.913420000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1057#1027#1057#8218#1056#181#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#176#1057#1039
            #1057#8218#1057#1026#1056#176#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo92: TfrxMemoView
          Left = 523.882190000000000000
          Top = 53.000000000000000000
          Width = 60.472480000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1057#1036#1056#1108#1057#1027#1057#8218#1056#181#1056#1112#1056#1111'.'
            #1057#1026#1056#181#1057#8224'. 0.95%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 584.354670000000000000
          Top = 53.000000000000000000
          Width = 52.913420000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#176#1056#1029#1056#1110#1057#1026#1056#1109' 0,4%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 637.268090000000000000
          Width = 79.370130000000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#181#1056#1169#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176' '#1057#1027
            #1057#1107#1057#8225#1056#181#1057#8218#1056#1109#1056#1112' '
            #1056#181#1057#1027#1057#8218#1056#181#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#8470' '
            #1057#8218#1057#1026#1056#176#1057#8218#1057#8249)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 253.756030000000000000
          Width = 62.740157480000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1056#183#1056#187#1056#1105#1057#8364#1056#1108#1056#1105)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo310: TfrxMemoView
          Width = 18.897637800000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111#1056#1111)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
      end
      object MasterData3: TfrxMasterData
        Height = 18.897637800000000000
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        RowCount = 0
        Stretched = True
        object Memo96: TfrxMemoView
          Left = 18.897650000000000000
          Width = 98.267704330000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBNARKO."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 117.165430000000000000
          Width = 23.433070870000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBNARKO."fc_edizm"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 140.622140000000000000
          Width = 56.692950000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBNARKO."FN_FACTKOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 197.315090000000000000
          Width = 56.692950000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBNARKO."FN_BUHKOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo100: TfrxMemoView
          Left = 316.008040000000000000
          Width = 56.692950000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBNARKO."fn_nedostF"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo101: TfrxMemoView
          Left = 372.700990000000000000
          Width = 75.590600000000000000
          Height = 18.897637800000000000
          OnBeforePrint = 'Memo101OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_cur_extemp]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo102: TfrxMemoView
          Left = 448.291590000000000000
          Width = 75.590600000000000000
          Height = 18.897637800000000000
          OnBeforePrint = 'Memo102OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_cur_stats]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo103: TfrxMemoView
          Left = 523.882190000000000000
          Width = 60.472480000000000000
          Height = 18.897637800000000000
          OnBeforePrint = 'Memo103OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_6]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo104: TfrxMemoView
          Left = 584.354670000000000000
          Width = 52.913420000000000000
          Height = 18.897637800000000000
          OnBeforePrint = 'Memo104OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_7]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo105: TfrxMemoView
          Left = 637.268090000000000000
          Width = 79.370130000000000000
          Height = 18.897637800000000000
          OnBeforePrint = 'Memo105OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_8]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          Left = 253.756030000000000000
          Width = 62.740157480000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBNARKO."fn_izlishkiF"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo311: TfrxMemoView
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer3: TfrxFooter
        Height = 491.338900000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        Child = frxRpNewInventariz.Child1
        Stretched = True
        object Memo107: TfrxMemoView
          Width = 710.551640000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'  _______________________________' +
              '____________'
            ''
            ''
            '')
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Top = 30.236240000000000000
          Width = 154.960730000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#176#1056#1108#1057#8218#1057#1107' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1109 +
              #1056#1111#1056#1105#1057#1027#1056#1105)
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 166.299320000000000000
          Top = 30.236240000000000000
          Width = 544.252320000000000000
          Height = 302.362400000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#187#1056#1105#1057#1027#1057#8218#1056#1109#1056#1030' _______________________'
            ''
            #1056#1119#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1056#1109#1056#1030#1057#8249#1057#8230' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026#1056#1109#1056#1030' ______________________'
            ''
            #1056#1038' '#1074#8222#8211' ______________________ '#1056#1111#1056#1109' '#1074#8222#8211' _________'
            #1056#1038' '#1074#8222#8211' ______________________ '#1056#1111#1056#1109' '#1074#8222#8211' _________'
            #1056#1038' '#1074#8222#8211' ______________________ '#1056#1111#1056#1109' '#1074#8222#8211' _________'
            #1056#1038' '#1074#8222#8211' ______________________ '#1056#1111#1056#1109' '#1074#8222#8211' _________'
            #1056#1038' '#1074#8222#8211' ______________________ '#1056#1111#1056#1109' '#1074#8222#8211' _________'
            #1056#1038' '#1074#8222#8211' ______________________ '#1056#1111#1056#1109' '#1074#8222#8211' _________'
            
              #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#1029#1056#176#1057#8218#1057#1107#1057#1026#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1057#8230' '#1056#1111#1056#1109#1056#1108#1056#176#1056#183#1056#176#1057#8218#1056#181#1056#187#1056#181 +
              #1056#8470' ('#1057#1107#1057#8225#1056#181#1057#8218#1056#1029#1057#8249#1057#8230' '#1056#181#1056#1169#1056#1105#1056#1029#1056#1105#1057#8224')  _______'
            ''
            '________________________________________________________'
            ''
            '________________________________________________________')
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 336.378170000000000000
          Width = 710.551640000000000000
          Height = 117.165430000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108 +
              #1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105' [PK2]'
            ''
            #1056#167#1056#187#1056#181#1056#1029#1057#8249'  [M1]'
            '[M2]'
            '[M3]'
            ''
            ''
            '')
          ParentFont = False
        end
      end
      object Child1: TfrxChild
        Height = 368.614410000000000000
        Top = 876.850960000000000000
        Width = 718.110700000000000000
        StartNewPage = True
        Stretched = True
        object Memo111: TfrxMemoView
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1115#1056#8221#1056#1119#1056#152#1056#1038#1056#1113#1056#1106)
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 1.779530000000000000
          Top = 52.913420000000000000
          Width = 714.331170000000000000
          Height = 313.700990000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1031' ('#1056#1112#1057#8249'), '#1056#1029#1056#1105#1056#182#1056#181#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#176#1056#1030#1057#8364#1056#1105#1056#181#1057#1027#1057#1039', '#1056#1169#1056#176#1056#181#1056#1112' '#1056#1029#1056#176#1057#1027#1057#8218 +
              #1056#1109#1057#1039#1057#8240#1057#1107#1057#1035' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1108#1057#1107' '#1056#1030' '#1057#8218#1056#1109#1056#1112', '#1057#8225#1057#8218#1056#1109' '#1056#1030#1057#1027#1056#181' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057 +
              #1027#1057#8218#1056#1105', '#1056#1111#1056#1109#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1029#1057#8249#1056#181' '#1056#1030' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056 +
              #1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1056#1105' '#1056#1108#1056#176#1056#1108' '#1056#1111#1056#1109' '#1056#1108#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1057#1107', '#1057 +
              #8218#1056#176#1056#1108' '#1056#1105' '#1056#1111#1056#1109' '#1056#1030#1056#181#1057#1027#1057#1107' '#1056#1105' '#1057#8224#1056#181#1056#1029#1056#181', '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#181#1056#8470' '#1057#1027#1056#1029#1057#1039#1057#8218#1057 +
              #8249' '#1056#1030' '#1056#1029#1056#176#1057#8364#1056#181#1056#1112' '#1056#187#1056#1105#1057#8225#1056#1029#1056#1109#1056#1112' '#1056#1111#1057#1026#1056#1105#1057#1027#1057#1107#1057#8218#1057#1027#1057#8218#1056#1030#1056#1105#1056#1105' '#1057#1027' '#1056#1029#1056#176#1057#8218#1057#1107#1057 +
              #1026#1057#8249' '#1056#1111#1057#1026#1056#176#1056#1030#1056#1105#1056#187#1057#1034#1056#1029#1056#1109'. '#1056#1119#1057#1026#1056#1109#1056#1111#1057#1107#1057#1027#1056#1108#1056#1109#1056#1030' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#181#1056#8470' '#1056#1029 +
              #1056#181#1057#8218'. '#1056#1119#1057#1026#1056#181#1057#8218#1056#181#1056#1029#1056#183#1056#1105#1056#8470' '#1056#1108' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470 +
              ' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105' '#1056#1029#1056#181' '#1056#1105#1056#1112#1056#181#1056#181#1056#1112'.'
            
              #1056#8217#1057#1027#1056#181' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#1109#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1056#181' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105', '#1056#1111 +
              #1056#1109#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1029#1057#8249#1056#181' '#1056#1030' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470 +
              ' '#1056#1109#1056#1111#1056#1105#1057#1027#1056#1105', '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1029#1056#176' _________ '#1056#187#1056#1105#1057#1027#1057#8218#1056#176#1057 +
              #8230', '#1056#1030' '#1056#1108#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#181' _______________________________ '#1056#1029#1056#176#1057 +
              #8218#1057#1107#1057#1026#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1057#8230' '#1056#1111#1056#1109#1056#1108#1056#176#1056#183#1056#176#1057#8218#1056#181#1056#187#1056#181#1056#8470' '#1057#1027' '#1074#8222#8211' ____________ '#1056#1111#1056 +
              #1109' '#1074#8222#8211' _________________ '#1056#1029#1056#176#1057#8230#1056#1109#1056#1169#1057#1039#1057#8218#1057#1027#1057#1039' '#1056#1030' '#1056#1029#1056#176#1057#8364#1056#181#1056#1112' '#1056#187#1056#1105#1057#8225#1056 +
              #1029#1056#1109#1056#1112' '#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#1112' '#1057#8230#1057#1026#1056#176#1056#1029#1056#181#1056#1029#1056#1105#1056#1105', '#1056#1029#1056#176' '#1056#1109#1056#177#1057#8240#1057#1107 +
              #1057#1035' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' [cmn_sum_fact] .'
            ''
            ''
            ''
            
              #1056#8212#1056#176#1056#1030'. '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470'  ________________________________________' +
              '_______'
            ''
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109'-'#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1056#181' '#1056#187#1056#1105#1057#8224#1056#176' :')
          ParentFont = False
        end
        object Memo176: TfrxMemoView
          Top = 26.456710000000000000
          Width = 245.669450000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '[Dat]')
          ParentFont = False
        end
        object Memo177: TfrxMemoView
          Left = 306.141930000000000000
          Top = 26.456710000000000000
          Width = 408.189240000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1111#1056#1109' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#181'_________________________')
          ParentFont = False
        end
      end
      object PageFooter5: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 1353.071740000000000000
        Width = 718.110700000000000000
        object Memo178: TfrxMemoView
          Left = 3.779530000000000000
          Width = 525.354670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
        end
        object Memo315: TfrxMemoView
          Left = 548.031850000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
        end
      end
      object MasterData12: TfrxMasterData
        Height = 22.677180000000000000
        Top = 1269.922080000000000000
        Width = 718.110700000000000000
        RowCount = 0
        object Memo295: TfrxMemoView
          Width = 714.331094330000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[frxMO."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object CMN_OPIS: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData7: TfrxMasterData
        Height = 22.677167800000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo181: TfrxMemoView
          Width = 38.456710000000000000
          Height = 22.677165350000000000
          OnBeforePrint = 'Memo77OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo182: TfrxMemoView
          Left = 38.456710000000000000
          Width = 26.456710000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo183: TfrxMemoView
          Left = 64.913420000000000000
          Width = 168.094620000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.UTF8 = (
            '[frxDBCMNUchGr."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo184: TfrxMemoView
          Left = 233.023810000000000000
          Width = 22.677180000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBCMNUchGr."FC_EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo186: TfrxMemoView
          Left = 403.086890000000000000
          Width = 74.031540000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBCMNUchGr."FN_PRICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo187: TfrxMemoView
          Left = 477.118430000000000000
          Width = 86.031540000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBCMNUchGr."FN_BUHPRICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo188: TfrxMemoView
          Left = 563.149970000000000000
          Width = 71.811070000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBCMNUchGr."FC_SERIAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo189: TfrxMemoView
          Left = 634.961040000000000000
          Width = 83.149660000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo291: TfrxMemoView
          Left = 256.008040000000000000
          Width = 72.566929130000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBCMNUchGr."FN_FACTKOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo292: TfrxMemoView
          Left = 328.819110000000000000
          Width = 74.456692910000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBCMNUchGr."FN_BUHKOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter2: TfrxPageFooter
        Height = 205.653680000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'PageFooter2OnBeforePrint'
        object Memo190: TfrxMemoView
          Align = baLeft
          Top = 95.590600000000000000
          Width = 154.960730000000000000
          Height = 19.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'                       ' +
              '                   '#1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105' '#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109'-'#1056#1109#1057#8218#1056#1030#1056 +
              #181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1057#8230' '#1056#187#1056#1105#1057#8224)
          ParentFont = False
        end
        object Memo191: TfrxMemoView
          Align = baLeft
          Top = 121.944960000000000000
          Width = 303.000000000000000000
          Height = 23.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105' '#1057#8225#1056#187#1056#181#1056#1029#1056#1109#1056#1030' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470 +
              ' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo192: TfrxMemoView
          Align = baLeft
          Top = 18.897650000000000000
          Width = 128.504020000000000000
          Height = 56.692950000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1027#1057#8218#1057#1026'-'#1057#8224#1056#181' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo193: TfrxMemoView
          Left = 143.622140000000000000
          Top = 44.897650000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#1029#1056#176#1057#8218#1057#1107#1057#1026#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1057#8230' '#1056#1111#1056#1109#1056#1108#1056#176#1056#183#1056#176#1057#8218#1056#181#1056#187#1056#181 +
              #1056#8470':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo194: TfrxMemoView
          Left = 52.913420000000000000
          Width = 81.110390000000000000
          Height = 18.897650000000000000
          Visible = False
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1105#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1027#1057#8218#1057#1026'-'#1057#8224#1056#181)
          ParentFont = False
        end
        object Memo195: TfrxMemoView
          Left = 404.842920000000000000
          Width = 158.307050000000000000
          Height = 18.897637800000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = 'value = 0'
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo196: TfrxMemoView
          Left = 195.013296660000000000
          Width = 208.963203340000000000
          Height = 18.897637800000000000
          OnBeforePrint = 'Memo28OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = 'value = 0'
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Rich1: TfrxRichView
          Left = 143.622140000000000000
          Top = 22.677180000000000000
          Width = 574.488560000000000000
          Height = 22.677180000000000000
          ShowHint = False
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235315C64656666305C6465
            666C616E67313034397B5C666F6E7474626C7B5C66305C666E696C5C66636861
            727365743230347B5C2A5C666E616D6520417269616C3B7D417269616C204359
            523B7D7B5C66315C666E696C5C66636861727365743020417269616C3B7D7B5C
            66325C666E696C204D532053616E732053657269663B7D7D0D0A7B5C2A5C6765
            6E657261746F72204D7366746564697420352E34312E32312E323530393B7D5C
            766965776B696E64345C7563315C706172645C66305C667332305C2763665C27
            65655C2766305C2766665C2765345C2765615C2765655C2765325C2766625C27
            6635205C2765645C2765655C2765635C2765355C2766305C2765655C2765323A
            205C6C616E67313033335C756C5C663120205B4C696E654E756D5D205C6C616E
            67313034395C756C6E6F6E655C6630202C20205C276631205C6C616E67313033
            335C66315C75383437303F205C756C20205B3C4C696E6546697273743E5D205C
            756C6E6F6E6520205C6C616E67313034395C66305C2765665C276565205C6C61
            6E67313033335C66315C75383437303F205C756C20205B3C4C696E654C617374
            3E5D205C756C6E6F6E655C66325C667331365C7061720D0A7D0D0A00}
        end
        object Memo197: TfrxMemoView
          Left = 389.291590000000000000
          Top = 45.354360000000000000
          Width = 328.819110000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo198: TfrxMemoView
          Left = 143.622140000000000000
          Top = 64.252010000000000000
          Width = 574.488560000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo199: TfrxMemoView
          Left = 97.063080000000000000
          Top = 152.000000000000000000
          Width = 621.047620000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo218: TfrxMemoView
          Align = baLeft
          Top = 152.000000000000000000
          Width = 97.063080000000000000
          Height = 22.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218'-'#1056#1109#1057#8218#1056#1030'. '#1056#187#1056#1105#1057#8224#1056#176':')
          ParentFont = False
        end
        object Memo219: TfrxMemoView
          Left = 303.000000000000000000
          Top = 122.000000000000000000
          Width = 415.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo220: TfrxMemoView
          Left = 155.000000000000000000
          Top = 92.000000000000000000
          Width = 563.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[PK2]')
          ParentFont = False
        end
        object Memo221: TfrxMemoView
          Left = 3.779530000000000000
          Top = 186.756030000000000000
          Width = 514.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
        end
        object Memo223: TfrxMemoView
          Left = 150.000000000000000000
          Top = 1.600803330000000000
          Width = 27.821583330000000000
          Height = 18.897650000000000000
          Visible = False
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[COUNT(MasterData7)]')
          ParentFont = False
        end
        object Memo316: TfrxMemoView
          Left = 548.031850000000000000
          Top = 185.196970000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 126.000000000000000000
        Top = 105.826840000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = 'frxDBCMNUchGr."FC_UCHGR"'
        ReprintOnNewPage = True
        StartNewPage = True
        object Memo224: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1056#1111#1056#1105#1057#1027#1056#1029#1056#1109#1056#8470' '#1056#187#1056#1105#1057#1027#1057#8218' '#1074#8222#8211)
          ParentFont = False
        end
        object Memo225: TfrxMemoView
          Align = baWidth
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1057#8225#1056#181#1057#8218#1056#1029#1056#176#1057#1039' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111#1056#176': [frxDBCMNUchGr."FC_UCHGR"]')
          ParentFont = False
        end
        object Memo226: TfrxMemoView
          Top = 50.000000000000000000
          Width = 38.456710000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111#1056#1111)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo227: TfrxMemoView
          Left = 38.456710000000000000
          Top = 50.000000000000000000
          Width = 26.456710000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1056#1029#1056#1108#1056#187' '#1074#8222#8211)
          ParentFont = False
          Rotation = 90
        end
        object Memo228: TfrxMemoView
          Left = 64.913420000000000000
          Top = 50.000000000000000000
          Width = 168.094620000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#1109#1056#1030' '#1056#1105' '#1056#1169#1057#1026#1057#1107#1056#1110#1056#1105#1057#8230' '#1057#8224#1056#181#1056#1029#1056#1029 +
              #1056#1109#1057#1027#1057#8218#1056#181#1056#8470' '#1056#1111#1056#1109' '#1056#1111#1056#176#1057#1026#1057#8218#1056#1105#1057#1039#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo229: TfrxMemoView
          Left = 233.023810000000000000
          Top = 50.000000000000000000
          Width = 22.677180000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo231: TfrxMemoView
          Left = 403.086890000000000000
          Top = 87.795300000000000000
          Width = 74.031540000000000000
          Height = 37.795275590000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo232: TfrxMemoView
          Left = 403.086890000000000000
          Top = 50.000000000000000000
          Width = 160.063080000000000000
          Height = 37.795275590000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1057#1026#1056#1109#1056#183#1056#1029#1056#1105#1057#8225#1056#1029#1057#8249#1056#1112' '#1057#8224#1056#181#1056#1029#1056#176#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo233: TfrxMemoView
          Left = 477.118430000000000000
          Top = 87.795300000000000000
          Width = 86.031540000000000000
          Height = 37.795275590000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo234: TfrxMemoView
          Left = 563.149970000000000000
          Top = 50.000000000000000000
          Width = 71.811070000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211#1074#8222#8211' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111', '#1057#1027#1056#181#1057#1026#1056#1105#1057#1039)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo235: TfrxMemoView
          Left = 634.961040000000000000
          Top = 50.000000000000000000
          Width = 83.149660000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#1112#1056#181#1057#8225#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo289: TfrxMemoView
          Left = 256.008040000000000000
          Top = 50.133890000000000000
          Width = 71.810996770000000000
          Height = 75.590600000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1029#1056#1105#1056#182#1056#1029#1057#8249#1056#8470' '#1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo290: TfrxMemoView
          Left = 327.819110000000000000
          Top = 49.913420000000000000
          Width = 75.590551181102360000
          Height = 75.590600000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1105#1056#8470' '#1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.680000000000000000
        Top = 298.582870000000000000
        Width = 718.110700000000000000
        object Memo236: TfrxMemoView
          Width = 38.456710000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo237: TfrxMemoView
          Left = 38.456710000000000000
          Width = 26.456710000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          Rotation = 90
        end
        object Memo238: TfrxMemoView
          Left = 64.913420000000000000
          Width = 168.094620000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1030#1057#8249#1057#1039#1056#1030#1056#187#1056#181#1056#1029#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo239: TfrxMemoView
          Left = 233.023810000000000000
          Width = 22.677180000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo240: TfrxMemoView
          Left = 327.496290000000000000
          Width = 75.590600000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBCMNUchGr."FN_BUHKOL">,MasterData7)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo241: TfrxMemoView
          Left = 403.086890000000000000
          Width = 74.031540000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo242: TfrxMemoView
          Left = 477.118430000000000000
          Width = 86.031540000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBCMNUchGr."FN_BUHPRICE">,MasterData7)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo243: TfrxMemoView
          Left = 563.149970000000000000
          Width = 71.811070000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo244: TfrxMemoView
          Left = 634.961040000000000000
          Width = 83.149660000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo185: TfrxMemoView
          Left = 256.008040000000000000
          Width = 71.811070000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBCMNUchGr."FN_FACTKOL">,MasterData7)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader3: TfrxPageHeader
        Height = 3.779530000000000000
        Top = 41.574830000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'PageHeader3OnBeforePrint'
      end
      object ReportTitle5: TfrxReportTitle
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
      end
    end
    object SLIGRP: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object Footer6: TfrxFooter
        Height = 124.944960000000000000
        Top = 434.645950000000000000
        Width = 718.110700000000000000
        KeepChild = True
        object Memo251: TfrxMemoView
          Align = baWidth
          Width = 393.071120000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108 +
              #1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'  _________________________________')
          ParentFont = False
        end
        object Memo252: TfrxMemoView
          Top = 22.677180000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249':')
          ParentFont = False
        end
        object Memo253: TfrxMemoView
          Top = 102.047310000000000000
          Width = 317.480520000000000000
          Height = 22.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109'-'#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1056#181' '#1056#187#1056#1105#1057#8224#1056#176' :')
          ParentFont = False
        end
        object Memo254: TfrxMemoView
          Left = 393.071120000000000000
          Top = 3.779530000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PK2]')
          ParentFont = False
        end
        object Memo255: TfrxMemoView
          Left = 90.708720000000000000
          Top = 22.677180000000000000
          Width = 23.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '1. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo256: TfrxMemoView
          Left = 90.708720000000000000
          Top = 44.354360000000000000
          Width = 23.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '2.')
          ParentFont = False
        end
        object Memo257: TfrxMemoView
          Left = 90.708720000000000000
          Top = 64.811070000000000000
          Width = 23.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '3.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo261: TfrxMemoView
          Left = 117.511750000000000000
          Top = 22.897650000000000000
          Width = 596.779840000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[M1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo262: TfrxMemoView
          Left = 117.944960000000000000
          Top = 43.574830000000000000
          Width = 595.779840000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[M2]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo263: TfrxMemoView
          Left = 117.944960000000000000
          Top = 65.031540000000000000
          Width = 595.779840000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[M3]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object Header7: TfrxHeader
        Height = 30.240000000000000000
        Top = 336.378170000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        object Memo264: TfrxMemoView
          Left = 38.000000000000000000
          Width = 300.000000000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo265: TfrxMemoView
          Left = 338.000000000000000000
          Width = 95.000000000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1029#1056#1105#1056#182#1056#1029#1057#8249#1056#8470' '#1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo266: TfrxMemoView
          Left = 433.000000000000000000
          Width = 95.000000000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#181' '#1056#1029#1056#176#1056#187#1056#1105#1057#8225#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo267: TfrxMemoView
          Left = 528.000310000000000000
          Width = 95.000000000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1056#183#1056#187#1056#1105#1057#8364#1056#1108#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo268: TfrxMemoView
          Left = 623.000000000000000000
          Width = 95.000000000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#181#1056#1169#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo269: TfrxMemoView
          Width = 38.000000000000000000
          Height = 30.240000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData8: TfrxMasterData
        Height = 296.023810000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        RowCount = 0
        StartNewPage = True
        object Memo270: TfrxMemoView
          Align = baWidth
          Top = 253.771800000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1057#1027#1057#8218#1056#176#1056#1029#1056#1109#1056#1030#1056#187#1056#181#1056#1029#1056#1109' '#1057#1027#1056#187#1056#181#1056#1169#1057#1107#1057#1035#1057#8240#1056#181#1056#181':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo271: TfrxMemoView
          Align = baWidth
          Top = 10.000000000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#187#1056#1105#1057#8225#1056#1105#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#176#1057#1039' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1057#1034'-'#1056#176#1056#1108#1057#8218)
          ParentFont = False
        end
        object Memo272: TfrxMemoView
          Align = baWidth
          Top = 36.456710000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#1109' '#1057#1107#1057#8225#1057#8216#1057#8218#1056#1029#1056#1109#1056#8470' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111#1056#181': [frxCMNUchGrSlich."FC_UCHGR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo273: TfrxMemoView
          Top = 59.133890000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1056#1109#1057#1026#1056#1109#1056#1169' ('#1057#1027#1056#181#1056#187#1056#1109') ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo274: TfrxMemoView
          Left = 113.385900000000000000
          Top = 59.133890000000000000
          Width = 438.425480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Place]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo275: TfrxMemoView
          Left = 551.811380000000000000
          Top = 59.133890000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '[Dat]  '#1056#1110'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo276: TfrxMemoView
          Top = 86.252010000000000000
          Width = 718.110700000000000000
          Height = 83.149660000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              #1056#1114#1057#8249', '#1056#1029#1056#1105#1056#182#1056#181#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#176#1056#1030#1057#8364#1056#1105#1056#181#1057#1027#1057#1039', '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1057#1039' '#1056#1030' '#1057#1027 +
              #1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#181' '#1056#1111#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1039' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105 +
              #1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105' ____________________________________' +
              '_____________, '#1057#8225#1056#187#1056#181#1056#1029#1056#1109#1056#1030' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105)
          ParentFont = False
          WordBreak = True
        end
        object Memo277: TfrxMemoView
          Top = 183.858380000000000000
          Width = 718.110700000000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1030' '#1056#1111#1057#1026#1056#1105#1057#1027#1057#1107#1057#8218#1057#1027#1057#8218#1056#1030#1056#1105#1056#1105' '#1056#1112#1056#176#1057#8218'.-'#1056#1109#1057#8218#1056#1030'. '#1056#187#1056#1105#1057#8224#1056#176' _____________' +
              '______ '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1056#187#1056#1105' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#1105#1056#8470' '#1056#176#1056#1108#1057#8218' '#1056#1109' '#1057#1027#1056#187#1056#1105#1057#8225#1056 +
              #181#1056#1029#1056#1105#1056#1105' '#1057#8222#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1056#1029#1056#176#1056#187#1056#1105#1057#8225#1056#1105#1057#1039' '#1056#1109#1056#177#1057#1033#1056#181#1056#1108#1057#8218#1056#1109#1056#1030 +
              ' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176' '#1056#1111#1056#1109' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111#1056#181' '#1057#1107#1057#8225#1057#8216#1057#8218#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105' "[frxCMNUchGrSl' +
              'ich."FC_UCHGR"]" '#1057#1027' '#1056#1108#1056#1029#1056#1105#1056#1110#1056#1109#1056#8470' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176' '#1056#1111#1056#1109' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#1109#1057#1039#1056#1029#1056 +
              #1105#1057#1035' '#1056#1029#1056#176'  [Dat]  '#1056#1110'.')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Left = 646.299630000000000000
          Top = 129.165430000000000000
          Width = 68.031540000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line16: TfrxLineView
          Left = 3.779530000000000000
          Top = 296.023810000000000000
          Width = 710.551640000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo278: TfrxMemoView
          Left = 37.795300000000000000
          Top = 106.488250000000000000
          Width = 456.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PK2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo279: TfrxMemoView
          Left = 3.779530000000000000
          Top = 146.283550000000000000
          Width = 706.772110000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[M1], [M2], [M3]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 22.680000000000000000
        Top = 389.291590000000000000
        Width = 718.110700000000000000
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo280: TfrxMemoView
          Left = 38.000000000000000000
          Width = 300.000000000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxCMNUchGrSlich."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo281: TfrxMemoView
          Left = 338.000000000000000000
          Width = 95.000000000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxCMNUchGrSlich."FN_FACTKOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo282: TfrxMemoView
          Left = 433.000000000000000000
          Width = 95.000000000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxCMNUchGrSlich."FN_BUHKOL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo283: TfrxMemoView
          Left = 528.000310000000000000
          Width = 95.000000000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxCMNUchGrSlich."fn_izlishkiF"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo284: TfrxMemoView
          Left = 623.000000000000000000
          Width = 95.000000000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxCMNUchGrSlich."fn_nedostF"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo285: TfrxMemoView
          Width = 38.000000000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter10: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 665.197280000000000000
        Width = 718.110700000000000000
        object Memo286: TfrxMemoView
          Left = 563.000000000000000000
          Width = 155.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
        end
        object Memo287: TfrxMemoView
          Width = 525.354670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
        end
      end
      object MasterData13: TfrxMasterData
        Height = 22.677180000000000000
        Top = 582.047620000000000000
        Width = 718.110700000000000000
        RowCount = 0
        object Memo296: TfrxMemoView
          Width = 714.331094330000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[frxMO."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object RASCHET: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Header4: TfrxHeader
        Height = 185.196970000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo113: TfrxMemoView
          Width = 710.551640000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#1106#1056#1038#1056#167#1056#8226#1056#1118)
          ParentFont = False
        end
        object Memo114: TfrxMemoView
          Top = 26.456710000000000000
          Width = 710.551640000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8226#1057#1027#1057#8218#1056#181#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1029#1056#1109#1056#8470' '#1057#1107#1056#177#1057#8249#1056#187#1056#1105' '#1056#1111#1056#1109' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#181' ________' +
              '_ '#1056#183#1056#176' '#1056#1030#1057#1026#1056#181#1056#1112#1057#1039' [DatPeriodStrt] '#1056#1110)
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          Top = 49.133890000000000000
          Width = 710.551640000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109'  [DatPeriodEnd] '#1056#1110)
          ParentFont = False
        end
        object Memo116: TfrxMemoView
          Top = 75.590600000000000000
          Width = 113.385824330000000000
          Height = 109.606370000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#181#1057#1027#1057#1039#1057#8224#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 113.622140000000000000
          Top = 75.590600000000000000
          Width = 114.141729840000000000
          Height = 109.606370000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1056#176#1056#1112#1056#177#1057#1107#1056#187'. '#1056#173#1056#1108#1057#1027#1057#8218#1056#181#1056#1112#1056#1111'. '#1057#1026#1056#181#1057#8224#1056#181#1056#1111#1057#8218#1057#1107#1057#1026#1056#181' ('#1057#1027#1057#1107#1056#1112#1056#1112#1056#176')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 227.330860000000000000
          Top = 75.590600000000000000
          Width = 131.527568820000000000
          Height = 109.606370000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1057#1027#1057#8218#1056#176#1057#8224' '#1057#1026#1056#181#1057#8224#1056#181#1056#1111#1057#8218#1057#1107#1057#1026#1056#181' ('#1057#1027#1057#1107#1056#1112#1056#1112#1056#176')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 358.953000000000000000
          Top = 75.590600000000000000
          Width = 108.850388820000000000
          Height = 109.606370000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1056#1112#1056#181#1056#187#1056#1108#1056#1109#1056#1111#1057#8218' '#1056#1109#1057#8218#1056#1111#1057#1107#1057#1027#1056#1108#1057#1107' ('#1056#1030#1056#181#1057#1027#1056#1109#1056#1030#1056#1109#1056#8470') ('#1057#1027#1057#1107#1056#1112#1056#1112#1056#176')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo120: TfrxMemoView
          Left = 467.661720000000000000
          Top = 75.590600000000000000
          Width = 117.165354330000000000
          Height = 109.606370000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1057#8222#1056#176#1057#1027#1056#1109#1056#1030#1056#1109#1057#8225#1056#1029#1056#1109#1056#1112#1057#1107' '#1056#182#1057#1107#1057#1026#1056#1029#1056#176#1056#187#1057#1107' ('#1057#1027#1057#1107#1056#1112#1056#1112#1056#176')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo121: TfrxMemoView
          Left = 585.283860000000000000
          Top = 75.590600000000000000
          Width = 124.724414330000000000
          Height = 109.606370000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1056#176#1057#8218#1056#176' 100,0')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData4: TfrxMasterData
        Height = 26.456710000000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        RowCount = 0
        object Memo128: TfrxMemoView
          Width = 113.385824330000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxRaschet."fmonstr"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo129: TfrxMemoView
          Left = 113.622140000000000000
          Width = 114.141729840000000000
          Height = 26.456710000000000000
          OnBeforePrint = 'Memo129OnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_cmn_cur_extemp]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo130: TfrxMemoView
          Left = 227.330860000000000000
          Width = 131.527568820000000000
          Height = 26.456710000000000000
          OnBeforePrint = 'Memo130OnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_cmn_cur_stats]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo131: TfrxMemoView
          Left = 358.953000000000000000
          Width = 108.850388820000000000
          Height = 26.456710000000000000
          OnBeforePrint = 'Memo131OnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_cmn_cur_melko]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo132: TfrxMemoView
          Left = 467.661720000000000000
          Width = 117.165354330000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo133: TfrxMemoView
          Left = 585.283860000000000000
          Width = 124.724414330000000000
          Height = 26.456710000000000000
          OnBeforePrint = 'Memo133OnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_cmn_cur_vata]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer4: TfrxFooter
        Height = 321.464750000000000000
        Top = 275.905690000000000000
        Width = 718.110700000000000000
        object Memo200: TfrxMemoView
          Width = 113.385824330000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo201: TfrxMemoView
          Left = 113.622140000000000000
          Width = 114.141729840000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_cmn_4s]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo202: TfrxMemoView
          Left = 227.330860000000000000
          Width = 131.527568820000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_cmn_5s]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo203: TfrxMemoView
          Left = 358.953000000000000000
          Width = 108.850388820000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_cmn_6s]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo204: TfrxMemoView
          Left = 467.661720000000000000
          Width = 117.165354330000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo205: TfrxMemoView
          Left = 585.283860000000000000
          Width = 124.724414330000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_cmn_7s]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo206: TfrxMemoView
          Top = 25.897650000000000000
          Width = 113.385824330000000000
          Height = 37.795275590000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1057#8224#1056#181#1056#1029#1057#8218' '#1057#1107#1056#177#1057#8249#1056#187#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo207: TfrxMemoView
          Left = 113.622140000000000000
          Top = 25.897650000000000000
          Width = 114.141729840000000000
          Height = 37.795275590000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '1,8%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo208: TfrxMemoView
          Left = 227.330860000000000000
          Top = 25.897650000000000000
          Width = 131.527568820000000000
          Height = 37.795275590000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo209: TfrxMemoView
          Left = 358.953000000000000000
          Top = 25.897650000000000000
          Width = 108.850388820000000000
          Height = 37.795275590000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo210: TfrxMemoView
          Left = 467.661720000000000000
          Top = 25.897650000000000000
          Width = 117.165354330000000000
          Height = 37.795275590000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo211: TfrxMemoView
          Left = 585.283860000000000000
          Top = 25.897650000000000000
          Width = 124.724414330000000000
          Height = 37.795275590551180000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo212: TfrxMemoView
          Top = 63.795300000000000000
          Width = 113.385824330000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1056#181#1057#1027#1057#8218#1056#181#1057#1027#1057#8218'- '#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#8470' '#1057#1107#1056#177#1057#8249#1056#187#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo213: TfrxMemoView
          Left = 113.622140000000000000
          Top = 63.795300000000000000
          Width = 114.141729840000000000
          Height = 37.795300000000000000
          OnBeforePrint = 'Memo213OnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[v_extemp_ub]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo214: TfrxMemoView
          Left = 227.330860000000000000
          Top = 63.795300000000000000
          Width = 131.527568820000000000
          Height = 37.795300000000000000
          OnBeforePrint = 'Memo214OnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo215: TfrxMemoView
          Left = 358.953000000000000000
          Top = 63.795300000000000000
          Width = 108.850388820000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo216: TfrxMemoView
          Left = 467.661720000000000000
          Top = 63.795300000000000000
          Width = 117.165354330000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo217: TfrxMemoView
          Left = 585.283860000000000000
          Top = 63.795300000000000000
          Width = 124.724414330000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          Top = 109.590600000000000000
          Width = 710.551640000000000000
          Height = 105.826840000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1029#1056#176#1057#8225#1056#1105#1057#1027#1056#187#1056#181#1056#1029#1056#1109' '#1057#1026#1057#1107#1056#177#1056#187#1056#181#1056#8470'  ____________________' +
              '______________________________'
            
              #1056#164#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#176#1057#1039' '#1056#181#1057#1027#1057#8218#1056#181#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#176#1057#1039' '#1057#8218#1057#1026#1056#176#1057#8218#1056#176' _____' +
              '_______________________________________'
            ''
            ''
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108 +
              #1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'  [PK2]'
            '')
          ParentFont = False
        end
        object Memo258: TfrxMemoView
          Top = 219.196970000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249':')
          ParentFont = False
        end
        object Memo259: TfrxMemoView
          Top = 298.567100000000000000
          Width = 317.480520000000000000
          Height = 22.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109'-'#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1056#181' '#1056#187#1056#1105#1057#8224#1056#176' :')
          ParentFont = False
        end
        object Memo260: TfrxMemoView
          Left = 90.708720000000000000
          Top = 219.196970000000000000
          Width = 23.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '1. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo297: TfrxMemoView
          Left = 90.708720000000000000
          Top = 240.874150000000000000
          Width = 23.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '2.')
          ParentFont = False
        end
        object Memo298: TfrxMemoView
          Left = 90.708720000000000000
          Top = 261.330860000000000000
          Width = 23.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '3.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo299: TfrxMemoView
          Left = 117.511750000000000000
          Top = 219.417440000000000000
          Width = 596.779840000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[M1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo300: TfrxMemoView
          Left = 117.944960000000000000
          Top = 240.094620000000000000
          Width = 595.779840000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[M2]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo301: TfrxMemoView
          Left = 117.944960000000000000
          Top = 261.551330000000000000
          Width = 595.779840000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[M3]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 854.173780000000000000
        Width = 718.110700000000000000
        object Memo162: TfrxMemoView
          Left = 3.779530000000000000
          Width = 525.354670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
        end
        object Memo222: TfrxMemoView
          Left = 551.811380000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
        end
      end
      object MasterData14: TfrxMasterData
        Height = 22.677180000000000000
        Top = 619.842920000000000000
        Width = 718.110700000000000000
        RowCount = 0
        object Memo302: TfrxMemoView
          Width = 714.331094330000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[frxMO."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Child2: TfrxChild
        Height = 128.504020000000000000
        Top = 665.197280000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo123: TfrxMemoView
          Left = 306.141930000000000000
          Top = 3.779530000000000000
          Width = 408.189240000000000000
          Height = 117.165430000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218'.-'#1056#1109#1057#8218#1056#1030'. '#1056#187#1056#1105#1057#8224#1056#176' ______________________________'
            ''
            #1056#8216#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026' __________________________________'
            ''
            #1056#1038#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1056#187' '#1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026'  _________________________')
          ParentFont = False
        end
      end
    end
    object ACT: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter3: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 691.653990000000000000
        Width = 718.110700000000000000
        object Memo163: TfrxMemoView
          Left = 3.779530000000000000
          Width = 525.354670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
        end
        object Memo317: TfrxMemoView
          Left = 548.031850000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
        end
      end
      object MasterData15: TfrxMasterData
        Height = 22.677180000000000000
        Top = 555.590910000000000000
        Width = 718.110700000000000000
        RowCount = 0
        object Memo303: TfrxMemoView
          Width = 714.331094330000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[frxMO."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer7: TfrxFooter
        Height = 30.236240000000000000
        Top = 600.945270000000000000
        Width = 718.110700000000000000
        object Memo155: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 714.331170000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'  _______________________________' +
              '______________')
          ParentFont = False
        end
      end
      object ReportTitle6: TfrxReportTitle
        Height = 179.519790000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Child = frxRpNewInventariz.Child3
        Stretched = True
        object Memo124: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 714.331170000000000000
          Height = 49.133890000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1106#1056#1113#1056#1118
            
              #1056#1109' '#1057#1026#1056#181#1056#183#1057#1107#1056#187#1057#1034#1057#8218#1056#176#1057#8218#1056#176#1057#8230' '#1056#1111#1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1108#1056#1105' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#181#1056#8470' '#1056#1111 +
              #1056#1109' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#181' _______________________')
          ParentFont = False
        end
        object Memo125: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 7.559060000000000000
          Top = 77.472480000000000000
          Width = 710.551640000000000000
          Height = 102.047310000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1114#1057#8249', '#1056#1029#1056#1105#1056#182#1056#181#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#176#1056#1030#1057#8364#1056#1105#1056#181#1057#1027#1057#1039', '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1057#1039' '#1056#1030' '#1057#1027 +
              #1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#181' '#1056#1111#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1039' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105 +
              #1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105' [PK2] , '#1057#8225#1056#187#1056#181#1056#1029#1056#1109#1056#1030' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056 +
              #1105'  [M1] [M2] [M3] , '#1056#1030' '#1056#1111#1057#1026#1056#1105#1057#1027#1057#1107#1057#8218#1057#1027#1057#8218#1056#1030#1056#1105#1056#1105' [fPeoples] '
            
              #1056#1111#1057#1026#1056#1109#1056#1105#1056#183#1056#1030#1056#181#1056#187#1056#1105' '#1057#1027#1056#187#1056#1105#1057#8225#1056#181#1056#1029#1056#1105#1056#181' '#1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1108#1056#1109#1056#1030' '#1056#1111#1056#1109' '#1056#1169#1056#176#1056#1029 +
              #1056#1029#1057#8249#1056#1112' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176' [Dat] '#1056#1110'. '#1057#1027' '#1057#8222#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1105#1056#1112' '#1056#1029#1056#176#1056#187#1056#1105#1057#8225 +
              #1056#1105#1056#181#1056#1112' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#181#1056#8470' '#1056#1111#1056#1109' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1057 +
              #8249#1056#1112' '#1056#1109#1056#1111#1056#1105#1057#1027#1057#1039#1056#1112' '#1056#1029#1056#176' '#1057#8218#1056#1109' '#1056#182#1056#181' '#1057#8225#1056#1105#1057#1027#1056#187#1056#1109', '#1056#1111#1057#1026#1056#1105' '#1057#8225#1056#181#1056#1112' '#1056#1109#1056#1108#1056#176 +
              #1056#183#1056#176#1056#187#1056#1109#1057#1027#1057#1034':')
          ParentFont = False
        end
        object Memo169: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 3.779530000000000000
          Top = 54.133890000000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1056#1109#1057#1026#1056#1109#1056#1169' ('#1057#1027#1056#181#1056#187#1056#1109')  [Place] ')
          ParentFont = False
        end
        object Memo173: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 483.779840000000000000
          Top = 54.133890000000000000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '[Dat] '#1056#1110)
          ParentFont = False
        end
      end
      object Header5: TfrxHeader
        Top = 532.913730000000000000
        Width = 718.110700000000000000
      end
      object Child3: TfrxChild
        Height = 249.653680000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        object Memo144: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 79.031540000000000000
          Width = 117.165354330000000000
          Height = 41.574817800000000000
          ShowHint = False
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1056#181' '#1056#1108#1056#1109#1056#1112#1056#1029#1056#176#1057#8218#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo145: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 117.165430000000000000
          Top = 79.031540000000000000
          Width = 117.165354330000000000
          Height = 41.574817800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[act_ost_buch]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo146: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 234.330860000000000000
          Top = 79.031540000000000000
          Width = 113.385824330000000000
          Height = 41.574817800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[act_fact_nal]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo147: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 347.716760000000000000
          Top = 79.031540000000000000
          Width = 22.677104330000000000
          Height = 41.574817800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo148: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 370.393940000000000000
          Top = 79.031540000000000000
          Width = 37.795224330000000000
          Height = 41.574817800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo149: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 408.543600000000000000
          Top = 79.031540000000000000
          Width = 37.795224330000000000
          Height = 41.574817800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo150: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 446.338900000000000000
          Top = 79.031540000000000000
          Width = 90.708644330000000000
          Height = 41.574817800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[act_res_nedost]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo151: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 537.047620000000000000
          Top = 79.031540000000000000
          Width = 71.810994330000000000
          Height = 41.574817800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[act_est_ubil]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo152: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 608.858690000000000000
          Top = 79.031540000000000000
          Width = 37.795224330000000000
          Height = 41.574817800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo153: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 646.653990000000000000
          Top = 79.031540000000000000
          Width = 71.810994330000000000
          Height = 41.574817800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[res_trat_ned]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo154: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 128.708720000000000000
          Width = 714.331170000000000000
          Height = 41.574830000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              #1056#1116#1056#181#1056#1169#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176' '#1056#1111#1056#1109'  __________________________ '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056 +
              #1112#1057#1107' _______________________')
          ParentFont = False
        end
        object Memo304: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 223.196970000000000000
          Width = 714.331170000000000000
          Height = 26.456710000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109'-'#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1056#181' '#1056#187#1056#1105#1057#8224#1056#176' :')
          ParentFont = False
        end
        object Memo126: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Width = 117.165354330000000000
          Height = 79.370130000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo127: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 117.165430000000000000
          Width = 117.165354330000000000
          Height = 79.370130000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' '#1056#1111#1056#1109' '#1056#177#1057#1107#1057#8230' '#1057#1107#1057#8225#1056#181#1057#8218#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo134: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 234.330860000000000000
          Width = 113.385824330000000000
          Height = 79.370130000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1108#1057#8218#1056#1105#1057#8225'. '#1056#1029#1056#176#1056#187#1056#1105#1057#8225#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo135: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 347.716760000000000000
          Width = 22.677104330000000000
          Height = 79.370130000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8216#1056#1109#1056#8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo136: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 370.393940000000000000
          Width = 37.795224330000000000
          Height = 79.370130000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1057#1027#1057#1026#1056#1109#1057#8225#1056#181#1056#1029#1056#1029#1057#8249#1056#8470' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo137: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 408.543600000000000000
          Width = 128.503944330000000000
          Height = 45.354360000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#181#1056#183#1057#1107#1056#187#1057#1034#1057#8218#1056#176#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo138: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 408.543600000000000000
          Top = 45.354360000000000000
          Width = 37.795224330000000000
          Height = 34.015770000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1105#1056#183#1056#187#1056#1105#1057#8364#1056#1108#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo139: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 446.338900000000000000
          Top = 45.354360000000000000
          Width = 90.708644330000000000
          Height = 34.015770000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#181#1056#1169#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo140: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 537.047620000000000000
          Width = 71.810994330000000000
          Height = 79.370130000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1057#1027#1057#8218#1056#181#1057#1027#1057#8218#1056#1030'.'
            #1057#1107#1056#177#1057#8249#1056#187#1057#1034' '#1056#1111#1056#1109
            #1056#1029#1056#1109#1057#1026#1056#1112#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo141: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 608.858690000000000000
          Width = 109.606294330000000000
          Height = 45.354360000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#181#1056#183#1057#1107#1056#187#1057#1034#1057#8218#1056#176#1057#8218' '#1056#1111#1056#1109#1057#1027#1056#187#1056#181
            #1056#1111#1057#1026#1056#1105#1056#1112#1056#181#1056#1029#1056#181#1056#1029#1056#1105#1057#1039
            #1056#181#1057#1027#1057#8218'. '#1057#8218#1057#1026#1056#176#1057#8218#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo142: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 608.858690000000000000
          Top = 45.354360000000000000
          Width = 37.795224330000000000
          Height = 34.015770000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1105#1056#183#1056#187#1056#1105#1057#8364#1056#1108#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo143: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Left = 646.653990000000000000
          Top = 45.354360000000000000
          Width = 71.810994330000000000
          Height = 34.015770000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#181#1056#1169#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 174.063080000000000000
          Width = 714.331170000000000000
          Height = 41.574830000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              #1056#152#1056#183#1056#187#1056#1105#1057#8364#1056#181#1056#1108' '#1056#1111#1056#1109'_____________________________ '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107 +
              ' ______________________')
          ParentFont = False
        end
      end
    end
    object GRP: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 3
      ColumnWidth = 63.333333333333300000
      ColumnPositions.Strings = (
        '0'
        '63,3333333333333'
        '126,666666666667')
      LargeDesignHeight = True
      object Header6: TfrxHeader
        Height = 52.913420000000000000
        Top = 173.858380000000000000
        Width = 239.370233333333200000
        object Memo158: TfrxMemoView
          Width = 117.165354330000000000
          Height = 52.913420000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1109#1056#1111#1056#1105#1057#1027#1056#181#1056#8470
            #1056#187#1056#1105#1057#1027#1057#8218#1056#1109#1056#1030)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo159: TfrxMemoView
          Left = 117.165430000000000000
          Width = 120.944884330000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo160: TfrxMemoView
          Left = 117.165430000000000000
          Top = 34.015770000000000000
          Width = 83.149584330000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1057#1107#1056#177)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo161: TfrxMemoView
          Left = 200.315090000000000000
          Top = 34.015770000000000000
          Width = 37.795224330000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData6: TfrxMasterData
        Height = 18.897637800000000000
        Top = 249.448980000000000000
        Width = 239.370233333333200000
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo170: TfrxMemoView
          Width = 117.165354330000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo171: TfrxMemoView
          Left = 117.165430000000000000
          Width = 79.370054330000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo172: TfrxMemoView
          Left = 196.535560000000000000
          Width = 41.574754330000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader2: TfrxPageHeader
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo156: TfrxMemoView
          Left = 7.559060000000000000
          Top = 0.000000000000000003
          Width = 710.551640000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8220#1056#160#1056#1032#1056#1119#1056#1119#1056#152#1056#160#1056#1115#1056#8217#1056#1113#1056#1106' '#1056#1115#1056#1119#1056#152#1056#1038#1056#152)
          ParentFont = False
        end
        object Memo157: TfrxMemoView
          Left = 7.559060000000000000
          Top = 26.456710000000000000
          Width = 710.551640000000000000
          Height = 68.031540000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1106#1056#1111#1057#8218#1056#181#1056#1108#1056#176' __________________________  '#1056#8220#1056#1109#1057#1026#1056#1109#1056#1169'('#1057#1027#1056#181#1056#187#1056#1109') [P' +
              'lace]'
            ''
            #1056#1029#1056#176' [Dat] '#1056#1110)
          ParentFont = False
        end
      end
      object PageFooter4: TfrxPageFooter
        Height = 219.212740000000000000
        Top = 328.819110000000000000
        Width = 718.110700000000000000
        object Memo179: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 710.551640000000000000
          Height = 64.252010000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#181#1056#1169#1056#1105#1056#1029#1056#1105#1057#8224' '#1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035' _____________' +
              '_______________________________________'
            ''
            
              '________________________________________________________________' +
              '_____________')
          ParentFont = False
        end
        object Memo180: TfrxMemoView
          Left = 306.141930000000000000
          Top = 71.811070000000000000
          Width = 408.189240000000000000
          Height = 109.606370000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105' _________________________'
            ''
            #1056#8212#1056#176#1056#1030'. '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470'           _________________________'
            ''
            #1056#8216#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026'                _________________________')
          ParentFont = False
        end
        object Memo164: TfrxMemoView
          Left = 3.779530000000000000
          Top = 200.315090000000000000
          Width = 525.354670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
        end
        object Memo318: TfrxMemoView
          Left = 551.811380000000000000
          Top = 200.315090000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
          ParentFont = False
        end
      end
    end
  end
  object odsInvListPrint: TOracleDataSet
    SQL.Strings = (
      'select il.MATOTVID_OWNER, '
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
      '       ms.FC_NAME FC_SIGNED_BY'
      '  from MED.TINVLIST il'
      '  left join med.TMO mo'
      '    on il.MATOTVID_OWNER = mo.MOID'
      '  left join med.TMO_GROUP mg'
      '    on il.MATOTVID = mg.GROUPID'
      '  left join med.TFINSOURCE fs'
      '    on il.FK_FINSOURCE_ID = fs.FK_ID'
      '  left join med.TMO ms'
      '    on il.FK_SIGNED_BY_MO = ms.MOID'
      ' where il.INVLISTID = :pINVLISTID'
      ''
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50494E564C4953544944030000000000000000
      000000}
    Session = dmMain.os
    Left = 40
    Top = 528
  end
  object frxdsInvListPrint: TfrxDBDataset
    UserName = 'frxdsInvListPrint'
    CloseDataSource = False
    DataSet = odsInvListPrint
    BCDToCurrency = False
    Left = 40
    Top = 488
  end
end
