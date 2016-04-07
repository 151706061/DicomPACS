object frmSetStreet: TfrmSetStreet
  Left = 457
  Top = 235
  BorderStyle = bsNone
  ClientHeight = 288
  ClientWidth = 293
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grListRaion: TcxGrid
    Left = 0
    Top = 0
    Width = 293
    Height = 288
    Align = alClient
    TabOrder = 0
    object tvList: TcxGridDBTableView
      OnKeyDown = tvListKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvListCellDblClick
      DataController.DataSource = dsAdr
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      OptionsView.Indicator = True
      object tvListPreffix: TcxGridDBColumn
        DataBinding.FieldName = 'FC_PREFFIX'
        Width = 57
      end
      object tvListName: TcxGridDBColumn
        DataBinding.FieldName = 'FC_NAME'
        Width = 222
      end
    end
    object grListRaionLevel1: TcxGridLevel
      GridView = tvList
    end
  end
  object odsAdr: TOracleDataSet
    SQL.Strings = (
      'select fk_id, -- '#1091#1083#1080#1094#1099
      '       fc_name, '
      '       fc_short_name, '#39#39' as fc_adr,'
      '       instr(upper(to_char(fc_name)), upper(:p)) as sub,'
      '       upper(fc_name) as fc_name_up, fc_preffix, '
      '       1 as fl_type,'
      '       0 as fn_cost,'
      '       0 as fk_raionid'
      '  from taxi.tstreet '
      ' where fl_del = 0'
      
        '     and ((upper(fc_name) like upper('#39'%'#39'||:p||'#39'%'#39')) or (upper(fc' +
        '_short_name) like upper('#39'%'#39'||:p||'#39'%'#39')))'
      '     and fl_showinfromwhere = 1'
      'union all'
      'select fk_id, -- '#1084#1077#1089#1090#1072
      
        '       decode(fc_adr, null, fc_name, fc_name||'#39'('#39'||fc_adr||'#39')'#39') ' +
        'as fc_name,'
      '       '#39#39' as fc_short_name, fc_adr,'
      '       instr(upper(to_char(fc_name)), upper(:p)) as sub,'
      '       upper(fc_name) as fc_name_up, '#39#1084#1077#1089#1090#1086#39' as fc_preffix, '
      '       2 as fl_type,'
      '       0 as fn_cost,'
      '       fk_raionid'
      '  from taxi.ts_org'
      ' where fl_del = 0 '
      '     and upper(fc_name) like upper('#39'%'#39'||:p||'#39'%'#39')'
      'union all'
      'select fk_id, -- '#1089#1090#1086#1103#1085#1082#1080
      '       fc_name, '
      '       '#39#39' as fc_short_name, '#39#39' as fc_adr,'
      '       instr(upper(to_char(fc_name)), upper(:p)) as sub,   '
      
        '       upper(fc_name) as fc_name_up, '#39#1057#1090#1086#1103#1085#1082#1072' '#39'||decode(fl_plat,' +
        ' 1, '#39#1087#1083#1072#1090#1085#1072#1103#39', null) as fc_preffix, '
      '       3 as fl_type,'
      '       fn_cost,'
      '       fk_raionid'
      '  from taxi.ts_places'
      ' where fl_del = 0'
      '     and upper(fc_name) like upper('#39'%'#39'||:p||'#39'%'#39')'
      'union all'
      'select fk_id, -- '#1084#1077#1078#1075#1086#1088#1086#1076
      '       fc_name,'
      '       '#39#39' as fc_short_name, '#39#39' as fc_adr,     '
      '       instr(upper(to_char(fc_name)), upper(:p)) as sub,   '
      '       upper(fc_name) as fc_name_up, '#39#1084'/'#1075#39' as fc_preffix, '
      '       4 as fl_type,'
      '       0 as fn_cost,'
      '       fk_raionid'
      '  from taxi.ts_mg'
      ' where fl_del = 0'
      '   and upper(fc_name) like upper('#39'%'#39'||:p||'#39'%'#39')         '
      ''
      'order by sub, fc_name'
      '')
    Optimize = False
    Variables.Data = {0300000001000000020000003A50050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A00000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F4E414D455F55500100000000000A000000
      46435F5052454646495801000000000007000000464C5F545950450100000000
      0007000000464E5F434F53540100000000000A000000464B5F5241494F4E4944
      0100000000000D00000046435F53484F52545F4E414D45010000000000060000
      0046435F41445201000000000003000000535542010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 216
    Top = 120
  end
  object dsAdr: TDataSource
    DataSet = odsAdr
    Left = 176
    Top = 120
  end
  object odsStreet: TOracleDataSet
    SQL.Strings = (
      'select fk_id, -- '#1091#1083#1080#1094#1099
      '       fc_name, '
      '       fc_short_name, '#39#39' as fc_adr,'
      '       instr(upper(to_char(fc_name)), upper(:p)) as sub,'
      '       upper(fc_name) as fc_name_up, fc_preffix, '
      '       1 as fl_type,'
      '       0 as fn_cost,'
      '       0 as fk_raionid'
      '  from taxi.tstreet '
      ' where fl_del = 0'
      
        '     and ((upper(fc_name) like upper('#39'%'#39'||:p||'#39'%'#39')) or (upper(fc' +
        '_short_name) like upper('#39'%'#39'||:p||'#39'%'#39')))'
      '     and fl_showinfromwhere = 1'
      ''
      'order by sub, fc_name'
      '')
    Optimize = False
    Variables.Data = {0300000001000000020000003A50050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A00000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F4E414D455F55500100000000000A000000
      46435F5052454646495801000000000007000000464C5F545950450100000000
      0007000000464E5F434F53540100000000000A000000464B5F5241494F4E4944
      0100000000000D00000046435F53484F52545F4E414D45010000000000060000
      0046435F41445201000000000003000000535542010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 216
    Top = 64
  end
  object odsAll: TOracleDataSet
    SQL.Strings = (
      'select fk_id, -- '#1091#1083#1080#1094#1099
      '       fc_name, '
      '       fc_short_name, '#39#39' as fc_adr,'
      '       instr(upper(to_char(fc_name)), upper(:p)) as sub,'
      '       upper(fc_name) as fc_name_up, fc_preffix, '
      '       1 as fl_type,'
      '       0 as fn_cost,'
      '       0 as fk_raionid'
      '  from taxi.tstreet '
      ' where fl_del = 0'
      
        '     and ((upper(fc_name) like upper('#39'%'#39'||:p||'#39'%'#39')) or (upper(fc' +
        '_short_name) like upper('#39'%'#39'||:p||'#39'%'#39')))'
      '     and fl_showinfromwhere = 1'
      'union all'
      'select fk_id, -- '#1084#1077#1089#1090#1072
      
        '       decode(fc_adr, null, fc_name, fc_name||'#39'('#39'||fc_adr||'#39')'#39') ' +
        'as fc_name,'
      '       '#39#39' as fc_short_name, fc_adr,'
      '       instr(upper(to_char(fc_name)), upper(:p)) as sub,'
      '       upper(fc_name) as fc_name_up, '#39#1084#1077#1089#1090#1086#39' as fc_preffix, '
      '       2 as fl_type,'
      '       0 as fn_cost,'
      '       fk_raionid'
      '  from taxi.ts_org'
      ' where fl_del = 0 '
      '     and upper(fc_name) like upper('#39'%'#39'||:p||'#39'%'#39')'
      'union all'
      'select fk_id, -- '#1089#1090#1086#1103#1085#1082#1080
      '       fc_name, '
      '       '#39#39' as fc_short_name, '#39#39' as fc_adr,'
      '       instr(upper(to_char(fc_name)), upper(:p)) as sub,   '
      
        '       upper(fc_name) as fc_name_up, '#39#1057#1090#1086#1103#1085#1082#1072' '#39'||decode(fl_plat,' +
        ' 1, '#39#1087#1083#1072#1090#1085#1072#1103#39', null) as fc_preffix, '
      '       3 as fl_type,'
      '       fn_cost,'
      '       fk_raionid'
      '  from taxi.ts_places'
      ' where fl_del = 0'
      '     and upper(fc_name) like upper('#39'%'#39'||:p||'#39'%'#39')'
      'union all'
      'select fk_id, -- '#1084#1077#1078#1075#1086#1088#1086#1076
      '       fc_name,'
      '       '#39#39' as fc_short_name, '#39#39' as fc_adr,     '
      '       instr(upper(to_char(fc_name)), upper(:p)) as sub,   '
      '       upper(fc_name) as fc_name_up, '#39#1084'/'#1075#39' as fc_preffix, '
      '       4 as fl_type,'
      '       0 as fn_cost,'
      '       fk_raionid'
      '  from taxi.ts_mg'
      ' where fl_del = 0'
      '   and upper(fc_name) like upper('#39'%'#39'||:p||'#39'%'#39')         '
      ''
      'order by sub, fc_name'
      '')
    Optimize = False
    Variables.Data = {0300000001000000020000003A50050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A00000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F4E414D455F55500100000000000A000000
      46435F5052454646495801000000000007000000464C5F545950450100000000
      0007000000464E5F434F53540100000000000A000000464B5F5241494F4E4944
      0100000000000D00000046435F53484F52545F4E414D45010000000000060000
      0046435F41445201000000000003000000535542010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 216
    Top = 16
  end
end
