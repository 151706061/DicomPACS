object frmLinkedDocs: TfrmLinkedDocs
  Left = 372
  Top = 158
  Caption = #1057#1087#1080#1089#1086#1082' '#1079#1072#1074#1080#1089#1080#1084#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  ClientHeight = 241
  ClientWidth = 546
  Color = clBtnFace
  Constraints.MinHeight = 175
  Constraints.MinWidth = 375
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxMemo1: TcxMemo
    Left = 0
    Top = 17
    Align = alClient
    Properties.ReadOnly = True
    Properties.ScrollBars = ssBoth
    TabOrder = 0
    Height = 183
    Width = 546
  end
  object Panel1: TPanel
    Left = 0
    Top = 200
    Width = 546
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      546
      41)
    object buOk: TcxButton
      Left = 455
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object cxLabel1: TcxLabel
      Left = 10
      Top = 6
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = #1057#1080#1084#1074#1086#1083#1086#1084' * '#1086#1090#1084#1077#1095#1077#1085' '#1090#1077#1082#1091#1097#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Properties.Alignment.Vert = taVCenter
      Properties.WordWrap = True
      Height = 32
      Width = 432
      AnchorY = 22
    end
  end
  object laMessage: TcxLabel
    Left = 0
    Top = 0
    Align = alTop
    Caption = #1088#1087#1072#1088#1087#1072#1088#1072#1087
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Properties.WordWrap = True
    Width = 546
  end
  object odsCheckLinkedDocs: TOracleDataSet
    SQL.Strings = (
      'select'
      '  D.DPID,'
      
        '  med.GET_DECODEDOCVIDMOVE(fp_vidmove)||'#39' '#8470' '#39'||D.fc_doc||'#39' '#1086#1090' '#39'|' +
        '|to_char(D.fd_invoice,'#39'dd.mm.yyyy'#39') AS fc_docmix,'
      '  to_char(D.fd_data,'#39'dd.mm.yyyy'#39') as FC_DOC_REG_DATE,'
      '  D.fp_vidmove,'
      '  d.fd_data,'
      '  d.fl_edit,'
      '  DECODE(d.DPID, :aDPID, '#39'*'#39', '#39' '#39') as CurDoc,'
      '  d.fk_mogroupid_from,'
      '  d.fk_mogroupid_to,'
      
        '  med.pkg_prihrash.get_prihrashpriznak(d.fp_vid,d.fp_vidmove,d.f' +
        'k_mogroupid_from,d.fk_mogroupid_to, d.fk_mogroupid_from) as FN_p' +
        'rihrashpriznak,'
      '  NVL(MG_FROM.FC_GROUP, MG_TO.FC_GROUP) as FC_MG,'
      '  MG_FROM.FC_GROUP as fc_mogroupid_from, '
      '  MG_TO.FC_GROUP as fc_mogroupid_to,'
      '  1 as checked'
      ''
      ''
      'FROm'
      'MED.TDOCS D,'
      '(select'
      '--  DISTINCT'
      '--  DPC1.kartid,'
      '--  DPC2.dpcid,'
      '  DPC2.dpid'
      'FROM'
      '  MED.TDPC DPC1, MED.TDPC DPC2'
      'WHERE '
      '  (DPC1.dpid = :aDPID)'
      '  and((:By_KARTID=0)or(DPC1.kartid = :kartid))'
      '  AND DPC2.kartid = DPC1.kartid'
      '--  AND DPC2.dpid <> :aDPID'
      'GROUP BY DPC2.dpid'
      ') A,'
      'MED.TMO_GROUP MG_FROM, MED.TMO_GROUP MG_TO'
      'WHERE A.dpid=D.DPID '
      '  and d.FK_MOGROUPID_FROM = MG_FROM.groupid(+)'
      '  and d.FK_MOGROUPID_TO = MG_TO.groupid(+)'
      '  '
      
        '  and ((d.FK_MOGROUPID_FROM = :pFK_MG_FROM)or(:pFK_MG_FROM = -1)' +
        ')'
      ''
      'ORDER BY D.FD_DATA ASC')
    Optimize = False
    Variables.Data = {
      0300000004000000060000003A41445049440300000000000000000000000A00
      00003A42595F4B41525449440300000004000000000000000000000007000000
      3A4B41525449440300000000000000000000000C0000003A50464B5F4D475F46
      524F4D0300000004000000FFFFFFFF00000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E00000004000000445049440100000000000900000046435F444F43
      4D49580100000000000F00000046435F444F435F5245475F4441544501000000
      00000A00000046505F5649444D4F56450100000000000700000046445F444154
      4101000000000007000000464C5F454449540100000000000600000043555244
      4F4301000000000011000000464B5F4D4F47524F555049445F46524F4D010000
      0000000F000000464B5F4D4F47524F555049445F544F01000000000012000000
      464E5F50524948524153485052495A4E414B0100000000000500000046435F4D
      470100000000001100000046435F4D4F47524F555049445F46524F4D01000000
      00000F00000046435F4D4F47524F555049445F544F0100000000000700000043
      4845434B4544010000000000}
    CountAllRecords = True
    CommitOnPost = False
    Session = dmMain.os
    Left = 52
    Top = 52
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmLinkedDocs\'
    StoredValues = <>
    Left = 224
    Top = 134
  end
  object odsDocKol: TOracleDataSet
    SQL.Strings = (
      'select DP.KARTID,'
      '       M.FC_NAME as FC_MEDIC_NAME,'
      '       sum(NVL(OST.FN_KOLOST, 0) - DP.FN_KOL) as DIFF_KOL'
      '  from MED.TDPC DP'
      ' inner join MED.TKART K'
      '    on DP.KARTID = K.KARTID'
      ' inner join MED.TMEDIC M '
      '    on K.MEDICID = M.MEDICID '
      '  left join MED.VMEDKART_KOLOST OST'
      '    on K.KARTID = OST.KARTID'
      
        '   and OST.FN_OST_TYPE = 0 --'#1053#1077' '#1091#1095#1080#1090#1099#1074#1072#1077#1084' '#1090#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1099', '#1082#1086#1090#1086#1088#1099#1077' ' +
        #1085#1072#1093#1086#1076#1103#1090#1089#1103' '#1074' '#1088#1077#1079#1077#1088#1074#1077'    '
      ' where DP.DPID = :ADPID'
      ' group by DP.KARTID, M.FC_NAME')
    Optimize = False
    Variables.Data = {
      0300000001000000060000003A41445049440300000004000000010000000000
      0000}
    CountAllRecords = True
    CommitOnPost = False
    Session = dmMain.os
    Left = 168
    Top = 52
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  B.MOGROUP,'
      '  B.kartid,'
      '  B.FC_MEDIC_NAME,'
      '--  B.dpid, -- '#1076#1083#1103' '#1089#1088#1072#1074#1085#1077#1085#1080#1103' '#1087#1086' '#1086#1090#1076#1077#1083#1100#1085#1099#1084' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084
      '  SUM(B.FN_KOL_BY_MOGROUP) as FN_KOL_BY_MOGROUP'
      'FROM  '
      '('
      'SELECT'
      '  USED_MOGROUPS.MOGROUP,'
      '  TDOCS.fk_mogroupid_to,'
      '  TDOCS.fk_mogroupid_FROM,'
      '  TDPC.kartid,'
      '  TDPC.FN_KOL,'
      '  TDPC.dpid,'
      
        '  DECODE(k.fc_serial, null, m.fc_name||'#39'('#1087'. '#39'||TO_CHAR(k.fn_part' +
        'y_num)||'#39')'#39', '
      
        '                            m.fc_name||'#39'('#1087'. '#39'||TO_CHAR(k.fn_part' +
        'y_num)||'#39', '#1089#1077#1088'. '#39'||k.fc_serial||'#39')'#39') as FC_MEDIC_NAME,'
      '  med.pkg_prihrash.Get_PrihRashPriznak ('
      '      TDOCS.fp_vid,'
      '      TDOCS.fp_vidmove,'
      '      TDOCS.fk_mogroupid_FROM,'
      '      TDOCS.fk_mogroupid_to,'
      '      MOGROUP)*TDPC.FN_KOL as FN_KOL_BY_MOGROUP'
      '  '
      'FROM'
      'MED.TDPC, MED.TDOCS, med.tkart k, med.tmedic m,'
      '(select '
      '  D.DPID'
      'FROM'
      'MED.TDOCS D,'
      '(select'
      '  DISTINCT'
      '  DPC2.dpid'
      'FROM'
      '  MED.TDPC DPC1, MED.TDPC DPC2'
      'WHERE '
      '  DPC1.dpid = :aDPID'
      '  AND DPC2.kartid = DPC1.kartid'
      ') A'
      'WHERE A.dpid=D.DPID '
      
        'and ( (d.fl_edit = 0) or (D.DPID = :aDPID) )-- '#1076#1086#1082#1091#1084#1077#1085#1090' '#1076#1086#1083#1078#1077#1085' '#1073 +
        #1099#1090#1100' '#1080#1083#1080' '#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1084' '#1080#1083#1080' '#1090#1077#1082#1091#1097#1080#1084
      ') USED_DOCS, -- '#1089#1086#1073#1080#1088#1072#1077#1084' '#1074#1089#1077' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      ''
      '(select -- '#1089#1086#1073#1080#1088#1072#1077#1084' '#1074#1089#1077' '#1075#1088#1091#1087#1087#1099
      '  --D.DPID,'
      '  DECODE(D.fp_vid, 3, -1, D.fk_mogroupid_to) as MOGROUP'
      'FROm'
      'MED.TDOCS D,'
      '(select'
      '  DISTINCT'
      '  DPC2.dpid'
      'FROM'
      '  MED.TDPC DPC1, MED.TDPC DPC2'
      'WHERE '
      '  DPC1.dpid = :aDPID'
      '  AND DPC2.kartid = DPC1.kartid'
      ') A'
      'WHERE A.dpid=D.DPID '
      
        'and ( (d.fl_edit = 0) or (D.DPID = :aDPID) )-- '#1076#1086#1082#1091#1084#1077#1085#1090' '#1076#1086#1083#1078#1077#1085' '#1073 +
        #1099#1090#1100' '#1080#1083#1080' '#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1084' '#1080#1083#1080' '#1090#1077#1082#1091#1097#1080#1084
      'AND NVL(D.fk_mogroupid_to,0) > 0'
      ''
      'UNION'
      ''
      'select '
      '--  D.DPID,'
      '  DECODE(D.fp_vid, 1, -1, D.fk_mogroupid_FROM) as MOGROUP'
      'FROm'
      'MED.TDOCS D,'
      '(select'
      '  DISTINCT'
      '  DPC2.dpid'
      'FROM'
      '  MED.TDPC DPC1, MED.TDPC DPC2'
      'WHERE '
      '  DPC1.dpid = :aDPID'
      '  AND DPC2.kartid = DPC1.kartid'
      ') A'
      'WHERE A.dpid=D.DPID '
      
        'and ( (d.fl_edit = 0) or (D.DPID = :aDPID) )-- '#1076#1086#1082#1091#1084#1077#1085#1090' '#1076#1086#1083#1078#1077#1085' '#1073 +
        #1099#1090#1100' '#1080#1083#1080' '#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1084' '#1080#1083#1080' '#1090#1077#1082#1091#1097#1080#1084
      'AND NVL(D.fk_mogroupid_FROM,0) > 0'
      ') USED_MOGROUPS,'
      ''
      
        '(SELECT kartid FROM MED.TDPC WHERE dpid = :aDPID) USED_KARTS -- ' +
        #1080#1089#1087#1086#1083#1100#1079#1091#1077#1084#1099#1077' '#1087#1072#1088#1090#1080#1080
      ''
      'WHERE'
      '    TDOCS.DPID = USED_DOCS.DPID'
      'and TDPC.DPID = TDOCS.DPID'
      'AND TDPC.kartid = USED_KARTS.kartid'
      
        'AND USED_MOGROUPS.MOGROUP in(TDOCS.fk_mogroupid_FROM, TDOCS.fk_m' +
        'ogroupid_to)'
      'AND TDPC.kartid = k.kartid'
      'AND k.medicid = m.medicid'
      ''
      '/*order by '
      '  TDPC.kartid,'
      '  USED_MOGROUPS.MOGROUP,'
      '  TDPC.FN_KOL*/'
      ')  B'
      'GROUP BY   '
      '  B.MOGROUP,'
      '--  B.dpid, -- '#1076#1083#1103' '#1089#1088#1072#1074#1085#1077#1085#1080#1103' '#1087#1086' '#1086#1090#1076#1077#1083#1100#1085#1099#1084' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084
      '  B.kartid, B.FC_MEDIC_NAME'
      '  order by B.MOGROUP, B.FC_MEDIC_NAME, b.kartid'
      '')
    Optimize = False
    Variables.Data = {0300000001000000060000003A4144504944030000000000000000000000}
    CountAllRecords = True
    CommitOnPost = False
    Session = dmMain.os
    Left = 260
    Top = 52
  end
end
