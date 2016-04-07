object frmAddEditAllergy: TfrmAddEditAllergy
  Left = 476
  Top = 157
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077
  ClientHeight = 178
  ClientWidth = 377
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
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 371
    Height = 128
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 10
      Top = 16
      Caption = #1051#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1072#1103' '#1085#1077#1087#1077#1088#1077#1085#1086#1089#1080#1084#1086#1089#1090#1100':'
    end
    object cxLabel2: TcxLabel
      Left = 10
      Top = 64
      Caption = #1061#1072#1088#1072#1082#1090#1077#1088' '#1087#1086#1073#1086#1095#1085#1086#1075#1086' '#1076#1077#1081#1089#1090#1074#1080#1103':'
    end
    object lcbLe: TcxLookupComboBox
      Left = 10
      Top = 40
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'fk_id'
      Properties.ListColumns = <
        item
          FieldName = 'fc_name'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsList
      Properties.PostPopupValueOnTab = True
      Properties.OnChange = lcbLePropertiesChange
      TabOrder = 2
      Width = 351
    end
    object peChar: TcxPopupEdit
      Left = 10
      Top = 89
      Properties.PopupControl = paPopup
      Properties.OnPopup = peCharPropertiesPopup
      TabOrder = 3
      Width = 351
    end
    object paPopup: TPanel
      Left = 896
      Top = 89
      Width = 305
      Height = 288
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 4
      object grListChar: TcxGrid
        Left = 2
        Top = 30
        Width = 301
        Height = 256
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object tvListChar: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsListC
          DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = tvListCharName
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          OptionsView.Indicator = True
          object tvListCharCheck: TcxGridDBColumn
            Caption = '_'
            DataBinding.FieldName = 'FL_CHECK'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
          end
          object tvListCharName: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_NAME'
            Options.Editing = False
          end
          object tvListCharID: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'FK_ID'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object grListCharLevel1: TcxGridLevel
          GridView = tvListChar
        end
      end
      object dxBarDockControl1: TdxBarDockControl
        Left = 2
        Top = 2
        Width = 301
        Height = 28
        Align = dalTop
        BarManager = BM
        SunkenBorder = True
        UseOwnSunkenBorder = True
      end
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 134
    Width = 371
    Height = 41
    Margins.Top = 0
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bOk: TcxButton
      Left = 198
      Top = 8
      Width = 75
      Height = 25
      Action = aOk
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object bCancel: TcxButton
      Left = 286
      Top = 8
      Width = 75
      Height = 25
      Action = aEsc
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object al: TActionList
    Left = 51
    Top = 115
    object aOk: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aEsc: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aEscExecute
    end
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name, fn_order'
      '  from asu.tsmid'
      ' where level <> 1'
      'start with fc_synonim = '#39'PD_LEKALERG'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 251
    Top = 27
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 299
    Top = 27
  end
  object odsListC: TOracleDataSet
    SQL.Strings = (
      'select rowid, 0 as fl_check, fk_id, fc_name, fn_order'
      '  from asu.tsmid'
      ' where level <> 1'
      'start with fc_synonim = '#39'PD_POBOCHD'#39
      'connect by prior fk_id = fk_owner'
      'order by fn_order')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F5244455201000000000008000000464C
      5F434845434B010000000000}
    Session = frmMain.os
    Left = 251
    Top = 75
    object odsListCFL_CHECK: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'FL_CHECK'
    end
    object odsListCFK_ID: TFloatField
      FieldName = 'FK_ID'
      Required = True
    end
    object odsListCFC_NAME: TStringField
      FieldName = 'FC_NAME'
      Size = 255
    end
    object odsListCFN_ORDER: TFloatField
      FieldName = 'FN_ORDER'
    end
  end
  object dsListC: TDataSource
    DataSet = odsListC
    Left = 299
    Top = 75
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
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 699
    Top = 115
    DockControlHeights = (
      0
      0
      0
      0)
    object BMBar1: TdxBar
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
      FloatLeft = 1384
      FloatTop = 10
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbSet'
        end
        item
          Visible = True
          ItemName = 'bbCancel'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbSet: TdxBarButton
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Category = 0
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Visible = ivAlways
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000800000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000800000008000000080
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000080000000800000008000000080
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00008000000080000000800000008000000080
        000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000800000008000000080000000800000FF00FF000080
        000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000800000008000000080000000800000FF00FF00FF00FF000080
        00000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000800000008000000080000000800000FF00FF00FF00FF00FF00FF00FF00
        FF000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00008000000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00008000000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00008000000080000000800000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000080000000800000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00008000000080000000800000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000080000000800000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000080000000800000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      PaintStyle = psCaptionGlyph
      OnClick = bbSetClick
    end
    object bbCancel: TdxBarButton
      Caption = #1054#1090#1084#1077#1085#1072
      Category = 0
      Hint = #1054#1090#1084#1077#1085#1072
      Visible = ivAlways
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00043E9000043E9000043E9000043E9000043E
        9000043E9000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00034BB400034BB4000C5DCF004586CF006392C7005E8CBF003D73
        B40008479F00003A9900043E9000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00034BB400045BDE0077B1F000F6F4F600D9E6F000B7D3F000B5D0EE00CFDA
        E600DED9D5005580B0000141A400043E9000FF00FF00FF00FF00FF00FF00034B
        B400045BDE009ECAF800FEFEFF00599EEF001069E500025CE200025CE2001069
        E5005CA0EF00F8F4EF00809EBC000141A400043E9000FF00FF00FF00FF00034B
        B4007AB5F600FEFEFF00287BE700025CE2000055E000025CE2000055E000025C
        E2000055E0003688ED00F8FAF6005E8CBF00043E9000FF00FF000F6ADE001169
        DE00FEFEFF00599EEF00025CE200E9F3FD0088BCF3000055E000025CE200C4DD
        F900C4DDF900025CE20064A6F200EEEAE700094FAF00043E90000F6ADE005DA5
        F200E6F2FD001674E7000565E500C4DDF900FEFEFF0088BCF300C4DDF900FEFE
        FF0088BCF3000055E0000D67E200E3EEF7004787D100043E90000F6ADE0088BC
        F300C6E1FA001176EA00096DE9001176EA00C9E2FB00FEFEFF00FEFEFF0088BC
        F300025CE2000055E000025CE200C4DDF90070A9E600043E90000F6ADE0089C4
        F700C9E2FB001A82EE00117AED001A82EE00C9E2FB00FEFEFF00FEFEFF0088BC
        F3000055E000025CE2000055E000C4DDF9007AB5F600043E90000F6ADE0076BD
        F900E9F3FD003599F3001E89F000C9E2FB00FEFEFF0096C7F700C6E1FA00FEFE
        FF0088BCF300004FE0001069E500E9F3FD00529EF400043E90000F6ADE003599
        F300FEFEFF007FC5FA002996F400EFF8FF009ECAF800117AED00117AED00C9E2
        FB00C4DDF900004FE00066A7EF00FEFEFF000D67E200043E9000FF00FF000F6A
        DE00A5DDFD00FEFEFF005AB6F8002A99F4001E89F0001A82EE000B70E9000768
        E700025CE2003688ED00FEFEFF0070AFF400034BB400FF00FF00FF00FF000F6A
        DE0041AFFC00C5EDFF00FEFEFF0081C7FA003599F3001E89F000117AED001878
        E9005CA0EF00FEFEFF009ECAF800045BDE00034BB400FF00FF00FF00FF00FF00
        FF000F6ADE0045B4FE00A5DDFD00FEFEFF00E9F3FD00C9E2FB00C9E2FB00E6F2
        FD00FEFEFF0070AFF400045BDE00034BB400FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000F6ADE001169DE003AA0F60076BDF9008EC7F80087C0F6005DA5
        F2000F6AE000034BB400034BB400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000F6ADE000F6ADE000F6ADE000F6ADE000F6A
        DE000F6ADE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      PaintStyle = psCaptionGlyph
      OnClick = bbCancelClick
    end
  end
end
