object frmSetDs: TfrmSetDs
  Left = 203
  Top = 171
  BorderStyle = bsDialog
  Caption = #1044#1080#1072#1075#1085#1086#1079#1099' '#1087#1072#1094#1080#1077#1085#1090#1072
  ClientHeight = 336
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grDs: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 856
    Height = 286
    Align = alTop
    PopupMenu = pmTV
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    LookAndFeel.SkinName = ''
    object tvDs: TcxGridDBTableView
      OnKeyDown = tvDsKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = tvDsCellDblClick
      DataController.DataSource = dsDs
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = tvDs_Ds
        end>
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
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvDs_Date: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'FD_DATE'
      end
      object tvDs_Ds: TcxGridDBColumn
        Caption = #1044#1080#1072#1075#1085#1086#1079
        DataBinding.FieldName = 'FC_WRITE'
      end
      object tvDs_Kod: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1052#1050#1041
        DataBinding.FieldName = 'MKB10'
      end
      object tvDs_Vid: TcxGridDBColumn
        Caption = #1042#1080#1076
        DataBinding.FieldName = 'VIDDS'
      end
      object tvDs_Type: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'TYPEDS'
      end
    end
    object grDsLevel1: TcxGridLevel
      GridView = tvDs
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 292
    Width = 856
    Height = 41
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 512
    ExplicitTop = 288
    ExplicitWidth = 185
    object cxButton2: TcxButton
      Left = 697
      Top = 8
      Width = 75
      Height = 25
      Action = aOk
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton1: TcxButton
      Left = 775
      Top = 8
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 320
    Top = 192
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object odsDs: TOracleDataSet
    SQL.Strings = (
      'select fk_id,'
      '       fk_pacid,'
      '       asu.get_mkb10_from_tsmid(fk_smdiagid) as mkb10,'
      '       fk_smdiagid,       '
      '       fc_write,'
      '       fd_date,'
      '       asu.get_smidname(fl_main) as vidds,'
      '       asu.get_smidname(fp_type) as typeds  '
      '  from asu.tdiag'
      
        ' where fk_pacid in (select fk_id from asu.tambulance where fk_pe' +
        'plid = asu.get_peplid(:pfk_pacid)'
      '                    union all'
      
        '                    select fk_id from asu.tkarta where fk_peplid' +
        ' = asu.get_peplid(:pfk_pacid)) '
      'order by fd_date desc                    '
      '                    ')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464B5F504143494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000005000000464B5F494401000000000008000000464B5F5041
      434944010000000000050000004D4B4231300100000000000800000046435F57
      524954450100000000000700000046445F444154450100000000000500000056
      4944445301000000000006000000545950454453010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 544
    Top = 176
  end
  object dsDs: TDataSource
    DataSet = odsDs
    Left = 544
    Top = 128
  end
  object pmTV: TPopupMenu
    Images = frmMain.IL
    Left = 240
    Top = 66
    object N2: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 4
      OnClick = N2Click
    end
  end
end
