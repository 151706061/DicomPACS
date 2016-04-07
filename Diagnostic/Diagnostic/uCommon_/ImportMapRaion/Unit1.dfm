object Form1: TForm1
  Left = 191
  Top = 107
  Caption = 'Form1'
  ClientHeight = 481
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClick = FormClick
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DgInstrumentCombo1: TDgInstrumentCombo
    Left = 448
    Top = 8
    Width = 145
    Height = 22
    About = 
      'http://www.datagis.ru, DataGIS ver. 2.9.5.1 (c) Titov Nickolay, ' +
      '13.12.2010 13:02:24'
    DgMap = DgMap1
    Style = csOwnerDrawFixed
    ItemHeight = 16
    ItemIndex = -1
    Items.Strings = (
      'iCursor'
      'iHand'
      'iZoom'
      'iMeasure'
      'iPrintRect'
      'iTarget'
      'iNone'
      'iLine'
      'iPolyline'
      'iPolygon'
      'iRectangle'
      'iEllipse'
      'iRoundRect'
      'iArc'
      'iBezier'
      'iBlock'
      'iPie'
      'iPoint'
      'iText'
      'iIcon')
    TabOrder = 0
  end
  object DgMap1: TDgMap
    Left = 8
    Top = 8
    Width = 425
    Height = 433
    ScrollStep = 50
    ShowLabel = True
    UseMap = umFast
    MeasureLabel = True
    MeasureScaleFactor = 2.000000000000000000
    About = 
      'http://www.datagis.ru, DataGIS ver. 2.9.5.1 (c) Titov Nickolay, ' +
      '13.12.2010 13:02:24'
    AutoSet = [akLabel, akPreview, akReDraws, akScale, akUpdate, akZoom]
    DgPen.Color = clBlack
    DgPen.SelWidth = 1
    DgPen.Width = 1
    DgTempPen.Color = clBlack
    DgTempPen.SelWidth = 1
    DgTempPen.Width = 1
    DgBrush.SelColor = clFuchsia
    DgBrush.Style = bsSolid
    DgBrush3D.SelColor = clFuchsia
    DgBrush3D.Style = bsClear
    DgTempBrush.SelColor = clFuchsia
    DgTempBrush.Style = bsSolid
    HandSet = [hkRight]
    OnCreateObject = DgMap1CreateObject
    OnAddInstrumentObject = DgMap1AddInstrumentObject
    OnAfterLoadObject = DgMap1AfterLoadObject
    OnBeforeLoadObject = DgMap1BeforeLoadObject
    OnBeforeImportObject = DgMap1BeforeImportObject
    OnBeforeSaveObject = DgMap1BeforeSaveObject
    OnChangeScale = DgMap1ChangeScale
    OnChangeCurObject = DgMap1ChangeCurObject
    OnMeasureDraw = DgMap1MeasureDraw
    OnZoomMap = DgMap1ZoomMap
    OnZoomClick = DgMap1ZoomClick
    OnAfterImportObject = DgMap1AfterImportObject
    OnBeforeExportObject = DgMap1BeforeExportObject
    OnPrint = DgMap1Print
    OnPrintRectSelect = DgMap1PrintRectSelect
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    TabOrder = 1
    OnDblClick = DgMap1DblClick
  end
  object Button1: TButton
    Left = 480
    Top = 40
    Width = 75
    Height = 25
    Caption = 'iCursor'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 480
    Top = 72
    Width = 75
    Height = 25
    Caption = 'iHand'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 480
    Top = 104
    Width = 75
    Height = 25
    Caption = 'iZoom'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 480
    Top = 136
    Width = 75
    Height = 25
    Caption = 'iMeasure'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button6: TButton
    Left = 480
    Top = 167
    Width = 75
    Height = 25
    Caption = 'iPolygon'
    TabOrder = 6
    OnClick = Button6Click
  end
  object CheckBox1: TCheckBox
    Left = 448
    Top = 456
    Width = 129
    Height = 17
    Caption = 'DgMap.Edit'
    TabOrder = 7
    OnClick = CheckBox1Click
  end
  object Button9: TButton
    Left = 480
    Top = 198
    Width = 75
    Height = 25
    Caption = 'Export'
    TabOrder = 8
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 480
    Top = 229
    Width = 75
    Height = 25
    Caption = 'Import'
    TabOrder = 9
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 480
    Top = 260
    Width = 75
    Height = 25
    Caption = 'From file'
    TabOrder = 10
    OnClick = Button11Click
  end
  object teCaption: TEdit
    Left = 456
    Top = 291
    Width = 121
    Height = 21
    TabOrder = 11
  end
  object Button12: TButton
    Left = 480
    Top = 318
    Width = 75
    Height = 25
    Caption = 'Save Caption'
    TabOrder = 12
    OnClick = Button12Click
  end
  object cbVisible: TCheckBox
    Left = 272
    Top = 456
    Width = 129
    Height = 17
    Caption = #1057#1082#1088#1099#1090#1100' '#1088#1072#1081#1086#1085#1099
    TabOrder = 13
    OnClick = cbVisibleClick
  end
  object cbLabel: TCheckBox
    Left = 120
    Top = 456
    Width = 129
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1084#1077#1090#1082#1080
    Checked = True
    State = cbChecked
    TabOrder = 14
    OnClick = cbLabelClick
  end
  object Button5: TButton
    Left = 480
    Top = 349
    Width = 75
    Height = 25
    Caption = 'Export Raion'
    TabOrder = 15
    OnClick = Button5Click
  end
  object lbItems: TListBox
    Left = 456
    Top = 380
    Width = 121
    Height = 57
    ItemHeight = 13
    TabOrder = 16
  end
  object cbHome: TCheckBox
    Left = 16
    Top = 456
    Width = 89
    Height = 17
    Caption = #1044#1086#1084#1072
    Checked = True
    State = cbChecked
    TabOrder = 17
    OnClick = cbLabelClick
  end
  object lbPerekrestok: TListBox
    Left = 616
    Top = 8
    Width = 169
    Height = 366
    ItemHeight = 13
    TabOrder = 18
  end
  object DgLayer1: TDgLayer
    About = 
      'http://www.datagis.ru, DataGIS ver. 2.9.5.1 (c) Titov Nickolay, ' +
      '13.12.2010 13:02:24'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    DgBrush3D.Color = clPurple
    DgBrush3D.SelColor = clFuchsia
    DgBrush3D.Style = bsSolid
    DgBrush.Color = clBlue
    DgBrush.SelColor = clFuchsia
    DgBrush.Style = bsSolid
    DgFont.Charset = DEFAULT_CHARSET
    DgFont.Color = clWindowText
    DgFont.Height = -11
    DgFont.Name = 'Tahoma'
    DgFont.Style = []
    DgFont.BackColor = clNone
    DgPen.SelWidth = 1
    DgPen.Width = 1
    DgMap = DgMap1
    Left = 368
    Top = 40
  end
  object DgEvent1: TDgEvent
    About = 
      'http://www.datagis.ru, DataGIS ver. 2.9.5.1 (c) Titov Nickolay, ' +
      '13.12.2010 13:02:24'
    OnSelectRib = DgEvent1SelectRib
    Left = 344
    Top = 128
  end
  object qInsertStreet: TOracleQuery
    SQL.Strings = (
      'declare'
      '  vstreet   taxi.tstreet.fk_id%type;'
      '  vdistrict taxi.tdistrict.fk_id%type;'
      'begin'
      '  select max(fk_id)'
      '    into vstreet'
      '    from taxi.tstreet s'
      '   where s.fc_mapname = :pmapname;'
      '  if (vstreet is not null) then'
      '    select max(fk_id)'
      '      into vdistrict'
      '      from taxi.tdistrict d'
      '     where d.fk_street = vstreet'
      '       and d.fk_raion = :praion;'
      '    if (vdistrict is null) then'
      '      insert into taxi.tdistrict'
      '        (fk_raion, fk_street)'
      '      values'
      '        (:praion, vstreet);'
      '    end if;'
      '  end if;'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000002000000090000003A504D41504E414D450500000000000000000000
      00070000003A505241494F4E030000000000000000000000}
    Left = 40
    Top = 56
  end
  object os: TOracleSession
    LogonUsername = 'taxi'
    LogonPassword = 'TAXI123'
    LogonDatabase = 'XE'
    Left = 80
    Top = 56
  end
  object odsRaion: TOracleDataSet
    SQL.Strings = (
      
        'select * from taxi.ts_raion s where upper(s.fc_name) = upper(:pN' +
        'ame) and fl_del = 0')
    Optimize = False
    Variables.Data = {0300000001000000060000003A504E414D45050000000000000000000000}
    Session = os
    Left = 128
    Top = 56
  end
  object qInsertHouse: TOracleQuery
    SQL.Strings = (
      'declare'
      '  vstreet   taxi.tstreet.fk_id%type;'
      '  vdistrict taxi.tdistrict.fk_id%type;'
      'begin'
      '  select max(fk_id)'
      '    into vstreet'
      '    from taxi.tstreet s'
      
        '   where upper(replace(replace(s.fc_name,'#39' '#39','#39#39'),'#39'-'#39','#39#39')) like (' +
        'upper(replace(replace(:street,'#39' '#39','#39#39'),'#39'-'#39','#39#39')));'
      '  if (vstreet is not null) then'
      '    select max(fk_id)'
      '      into vdistrict'
      '      from taxi.tdistrict d'
      '     where d.fk_street = vstreet'
      '       and d.fk_raion = :praion;'
      '    if (vdistrict is null) then'
      '      insert into taxi.tdistrict'
      '        (fk_raion, fk_street, fc_house)'
      '      values'
      '        (:praion, vstreet, :phouse);'
      '    else'
      '      update taxi.tdistrict'
      '      set fc_house = fc_house||:phouse||'#39';'#39
      '      where fk_id = vdistrict;'
      '    end if;'
      '  end if;'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000003000000070000003A505241494F4E03000000000000000000000007
      0000003A535452454554050000000000000000000000070000003A50484F5553
      45050000000000000000000000}
    Left = 40
    Top = 96
  end
  object qPerekrestok: TOracleQuery
    SQL.Strings = (
      'declare'
      '  vperekrestok taxi.tperekrestok.fk_id%type;'
      '  vstreet1     taxi.tstreet.fc_mapname%type;'
      '  vstreet2     taxi.tstreet.fc_mapname%type;'
      'begin'
      '  select max(fk_id)'
      '    into vstreet1'
      '    from taxi.tstreet s'
      '   where s.fc_mapname = :pmapname1;'
      '  select max(fk_id)'
      '    into vstreet2'
      '    from taxi.tstreet s'
      '   where s.fc_mapname = :pmapname2;'
      
        '  if (vstreet1 is not null) and (vstreet2 is not null) and (vstr' +
        'eet1 <> vstreet2) then'
      '    select max(fk_id)'
      '      into vperekrestok'
      '      from taxi.tperekrestok r'
      '     where (r.fk_street1 = vstreet1 and r.fk_street2 = vstreet2)'
      
        '        or (r.fk_street2 = vstreet1 and r.fk_street1 = vstreet2)' +
        ';'
      '    if (vperekrestok is null) then'
      '      insert into taxi.tperekrestok'
      '        (fk_street1, fk_street2, fk_raion)'
      '      values'
      '        (vstreet1, vstreet2, :praion);'
      '    end if;'
      '  end if;'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000003000000070000003A505241494F4E0300000000000000000000000A
      0000003A504D41504E414D45310500000000000000000000000A0000003A504D
      41504E414D4532050000000000000000000000}
    Left = 40
    Top = 136
  end
end
