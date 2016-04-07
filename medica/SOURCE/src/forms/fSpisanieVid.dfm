object fmSpisanieVid: TfmSpisanieVid
  Left = 328
  Top = 285
  Caption = #1042#1080#1076#1099' '#1089#1087#1080#1089#1072#1085#1080#1103
  ClientHeight = 290
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 475
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 471
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 462
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
      object tbuAdd: TToolButton
        Left = 0
        Top = 0
        Action = acAdd
      end
      object tbuDel: TToolButton
        Left = 57
        Top = 0
        Action = acDel
      end
      object ToolButton7: TToolButton
        Left = 114
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 122
        Top = 0
        Action = acRefresh
      end
      object ToolButton6: TToolButton
        Left = 179
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 187
        Top = 0
        Action = acClose
      end
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 40
    Width = 475
    Height = 250
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsSpisanieVid
      DataController.Filter.MaxValueListCount = 1000
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1050#1086#1083'-'#1074#1086': 0'
          Kind = skCount
          Column = cxGrid1DBTableView1FC_NAME
        end>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnPopup.MaxDropDownItemCount = 12
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Appending = True
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.Indicator = True
      Preview.AutoHeight = False
      Preview.MaxLineCount = 2
      Styles.ContentEven = dmMain.cxStyleGridEvenRow
      Styles.ContentOdd = dmMain.cxStyleGridOddRow
      Styles.Selection = dmMain.cxStyleGridSelectedRow
      object cxGrid1DBTableView1FK_ID: TcxGridDBColumn
        DataBinding.FieldName = 'FK_ID'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = False
        Visible = False
        Options.Editing = False
        Options.Filtering = False
        Width = 56
      end
      object cxGrid1DBTableView1FC_NAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_NAME'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 0
        Properties.ReadOnly = False
        Properties.OnEditValueChanged = cxGrid1DBTableView1FC_NAMEPropertiesEditValueChanged
        Options.Filtering = False
        Width = 347
      end
      object cxGrid1DBTableView1FL_DEL: TcxGridDBColumn
        Caption = #1059#1076#1072#1083#1077#1085#1086
        DataBinding.FieldName = 'FL_DEL'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Editing = False
        Width = 70
      end
      object cxGrid1DBTableView1FN_DOCTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'FN_DOCTYPE'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.ImmediatePost = True
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 32
    Top = 192
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
  object dsSpisanieVid: TDataSource
    DataSet = odsSpisanieVid
    Left = 32
    Top = 144
  end
  object odsSpisanieVid: TOracleDataSet
    SQL.Strings = (
      'SELECT  TSPISANIEVID.ROWID,'
      '        TSPISANIEVID.*'
      ' FROM MED.TSPISANIEVID'
      
        'WHERE NVL(TSPISANIEVID.FL_DEL,0) = 0 and (TSPISANIEVID.FN_DOCTYP' +
        'E = :DOCTYPE)'
      'ORDER BY Lower(FC_NAME)')
    Optimize = False
    Variables.Data = {
      0300000001000000080000003A444F4354595045030000000000000000000000}
    SequenceField.Field = 'FK_ID'
    SequenceField.Sequence = 'MED.SEQ_TSPISANIEVID'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000006000000464C5F44454C0100000000000A000000464E5F44
      4F4354595045010000000000}
    UniqueFields = 'FK_ID'
    RefreshOptions = [roAfterInsert, roAllFields]
    UpdatingTable = 'MED.TSPISANIEVID'
    Session = dmMain.os
    AfterScroll = odsSpisanieVidAfterScroll
    Left = 32
    Top = 98
  end
end
