object frmMedicWithoutLink: TfrmMedicWithoutLink
  Left = 193
  Top = 131
  Caption = 
    #1052#1077#1076#1080#1082#1072#1084#1077#1085#1090#1099', '#1074#1099#1076#1072#1085#1085#1099#1077' '#1087#1086#1089#1090#1086#1074#1086#1081' '#1084'/'#1089'-'#1081', '#1085#1086' '#1085#1077' '#1089#1087#1080#1089#1072#1085#1085#1099#1077' '#1091' '#1089#1090#1072#1088#1096#1077#1081' ' +
    #1084'/'#1089'-'#1099
  ClientHeight = 613
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar2: TCoolBar
    Left = 0
    Top = 0
    Width = 862
    Height = 44
    AutoSize = True
    Bands = <
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 40
        Width = 862
      end>
    EdgeBorders = [ebTop, ebBottom]
    object ToolBar2: TToolBar
      Left = 9
      Top = 0
      Width = 853
      Height = 40
      AutoSize = True
      BorderWidth = 1
      ButtonHeight = 36
      ButtonWidth = 56
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ShowCaptions = True
      TabOrder = 0
      object ToolButton3: TToolButton
        Left = 0
        Top = 0
        Action = aChoose
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton7: TToolButton
        Left = 56
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object ToolButton8: TToolButton
        Left = 64
        Top = 0
        Action = aRefresh
      end
      object Panel1: TPanel
        Left = 120
        Top = 0
        Width = 112
        Height = 36
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object abuSetDocPeriod: TJvArrowButton
          Left = 0
          Top = 0
          Width = 15
          Height = 36
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076' '#1080#1079' '#1089#1087#1080#1089#1082#1072
          Align = alLeft
          ArrowWidth = 15
          DropDown = pmDates
          Flat = True
          FillFont.Charset = DEFAULT_CHARSET
          FillFont.Color = clWindowText
          FillFont.Height = -11
          FillFont.Name = 'MS Sans Serif'
          FillFont.Style = []
        end
        object dpeDate1: TJvDatePickerEdit
          Left = 16
          Top = 0
          Width = 95
          Height = 19
          Hint = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
          AllowNoDate = True
          ButtonFlat = True
          Checked = True
          Flat = True
          ParentFlat = False
          ShowCheckBox = True
          TabOrder = 0
          OnCheckClick = dpeDate1CheckClick
          DesignSize = (
            95
            19)
        end
        object dpeDate2: TJvDatePickerEdit
          Left = 16
          Top = 17
          Width = 95
          Height = 19
          Hint = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
          AllowNoDate = True
          ButtonFlat = True
          Checked = True
          Flat = True
          ParentFlat = False
          ShowCheckBox = True
          TabOrder = 1
          OnCheckClick = dpeDate1CheckClick
          DesignSize = (
            95
            19)
        end
      end
      object ToolButton5: TToolButton
        Left = 232
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 240
        Top = 0
        Action = aClose
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object gMedicWithoutLink: TcxGrid
    Left = 0
    Top = 44
    Width = 862
    Height = 569
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    object tvMedicWithoutLink: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvMedicWithoutLinkCellDblClick
      DataController.DataSource = dsMedicWithoutLink
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object tvMedicWithoutLinkColumn1: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
        DataBinding.FieldName = 'FD_TRUNCPOST'
        HeaderAlignmentHorz = taCenter
        Width = 120
      end
      object tvMedicWithoutLinkColumn2: TcxGridDBColumn
        Caption = #1052#1077#1076#1080#1082#1072#1084#1077#1085#1090', '#1085#1072#1079#1085#1072#1095#1077#1085#1085#1099#1081' '#1074#1088#1072#1095#1077#1084
        DataBinding.FieldName = 'FC_NAME'
        HeaderAlignmentHorz = taCenter
        Width = 529
      end
      object tvMedicWithoutLinkColumn3: TcxGridDBColumn
        Caption = #1042#1099#1076#1072#1083' '#1087#1072#1094#1080#1077#1085#1090#1091
        DataBinding.FieldName = 'SOTRFIO'
        HeaderAlignmentHorz = taCenter
        Width = 211
      end
    end
    object gMedicWithoutLinkL: TcxGridLevel
      GridView = tvMedicWithoutLink
    end
  end
  object alActions: TActionList
    Images = dmMain.ilMain
    OnUpdate = alActionsUpdate
    Left = 320
    Top = 10
    object aChoose: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 30
      ShortCut = 13
      OnExecute = aChooseExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 1
      ShortCut = 16499
      OnExecute = aCloseExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 15
      OnExecute = aRefreshExecute
    end
  end
  object odsMedicWithoutLink: TOracleDataSet
    SQL.Strings = (
      'select n.fk_id nazmarkid,'
      '       n.fk_nazmedlechid,'
      '       s.fc_fam'
      
        '       ||decode(s.fc_name,null,'#39#39','#39' '#39'||SUBSTR(s.fc_name, 0, 1)||' +
        #39'.'#39')'
      
        '       ||decode(s.fc_otch,null,'#39#39','#39' '#39'||SUBSTR(s.fc_otch, 0, 1)||' +
        #39'.'#39') SotrFio,'
      '       s.fk_id fk_sotrid,'
      '       n.fd_post,'
      '       m.fc_name,'
      #9'trunc(n.fd_post,'#39'dd'#39') fd_truncpost'
      
        'from asu.tnazmark n, med.tsotr_medica s, asu.tnazmedlech l, med.' +
        'tlatin_names m, asu.tnazmed d'
      'where '
      'n.fk_nazmedlechid is not null'
      
        'and trunc(n.fd_post,'#39'dd'#39') between trunc(:pS,'#39'dd'#39') and trunc(:pPo' +
        ','#39'dd'#39')'
      'and n.fk_sotrid = s.fk_id'
      'and n.fk_nazmedlechid = l.fk_id'
      'and m.fk_id = l.fk_medicid'
      'and not exists'
      '(select 1 from'
      ' asu.tmedicgiven m'
      ' where m.fk_nazmark = n.fk_id)'
      ' and d.fk_id = n.fk_nazid'
      ' and d.fk_pacid = :pPacID')
    Optimize = False
    Variables.Data = {
      0300000003000000030000003A50530C0000000000000000000000040000003A
      50504F0C0000000000000000000000070000003A505041434944030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000090000004E415A4D41524B49440100000000000F00000046
      4B5F4E415A4D45444C454348494401000000000007000000534F545246494F01
      000000000009000000464B5F534F545249440100000000000700000046445F50
      4F53540100000000000700000046435F4E414D45010000000000}
    Session = dmMain.os
    Left = 385
    Top = 82
  end
  object dsMedicWithoutLink: TDataSource
    DataSet = odsMedicWithoutLink
    Left = 359
    Top = 82
  end
  object FormStorage: TJvFormStorage
    Active = False
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'frmMedicWithoutLink\'
    StoredProps.Strings = (
      'dpeDate1.Date'
      'dpeDate2.Date')
    StoredValues = <>
    Left = 488
    Top = 324
  end
  object pmDates: TPopupMenu
    Left = 454
    Top = 80
    object N2: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = N20Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N20: TMenuItem
      Tag = 5
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1076#1077#1085#1100
      OnClick = N20Click
    end
    object N18: TMenuItem
      Tag = 4
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
      OnClick = N20Click
    end
    object N16: TMenuItem
      Tag = 2
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1075#1086#1076
      OnClick = N20Click
    end
    object N21: TMenuItem
      Caption = '-'
    end
    object N17: TMenuItem
      Tag = 3
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1084#1077#1089#1103#1094
      OnClick = N20Click
    end
    object N15: TMenuItem
      Tag = 1
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1075#1086#1076
      OnClick = N20Click
    end
  end
  object mshNazMark: TJvMultiStringHolder
    MultipleStrings = <
      item
        Name = 'NoFilterByDate'
        Strings.Strings = (
          'select n.fk_id nazmarkid,'
          '       n.fk_nazmedlechid,'
          '       s.fc_fam'
          
            '       ||decode(s.fc_name,null,'#39#39','#39' '#39'||SUBSTR(s.fc_name, 0, 1)||' +
            #39'.'#39')'
          
            '       ||decode(s.fc_otch,null,'#39#39','#39' '#39'||SUBSTR(s.fc_otch, 0, 1)||' +
            #39'.'#39') SotrFio,'
          '       s.fk_id fk_sotrid,'
          '       n.fd_post,'
          '       m.fc_name,'
          #9'trunc(n.fd_post,'#39'dd'#39') fd_truncpost'
          
            'from asu.tnazmark n, asu.tsotr_medica s, asu.tnazmedlech l, med.' +
            'tlatin_names m, asu.tnazmed d'
          'where '
          'n.fk_nazmedlechid is not null'
          'and n.fk_sotrid = s.fk_id'
          'and n.fk_nazmedlechid = l.fk_id'
          'and m.fk_id = l.fk_medicid'
          'and not exists'
          '(select 1 from'
          ' asu.tmedicgiven m'
          ' where m.fk_nazmark = n.fk_id)'
          ' and d.fk_id = n.fk_nazid'
          ' and d.fk_pacid = :pPacID')
      end
      item
        Name = 'FilterByDate'
        Strings.Strings = (
          'select n.fk_id nazmarkid,'
          '       n.fk_nazmedlechid,'
          '       s.fc_fam'
          
            '       ||decode(s.fc_name,null,'#39#39','#39' '#39'||SUBSTR(s.fc_name, 0, 1)||' +
            #39'.'#39')'
          
            '       ||decode(s.fc_otch,null,'#39#39','#39' '#39'||SUBSTR(s.fc_otch, 0, 1)||' +
            #39'.'#39') SotrFio,'
          '       s.fk_id fk_sotrid,'
          '       n.fd_post,'
          '       m.fc_name,'
          #9'trunc(n.fd_post,'#39'dd'#39') fd_truncpost'
          
            'from asu.tnazmark n, asu.tsotr_medica s, asu.tnazmedlech l, med.' +
            'tlatin_names m, asu.tnazmed d'
          'where '
          'n.fk_nazmedlechid is not null'
          
            'and trunc(n.fd_post,'#39'dd'#39') between trunc(:pS,'#39'dd'#39') and trunc(:pPo' +
            ','#39'dd'#39')'
          'and n.fk_sotrid = s.fk_id'
          'and n.fk_nazmedlechid = l.fk_id'
          'and m.fk_id = l.fk_medicid'
          'and not exists'
          '(select 1 from'
          ' asu.tmedicgiven m'
          ' where m.fk_nazmark = n.fk_id)'
          ' and d.fk_id = n.fk_nazid'
          ' and d.fk_pacid = :pPacID')
      end>
    Left = 136
    Top = 346
  end
end
