object frmDM: TfrmDM
  Left = 245
  Top = 41
  Caption = 'frmDM'
  ClientHeight = 583
  ClientWidth = 989
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dsRg1: TDataSource
    DataSet = odsRg1
    Left = 16
    Top = 8
  end
  object odsRg1: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 75)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_POPA_IZ'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 48
    Top = 8
  end
  object dsRg2: TDataSource
    DataSet = odsRg2
    Left = 16
    Top = 56
  end
  object odsRg2: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_POPA_LOCAL1'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 48
    Top = 56
  end
  object dsRg3: TDataSource
    DataSet = odsRg3
    Left = 16
    Top = 104
  end
  object odsRg3: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_POPA_STE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 48
    Top = 104
  end
  object dsRg4: TDataSource
    DataSet = odsRg4
    Left = 16
    Top = 152
  end
  object odsRg4: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_POPA_ANE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 48
    Top = 152
  end
  object dsRg5: TDataSource
    DataSet = odsRg5
    Left = 16
    Top = 200
  end
  object odsRg5: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_POPA_LOCAL2'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 48
    Top = 200
  end
  object dsRg6: TDataSource
    DataSet = odsRg6
    Left = 16
    Top = 248
  end
  object odsRg6: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_POPA_KROVO'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 48
    Top = 248
  end
  object dsRg7: TDataSource
    DataSet = odsRg7
    Left = 16
    Top = 296
  end
  object odsRg7: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_POPA_LOCAL3'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 48
    Top = 296
  end
  object dsRg8: TDataSource
    DataSet = odsRg8
    Left = 96
    Top = 9
  end
  object odsRg8: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_NPA_STE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 128
    Top = 9
  end
  object dsRg9: TDataSource
    DataSet = odsRg9
    Left = 96
    Top = 57
  end
  object odsRg9: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_NPA_ANE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 128
    Top = 57
  end
  object dsRg10: TDataSource
    DataSet = odsRg10
    Left = 96
    Top = 105
  end
  object odsRg10: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_NPA_LOCAL1'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 128
    Top = 105
  end
  object dsRg11: TDataSource
    DataSet = odsRg11
    Left = 96
    Top = 153
  end
  object odsRg11: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_NPA_KROVO'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 128
    Top = 153
  end
  object dsRg12: TDataSource
    DataSet = odsRg12
    Left = 96
    Top = 201
  end
  object odsRg12: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_NPA_LOCAL2'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 128
    Top = 201
  end
  object dsRg13: TDataSource
    DataSet = odsRg13
    Left = 96
    Top = 273
  end
  object odsRg13: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_VPA_STE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 128
    Top = 273
  end
  object dsRg14: TDataSource
    DataSet = odsRg14
    Left = 96
    Top = 321
  end
  object odsRg14: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_VPA_ANE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 128
    Top = 321
  end
  object dsRg15: TDataSource
    DataSet = odsRg15
    Left = 96
    Top = 369
  end
  object odsRg15: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_VPA_LOCAL1'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 128
    Top = 369
  end
  object dsRg16: TDataSource
    DataSet = odsRg16
    Left = 96
    Top = 417
  end
  object odsRg16: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_VPA_KROVO'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 128
    Top = 417
  end
  object dsRg17: TDataSource
    DataSet = odsRg17
    Left = 96
    Top = 465
  end
  object odsRg17: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_VPA_LOCAL2'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 128
    Top = 465
  end
  object dsRg18: TDataSource
    DataSet = odsRg18
    Left = 184
    Top = 9
  end
  object odsRg18: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_POBA_STE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 224
    Top = 9
  end
  object dsRg19: TDataSource
    DataSet = odsRg19
    Left = 184
    Top = 57
  end
  object odsRg19: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_POBA_ANE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 224
    Top = 57
  end
  object dsRg20: TDataSource
    DataSet = odsRg20
    Left = 184
    Top = 105
  end
  object odsRg20: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_POBA_LOCAL1'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 224
    Top = 105
  end
  object dsRg21: TDataSource
    DataSet = odsRg21
    Left = 184
    Top = 153
  end
  object odsRg21: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_POBA_KROVO'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 224
    Top = 153
  end
  object dsRg22: TDataSource
    DataSet = odsRg22
    Left = 184
    Top = 201
  end
  object odsRg22: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_POBA_LOCAL2'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 224
    Top = 201
  end
  object dsRg23: TDataSource
    DataSet = odsRg23
    Left = 184
    Top = 273
  end
  object odsRg23: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_PBA_STE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 224
    Top = 273
  end
  object dsRg24: TDataSource
    DataSet = odsRg24
    Left = 184
    Top = 321
  end
  object odsRg24: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_PBA_ANE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 224
    Top = 321
  end
  object dsRg25: TDataSource
    DataSet = odsRg25
    Left = 184
    Top = 369
  end
  object odsRg25: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_PBA_LOCAL1'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 224
    Top = 369
  end
  object dsRg26: TDataSource
    DataSet = odsRg26
    Left = 184
    Top = 417
  end
  object odsRg26: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_PBA_KROVO'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 224
    Top = 417
  end
  object dsRg27: TDataSource
    DataSet = odsRg27
    Left = 184
    Top = 465
  end
  object odsRg27: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_PBA_LOCAL2'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 224
    Top = 465
  end
  object dsRg28: TDataSource
    DataSet = odsRg28
    Left = 296
    Top = 9
  end
  object odsRg28: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_GBA_STE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 336
    Top = 9
  end
  object dsRg29: TDataSource
    DataSet = odsRg29
    Left = 296
    Top = 57
  end
  object odsRg29: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_GBA_ANE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 336
    Top = 57
  end
  object dsRg30: TDataSource
    DataSet = odsRg30
    Left = 296
    Top = 105
  end
  object odsRg30: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_GBA_LOCAL1'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 336
    Top = 105
  end
  object dsRg31: TDataSource
    DataSet = odsRg31
    Left = 296
    Top = 153
  end
  object odsRg31: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_GBA_KROVO'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 336
    Top = 153
  end
  object dsRg32: TDataSource
    DataSet = odsRg32
    Left = 296
    Top = 201
  end
  object odsRg32: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_GBA_LOCAL2'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 336
    Top = 201
  end
  object dsRg33: TDataSource
    DataSet = odsRg33
    Left = 296
    Top = 273
  end
  object odsRg33: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_PA_STE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 336
    Top = 273
  end
  object dsRg35: TDataSource
    DataSet = odsRg35
    Left = 296
    Top = 369
  end
  object odsRg35: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_PA_LOCAL1'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 336
    Top = 369
  end
  object dsRg36: TDataSource
    DataSet = odsRg36
    Left = 296
    Top = 417
  end
  object odsRg36: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_PA_KROVO'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 336
    Top = 417
  end
  object dsRg37: TDataSource
    DataSet = odsRg37
    Left = 296
    Top = 465
  end
  object odsRg37: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_PA_LOCAL2'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 336
    Top = 465
  end
  object dsRg38: TDataSource
    DataSet = odsRg38
    Left = 400
    Top = 9
  end
  object odsRg38: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_BA_STE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 440
    Top = 9
  end
  object dsRg39: TDataSource
    DataSet = odsRg39
    Left = 400
    Top = 105
  end
  object odsRg39: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_BA_LOCAL1'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 440
    Top = 105
  end
  object dsRg40: TDataSource
    DataSet = odsRg40
    Left = 400
    Top = 153
  end
  object odsRg40: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_BA_KROVO'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 440
    Top = 153
  end
  object dsRg41: TDataSource
    DataSet = odsRg41
    Left = 400
    Top = 201
  end
  object odsRg41: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_RIGHT_BA_LOCAL2'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 440
    Top = 201
  end
  object dsLf1: TDataSource
    DataSet = odsLf1
    Left = 536
    Top = 8
  end
  object odsLf1: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_LOPA_IZ'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 568
    Top = 8
  end
  object dsLf2: TDataSource
    DataSet = odsLf2
    Left = 536
    Top = 56
  end
  object odsLf2: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_LOPA_LOCAL1'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 568
    Top = 56
  end
  object dsLf3: TDataSource
    DataSet = odsLf3
    Left = 536
    Top = 104
  end
  object odsLf3: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_LOPA_STE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 568
    Top = 104
  end
  object dsLf4: TDataSource
    DataSet = odsLf4
    Left = 536
    Top = 152
  end
  object odsLf4: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_LOPA_ANE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 568
    Top = 152
  end
  object dsLf5: TDataSource
    DataSet = odsLf5
    Left = 536
    Top = 200
  end
  object odsLf5: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_LOPA_LOCAL2'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 568
    Top = 200
  end
  object dsLf6: TDataSource
    DataSet = odsLf6
    Left = 536
    Top = 248
  end
  object odsLf6: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_LOPA_KROVO'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 568
    Top = 248
  end
  object dsLf7: TDataSource
    DataSet = odsLf7
    Left = 536
    Top = 296
  end
  object odsLf7: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_LOPA_LOCAL3'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 568
    Top = 296
  end
  object dsLf8: TDataSource
    DataSet = odsLf8
    Left = 616
    Top = 9
  end
  object odsLf8: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_NPA_STE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 648
    Top = 9
  end
  object dsLf9: TDataSource
    DataSet = odsLf9
    Left = 616
    Top = 57
  end
  object odsLf9: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_NPA_ANE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 648
    Top = 57
  end
  object dsLf10: TDataSource
    DataSet = odsLf10
    Left = 616
    Top = 105
  end
  object odsLf10: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_NPA_LOCAL1'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 648
    Top = 105
  end
  object dsLf11: TDataSource
    DataSet = odsLf11
    Left = 616
    Top = 153
  end
  object odsLf11: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_NPA_KROVO'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 648
    Top = 153
  end
  object dsLf12: TDataSource
    DataSet = odsLf12
    Left = 616
    Top = 201
  end
  object odsLf12: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_NPA_LOCAL2'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 648
    Top = 201
  end
  object dsLf13: TDataSource
    DataSet = odsLf13
    Left = 616
    Top = 273
  end
  object odsLf13: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_VPA_STE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 648
    Top = 273
  end
  object dsLf14: TDataSource
    DataSet = odsLf14
    Left = 616
    Top = 321
  end
  object odsLf14: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_VPA_ANE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 648
    Top = 321
  end
  object dsLf15: TDataSource
    DataSet = odsLf15
    Left = 616
    Top = 369
  end
  object odsLf15: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_VPA_LOCAL1'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 648
    Top = 369
  end
  object dsLf16: TDataSource
    DataSet = odsLf16
    Left = 616
    Top = 417
  end
  object odsLf16: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_VPA_KROVO'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 648
    Top = 417
  end
  object dsLf17: TDataSource
    DataSet = odsLf17
    Left = 616
    Top = 465
  end
  object odsLf17: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_VPA_LOCAL2'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 648
    Top = 465
  end
  object dsLf18: TDataSource
    DataSet = odsLf18
    Left = 696
    Top = 9
  end
  object odsLf18: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_LOBA_STE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 736
    Top = 9
  end
  object dsLf19: TDataSource
    DataSet = odsLf19
    Left = 696
    Top = 57
  end
  object odsLf19: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_LOBA_ANE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 736
    Top = 57
  end
  object dsLf20: TDataSource
    DataSet = odsLf20
    Left = 696
    Top = 105
  end
  object odsLf20: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_LOBA_LOCAL1'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 736
    Top = 105
  end
  object dsLf21: TDataSource
    DataSet = odsLf21
    Left = 696
    Top = 153
  end
  object odsLf21: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_LOBA_KROVO'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 736
    Top = 153
  end
  object dsLf22: TDataSource
    DataSet = odsLf22
    Left = 696
    Top = 201
  end
  object odsLf22: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_LOBA_LOCAL2'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 736
    Top = 201
  end
  object dsLf23: TDataSource
    DataSet = odsLf23
    Left = 696
    Top = 273
  end
  object odsLf23: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_PBA_STE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 736
    Top = 273
  end
  object dsLf24: TDataSource
    DataSet = odsLf24
    Left = 696
    Top = 321
  end
  object odsLf24: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_PBA_ANE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 736
    Top = 321
  end
  object dsLf25: TDataSource
    DataSet = odsLf25
    Left = 696
    Top = 369
  end
  object odsLf25: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_PBA_LOCAL1'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 736
    Top = 369
  end
  object dsLf26: TDataSource
    DataSet = odsLf26
    Left = 696
    Top = 417
  end
  object odsLf26: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_PBA_KROVO'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 736
    Top = 417
  end
  object dsLf27: TDataSource
    DataSet = odsLf27
    Left = 696
    Top = 465
  end
  object odsLf27: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_PBA_LOCAL2'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 736
    Top = 465
  end
  object dsLf28: TDataSource
    DataSet = odsLf28
    Left = 792
    Top = 9
  end
  object odsLf28: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_GBA_STE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 832
    Top = 9
  end
  object dsLf29: TDataSource
    DataSet = odsLf29
    Left = 792
    Top = 57
  end
  object odsLf29: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_GBA_ANE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 832
    Top = 57
  end
  object dsLf30: TDataSource
    DataSet = odsLf30
    Left = 792
    Top = 105
  end
  object odsLf30: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_GBA_LOCAL1'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 832
    Top = 105
  end
  object dsLf31: TDataSource
    DataSet = odsLf31
    Left = 792
    Top = 153
  end
  object odsLf31: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_GBA_KROVO'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 832
    Top = 153
  end
  object dsLf32: TDataSource
    DataSet = odsLf32
    Left = 792
    Top = 201
  end
  object odsLf32: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_GBA_LOCAL2'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 832
    Top = 201
  end
  object dsLf33: TDataSource
    DataSet = odsLf33
    Left = 792
    Top = 273
  end
  object odsLf33: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_PA_STE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 832
    Top = 273
  end
  object dsLf34: TDataSource
    DataSet = odsLf34
    Left = 792
    Top = 369
  end
  object odsLf34: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_PA_LOCAL1'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 832
    Top = 369
  end
  object dsLf35: TDataSource
    DataSet = odsLf35
    Left = 792
    Top = 417
  end
  object odsLf35: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_PA_KROVO'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 832
    Top = 417
  end
  object dsLf36: TDataSource
    DataSet = odsLf36
    Left = 792
    Top = 465
  end
  object odsLf36: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_PA_LOCAL2'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 832
    Top = 465
  end
  object dsLf37: TDataSource
    DataSet = odsLf37
    Left = 888
    Top = 9
  end
  object odsLf37: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_BA_STE'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 928
    Top = 9
  end
  object dsLf38: TDataSource
    DataSet = odsLf38
    Left = 888
    Top = 105
  end
  object odsLf38: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_BA_LOCAL1'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 928
    Top = 105
  end
  object dsLf39: TDataSource
    DataSet = odsLf39
    Left = 888
    Top = 153
  end
  object odsLf39: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_BA_KROVO'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 928
    Top = 153
  end
  object dsLf40: TDataSource
    DataSet = odsLf40
    Left = 888
    Top = 201
  end
  object odsLf40: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as fk_id, trim(substr('#39#39', 1, 1)) as fc_name, 0 as fn_o' +
        'rder'
      '  from dual'
      'union all'
      'select fk_id, trim(substr(fc_name, 1, 100)) as fc_name, fn_order'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'ACNK_LEFT_BA_LOCAL2'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = frmMain.os
    Active = True
    Left = 928
    Top = 201
  end
end
