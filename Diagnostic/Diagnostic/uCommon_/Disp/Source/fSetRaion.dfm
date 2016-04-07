object frmSetRaion: TfrmSetRaion
  Left = 531
  Top = 199
  BorderStyle = bsNone
  ClientHeight = 288
  ClientWidth = 259
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object grListRaion: TcxGrid
    Left = 0
    Top = 0
    Width = 259
    Height = 288
    Align = alClient
    TabOrder = 0
    object tvList: TcxGridDBTableView
      OnKeyDown = tvListKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvListCellDblClick
      DataController.DataSource = dsRaion
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
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      OptionsView.Indicator = True
      object tvListColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'FC_NAME'
      end
    end
    object grListRaionLevel1: TcxGridLevel
      GridView = tvList
    end
  end
  object odsRaion: TOracleDataSet
    SQL.Strings = (
      'select fk_id, '
      '       fc_name, fc_shortname,'
      '       upper(fc_name) as fc_name_up,'
      '       instr(upper(to_char(fc_name)), upper(:p)) as sub,'
      '       1 as fp_type'
      '  from taxi.ts_raion'
      ' where fl_del = 0'
      
        '   and ((upper(fc_name) like upper('#39'%'#39'||:p||'#39'%'#39')) or (upper(fc_s' +
        'hortname) like upper('#39'%'#39'||:p||'#39'%'#39')))'
      'union all'
      
        'select taxi.pkg_drivergrid.GetStreetDistrict(fk_id, 0) as fk_id,' +
        ' '
      '       fc_name, fc_short_name as fc_shortname,'
      '       upper(fc_name) as fc_name_up,'
      '       instr(upper(to_char(fc_name)), upper(:p)) as sub,'
      '       2 as fp_type'
      '  from taxi.tstreet'
      ' where fl_del = 0'
      '   and fl_showinfromwhere = 0'
      
        '   and ((upper(fc_name) like upper('#39'%'#39'||:p||'#39'%'#39')) or (upper(fc_s' +
        'hort_name) like upper('#39'%'#39'||:p||'#39'%'#39')))'
      'union all'
      'select fk_raionid as fk_id,'
      '       fc_name, '#39#39' as fc_shortname,'
      '       upper(fc_name) as fc_name_up,'
      '       instr(upper(to_char(fc_name)), upper(:p)) as sub,'
      '       3 as fp_type'
      '  from taxi.ts_org'
      ' where fl_del = 0   '
      '   and upper(fc_name) like upper('#39'%'#39'||:p||'#39'%'#39')'
      'union all'
      
        'select (select to_number(substr(fc_value, 1, instr(fc_value, '#39';'#39 +
        ')-1)) from taxi.tparams where fc_key = '#39'IDENT_MG'#39') as fk_id,'
      
        '       fc_name||'#39' - '#39'||to_char(fn_km)||'#39#1082#1084#39' as fc_name, '#39#39' as fc' +
        '_shortname,'
      '       upper(fc_name) as fc_name_up,'
      '       instr(upper(to_char(fc_name)), upper(:p)) as sub,'
      '       4 as fp_type'
      '  from taxi.ts_mg'
      ' where fl_del = 0'
      '   and upper(fc_name) like upper ('#39'%'#39'||:p||'#39'%'#39')'
      'order by sub, fc_name'
      ''
      '-- '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1091' '#1089#1076#1077#1083#1072#1090#1100' '#1087#1086' fc_sub')
    Optimize = False
    Variables.Data = {0300000001000000020000003A50050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F4E414D455F55500100000000000C000000
      46435F53484F52544E414D450100000000000300000053554201000000000007
      00000046505F54595045010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 88
    Top = 160
  end
  object dsRaion: TDataSource
    DataSet = odsRaion
    Left = 88
    Top = 112
  end
end
