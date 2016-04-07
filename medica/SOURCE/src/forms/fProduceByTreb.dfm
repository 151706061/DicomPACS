object fmProduceByTreb: TfmProduceByTreb
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074' '#1087#1086' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1102
  ClientHeight = 397
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 41
    Align = alClient
    Caption = ' '#1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '
    TabOrder = 0
    Height = 356
    Width = 661
    object grTrebMedic: TcxGrid
      Left = 2
      Top = 18
      Width = 657
      Height = 336
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object grTrebMedicDBTableView1: TcxGridDBTableView
        OnDblClick = grTrebMedicDBTableView1DblClick
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsTrebMedic
        DataController.KeyFieldNames = 'FK_ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = #1057#1090#1088#1086#1082': 0'
            Kind = skCount
            Column = grTrebMedicDBTableView1_FC_MEDIC
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.AlwaysShowEditor = True
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnSorting = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Editing = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = dmMain.cxStyleGridEvenRow
        Styles.ContentOdd = dmMain.cxStyleGridOddRow
        Styles.Selection = dmMain.cxStyleGridSelectedRow
        object grTrebMedicDBTableView1_FC_MEDIC: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_MEDIC'
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Grouping = False
          Width = 450
        end
        object grTrebMedicDBTableView1_FC_NAME_LAT: TcxGridDBColumn
          Caption = #1051#1072#1090'. '#1085#1072#1079#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'FC_NAME_LAT'
          Visible = False
        end
        object grTrebMedicDBTableView1_FC_EDIZM: TcxGridDBColumn
          Caption = #1045#1076'. '#1080#1079#1084'.'
          DataBinding.FieldName = 'FC_EDIZM'
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Grouping = False
          Width = 60
        end
        object grTrebMedicDBTableView1_FN_KOL: TcxGridDBColumn
          Caption = #1050#1086#1083'-'#1074#1086
          DataBinding.FieldName = 'FN_KOL'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.AssignedValues.MinValue = True
          Properties.ImmediatePost = True
          Properties.MaxValue = 999999999.000000000000000000
          Properties.ValueType = vtFloat
          Options.Editing = False
          Options.Filtering = False
          Options.Grouping = False
          Width = 51
        end
        object grTrebMedicDBTableView1_fn_amount: TcxGridDBColumn
          Caption = #1048#1079#1075#1086#1090'. '#1082#1086#1083'-'#1074#1086
          DataBinding.FieldName = 'fn_amount'
          Options.Editing = False
          Width = 82
        end
        object grTrebMedicDBTableView1_FD_CREATE: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
          DataBinding.FieldName = 'FD_CREATE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DateButtons = []
          Properties.Kind = ckDateTime
          Properties.ReadOnly = True
          Visible = False
        end
        object grTrebMedicDBTableView1_FK_CREATE_MO_ID: TcxGridDBColumn
          Caption = #1050#1090#1086' '#1089#1086#1079#1076#1072#1083
          DataBinding.FieldName = 'FK_CREATE_MO_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'MOID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmMain.dsMO
          Visible = False
        end
        object grTrebMedicDBTableView1_FD_EDIT: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          DataBinding.FieldName = 'FD_EDIT'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.DateButtons = []
          Properties.Kind = ckDateTime
          Properties.ReadOnly = True
          Visible = False
        end
        object grTrebMedicDBTableView1_FK_EDIT_MO_ID: TcxGridDBColumn
          Caption = #1050#1090#1086' '#1074#1085#1077#1089' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          DataBinding.FieldName = 'FK_EDIT_MO_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'MOID'
          Properties.ListColumns = <
            item
              FieldName = 'FC_NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dmMain.dsMO
          Properties.ReadOnly = True
          Visible = False
        end
        object grTrebMedicDBTableView1_fk_tkartcomposid: TcxGridDBColumn
          DataBinding.FieldName = 'fk_tkartcomposid'
          Visible = False
          VisibleForCustomization = False
        end
        object grTrebMedicDBTableView1_FK_TREBID: TcxGridDBColumn
          DataBinding.FieldName = 'FK_TREBID'
          Visible = False
          VisibleForCustomization = False
        end
        object grTrebMedicDBTableView1_FK_ID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'FK_ID'
          Visible = False
          Width = 70
        end
      end
      object grTrebMedicLevel1: TcxGridLevel
        GridView = grTrebMedicDBTableView1
      end
    end
  end
  object paButtons: TPanel
    Left = 0
    Top = 0
    Width = 661
    Height = 41
    Align = alTop
    TabOrder = 1
    object buSign: TcxButton
      Left = 9
      Top = 6
      Width = 104
      Height = 29
      Hint = #1055#1086#1076#1087#1080#1089#1072#1090#1100' '#1074#1089#1077' '#1087#1088#1086#1080#1079#1074#1077#1076#1077#1085#1085#1099#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099
      Caption = #1055#1086#1076#1087#1080#1089#1072#1090#1100
      TabOrder = 0
    end
    object buDel: TcxButton
      Left = 153
      Top = 6
      Width = 152
      Height = 29
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072' '#1074#1089#1077#1093' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1102
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086
      TabOrder = 1
      OnClick = buDelClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFF00009A
        00009AE9EDD8DFACBC99566D953756A5306AA72D6C973757995369E0A5BFE4EA
        D100009A00009AFFFFFF00009A174AFD174AFD00009AB25F98AF5AAC9E579799
        5A8D995D8DA05C95AE5BABB85E9E00009A174AFD174AFD00009AFFFFFF00009A
        174AFD174AFD00009A77155C94327C983C869A2D8893218078115800009A174A
        FD174AFD00009AFFFFFFFFFFFFB6BD7F00009A174AFD103BF400009AFFD9FFFF
        E2FFFCB2FFEE84FF00009A103BF4174AFD00009ABAC086FFFFFFFFFFFFEE6CBC
        96147F00009A1A4CFF103BF400009AEFB8F6E196E900009A103BF41A4CFF0000
        9AA10092ED71B8FFFFFFFFFFFFCFC296B343A1CF2FB500009A1A4CFF103BF400
        009A00009A103BF41A4CFF00009AA70992BD32ADCEC596FFFFFFFFFFFFFFFFFF
        DD96ADA01F7FF649E900009A1D50FF103DFB103DFB1D50FF00009AC027AFAA01
        91DB9BACFFFFFFFFFFFFFFFFFFFFFFFFF8FFECE635B6C67E94FFB8FF00009A13
        42FF1342FF00009AEE8FD3BF6695DE46A3F9FFEEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFDFE9C5CA6F8500009A214CF81A4CFF1A4CFF214CF800009AE25FBDDCED
        BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00009A2E5BF9174AFD00
        009A00009A174AFD2E5BF900009AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF00009A3664FA386BFF00009AFCFF9FEEF18B00009A386BFF3664FA0000
        9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00009A4071FA4071FA00009AB3973EC3
        B65DBEAF57B2983C00009A4071FA4071FA00009AFFFFFFFFFFFFFFFFFF00009A
        174AFD497AFC00009AFFFFFF927525897838857639917124FFFFFF00009A497A
        FC174AFD00009AFFFFFF00009A174AFD174AFD00009AFFFFFFFFFFFF896D1C6E
        5C1F6D5C20886919FFFFFFFFFFFF00009A174AFD174AFD00009AFFFFFF00009A
        00009AFFFFFFFFFFFFF8F6FAEFD76DF5F5B2EFEEB0EFD773F7F5F7FFFFFFFFFF
        FF00009A00009AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF9FAD1BD7DBB
        A44CB69B46CDB87BFAF8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object buProduceMedic: TcxButton
      Left = 329
      Top = 6
      Width = 128
      Height = 29
      Hint = #1055#1077#1088#1077#1087#1088#1086#1080#1079#1074#1077#1089#1090#1080' '#1074#1089#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099' '#1080#1079' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103
      Caption = #1055#1077#1088#1077#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086
      TabOrder = 2
      OnClick = buProduceMedicClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFDFB2C1975368A44269AD3877A34167986068BDB59D95
        8161A58F669C8661AFA08BECEBE9FFFFFFFFFFFFFFFFFFFFFFFFA3558698458D
        8D41818C447C904482A36088E7D49BFFF5CDFBEBC0F4E2B6DCC4929D845BFFFF
        FFFFFFFFFFFFFFFFFFFF67044EAC3DA2C375B5C675BBBA45B6B24297F6E6A7F7
        E8C2ECD9AFDFCA9EDCC899A18556FFFFFFFFFFFFFFFFFFFFFFFFE68AF8F4C0FB
        FED5FFF6BBFEDB7EEFC866B4E5CD87F3E3C0E1CBA4CFB484C3A8748E6F3EFFFF
        FFC5D4E2C8DAEAFFFFFFFE5FFFFC95FCF4B2FEE7A6F0E170F4DD53C5D9BF6EEF
        DEBDD8C098C0A16DAE8F5B7F6030FFFFFF73BDF694D1FCFFFAF8F94BF3FF83FF
        FDA3FFF9A7FBFB71FFE547C9CCB25FF4E4C1EDDAB1DCC698B99B6B704914B3DB
        FA62C0FF6DC0FEBDDDF2D17AA6FFC1FFFFBDFFFFB9FFFFA8FFEC9CBFF1E1A2FD
        EEC7F7E7BEF4E4B9F7E3B37959348EEEFF85D8FF61BFFF78C3F9C4787EFF9DFF
        FFA6FFFFA6FFFF94FFD46FB2B69245F8E7C0EDD8AFD1B38196703E68A3B5B8FF
        FF91EDFF92CEF3F9F6F5DAD8BCC7A998FFB5F2FFBBEEF99BE8B99F78C89954FF
        F7DFEDD5AFA57B45605E479EFFFF85ECFDBBD1DBFBF8F6FFFFFFFFFFFFAE9649
        E2E185F0EE84C5C062A78D43BE9250F7E4C9DBC09C8B6E464BB2DD6FE2FFD6E3
        EDFFFFFFFFFFFFFFFFFFFFFFFFF0E6D18B7326A997478C7224FFFFFFA39FC666
        66C54A4DC60000681B3A7EF1FAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E9D7
        725A14746326755A12FFFFFA969AF38689FD676CF5000075110C50FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0E3C5E6DA80D6D49AE3D273FFFAE49FA2F53D
        41E83339DF393DE12B2F9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EADA
        CCB971B89F49CDB677F9F5EBEEEFFF6367E24549E75257E5BABBEDFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object odsTrebMedic: TOracleDataSet
    SQL.Strings = (
      'SELECT D.FK_ID, D.FK_MEDICID, D.FN_KOL, D.FK_TREBID,'
      '       M.FC_NAME AS FC_MEDIC,'
      '       E.FC_NAME AS FC_EDIZM,'
      '       nvl(produce.fn_amount,0) as fn_amount,'
      '       produce.fk_tkartcomposid'
      ''
      'FROM MED.TTREB_DPC D, MED.TMEDIC M, MEd.TEI E,'
      
        '    (select max(kc.fn_amount) as fn_amount, ki.fk_treb_dpc_id, k' +
        'i.fk_tkartcomposid '
      '     from MED.TKARTCO_ITEM ki, MED.TKARTCOMPOS KC '
      
        '     where kc.fk_treb_id = :FK_TREBID and kc.fk_id = ki.fk_tkart' +
        'composid'
      '     group by ki.fk_treb_dpc_id, ki.fk_tkartcomposid) produce'
      ''
      'WHERE D.FK_TREBID = :FK_TREBID'
      '  AND M.MEDICID = D.FK_MEDICID'
      '  AND M.EIID = E.EIID (+)'
      '  AND D.FK_ID = produce.FK_TREB_DPC_ID(+)'
      ''
      'ORDER BY LOWER(M.FC_NAME)')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A464B5F54524542494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000001100000006000000524F574E554D01000000000005000000464B5F49
      4401000000000009000000464B5F5452454249440100000000000A000000464B
      5F4D45444943494401000000000006000000464E5F4B4F4C0100000000000800
      000046435F4D454449430100000000000800000046435F4544495A4D01000000
      000008000000464B5F4450434944010000000000060000004B41525449440100
      0000000009000000464E5F4B4F4C4F535401000000000010000000464B5F4E41
      5A4D45444C4543485F49440100000000000F000000464B5F4352454154455F4D
      4F5F49440100000000000900000046445F4352454154450100000000000D0000
      00464B5F454449545F4D4F5F49440100000000000700000046445F4544495401
      00000000000A000000464E5F4B4F4C5F4F4C440100000000000B00000046435F
      4E414D455F4C4154010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 44
    Top = 62
  end
  object dsTrebMedic: TDataSource
    DataSet = odsTrebMedic
    Left = 44
    Top = 106
  end
  object odsTreb: TOracleDataSet
    SQL.Strings = (
      'select '
      
        '  t.fk_id, t.fd_date, t.fk_mogroupid_from, t.fk_mogroupid_to, t.' +
        'FK_MOFROMID, t.FK_MOTOID, t.FL_RPO, t.fk_DPID'
      'from med.ttreb t'
      'where t.fk_id = :pTrebID')
    Optimize = False
    Variables.Data = {
      0300000001000000080000003A50545245424944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000150000000700000046445F444154410100000000000900000046435F
      554544495A4D01000000000005000000464B5F49440100000000000A00000046
      4B5F4D4544494349440100000000000700000046435F4E414D45010000000000
      09000000464E5F414D4F554E5401000000000006000000524F574E554D010000
      0000000E000000464E5F50524943455F464F525F310100000000000800000046
      4E5F53554D4D410100000000000B000000464E5F4E414348454E4B4101000000
      00000A000000464E5F554348454E4B4101000000000013000000464E5F414D4F
      554E545F504F4C554348454E4F01000000000018000000464E5F53554D4D415F
      464F525F494E4752494449454E54530100000000000900000046435F53455249
      414C01000000000008000000504F44504953414E01000000000009000000464E
      5F4E554D4245520100000000000F000000464E5F465041434B494E555041434B
      01000000000007000000464C5F4544495401000000000010000000464E5F5355
      4D4D415F5452554E4345440100000000000B000000464B5F444F435F50524948
      0100000000000B000000464B5F444F435F52415348010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 248
    Top = 112
  end
  object odsComplexMedics: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '    MC.FK_MEDICITEM AS TMEDICOMPLEX_FK_MEDICITEM,'
      '    MC.FK_MEDICCOMPLEXID,'
      '    MC.FL_TARA,'
      '    M.MEDICID,'
      '    M.FC_NAME AS FC_MEDICNAME,'
      '    TEI.FC_NAME AS FC_UEDIZM,'
      
        '    MC.FN_AMOUNT AS FN_AMOUNT_FOR1, -- '#1082#1086#1083'-'#1074#1086' '#1076#1083#1103' 1-'#1086#1081' '#1087#1086#1088#1094#1080#1080' '#1080#1083 +
        #1080' '#1096#1090#1091#1082#1080
      
        '    case when :tkartcompos_fn_amount>=0 then MC.FN_AMOUNT * :tka' +
        'rtcompos_fn_amount else MC.FN_AMOUNT end FN_AMOUNT -- '#1082#1086#1083'-'#1074#1086' '#1076#1083#1103 +
        ' N-'#1086#1081' '#1087#1086#1088#1094#1080#1081' '#1080#1083#1080' '#1096#1090#1091#1082
      '    '
      '  FROM'
      '    MED.TMEDIC M,'
      '    MED.TEI,'
      '    MED.TMEDICOMPLEX MC'
      '  WHERE MC.FK_MEDIC = :FK_MEDIC'
      '    AND MC.FK_MEDICITEM = M.MEDICID'
      '    AND M.EIID = TEI.EIID (+)'
      'ORDER BY MC.FN_ORDER ')
    Optimize = False
    Variables.Data = {
      0300000002000000090000003A464B5F4D454449430300000000000000000000
      00160000003A544B415254434F4D504F535F464E5F414D4F554E540400000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000009000000464E5F414D4F554E540100000000000C00000046
      435F4D454449434E414D4501000000000019000000544D454449434F4D504C45
      585F464B5F4D454449434954454D0100000000000E000000464E5F414D4F554E
      545F464F52310100000000000900000046435F554544495A4D01000000000007
      0000004D454449434944010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 248
    Top = 160
  end
  object odsIngrOst: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '    OST.*,'
      '    K.fd_goden,'
      '    NVL(M.FC_NAME,'#39#39') as MEDIC_NAME'
      'from MED.VMEDKART_KOLOST OST, MED.TKART K, MED.TMEDIC M'
      'where --OST.MEDICID = :MEDICID'
      '--  AND '
      '      OST.KARTID = K.kartid(+)'
      '  AND OST.MEDICID = M.MEDICID(+)'
      '  AND OST.FN_KOLOST > 0'
      '  AND OST.FN_OST_TYPE = 0'
      '  AND ((K.Fd_Goden is null)or(K.Fd_Goden >= :PPRODUCE_DATE))'
      
        'ORDER BY K.fd_goden asc, K.FN_PARTY_NUM asc  -- '#1080#1084#1077#1085#1085#1086' '#1087#1086' '#1074#1086#1079#1088#1072#1089 +
        #1090#1072#1085#1080#1102' '#1089#1088#1086#1082#1072' '#1075#1086#1076#1085#1086#1089#1090#1080
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000E0000003A5050524F445543455F444154450C0000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000009000000060000004B4152544944010000000000070000004D454449
      4349440100000000000F000000464E5F465041434B494E555041434B01000000
      000008000000464E5F505249434501000000000009000000464E5F4B4F4C4F53
      540100000000000800000046445F474F44454E0100000000000A0000004D4544
      49435F4E414D450100000000000B000000464E5F4F53545F5459504501000000
      0000050000004450434944010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 246
    Top = 214
  end
  object odsCheckProduce: TOracleDataSet
    SQL.Strings = (
      
        'SELECT kc.fk_id as KARTCOMPOS_id, ki.fk_id as KARTCO_ITEM_id, ki' +
        '.fn_amount'
      ''
      'FROM MED.TKARTCO_ITEM ki, med.TKARTCOMPOS kc'
      ''
      'WHERE kc.fk_treb_id = :FK_TREBID'
      '  and kc.fk_id = ki.fk_tkartcomposid'
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A464B5F54524542494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000001100000006000000524F574E554D01000000000005000000464B5F49
      4401000000000009000000464B5F5452454249440100000000000A000000464B
      5F4D45444943494401000000000006000000464E5F4B4F4C0100000000000800
      000046435F4D454449430100000000000800000046435F4544495A4D01000000
      000008000000464B5F4450434944010000000000060000004B41525449440100
      0000000009000000464E5F4B4F4C4F535401000000000010000000464B5F4E41
      5A4D45444C4543485F49440100000000000F000000464B5F4352454154455F4D
      4F5F49440100000000000900000046445F4352454154450100000000000D0000
      00464B5F454449545F4D4F5F49440100000000000700000046445F4544495401
      00000000000A000000464E5F4B4F4C5F4F4C440100000000000B00000046435F
      4E414D455F4C4154010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 44
    Top = 174
  end
  object ActionList1: TActionList
    Images = dmMain.ilMain
    OnUpdate = ActionList1Update
    Left = 320
    Top = 200
    object acSign: TAction
      Caption = #1055#1086#1076#1087#1080#1089#1072#1090#1100
      Hint = 
        #1055#1086#1076#1087#1080#1089#1072#1090#1100' '#1074#1089#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099', '#1091#1095#1072#1089#1090#1074#1091#1102#1097#1080#1077' '#1074' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1077' '#1080' '#1086#1090#1087#1091#1089#1082#1077' '#1090#1088 +
        #1077#1073#1086#1074#1072#1085#1080#1103
      ImageIndex = 47
      OnExecute = acSignExecute
    end
    object acUnsign: TAction
      Caption = #1054#1090#1084'. '#1087#1086#1076#1087#1080#1089#1100
      Hint = 
        #1054#1090#1084#1077#1085#1080#1090#1100' '#1087#1086#1076#1087#1080#1089#1100' '#1091' '#1074#1089#1077#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074', '#1091#1095#1072#1089#1090#1074#1091#1102#1097#1080#1093' '#1074' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1077' '#1080 +
        ' '#1086#1090#1087#1091#1089#1082#1077' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103'.'#13#10#1052#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099', '#1087#1086#1083#1091#1095#1077#1085#1085#1099#1077' '#1087#1088#1080' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1077' '#1073 +
        #1091#1076#1091#1090' '#1091#1076#1072#1083#1077#1085#1099'.'
      ImageIndex = 68
      OnExecute = acUnsignExecute
    end
  end
  object odsKARTCOMPOS: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '    FK_ID,'
      '    FD_DATA,'
      '    FK_MEDICID,'
      '    FC_NAME,'
      '    FC_SERIAL,'
      '    FC_UEDIZM, '
      '    FN_NUMBER,'
      '    FN_AMOUNT,'
      '    FN_FPACKINUPACK,'
      '    FN_PRICE_FOR_1,'
      '    FN_SUMMA_TRUNCED,'
      '    FN_SUMMA,'
      '    FN_SUMMA_FOR_INGRIDIENTS,'
      '    CASE WHEN FN_SUMMA_TRUNCED<=FN_SUMMA'
      '     THEN FN_SUMMA-FN_SUMMA_TRUNCED'
      '     ELSE 0 end FN_UCHENKA,'
      '    CASE WHEN FN_SUMMA_TRUNCED>FN_SUMMA'
      '     THEN FN_SUMMA_TRUNCED-FN_SUMMA'
      '     ELSE 0 end FN_NACHENKA,'
      '    FN_AMOUNT AS FN_AMOUNT_POLUCHENO,'
      '    FL_EDIT,'
      '    DECODE(FL_EDIT,0,'#39#1044#1072#39',1,'#39#1053#1077#1090#39') AS PODPISAN,'
      '    fk_doc_prih,'
      '    fk_doc_rash,'
      '    FD_GODEN_DO,'
      '    FL_USE_TARA,'
      '    FK_PRODUCE_TYPE'
      'FROM'
      '('
      'SELECT'
      '    ROWNUM,'
      '    FK_ID,'
      '    FD_DATA,'
      '    FK_MEDICID,'
      '    FC_NAME,'
      '    FC_SERIAL,'
      '    FC_UEDIZM,'
      '    FN_NUMBER, '
      '    FN_AMOUNT,'
      '    FN_FPACKINUPACK,'
      ''
      '    DETAIL2.FN_SUMMA_FOR_INGRIDIENTS,'
      
        '    Round(DETAIL2.FN_SUMMA_FOR_INGRIDIENTS/FN_AMOUNT,2) AS FN_PR' +
        'ICE_FOR_1,'
      
        '    Round(DETAIL2.FN_SUMMA_FOR_INGRIDIENTS/FN_AMOUNT,2)*FN_AMOUN' +
        'T AS FN_SUMMA_TRUNCED, -- '#1054#1050#1056#1059#1043#1051#1045#1053#1053#1040#1071
      '    FN_SUMMA_FOR_INGRIDIENTS AS FN_SUMMA,'
      '    FL_EDIT,'
      '    fk_doc_prih,'
      '   fk_doc_rash,'
      '   FD_GODEN_DO,'
      '   FL_USE_TARA,'
      '   FK_PRODUCE_TYPE'
      '  FROM'
      '   ('
      'SELECT'
      '    ROWNUM,'
      '    KS.FK_ID,'
      '    KS.FD_DATA,'
      '    KS.FK_MEDICID,'
      '    M.FC_NAME,'
      '    KS.FC_SERIAL,'
      '    TEI.FC_NAME AS FC_UEDIZM, '
      '    KS.FN_NUMBER,'
      '    KS.FN_AMOUNT,'
      '    M.FN_FPACKINUPACK,'
      '    KS.FL_EDIT,'
      '    KS.fk_doc_prih,'
      '    KS.fk_doc_rash,'
      '    KS.FD_GODEN_DO,'
      '    KS.FL_USE_TARA,'
      '    KS.FK_PRODUCE_TYPE'
      '        '
      '  FROM MED.TKARTCOMPOS KS, MED.TMEDIC M, MED.TEI'
      '  WHERE KS.FK_MEDICID=M.MEDICID (+)'
      '    AND KS.FK_TREB_ID = :PFK_TREB_ID'
      '    AND M.EIID = TEI.EIID (+)'
      '  ORDER BY ROWNUM'
      '   )MASTER2,'
      '   ('
      'SELECT  '
      '    FK_TKARTCOMPOSID,'
      '    SUM(FN_SUMMA) AS FN_SUMMA_FOR_INGRIDIENTS'
      '  FROM  '
      '(SELECT'
      '        K_ITEM.FK_TKARTCOMPOSID,'
      '        K_ITEM.FK_KART_ITEM,'
      '        K_ITEM.FN_AMOUNT,'
      '        k.FN_PRICE,'
      
        '        k.FN_PRICE * k_item.FN_AMOUNT AS FN_SUMMA               ' +
        ' '
      '      FROM'
      '        MED.TKARTCO_ITEM K_ITEM,'
      '        MED.TKARTCOMPOS KS, med.tkart k'
      '      WHERE KS.FK_ID=K_ITEM.FK_TKARTCOMPOSID'
      '       and k_item.fk_kart_item = k.kartid'
      '       AND KS.FK_TREB_ID = :PFK_TREB_ID'
      ')  '
      'GROUP BY FK_TKARTCOMPOSID  '
      '   ) DETAIL2'
      '  WHERE MASTER2.FK_ID = DETAIL2.FK_TKARTCOMPOSID(+)'
      ')  '
      'ORDER BY FD_DATA ASC')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A50464B5F545245425F49440300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000150000000700000046445F444154410100000000000900000046435F
      554544495A4D01000000000005000000464B5F49440100000000000A00000046
      4B5F4D4544494349440100000000000700000046435F4E414D45010000000000
      09000000464E5F414D4F554E5401000000000006000000524F574E554D010000
      0000000E000000464E5F50524943455F464F525F310100000000000800000046
      4E5F53554D4D410100000000000B000000464E5F4E414348454E4B4101000000
      00000A000000464E5F554348454E4B4101000000000013000000464E5F414D4F
      554E545F504F4C554348454E4F01000000000018000000464E5F53554D4D415F
      464F525F494E4752494449454E54530100000000000900000046435F53455249
      414C01000000000008000000504F44504953414E01000000000009000000464E
      5F4E554D4245520100000000000F000000464E5F465041434B494E555041434B
      01000000000007000000464C5F4544495401000000000010000000464E5F5355
      4D4D415F5452554E4345440100000000000B000000464B5F444F435F50524948
      0100000000000B000000464B5F444F435F52415348010000000000}
    Cursor = crSQLWait
    Session = dmMain.os
    Left = 40
    Top = 256
  end
  object odsCheckSign: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '  kc.KARTCOMPOS_count, kc.max_fl_edit,'
      
        '  tdp.med_treb_count, td.fk_treb_id, td.fk_dpid, td.fl_rpo, td.d' +
        'pid, td.fl_edit,'
      '  k.n'
      ''
      
        'FROM (select count(fk_id) as KARTCOMPOS_count, max(fl_edit) as m' +
        'ax_fl_edit from med.TKARTCOMPOS where fk_treb_id = :pFK_TREBID) ' +
        'kc, '
      
        '     (select max(t.fk_dpid) as fk_dpid, max(t.fk_id) as fk_treb_' +
        'id,  max(t.fl_rpo) as fl_rpo, max(d.dpid) as dpid, max(d.fl_edit' +
        ') as fl_edit from med.tdocs d, med.ttreb t WHERE t.fk_id = :pFK_' +
        'TREBID and t.FK_DPID = d.dpid(+)) td,'
      
        '     (select count(1) as med_treb_count from med.ttreb_dpc tdp1 ' +
        'where  tdp1.fk_trebid = :pFK_TREBID group by tdp1.fk_medicid) td' +
        'p,'
      '     (select count(1) as n from '
      
        '        (select dp1.kartid, sum(dp1.fn_kol) as fn_kol from med.t' +
        'dpc dp1 where dp1.dpid in (select kc1.fk_doc_prih from med.TKART' +
        'COMPOS kc1 where kc1.fk_treb_id = :pFK_TREBID and kc1.fl_edit = ' +
        '0) group by dp1.kartid'
      '         MINUS'
      
        '         select dp2.kartid, sum(dp2.fn_kol) as fn_kol from med.t' +
        'dpc dp2 where dp2.dpid in (select t2.FK_DPID from med.ttreb t2 w' +
        'here t2.fk_id = :pFK_TREBID)  group by dp2.kartid)a) k'
      '')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F545245424944030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000001100000006000000524F574E554D01000000000005000000464B5F49
      4401000000000009000000464B5F5452454249440100000000000A000000464B
      5F4D45444943494401000000000006000000464E5F4B4F4C0100000000000800
      000046435F4D454449430100000000000800000046435F4544495A4D01000000
      000008000000464B5F4450434944010000000000060000004B41525449440100
      0000000009000000464E5F4B4F4C4F535401000000000010000000464B5F4E41
      5A4D45444C4543485F49440100000000000F000000464B5F4352454154455F4D
      4F5F49440100000000000900000046445F4352454154450100000000000D0000
      00464B5F454449545F4D4F5F49440100000000000700000046445F4544495401
      00000000000A000000464E5F4B4F4C5F4F4C440100000000000B00000046435F
      4E414D455F4C4154010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = dmMain.os
    Left = 140
    Top = 174
  end
  object oqCreateRashByTreb: TOracleQuery
    SQL.Strings = (
      'declare'
      '  pDPID NUMBER;'
      '  n NUMBER;'
      ''
      '  pMO_TO NUMBER;'
      '  pMO_FROM NUMBER;'
      '  pMO_GR_TO NUMBER;'
      '  pMO_GR_FROM NUMBER;'
      '  pCur_MO NUMBER;'
      '  pCur_Mo_GR NUMBER;'
      '  pFD_DATE DATE;'
      '  '
      'begin'
      '  -- '#1073#1077#1088#1077#1084' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1077
      
        '  select max(t.fk_dpid), max(t.fd_date), max(t.fk_motoid), max(t' +
        '.fk_mofromid), max(t.fk_mogroupid_from), max(t.fk_mogroupid_to)'
      
        '    into pDPID,          pFD_DATE,       pMO_TO,           pMO_F' +
        'ROM,           pMO_GR_FROM,              pMO_GR_TO'
      '  from med.ttreb t where t.fk_id = :pFK_TREB_ID;'
      '  '
      '  pCur_MO := med.pkg_medses.get_curmo;'
      '  pCur_MO_GR := med.pkg_medses.get_cur_mogroup;  '
      '  '
      '  -- '#1087#1088#1086#1074#1077#1088#1103#1077#1084' '#1076#1086#1082#1091#1084#1077#1085#1090' - '#1074#1076#1088#1091#1075' '#1086#1085' '#1077#1089#1090#1100', '#1090#1086#1075#1076#1072' '#1077#1075#1086' '#1088#1077#1076#1072#1082#1090#1080#1088#1091#1077#1084
      
        '  select count(d.dpid) into n from med.tdocs d where d.dpid = pD' +
        'PID and d.fp_vidmove = 2 and d.fk_mogroupid_to = pMO_GR_FROM and' +
        ' d.fk_mogroupid_from = pMO_GR_TO;'
      '  if n = 0 then'
      
        '    insert into med.tdocs (moownerid, fd_data, fp_vid, fc_commen' +
        't, mofromid, '
      
        '                           motoid, fp_vidmove, fl_edit, fd_invoi' +
        'ce, fl_treb, '
      
        '                           fk_mogroupid, fk_mogroupid_to, fk_mog' +
        'roupid_from)'
      
        '    values(pCur_MO, nvl(:pDATE, sysdate), 2, '#39#1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1086#1079#1076#1072#1085' '#1072#1074 +
        #1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1087#1088#1080' '#1086#1073#1088#1072#1073#1086#1090#1082#1077' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103' '#1076#1083#1103' '#1056#1055#1054#39', pMO_TO,'
      '           pMO_FROM, 2, 1, pFD_DATE, 1,'
      
        '           pCur_MO_GR, pMO_GR_FROM, pMO_GR_TO) returning dpid in' +
        'to pDPID;'
      '  else'
      
        '    update med.tdocs d set d.fl_edit = 1 where d.dpid = pDPID;  ' +
        '          '
      '  end if;'
      '  '
      
        '  delete from med.tdpc dp where dp.dpid = pDPID;  -- '#1095#1080#1089#1090#1080#1084' '#1076#1086#1082#1091 +
        #1084#1077#1085#1090
      '  '
      '  -- '#1076#1086#1073#1072#1074#1083#1103#1077#1084' '#1074' '#1088#1072#1089#1093#1086#1076' '#1087#1086' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1102' '#1087#1088#1086#1080#1079#1074#1077#1076#1077#1085#1085#1099#1077' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099
      '  insert into med.tdpc (dpid, kartid, fn_kol, FK_TREBDPC)'
      '  select pDPID, dp.kartid, dp.fn_kol, ki.fk_treb_dpc_id '
      '   from med.TKARTCOMPOS kc, MED.TKARTCO_ITEM ki, med.tdpc dp'
      '  WHERE kc.fk_treb_id = :pFK_TREB_ID'
      '    and kc.fk_id = ki.fk_tkartcomposid'
      '    and dp.dpid = kc.fk_doc_prih'
      '  group by dp.kartid, dp.fn_kol, ki.fk_treb_dpc_id;'
      '  '
      
        '  update med.tdocs d -- '#1086#1073#1085#1086#1074#1083#1103#1077#1084' '#1088#1072#1089#1093#1086#1076' '#1087#1086' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1102' - '#1087#1086#1076#1087#1080#1089#1099 +
        #1074#1072#1077#1084', '#1089#1090#1072#1074#1080#1084' '#1085#1086#1084#1077#1088' ('#1077#1089#1083#1080' '#1077#1075#1086' '#1085#1077#1090'), '#1087#1077#1088#1077#1089#1095#1080#1090#1099#1074#1072#1077#1084' '#1094#1077#1085#1091
      '  set d.fl_edit = 0,'
      
        '      d.fn_price = (select sum(dp.fn_kol*k.fn_price) from med.td' +
        'pc dp, med.tkart k where dp.dpid = d.dpid and dp.kartid = k.kart' +
        'id),'
      '      d.fc_doc = nvl(d.fc_doc, TO_CHAR(d.dpid))  '
      '  where d.dpid = pDPID;'
      '  '
      
        '  -- '#1086#1073#1085#1086#1074#1083#1103#1077#1084' '#1090#1077#1088#1073#1086#1074#1072#1085#1080#1077' - '#1089#1074#1103#1079#1099#1074#1072#1077#1084' '#1089' '#1088#1072#1089#1093#1086#1076#1086#1084' '#1087#1086' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1102' '#1080 +
        ' '#1089#1090#1072#1074#1080#1084' '#1085#1086#1084#1077#1088
      '  update med.ttreb t '
      '  set t.fk_dpid = pDPID, '
      
        '      t.fc_treb = (select max(d.fc_doc) from med.tdocs d where d' +
        '.dpid = pDPID) '
      '  where t.fk_id = :pFK_TREB_ID;'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000020000000C0000003A50464B5F545245425F49440300000000000000
      00000000060000003A50444154450C0000000000000000000000}
    Left = 138
    Top = 230
  end
  object oqDeleteRashByTreb: TOracleQuery
    SQL.Strings = (
      'begin'
      
        '  delete from med.tdocs d where d.dpid = (select t.fk_dpid from ' +
        'med.ttreb t where t.fk_id = :pFK_TREB_ID);'
      'end;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A50464B5F545245425F49440300000000000000
      00000000}
    Left = 138
    Top = 286
  end
end
