object FrmUchGrpsChanges: TFrmUchGrpsChanges
  Left = 0
  Top = 0
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1081' '#1091#1095#1077#1090#1085#1086#1081' '#1075#1088#1091#1087#1087#1099
  ClientHeight = 456
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object clbr1: TCoolBar
    Left = 0
    Top = 0
    Width = 737
    Height = 42
    AutoSize = True
    Bands = <
      item
        Control = tlb1
        ImageIndex = -1
        MinHeight = 36
        Width = 733
      end>
    BorderWidth = 1
    EdgeBorders = [ebTop]
    ExplicitWidth = 643
    object tlb1: TToolBar
      Left = 9
      Top = 0
      Width = 724
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
      object btn3: TToolButton
        Left = 0
        Top = 0
        Width = 1
        Caption = 'btn3'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object btnInsert: TToolButton
        Left = 1
        Top = 0
        Action = acInsert
      end
      object btn6: TToolButton
        Left = 58
        Top = 0
        Action = acDelete
      end
      object ToolButton1: TToolButton
        Left = 115
        Top = 0
        Action = acRefresh
      end
      object btn8: TToolButton
        Left = 172
        Top = 0
        Width = 8
        Caption = 'btn8'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object btn11: TToolButton
        Left = 180
        Top = 0
        Action = acExit
      end
    end
  end
  object grdUchGrpChanges: TcxGrid
    Left = 0
    Top = 42
    Width = 737
    Height = 414
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 643
    object grdUchGrpChangesTabVw: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsMedicUchGrpChanges
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      object grdUchGrpChangesTabVwDATE_END: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
        DataBinding.FieldName = 'date_end'
        Width = 162
      end
      object grdUchGrpChangesTabVwUCHGR_NAME: TcxGridDBColumn
        Caption = #1059#1095#1077#1090#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
        DataBinding.FieldName = 'uchgrid'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'UCHGRID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_UCHGR'
          end
          item
            FieldName = 'FC_QUOTA_CODE_2'
          end>
        Properties.ListSource = dmMain.dsUchGr
        Width = 328
      end
      object grdUchGrpChangesTabVwROWID: TcxGridDBColumn
        DataBinding.FieldName = 'ROWID'
        Visible = False
      end
      object grdUchGrpChangesTabVwMO_NAME: TcxGridDBColumn
        Caption = #1040#1074#1090#1086#1088' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
        DataBinding.FieldName = 'MOID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'MOID'
        Properties.ListColumns = <
          item
            FieldName = 'FC_NAME'
          end>
        Properties.ListSource = dmMain.dsMO
        Properties.ReadOnly = True
        Width = 185
      end
    end
    object grdUchGrpChangesLvl: TcxGridLevel
      GridView = grdUchGrpChangesTabVw
    end
  end
  object odsMedicUchGrpChanges: TOracleDataSet
    SQL.Strings = (
      'select rowid, '
      '       T.DATE_BEG, '
      '       T.DATE_END, '
      '       T.UCHGRID, '
      '       T.MOID'
      '  from MED.TMEDIC_CHRONO T'
      ' where T.MEDICID = :P_MEDICID'
      ' order by DATE_END')
    ReadBuffer = 300
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A505F4D45444943494403000000040000000100
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000070000005543484752494401000000000008000000444154
      455F42454701000000000008000000444154455F454E44010000000000040000
      004D4F4944010000000000}
    Cursor = crSQLWait
    LockingMode = lmNone
    RefreshOptions = [roAfterUpdate, roAllFields]
    UpdatingTable = 'med.tmedic_chrono'
    Session = dmMain.os
    Left = 48
    Top = 100
  end
  object dsMedicUchGrpChanges: TDataSource
    DataSet = odsMedicUchGrpChanges
    Left = 90
    Top = 102
  end
  object aclMain: TActionList
    Images = dmMain.ilMain
    Left = 232
    Top = 88
    object acInsert: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 21
      OnExecute = acInsertExecute
      OnUpdate = acInsertUpdate
    end
    object acDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 22
      OnExecute = acDeleteExecute
      OnUpdate = acInsertUpdate
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 15
      OnExecute = acRefreshExecute
    end
    object acExit: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 1
      OnExecute = acExitExecute
    end
  end
end
