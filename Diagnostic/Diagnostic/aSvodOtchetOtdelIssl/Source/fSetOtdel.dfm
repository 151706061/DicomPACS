object frmSetOtdel: TfrmSetOtdel
  Left = 382
  Top = 82
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1086#1090#1076#1077#1083#1077#1085#1080#1103
  ClientHeight = 528
  ClientWidth = 568
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
  object tlOtdel: TcxDBTreeList
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 562
    Height = 470
    Align = alTop
    Bands = <
      item
      end>
    BufferedPaint = False
    DataController.DataSource = dsOtdel
    DataController.ParentField = 'FK_OWNERID'
    DataController.KeyField = 'FK_ID'
    LookAndFeel.Kind = lfFlat
    OptionsBehavior.CellHints = True
    OptionsBehavior.IncSearch = True
    OptionsData.CancelOnExit = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsView.ColumnAutoWidth = True
    OptionsView.Indicator = True
    RootValue = -1
    TabOrder = 0
    OnFocusedNodeChanged = tlOtdelFocusedNodeChanged
    object cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn
      Caption.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DataBinding.FieldName = 'FC_NAME'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 476
    Width = 562
    Height = 49
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 192
    ExplicitTop = 480
    ExplicitWidth = 185
    ExplicitHeight = 41
    object cxButton1: TcxButton
      Left = 393
      Top = 11
      Width = 75
      Height = 25
      Action = aOk
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton2: TcxButton
      Left = 474
      Top = 11
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object dsOtdel: TDataSource
    DataSet = odsOtdel
    Left = 400
    Top = 88
  end
  object odsOtdel: TOracleDataSet
    SQL.Strings = (
      '/*select totdel.*,'
      '       connect_by_root fk_id as fk_id_root '
      '  from asu.totdel'
      ' where fl_del = 0'
      'start with fk_id = asu.get_priem_otd'
      'connect by prior fk_id = fk_ownerid '
      ''
      'union all */'
      ''
      'select totdel.*,'
      '       connect_by_root fk_id as fk_id_root '
      '  from asu.totdel'
      ' where fl_del = 0'
      'start with fk_id = asu.get_stotdel'
      'connect by prior fk_id = fk_ownerid'
      ''
      'union all'
      ''
      'select totdel.*,'
      '       connect_by_root fk_id as fk_id_root '
      '  from asu.totdel'
      ' where fl_del = 0'
      'start with fk_id = asu.get_polikliniki_fkid'
      'connect by prior fk_id = fk_ownerid')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F49440100000000000A000000464B5F4F57
      4E455249440100000000000700000046435F4E414D4501000000000006000000
      464C5F44454C0100000000000800000046435F53484F52540100000000000A00
      0000464B5F49445F524F4F54010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 400
    Top = 144
  end
  object al: TActionList
    Left = 192
    Top = 248
    object aOk: TAction
      Caption = 'Ok'
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
