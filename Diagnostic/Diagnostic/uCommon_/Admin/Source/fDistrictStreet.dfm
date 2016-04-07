object frmDistrictStreet: TfrmDistrictStreet
  Left = 259
  Top = 123
  Caption = #1059#1083#1080#1094#1099' '#1088#1072#1081#1086#1085#1086#1074
  ClientHeight = 379
  ClientWidth = 810
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object gDistrictStreet: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 75
    Width = 804
    Height = 301
    Margins.Top = 0
    Align = alClient
    TabOrder = 0
    LookAndFeel.SkinName = 'Caramel'
    ExplicitTop = 78
    ExplicitHeight = 298
    object tvDistrictStreet: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvDistrictStreetCellDblClick
      DataController.DataSource = dsDistrictStreet
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object tvDistrictStreetFK_ID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_ID'
        Visible = False
      end
      object tvDistrictStreetFK_RAION: TcxGridDBColumn
        DataBinding.FieldName = 'FK_RAION'
        Visible = False
      end
      object tvDistrictStreetFK_STREET: TcxGridDBColumn
        DataBinding.FieldName = 'FK_STREET'
        Visible = False
      end
      object tvDistrictStreetFC_MAPNAME: TcxGridDBColumn
        Caption = #1059#1083#1080#1094#1072
        DataBinding.FieldName = 'FC_MAPNAME'
        Width = 377
      end
      object tvDistrictStreetFC_NAME: TcxGridDBColumn
        Caption = #1056#1072#1081#1086#1085
        DataBinding.FieldName = 'FC_NAME'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
      end
      object tvDistrictStreetFN_EVENS: TcxGridDBColumn
        Caption = #1063#1077#1090#1085#1099#1077' '#1089
        DataBinding.FieldName = 'FN_EVENS'
        Width = 92
      end
      object tvDistrictStreetFN_EVENPO: TcxGridDBColumn
        Caption = #1063#1077#1090#1085#1099#1077' '#1087#1086
        DataBinding.FieldName = 'FN_EVENPO'
        Width = 89
      end
      object tvDistrictStreetFN_ODDS: TcxGridDBColumn
        Caption = #1053#1077#1095#1077#1090#1085#1099#1077' '#1089
        DataBinding.FieldName = 'FN_ODDS'
        Width = 86
      end
      object tvDistrictStreetFN_ODDPO: TcxGridDBColumn
        Caption = #1053#1077#1095#1077#1090#1085#1099#1077' '#1087#1086
        DataBinding.FieldName = 'FN_ODDPO'
        Width = 92
      end
    end
    object gDistrictStreetL: TcxGridLevel
      GridView = tvDistrictStreet
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 32
    Width = 804
    Height = 40
    Margins.Top = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    object Label1: TLabel
      Left = 27
      Top = 11
      Width = 167
      Height = 13
      Alignment = taRightJustify
      Caption = #1048#1089#1082#1072#1090#1100' '#1074' '#1087#1086#1083#1085#1086#1084' '#1085#1072#1079#1074#1072#1085#1080#1080':'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object FilterText: TcxTextEdit
      Left = 200
      Top = 8
      Properties.CharCase = ecUpperCase
      Properties.OnChange = FilterTextPropertiesChange
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      Style.LookAndFeel.SkinName = 'Caramel'
      Style.TextStyle = [fsBold]
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 0
      OnKeyDown = FilterTextKeyDown
      Width = 289
    end
    object btnDelPacFiltr: TcxButton
      Left = 491
      Top = 6
      Width = 112
      Height = 25
      Caption = #1059#1073#1088#1072#1090#1100' '#1092#1080#1083#1100#1090#1088
      Enabled = False
      TabOrder = 1
      OnClick = btnDelPacFiltrClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000848484FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF
        000084000000000000848484FF00FFFF00FFFF00FFFF00FF8484848484848484
        84FF00FFFF00FFFF00FFFF00FF0000FF000084000084000000848484848484FF
        00FFFF00FFFF00FF000084000000000000848484FF00FFFF00FFFF00FFFF00FF
        000084000084000084000000000000848484FF00FF0000840000840000840000
        84000000FF00FFFF00FFFF00FFFF00FF0000FF00008400008400008400000000
        0000000084000084000084000084000084FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0000FF000084000084000084000084000084000084000084000000FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00008400008400
        0084000084000084000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0000FF000084000084000084000084848484FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00008400
        0084000084000084000000848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0000FF0000840000840000840000840000840000840000008484
        84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00008400008400
        00840000FF0000FF000084000000000000848484FF00FFFF00FFFF00FFFF00FF
        FF00FF0000FF000084000084000000848484FF00FFFF00FF0000FF0000840000
        84000000848484FF00FFFF00FFFF00FF0000FF000084000084000000848484FF
        00FFFF00FFFF00FFFF00FF0000FF000084000084000000FF00FFFF00FFFF00FF
        FF00FF0000FF000084848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
        FF000084000084000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF0000FFFF00FF}
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Caramel'
    end
  end
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 804
    Height = 26
    Align = dalTop
    BarManager = BM
  end
  object BM: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clBtnFace
    ImageOptions.Images = frmMain.IL
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Caramel'
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 408
    Top = 232
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarManager1Bar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' 1'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 789
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
          BeginGroup = True
          UserDefine = [udWidth]
          UserWidth = 24
          Visible = True
          ItemName = 'cbDoubleOnly'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbClose'
        end>
      MultiLine = True
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBarButton1: TdxBarButton
      Action = aAdd
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton2: TdxBarButton
      Caption = #1053#1086#1074#1072#1103' '#1082#1085#1086#1087#1082#1072
      Category = 0
      Hint = #1053#1086#1074#1072#1103' '#1082#1085#1086#1087#1082#1072
      Visible = ivAlways
    end
    object dxBarButton3: TdxBarButton
      Action = aEdit
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton4: TdxBarButton
      Action = aDel
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton5: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object cbDoubleOnly: TcxBarEditItem
      Caption = #1058#1086#1083#1100#1082#1086' '#1076#1091#1073#1083#1080#1088#1091#1102#1097#1080#1077#1089#1103
      Category = 0
      Hint = #1058#1086#1083#1100#1082#1086' '#1076#1091#1073#1083#1080#1088#1091#1102#1097#1080#1077#1089#1103
      Visible = ivAlways
      ShowCaption = True
      Width = 100
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.Alignment = taLeftJustify
      Properties.ImmediatePost = True
      Properties.OnChange = cbDoubleOnlyPropertiesChange
      InternalEditValue = False
    end
    object bbClose: TdxBarButton
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object al: TActionList
    Images = frmMain.IL
    OnUpdate = alUpdate
    Left = 312
    Top = 144
    object aAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1083#1080#1094#1091' '#1074' '#1088#1072#1081#1086#1085
      ImageIndex = 4
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1091#1083#1080#1094#1091' '#1074' '#1088#1072#1081#1086#1085#1077
      ImageIndex = 0
      OnExecute = aEditExecute
    end
    object aDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1091#1083#1080#1094#1091' '#1080#1079' '#1088#1072#1081#1086#1085#1072
      ImageIndex = 1
      OnExecute = aDelExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 5
      OnExecute = aRefreshExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
  end
  object odsDistrictStreet: TOracleDataSet
    SQL.Strings = (
      'select d.fk_id,'
      '       fk_raion,'
      '       fk_street,'
      '       r.fc_name,'
      '       s.fc_name || '#39' '#39' || s.fc_preffix || '#39'.'#39' fc_mapname,'
      
        '       upper(s.fc_name || '#39' '#39' || s.fc_preffix || '#39'.'#39') fc_upperma' +
        'pname,'
      '       d.fn_evens,'
      '       d.fn_evenpo,'
      '       d.fn_odds,'
      '       d.fn_oddpo'
      '  from taxi.tdistrict d, taxi.ts_raion r, taxi.tstreet s'
      ' where d.fk_raion = r.fk_id'
      '   and s.fk_id = d.fk_street')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000A00000005000000464B5F494401000000000008000000464B5F5241
      494F4E01000000000009000000464B5F53545245455401000000000007000000
      46435F4E414D450100000000000A00000046435F4D41504E414D450100000000
      0008000000464E5F4556454E5301000000000009000000464E5F4556454E504F
      01000000000007000000464E5F4F44445301000000000008000000464E5F4F44
      44504F0100000000000F00000046435F55505045524D41504E414D4501000000
      0000}
    Cursor = crSQLWait
    Session = frmMain.os
    Active = True
    Left = 408
    Top = 128
  end
  object dsDistrictStreet: TDataSource
    DataSet = odsDistrictStreet
    Left = 472
    Top = 128
  end
  object shDistrictStreet: TJvMultiStringHolder
    MultipleStrings = <
      item
        Name = 'All'
        Strings.Strings = (
          
            '/*select d.fk_id, fk_raion, fk_street, r.fc_name, s.fc_mapname,u' +
            'pper(s.fc_mapname) fc_uppermapname, d.fn_evens, d.fn_evenpo, d.f' +
            'n_odds, d.fn_oddpo'
          '  from taxi.tdistrict d, taxi.ts_raion r, taxi.tstreet s'
          ' where d.fk_raion = r.fk_id'
          '   and s.fk_id = d.fk_street'
          '*/'
          'select d.fk_id,'
          '       fk_raion,'
          '       fk_street,'
          '       r.fc_name,'
          '       --s.fc_mapname,'
          '       s.fc_name || '#39' '#39' || s.fc_preffix || '#39'.'#39' fc_mapname,'
          
            '       upper(s.fc_name || '#39' '#39' || s.fc_preffix || '#39'.'#39') fc_upperma' +
            'pname,'
          '       --upper(s.fc_mapname) fc_uppermapname,'
          '       d.fn_evens,'
          '       d.fn_evenpo,'
          '       d.fn_odds,'
          '       d.fn_oddpo'
          '  from taxi.tdistrict d, taxi.ts_raion r, taxi.tstreet s'
          ' where d.fk_raion = r.fk_id'
          '   and s.fk_id = d.fk_street')
      end
      item
        Name = 'NotAll'
        Strings.Strings = (
          'select d.fk_id,'
          '       fk_raion,'
          '       fk_street,'
          '       r.fc_name,'
          '       s.fc_name || '#39' '#39' || s.fc_preffix || '#39'.'#39' fc_mapname,'
          
            '       upper(s.fc_name || '#39' '#39' || s.fc_preffix || '#39'.'#39') fc_upperma' +
            'pname,'
          '       d.fn_evens,'
          '       d.fn_evenpo,'
          '       d.fn_odds,'
          '       d.fn_oddpo'
          '  from taxi.tdistrict d, taxi.ts_raion r, taxi.tstreet s'
          ' where d.fk_raion = r.fk_id'
          '   and s.fk_id = d.fk_street'
          '   and exists (select 1'
          '          from taxi.tdistrict dd'
          '         where dd.fk_street = s.fk_id'
          '           and dd.fk_raion <> d.fk_raion)')
      end>
    Left = 520
    Top = 136
  end
  object qDeleteDistrict: TOracleQuery
    SQL.Strings = (
      'delete from taxi.tdistrict where fk_id = :pid')
    Session = frmMain.os
    Optimize = False
    Variables.Data = {0300000001000000040000003A504944030000000000000000000000}
    Left = 408
    Top = 176
  end
end
