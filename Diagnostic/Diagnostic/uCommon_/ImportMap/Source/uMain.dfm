object Form1: TForm1
  Left = 193
  Top = 107
  Caption = #1048#1084#1087#1086#1088#1090' '#1082#1072#1088#1090#1099' '#1074' '#1041#1044
  ClientHeight = 462
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DgMap1: TDgMap
    Left = 0
    Top = 0
    Width = 733
    Height = 462
    ScrollStep = 50
    Edit = False
    ShowLabel = True
    UseMap = umFast
    MeasureScaleFactor = 1.000000000000000000
    About = 
      'http://www.datagis.ru, DataGIS ver. 2.9.5.1 (c) Titov Nickolay, ' +
      '13.12.2010 13:02:24'
    AutoSet = [akLabel, akPreview, akReDraws, akScale, akTurbo, akUpdate, akZoom]
    DgPen.Color = clBlack
    DgPen.SelWidth = 1
    DgPen.Width = 1
    DgTempPen.Color = clBlack
    DgTempPen.SelWidth = 1
    DgTempPen.Width = 1
    DgBrush.SelColor = clFuchsia
    DgBrush.Style = bsClear
    DgBrush3D.SelColor = clFuchsia
    DgBrush3D.Style = bsClear
    DgTempBrush.SelColor = clFuchsia
    DgTempBrush.Style = bsClear
    HandSet = [hkLeft, hkRight]
    OnAfterImportMap = DgMap1AfterImportMap
    OnAfterImportObject = DgMap1AfterImportObject
    OnBeforeImport = DgMap1BeforeImport
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial CYR'
    Font.Style = []
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 862
    ExplicitHeight = 473
  end
  object btnOpen: TButton
    Left = 652
    Top = 8
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = btnOpenClick
  end
  object lbItems: TListBox
    Left = 733
    Top = 0
    Width = 121
    Height = 462
    Align = alRight
    ItemHeight = 13
    TabOrder = 2
  end
  object btnLoadToBd: TButton
    Left = 652
    Top = 39
    Width = 75
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    Enabled = False
    TabOrder = 3
    OnClick = btnLoadToBdClick
  end
  object tmrRefresh: TTimer
    Enabled = False
    Interval = 500
    Left = 528
    Top = 136
  end
  object os: TOracleSession
    LogonUsername = 'taxi'
    LogonPassword = 'TAXI123'
    LogonDatabase = 'XE'
    Left = 80
    Top = 56
  end
  object qInsertStreet: TOracleQuery
    SQL.Strings = (
      'insert into taxi.tstreet (fc_name, fc_preffix, fc_mapname)'
      'values (:pname, :ppreffix, :pmapname)')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000003000000060000003A504E414D450500000000000000000000000900
      00003A5050524546464958050000000000000000000000090000003A504D4150
      4E414D45050000000000000000000000}
    Left = 40
    Top = 56
  end
end
