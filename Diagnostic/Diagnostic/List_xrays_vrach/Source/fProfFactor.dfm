object frmProfFactor: TfrmProfFactor
  Left = 337
  Top = 120
  BorderStyle = bsDialog
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1086#1092#1092#1072#1082#1090#1086#1088#1086#1074
  ClientHeight = 392
  ClientWidth = 736
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
  object grList: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 730
    Height = 342
    Align = alTop
    PopupMenu = pmGrid
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object tvList: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = tvListKod
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
      object tvListKod: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'CODE'
      end
      object tvListName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAME'
      end
      object tvListFak: TcxGridDBColumn
        Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081' '#1091#1088#1086#1074#1077#1085#1100
        DataBinding.FieldName = 'FC_FAK_FAK'
      end
    end
    object grListLevel1: TcxGridLevel
      GridView = tvList
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 348
    Width = 730
    Height = 41
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bClose: TcxButton
      Left = 645
      Top = 7
      Width = 75
      Height = 25
      Action = aClose
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 480
    Top = 88
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ShortCut = 27
      OnExecute = aCloseExecute
    end
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select p.code, p.name, pp.fc_fak_fak'
      '  from asu.tproffactor_peoples pp,'
      '       asu.tproffactor         p,'
      '       asu.tprofp_list         l,'
      '       asu.tprofp_list_naz     n'
      ' where l.fk_id = pp.fk_pacid'
      '   and pp.fk_profactor = p.fk_id'
      '   and l.fk_id = n.fk_listid'
      '   and n.fk_nazid = :PNAZID'
      '   and l.fk_ambulanceid = :PACID')
    Optimize = False
    Variables.Data = {
      0300000002000000070000003A504E415A494403000000000000000000000006
      0000003A5041434944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000004000000434F4445010000000000040000004E414D450100
      000000000A00000046435F46414B5F46414B010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 280
    Top = 152
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 280
    Top = 208
  end
  object pmGrid: TPopupMenu
    Left = 424
    Top = 200
    object N1: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FDF1
        E500FDF1E500FFEDD500FFE9CE00FFE3C500FEDEBC00FFDAB100FFD5A600FFD1
        9F00FFCC9800FFD8A100BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FBF3
        EA00FBF3EA00FFEFDC00FFEDD500FEE5CA00FFE3C500FFDAB100FFDAB100FFD5
        A600FFCC9800FFD8A100BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF6
        F000FBF3EA00FDF1E500FFEDD500FFE9CE00FFE3C500FEDEBC00FFDAB100FED7
        AB00FFD5A600FFD5A600BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FBF3EA00FDF1E500FFEDD500FEE5CA00FFE3C500FEDEBC00FFDA
        B100FFD8A100FED7AB00BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FCF8F700FDF1E500FFEFDC00FFEDD500FEE5CA00FFE9C200DEC2
        B100DEBDA600FFE9B200BC4B0000FF00FF00FF00FF00FF00FF00BC4B0000FCF8
        F700FCF8F700FCF8F700FCF8F700FBF3EA00FDF1E500FFF2D700D9C2C100090A
        9000090A9000D5BBAC00BC4B0000FF00FF00090A900000028F00BC4B0000FAEF
        E500FBF3EA00FBF3EA00FDF1E500FAE7D400FEE5CA00FFE3C500C1A5A700090A
        9000112DEA00090A900065416600090A90000622EB0000039200BC4B0000BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000EF9037009754
        3D00090A90001933E200090A9000122DE50000039200FF00FF00FF00FF00BC4B
        0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
        000045265800090A90003C66FF00090A9000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00090A9000354CE000090A90002C46E700090A9000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00090A
        90004F65E70006099000FF00FF00090A90002C46E70006099000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00090A
        9000090A9000FF00FF00FF00FF00FF00FF000609900000028F00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      OnClick = N1Click
    end
  end
end
