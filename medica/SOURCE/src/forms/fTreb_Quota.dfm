object fmTreb_Quota: TfmTreb_Quota
  Left = 354
  Top = 299
  HelpContext = 47
  Caption = #1050#1074#1086#1090#1072' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1086#1074
  ClientHeight = 288
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 674
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 666
      end>
    BorderWidth = 1
    EdgeBorders = [ebLeft, ebTop, ebRight]
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 657
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 57
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton3: TToolButton
        Left = 0
        Top = 0
        Action = acAdd
      end
      object tbuEdit: TToolButton
        Left = 57
        Top = 0
        Action = acEdit
        AllowAllUp = True
        Style = tbsCheck
      end
      object ToolButton4: TToolButton
        Left = 114
        Top = 0
        Action = acDel
      end
      object ToolButton7: TToolButton
        Left = 171
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 179
        Top = 0
        Action = acRefresh
      end
      object ToolButton6: TToolButton
        Left = 236
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object Panel1: TPanel
        Left = 244
        Top = 0
        Width = 111
        Height = 36
        Align = alLeft
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object abuSetDocPeriod: TJvArrowButton
          Left = 97
          Top = 0
          Width = 14
          Height = 36
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076' '#1080#1079' '#1089#1087#1080#1089#1082#1072
          Align = alRight
          ArrowWidth = 15
          DropDown = pmFilterPeriod
          Flat = True
          FillFont.Charset = DEFAULT_CHARSET
          FillFont.Color = clWindowText
          FillFont.Height = -11
          FillFont.Name = 'MS Sans Serif'
          FillFont.Style = []
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 97
          Height = 36
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object dedDate1: TcxDateEdit
            Left = 18
            Top = 0
            Hint = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
            EditValue = 0d
            Enabled = False
            ParentShowHint = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DateButtons = [btnToday]
            Properties.InputKind = ikMask
            Properties.SaveTime = False
            Properties.ShowTime = False
            ShowHint = True
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            OnKeyDown = dedDate1KeyDown
            Width = 79
          end
          object dedDate2: TcxDateEdit
            Left = 18
            Top = 16
            Hint = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
            EditValue = 0d
            Enabled = False
            ParentShowHint = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DateButtons = [btnToday]
            Properties.InputKind = ikMask
            Properties.SaveTime = False
            Properties.ShowTime = False
            ShowHint = True
            Style.LookAndFeel.Kind = lfUltraFlat
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfUltraFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfUltraFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfUltraFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 3
            OnKeyDown = dedDate1KeyDown
            Width = 79
          end
          object chbDate1: TcxCheckBox
            Left = 0
            Top = 0
            ParentColor = False
            Style.Color = clBtnFace
            TabOrder = 0
            OnClick = chbDate1Click
            Width = 21
          end
          object chbDate2: TcxCheckBox
            Left = 0
            Top = 16
            ParentColor = False
            Style.Color = clBtnFace
            TabOrder = 2
            OnClick = chbDate2Click
            Width = 21
          end
        end
      end
      object ToolButton2: TToolButton
        Left = 355
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 363
        Top = 0
        Action = acClose
      end
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 42
    Width = 674
    Height = 246
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 482
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsTTreb_Quota
      DataController.KeyFieldNames = 'FK_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1050#1086#1083'-'#1074#1086': ### ###'
          Kind = skCount
          Column = cxGrid1DBTableView1_FK_MEDIC_ID
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnDataChanged = cxGrid1DBTableView1DataControllerDataChanged
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Appending = True
      OptionsData.CancelOnExit = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object cxGrid1DBTableView1_FK_ID: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'FK_ID'
        Visible = False
        Options.Editing = False
        Width = 57
      end
      object cxGrid1DBTableView1_FK_MEDIC_ID: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'FK_MEDIC_ID'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        Width = 62
      end
      object cxGrid1DBTableView1_fc_medic: TcxGridDBColumn
        Caption = #1052#1077#1076#1080#1082#1072#1084#1077#1085#1090
        DataBinding.FieldName = 'fc_medic'
        Width = 264
      end
      object cxGrid1DBTableView1_FN_KOL: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086
        DataBinding.FieldName = 'FN_KOL'
        PropertiesClassName = 'TcxSpinEditProperties'
        Width = 44
      end
      object cxGrid1DBTableView1_FD_DATE1: TcxGridDBColumn
        Caption = #1053#1072#1095#1072#1083#1086' '#1089#1088#1086#1082#1072
        DataBinding.FieldName = 'FD_DATE1'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ClearKey = 46
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Width = 80
      end
      object cxGrid1DBTableView1_FD_DATE2: TcxGridDBColumn
        Caption = #1050#1086#1085#1077#1094' '#1089#1088#1086#1082#1072
        DataBinding.FieldName = 'FD_DATE2'
        Width = 80
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 304
    Top = 24
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      ImageIndex = 1
      ShortCut = 16499
      OnExecute = acCloseExecute
    end
    object acDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 22
      ShortCut = 119
      OnExecute = acDelExecute
    end
    object acEdit: TAction
      AutoCheck = True
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 3
      ShortCut = 114
      OnExecute = acEditExecute
    end
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 21
      ShortCut = 115
      OnExecute = acAddExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 15
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = dmMain.JvAppIniFileStorage
    AppStoragePath = 'fmTreb_Quota\'
    StoredProps.Strings = (
      'cxGrid1DBTableView1_FK_MEDIC_ID.Width'
      'cxGrid1DBTableView1_fc_medic.Width'
      'cxGrid1DBTableView1_FK_ID.Width'
      'cxGrid1DBTableView1_FN_KOL.Width'
      'cxGrid1DBTableView1_FD_DATE1.Width'
      'cxGrid1DBTableView1_FD_DATE2.Width')
    StoredValues = <>
    Left = 304
    Top = 104
  end
  object odsTTreb_Quota: TOracleDataSet
    SQL.Strings = (
      
        'SELECT a.ROWID, a.*, m.fc_name as fc_medic, ei.fc_name as fc_edi' +
        'zm'
      '  FROM med.TTreb_Quota a, med.tmedic m, med.tei ei'
      'where a.FK_MO_GROUP_ID = med.pkg_medses.get_cur_mogroup()'
      '  and a.FK_MEDIC_ID = m.medicid(+)'
      '  and m.eiid = ei.eiid(+)'
      
        '  and ((TRUNC(a.FD_DATE1) >= TRUNC(:DATE1) or :FILTERED_BY_DATE1' +
        ' = 0) and (TRUNC(a.FD_DATE2) <= TRUNC(:DATE2) or :FILTERED_BY_DA' +
        'TE2 = 0))')
    Optimize = False
    Variables.Data = {
      0300000004000000060000003A44415445310C00000000000000000000001200
      00003A46494C54455245445F42595F4441544531030000000400000000000000
      00000000060000003A44415445320C0000000000000000000000120000003A46
      494C54455245445F42595F444154453203000000040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F5244455201000000000009000000464C
      5F4E4F54444F430100000000000A00000046435F53594E4F4E494D0100000000
      00}
    Session = dmMain.os
    Left = 232
    Top = 144
  end
  object dsTTreb_Quota: TDataSource
    DataSet = odsTTreb_Quota
    Left = 236
    Top = 194
  end
  object pmFilterPeriod: TPopupMenu
    Left = 328
    Top = 56
    object N19: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = N19Click
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N20: TMenuItem
      Tag = 5
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1076#1077#1085#1100
      OnClick = N19Click
    end
    object N18: TMenuItem
      Tag = 4
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
      OnClick = N19Click
    end
    object N16: TMenuItem
      Tag = 2
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1075#1086#1076
      OnClick = N19Click
    end
    object N21: TMenuItem
      Caption = '-'
    end
    object N17: TMenuItem
      Tag = 3
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1084#1077#1089#1103#1094
      OnClick = N19Click
    end
    object N15: TMenuItem
      Tag = 1
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1075#1086#1076
      OnClick = N19Click
    end
  end
end
