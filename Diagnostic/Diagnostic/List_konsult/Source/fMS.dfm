object frmMS: TfrmMS
  Left = 369
  Top = 197
  BorderStyle = bsDialog
  Caption = #1054#1090#1084#1077#1090#1082#1072' '#1084#1077#1076#1089#1077#1089#1090#1088#1099
  ClientHeight = 302
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grMs: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 410
    Height = 249
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object tvMs: TcxGridDBTableView
      OnKeyDown = tvMsKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvMsCellDblClick
      DataController.DataSource = dsMs
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvName: TcxGridDBColumn
        Caption = #1060#1048#1054
        DataBinding.FieldName = 'fc_name'
        Width = 255
      end
      object tvSpec: TcxGridDBColumn
        Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
        DataBinding.FieldName = 'fc_spec'
        Width = 147
      end
    end
    object grMsLevel1: TcxGridLevel
      GridView = tvMs
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 255
    Width = 410
    Height = 44
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bOk: TcxButton
      Left = 249
      Top = 8
      Width = 75
      Height = 25
      Action = aOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object bCancel: TcxButton
      Left = 327
      Top = 8
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object al: TActionList
    Left = 208
    Top = 8
    object aOk: TAction
      Caption = #1054#1082
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object dsMs: TDataSource
    DataSet = odsMs
    Left = 160
    Top = 8
  end
  object odsMs: TOracleDataSet
    SQL.Strings = (
      'select tsotr.fk_id,'
      '       tsotr.fc_fam || '#39' '#39' || '
      
        '       decode(asu.varcharisnull(tsotr.fc_name), 1, '#39#39', substr(ts' +
        'otr.fc_name, 0, 1) || '#39'. '#39' || '
      
        '       decode (asu.varcharisnull(tsotr.fc_otch), 1, '#39#39', substr(t' +
        'sotr.fc_otch, 0, 1) || '#39'. '#39')) as fc_name,'
      '       ts_sprav.fc_name as fc_spec'
      '  from asu.tsotr, asu.ts_sprav'
      ' where tsotr.fk_spravid = ts_sprav.fk_id'
      '   and fk_otdelid = :pfk_otdelid'
      
        '   and ((ts_sprav.fc_name like '#39'%'#1089#1077#1089#1090#1088#1072'%'#39') or (ts_sprav.fc_name ' +
        'like '#39'%'#1073#1088#1072#1090'%'#39'))'
      '   and tsotr.fl_del = 0')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A50464B5F4F5444454C49440300000004000000
      0601000000000000}
    Session = frmMain.os
    BeforeOpen = odsMsBeforeOpen
    Left = 120
    Top = 8
  end
end
