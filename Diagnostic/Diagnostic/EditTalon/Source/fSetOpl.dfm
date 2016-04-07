object frmSetOpl: TfrmSetOpl
  Left = 378
  Top = 85
  BorderStyle = bsDialog
  Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099
  ClientHeight = 434
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGr: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 412
    Height = 384
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    ExplicitLeft = -2
    ExplicitHeight = 381
    object TV: TcxGridDBTableView
      OnKeyDown = TVKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = TVCellDblClick
      DataController.DataSource = dsList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = VNAME
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VNAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'FC_OPLATANAME'
        Width = 307
      end
      object VDATEEND: TcxGridDBColumn
        Caption = #1044#1077#1081#1089#1090#1074'. '#1087#1086':'
        DataBinding.FieldName = 'FD_END'
        Width = 91
      end
    end
    object cxGrLevel1: TcxGridLevel
      GridView = TV
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 390
    Width = 412
    Height = 41
    Margins.Top = 0
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 249
      Top = 8
      Width = 75
      Height = 25
      Action = aOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton2: TcxButton
      Left = 330
      Top = 8
      Width = 75
      Height = 25
      Action = aCancel
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 152
    Top = 104
    object aOk: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
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
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select rownum nrow, '
      '       t1.*, '
      '       sysdate as d'
      '  from (select tinsurdocs.fk_id fk_insurance,'
      
        '               fc_name || '#39' '#39'||tinsurdocs.fc_ser||'#39'  '#39'||tinsurdo' +
        'cs.fc_num fc_oplataname,'
      
        '               case when tinsurdocs.fd_prolong > tinsurdocs.fd_e' +
        'nd then '
      '                 tinsurdocs.fd_prolong '
      '               else tinsurdocs.fd_end '
      '               end fd_end, '
      '               ttypedoc.fk_id typeid,'
      '               ttypedoc.fc_name, '
      '               ttypedoc.fn_order,'
      '               ttypedoc.fl_notdoc,'
      '               ttypedoc.fc_synonim'
      '          from asu.ttypedoc,asu.tinsurdocs,asu.tpeoples'
      '         where ttypedoc.fk_id=tinsurdocs.fk_typedocid'
      '           and tpeoples.fk_id=tinsurdocs.fk_peplid'
      
        '           and tpeoples.fk_id=asu.pkg_regist_peplfunc.get_pepl_i' +
        'd(:pacid)'
      '              '
      '        union all'
      '        '
      '        select tinsurnotdocs.fk_insurid,'
      '               ttypedoc.fc_name,'
      '               to_date(null),'
      '               ttypedoc.fk_id, '
      '               ttypedoc.fc_name,'
      '               ttypedoc.fn_order,'
      '               ttypedoc.fl_notdoc,'
      '               ttypedoc.fc_synonim'
      '          from asu.ttypedoc, asu.tinsurnotdocs'
      '         where ttypedoc.fl_notdoc = 1'
      '           and tinsurnotdocs.fk_typedoc = ttypedoc.fk_id) t1'
      ''
      'order by fn_order'
      '')
    Optimize = False
    Variables.Data = {0300000001000000060000003A5041434944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000700000046435F4E414D45010000000000040000004E524F
      570100000000000C000000464B5F494E535552414E43450100000000000D0000
      0046435F4F504C4154414E414D450100000000000600000046445F454E440100
      000000000600000054595045494401000000000008000000464E5F4F52444552
      01000000000009000000464C5F4E4F54444F4301000000000001000000440100
      00000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 232
    Top = 176
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 272
    Top = 176
  end
end
