object frmMain: TfrmMain
  Left = 0
  Top = -77
  Caption = #1052#1077#1085#1077#1076#1078#1077#1088' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
  ClientHeight = 777
  ClientWidth = 1169
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxSplitter2: TcxSplitter
    Left = 280
    Top = 0
    Width = 8
    Height = 777
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 60
    AllowHotZoneDrag = False
    Control = paLeft
    OnBeforeOpen = cxSplitter2BeforeOpen
    OnBeforeClose = cxSplitter2BeforeClose
  end
  object paMain: TPanel
    Left = 288
    Top = 0
    Width = 881
    Height = 777
    Margins.Left = 0
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object dxBarDockControl1: TdxBarDockControl
      AlignWithMargins = True
      Left = 0
      Top = 3
      Width = 878
      Height = 58
      Margins.Left = 0
      Align = dalTop
      BarManager = BM
      SunkenBorder = True
      UseOwnColor = True
      UseOwnSunkenBorder = True
    end
    object pcMain: TcxPageControl
      AlignWithMargins = True
      Left = 0
      Top = 64
      Width = 878
      Height = 710
      Margins.Left = 0
      Margins.Top = 0
      ActivePage = cxTabSheet2
      Align = alClient
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Black'
      ParentShowHint = False
      ShowHint = True
      Style = 11
      TabOrder = 1
      OnChange = pcMainChange
      ClientRectBottom = 704
      ClientRectLeft = 3
      ClientRectRight = 872
      ClientRectTop = 26
      object cxTabSheet1: TcxTabSheet
        Caption = #1040#1088#1093#1080#1074
        ImageIndex = 0
        object sListImages: TcxSplitter
          Left = 0
          Top = 316
          Width = 869
          Height = 8
          HotZoneClassName = 'TcxXPTaskBarStyle'
          HotZone.SizePercent = 61
          AlignSplitter = salTop
          AllowHotZoneDrag = False
          AutoPosition = False
          PositionAfterOpen = 2
          Control = gbMainList
          ShowHint = False
          ParentShowHint = False
          ExplicitWidth = 8
        end
        object gbListImages: TcxGroupBox
          Left = 0
          Top = 324
          Align = alClient
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.SkinName = 'Black'
          StyleDisabled.LookAndFeel.SkinName = 'Black'
          StyleFocused.LookAndFeel.SkinName = 'Black'
          StyleHot.LookAndFeel.SkinName = 'Black'
          TabOrder = 1
          Height = 354
          Width = 869
          object cxGr: TcxGrid
            Left = 1
            Top = 35
            Width = 867
            Height = 318
            Margins.Left = 0
            Align = alClient
            PopupMenu = pmTV
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object TVList: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              OnFocusedRecordChanged = TVListFocusedRecordChanged
              DataController.DataSource = dsListImages
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
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
              OptionsSelection.MultiSelect = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              OptionsView.Indicator = True
              object VListColumn1: TcxGridDBColumn
                DataBinding.FieldName = 'INSTANCEUID'
                Width = 500
              end
            end
            object cxGrLevel1: TcxGridLevel
              GridView = TVList
            end
          end
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 867
            Height = 34
            Align = alTop
            TabOrder = 1
            object cxButton1: TcxButton
              Left = 7
              Top = 5
              Width = 64
              Height = 25
              Caption = #1057#1085#1080#1084#1082#1080
              TabOrder = 0
              OnClick = cxButton1Click
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.SkinName = 'Office2007Green'
            end
          end
        end
        object gbMainList: TcxGroupBox
          Left = 0
          Top = 0
          Align = alTop
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.SkinName = 'Black'
          Style.Shadow = False
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.SkinName = 'Black'
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.SkinName = 'Black'
          StyleHot.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.SkinName = 'Black'
          TabOrder = 2
          Height = 316
          Width = 869
          object cxGrid2: TcxGrid
            Left = 1
            Top = 1
            Width = 867
            Height = 314
            Margins.Left = 0
            Align = alClient
            PopupMenu = pmTV
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object cxGridDBTableView1: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              OnFocusedRecordChanged = TVListFocusedRecordChanged
              DataController.DataSource = sList
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
                  Column = cxGridDBColumn14
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
              OptionsSelection.MultiSelect = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              OptionsView.Indicator = True
              object cxGridDBColumn13: TcxGridDBColumn
                Caption = #1060#1072#1081#1083#1099
                DataBinding.FieldName = 'ExFiles'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Images = IL2
                Properties.Items = <
                  item
                    ImageIndex = 0
                    Value = 0
                  end>
                Width = 39
              end
              object cxGridDBColumn14: TcxGridDBColumn
                Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
                DataBinding.FieldName = 'P_ENAME'
                VisibleForCustomization = False
                Width = 50
              end
              object cxGridDBColumn15: TcxGridDBColumn
                Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072' ('#1088#1091#1089')'
                DataBinding.FieldName = 'P_ENAME_RUS'
                Width = 78
              end
              object cxGridDBColumn16: TcxGridDBColumn
                Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
                DataBinding.FieldName = 'P_DATEBORN'
                DateTimeGrouping = dtgByDate
                Width = 25
              end
              object cxGridDBColumn17: TcxGridDBColumn
                Caption = #1055#1086#1083
                DataBinding.FieldName = 'FP_SEX'
                Width = 21
              end
              object cxGridDBColumn18: TcxGridDBColumn
                Caption = #1044#1072#1090#1072' '#1074#1099#1087'.'
                DataBinding.FieldName = 'LDATE'
                Width = 38
              end
              object cxGridDBColumn19: TcxGridDBColumn
                Caption = #1053#1086#1084#1077#1088' '#1052#1050
                DataBinding.FieldName = 'P_PID'
                VisibleForCustomization = False
                Width = 92
              end
              object cxGridDBColumn20: TcxGridDBColumn
                Caption = 'ID '#1080#1089#1089#1083'.'
                DataBinding.FieldName = 'STUDYID'
                Width = 24
              end
              object cxGridDBColumn21: TcxGridDBColumn
                Caption = #1050#1086#1083'-'#1074#1086' '#1089#1085#1080#1084#1082#1086#1074
                DataBinding.FieldName = 'CNT'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Width = 41
              end
              object cxGridDBColumn22: TcxGridDBColumn
                Caption = #1058#1080#1087' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
                DataBinding.FieldName = 'STUDIES_IMAGE_TYPE'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Width = 35
              end
              object cxGridDBColumn23: TcxGridDBColumn
                Caption = #1054#1087#1080#1089#1072#1085#1080#1077
                DataBinding.FieldName = 'STUDYDESCRIPTION'
                Width = 137
              end
              object cxGridDBColumn24: TcxGridDBColumn
                Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
                DataBinding.FieldName = 'ACCESSIONNUMBER'
                Width = 152
              end
              object cxGridDBColumn25: TcxGridDBColumn
                DataBinding.FieldName = 'STUDYUID'
                Visible = False
              end
              object cxGridDBColumn26: TcxGridDBColumn
                Caption = #1040#1087#1087#1072#1088#1072#1090
                DataBinding.FieldName = 'FC_AEAPPARAT'
                Width = 105
              end
            end
            object cxGridLevel3: TcxGridLevel
              GridView = cxGridDBTableView1
            end
          end
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = #1051#1086#1082#1072#1083#1100#1085#1072#1103' '#1073#1072#1079#1072' '
        ImageIndex = 1
        object cxGrA: TcxGrid
          Left = 0
          Top = 0
          Width = 869
          Height = 678
          Margins.Left = 0
          Align = alClient
          PopupMenu = pmTVA
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          object TVListA: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            OnFocusedRecordChanged = TVListFocusedRecordChanged
            DataController.DataSource = locList
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                Column = cxGridDBColumn1
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
            OptionsSelection.MultiSelect = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object cxGridDBColumn1: TcxGridDBColumn
              Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
              DataBinding.FieldName = 'P_ENAME'
              VisibleForCustomization = False
              Width = 54
            end
            object cxGridDBColumn2: TcxGridDBColumn
              Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072' ('#1088#1091#1089')'
              DataBinding.FieldName = 'P_ENAME_RUS'
              Width = 82
            end
            object cxGridDBColumn3: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
              DataBinding.FieldName = 'P_DATEBORN'
              DateTimeGrouping = dtgByDate
              Width = 26
            end
            object cxGridDBColumn4: TcxGridDBColumn
              Caption = #1055#1086#1083
              DataBinding.FieldName = 'FP_SEX'
              Width = 22
            end
            object cxGridDBColumn5: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1074#1099#1087'.'
              DataBinding.FieldName = 'LDATE'
              Width = 41
            end
            object cxGridDBColumn6: TcxGridDBColumn
              Caption = #1053#1086#1084#1077#1088' '#1052#1050
              DataBinding.FieldName = 'P_PID'
              VisibleForCustomization = False
              Width = 99
            end
            object cxGridDBColumn7: TcxGridDBColumn
              Caption = 'ID '#1080#1089#1089#1083'.'
              DataBinding.FieldName = 'STUDYID'
              Width = 26
            end
            object cxGridDBColumn8: TcxGridDBColumn
              Caption = #1050#1086#1083'-'#1074#1086' '#1089#1085#1080#1084#1082#1086#1074
              DataBinding.FieldName = 'CNT'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Width = 45
            end
            object cxGridDBColumn9: TcxGridDBColumn
              Caption = #1058#1080#1087' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
              DataBinding.FieldName = 'STUDIES_IMAGE_TYPE'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Width = 36
            end
            object cxGridDBColumn10: TcxGridDBColumn
              Caption = #1054#1087#1080#1089#1072#1085#1080#1077
              DataBinding.FieldName = 'STUDYDESCRIPTION'
              Width = 148
            end
            object cxGridDBColumn11: TcxGridDBColumn
              Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
              DataBinding.FieldName = 'ACCESSIONNUMBER'
              Width = 215
            end
            object cxGridDBColumn12: TcxGridDBColumn
              DataBinding.FieldName = 'STUDYUID'
              Visible = False
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = TVListA
          end
        end
      end
      object cxTabSheet3: TcxTabSheet
        Caption = #1059#1076#1072#1083#1077#1085#1085#1072#1103' '#1073#1072#1079#1072
        ImageIndex = 2
        OnShow = cxTabSheet3Show
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cxGrid3: TcxGrid
          Left = 0
          Top = 0
          Width = 869
          Height = 678
          Align = alClient
          PopupMenu = PMRemote
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          object TVRemote: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            OnFocusedRecordChanged = TVListAFocusedRecordChanged
            DataController.DataSource = DSRemote
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                Column = VPAC_1
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
            OptionsSelection.MultiSelect = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object VPAC_1: TcxGridDBColumn
              Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
              DataBinding.FieldName = 'P_ENAME'
              VisibleForCustomization = False
              Width = 55
            end
            object P_ENAME_RUS_1: TcxGridDBColumn
              Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072' ('#1088#1091#1089')'
              DataBinding.FieldName = 'P_ENAME_RUS'
              Width = 73
            end
            object VROJD_1: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
              DataBinding.FieldName = 'P_DATEBORN'
              DateTimeGrouping = dtgByDate
              Width = 39
            end
            object VSEX_1: TcxGridDBColumn
              Caption = #1055#1086#1083
              DataBinding.FieldName = 'P_SEX'
              Width = 20
            end
            object VDATE_1: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1074#1099#1087'.'
              DataBinding.FieldName = 'LDATE'
              Width = 35
            end
            object P_PID_1: TcxGridDBColumn
              Caption = #1053#1086#1084#1077#1088' '#1052#1050
              DataBinding.FieldName = 'P_PID'
              VisibleForCustomization = False
              Width = 67
            end
            object VSTUDYID_1: TcxGridDBColumn
              Caption = 'ID '#1080#1089#1089#1083'.'
              DataBinding.FieldName = 'STUDYID'
              Width = 64
            end
            object VMODALITY_1: TcxGridDBColumn
              Caption = #1058#1080#1087' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
              DataBinding.FieldName = 'STUDIES_IMAGE_TYPE'
              Width = 73
            end
            object VDESC_1: TcxGridDBColumn
              Caption = #1054#1087#1080#1089#1072#1085#1080#1077
              DataBinding.FieldName = 'VDESC'
              Width = 188
            end
            object VACNUMBER_1: TcxGridDBColumn
              Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
              DataBinding.FieldName = 'ACCESSIONNUMBER'
              Width = 214
            end
            object VSTUDYUID_1: TcxGridDBColumn
              Caption = 'UID '#1080#1089#1089#1083#1077#1076'.'
              DataBinding.FieldName = 'STUDYUID'
              Visible = False
              Width = 22
            end
          end
          object cxGridLevel4: TcxGridLevel
            GridView = TVRemote
          end
        end
      end
      object cxTabSheet4: TcxTabSheet
        Caption = #1048#1079' '#1087#1072#1087#1082#1080
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 869
          Height = 678
          Align = alClient
          PopupMenu = pmTVB
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          object TVFolderList: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            OnFocusedRecordChanged = TVListAFocusedRecordChanged
            DataController.DataSource = dsFolderList
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                Column = P_ENAME
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
            OptionsSelection.MultiSelect = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object P_ENAME: TcxGridDBColumn
              Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
              DataBinding.FieldName = 'P_ENAME'
              VisibleForCustomization = False
              Width = 53
            end
            object P_ENAME_RUS: TcxGridDBColumn
              Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072' ('#1088#1091#1089')'
              DataBinding.FieldName = 'P_ENAME_RUS'
              Width = 70
            end
            object P_DATEBORN: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
              DataBinding.FieldName = 'P_DATEBORN'
              DateTimeGrouping = dtgByDate
              Width = 44
            end
            object P_SEX: TcxGridDBColumn
              Caption = #1055#1086#1083
              DataBinding.FieldName = 'P_SEX'
              Width = 29
            end
            object LDATE: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1074#1099#1087'.'
              DataBinding.FieldName = 'LDATE'
              Width = 36
            end
            object P_PID: TcxGridDBColumn
              Caption = 'ID '#1087#1072#1094#1080#1077#1085#1090#1072' (N '#1052#1050')'
              DataBinding.FieldName = 'P_PID'
              Width = 64
            end
            object CNT: TcxGridDBColumn
              Caption = #1050#1086#1083'-'#1074#1086' '#1089#1085#1080#1084#1082#1086#1074
              DataBinding.FieldName = 'CNT'
              Width = 26
            end
            object STUDYID: TcxGridDBColumn
              Caption = 'ID '#1080#1089#1089#1083'.'
              DataBinding.FieldName = 'STUDYID'
              Width = 60
            end
            object STUDIES_IMAGE_TYPE: TcxGridDBColumn
              Caption = #1058#1080#1087' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
              DataBinding.FieldName = 'STUDIES_IMAGE_TYPE'
              Width = 67
            end
            object P_VDESC: TcxGridDBColumn
              Caption = #1054#1087#1080#1089#1072#1085#1080#1077
              DataBinding.FieldName = 'VDESC'
              Width = 185
            end
            object ACCESSIONNUMBER: TcxGridDBColumn
              Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1090#1086#1082#1086#1083#1072
              DataBinding.FieldName = 'ACCESSIONNUMBER'
              Width = 194
            end
            object fSTUDYUID: TcxGridDBColumn
              DataBinding.FieldName = 'STUDYUID'
              Visible = False
              Width = 22
            end
            object TransferSyntax: TcxGridDBColumn
              DataBinding.FieldName = 'TransferSyntax'
              Visible = False
            end
          end
          object cxGridLevel2: TcxGridLevel
            GridView = TVFolderList
          end
        end
      end
    end
  end
  object paLeft: TPanel
    Left = 0
    Top = 0
    Width = 280
    Height = 777
    Align = alLeft
    BevelOuter = bvNone
    Constraints.MaxWidth = 280
    Constraints.MinWidth = 280
    TabOrder = 6
    object gbSearch: TcxGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Margins.Right = 0
      Align = alTop
      Caption = #1055#1086#1080#1089#1082'...'
      Style.LookAndFeel.SkinName = 'Black'
      Style.TextStyle = [fsBold]
      StyleDisabled.LookAndFeel.SkinName = 'Black'
      StyleFocused.LookAndFeel.SkinName = 'Black'
      StyleHot.LookAndFeel.SkinName = 'Black'
      TabOrder = 0
      Height = 422
      Width = 277
      object cxLabel3: TcxLabel
        Left = 6
        Top = 19
        Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072':'
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object teFIO: TcxTextEdit
        Left = 93
        Top = 18
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 1
        OnClick = teFIOClick
        OnEnter = teFIOEnter
        OnKeyDown = teFIOKeyDown
        Width = 179
      end
      object cxLabel8: TcxLabel
        Left = 6
        Top = 44
        Caption = 'ID '#1087#1072#1094#1080#1077#1085#1090#1072' (N '#1084#1077#1076#1082#1072#1088#1090#1099'):'
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object teMK: TcxTextEdit
        Left = 92
        Top = 65
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.TextColor = clBlack
        Style.TextStyle = []
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 3
        OnClick = teMKClick
        OnEnter = teMKEnter
        OnKeyDown = teMKKeyDown
        Width = 179
      end
      object cxLabel6: TcxLabel
        Left = 6
        Top = 93
        Caption = #8470' '#1087#1088#1086#1090#1086#1082#1086#1083#1072':'
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object teNum: TcxTextEdit
        Left = 93
        Top = 89
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.TextColor = clBlack
        Style.TextStyle = []
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 5
        OnKeyDown = teNumKeyDown
        Width = 179
      end
      object cxLabel9: TcxLabel
        Left = 6
        Top = 118
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object teRem: TcxTextEdit
        Left = 93
        Top = 114
        Hint = #1054#1087#1080#1089#1072#1085#1080#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.TextColor = clBlack
        Style.TextStyle = []
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 7
        OnKeyDown = teNumKeyDown
        Width = 179
      end
      object cxLabel10: TcxLabel
        Left = 6
        Top = 139
        Caption = #1052#1086#1076#1072#1083#1100#1085#1086#1089#1090#1100':'
        Transparent = True
      end
      object cbType: TcxComboBox
        Left = 93
        Top = 137
        ParentShowHint = False
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.ImmediateUpdateText = True
        Properties.Items.Strings = (
          ''
          'ECG'
          'CT'
          'CR'
          'DR'
          'OT'
          'US'
          'XA'
          'VR'
          'MR'
          'MG'
          'NM'
          'SC'
          'DX'
          'ES')
        Properties.PostPopupValueOnTab = True
        ShowHint = True
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 9
        OnKeyDown = cbTypeKeyDown
        Width = 58
      end
      object cxLabel4: TcxLabel
        Left = 6
        Top = 166
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object deDateBorn: TcxDateEdit
        Left = 93
        Top = 162
        ParentShowHint = False
        Properties.DateButtons = [btnToday]
        Properties.DateOnError = deToday
        Properties.ImmediatePost = True
        Properties.PostPopupValueOnTab = True
        Properties.ShowTime = False
        Properties.OnEditValueChanged = deBeginPropertiesEditValueChanged
        ShowHint = True
        Style.BorderStyle = ebsOffice11
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.ButtonStyle = btsOffice11
        Style.ButtonTransparency = ebtNone
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 10
        Width = 125
      end
      object cxGroupBox2: TcxGroupBox
        Left = 2
        Top = 309
        Align = alBottom
        Caption = #1044#1072#1090#1099
        Style.LookAndFeel.SkinName = 'Black'
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.SkinName = 'Black'
        StyleFocused.LookAndFeel.SkinName = 'Black'
        StyleHot.LookAndFeel.SkinName = 'Black'
        TabOrder = 12
        Height = 106
        Width = 273
        object deBegin: TcxDateEdit
          Left = 56
          Top = 20
          ParentShowHint = False
          Properties.DateButtons = [btnToday]
          Properties.DateOnError = deToday
          Properties.ImmediatePost = True
          Properties.PostPopupValueOnTab = True
          Properties.ShowTime = False
          Properties.OnEditValueChanged = deBeginPropertiesEditValueChanged
          ShowHint = True
          Style.BorderStyle = ebsOffice11
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.SkinName = 'Office2007Green'
          Style.ButtonStyle = btsOffice11
          Style.ButtonTransparency = ebtNone
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 0
          Width = 90
        end
        object bToday: TcxButton
          Left = 152
          Top = 17
          Width = 64
          Height = 25
          Caption = #1057#1077#1075#1086#1076#1085#1103
          TabOrder = 1
          OnClick = bTodayClick
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object deEnd: TcxDateEdit
          Left = 56
          Top = 46
          ParentShowHint = False
          Properties.DateButtons = [btnToday]
          Properties.DateOnError = deToday
          Properties.ImmediatePost = True
          Properties.PostPopupValueOnTab = True
          Properties.ShowTime = False
          Properties.OnEditValueChanged = deEndPropertiesEditValueChanged
          ShowHint = True
          Style.BorderStyle = ebsOffice11
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.SkinName = 'Office2007Green'
          Style.ButtonStyle = btsOffice11
          Style.ButtonTransparency = ebtNone
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 2
          Width = 90
        end
        object cbDates: TcxComboBox
          Left = 56
          Top = 72
          ParentShowHint = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownSizeable = True
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items.Strings = (
            ''
            '1 '#1076#1077#1085#1100
            '3 '#1076#1085#1103
            #1053#1077#1076#1077#1083#1103
            #1052#1077#1089#1103#1094
            #1043#1086#1076)
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = cbDatesPropertiesChange
          ShowHint = True
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          TabOrder = 3
          Width = 90
        end
        object bYesterday: TcxButton
          Left = 152
          Top = 43
          Width = 64
          Height = 25
          Caption = #1042#1095#1077#1088#1072
          TabOrder = 4
          OnClick = bYesterdayClick
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object bPeriod: TcxButton
          Left = 152
          Top = 69
          Width = 64
          Height = 25
          Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080' '#1079#1072#1082#1088#1099#1090#1100
          Caption = #1055#1077#1088#1080#1086#1076
          TabOrder = 5
          OnClick = bPeriodClick
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.SkinName = 'Office2007Green'
        end
        object cxLabel1: TcxLabel
          Left = 19
          Top = 21
          Caption = #1057':'
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 19
          Top = 47
          Caption = #1055#1086':'
          Style.LookAndFeel.SkinName = 'Office2007Green'
          StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
          StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
          StyleHot.LookAndFeel.SkinName = 'Office2007Green'
          Transparent = True
        end
      end
      object cxLabel11: TcxLabel
        Left = 6
        Top = 187
        Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1076#1080#1072#1075#1085#1086#1079':'
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object cxLabel12: TcxLabel
        Left = 6
        Top = 235
        Caption = #1057#1086#1087#1091#1090#1089#1090#1074#1091#1102#1097#1080#1081' '#1076#1080#1072#1075#1085#1086#1079':'
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
      object dxTreeViewEdit1: TdxTreeViewEdit
        Left = 6
        Top = 208
        Width = 239
        Height = 21
        CanSelectParents = True
        ParentColor = False
        TabOrder = 15
        TabStop = True
        TreeViewColor = clWindow
        TreeViewCursor = crDefault
        TreeViewFont.Charset = DEFAULT_CHARSET
        TreeViewFont.Color = clWindowText
        TreeViewFont.Height = -11
        TreeViewFont.Name = 'Tahoma,204'
        TreeViewFont.Style = []
        TreeViewIndent = 19
        TreeViewReadOnly = False
        TreeViewShowButtons = True
        TreeViewShowHint = False
        TreeViewShowLines = True
        TreeViewShowRoot = True
        TreeViewSortType = stNone
        DividedChar = '.'
        TextStyle = tvtsShort
        Alignment = taLeftJustify
      end
      object dxTreeViewEdit2: TdxTreeViewEdit
        Left = 6
        Top = 256
        Width = 239
        Height = 21
        CanSelectParents = True
        ParentColor = False
        TabOrder = 16
        TabStop = True
        TreeViewColor = clWindow
        TreeViewCursor = crDefault
        TreeViewFont.Charset = DEFAULT_CHARSET
        TreeViewFont.Color = clWindowText
        TreeViewFont.Height = -11
        TreeViewFont.Name = 'Tahoma,204'
        TreeViewFont.Style = []
        TreeViewIndent = 19
        TreeViewReadOnly = False
        TreeViewShowButtons = True
        TreeViewShowHint = False
        TreeViewShowLines = True
        TreeViewShowRoot = True
        TreeViewSortType = stNone
        DividedChar = '.'
        TextStyle = tvtsShort
        Alignment = taLeftJustify
      end
      object ClrOsnDiagBtn: TBitBtn
        Left = 251
        Top = 208
        Width = 20
        Height = 20
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100
        ParentShowHint = False
        ShowHint = True
        TabOrder = 17
        OnClick = ClrOsnDiagBtnClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          C4C9D78A96BDA2A9C1C9C9C9C9C9C9C9C9C9C9C9C9C9C9C97792C61B55BA0442
          BC1853BA6A89C0DFDFDFFBFBFBEDEDED2C4BA5355DAF2142ABDCDCDCD8D8D8D4
          D4D4D2D2D27594CA2866C92177E60579EA0164DD064EBD6A89C0F6F6F6CECECE
          C4C6CAC0C6CC2143ACFDFDFDFBFBFBF8F8F8F4F4F41D57BF639DF4187FFF0076
          F80076EE0368E11752BAFBFBFBE1E1E16379B3618FBF2246AEFAFAFAFAFAFAF6
          F6F6F3F3F30543BCAECDFEFFFFFFFFFFFFFFFFFF187FEF0442BCF6F6F6CECECE
          C4C6CAC0C6CC2249AEFAFAFAFAFAFAF8F8F8F4F4F4235BC08DB5F64D92FF1177
          FF2186FF408AEB1C55BAFBFBFBE1E1E1647CB36392C1234BAFF9F9F9F9F9F9F9
          F9F9F6F6F690AADD3D76D28DB5F7B8D6FE72A8F52F6CCB748FC2F6F6F6CECECE
          C4C6CAC0C6CD234EB1FAFAFAF9F9F9F8F8F8F7F7F7F6F6F692AEE12A61C70543
          BC1E59BF708FC6C7C7C7FBFBFBE1E1E1657FB56494C22451B2FAFAFAF8F8F8E0
          9F73DD9D71DC9A6EDA996BD9986AD4936AEAEAEAECECECC9C9C9F6F6F6CECECE
          C4C6CAC0C7CD2552B2FBFBFBFAFAFAF8F8F8F8F8F8F8F8F8F7F7F7F3F3F3F2F2
          F2F0F0F0EEEEEECCCCCCFBFBFBE1E1E16682B56596C32555B4FAFAFAFAFAFAE0
          A276E0A076E0A074DF9E73DC9C72DC9B6FF2F2F2F6F6F6C9C9C9F6F6F6CECECE
          C4C6CAC0C7CD2656B5F9F9F9F9F9F9E1A378EAC0A3EAC0A2EABFA1EABEA0DF9E
          71F4F4F4F7F7F7C9C9C9FBFBFBE1E1E16783B76699C42659B7F8F8F8F8F8F8E1
          A57AE1A378E1A377E0A276E0A076E0A074F4F4F4FAFAFAC9C9C9F6F6F6CECECE
          C4C7CAC0C7CD265BB7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F5F5F5F5F5F5F5F5
          F5F3F3F3FAFAFAC9C9C9FBFBFBE1E1E16787B9679AC5275EB8F7F7F7F7F7F7F7
          F7F7F7F7F7F5F5F5F4F4F4F4F4F4F4F4F4F2F2F2FBFBFBC9C9C9F6F6F6CECECE
          C4C7CAC1C7CD275FB8FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFCFCFCFCC9C9C9FFFFFFF1F1F1648BC24978BE2861BAC9C9C9C9C9C9C9
          C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9DFDFDF}
      end
      object ClrDopDiagBtn: TBitBtn
        Left = 251
        Top = 256
        Width = 20
        Height = 20
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
        OnClick = ClrDopDiagBtnClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          C4C9D78A96BDA2A9C1C9C9C9C9C9C9C9C9C9C9C9C9C9C9C97792C61B55BA0442
          BC1853BA6A89C0DFDFDFFBFBFBEDEDED2C4BA5355DAF2142ABDCDCDCD8D8D8D4
          D4D4D2D2D27594CA2866C92177E60579EA0164DD064EBD6A89C0F6F6F6CECECE
          C4C6CAC0C6CC2143ACFDFDFDFBFBFBF8F8F8F4F4F41D57BF639DF4187FFF0076
          F80076EE0368E11752BAFBFBFBE1E1E16379B3618FBF2246AEFAFAFAFAFAFAF6
          F6F6F3F3F30543BCAECDFEFFFFFFFFFFFFFFFFFF187FEF0442BCF6F6F6CECECE
          C4C6CAC0C6CC2249AEFAFAFAFAFAFAF8F8F8F4F4F4235BC08DB5F64D92FF1177
          FF2186FF408AEB1C55BAFBFBFBE1E1E1647CB36392C1234BAFF9F9F9F9F9F9F9
          F9F9F6F6F690AADD3D76D28DB5F7B8D6FE72A8F52F6CCB748FC2F6F6F6CECECE
          C4C6CAC0C6CD234EB1FAFAFAF9F9F9F8F8F8F7F7F7F6F6F692AEE12A61C70543
          BC1E59BF708FC6C7C7C7FBFBFBE1E1E1657FB56494C22451B2FAFAFAF8F8F8E0
          9F73DD9D71DC9A6EDA996BD9986AD4936AEAEAEAECECECC9C9C9F6F6F6CECECE
          C4C6CAC0C7CD2552B2FBFBFBFAFAFAF8F8F8F8F8F8F8F8F8F7F7F7F3F3F3F2F2
          F2F0F0F0EEEEEECCCCCCFBFBFBE1E1E16682B56596C32555B4FAFAFAFAFAFAE0
          A276E0A076E0A074DF9E73DC9C72DC9B6FF2F2F2F6F6F6C9C9C9F6F6F6CECECE
          C4C6CAC0C7CD2656B5F9F9F9F9F9F9E1A378EAC0A3EAC0A2EABFA1EABEA0DF9E
          71F4F4F4F7F7F7C9C9C9FBFBFBE1E1E16783B76699C42659B7F8F8F8F8F8F8E1
          A57AE1A378E1A377E0A276E0A076E0A074F4F4F4FAFAFAC9C9C9F6F6F6CECECE
          C4C7CAC0C7CD265BB7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F5F5F5F5F5F5F5F5
          F5F3F3F3FAFAFAC9C9C9FBFBFBE1E1E16787B9679AC5275EB8F7F7F7F7F7F7F7
          F7F7F7F7F7F5F5F5F4F4F4F4F4F4F4F4F4F2F2F2FBFBFBC9C9C9F6F6F6CECECE
          C4C7CAC1C7CD275FB8FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFCFCFCFCC9C9C9FFFFFFF1F1F1648BC24978BE2861BAC9C9C9C9C9C9C9
          C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9DFDFDF}
      end
      object teAE: TcxTextEdit
        Left = 104
        Top = 282
        Hint = #1054#1087#1080#1089#1072#1085#1080#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.SkinName = 'Office2007Green'
        Style.TextColor = clBlack
        Style.TextStyle = []
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 19
        OnKeyDown = teNumKeyDown
        Width = 167
      end
      object cxLabel5: TcxLabel
        Left = 8
        Top = 286
        Caption = 'AETitle '#1072#1087#1087#1072#1088#1072#1090#1072':'
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        Transparent = True
      end
    end
    object pcLeft: TcxPageControl
      Left = 0
      Top = 428
      Width = 280
      Height = 349
      ActivePage = cxTabSheet5
      Align = alClient
      TabOrder = 1
      ClientRectBottom = 349
      ClientRectRight = 280
      ClientRectTop = 24
      object cxTabSheet5: TcxTabSheet
        Caption = #1057#1077#1088#1074#1077#1088#1072
        ImageIndex = 0
        object grServ: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 34
          Width = 274
          Height = 288
          Margins.Top = 0
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          object tvServ: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            OnCellDblClick = tvServCellDblClick
            OnCustomDrawCell = tvServCustomDrawCell
            DataController.DataSource = sServ
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                Column = tvServName
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CellHints = True
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnMoving = False
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
            object tvServName: TcxGridDBColumn
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              DataBinding.FieldName = 'FC_COMMENT'
              Width = 107
            end
            object tvServAET: TcxGridDBColumn
              Caption = 'AE Title'
              DataBinding.FieldName = 'FC_TITLE'
              Width = 77
            end
            object tvServIP: TcxGridDBColumn
              Caption = 'IP-'#1072#1076#1088#1077#1089
              DataBinding.FieldName = 'FC_IP'
              Width = 62
            end
            object TvPRPACS: TcxGridDBColumn
              DataBinding.ValueType = 'Boolean'
              Visible = False
              Width = 20
            end
            object TvPort: TcxGridDBColumn
              Caption = #1055#1086#1088#1090
              DataBinding.FieldName = 'FN_PORT'
            end
          end
          object grServLevel1: TcxGridLevel
            GridView = tvServ
          end
        end
        object dxBarDockControl2: TdxBarDockControl
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 274
          Height = 28
          Align = dalTop
          BarManager = BM
          SunkenBorder = True
          UseOwnSunkenBorder = True
        end
      end
      object cxTabSheet6: TcxTabSheet
        Caption = #1044#1088#1091#1075#1086#1077
        ImageIndex = 1
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
    end
  end
  object BM: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      #1056#1072#1073#1086#1090#1072' '#1089#1087#1072#1087#1082#1086#1081)
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    ImageOptions.Images = IL
    LookAndFeel.Kind = lfFlat
    LookAndFeel.SkinName = ''
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 952
    Top = 288
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
      Caption = 'main'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 42
      FloatTop = 34
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbInformation'
        end
        item
          Visible = True
          ItemName = 'BtnLdList'
        end
        item
          Visible = True
          ItemName = 'bbSave'
        end
        item
          Visible = True
          ItemName = 'bbSnimok'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton2'
        end
        item
          Visible = True
          ItemName = 'bbSend'
        end
        item
          Visible = True
          ItemName = 'bbDelSnimok'
        end
        item
          Visible = True
          ItemName = 'bbImportPDF'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbClose'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BMBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Servers'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 101
      FloatTop = 37
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cxBarEditItem1'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbSet'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRef'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbEcho'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbRefresh: TdxBarLargeButton
      Action = aRefresh
      Category = 0
      AutoGrayScale = False
      HotGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDE4C4A8
        C47F4BC06922C0651ABC6B2FCC9575F5E8E0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
        E8DCC87D36DF8227FFA43FFFA33BFFA036FFA030F48B21BF5D11DFAE90FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF7E2CFC8731EFEA74DFFAA4CFFA344FFA13FFFA33BFF9D33FD9429FF
        9F29DC7314D99E7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFB0
        DB9857F4D4B4FFFFFFFBEEE3C97720FFB05BFFAD56FFA94EFFA94CF39839C86D
        18CD8852D4976DC9804DC76513BF5908EAC7B1FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFCB7A23FFCA8DD07E24F6E7D8CF893EFBB468FFB366FFAD5AFFAF5A
        E48E33C99054FAF1EAFFFFFFFFFFFFFFFFFFFAF0EACC895BBD6328FEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFD08632FFCF9AFDC285C16C13E8A053FFC487FF
        BA74FFB567EE9B43CF9B61FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DE9F77FBEFE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD39048FFD4A4FFCD9BF6BB
        7EFFCB95FFC58BFFC283FFBA73CE8231FDFBF9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCA870
        FCCC9BFFD1A2FFD0A0FFCC99FFC991FFC990DA8E34F4DFC8FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE8C398F2BF87FFD7AEFFD2A5FFD0A0FFCA98FDC488C67521F2DDC6
        FEFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF2DCC0E7AD65FFE4C8FFD5ACFFD1A3FFCD9AFF
        C993F4B26CE29339D08329FBF2E8FFFFFFFFFFFFFFFFFFFCF6F3F3E2D7E9CAB8
        DDB29AD3997DCE8E70F6E7DFFFFFFFFFFFFFFFFFFFFBF2E7E39C40FFF3E4FFDC
        BAFFD3A6FFCF9FFFCC97FFC990FFC583EA9841EBD0B1FCF7F3D1864BCD752AC6
        7230CF8447DB9862E6AE7FF3C599FACC9FBF6D3BFFFFFFFFFFFFFFFFFFFFFFFF
        EAA137FEDBB6FAD6ADF3C388EDAE62E39D46DC8D2EE48D26E19B49FDF7F3E6C5
        ADE89F5BFFD397FFD19BFFD4A3FFD7ABFFD9B0FFD8B1FFDFB6C06E35F9F0ECFF
        FFFFFFFFFFFFFFFFFEEFDBEFB76AF1BD78F4CC97F6DAB5F9E8D3FEF7F0FFFFFF
        FFFFFFFFFFFFFAEEE4C67225DB9350F2B67DFFCE9BFFD0A0FFD3A6FFD4A9FFDA
        AED08850E8D1C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBF9ECD2C0B1571DFDC791FFCC9A
        FFCF9EFFD0A0FFD4A3E3A36AD9B19DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D9C6D3
        8339FFCB92FFC78FFFCA95FFCC97FFCC96F5B981C89075FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFEFAF8C5782FFFBB77FFC383FFC588FFC98FF4B578FFCA8FFFCC8EBA734DFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF2E5F4BF7FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFED09B61EC9A44FFB567FFBA72FFC381DF914BAA4D11FEC5
        8DFFC987BA6832FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDD88722E8AD62FD
        F6EDFFFFFFFFFFFFFFFFFFFCF4ECCE9855E79033FFAF59FFAC57FFB362FBAF63
        C37A3FF2E0D4C16A24FFCF8AB86022FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF9D6AADD7F0ADE8415E3A454E7B475E0A057D37D18F69838FFA84BFFA64BFF
        AA50FFAC54C36D20F9ECE3FFFFFFECC6AEC97F50E6C3AFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF4BE72EF8B15FF982BFB9427FF9A31FF9F38FFA0
        3BFFA13FFFA84CFDAA55C7701DF6E1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C789DE8313FB9832
        FFA94AFFA94EFFAF58FFB15EE5903ACA7D34F9EADCFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF9ECDBDEAC6ED48727D47D17D27C1CCE8A45E6C5A4FEFDFCFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      SyncImageIndex = False
      ImageIndex = -1
    end
    object bbAdd: TdxBarLargeButton
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1085#1080#1084#1082#1080' '#1074#1088#1091#1095#1085#1091#1102
      Visible = ivAlways
      LargeImageIndex = 10
      ShortCut = 115
      AutoGrayScale = False
      HotGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF098E11098F13
        078B10088B0F068A0E07890D07880E048408FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF1896224DD97C36CA6638CA6637C76336C76334C4600B8D16FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF1997235FE48A3CD26C3BD16A3CD06A3ACF6937C9640C
        8E17FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1A982467E88F3FD5703ED56E3DD2
        6C3BD16B38CB660C8E17FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C9B256CEB93
        40D7703FD56F3ED46E3ED36D3ACB670D9119FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF1D9B2774ED9844D97541D77140D6703ED56F3BCE690E921AFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF189B2370EC9748DC7742D97341D87241D6703CCE6A0E
        9219FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D9717
        1BA42A129C21129C21139B21119A2012981F1BA52E4CE37F47DD7744DB7543D9
        7341D7713DD06B0F8D190A871109871109861009841008831008810F037B06FF
        FFFFFFFFFF129C1D8FFAAD52E2814CE07B4BDF7B4ADF7A49DE7849DE7949DF7B
        47DE7846DD7745DB7543DB7541D6703ED26C3ED06C3CD06B3BCD6939CD6838CC
        6734C460057E09FFFFFFFFFFFF119D1C95FAAF69ED915AE98759E88757E78556
        E68454E38252E47F4DE17E48DE7946DD7745DB7543DB7541D97341D7713ED46E
        3DD46E3DD06A3ACF6935C460057F09FFFFFFFFFFFF119F1E96FAB06FEF9560EB
        8B5FEA8C5EE98959E88756E78556E58252E38050E27D49DF7946DD7745DB7543
        D97341D87240D6703ED46E3DD26C3AD06A36C561048009FFFFFFFFFFFF139F1E
        99FBB275F19965ED9064ED8E61EC8C5FEA8B5CE98957E78655E58352E38050E3
        7D48DE7946DD7744DB7542D97341D7713FD56F3ED46E3BD16B36C66205810AFF
        FFFFFFFFFF12A01F9BFCB482F4A176F29B75F19972F0976FEF956DEE9464EB8D
        57E78655E58352E3804DE17E47DE7849DD794BDC7946DA7541D87240D66F3CD2
        6C35C76205820BFFFFFFFFFFFF15A321A8FFBF9BFCB39AFCB399FCB398FBB297
        FAB196F9AF8AF4A563EB8D57E78656E58252E28048DF7954E5857AF09E78EE9B
        73EC976CE89365E78D4FDA7C06850EFFFFFFFFFFFF0EA01B22AB2F20AA2D1FA8
        2C20A72C1FA62B1DA4292DAD3895F9AE6CED935CE98956E88553E38047DD7815
        9E261799221A992419972218962217942116942106850DFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1BA32698FAB16DEF945FEA8B59E8
        8755E58346DA750C9116FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1DA42999FCB2
        71F09761EC8C5EE98956E78446DB770D9318FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF1EA5299AFBB474F19964ED8E60EA8C58E78647DB760D9418FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF1EA72A9AFCB375F29A65ED9060EB8B58E88648DC770E
        9519FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EA82C9BFCB482F4A277F19A71EF
        966BED924DDE7A0E961AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF21AA2EA8FFBF
        9BFDB39AFAB397FAB196FAB08CF8AB139C21FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF0FA01C15A32313A121149F21139E1F139D1F149D1F0C9718FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object bbClose: TdxBarLargeButton
      Action = aClose
      Category = 0
      AutoGrayScale = False
      HotGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF004E1E1F00BF4C4D00BD4B4C00C04D4E00C14E4F00C4505100C24F
        5000C5515200B64B4C00C9545500C7535400C6525300CA555600CB565700CE58
        5900CC575800C5545500D05A5B00CF595A00D35C5D00D15B5C00D55E5F00D45D
        5E00D8606200D75F6000AF4E4F00D9626300DD656600DC646500DA636400E067
        6800DE666700E2696A00E1686900E56B6C00E36A6B00E96E6F00E76D6E00E66C
        6D009F4B4C00EA6F7000A04C4D00EB707200A34E4F00EE737400ED7273009C4B
        4C00F2767700F0757600EF747500E06D6E00A6515200F6797A00F4787900F377
        7800A9535400F87B7D00F77A7B00FB7E7F00FA7D7E00AF585900AC5657009A4D
        4E00FF818200FE808100FC7F8000F77E7F00B25B5C00EE7A7B00D56F7000B860
        6200B6626300AF5E5F00FE8B8C0091515200FC929300EF909100FB9A9C00E690
        9100EB959600FAA3A400F8AAAB00F2A9AA00EEA6A700F7B5B600A5505000994B
        4B00AB555500B15A5A00B55D5D00B75F5F00914B4B00BB636300BF666600BD65
        65008C4B4B00894B4B009F58580098555500824B4B00EB9C9C00F7B1B100EECE
        AF00FFFFD300D9F6BD00B7EBAA0058A55B003F9E4C005ED3770045CA67001EBC
        4C00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        02020202026603020202020202020202020202020202020202026666625E0302
        020202020202020202020202020202666663310B052A03020202020202020202
        02020202026666411C070604042A03596666666666666666020202020266130C
        0D0E0A08092C034C4E505354685757660202020202661112100F0C0D0E2E036E
        71717171717157660202020202661714151112100F58036E7171717171715766
        0202020202661818191617141536036E7171717171715766020202020266201D
        1A1B1819163A036E7171717171715766020202020266221E1F201D1A1B5A036E
        71717171717157660202020202662324212235511F40036D7171717171715766
        020202020266282925265601673F03696C6F6F70707057660202020202662D2B
        27285501525B03696A6A6A6A6B6B5766020202020266342F302D2B4F28460369
        6A6A6A6A6A6A576602020202026639393233342F305C03696A6A6A6A6A6A5766
        0202020202663B3C37383932335D03696A6A6A6A6A6A5766020202020266443D
        3E3B3C37384903696A6A6A6A6A6A576602020202026642424344443D3E5F0369
        6A6A6A6A6A6A5766020202020266424242424243436103696A6A6A6A6A6A5766
        020202020266454242424242426003696A6A6A6A6A6A5766020202020266664B
        48424242426003696A6A6A6A6A6A57660202020202020266664D4A474260035E
        6666666666666666020202020202020202026666656403020202020202020202
        0202020202020202020202020266030202020202020202020202}
    end
    object BtnToArchiv: TdxBarLargeButton
      Action = actToArchive
      Category = 0
      AutoGrayScale = False
      HotGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFC38C8CCC9494CB9C9CCBA5A5D3B4B4D9C3C3E2D3D3EBE2E2F6F2F2
        FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFC59797D49595FFD7D7FFCDCDF8C0C0ECB7B7DF
        A9A9D19F9FC59494BC8F8FBC9696B99C9CBFABABCAB9B9D5C9C9DFD9D9ECE8E8
        F9F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCA9B9BF1D5D5DBA0A0FFDE
        DEFFD8D8FFD6D6FFD5D5FFD5D5FFD3D3FFD4D4FFD2D2FFD0D0F9C5C5EAB7B7DA
        ABABC89E9EB79191A385859E88889A8D8DA79D9DB4AFAFFFFFFFFFFFFFCE9A9A
        FFFFFFDDA7A7ECC2C2FFE7E7FFE0E0FFDEDEFFDDDDFFDBDBFFDADAFFD8D8FFD6
        D6FFD7D7FFD5D5FFD4D4FFD4D4FFD3D3FFD3D3FFD3D3FFD8D89B8181797070FF
        FFFFFFFFFFD19999FFFBFBFFEBEBD39191F7DEDEFFF0F0FFECECFFE9E9FFE7E7
        FFE6E6FFE4E4FFE2E2FFE1E1FFDFDFFFDEDEFFDCDCFFDADAFFDBDBFFE0E0A489
        89DEAEAE857676FFFFFFFFFFFFD49A9AFFFDFDFFEAEAFFDFDFD08C8CFDF6F6FF
        FAFAFFF6F6FFF3F3FFF2F2FFF0F0FFEFEFFFEDEDFFEBEBFFEAEAFFE8E8FFE7E7
        FFEFEFB29898CC9E9EFFDADA877575FFFFFFFFFFFFD79999FFFFFFFFEEEEFFE7
        E7FCD3D3D19090FFFFFFFFFFFFFFFEFEFFFFFFFFFDFDFFFAFAFFFAFAFFF7F7FF
        F7F7FFF6F6FFFEFEBBA1A1CBA1A1FFD5D5FFE1E18D7777FFFFFFFFFFFFDC9D9D
        FFFFFFFFF5F5FFECECFFE7E7F8CFCFD49393FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFB99999D4ACACFFE0E0FFDEDEFFEEEE927979FF
        FFFFFFFFFFE39E9EFFFFFFFFFDFDFFF4F4FFEDEDFFE9E9F9D4D4D69292FCF9F9
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFBB78B8BE4C9C9FFEFEFFFE9E9FFEC
        ECFFFDFD987E7EFFFFFFFFFFFFE59D9DFFFFFFFFFFFFFFFDFDFFF7F7FFF2F2FF
        F6F6EFC6C4D08181F2D6D5FFFFFFFFFFFFFFFFFFE6CAC8B87977FAF4F4FFFFFF
        FFF8F8FFF9F9FFFBFBFFFFFFA28282FFFFFFFFFFFFEA9D9DFFFFFFFFFFFFFFFF
        FFFFFFFFFFF9F8E3ACABC0B5C1AAE7FFBDB1BFD29394DC9F9FC39295B1BCCFB7
        C1D4CC9190F2E1E0FFFFFFFFFFFFFFFFFFFFFFFFA98383FFFFFFFFFFFFEE9D9D
        FFFFFFFFFFFFFFFFFFF5D0D0D8A1A4BEDCF2B9EBFFBBE9FFBAEBFFB8EDFFB9EA
        FFB9EDFFBBEBFFBBEBFFBAE9FFBEA5B0D29D9BFCF7F6FFFFFFFFFFFFAE8585FF
        FFFFFFFFFFF2A1A1FFFFFFFEF3F3F1A8A8D4C7D1C7F1FFCAEEFFCAECFFCAECFF
        CAECFFCAECFFCAECFFCAECFFCAECFFCAECFFCAEDFFCAF2FFC8E0F1C09296DDBB
        BAFFFFFFB58A8AFFFFFFFFFFFFF5A3A3FECDCDE3939296AAB6DBFAFFD8F2FFD8
        F1FFD8F1FFD8F1FFD8F1FFD8F1FFD8F1FFD8F1FFD8F1FFD8F1FFD8F1FFD8F1FF
        DBF6FFBDDBE9A98F92C99191B98888FFFFFFFFFFFFF89C9CD29E9EC3A5A59EAF
        B5ECFCFFE6F6FFE6F6FFE6F6FFE6F6FFE6F6FFE6F6FFE6F6FFE6F6FFE6F6FFE6
        F6FFE6F6FFE6F6FFE9F9FFCDDDE5BDA9A9D9AEAEBE9C9CFFFFFFFFFFFFFDEAEA
        E39B9BC9A3A2B0B6B7FDFFFFF8FEFFF8FFFFF8FFFFF9FFFFF9FFFFF9FFFFF9FF
        FFFAFFFFFAFFFFFAFFFFFAFFFFFAFFFFFDFFFFE0E8EBB49A99BF9E9EFCF9F9FF
        FFFFFFFFFFFFFFFFFFF3F3E9A4A4A7AFAFE3E8E7DCDFDED9DADBD7D8D7D2D4D5
        CFD2D1CBD0CFC8CBCAC5C9C8C1C5C4BFC3C2BABEC0B9BDBCB9BEBEB0B5B5B7AB
        ABFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAFAD6BEBEC29595BCA6A6C3
        A9A9C8ACACD0AFAFD5B2B2DCB7B7E2BABAEAC0C0EFC2C2F2C4C4F5C5C5F9CACA
        DBA8A8CEA8A8FCFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFD9D9E59C9CE1B7B7E7BCBCECBFBFF1C1C1F6C6C6FBC8C8FFCCCCFFCECEFF
        CFCFFFD3D3DBA3A3E1BDBDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0E8A7A7E2AAAAE9C1C1EDC3C3F2C4C4F8C6
        C6FCCACAFFD0D0FDC9C9D39999F3D8D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDF8D1D1E49E9E
        E7B2B2F1C6C6F7C9C9F9CACAE6ADADD6ABABFBF0F0FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEF9F9F1CACAE4A7A7E19E9EE2ABABEFDCDCFFFEFEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      SyncImageIndex = False
      ImageIndex = -1
    end
    object bbRef: TdxBarButton
      Action = aRefServ
      Category = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E6DACD8E58CF
        7120CE6E18C87A3DDDB194FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3D6BDD37B27FFAE4FFFAD48FFA73DFF972AEC801ADA9C6FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFDF9042EAA45AF6E6D6CF7826FFB763FFB259D8
        7B24DCA374E9C4ACDBA783BD5C18E6C0A5FFFFFFFFFFFFFFFFFFFFFFFFD68A3C
        FDC285C67414FFC98EFFBE74DA822AF4DBC4FFFFFFFFFFFFFFFFFFF9EBE3E0A9
        85FFFFFFFFFFFFFFFFFFFFFFFFD6924AFFE0BDFFCF9EFFCC96ECA660E8BA8FFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD79B54
        FFE9D1FFD2A4FFCF9FD1842CE3B58AFCF5EDFFFFFFFFFFFFFFFFFFFFFFFFFFFE
        FEFCF9F8FFFFFFFFFFFFFFFFFFDCA76EFFF3E5FFE2C5FFDCB7FFD4A1FFC37EDF
        AA6EF3DDCEDD9B65D6894FD5874AC8874AC77C42E4C2ADFFFFFFFFFFFFECCCAA
        E1A14BE1A352EBA248E99F4CE39F52F7E4CED59C6BFFD9A0FFE5BCFFE4C0FFE2
        BCFFE4BAC78D70FFFFFFFFFFFFFFFFFFFFFBF6FFFEFDFFFFFFFFFFFFFFFFFFFF
        FFFFFCF2EBD6A585CD7F3AFFD3A0FFD1A2FFE0B1C27E52FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1B28DF8B776FFCC94FFCF
        98FFDFB0C37943FFFFFFFFFFFFFFFFFFFFFFFFE4AA6FFFF4E6FFFFFFFFFFFFFF
        FFFFF6DDC4E28B34FFBE75FFCA88B15810FECC9BC97737FFFFFFFFFFFFFFFFFF
        FFFFFFEFCAA1DC881AEFC288F3D4B0E7B176E58B2CFFB057FFC179D0792AF4E1
        D6DD9156DB864AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFB36BF8901CFC952AFF
        A13AFFA743FFBF75D57B27E6BE9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE7BE90E09A44D68022D2802ACE8C4AEACCB4FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object bbEcho: TdxBarButton
      Action = aEchoServ
      Category = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFCFCFFD6E2FFA6C0FF76A0FF4682FF167BFF2B7CFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEDF1FF688DFF3871FF1060FF096BFF0A81FF099DFF07B9
        FF03C6FF277AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFF7495FF17
        72FF34BFFF1DB2FF17B6FF12BAFF0DC0FF08BEFF2576FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFAFAFFFFFFFFFFFFFF8CA4FF2C7FFF2FB2FF1DADFF18B2FF13B8
        FF0EBAFF2572FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF607DFF7C94FFFFFFFF79
        93FF3698FF28A3FF23A7FF1DACFF18B3FF13B7FF246DFFFFFFFFFFFFFFFFFFFF
        FFFFFFF2F3FE1444F01154F8A0AFFF2151FE39A1FF2E9CFF29A1FF23A8FF1FAF
        FF19B8FF2469FFFFFFFFFFFFFFFFFFFFFFFFFF9CA7F7195CF32682FF0A3DF215
        58F92E92FF3196FF309DFF2CA6FF2A91FF35C6FF256BFFFFFFFFFFFFFFFFFFFF
        FFFFFF3D54E92579FF1F72FF2279FF2580FE2988FF2E90FF3399FF1659FF6D8E
        FF1A6EFF2468FFFFFFFFFFFFFFFFFFFFD9DCFB1947DF1C6CFF3D95FF1E71FF22
        79FF2783FF2883FF1B4FFFC7D4FFFFFFFFC3D3FF4B7FFFFFFFFFFFFFFFFFFFFF
        7980E4337BF71A4DE31943E0388FFF1E72FF1D6CFB2950F7DDE3FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFE2439CB316DEA777FDE828BE83579F119
        60F73F5CECEEF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B9E8
        102CC45761D2FEFEFFFBFBFE354DE05C70EEF9F9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF5559C53C43C2F7F7FDFFFFFFFFFFFFF4F5FFFE
        FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E30B2
        ECECF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object bbSet: TdxBarButton
      Action = aSetServ
      Category = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F9F14AA64A1A931CA5
        D6A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF2FAF23AA83A13AC2715B32B0A9612A6D9A6FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FBF33DAE3D16AE2E17B23114AD2A13
        B1290A940FA9DBA9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FCF5
        3FB33F19B2331CB63A18B33434BC4D17B03013B02A0B9310ADDDADFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF55BF5C1FB73E20BA421FB84011A82417981762
        C77119B23213B12B0C9411B1DFB1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3BBA49
        42C8651FBB4615B32C66C866F0F9F038AB3861C87119B13113B22C0D9312B5E0
        B5FFFFFFFFFFFFFFFFFFFFFFFFA0E3A845C55836BC4E63CE68FEFEFEFFFFFFEF
        FAEF33A83363CA7217B13114B12C0E9411B7E3B7FFFFFFFFFFFFFFFFFFFFFFFF
        D4F7D7B5EBBBFDFEFDFFFFFFFFFFFFFFFFFFEDF9ED2FA73063CA7217B13114B3
        2D0F9412BBE1BBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFEAF8EA2BA62B64CB7515B13116B33019941BFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8F7E828A72A66CD
        782ABC462C9E2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE4F4E434AA3531A633D0E8D0FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object cxBarEditItem1: TcxBarEditItem
      Caption = #1059#1076#1072#1083#1077#1085#1085#1099#1077' '#1089#1077#1088#1074#1077#1088#1072
      Category = 0
      Hint = #1059#1076#1072#1083#1077#1085#1085#1099#1077' '#1089#1077#1088#1074#1077#1088#1072
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
    end
    object bbSave: TdxBarLargeButton
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Category = 0
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = pmSave
      AutoGrayScale = False
      HotGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFDEAC8CB05828AA4C248658409A9FA2A1A4A9A9ADB2
        B2B6BAB9BCBCB3B3B3A4A4A4999999909090676E739F4723A54A24A44A24A54B
        26BC795BF7EFEBFFFFFFFFFFFFFFFFFFE6A577B04C01BE691FC1691D966942B1
        B6B9D19555D6A063DDA765F2E4D3FFFFFFF6F6F6E5E5E5D6D6D6939AA0BF6D21
        C87728C97C31D39355AA4B0DB76D4CFFFFFFFFFFFFE2A36EBC5701C27024C576
        28C975269E754B9DA1A5C56B17C67625CD7B20DBC7B0EDEFF2FDFDFDF2F2F2E5
        E5E59CA3AAC9802AD58C33D89440E4B171D288309A350AFFFFFFFFFFFFC86308
        C06D20C17026C16F24C47022A0774FA7ABB2B85A0FBC6820C4701DCDB9A4DCDF
        E1EDEDEDFCFCFCF8F8F8ABB1B7C67A27D08632D58F3EE1AC6DD1862E973308FF
        FFFFFFFFFFCF6908C06B20BE6D22BF6C22C26D1FA47851BBC1C5AB4602B35A18
        BE6518BFAB96CBCDCFDBDBDBECECECFFFFFFB9BFC6C47725D08430D38D3DE0AB
        6CCE832D973308FFFFFFFFFFFFD06B08BE691DBC6820BD6920BF691DA67A54CD
        D2D59B2A00AC4906BD5C0CB29A85BABBBDCBCBCBDCDCDCF0F0F0BEC4CBC27623
        D0832FD48B3BDEAA6CCD802C973308FFFFFFFFFFFFD06B08BC651DBA651EBB66
        1EBD661BA57B57E6F0F7C9C1BEBCB5B4ACA6A19D9FA1A9ACB1BBC0C3CDD1D5E3
        E8ECB5BEC8B06921BA742ABF7C34DB9F5CCC7F2B973308FFFFFFFFFFFFD06B08
        B9621AB8621CB8631DBA641BAE6B33A67A55A97D58AB7F59A77C55A377509E72
        49996D4595694192663D8B633BAA6723AB6B26B06E29D08430CC802D973308FF
        FFFFFFFFFFD06B08B95F18B65F1AB65F1BB7601BB9621BBB6319BC6519BD651B
        BF681CC06A1EC26C1FC36E21C67122C97326CA7728CA7B2ACC7D2BCE7F2DCE82
        30CB7E2C983308FFFFFFFFFFFFD06C08B65D18B45C18B45C18B55A13B65C13B7
        5D14B85F15B96116BA6217BD6418BE671BC1691CC16D1EC46F1FC67321C97622
        CB7925CC7C2BCE802ECA7D2B983308FFFFFFFFFFFFD06C08B45A15B25815B165
        2BAE8B70AE886BAF886CAF8A6BAF896BAE896BAE8B6BAE8A6CAF8A6AAD8A6BAE
        8A69AC8968AC8969AC8C6CBF8141CC7D2DC97B2C983308FFFFFFFFFFFFD16C08
        B25712AF5311AF6C3CC8D2D8DEE2E4DDE1E3DEE2E5DFE3E6DDE1E4DDE0E3DADE
        E1D8DBDED6D9DCD3D6D9CFD3D6CDD0D3B6BDC5B7834FCB7C2AC77A2A983308FF
        FFFFFFFFFFD16D08B05310AD500FAD6837D1D7DBEAEAEAECECECE3E3E3E0E0E0
        E1E1E1E0E0E0DDDDDDDDDDDDDADADAD9D9D9DEDEDEDADADABFC3C8B7824CCA7A
        28C67929983308FFFFFFFFFFFFD16D08AD5010AB4C0EAD6737D3D9DEEDEDEDEF
        EFEFD2D2D2C8C8C8C9C9C9C9C9C9C9C9C9CACACACACACAC9C9C9DFDFDFDBDBDB
        C1C4CAB6824CC97927C57628983408FFFFFFFFFFFFD16E08AD4F0DA9490CAD66
        38D8DFE2F2F2F2F2F2F2EDEDEDECECECEBEBEBEAEAEAE7E7E7E5E5E5E2E2E2DF
        DFDFE0E0E0DDDDDDC3C7CCB6804DCA7826C67528983408FFFFFFFFFFFFD16E08
        AA4B0AA7460AAB6436DBE1E5F6F6F6F7F7F7E1E1E1DADADAD9D9D9D9D9D9D8D8
        D8D7D7D7D5D5D5D5D5D5E3E3E3E0E0E0C4C8CDB6804DC87725C47627983408FF
        FFFFFFFFFFD16E08A8470AA54307AC6236DEE5E8F9F9F9FCFCFCD5D5D5C6C6C6
        C7C7C7C8C8C8C8C8C8C9C9C9C9C9C9C9C9C9E6E6E6E0E0E0C5C9CEB6804DC776
        25C47427983408FFFFFFFFFFFFD16E08A64407A34005AA6135E2E8ECFCFCFCFE
        FEFEFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF6F6F6F2F2F2EBEBEBE5E5E5E1E1E1
        C6CACFB7814DC97624C57526993508FFFFFFFFFFFFD16F08A34205A03D03A960
        35E3E9EDFDFDFDFFFFFFDEDEDED3D3D3D4D4D4D2D2D2D2D2D2D1D1D1D0D0D0CF
        CFCFE6E6E6E3E3E3C7CCD0B47E4CA7611EC171269F3A08FFFFFFFFFFFFD26D09
        A13F059D3903A95F34E4EBEFFDFDFDFFFFFFDEDEDED2D2D2D3D3D3D2D2D2D3D3
        D3D2D2D2D1D1D1D1D1D1E7E7E7E3E3E3C7CCD0AE7C4C6F4113B66B24A74209FF
        FFFFFFFFFFDA8F44BD5801A53E01AD6233E4ECF0FEFEFEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDFEFEF7F8F8F3F4F4EEEFEFE8E9E9E5E6E6C9CFD4B77E49C971
        1EBA5A0DC27745FFFFFFFFFFFFFAEFE5DB944CD37314CF863BCECFD1D0CDC9D2
        CECAD2CDC8CFCAC6CDC9C4CAC6BFC6C0BDC2BFBAC0BAB6BCB8B2B9B3AFB4B1AD
        B0B0AFBC7A3FC16014CA834CF7ECE5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object bbSaveHDD: TdxBarButton
      Action = aPrepare
      Category = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF71ABCA0470A33C
        87AE9DC2D5FAFDFD007500007000006D00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF72B8D81D97CA1096C681C2DB99C8DC9EC5D9007D0044DD770072
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF72B2CA168FC236B8EB1495C599
        CDE200870000850000810048E17B007A00007500007000FFFFFFFFFFFFFFFFFF
        76CFEE1E5B7233AFE038B7EB1998C699CEE2008D005EF7915AF38D53EC8648E1
        7B45DE78007800FFFFFFFFFFFFBBE4F319AADF2A5A6E37BBF13CBAF01F90B799
        D1E7009100008D00008B005AF38D008300008100007D00FFFFFFFFFFFF61BEDF
        2AB3E92A596B3AACDA29414C2055658C9DA4A1B7BF9BC7D9008F005EF7910089
        0099CBE0A0CADCFFFFFFFFFFFF21A7D83CC1F92A4D5C29506249C2F525A8D300
        91C8037FAE9FBCC7009300009100008D009ACCE01078A8FFFFFFFFFFFF1EA8D9
        2E5C6F25353B46CAFF56C6F522A3CD008FC2008DC181C9E4A1B6BD99D1E69DC2
        D08BA2AB0A76A9FFFFFFFFFFFF1D88AE3AA8D52E566647C4FB63C8F51FA5CF00
        93C60090C30093C8154557008FC5008CC0008BC00671A4FFFFFFFFFFFF18A5D7
        4EC9FF2E52624BC5FC6FCEF816A2CF0094C90093C70096CC1546580094CA008E
        C10090C30671A3FFFFFFFFFFFF16A3D451CAFF2D526371D8FF9FE1FF85D5F25A
        C1E440B8DF1AACDD1145570096CC0091C50095C81077A7FFFFFFFFFFFF19A4D6
        6CD5FF37434A4C89A4419FC948C0F548C7FF3B9AC4345E6E3F7B943EBEED26AD
        DC11A3D4127CAAFFFFFFFFFFFF2EACD932B2E434B5EA3A9EC92E6F8921171329
        455023292D2B5C712976951B89B31397C946A3CAB6D8E9FFFFFFFFFFFFF7FCFD
        CFECF6A7DCEC7FCCE65892A53AA9CE24ADDE12A6DC1CA5D454A2BDA9CFDEF0F9
        FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object bbSaveDisk: TdxBarButton
      Action = aCD
      Category = 0
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actKeyListShow
      Category = 0
    end
    object bbSaveToLocDB: TdxBarButton
      Action = aSavToLocDB
      Category = 0
      ImageIndex = 19
    end
    object bbSend: TdxBarLargeButton
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
      Category = 0
      Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = pmSend
      AutoGrayScale = False
      HotGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFC38C8CCC9494CB9C9CCBA5A5D3B4B4D9C3C3E2D3D3EBE2E2F6F2F2
        FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFC59797D49595FFD7D7FFCDCDF8C0C0ECB7B7DF
        A9A9D19F9FC59494BC8F8FBC9696B99C9CBFABABCAB9B9D5C9C9DFD9D9ECE8E8
        F9F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCA9B9BF1D5D5DBA0A0FFDE
        DEFFD8D8FFD6D6FFD5D5FFD5D5FFD3D3FFD4D4FFD2D2FFD0D0F9C5C5EAB7B7DA
        ABABC89E9EB79191A385859E88889A8D8DA79D9DB4AFAFFFFFFFFFFFFFCE9A9A
        FFFFFFDDA7A7ECC2C2FFE7E7FFE0E0FFDEDEFFDDDDFFDBDBFFDADAFFD8D8FFD6
        D6FFD7D7FFD5D5FFD4D4FFD4D4FFD3D3FFD3D3FFD3D3FFD8D89B8181797070FF
        FFFFFFFFFFD19999FFFBFBFFEBEBD39191F7DEDEFFF0F0FFECECFFE9E9FFE7E7
        FFE6E6FFE4E4FFE2E2FFE1E1FFDFDFFFDEDEFFDCDCFFDADAFFDBDBFFE0E0A489
        89DEAEAE857676FFFFFFFFFFFFD49A9AFFFDFDFFEAEAFFDFDFD08C8CFDF6F6FF
        FAFAFFF6F6FFF3F3FFF2F2FFF0F0FFEFEFFFEDEDFFEBEBFFEAEAFFE8E8FFE7E7
        FFEFEFB29898CC9E9EFFDADA877575FFFFFFFFFFFFD79999FFFFFFFFEEEEFFE7
        E7FCD3D3D19090FFFFFFFFFFFFFFFEFEFFFFFFFFFDFDFFFAFAFFFAFAFFF7F7FF
        F7F7FFF6F6FFFEFEBBA1A1CBA1A1FFD5D5FFE1E18D7777FFFFFFFFFFFFDC9D9D
        FFFFFFFFF5F5FFECECFFE7E7F8CFCFD49393FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFB99999D4ACACFFE0E0FFDEDEFFEEEE927979FF
        FFFFFFFFFFE39E9EFFFFFFFFFDFDFFF4F4FFEDEDFFE9E9F9D4D4D69292FCF9F9
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFBB78B8BE4C9C9FFEFEFFFE9E9FFEC
        ECFFFDFD987E7EFFFFFFFFFFFFE59D9DFFFFFFFFFFFFFFFDFDFFF7F7FFF2F2FF
        F6F6EFC6C4D08181F2D6D5FFFFFFFFFFFFFFFFFFE6CAC8B87977FAF4F4FFFFFF
        FFF8F8FFF9F9FFFBFBFFFFFFA28282FFFFFFFFFFFFEA9D9DFFFFFFFFFFFFFFFF
        FFFFFFFFFFF9F8E3ACABC0B5C1AAE7FFBDB1BFD29394DC9F9FC39295B1BCCFB7
        C1D4CC9190F2E1E0FFFFFFFFFFFFFFFFFFFFFFFFA98383FFFFFFFFFFFFEE9D9D
        FFFFFFFFFFFFFFFFFFF5D0D0D8A1A4BEDCF2B9EBFFBBE9FFBAEBFFB8EDFFB9EA
        FFB9EDFFBBEBFFBBEBFFBAE9FFBEA5B0D29D9BFCF7F6FFFFFFFFFFFFAE8585FF
        FFFFFFFFFFF2A1A1FFFFFFFEF3F3F1A8A8D4C7D1C7F1FFCAEEFFCAECFFCAECFF
        CAECFFCAECFFCAECFFCAECFFCAECFFCAECFFCAEDFFCAF2FFC8E0F1C09296DDBB
        BAFFFFFFB58A8AFFFFFFFFFFFFF5A3A3FECDCDE3939296AAB6DBFAFFD8F2FFD8
        F1FFD8F1FFD8F1FFD8F1FFD8F1FFD8F1FFD8F1FFD8F1FFD8F1FFD8F1FFD8F1FF
        DBF6FFBDDBE9A98F92C99191B98888FFFFFFFFFFFFF89C9CD29E9EC3A5A59EAF
        B5ECFCFFE6F6FFE6F6FFE6F6FFE6F6FFE6F6FFE6F6FFE6F6FFE6F6FFE6F6FFE6
        F6FFE6F6FFE6F6FFE9F9FFCDDDE5BDA9A9D9AEAEBE9C9CFFFFFFFFFFFFFDEAEA
        E39B9BC9A3A2B0B6B7FDFFFFF8FEFFF8FFFFF8FFFFF9FFFFF9FFFFF9FFFFF9FF
        FFFAFFFFFAFFFFFAFFFFFAFFFFFAFFFFFDFFFFE0E8EBB49A99BF9E9EFCF9F9FF
        FFFFFFFFFFFFFFFFFFF3F3E9A4A4A7AFAFE3E8E7DCDFDED9DADBD7D8D7D2D4D5
        CFD2D1CBD0CFC8CBCAC5C9C8C1C5C4BFC3C2BABEC0B9BDBCB9BEBEB0B5B5B7AB
        ABFCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAFAD6BEBEC29595BCA6A6C3
        A9A9C8ACACD0AFAFD5B2B2DCB7B7E2BABAEAC0C0EFC2C2F2C4C4F5C5C5F9CACA
        DBA8A8CEA8A8FCFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFD9D9E59C9CE1B7B7E7BCBCECBFBFF1C1C1F6C6C6FBC8C8FFCCCCFFCECEFF
        CFCFFFD3D3DBA3A3E1BDBDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0E8A7A7E2AAAAE9C1C1EDC3C3F2C4C4F8C6
        C6FCCACAFFD0D0FDC9C9D39999F3D8D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDF8D1D1E49E9E
        E7B2B2F1C6C6F7C9C9F9CACAE6ADADD6ABABFBF0F0FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEF9F9F1CACAE4A7A7E19E9EE2ABABEFDCDCFFFEFEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object dxBarButton2: TdxBarButton
      Action = actToArchive
      Category = 0
      ImageIndex = 24
    end
    object dxBarButton6: TdxBarButton
      Action = aToLocSend
      Category = 0
      ImageIndex = 19
    end
    object bbSnimok: TdxBarLargeButton
      Action = actListShow
      Category = 0
      ButtonStyle = bsDropDown
      DropDownMenu = pm_Snimok
      AutoGrayScale = False
      HotGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4C7C7C79E9E9E8282826F6F6F
        6060605757575353535454545E5E5E727272959595CBCBCBFDFDFDFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEA9A9A96363636F6F6F71
        71716C6C6C6363635959594E4E4E4545453C3C3C3333332B2B2B2222221A1A1A
        313131BEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E36C6C
        6C9090908585857F7F7F7575755D5D5D4D4D4D4444443F3F3F40404042424238
        3838303030292929242424323232FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFDFDFD9D9D9D7070707D7D7D7C7C7C5C5C5C7575756E6E6E5E5E5E4747
        472E2E2E2B2B2B474747383838282828232323ADADADFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAB3B3B3898989838383919191
        7B7B7B6969695555553F3F3F343434555555767676ACACACF2F2F2FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A74F4F4F3B3D3F35
        383C2D31352A2E33292E32282C3124282C1F23275D5F619A9B9CB6B7B7DADADA
        FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F15656
        565D5F62604B379B703FA074409E703E986A378D613280532670451D603E1C4D
        331E33281D18191C12171C3F4244CCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD7D7D75A5B5C5C5B5BBE8C4FF7CF92F3CB8EF2CC90F4CE94F6D398F8D7
        A0F9DAA3F4D39AF0C88BECBB78E8AD64D598516B4621303235FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C063646562564BD8A765E9BB7AE7B879E7BA7B
        E8BC7EE9BF82EAC388ECC890EDCE98F0D6A3F5DDAEF7E6B9FFF9D0CD914C1419
        1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A96C6E6F64503EEBB46DE5
        AF6DE4B06CE4B16EE5B371E6B776E7BB7CE9C084EBC68CEDCC95EFD39EF2DAA9
        FAEABEC88E4C171B21FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9494947477
        7A73573CEBAF63E0A65EE1A75FE1A861E2AB65E3AF6BE5B371E7B979E9BF82EB
        C68CEDCD96F0D4A0F8E5B5C188471E2228FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8080807B7E82856038E6A251DD9B4CDE9A4BDE9C4FDFA256E1A75EE2AC
        67E4B270E7B879E9C083EBC78EEECF99F7E0ADBB834526292EFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF7373737D8184956736EAB171E7B780E8BC89E8BB87
        E5B57BE2A763E0A258E2AC67E5B371E7BA7BEAC287EDCA92F5DCA7B580432D32
        35FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6969697D7F82A78055F3CBA1EC
        C59BEBC49AEBC69CECC69CEDC8A0E9BF8DE3A963E3AD67E6B675E8BE81EBC68D
        F5D8A2AE7A41393D41FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F76869697F7C
        7BB69066F0CAA0EBC59BEBC59CEBC59CEBC69CECC69CEDC9A0EECAA2E8BC85E5
        B26FE7B979EAC386F5D59DA7763E45484CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        EAEAEA7576767A7774C8A279F0CAA3ECC7A0ECC7A1ECC8A1ECC8A1ECC8A0ECC8
        A0ECC9A1EDCCA3EECFA6ECCB9CEDCC9BF8DCAE9E713E55595BFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDDDDDD878888716D6AD7B28DF0CDA9EDCAA6EDCBA7EDCBA7
        EDCBA6EDCBA5EDCAA3EDCBA2EDCCA2EECDA3EECFA6EFD2A9FBE1B893693D6467
        69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2D29C9D9D666360E6C39FF1D1B1EF
        CFAFEFD0B0EFD0AFEECFADEECDAAEECDA7EECCA6EECDA5EECEA5EFD0A7F0D3A9
        FDE3B9845D3378797CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C7ADADAE5E5B
        59F6D8B7F4D7BBF1D7BEF1D7BEF1D5BAF0D3B4EFD0AFEECFABEECEA9EECEA8EF
        CFA8F0D1A8F3D7AEFFE7BE6948268A8B8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C9C9C9A7A7A77A797AAE9881FAE3CAFFEBD6FFEAD3FDE4C9FCDFC1FADCBBF9DA
        B7FAD9B5FADAB3FBDDB4FBDDB2ECCC9FB588554D46419E9E9FFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF8F8F89595958080806F70706562606E6A65776F667C7064
        827262857360846E598068527A634A70593F604A355B4A3B4D4B4948484AD4D4
        D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1B4B4B594949581
        82837677776C6D6E6566686062646061636062646163646366676B6D6E7D7E7E
        9C9D9DE1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object dxBarButton8: TdxBarButton
      Action = actListShow
      Category = 0
    end
    object dxBarButton9: TdxBarButton
      Action = actKeyListShow
      Category = 0
      ImageIndex = 23
    end
    object bbDelSnimok: TdxBarLargeButton
      Action = aDelSnimok
      Category = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
      AutoGrayScale = False
      HotGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000B50000A80101A80000A50000B4000000000000000000
        00000000000000000000000000000000009D00009C00009B0000B80000000000
        000000000000000000000000000000A40001B11542F01545E80E2CC80307AA00
        00B10000A30000000000000000000000000000000000B900009F0520C60312AC
        00009B0000A40000AC0000000000000000000000000000AC0E27D81B4FFF194A
        FB1948F51643E3091CB70000A80000C10000000000000000000000BB00009F0A
        29D60D3EF40B39E6072ED4041CB900009C0000AD0000000000000000000000AC
        2554FC2356FF1D4FFF1C4DFE1A4BFB1947F0102DC60000A90000BE0000000000
        BB0000A10C2DDA1142F80E3FF40D3CF20B39EE0A37E8041FBB00009D00008400
        00000000000000BA0405B82957F92456FF2051FF1F51FF1D4EFD1B4BF41338CE
        0101A90000B10000A40F31DE1446FC1243F81040F50E3EF40D3DF40B3AEF0A36
        E50212AC00009E0000000000000000000000B72D5DFE2859FF2657FF2455FF23
        55FF2051FF1D4CF7153DD60101A71131DE184CFE1547F91444F81243F71040F5
        0E3EF40C3DF30C3CF2072CD500009D0000000000000000000406C43C71FF2F61
        FF2B5BFF295AFF2859FF2758FF2455FF1D4EF81B4BF31C4EFD1B4AFD1848FB15
        46F91444F81243F71040F50F41F80B34E70104AB0000AA000000000000000000
        0000BB2239DA4275FF3769FF2F60FF2C5DFF2A5AFF285AFF2657FF2152FE1E4F
        FF1C4DFF1A4BFD1849FB1546F91544F91347FB0B29D90000A10000B700000000
        00000000000000000000C20000BE080DBF3B63F44273FF3565FF2F60FF2B5CFF
        295AFF2859FF2354FF1F50FE1C4EFE1A4BFE1949FC164AFF0920CC0000A40000
        B90000000000000000000000000000000000000000000000C90000B12338D748
        7AFF3A6BFF3162FF2D5EFF2A5AFF2758FF2354FF1F50FE1D4EFE1C4FFF091BC8
        0000B000008C0000000000000000000000000000000000000000000000000000
        000000DA0000B30B10BF406CFB3768FF3262FF2E5FFF2A5BFF2758FF2455FE1D
        4FFB091AC60000B0000000000000000000000000000000000000000000000000
        0000000000000000000000000000BA0001B64273FF3A6AFF3565FF3262FF2E5F
        FF2A5AFF2657FE1E4EF8102DCA0000AC00008B00000000000000000000000000
        00000000000000000000000000000000000000000000BF2740DF4576FF3D6DFF
        3969FF3565FF3262FF2D5EFF295BFF2555FE1C4CEF0A1AB80000B80000000000
        000000000000000000000000000000000000000000000000000000000000B94D
        7DFF4675FF406FFF3D6EFF396AFF3A6BFF3565FF2C5CFF295AFF2252FD1947E3
        0308B00000C40000000000000000000000000000000000000000000000000000
        000000C72337D85183FF4877FF4372FF406EFF3D6FFF243FE04375FF3364FF2A
        5BFF2657FF1D4FF9143AD10000AE0000C2000000000000000000000000000000
        0000000000000000000000C64D76F85280FF4B79FF4877FF4374FF2342E50000
        AF131FC84274FF3062FF2859FF2353FE1B4BF30C23BF0000B900000000000000
        00000000000000000000000000000000D00F17CC6091FF5280FF4D7BFF497AFF
        3C69FA0000B90000C30000BF1421CD4071FF2D5DFF2455FE1F4FFC1847E7040C
        B40000C50000000000000000000000000000000000000000D03750E45E8EFF54
        82FF507EFF4B7EFF0E1ACC0000D00000000000000000CB1729D23B6DFF2859FF
        2051FF1B4AF8133AD30000B00000C20000000000000000000000000000000000
        D06893FC6491FF5885FF5281FF3252ED0000C600000000000000000000000000
        00BF1D35DA3367FF2454FF1C4EFD1948F20B24C30000B1000000000000000000
        0000000000000000DF1D27D3719EFF6A9AFF5485FF0305C60000D60000000000
        000000000000000000DC0000B52341E52C60FF2053FF1C52FF1032E10000B300
        00000000000000000000000000000000000000E00000D0202DD62637DA0000CE
        0000000000000000000000000000000000000000C60000B62246EB102ADC0103
        BC0000BD0000C700000000000000000000000000000000000000000000000000
        00D20000C30000C30000000000000000000000000000000000000000000000C4
        0000B60000B70000BB0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object dxBarButton1: TdxBarButton
      Action = actLoadDisk
      Category = 0
    end
    object bbInformation: TdxBarLargeButton
      Caption = #1044#1072#1085#1085#1099#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      Category = 0
      Hint = #1044#1072#1085#1085#1099#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      Visible = ivAlways
      OnClick = bbInformationClick
      AutoGrayScale = False
      HotGlyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000F00A0000F00A00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF84615086615084604F84604F84604F84604F84604F83604F8360
        4F83604F835F4E825F4E825F4E815F4E815E4D805E4D805D4E7F5D4C7F5D4D7E
        5C4B7E5C4C7D5B4B7E5D4D7B5B4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF856150F8E4D3F2DECCF2DECCF2DECCF2DECCF2DECCF2DECCF2DE
        CCF2DFCCF1DCCBF2DDCBF2DDCBF2DECAF2DCCAF2DCC7F3DBC7F1DAC4F1D9C2F2
        D8C0F0D7BEF1D6BDF5D9BD7C5B4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF866150FFFDF2FAF4E8FAF3E9FAF3E9FAF3E9FAF3E9FAF3E9FAF3
        E8F8F2E6E3DCD3E6DFD5F1E9DFFAF3E6FAF1E6FAF2E5FAF2E4F9F1E2F9F0E0F9
        EFDEF8ECDBF9EDD9F4DCC47B5A49FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF866150FFFEF5FBF6EAFBF5ECFBF5EBFBF5EBFBF5EBFBF5ECFBF5
        EAE7E3D8C8C2BBCEC8BFDCD5CDF5EFE3FBF3E9FBF3E7FCF4E6FAF2E5FAF1E5F9
        F0E1F9EFE0FAF0DEF4DEC67D5B4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF876351FFFEF7FBF5ECFCF6ECDEC4B7DEC5B7DEC5B7DEC4B7DDC3
        B5B09B9097847A9F8B80BFA798DDBFAEDDBEABDDBDAADDBCA8DDBAA5DDBAA5DF
        BEA9FAF1E2FAF0E1F3DFC97C5B4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF886251FFFFF7FCF6EDFCF6EEDBC0B4DBC0B4DBC0B4DBC0B4DBC0
        B397847B7E6E669F897ED8BAABDABAAADAB9A8DAB7A5DAB6A2DAB5A0DAB5A0DD
        BAA4FAF2E5FBF3E4F5E0CC7D5C4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF896352FFFFFAFCF7EFFCF7EFDBC2B8DBC2B8DBC2B8DBC2B7DBC2
        B66E6A68655C57B9A59CDABCAEDBBCACDABAAADAB9A6DAB7A4DAB6A1DAB6A1DD
        BBA5FBF3E6FBF4E7F4E2CE7E5B4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8A6453FFFFFAFCF8F0FCF8F1DBC3BBDBC4BBDBC4BBDBC3BBDBC3
        B9827F7E697B875B616D646371828A75B6AF92DAB9A8DAB8A5DAB7A3DAB7A3DD
        BBA7FBF3E7FCF5E8F6E3D2805D4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8B6553FFFFFBFCF8F2FCF8F2DBC6BEDBC6BFDBC6BFDBC4BEDBC4
        BC9BA1A890B7DB5F917E1592271FA434148C1F8EA772DBBAA8DAB7A4DAB7A4DD
        BDA8FBF4E8FCF4E9F5E4D37F5C4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8C6754FFFFFEFDF9F3FDF9F4DBC7C2DBC7C3DBC7C3DBC6C2DBC5
        BFB5B6BD6AABAB21B7415CF18849D36C35B44E188A229FAC7CDBB8A5DBB8A5DD
        BDAAFBF4E9FCF6EAF5E4D2805E4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8F6655FFFFFFFDFAF5FDFAF5DBC8C3DBC8C4DBC8C4DBC8C2DBC6
        C0C8C0C42FAC5766FF9960F79155E57F44CC6632B14B198723ACAE86DBB9A7DE
        BEAAFBF5EAFCF5EBF5E4D3825D4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8F6754FFFFFFFDFAF6FDFBF7DBC7C3DBC7C4DBC7C4DBC7C3DBC6
        C0D8C6C23AC86763FF9365FF995EF28C52E17B42C9632FAD471E8625BAB08EDE
        BEABFBF5EBFCF5ECF5E4D4815F4EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF916855FFFFFFFDFBF8FDFBF8DCC7C2DBC6C3DBC6C3DBC6C1DBC5
        C0DBC4BD91CE954BE27562FD9365FE985CF18B52E07A40C45E2DA842248429C6
        B899FBF5ECFCF7EDF5E5D6835E4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF926957FFFFFFFEFCF9FEFCFADCC6C0DCC6C0DCC6C0DCC6C0DCC5
        BFDCC4BDDBC3BA76C98352E87F62FC9365FE985BEF8950DC763DC25C2AA33D2F
        862EEAEEDDFCF6EDF5E5D583604DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF936A56FFFFFFFEFCFBFEFDFBDCC6C0DCC6C0DCC6C0DCC6BEDCC4
        BEDCC4BBDCC3BAD7C2B45CC27459F28663FD9364FD975BED874DDB753BBE5826
        9E38409745F2F1E5F5E5D7845F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF946C57FFFFFFFEFDFCFEFDFDFEFEFDFEFEFDFEFEFDFEFDFDFEFD
        FCFEFDFBFEFCFBFEFCFAEEF9ED50D1775EF68A64FD9564FB945AEB854BD77139
        BC56229A3452A055F3E5D3845F4EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF956B59FFFFFFFEFEFDFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFEFE
        FEFEFDFDFEFDFCFEFCFBFEFCF9DCF7E244D6715FF98C64FD9763F99357E9834B
        D46E37B7511E962F5EA95A84614EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF966C58FFFFFFFEFEFEFFFFFFE0CFCEE0D0CFE0CFCDDFCDCADFCD
        CADFCBC8DFC9C5DFC8C2DFC7BDDFC5BBADCCA144DC705FF98C65FF9762F89256
        E88143D76936AC4D48724C786D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF976D59FFFFFFFFFFFFFFFFFFDDCBC9DDCBCBDDCAC9DDC9C6DDC9
        C6DCC7C3DCC5C0DCC3BCDCC2B9DCC0B5DBBEB291CF904CE7785FF88E64FF9858
        FF8D61B1779A8A979C959B747272CACAC6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF986E5BFFFFFFFFFFFFFFFFFFDDCBC9DDCBCBDDCAC9DDC9C6DDC9
        C6DCC7C3DCC5C0DCC3BCDCC2B9DCC0B5DBBEB2DBBDAF73CA8150EA7D56FF8A84
        B695DFD0DAE2DFDFBFBDB49B9A90494E8DC9CAF2FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF99705AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFEFDFEFDFCFEFCFAFFFDF9FEFDF9FAFDF65ED98385C597F4
        E5F0FFFFFFFFFFF19FA7D41F3BD3192FCA1B21B1E0E0F3FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9A6F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFEFEFEFDFCFEFCFAFFFDFBE6DCD7D9CBC2D1D5C4CBC1C6EF
        ECEDFFFFFC98AAF02D5AF23A62EE2840D0111DB24343B3FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9B705BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFEFDFEFDFCFEFCFAFFFFFFBBA295A18072A78978B49889D2
        CFC5ABB6E62E5EF54C7CFF3B60EA263FCD111EB22A2AA8FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9C725DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFEFEFEFDFEFDFCFEFCFAFFFFFFCBB7ADC5AD9FFFF5E0F9E1BBF0
        DAB7254AE54E82FF4571F93453E12337C80A0FAA9B9BDDFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9E725CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFEFEFEFEFEFEFEFDFCFEFDFBFEFCFAFFFFFCCCBAB0BEA18BF6DFB8F3CF96C0
        986A615AAC3555E5385DE72843D30E18B06E6ED4FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9C725CFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FEFEFEFEFEFDFDFEFDFCFEFCFAFEFCF9FFFEFCD7C9C1B28D72F6D39AC89F6EA0
        8377F8F4F38E92DF343AB84143B4ABABE1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9D715DFFFFFFFEFEFDFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFEFE
        FEFEFDFDFEFDFCFEFCFBFEFCFAFDFBF8FFFFFBD3C2B9B7906ACBA16FA18275F7
        F4F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9B715BFFFFFFFEFDFCFEFDFDFEFEFDFEFEFDFEFEFDFEFEFDFEFD
        FCFEFDFCFEFCFBFEFCFAFDFBF9FDFBF7FFFEFBCEBAB1A2795AA18171F5F1EEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9C715DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB39789A18071F6F1F0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9A715D9D725F9B715D9C715D9A715D9A715D99705B98705C986F
        5A976D5B966E59956C5A946B59936A58936C59AD9083F5F2F0FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      SyncImageIndex = False
      ImageIndex = 2
    end
    object bbImportPDF: TdxBarLargeButton
      Caption = #1048#1084#1087#1086#1088#1090
      Category = 0
      Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077'/'#1074#1080#1076#1077#1086'/'#1076#1086#1082#1091#1084#1077#1085#1090
      Visible = ivAlways
      OnClick = bbImportPDFClick
      AutoGrayScale = False
      HotGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000130B0000130B00000001000000000000694731009830
        0000B45E2F00BF6E4200C1704500C3734800C7794F00CA7E5500CD835A00D087
        5F00D6906900DB987300E1A17D000000980029188C000030F8004242DE004242
        F7007B7BF700FF00FF000086C1000093D80000D6FF003BC8FF00B7A29300B9B9
        B900E4A58200D1BBAD00ADADCE009494E7009C8CFF009C9CFF00ADADE700C5C5
        C500D1D1D100D4D4D400D8D8D800DCDCDC00E4D6CF00E8DCD600EBE1DC00D6CE
        F700D6D6FF00CDF0FF00E0E0E000E3E3E300E7E7E700EEE6E200EFEFEF00F0E9
        E500F3EBE600F2EBE800F4EEEB00F5F0EE00E7E7FF00F7F3F100FBF8F700F7F7
        FF00FCFAFA00FEFDFD00FFFFFF00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000131313131313
        1313131313131B00000000000000000000001313131313131313131313131B35
        181818181818181818001313131313131313131313131B2B1414141414141414
        18001313131313131313131313131B3A17161616161616141800131313131313
        1313131313131B3C2B1716161616142618001313131313131313131313131B3C
        3C1716161616152718001313131313131313131313131B3C3C2B171616142F28
        18001313131313131313131313131B3C3C3C17161615332F18000E0D0D0D0D0D
        0D0D0D0D0D0D0D0D3C3C2B171438373431000F1921222325252525252322210D
        3C3C3C2B3C3B1B0000000F2122242C2D2E2E2E2D2C24220D3C3C3C3C01011B32
        00130F22242D2E30303030302E2D240D3C3C3C011A02010013130F230F101C30
        30303030302E2C0D1B1B011A0403020113130F252D0F101C3030303030302D0D
        13011A070605030201130F252E300F101C30303030290F0F0101010107060101
        01010F252E30300F0F0F0F0F0F0F2E0D0F1313010807011313130F252E303030
        0F30360F11290F0F131313010902021313130F252D3030300F202A0F39302D0D
        1313010A0201131313130F232C2E3030300F1239302E2C0D13010B0201131313
        13130F22242D2E30300F1D302E2D0101010C02011313131313130F2122242C2D
        1C0F1D2D2C242202020202131313131313130F0F0F0F0F0F1E0F0F0F0F0F0F0F
        131313131313131313131313131313130F1F0F13131313131313131313131313
        1313131313131313130F0F131313131313131313131313131313}
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = aSetUnsetListImages
      Category = 0
      AutoGrayScale = False
      HotGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000F00A0000F00A00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C2C0C0605F5F544C4C5E5959D4D4D4FFFFFFFFFFFFFFFFFFFFFFFFF6F7FD8B86
        7C8C8B8BDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFD9D6D67B74744842429B7979B28787BA8E8E605A5AF6F5F5FFFFFFFFFFFF
        F5F6FF0645FF4E85E6E5DACF848483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFE1DBDB9283838C7070967B7B896C6CB68B8B655151816565A78181B6
        B6B6FFFFFFF3F4FF0C4AFF469CFF64D7FF659DE98E8A84FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE7DFDFA59090947878C29D9DD4B4B49D8888694F4F5C49499575
        754C4242CE9C9C8E8D8DF1F2FF0B49FF49A2FF6FD9FF57B7FF0F5AFFDADDEBFF
        FFFFFFFFFFFFFFFFEFE6E6B79F9FA28383C5A5A5D1B5B5D4BDBDDDC9C9DACCCC
        7A6A6ACCBDBDC9BFBFAEAAAAF3DBDBC1BDBC8482863B8CE16EDDFF56B4FF195B
        FFE3E7FFFFFFFFFFFFFFFFFFFFE3D7D7AD8A8AC9ADADD4BBBBD7C2C2DDCCCCE5
        D8D8F2E8E8FFFFFFC1C1C27D7F827C7B787F7C7987868A888687ADAAA5C0C7C2
        419AE91456FFE5EAFFFFFFFFFFFFFFFFFFFFFFFFFFB39393DAC6C6DCC9C9E2D3
        D3EAE0E0F5F0F0FFFFFFFBFCFC97989AB2A793F5D094FBD293FBD39AFCD79DC1
        B39F808389C4C0BB81818FE8ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD9797
        EFE7E7F0E7E7FCF8F8FFFFFFF5F3F3B8AAAABDB5B6ADA492FCD79AF1D19BEFD0
        99EECD91F0CF97FAD79FBFB39E9A9B9CE9E9E7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFCEB0B0F7F3F3FFFFFFF1EAEABA9B9B8B7070E6D4D4929093F4D8A2
        F5DDAAF1DBAAF1DBA9F0D4A2EFD097F0CE9AFEDAA38E9093FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFDF8F8EAC3C3E1B8B8E1C5C5F9F6F6C8BFBFEB
        DFDF81817FFFE8B5F6E5BEF7E7C0F5E2B8F3DDB1F1D6A5F0D095FDDAA4868583
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFDFD7D7E7DEDE838282FFF3C8FCF5DCFAF3D6F7ECC8F6E7BDF3DCADF0
        D39EFED9A1848483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFEDE8E8DED1D1B2B1B1EFE6C5FFFFF0FEFEFCFCF6
        DBF7ECC7F6E1B3F3D7A4F4D8A4909296FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F3F3CBB9B9F1ECECA4A29C
        FFFFECFFFFF7FDF9E5F9EECCF7E3B6FFE1A6A29B8FDADBDCFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDBC
        A3A3FDF8F8E8E5E6A5A39EE8E2C6FFFCD3FFF2C2E9D5ABA29D94B1ADB0FFFFFF
        FDFCFCBCBCBC979595D0CECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFC2A2A2FFFDFDFBF7F7F0EFEFA4A5A68080838082829A9A9DE4
        E5E5BCB0B0B5AEAE605A5A6D5C5CF0BBBB8D7272BCBABAFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3A0A0FFFFFFFDFAFAFEFCFCFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFB7AFAF8C6363BD8B8B9A7D7DFFE6E6FFEBEB696060FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9A8A8FFFFFFFFFFFF
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FAFA7D5959A57979433434FBC9
        C9FFD9D9736161FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8
        C0C0F4F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA19898
        906C6CFFC7C7E4A9A9A87B7B9F9393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFECDCDCDBCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF9587876753537C6B6BB8ACACFBFCFCFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFBC4A1A1FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFEE3D7D7AF9D9D998282B4A7A7E3DEDEFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAC0C0E9E0E0
        FFFFFFFFFEFEE2D6D6B9A2A2A68C8CBFADADE8E2E2FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFDFCFCC7AFAFB19494AA8C8CC0AEAEEAE3E3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object dxBarButton4: TdxBarButton
      Action = actLoadFile
      Category = 1
    end
    object dxBarButton7: TdxBarButton
      Action = ActLoadFolder
      Category = 1
    end
    object BtnLdList: TdxBarLargeButton
      Caption = #1054#1090#1082#1088#1099#1090#1100
      Category = 1
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1080#1079' '#1087#1072#1087#1082#1080
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = pmOpen
      AutoGrayScale = False
      HotGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000002692C3117CAC16
        76A43188B1000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00089CCD078CBC0CD1FF00A3D60086BD1582B72691C400000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000228DC128C4E90B89B723E1FF1DDBFF19DDFF13D8FF07B1E20090
        C41489BD1B8ABE439FC800000000000000000000000000000000000000000000
        00000000000000000000000000001080B656F4FF0D86B636E3FF2CDAFF29D9FF
        26DAFF20DAFF1CDDFF18DEFF10C1F00297CB027AB0137EB22991C10000000000
        000000000000000000000000000000000000000000000D8CB970FFFF0D89B74B
        E8FF3CDFFF38DEFF34DDFF30DBFF2BDAFF26D9FF22D9FF25DCFF25DEFF20CFFD
        0FA6D80387BC137FB4218BBE0000000000000000000000000000002A93C83BB8
        D880FFFF0F8AB860EFFF4CE4FF48E3FF43E2FF3FE0FF3ADFFF35DDFF30DBFF2D
        DAFF2DD9FF2FD9FF31DAFF33DCFF32D9FF1DAED81579A9000000000000000000
        0000000981B984F8FD8FFFFF118DB976F4FF5CEAFF57E8FF53E7FF4EE5FF49E3
        FF44E2FF3EE0FF39DEFF37DCFF38DBFF39D9FF3AD7FF38D5FF59DDF7298EB900
        0000000000000000000000158AB8AAFFFFA0FFFF1390BD8AFBFF6AEFFF67EDFF
        62ECFF5DEAFF58E8FF52E7FF4DE5FF47E3FF43E1FF43DFFF44DEFF46DEFF3CCF
        F28DF3FF268CB60000000000000000002196C858C1D9AFFFFFADFFFF1493BD9F
        FFFF7BF4FF76F3FF71F1FF6CEFFF66EDFF61ECFF5BEAFF56E8FF50E6FF4DE4FF
        4EE2FF4FE1FF4DCFEAB5FFFF238DB60000000000000000000180BAB5FFFFB4FF
        FFB7FFFF1393BFB2FFFF89F9FF85F8FF80F6FF7AF4FF75F2FF6FF0FF69EEFF64
        EDFF5EEBFF59E9FF59E8FF54E0F981E7F4BDFFFF258DB7000000000000000000
        2091BDD4FFFFBAFFFFC3FFFF1493C0C3FFFF97FFFF93FCFF8FFAFF88FAFF82F7
        FF7EF5FF77F3FF71F1FF6BEFFF66EDFF65EDFF5CDAEEB8FFFFC5FFFF278FB800
        0000000000127DAF7CC8DDD6FFFFC4FFFFCDFFFF1394C3CDFFFFA1FEFF9DFDFF
        98FCFF92FAFF8DF8FF87F7FF81F5FF7BF3FF76F1FF70F0FF69EBFC89E6F0C4FF
        FFCEFFFF298FB80000000000000A7BADFEFFFFF1FFFFE2FFFFE7FFFF1B9CC7DC
        FFFFABFFFFAAFFFFA2FCFF9DFCFF96F9FF90F7FF8AF5FF85F4FF7FF2FF79F2FF
        6CE0F2BEFCFBC6FFFFD5FFFF2A91B90000000000001E99CC098CC622A0D332A8
        D635A5CD0085BBD1FCFE9AEFF7A2F5F9A3FAFBA3FCFEA1FCFF9BFBFF95F9FF8E
        F6FF89F4FF80F1FF8CE5F0D3FFFFCAFFFFDDFFFF2A90BB000000000000000000
        000000000000000000000000008DC3F5FFFFBAF3F8B2EEF5A8EAF49EE4F097E3
        F08FE4F087E2F282E3F381E5F579E0F2C2F7FAD4FFFFD1FFFFE6FFFF2B92BA00
        000000000000000000000000000000000000000004A2DBFFFFFFE2FFFFE3FFFF
        E3FFFFE1FFFFE2FFFFE3FFFFE3FFFFE1FFFFD7FEFECCF9FBDFFFFFDAFFFFD8FF
        FFEDFFFF2C91BC0000000000000000000000000000000000000000000CABE3E2
        F9FCDEF7FAEAFCFDF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFE8FFFFE2FFFF
        E0FFFFE0FFFFDFFFFFF5FFFF2E93BC0000000000000000000000000000000000
        0000000034CCFF08A7E201A5E000A0DC00A0DB009CD80099D30CA1DA149FD50E
        8EC1FFFFFFEAFFFFE8FFFFE7FFFFE7FFFFFFFFFF2F93BC000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000697D0D8EFF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0179AC00
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000042BAE42797C241A2C83D9FC63D9CC53F9D
        C32D93BD248CB800000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      SyncImageIndex = False
      ImageIndex = -1
    end
  end
  object al: TActionList
    Images = IL
    Left = 952
    Top = 144
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 0
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aClose: TAction
      Category = 'Main'
      Caption = #1042#1099#1093#1086#1076
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1077
      ImageIndex = 1
      ShortCut = 32883
      OnExecute = aCloseExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 3
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aParam: TAction
      Category = 'Options'
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1084#1077#1085#1077#1076#1078#1077#1088#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 11
      OnExecute = aParamExecute
    end
    object aText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      ImageIndex = 5
      OnExecute = aTextExecute
    end
    object aWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 6
      OnExecute = aWebExecute
    end
    object aXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 7
      OnExecute = aXMLExecute
    end
    object aExcel: TAction
      Caption = 'Excel-'#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel-'#1092#1072#1081#1083
      ImageIndex = 8
      OnExecute = aExcelExecute
    end
    object aUsers: TAction
      Category = 'Options'
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
      OnExecute = aUsersExecute
    end
    object aTextA: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      ImageIndex = 5
      OnExecute = aTextAExecute
    end
    object aWebA: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 6
      OnExecute = aWebAExecute
    end
    object aXMLA: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 7
      OnExecute = aXMLAExecute
    end
    object aExcelA: TAction
      Caption = 'Excel-'#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel-'#1092#1072#1081#1083
      ImageIndex = 8
      OnExecute = aExcelAExecute
    end
    object aEditSysdba: TAction
      Category = 'Main'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1080#1089#1090#1077#1084#1085#1099#1081' '#1087#1072#1088#1086#1083#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1080#1089#1090#1077#1084#1085#1099#1081' '#1087#1072#1088#1086#1083#1100
      Visible = False
      OnExecute = aEditSysdbaExecute
    end
    object aChangeUser: TAction
      Category = 'Main'
      Caption = #1057#1084#1077#1085#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      Hint = #1057#1084#1077#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      OnExecute = aChangeUserExecute
    end
    object aCD: TAction
      Caption = #1053#1072' '#1076#1080#1089#1082
      Hint = #1053#1072#1088#1077#1079#1072#1090#1100' '#1085#1072' '#1076#1080#1089#1082
      ImageIndex = 17
      OnExecute = aCDExecute
    end
    object aJournal: TAction
      Category = 'Options'
      Caption = #1046#1091#1088#1085#1072#1083' '#1089#1086#1073#1099#1090#1080#1081' '#1089#1077#1088#1074#1077#1088#1072
      OnExecute = aJournalExecute
    end
    object aPrepare: TAction
      Category = 'Main'
      Caption = #1053#1072' '#1078#1077#1089#1090#1082#1080#1081' '#1076#1080#1089#1082
      Hint = 
        #1060#1091#1085#1082#1094#1080#1103' '#1079#1072#1073#1080#1088#1072#1077#1090' '#1089' '#1072#1088#1093#1080#1074#1072' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103', '#1086#1090#1086#1073#1088#1072#1085#1085#1099#1093' '#1074' '#1089#1087#1080#1089#1082#1077' '#1074#1085#1080#1079#1091 +
        ' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081', '#1080#13#10#1089#1086#1093#1088#1072#1085#1103#1077#1090' '#1080#1093' '#1083#1086#1082#1072#1083#1100#1085#1086' '#1074' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1074' '#1085#1072#1089#1090#1088#1086#1081#1082#1072#1093 +
        ' '#1082#1072#1090#1072#1083#1086#1075'.'
      OnExecute = aPrepareExecute
    end
    object actLoadFile: TAction
      Caption = #1048#1079' '#1092#1072#1081#1083#1072
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1085#1080#1084#1082#1086#1074' '#1080#1079' '#1092#1072#1081#1083#1086#1074
      ImageIndex = 14
      OnExecute = actLoadFileExecute
    end
    object ActLoadFolder: TAction
      Caption = #1048#1079' '#1087#1072#1087#1082#1080
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1085#1080#1084#1082#1086#1074' '#1080#1079' '#1087#1072#1087#1082#1080
      ImageIndex = 15
      OnExecute = ActLoadFolderExecute
    end
    object APrintFolder: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 3
      ShortCut = 16464
      OnExecute = APrintFolderExecute
    end
    object actTextFolder: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      ImageIndex = 5
      OnExecute = actTextFolderExecute
    end
    object actWebFolder: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 6
      OnExecute = actWebFolderExecute
    end
    object actXMLFolder: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 7
      OnExecute = actXMLFolderExecute
    end
    object actExcelFolder: TAction
      Caption = 'Excel-'#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel-'#1092#1072#1081#1083
      ImageIndex = 8
      OnExecute = actExcelFolderExecute
    end
    object aPrintRemote: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 3
      ShortCut = 16464
      OnExecute = aPrintRemoteExecute
    end
    object aTextRemote: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      ImageIndex = 5
      OnExecute = aTextRemoteExecute
    end
    object aWebRemote: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 6
      OnExecute = aWebRemoteExecute
    end
    object aXMLRemote: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 7
      OnExecute = aXMLRemoteExecute
    end
    object aExcelRemote: TAction
      Caption = 'Excel-'#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel-'#1092#1072#1081#1083
      ImageIndex = 8
      OnExecute = aExcelRemoteExecute
    end
    object actListShow: TAction
      Caption = #1057#1085#1080#1084#1082#1080
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1085#1080#1084#1082#1080' '#1087#1086' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103#1084
      ImageIndex = 13
      ShortCut = 118
      OnExecute = actListShowExecute
    end
    object aSetServ: TAction
      Category = 'Servers'
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1089#1077#1088#1074#1077#1088' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      OnExecute = aSetServExecute
    end
    object aRefServ: TAction
      Category = 'Servers'
      Caption = 'aRefServ'
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1077#1088#1074#1077#1088#1086#1074
      OnExecute = aRefServExecute
    end
    object aEchoServ: TAction
      Category = 'Servers'
      Caption = 'aEchoServ'
      Hint = #1054#1087#1088#1086#1089#1080#1090#1100' '#1089#1077#1088#1074#1077#1088
      OnExecute = aEchoServExecute
    end
    object actKeyListShow: TAction
      Caption = #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1085#1080#1084#1082#1080
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1082#1083#1102#1095#1077#1074#1099#1077' '#1089#1085#1080#1084#1082#1080' '#1087#1086' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103#1084
      ImageIndex = 18
      Visible = False
      OnExecute = actKeyListShowExecute
    end
    object actToArchive: TAction
      Caption = #1042' '#1040#1088#1093#1080#1074
      Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1077' '#1089#1085#1080#1084#1082#1080' '#1074' '#1072#1088#1093#1080#1074
      ImageIndex = 16
      OnExecute = actToArchiveExecute
    end
    object aSavToLocDB: TAction
      Caption = #1042' '#1083#1086#1082#1072#1083#1100#1085#1091#1102' '#1073#1072#1079#1091
      ImageIndex = 20
      OnExecute = aSavToLocDBExecute
    end
    object aToLocSend: TAction
      Caption = #1042' '#1083#1086#1082#1072#1083#1100#1085#1091#1102' '#1073#1072#1079#1091
      ImageIndex = 20
      OnExecute = aToLocSendExecute
    end
    object aPrintLoc: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 3
      OnExecute = aPrintLocExecute
    end
    object aTextLoc: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' '#1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      ImageIndex = 5
      OnExecute = aTextLocExecute
    end
    object aWebLoc: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 6
      OnExecute = aWebLocExecute
    end
    object aXMLLoc: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 7
      OnExecute = aXMLLocExecute
    end
    object aExcelLoc: TAction
      Caption = 'Excel-'#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel-'#1092#1072#1081#1083
      ImageIndex = 8
      OnExecute = aExcelLocExecute
    end
    object aClearRemote: TAction
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 9
      OnExecute = aClearRemoteExecute
    end
    object aClearTV: TAction
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 9
      OnExecute = aClearTVExecute
    end
    object aClearLoc: TAction
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 9
      OnExecute = aClearLocExecute
    end
    object aClearFolder: TAction
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 9
      OnExecute = aClearFolderExecute
    end
    object aDelSnimok: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 9
      OnExecute = aDelSnimokExecute
    end
    object actLoadDisk: TAction
      Caption = #1048#1079' DICOM '#1076#1080#1089#1082#1072
      ImageIndex = 26
      OnExecute = actLoadDiskExecute
    end
    object aDiagnoz: TAction
      Caption = 'aDiagnoz'
      ImageIndex = 5
      OnExecute = aDiagnozExecute
    end
    object aSetUnsetListImages: TAction
      Caption = #1057#1087#1080#1089#1086#1082' '#1089#1085#1080#1084#1082#1086#1074' '#1087#1086#1082#1072#1079#1072#1090#1100' '
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1085#1080#1084#1082#1086#1074
      OnExecute = aSetUnsetListImagesExecute
    end
  end
  object IL: TImageList
    Left = 952
    Top = 384
    Bitmap = {
      494C01011C003005300510001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BE848400CD989800CE9E
      9E00D4B1B100CFB7B700D3C1C100DDD1D100E8E3E30000000000000000000000
      00000000000000000000000000000000000000000000BE848400CD989800CE9E
      9E00D4B1B100CFB7B700D3C1C100DDD1D100E8E3E30000000000007500000070
      0000006D00000000000000000000000000000000000000000000000000000000
      00000000000000000000E6C5AE00B65D180098857700C3A07800DEDBD700C8CE
      D300936F5800BD6B2A00BD784E00000000000000000000000000000000000000
      000000000000000000000000000000000000D6CDC60092725B00784E2D00734B
      2C008C725D00DAD3CF00000000000000000000000000C7979700DBABAC00FFE2
      E200FFDADA00FFD9D900FFD2D200ECB7B700DCABAB00CFA1A200CFA4A400CBA4
      A500C5A6A700C3B4B400BEBABA000000000000000000C7979700DBABAC00FFE2
      E200FFDADA00FFD9D900FFD2D200ECB7B700E2BABA00E4CBCB00007D000044DD
      770000720000C3B4B400BEBABA00000000000000000000000000000000000000
      00000000000000000000C56A1300C66F1E00A68D7600BD4F0000D7CBBB00FFFF
      FF00C3A48000E4A14D00BA631D00000000000000000000000000000000000000
      0000000000000000000000000000DEC7B600BC754000D6905A00F4BE9500FCC2
      9600D68E550080513000D4CEC8000000000000000000CB9A9A00E6C5C700E4BC
      BD00FFECEC00FFE4E400FFE0E000FFE1E100FFDEDE00FFDCDC00FFDCDC00FFDB
      DB00F3CFCF00D5A4A400A38484000000000000000000CB9A9A00E6C5C700E4BC
      BD00FFECEC00FFE4E400FFE0E000FFE1E10000870000008500000081000048E1
      7B00007A00000075000000700000000000000000000000000000DECACA00BE9A
      9A00B4898900C9AAAA00C5681300BB631700BAABA300AE806200A0A5AA00C7D7
      E600B0998000CA893E00B6601B00000000000000000000000000000000000000
      00000000000000000000E9D6C900DD8B4D00CE9D780000000000000000000000
      000000000000F5AF7000896B54000000000000000000CC999900FFF8F800E8B2
      B200F3E0E000FFFEFE00FFF5F500FFF2F200FFEFEF00FFEBEB00FFEBEB00FFEF
      EF00D8C0C000D8A8A800BE9797000000000000000000CC999900FFF8F800E8B2
      B200F3E0E000FFFEFE00FFF5F500FFF8F800008D00005EF791005AF38D0053EC
      860048E17B0045DE7800007800000000000000000000D6B7B700EABFBF00F6CF
      CF00E3B5B500EBCECE00C1630E00B5591200B5560900B85A0B00BA5C0700BC5E
      0600C1691100CD7D2600B55C1900000000000000000000000000000000000000
      000000000000EEE3DB00DB8F5500C8956B000000000000000000000000000000
      000000000000FDEABC00955C34000000000000000000CE9A9A00FFFDFD00FFE9
      E900E3A7A700F6EFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DBCA
      CA00D3A9A900FFE6E600BE9797000000000000000000CE9A9A00FFFDFD00FFE9
      E900E3A7A700F6EFEF00FFFFFF00FFFFFF0000910000008D0000008B00005AF3
      8D000083000000810000007D00000000000000000000CCA2A200FFEFEF00E9CD
      CD00DBB5B500E6CACA00C05C0700B0795100C8B9AF00C8B6A700C7B5A600C5B1
      A200C0B1A400BD8E5C00B5571400000000000000000000000000000000000000
      000000000000DE945C00CA906300CBB09B00A16B43009A694500D4C5B9000000
      000000000000FDE2AA00AC764E000000000000000000D09B9B00FFFFFF00FFF4
      F400FFEFEF00E9B2B100F7E3E100FFFFFF00FFFFFF00FFFFFF00D6BBBA00E0C3
      C400FFF1F100FFF9F900BF9B9B000000000000000000D09B9B00FFFFFF00FFF4
      F400FFEFEF00E9B2B100F7E3E100FFFFFF00FFFFFF00FFFFFF00008F00005EF7
      910000890000FFFCFC00DAC6C6000000000000000000CAA5A500F7DADA00EBBE
      BE00DBA7A700E6C4C400BB550000B5876900F7FFFF00D6D9DB00D8DBDD00D4D7
      DA00E1EAF200BD997100B2560F00000000000000000000000000000000000000
      0000E29D6900CF8F5D00D9B79F00E9934F00DCB09200F1B9870090613B000000
      0000FDE8D000FDAC6000BEA998000000000000000000D29A9A00FFFFFF00FFFF
      FF00FFF7F500DAB4B700B2B2C500D9B0B300E3B9B800BBAAB400C8A4A900FEF0
      EF00FFFFFF00FFFFFF00C19D9D000000000000000000D29A9A00FFFFFF00FFFF
      FF00FFF7F500DAB4B700B2B2C500D9B0B300E3B9B800DAD0D600009300000091
      0000008D0000FFFFFF00C19D9D000000000000000000CC9D9D00FFE3E300F6DE
      DE00E7CACA00EDD9D900B8510000B4846700FFFFFF00D6D6D600D8D8D800D4D4
      D400E4EAEF00BF977000B3530E0000000000000000000000000000000000E4A5
      7900DC925A00D8B7A100F0985200C6AC990000000000FDC28C00A9774E00FDDF
      C500FDA35900CAA28100000000000000000000000000D49E9E00FFFFFF00F0CA
      CB00CDB8C000B8EDFF00BBEFFF00B9EEFF00BAECFF00BBEFFF00BAF0FF00BDB9
      C600D5B0B000FFFFFF00C6A1A0000000000000000000D49E9E00FFFFFF00F0CA
      CB00CDB8C000B8EDFF00BBEFFF00B9EEFF00BAECFF00DAF6FF00D9F7FF00E1E0
      E500EBDBDB00FFFFFF00C6A1A0000000000000000000CCA6A600F9E1E100E0B6
      B600D9A5A500E7C4C400B34A0000B5816800FFFFFF00E1E2E200E1E1E100DADA
      DA00E9EEF300B3926F00AB4F0B00000000000000000000000000EEB68C00E797
      5900D9BAA200F89C5600C8AD980000000000FDBC8800D48C5400DCB28F00FDA2
      5600D2AF950000000000000000000000000000000000DF9E9E00E1A8A800B9C5
      D400D6F8FF00D6F1FF00D6F0FF00D6F0FF00D6F0FF00D6F0FF00D6F1FF00D6F6
      FF00CDEDFD00B78F9000C49696000000000000000000DF9E9E00E1A8A800B9C5
      D400D6F8FF00D6F1FF00D6F0FF00D6F0FF00D6F0FF00D6F0FF00D6F1FF00D6F6
      FF00CDEDFD00B78F9000C49696000000000000000000CDA0A000FFDEDE00EEC0
      C000DCA8A800E6C4C400D06F1300C18D6500F0F5F800E7E5E300E0DFDD00D8D6
      D500D3D5DA00B68C6400C4793E000000000000000000EFC39F00F4A05900D9BA
      A200FDA65B00CEAE970000000000FDBE8700D28F5800E2B58B00F9A35900D7BD
      A8000000000000000000000000000000000000000000ECA8A800B99D9C00C0CB
      D600F6FFFF00F3FEFF00F3FFFF00F3FFFF00F3FFFF00F3FFFF00F3FFFF00F5FF
      FF00F0FFFF00C1A2A200D4B3B3000000000000000000ECA8A800B99D9C00C0CB
      D600F6FFFF00F3FEFF00F3FFFF00F3FFFF00F3FFFF00F3FFFF00F3FFFF00F5FF
      FF00F0FFFF00C1A2A200D4B3B3000000000000000000CFA7A700F9E8E800F0DA
      DA00EAD2D200F0DDDD00E8CFCF00E0C2C200D4B3B300C8A6A600A6858500FDFD
      FD00FDFDFD00FDFDFD00000000000000000000000000F7BE8800DAB8A000FDAE
      6400CBA98E0000000000FDC18700D0905F00E8B98A00F5A25A00DDCABB000000
      0000000000000000000000000000000000000000000000000000E7B5B500B7BD
      C700BEC3CE00BCC0CC00BBBECB00BCC0CB00BBBFCA00BDC2CA00BDC0C900BFC2
      CB00C4C8CD00D1BBBB0000000000000000000000000000000000E7B5B500B7BD
      C700BEC3CE00BCC0CC00BBBECB00BCC0CB00BBBFCA00BDC2CA00BDC0C900BFC2
      CB00C4C8CD00D1BBBB00000000000000000000000000CBA1A100FFDEDE00EDC0
      C000DBA6A600D8A5A500CA969600BA868600A875750087555500744545000000
      00000000000000000000000000000000000000000000F9EAE000FDBB6D00DAB2
      920000000000FDC48500CF936100EEBE8800EDA35F00E3D5CA00000000000000
      000000000000000000000000000000000000000000000000000000000000F8D2
      D200DDA3A300EAC1C100F3C4C400F9C8C800FFCCCC00FFCECE00FFD2D100EFB6
      B600E6C2C200000000000000000000000000000000000000000000000000F8D2
      D200DDA3A300EAC1C100F3C4C400F9C8C800FFCCCC00FFCECE00FFD2D100EFB6
      B600E6C2C20000000000000000000000000000000000D1A5A500FFDBDB00F0CA
      CA00E3B7B700E1B4B400D2A3A300BE8F8F00AE7E7E00834F4F00704040000000
      00000000000000000000000000000000000000000000FDD09600CEA078000000
      0000FDD69500CF966400F2C28700EAA56500E9DFDA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDEBEB00EBAFAF00EFC1C100F4CACA00FCCECE00FFD3D300E2ADAD00EBCF
      CF00000000000000000000000000000000000000000000000000000000000000
      0000FDEBEB00EBAFAF00EFC1C100F4CACA00FCCECE00FFD3D300E2ADAD00EBCF
      CF000000000000000000000000000000000000000000CEA6A600FFFDFD00FFF1
      F100FFE8E800FBE0E000F9DADA00F7D5D500E9C4C400D7ACAC00845555000000
      00000000000000000000000000000000000000000000FDE3C000C87F4500D5AA
      8700E7C5A800FCCA8700E6A86F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F1CFCF00E0ACAC00DFA8A800E0B4B400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F1CFCF00E0ACAC00DFA8A800E0B4B400000000000000
      00000000000000000000000000000000000000000000F0E5E500CBAAAA00C8A1
      A100C49A9A00BE929200BA8D8D00B58A8A00B48D8D00B5929200E0D4D4000000
      0000000000000000000000000000000000000000000000000000FDECDD00E9AA
      7A00F3A85D00E0B0800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007070700050505000505050005050500070707000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005050
      50005897B300DDECF200CCE3EB00AAD1DF0099C8D90074B4CC005FA9C5005050
      5000707070000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0CFE1001480B00076B0
      CD0000000000000000000000000000000000000000000000000000000000A5A5
      A5007A7A7A00995934007A7370009A9A9A0000000000B0CFE1001480B00076B0
      CD00000000000000000000000000000000000000000000000000000000009E9E
      9E008C8C8C00000000000000000000000000000000009B9B9B00919191009595
      9500000000000000000000000000000000000000000000000000267FA100D9EE
      F500F6FBFC00DDECF200CCE3EB00AAD1DF0099C8D90074B4CC0063ABC6004199
      BA001F81A7000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1E5ED000587BA0000C3F4000470
      A500D8E8F2000000000000000000000000000000000000000000000000008484
      8400F1DCCF00A8430500C3703D0080808000E8F1F6000587BA0000C3F4000470
      A500D8E8F2000000000000000000000000000000000000000000C7C7C700B9B9
      B900A4A4A400C2C2C2000000000000000000ADADAD00F3F3F300FFFFFF009595
      9500000000000000000000000000000000000000000000000000267FA100E2F4
      FA00F6FBFC00DDECF200CCE3EB00AAD1DF0099C8D90074B4CC0063ABC6004199
      BA003090B3000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004EA9C800007FAE000077AA0000CFFF0000A5
      DA00327EA8006DADCE000000000000000000000000000000000000000000918E
      8D00B6652E00A9440300AC460100A769400088C3DA000077AA0000CFFF0000A5
      DA00327EA8006DADCE000000000000000000000000000000000093939300FFFF
      FF00E9E9E90086868600000000000000000099999900FFFFFF00FAFAFA008484
      8400000000000000000000000000000000000000000000000000267FA100D0E8
      F100E0EDF2008BB9CD0075ACC20061A0BB00569BB7004E9AB800509FBD003C96
      B8002F8FB3000000000000000000000000000000000000000000000000000000
      000000000000000000000000000014A3D30001CEFD0001D2FD0010D5FF0025DF
      FD00008EC2000085B90075A9C50000000000000000000000000000000000AE73
      4900AB460000B96E3B00B6612400C05C040099C6C30030DAFD0010D5FF0025DF
      FD00008EC2000085B90075A9C50000000000000000000000000095959500FCFC
      FC00FEFEFE007E7E7E0000000000000000009B9B9B00EFEFEF00E3E3E3008888
      8800000000000000000000000000000000000000000000000000267FA100DAED
      F400F6FBFC00DDECF200CCE3EB00AAD1DF0099C8D90074B4CC0063ABC6004199
      BA00278BAF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008FC0D8001BD2FC0032E0FF0043E3FF001AC1
      EC0000BEF5004DF0FD002284AE0000000000000000000000000000000000B466
      3100B0703700C4C3C300BE906700C2610A00C9680400A6DCDB0051E5FF001AC1
      EC0000BEF5004DF0FD002284AE0000000000000000000000000094949400EEEE
      EE00E3E3E300A8A8A800C1C1C1000000000096969600DBDBDB00CACACA007676
      76006F6F6F00ABABAB0000000000000000000000000000000000267FA100E2F4
      FA00F6FBFC00DDECF200CCE3EB00AAD1DF0099C8D90074B4CC0063ABC6004199
      BA003090B30000000000000000000000000000000000000000006EBEDF006CB9
      DB00D8ECF5000000000000000000000000001A8FB70049E2FD0000B8EC002FE1
      FF0084F6FF0051ABCC00B5D1E300000000000000000000000000A2D5EA00D5BC
      A000EBF5F9000000000000000000DCAB8100D06A0100D97C07008ADEF6002FE1
      FF0084F6FF0051ABCC00B5D1E300000000000000000000000000BFBFBF00C5C5
      C500CACACA00BFC0C000A9A9A900DCDDDE009DA0A200CACCCD00949494009494
      9400000000007272720000000000000000000000000000000000267FA100E2F4
      FA00F6FBFC0093BDCF0075ACC20061A0BB00569BB700529CB90057A3C0004199
      BA003090B300000000000000000000000000000000004CA9CD0000B7EA0002C8
      F60012A8D400A1CDE300A4CFE300128AB90000AAE30017D5FF007EFDFF0055BA
      D40082B9D900000000000000000000000000000000004CA9CD0000B7EA005EDC
      F90012A8D400A1CDE300A4CFE30088C4DB00C39A6B00D8760300C4FEFF0055BA
      D40082B9D9000000000000000000000000000000000000000000000000009998
      9400DDDBCE00BEC0B4007B777800AB845F0090817400706458007B818600B6B7
      B800000000006868680000000000000000000000000000000000267FA10077AC
      C40075A9C100AED3E200CCE3EB00AAD1DF0099C8D90060A9C5003D97B800268A
      AF002A8CB1000000000000000000000000000000000013AAD90038E8FF0026CA
      F10000BFF400069DCE00009BD0000BD1FF0071FFFF005DCADE0068B6D5000000
      0000000000000000000000000000000000000000000013AAD90038E8FF0026CA
      F10000BFF400069DCE00009BD0000BD1FF00B7FFFF00C08C51009DD0E4000000
      0000000000000000000000000000000000000000000000000000000000008586
      96004E66E800000ED000C26D1600E78B2800D4660000C3590000A0480000AA7E
      5C00000000007676760000000000000000000000000000000000267FA100E2F4
      FA00F6FBFC00DDECF200CCE3EB00AAD1DF0099C8D90074B4CC0063ABC6004199
      BA003090B3000000000000000000000000000000000023B3DE002FD8FC00E0F4
      F80044CBEB0001C4F7005BF4FF007BE8F20059B6D900D9EBF500000000000000
      0000000000000000000000000000000000000000000023B3DE002FD8FC00E0F4
      F80044CBEB0001C4F7005BF4FF007BE8F20059B6D900E5F1F800000000000000
      000000000000000000000000000000000000000000000000000000000000294D
      FA00003EFF008A554000FAAE4B00E0740000E0750000DA700000D1650000B94C
      000081736900B3B4B40000000000000000000000000000000000267FA100E2F4
      FA00F6FBFC00DDECF200CCE3EB00AAD1DF0099C8D90074B4CC0063ABC6004199
      BA003090B300000000000000000000000000000000004CBCDE0035CBED00D4EF
      F800D2FDFD0044DDF90039C6E60066B3D7000000000000000000000000000000
      000000000000000000000000000000000000000000004CBCDE0035CBED00D4EF
      F800D2FDFD0044DDF90039C6E60066B3D7000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008B99F4006B8D
      FF00193DE000F7B25500F4992200D7710000954E1E00AD560000BD5C06008869
      4F00C4C4C4000000000000000000000000000000000000000000267FA10079AE
      C50073A8C00096C7DB009ACEE20085C9E40073C2DF0049A9CE003397BE002785
      A9002D8CB00000000000000000000000000000000000A1D4E50047D7F2007AE2
      FA00000000004FECFD0022CEF7004EAED6000000000000000000000000000000
      00000000000000000000000000000000000000000000A1D4E50047D7F2007AE2
      FA00000000004FECFD0022CEF7004EAED6000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006179F6008EAC
      FF005B487C00FFD17700FB900000AB702D00395597003E59A000777A8000DAB1
      8800CD966B000000000000000000000000000000000000000000267FA100E4EE
      F300F4F9FD00D5EEF800C5E8F600A4DCF10095D7F00070CAEB005FC3E90038AE
      DB001C8DB900000000000000000000000000000000000000000055CEEA0048CC
      E90081DFF50059E9FD003FE1FF0042AAD5000000000000000000000000000000
      000000000000000000000000000000000000000000000000000055CEEA0048CC
      E90081DFF50059E9FD003FE1FF0042AAD5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000697FF8009CB8
      FF0061599500FFCC6C00FF970000D27814002F31A3001038E8006E383000D764
      0000CF98680000000000000000000000000000000000000000002D93BD00AAC8
      D800FCFDFF00F4F9FD00E7F5FB00C7E9F600B7E3F50095D7F00084D1EE0058C1
      E80040B4E0000000000000000000000000000000000000000000DAF0FA0057D8
      EE0065E6F90063F3FF004BE0FA0073C0E2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DAF0FA0057D8
      EE0065E6F90063F3FF004BE0FA0073C0E2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3BFFC005B80
      FD006493FF00A6724F00FD8F0000FF910000F9870000E7760000E1740000C862
      0000DFC0A200000000000000000000000000000000000000000000000000267F
      A10081B0C500FAFCFE00F4F9FD00D8EFF900C8EAF700A6DDF20083D0ED00267F
      A1002D93BD00000000000000000000000000000000000000000000000000DBEF
      F70064C7E3004AC8E30047B2D600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DBEF
      F70064C7E3004AC8E30047B2D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008499
      FC004E71F9002355FD005868D900CBA69000D69E6A00CD904D00C9854300CD9D
      6D00000000000000000000000000000000000000000000000000000000000000
      0000000000002D93BD00267FA100267FA100267FA1002D93BD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0868600CF9A9A00D0A0
      A000D6B3B300D1B9B900D5C3C300E7B36300FF990000FF990000FF990000FF99
      0000FF990000FF990000F0AD5900000000000000000000000000000000000000
      0000F6F5F500C0BABB00A39B9A00A19B99009D989700B8B6B600007500000070
      0000006D00000000000000000000000000000000000000000000000000000000
      00000000000000000000E6C5AE00B65D180098857700C3A07800DEDBD700C8CE
      D300936F5800BD6B2A00BD784E00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A64D8006069
      D8000000000000000000000000000000000000000000C9999900DBABAC00FFE2
      E200FFDADA00FFD9D900FFD2D200FF990000FFF5F500FFF3F300FFF0F000FFEE
      EE00FFE8E800FFE5E500FF99000000000000000000000000000000000000E4DC
      DC00B6A7A200EDEBD400FFFFF500FFFFFD000000000000000000007D000044DD
      7700007200000000000000000000000000000000000000000000000000000000
      00000000000000000000C56A1300C66F1E00A68D7600BD4F0000D7CBBB00FFFF
      FF00C3A48000E4A14D00BA631D00000000000000000000000000000000000000
      0000DECACA00BE9A9A00B4898900AD7D7D00D0B7B7004D44AB001643DD00123A
      D600676CD70000000000000000000000000000000000CD9C9C00E6C5C700E4BC
      BD00E7B36300FF990000FF990000FF990000FF990000FF990000FF990000F0AD
      5900FFECEC00FFE6E600FF990000000000000000000000000000E7DDDE00CDB9
      A800FFFBD300FFFFE000FFFFE800FFFFF60000870000008500000081000048E1
      7B00007A00000075000000700000000000000000000000000000DECACA00BE9A
      9A00B4898900C9AAAA00C5681300BB631700BAABA300AE806200A0A5AA00C7D7
      E600B0998000CA893E00B6601B0000000000000000000000000000000000D6B7
      B700EABFBF00F6CFCF00E3B5B500E9C8C800675ABA001034D500439AFF003C90
      FF000B27CC006E70D200000000000000000000000000CE9B9B00FFF8F800E8B2
      B200FF990000FFF5F500FFF3F300FFF0F000FFEEEE00FFE8E800FFE5E500FF99
      0000FFEEEE00FFEAEA00FF9900000000000000000000F7F4F500C9AEA200FFE5
      B400FFE8C000FFF5D200FFFFE200FFFFF500008D00005EF791005AF38D0053EC
      860048E17B0045DE7800007800000000000000000000D6B7B700EABFBF00F6CF
      CF00E3B5B500EBCECE00C1630E00B5591200B5560900B85A0B00BA5C0700BC5E
      0600C1691100CD7D2600B55C190000000000000000000000000000000000CCA2
      A200FFEFEF00E9CDCD00DBB5B5006D61B700030CB1001A4AE0002A75FF00246B
      FF001037D9000409AA007577CC000000000000000000D09C9C00FFFDFD00FFE9
      E900FF990000FFFBFB00FFF9F900FFF5F500FFF0F000FFECEC00FFE6E600FF99
      0000D6CBCB00D6C7C700FF9900000000000000000000D4C5C700F9C89B00FFD3
      A100FFDAAC00FFE7BC00FFFFE800FDFEFB0000910000008D0000008B00005AF3
      8D000083000000810000007D00000000000000000000CCA2A200FFEFEF00E9CD
      CD00DBB5B500E6CACA00C05C0700B0795100C8B9AF00C8B6A700C7B5A600C5B1
      A200C0B1A400BD8E5C00B557140000000000000000000000000000000000CAA5
      A500F7DADA00EBBEBE00E2B8B800E6C4C400DCBBBB000E15AE001658FF000F4E
      FF000B0CA000FDFDFD00000000000000000000000000D29D9D0000000000FFF4
      F400FF99000000000000FFFDFD00FFF9F900FFF3F300FFEEEE00FFEAEA00FF99
      0000EB850000EB850000FF9900000000000000000000D2B4AE00FFD09900FFCC
      9900FFCB9700FFE4C300E8E8ED00E5E3E400EBEAEA00ECECEE00008F00005EF7
      910000890000FFE8C400B7B3B1000000000000000000CAA5A500F7DADA00EBBE
      BE00DBA7A700E6C4C400BB550000B5876900F7FFFF00D6D9DB00D8DBDD00D4D7
      DA00E1EAF200BD997100B2560F0000000000000000000000000000000000CC9D
      9D00FFE3E300F6DEDE00E7CACA00E3C4C400E5CCCC001014B200033CFF000034
      FF0007049C0000000000000000000000000000000000D49C9C00000000000000
      0000FF990000D6D6D600D6D6D600D6D3D300D6CECE00D6CBCB00D6C7C700FF99
      0000FF990000FF990000F1AE58000000000000000000DAB4A400FFCE9900FFCC
      9900FFCA9300FFF4EB00E2E3E4000000000000000000ECEDEE00009300000091
      0000008D0000FFE1BC009C8B7F000000000000000000CC9D9D00FFE3E300F6DE
      DE00E7CACA00EDD9D900B8510000B4846700FFFFFF00D6D6D600D8D8D800D4D4
      D400E4EAEF00BF977000B3530E0000000000000000000000000000000000CCA6
      A600F9E1E100E0B6B600D9A5A500DAA5A500DBB9B9000F0FAF00002DF4000028
      E90008069F0000000000000000000000000000000000D6A0A00000000000F0CA
      CB00FF990000EB850000EB850000EB850000EB850000EB850000EB850000FF99
      0000D5B0B00000000000C8A3A2000000000000000000DFB7A700FFCD9800FFCB
      9800FFCA9200FDF4EC00E3E4E5000000000000000000E9EAEB00FCF8F400FFDB
      B700FFDDBB00FFDAAC009E8E82000000000000000000CCA6A600F9E1E100E0B6
      B600D9A5A500E7C4C400B34A0000B5816800FFFFFF00E1E2E200E1E1E100DADA
      DA00E9EEF300B3926F00AB4F0B0000000000000000000000000000000000CDA0
      A000FFDEDE00EEC0C000DCA8A800D9A5A500DBB9B9001C17A60015119D001210
      98000C06950000000000000000000000000000000000E1A0A000E1A8A800B9C5
      D400F3B56000FF990000FF990000FF990000FF990000FF990000FF990000F1AE
      5800CDEDFD00B78F9000C69898000000000000000000E2BEB800FFD4A100FFD7
      A800FFDCAF00FFF3D900E5E7EA00E5E5E500E5E5E600E3E4E800FFE8CA00FFCB
      9600FFCC9900FFD39B00A29793000000000000000000CDA0A000FFDEDE00EEC0
      C000DCA8A800E6C4C400D06F1300C18D6500F0F5F800E7E5E300E0DFDD00D8D6
      D500D3D5DA00B68C6400C4793E0000000000000000000000000000000000CFA7
      A700F9E8E800F0DADA00EAD2D200E8CBCB00E6CCCC00DEC0C000D2B0B000C4A1
      A100B79D9D0000000000000000000000000000000000EEAAAA00B99D9C00C0CB
      D600F6FFFF00F3FEFF00F3FFFF00F3FFFF00F3FFFF00F3FFFF00F3FFFF00F5FF
      FF00F0FFFF00C1A2A200D6B5B5000000000000000000E8D2D400FCDCB300FFE6
      BC00FFEFC900FFFDDA00FFFFF400FBFBFB00FBFAF900FFFFEC00FFE8BC00FFDA
      AC00FFD2A100F0C29600BEB8BB000000000000000000CFA7A700F9E8E800F0DA
      DA00EAD2D200F0DDDD00E8CFCF00E0C2C200D4B3B300C8A6A600A6858500FDFD
      FD00FDFDFD00FDFDFD000000000000000000000000000000000000000000CBA1
      A100FFDEDE00EDC0C000DBA6A600D8A5A500CA969600BA868600A87575008755
      55007445450000000000000000000000000000000000FFFDFD00E9B7B700B7BD
      C700BEC3CE00BCC0CC00BBBECB00BCC0CB00BBBFCA00BDC2CA00BDC0C900BFC2
      CB00C4C8CD00D3BDBD00FEFEFE000000000000000000FDF8F800ECC8C000FFF8
      D100FFFFDB00FFFFE500FFFFF000FFFFFD00FFFFF000FFFFE300FFF5D200FFE8
      C000FFE6B500B4A09600F6F5F5000000000000000000CBA1A100FFDEDE00EDC0
      C000DBA6A600D8A5A500CA969600BA868600A875750087555500744545000000
      000000000000000000000000000000000000000000000000000000000000D1A5
      A500FFDBDB00F0CACA00E3B7B700E1B4B400D2A3A300BE8F8F00AE7E7E00834F
      4F00704040000000000000000000000000000000000000000000FEFEFE00FAD4
      D400E0A5A500EAC1C100F3C4C400F9C8C800FFCCCC00FFCECE00FFD2D100F1B9
      B900E8C4C4000000000000000000000000000000000000000000FFEEEF00F1D9
      CA00FFFFE700FFFFED00FFFFF400FEFEFD00FFFFF300FFFFE800FFFFDF00FFFA
      D300CBB5A500E4DEDF00000000000000000000000000D1A5A500FFDBDB00F0CA
      CA00E3B7B700E1B4B400D2A3A300BE8F8F00AE7E7E00834F4F00704040000000
      000000000000000000000000000000000000000000000000000000000000CEA6
      A600FFFDFD00FFF1F100FFE8E800FBE0E000F9DADA00F7D5D500E9C4C400D7AC
      AC00845555000000000000000000000000000000000000000000000000000000
      0000FFEDED00EDB1B100EFC1C100F4CACA00FCCECE00FFD3D300E5B0B000EDD1
      D10000000000000000000000000000000000000000000000000000000000FFEE
      EF00EBCDC700F9F4E6000000000000000000FFFFF900FFFFF200F3EED600C7B5
      AD00EAE2E20000000000000000000000000000000000CEA6A600FFFDFD00FFF1
      F100FFE8E800FBE0E000F9DADA00F7D5D500E9C4C400D7ACAC00845555000000
      000000000000000000000000000000000000000000000000000000000000F0E5
      E500CBAAAA00C8A1A100C49A9A00BE929200BA8D8D00B58A8A00B48D8D00B592
      9200E0D4D4000000000000000000000000000000000000000000000000000000
      000000000000FEFDFD00F3D1D100E3AEAE00E1AAAA00E2B6B600FBF3F3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEF9F900ECD6D700E2C5C500DFC5C500D9C1BF00D3BBBB00DCCDCE00FAF8
      F8000000000000000000000000000000000000000000F0E5E500CBAAAA00C8A1
      A100C49A9A00BE929200BA8D8D00B58A8A00B48D8D00B5929200E0D4D4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000FEFEFE006363
      63006F6F6F006C6C6C00636363004E4E4E0045454500333333002B2B2B001A1A
      1A0031313100000000000000000000000000000000000000000000000000CFE6
      F100B6D6E4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002692
      C300117CAC003188B10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000E3E3E3009090
      900085858500757575005D5D5D00444444003F3F3F0042424200383838002929
      29002424240000000000000000000000000000000000F3F3F400FEFEFE00078B
      C200007FB30044A0CB008BC3DE00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000089C
      CD00078CBC0000A3D6000086BD002691C4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      840000000000000000000000000000000000000000000000000000000000EAEA
      EA00B3B3B300838383009191910069696900555555003434340055555500ACAC
      AC00F2F2F20000000000000000000000000000000000A09E9D00ECE4E100F0D9
      CF00297EA60053B6CB0041B5D00025C9EE0015CDF8000197CC0037A0CE00C8E3
      F000FDFFFF0000000000000000000000000000000000000000000000000056F4
      FF000D86B6002CDAFF0029D9FF0020DAFF001CDDFF0010C1F0000297CB00137E
      B2002991C1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000004F4F
      4F003B3D3F002D3135002A2E3300282C310024282C005D5F61009A9B9C00DADA
      DA00FBFBFB0000000000000000000000000000000000A0A1A100EDEEEF00F7ED
      E8002B8CB6007EE3F7007FE3F70072D0E50068C6D90049BCD4003BC0DC000AA2
      D3000F8BBC009DCBE200E7F4FB000000000000000000000000000000000070FF
      FF000D89B7003CDFFF0038DEFF0030DBFF002BDAFF0022D9FF0025DCFF0020CF
      FD000FA6D800137FB400218BBE00000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000D7D7D7005C5B
      5B00BE8C4F00F3CB8E00F2CC9000F6D39800F8D7A000F4D39A00F0C88B00E8AD
      6400D598510030323500000000000000000000000000A6A6A600F5F6F700E0B7
      AD002180AB0083D3DE0084D2DB0082CDD60082CFD7008AE1EF0067B8C50036DA
      FF0037D8FF0039D9FF0050DCF6000000000000000000000000000981B9008FFF
      FF00118DB9005CEAFF0057E8FF004EE5FF0049E3FF003EE0FF0039DEFF0038DB
      FF0039D9FF0038D5FF0059DDF700000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000C0C0C0006256
      4B00D8A76500E7B87900E7BA7B00E9BF8200EAC38800EDCE9800F0D6A300F7E6
      B900FFF9D00014191D00000000000000000000000000A7A7A700F9FBFB00E3BD
      B5002083AE0090D8E0008FD7DE008DD4DA008CD0D50095E6F00072BDC50041DF
      FF0042DDFF003ACFF50086F1FF00000000000000000000000000158AB800A0FF
      FF001390BD006AEFFF0067EDFF005DEAFF0058E8FF004DE5FF0047E3FF0043DF
      FF0044DEFF003CCFF2008DF3FF00000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000949494007357
      3C00EBAF6300E1A75F00E1A86100E3AF6B00E5B37100E9BF8200EBC68C00F0D4
      A000F8E5B5001E222800000000000000000000000000ADAAA900FFFFFF00E8C6
      C2001D86B400A5E2E300A5E2E100A3DFDD00A2DBD900ABF1F30088C5C70059E9
      FF0059E8FF0080E6F300BDFFFF0000000000000000000180BA00B5FFFF00B7FF
      FF001393BF0089F9FF0085F8FF007AF4FF0075F2FF0069EEFF0064EDFF0059E9
      FF0059E8FF0081E7F400BDFFFF00000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000808080008560
      3800E6A25100DE9A4B00DE9C4F00E1A75E00E2AC6700E7B87900E9C08300EECF
      9900F7E0AD0026292E0000000000000000000000000092959600FFFFFF00EBC5
      BD001A87B500B1E6E400B0E6E200AFE3DE00ACDFDA00B7F5F40094CBC90066ED
      FF0065EFFF00B9FFFF00C5FFFF0000000000000000002091BD00D4FFFF00C3FF
      FF001493C00097FFFF0093FCFF0088FAFF0082F7FF0077F3FF0071F1FF0066ED
      FF0065EDFF00B8FFFF00C5FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      840000000000000000000000000000000000000000000000000069696900A780
      5500F3CBA100EBC49A00EBC69C00EDC8A000E9BF8D00E3AD6700E6B67500EBC6
      8D00F5D8A200393D4100000000000000000000000000A29F9C00FFFFFF00FFFF
      FF00239BC800CFFFFF00CDFFFF00C7F6F600C3F0EE00C7F8F600A2CECB007AF2
      FF006EDFF000C7FFFF00D6FFFF000000000000000000FEFFFF00F1FFFF00E7FF
      FF001B9CC700ABFFFF00AAFFFF009DFCFF0096F9FF008AF5FF0085F4FF0079F2
      FF006CE0F200C6FFFF00D5FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      84000000000000000000000000000000000000000000F7F7F70068696900B690
      6600F0CAA000EBC59C00EBC59C00ECC69C00EDC9A000E8BC8500E5B26F00EAC3
      8600F5D59D0045484C00000000000000000000000000A5A2A200FFFFFF00EAC5
      BD00148AB800C6E8E600C8E8E600C8ECE900C8EDEA00CEF7F800ABD0CC0080EF
      FE0098E8F200CBFFFF00DFFFFF000000000000000000098CC60022A0D30035A5
      CD000085BB009AEFF700A2F5F900A3FCFE00A1FCFF0095F9FF008EF6FF0080F1
      FF008CE5F000CAFFFF00DDFFFF00000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000000000000000000000000000DDDDDD0087888800D7B2
      8D00F0CDA900EDCBA700EDCBA700EDCBA500EDCAA300EDCCA200EECDA300EFD2
      A900FBE1B80064676900000000000000000000000000BBBBBB00FFFFFF00FFFF
      FF001D9DCB00F7FFFF00F4FFFF00CFE7E500D1EAE800C8E1DF00B5D0CD00E3FF
      FF00DEFFFF00DAFFFF00EFFFFF00000000000000000000000000000000000000
      000004A2DB00E2FFFF00E3FFFF00E1FFFF00E2FFFF00E3FFFF00E1FFFF00CCF9
      FB00DFFFFF00D8FFFF00EDFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      84000000000000000000000000000000000000000000D2D2D2009C9D9D00E6C3
      9F00F1D1B100EFD0B000EFD0AF00EECDAA00EECDA700EECDA500EECEA500F0D3
      A900FDE3B90078797C00000000000000000000000000BFBFBD00FFFFFF00FFFF
      FF00169CCA004CB4D7005BBAD90072C1DA0085CBE20093C4D300BCE5EE00E3FF
      FF00E3FFFF00E2FFFF00FAFFFF00000000000000000000000000000000000000
      00000CABE300DEF7FA00EAFCFD00FFFFFF00FFFFFF00FFFFFF00FDFFFF00E2FF
      FF00E0FFFF00DFFFFF00F5FFFF00000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000000000000000000000000000C9C9C900A7A7A700AE98
      8100FAE3CA00FFEAD300FDE4C900FADCBB00F9DAB700FADAB300FBDDB400ECCC
      9F00B58855009E9E9F00000000000000000000000000BFBEBE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00897F7B00A8A1A00000000000A6DBEF00CAE8
      F200C4E6EF00CCEAF200B5DDE900000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000697D000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F8F8F800959595006F70
      700065626000776F66007C70640085736000846E59007A634A0070593F005B4A
      3B004D4B4900D4D4D400000000000000000000000000B7B7B700B2B2B200ADAD
      AD00ABABAB00ABAAAA00ADACAC00A5A6A600FBFBFB0000000000F6FCFE0097CC
      E10095CADF0091C7DD0091C3DB00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042BAE40041A2
      C8003D9FC6003F9DC3002D93BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084848400848484008484840084848400C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006A6A6A00777777007C7C
      7C00737373000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B00000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084848400008400000084000084848400C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006A6A6A0089898900BFBFBF008A8A
      8A0065656500575757006B6B6B00000000000000000000000000000000008484
      8400FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C60000000000BC4B0000FDF1E500FDF1E500FFED
      D500FFE9CE00FFE3C500FEDEBC00FFDAB100FFD5A600FFD19F00FFCC9800FFD8
      A100BC4B00000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084848400008400000084000084848400C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006A6A6A00909090009E9E9E005E5E
      5E00636363007373730075757500000000000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C60000000000BC4B0000FBF3EA00FBF3EA00FFEF
      DC00FFEDD500FEE5CA00FFE3C500FFDAB100FFDAB100FFD5A600FFCC9800FFD8
      A100BC4B00000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084848400008400000084000084848400C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005D5D5D0072727200A3A3A300ACACAC009090
      900070707000CFCFCF00737373000000000000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C60000000000BC4B0000FCF6F000FBF3EA00FDF1
      E500FFEDD500FFE9CE00FFE3C500FEDEBC00FFDAB100FED7AB00FFD5A600FFD5
      A600BC4B0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400008400000084000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      000000000000000000005C5C5C0079797900B4B4B400B5B5B500ADADAD00ADAD
      AD00ACACAC00A6A6A6006F6F6F000000000000840000FFFFFF00008400000084
      0000008400000084000000840000008400000084000000840000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000BC4B0000FCF8F700FCF8F700FBF3
      EA00FDF1E500FFEDD500FEE5CA00FFE3C500FEDEBC00FFDAB100FFD8A100FED7
      AB00BC4B0000000000000000000000000000C6C6C60084848400848484008484
      8400848484008484840084848400008400000084000084848400848484008484
      8400848484008484840084848400C6C6C6000000000000000000000000000000
      0000000000009494940077777700BCBCBC00B9B9B900C2C2C200C1C1C1008D8D
      8D008C8C8C006F6F6F006F6F6F000000000000840000FFFFFF00008400000084
      000000840000C6C6C60000840000008400000084000000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C60000000000BC4B0000FCF8F700FCF8F700FCF8
      F700FDF1E500FFEFDC00FFEDD500FEE5CA00FFE9C200DEC2B100DEBDA600FFE9
      B200BC4B0000000000000000000000000000C6C6C60000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000C6C6C6000000000000000000000000000000
      0000929292007A7A7A00C4C4C400BABABA00BBBBBB00C0C0C0007E7E7E006A6A
      6A006F6F6F0042424200000000000000000000840000FFFFFF00FFFFFF000084
      0000C6C6C600008400000084000000840000FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C60000000000BC4B0000FCF8F700FCF8F700FCF8
      F700FCF8F700FBF3EA00FDF1E500FFF2D700D9C2C100090A9000090A9000D5BB
      AC00BC4B000000000000090A900000028F0000FF000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      000000840000008400000084000000FF00000000000000000000868686008282
      82007C7C7C00CFCFCF00B7B7B700B2B2B200BCBCBC00838383007D7D7D000000
      00000000000000000000000000000000000000840000FFFFFF0000840000C6C6
      C600008400000084000000840000FFFFFF00FFFFFF0000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C60000000000BC4B0000FAEFE500FBF3EA00FBF3
      EA00FDF1E500FAE7D400FEE5CA00FFE3C500C1A5A700090A9000112DEA00090A
      900065416600090A90000622EB000003920000FF000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      000000840000008400000084000000FF00000000000089898900A1A1A100CCCC
      CC00BEBEBE00B7B7B700A1A1A100B0B0B000868686007F7F7F00000000000000
      00000000000000000000000000000000000000840000FFFFFF00C6C6C6000084
      000000840000008400000084000000840000FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C60000000000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000EF90370097543D00090A90001933
      E200090A9000122DE500000392000000000000FF000000FF000000FF000000FF
      000000FF000000FF00000084000000840000008400000084000000FF000000FF
      000000FF000000FF000000FF000000FF0000000000008C8C8C00D9D9D900CECE
      CE00CBCBCB00B5B5B500A8A8A8008A8A8A008585850000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF00008400000084
      0000FFFFFF00FFFFFF000084000000840000FFFFFF0000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000000000000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B000045265800090A
      90003C66FF00090A900000000000000000000000000000000000000000000000
      00000000000000FF00000084000000840000008400000084000000FF00000000
      0000000000000000000000000000000000000000000096969600A2A2A2008B8B
      8B009F9F9F00CFCFCF00A7A7A700808080000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000090A9000354C
      E000090A90002C46E700090A9000000000000000000000000000000000000000
      00000000000000FF00000084000000840000008400000084000000FF00000000
      0000000000000000000000000000000000000000000095959500919191009D9D
      9D0084848400CCCCCC0096969600858585000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000FFFFFF00FFFF
      FF0084848400FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000090A90004F65E7000609
      900000000000090A90002C46E700060990000000000000000000000000000000
      00000000000000FF00000084000000840000008400000084000000FF00000000
      0000000000000000000000000000000000000000000000000000000000009595
      9500D0D0D000D2D2D20089898900939393000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000090A9000090A90000000
      000000000000000000000609900000028F000000000000000000000000000000
      00000000000000FF00000084000000840000008400000084000000FF00000000
      0000000000000000000000000000000000000000000000000000000000009B9B
      9B009E9E9E00828282008B8B8B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00FF000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000007777
      7700555555005555550055555500555555005555550055555500555555005555
      55005555550055555500555555000000000086868600FFFFFF00F1F1F100FFFF
      FF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFF
      FF00F1F1F100FFFFFF0000000000FF00FF000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000007777
      7700CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00555555000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1
      F100FFFFFF00F1F1F10000000000FF00FF000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000CC3333007777
      7700FFFFFF00EAEAEA00EAEAEA00D6E7E700D6E7E700EAEAEA00D6E7E700D6E7
      E700D6E7E700CCCCCC00555555000000000086868600FFFFFF00F1F1F1009966
      3300996633009966330099663300996633009966330099663300996633009966
      3300F1F1F100FFFFFF0000000000FF00FF000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C0000000000000000000000000000000000000000000CC333300000000000404
      040004040400996600009966000099660000EAEAEA00D6E7E700EAEAEA00D6E7
      E700D6E7E700CCCCCC00555555000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1
      F100FFFFFF00F1F1F10000000000FF00FF000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C0000000000000000000000000000000000000808000CC33330066333300CC33
      3300FF663300FF663300FF663300FF66330099660000EAEAEA00D6E7E700EAEA
      EA00D6E7E700CCCCCC00555555000000000086868600FFFFFF00F1F1F1009966
      3300996633009966330099663300996633009966330099663300996633009966
      3300F1F1F100FFFFFF0000000000FF00FF000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000080800000808000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000005F5F5F006699990099330000FF66
      3300FF663300C0C0C000C0C0C000CC333300FF66330099660000EAEAEA00D6E7
      E700D6E7E700CCCCCC00555555000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1
      F100FFFFFF00F1F1F10000000000FF00FF000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00000000000000000000000000000000000777777006699CC00CC663300FF66
      3300CC660000F0FBFF00F0FBFF00F1F1F100F0FBFF00EAEAEA00D6E7E700EAEA
      EA00D6E7E700CCCCCC00555555000000000086868600FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF00800000008000000080000000FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF0000000000FF00FF000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C00000000000000000000000000000000000000000007777770099CCFF00FF66
      3300CC660000CC660000CC660000CC660000CC660000CC660000EAEAEA00D6E7
      E700D6E7E700CCCCCC00555555000000000086868600FFFFFF00F0CAA6009900
      0000FFFFFF00FF663300FF99330000993300FF00000080000000FFFFFF009900
      0000F0CAA600F1F1F10000000000FF00FF000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C0000000000000000000000000000000000000000000800000006699990099FF
      FF00CC660000F0FBFF00F0FBFF00CC333300FFCC0000CC660000F1F1F100EAEA
      EA00D6E7E700CCCCCC00555555000000000086868600F0CAA60099000000FFFF
      FF00F1F1F10080800000FFFF3300FFCC33000099330080000000F1F1F100FFFF
      FF0099000000F0CAA60000000000FF00FF000000000000000000008080000000
      0000000000000000000000000000808000000000000000000000000000000000
      00000000000000808000000000000000000080808000FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000800000009999
      6600CCCC9900CC333300CC333300FFFF6600CC660000F1F1F100F0FBFF00EAEA
      EA00CCCCCC0099999900555555000000000086868600FFFFFF00F0CAA6009900
      0000FFFFFF0080800000FFFFFF00FFFF3300FF99330080000000FFFFFF009900
      0000F0CAA600F1F1F10000000000FF00FF000000000000000000008080000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000008000
      0000CC660000CC660000CC660000CC660000F0FBFF00FF663300F1F1F100CCCC
      CC009999990077777700555555000000000086868600FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF008080000080800000FF663300FFFFFF00F1F1F100F0CA
      A600F1F1F100FFFFFF0000000000FF00FF000000000000000000008080000000
      0000000000000000000080800000000000008080000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000008686
      8600FFFFFF00F0FBFF00F0FBFF00CC660000CC660000F0FBFF00F0FBFF005555
      55003333330033333300333333000000000086868600FFFFFF00FFFFFF00F1F1
      F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF00F1F1F100FFFFFF000000
      0000000000000000000000000000FF00FF000000000000000000000000000000
      00000000000080800000FFFFFF00000000000000000080800000000000000000
      00000000000000000000000000000000000080808000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000008686
      8600FFFFFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF009999
      9900FFFFFF0055555500000000000000000086868600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F100FFFFFF00F1F1F100C0C0
      C000FFFFFF0086868600FF00FF00FF00FF000000000000000000000000000000
      000080800000FFFFFF00FFFFFF00000000000000000080800000808000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      8000FFFFFF0080808000FFFFFF0080808000FFFFFF0080808000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008686
      8600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009999
      99005555550000000000000000000000000086868600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00086868600FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008686
      8600868686008686860086868600868686008686860086868600868686008686
      8600000000000000000000000000000000008686860086868600868686008686
      8600868686008686860086868600868686008686860086868600868686008686
      8600FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE8400848484008484840000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B009C4B4C00B64B4C009F4B4C004E1E1F0000000000000000000000
      00000000000000000000000000000000000000000000A6A8A900A6A8A900A6A8
      A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8
      A900A6A8A900A6A8A900A6A8A900000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008484840084848400FFCE8400FF0000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000824B4B009A4D
      4E00AF4E4F00C04D4E00BF4C4D009F4B4C004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B0000000000000000009EB7E1009DC1FB009EBF
      FA009FBFFA00A0BFFB00A1C3FD00A7C5FF00A9C6FF00A9C8FF00ADC8FF00AAC8
      FF00AAC8FF00A8C6FF0096A8C900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000000000000000000084848400FF00
      0000FF000000FF000000FF000000FF000000FF00000084848400848484000000
      0000000000000000000000000000000000000000000000000000824B4B00CC57
      5800CB565700C9545500C7535400A34E4F004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B00000000000000000099B0D6009DBAEF009BB7
      EB0097B5E9009DB8EC009EB9EE00A2B8EE00A2B8EE00A6C0F000ADC2F400ADC3
      F500ABC2F400AAC3F50096A7C400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFDEAD00FF000000FF00
      0000FFCE8400FFCE8400FF000000FF000000FF000000FF000000848484000000
      0000000000000000000000000000000000000000000000000000824B4B00D05A
      5B00CF595A00CC575800CB565700A55050004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B00000000000000000097B0D5009ABAED0096B3
      E80096B4E80099B4E80098B2E70099AFE5009BB1E600A2B9EA00A8BAED00AABF
      F200A8C0F200ABC5F60098AAC500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFDEAD00FF000000FF000000FF00
      00000000000000000000FFCE8400FF000000FF00000084848400000000000000
      0000000000000000000000000000000000000000000000000000824B4B00D962
      6300D8606200D55E5F00D45D5E00A95354004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B00000000000000000095AED30093B4E5008FA9
      E00090A8E300859ED5008293D0008EA1DB00899CD100828CC7008090C6008599
      CD008B9FD6008CAADF00909EBD00000000000000000000000000000000000000
      0000000000000000000000000000848484000000FF0084848400000000000000
      000084848400000000008484840000000000FFDEAD00FF000000848484000000
      00000000000000000000FFCE8400FF000000848484000000000000000000FF00
      0000848484000000000000000000000000000000000000000000824B4B00DD65
      6600DC646500D9626300D8606200AB5555004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B000000000000000000889FC700889CDE008297
      D2008A9DD700A0ACDC008499C2004A6E9D004F6D9B0061789D00B0BBDA0098A3
      DC007D8ECC006E82BF00808AAC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400848484000000000000000000FFDEAD00FF000000848484000000
      00000000000000000000FFCE840084848400000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000824B4B00E66C
      6D00E56B6C00EEA6A700FFFFFF00AF5859004E1E1F00B7EBAA005ED3770045CA
      670045CA6700F7B5B600824B4B00000000000000000094A9D500808FD8009AAC
      DF00ADBCE200DAE2F200637CA500525DB0005E50AF00AEBFE500767E9E00D3DB
      EF00BDC6E700828AC3006E7C9A00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000848484000000000000000000FFDEAD00FF000000848484000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000824B4B00EA6F
      7000E96E6F00F2A9AA00FFFFFF00B15A5A004E1E1F00FFFFD300FFFFD300FFFF
      D300D9F6BD00F7B5B600824B4B00000000000000000092A8D3007E93D9009AAD
      DB00CCD5EA00BEC8E2008C9DBF004C41A30047369000A2A9D5007E86A200D5DE
      F200CCD5EA00586093007283A000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000FFDEAD00FF000000848484000000
      00000000000000000000FF00000084848400000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000824B4B00F377
      7800F2767700EF747500EE737400B55D5D004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B0000000000000000008A9CC7008CA5E500889F
      DD00899BCC00C1CAE0007F8AA700595CAD006455BB00727EAA0078799800686D
      8C00606590006880B1008497BA00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00000000000000000000000000FFA5A500FF0000000000
      000000000000FF000000FF000000848484000000000000000000FF000000FF00
      0000848484000000000000000000000000000000000000000000824B4B00F77A
      7B00F6797A00F3777800F2767700B75F5F004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B0000000000000000009CAFD6008FA9E2009AB6
      EC009BBAEF008AA1DA006E7DB300556195004458890051608E00576492007D93
      C900809ACF008BAEE4008FA6C300000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000848484008484840084848400FF000000FF00
      0000848484000000000000000000000000000000000000000000824B4B00FF81
      8200FE808100FC7F8000FB7E7F00BB6363004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B0000000000000000009FB8D80096B8EA0090AD
      E60093AFE80094B3EB0096B2EF0093AFE60082A1DA008BA8E10088A7E10094B2
      E7009EBBEF00A8C6F60098ACC700000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFCE
      8400FF000000FF000000FF000000FF000000FF000000FF000000FF0000008484
      8400000000000000000000000000000000000000000000000000824B4B00FF81
      8200FF818200FF818200FE808100BD6565004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B0000000000000000009FB9D8009EC1F20092B1
      E70090AEE6008FAEE8008FAFEB0091AFEA008CABE7008EAEE70094B3EA00A1C1
      F100A8C7F500B1CFFB009CAFC800000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFCE8400FF000000FF000000FFCE8400FFCE8400FFCE8400000000000000
      0000000000000000000000000000000000000000000000000000824B4B00AF5E
      5F00D56F7000FF818200FF818200BF6666004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B000000000000000000A5C1E500A7CFFF00A6CA
      FF00A3C6FF009FC8FF00A0CDFF00A5CCFF00A6CDFF00AAD1FF00B3D8FF00B4DA
      FF00BCE0FF00C1E3FF00A4BAD200000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE8400FF000000848484000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B00B6626300EE7A7B00BF6666004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B000000000000000000A6A8A900A6A8A900A6A8
      A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8A900A6A8
      A900A6A8A900A6A8A900A6A8A900000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE8400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFF807F8047FC01FF03
      80018001FC01FE0180018001C001FC79800180018001F8F9800180018001F819
      800180018001F011800180018001E083800180018001C107800180018001820F
      800180018003841FC003C003801F883FE007E007801F907FF00FF00F801F81FF
      FC3FFC3F801FC3FFFFFFFFFFFFFFFFFFF83FFFFFFFFFFFFFE007FF8FE08FE78F
      C007FF07E007C30FC007FE03E003C30FC007FE01E001C30FC007FE01E001C103
      C007C701C601C00BC00780078007E00BC007801F801FE00BC007803F803FE003
      C00780FF80FFC007C00788FF88FFC007C007C0FFC0FFC007C007C0FFC0FFC007
      E007E1FFE1FFE00FF83FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8001F007FC01FFCF
      8001E0C7FC01F0078001C001C001E003800180018001E001800180018001E003
      A40180018001E007B00181818001E007A00581818001E007800180018001E007
      800180018003E00780018001801FE007C007C003801FE007F00FE307801FE007
      F81FF00F801FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC007C007E7FFE3FF
      DE07C00781FFE0FFD407E0078007E007D407E0078001E001D407C0038001C001
      D407C0038001C001D407C00380018001D407C00380018001D507C00380018001
      DF87800380018001C00780038001F001DF0780038001F001C00780038041FFC1
      FC7F80038041FFC1FFFFFFFFFFFFFFFFE000FFFFF81FFFFFE000FFFFF81FFF87
      E0000007F81FFF01E0000007F81FFF0100000007F81FFE01000000070000FC01
      000000070000F801000000070000F003000000040000C01F000000000000803F
      000000010000807F00008003F81F80FF0000FFC1F81F80FF0001FF88F81FE0FF
      E003FF9CF81FE1FFE007FFFFF81FFFFFC001800FFFFFFFFE80310007E0010002
      80310007E001000280310007C001000280010007A00100028001000700010002
      80010007000100028FF10007000100028FF10007800100028C71000780010002
      8C710007C00100028C710007E001000289350007E001001E81810007E0030000
      E18F800FE0070000E00FD55FE00F0000FFFFFE7FFFFFC00FFC7FE07F8001C007
      E03FC00180018003C01FC0018001BFF3801FC0018001BFF30C3FC0018001BE31
      1C67C001800180011CE3C001800180011FE3C0018001C0011CE3C0018001E001
      98C7C0018001F003F007C0018001F00FE00FC0018001F00FF03FC0018001F00F
      F8FFE0018001F007FCFFFE7FFFFFF80700000000000000000000000000000000
      000000000000}
  end
  object sList: TDataSource
    DataSet = dsListPeriod
    Left = 600
    Top = 152
  end
  object dsListPeriod: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT STUDIES.*,'
      
        '            case studies.p_sex when '#39'F'#39' then '#39#1046#39' else '#39#1052#39' end as' +
        ' fp_sex,'
      
        '            (SELECT COUNT(*) FROM IMAGES WHERE P_PID = STUDIES.P' +
        '_PID and images.studyuid=STUDIES.studyuid) AS CNT '
      'FROM STUDIES, PATIENTS'
      'WHERE STUDIES.LDATE >= :PFD_DATE1'
      '  AND STUDIES.LDATE < :PFD_DATE2 + 1'
      '  AND STUDIES.P_PID = PATIENTS.P_PID'
      '')
    AfterOpen = dsListPeriodAfterOpen
    AfterScroll = dsListPeriodAfterScroll
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 560
    Top = 120
    object FIBStringField1: TFIBStringField
      FieldName = 'STUDYUID'
      Size = 80
      EmptyStrToNull = True
    end
    object FIBStringField2: TFIBStringField
      FieldName = 'P_ENAME'
      Size = 50
      EmptyStrToNull = True
    end
    object FIBStringField3: TFIBStringField
      FieldName = 'P_SEX'
      Size = 4
      EmptyStrToNull = True
    end
    object FIBStringField4: TFIBStringField
      FieldName = 'P_PID'
      Size = 80
      EmptyStrToNull = True
    end
    object FIBStringField5: TFIBStringField
      FieldName = 'STUDYID'
      EmptyStrToNull = True
    end
    object FIBStringField6: TFIBStringField
      FieldName = 'PEER_IP'
      EmptyStrToNull = True
    end
    object FIBIntegerField1: TFIBIntegerField
      FieldName = 'BSTATE'
    end
    object FIBDateTimeField1: TFIBDateTimeField
      FieldName = 'LDATE'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object FIBDateTimeField2: TFIBDateTimeField
      FieldName = 'BACKUPTIME'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object FIBStringField7: TFIBStringField
      FieldName = 'BACKUPVAL'
      EmptyStrToNull = True
    end
    object FIBIntegerField2: TFIBIntegerField
      FieldName = 'STUDY_IMAGE_COUNT'
    end
    object FIBStringField8: TFIBStringField
      FieldName = 'STUDIES_IMAGE_TYPE'
      Size = 4
      EmptyStrToNull = True
    end
    object FIBStringField9: TFIBStringField
      FieldName = 'RPHYS'
      EmptyStrToNull = True
    end
    object FIBStringField10: TFIBStringField
      FieldName = 'OPNAME'
      EmptyStrToNull = True
    end
    object FIBStringField11: TFIBStringField
      FieldName = 'PERFORMPHYS'
      EmptyStrToNull = True
    end
    object FIBStringField12: TFIBStringField
      FieldName = 'CALLING_AE_TITLE'
      Size = 16
      EmptyStrToNull = True
    end
    object FIBStringField13: TFIBStringField
      FieldName = 'STUDYDESCRIPTION'
      Size = 80
      EmptyStrToNull = True
    end
    object FIBStringField14: TFIBStringField
      FieldName = 'INSTITUTIONALDEPARTMENTNAME'
      Size = 80
      EmptyStrToNull = True
    end
    object FIBStringField15: TFIBStringField
      FieldName = 'REFERRINGPHYSICIANNAME'
      Size = 80
      EmptyStrToNull = True
    end
    object FIBIntegerField3: TFIBIntegerField
      FieldName = 'REPORTSTATE'
    end
    object FIBIntegerField4: TFIBIntegerField
      FieldName = 'PRINTSTATE'
    end
    object FIBStringField16: TFIBStringField
      FieldName = 'P_AGE'
      Size = 4
      EmptyStrToNull = True
    end
    object FIBStringField17: TFIBStringField
      FieldName = 'P_DOB'
      Size = 4
      EmptyStrToNull = True
    end
    object dsListPeriodCNT: TFIBIntegerField
      FieldName = 'CNT'
    end
    object dsListPeriodP_DATEBORN: TFIBDateTimeField
      FieldName = 'P_DATEBORN'
    end
    object dsListPeriodP_ENAME_RUS: TFIBStringField
      FieldName = 'P_ENAME_RUS'
      Size = 50
      EmptyStrToNull = True
    end
    object dsListPeriodSTATUS: TFIBIntegerField
      FieldName = 'STATUS'
    end
    object dsListPeriodNAME_DISC: TFIBStringField
      FieldName = 'NAME_DISC'
      Size = 50
      EmptyStrToNull = True
    end
    object dsListPeriodFP_SEX: TFIBStringField
      FieldName = 'FP_SEX'
      Size = 1
      EmptyStrToNull = True
    end
    object dsListPeriodACCESSIONNUMBER: TFIBStringField
      FieldName = 'ACCESSIONNUMBER'
      EmptyStrToNull = True
    end
    object dsListPeriodFC_AEAPPARAT: TStringField
      FieldName = 'FC_AEAPPARAT'
    end
    object dsListPeriodExFiles: TSmallintField
      FieldName = 'ExFiles'
    end
  end
  object pmTV: TPopupMenu
    Images = IL
    Left = 824
    Top = 154
    object TV_menu_prn: TMenuItem
      Action = aPrint
    end
    object TV_menu_exp: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 4
      object MenuItem2: TMenuItem
        Action = aText
      end
      object MenuItem3: TMenuItem
        Action = aWeb
      end
      object MenuItem4: TMenuItem
        Action = aXML
      end
      object MenuItem5: TMenuItem
        Action = aExcel
      end
    end
    object N2: TMenuItem
      Action = aClearTV
    end
  end
  object sdPopUp: TSaveDialog
    Left = 825
    Top = 203
  end
  object frxRep1: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39958.486602141200000000
    ReportOptions.LastChange = 41191.418348738430000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRep1GetValue
    Left = 825
    Top = 288
    Datasets = <
      item
        DataSet = frxDB1
        DataSetName = 'frxDB1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 90.708720000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1084.725110000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8211#1057#1107#1057#1026#1056#1029#1056#176#1056#187' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#8470' '#1056#183#1056#176' [DATE1]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 985.898270000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[DATESYS]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 30.236240000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#8470': [VSEGO]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 64.252010000000000000
          Top = 71.811070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1030#1057#8249#1056#1111'.')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 158.740260000000000000
          Top = 71.811070000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1105#1057#1027#1057#1027#1056#187'.')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 302.362400000000000000
          Top = 71.811070000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#152#1056#1115' '#1056#1111#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 831.496600000000000000
          Top = 71.811070000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#1105#1056#1111' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 642.520100000000000000
          Top = 71.811070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169'.')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 737.008350000000000000
          Top = 71.811070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 16777180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 170.078850000000000000
        Width = 1084.725110000000000000
        DataSet = frxDB1
        DataSetName = 'frxDB1'
        RowCount = 0
        object Memo12: TfrxMemoView
          Left = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 64.252010000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDB1."LDATE"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 158.740260000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDB1."P_PID"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 302.362400000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDB1."P_ENAME_RUS"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 831.496600000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDB1."STUDIES_IMAGE_TYPE"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 642.520100000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDB1."P_DATEBORN"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 737.008350000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDB1."P_SEX"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 249.448980000000000000
        Width = 1084.725110000000000000
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Width = 1077.166050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
        end
      end
    end
  end
  object frxDB1: TfrxDBDataset
    UserName = 'frxDB1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 825
    Top = 336
  end
  object MainMenu1: TMainMenu
    Images = IL
    Left = 457
    Top = 360
    object N3: TMenuItem
      Caption = #1043#1083#1072#1074#1085#1086#1077
      object N4: TMenuItem
        Action = aChangeUser
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7
          DDFF6E84F55A7BF24B71EF3460ED5570F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFCFCFF4578F9BEF3FF96D8FF76BAFF508CFD647D
          F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDEECDB0E2B0FFFFFFFFFFFF4F
          7EF989CEFF79BDFF6BADFF2648E6E1E3FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          90D99124A525EDF9EDFFFFFFFFFFFF4974FB6FB3FF69ACFF5C9CFF4B8AFF2249
          EDC8CDFAFFFFFFFFFFFFFFFFFFBAE3BA16AC2993D393FFFFFFFFFFFFFFFFFF4F
          73FA5C9CFF2A59F03F78FC2967FF0D4AFF1434E7E2E4F9FFFFFFFFFFFF4DB655
          1CB337BCE2BCFFFFFFFFFFFFFFFFFF6F88FD3171FF99A3F29CA7F7163FEF0338
          FF0030F96370DDFFFFFFFFFFFF2DA93724BF4A83CA84FFFFFFFFFFFFFFFFFFD6
          DAFF7A88F8F2F3FFFFFFFFCFD3FB0D2EE50029ED182ECFFFFFFFFFFFFF3BAE45
          29C75728B141CFE9CFFFFFFFF0F8F079C176D6EBD6FFFFFFFFFFFFFFFFFF808A
          E70024E11024C9FFFFFFFFFFFF67B96B3FD06E37D3702DB64B9ACD9A95C49576
          F7A676C278FFFFFFFFFFFFFFFFFFB7BBEF001ACE444FCCFFFFFFFFFFFFE1F1E1
          2FAE473BD87350E1825ADD8238B14E7FFDAD53B25AFFFFFFFFFFFFFFFFFF8F94
          E30216C0BEC0EDFFFFFFFFFFFFFFFFFFC8E6C831B14965EA9470ED9B7CF5A687
          FFB14CB358FFFFFFFFFFFFEAEAFA212ABD9497E6FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE1EFE1248F2977F0A181F3A690FFB845B654FFFFFFFFFFFFB0B2EFD0D1
          F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66B96D6ADF8F7AF3A589FAB192
          FFBA49BC5BFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF59B56235A34748A4535BA86090BB90DAE9DAFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      end
      object sysdba1: TMenuItem
        Action = aEditSysdba
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFB1D1E31582B277B2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFED2E7EF0689BD01C5F60572A7D9EA
          F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F9FD4F
          ABCA0180B00077AA00CFFF01A7DC3380AA6EAED0F7FAFBFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF1F8FC15A5D602D0FF03D4FF10D5FF27E1FF0290
          C40187BB76ABC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90
          C2DA1BD2FC32E0FF43E3FF1AC1EC00BEF54FF2FF2486B0FFFFFFFFFFFFECF6FB
          6FC0E16DBBDDD9EEF7FFFFFFFFFFFFE1EEF71B91BA49E2FD00B8EC2FE1FF84F6
          FF52ADCEB6D3E5FFFFFFFFFFFF4DABCF00B7EA02C8F614AAD6A2CFE5A5D1E513
          8CBB00AAE317D5FF7EFDFF57BCD683BBDBFBFDFDFFFFFFFFFFFFFFFFFF15ACDB
          38E8FF28CCF300BFF4089FD0009BD00BD1FF71FFFF5FCCE16AB8D7EEF6FBFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF25B5E031DAFEE1F6FA46CDEE01C4F75BF4FF7D
          EAF45AB8DBDAEDF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4EBEE0
          35CBEDD5F1FAD4FFFF46DFFB39C6E667B5D9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFA2D6E747D7F27BE4FCFFFFFF50EEFF22CEF74F
          B0D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFE
          56D0EC4ACEEB83E1F75BEBFF3FE1FF43ACD7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBF2FC59DAF065E6F963F3FF4BE0FA74
          C2E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFDCF1F966C9E54CCAE548B4D8F3F9FDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object N10: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N10Click
      end
      object Dsjl1: TMenuItem
        Action = aClose
      end
    end
    object N6: TMenuItem
      Caption = #1054#1087#1094#1080#1080
      object N7: TMenuItem
        Action = aParam
      end
      object N8: TMenuItem
        Action = aUsers
        Bitmap.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0C23C40A1EB00512A50610A4040CA30409A101079D0000980000950000AC0000
          00AA3600A54000A63B00A239009F35009A36009D350086000000000000000000
          00000000001238D01034C01239BF184CCC1E5DD81E5DD61D57D31A4FCE1643C6
          0F2CB60001A3200885C35300B25610B65D18B8601AB65E18B05413A7490B9D36
          00AA3700AE3A00000000000000143EC31A50CE1B57D3205FD92167DE2266DC20
          60D81B56D31749CA143EC20926B60000A0D37513C27227C6782BC6792BC37327
          BF6C24B75F1BAA4D0FAC52129A3401000000000000184ECD1C56D32167DD2672
          E52879E92678E8236EE31F61DA1A53CF1543C60D35C212078CD67C19C8792BBC
          5A08B75607C97A2AC57528BE6B21B7611BB25917993200000000000000215CD3
          205FD7246DE22A7EED2D8AF62E8BF4287EEF226EE41D5CD6184ACA0630C54222
          6CD88223C1640EDBA059E5B773AF4800CA7F2EC16F25BB651EAF5414972E0000
          00000000000073FF256AE12470E32B84F23298FD287EEF1D47C3283EAE103EC4
          1A53D1000EB7A04B1ED0852EBD5A01F0D299F9E2A8D19250BD6214C57428BD6A
          22A74206AC34000000000000000000002981FF246DE72675E7297FED2465D976
          A4CC98B7C60F25B00D28B80000B2EE6C00CD7118C65C00FFDD9CF7EBC0FFE5A3
          BA4400D8751DB74B03C13F00000000000000000000000000000000237EFF1C57
          D82B86F347ABFF4DAEFF45ACFF2D91FC030DB30000000000000000000000002A
          99FF299BFF1B90FC005E9C235C75000000000000000000000000000000000000
          00000000000034AEFF52AEFF6ABBFF67B9FF66B9FF59B4FF38B7FF0000000000
          0025B1FF35A6FF6DC0FF6DBDFF70C0FF2788C80070A6006DAA007BBA00000000
          000000000000000000000000000037AAFF74C2FF76C2FF76C1FF72BEFF6CBDFF
          3EAEFF00000000000031A8FF70BEFF7DC8FF7CC6FF78C5FF55A9EA006A9B0078
          AB0072AB000000000000000000000000000000007BB51078C191D6FF88CDFF86
          CDFF7DC7FF76C4FF46A7FF0992CC00000034AAFF87CEFF8DD2FF8DD2FF84CCFF
          5BAEED006C9E007CAF0070A30000000000000000000000000000000071AC0067
          9900699BA1DEFF96D6FF87CEFF80C9FF2989C9006EA500000039AEFF92D3FFA0
          DCFF9FDCFF93D5FF3993CC0078AB0080B300759B000000000000000000000000
          0000000073AE0083B60070A382C7F3A0DCFF8ED2FF87CFFF03699F0071AC0000
          0034A9FF47A4DA3A9CCC46A1D43F9BD00071A30088BB0082B50073A500000000
          00000000000000000000000077B10083B60089BC0F81B55EB2E561B3EA1F87BD
          006B9F007DBB0000000090C60088BA0091C3008CBF008ABD008FC2008BBE0076
          AB0079BC0000000000000000000000000000000087CD007DB00090C30094C700
          8CBF0083B6007DB0007CB5000000000000009FDE008DC2009ACD009ED10098CA
          0091C3007DB10080BD0000000000000000000000000000000000000000000083
          BC007EB10086B70086B8007FB30078AD007BA00000000000000000000092C900
          80B40081B4007DB00074A90078B5000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      object N9: TMenuItem
        Action = aJournal
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B7C6B9D7E6D9C7E6D9C7E6D9C7E6D9C
          7D6D9C7D6C9B7C6B9B7C6B9A7C6A997B689B7C6BFFFFFFFFFFFFFFFFFFFFFFFF
          9B7766F8F0E6C2BCD0AEA7C8ECE3D8E6DDD5E6DDD5E3DAD2E3D8D1E1D7CEE3D9
          CF977967FFFFFFFFFFFFFFFFFFFFFFFFA27F6F7A756DC6C3D4AFAACDF0E8DAE9
          E1D6E8E1D6E8DFD2E5DBD1E4DACEE8DACE987968FFFFFFFFFFFFFFFFFFFFFFFF
          A38070D5C0A4D7C6C5C3B2BFF8E2C6F3DDC3F2DCC2F2DAC0F0D8BEEFD6BDF2D7
          BB997A6AFFFFFFFFFFFFFFFFFFFFFFFFA98778FCFDFCC7CAE9B0B6E4F3F3F3EC
          EEEFEAECEEE8E8EAE5E5E7E1E3E5E2E2E3997B6BFFFFFFFFFFFFFFFFFFFFFFFF
          AB897AFFFFE9D0C9D8B8B3D4FDEFDAF7E8D7F5E6D6F3E3D2F2E0D0EFDDCCF3DE
          CA9A7C6BFFFFFFFFFFFFFFFFFFFFFFFFAF8E7F7D7871DDCCCFC8BACBFFE9CDF9
          E4CBF8E2C8F6E0C6F5DEC3F4DAC2F5DABF9B7C6BFFFFFFFFFFFFFFFFFFFFFFFF
          AF8F80E5E7E5D8DEFFBCC5F5FFFFFFF9FCFFF5F8FBF1F3F7EDEFF3E9ECEFE9EB
          EC9B7C6CFFFFFFFFFFFFFFFFFFFFFFFFAF8F80FFFFEAD4CEDFBDBBDEFFF5DFFE
          EFDDFAECDAF9E8D5F6E5D1F4E1CEF8E1CD9C7C6DFFFFFFFFFFFFFFFFFFFFFFFF
          B19080FFFFF3DDD0D5CABFD2FFEED3FFEAD1FDE6CFFDE6CFFEE7CFF9E2CBF9DD
          C59F8071FFFFFFFFFFFFFFFFFFFFFFFFB7978778746DD2DBFDBDC9FDFFFFFFFF
          FFFFFEFFFFFDFBF9A78270A78270A78270A78270FFFFFFFFFFFFFFFFFFFFFFFF
          B89888FFEECFDFD1D4CAC0D2FFEBCEFEE6CBFEE5CBFEE3BFA78270F5E2D9B18E
          7EE1D4CEFFFFFFFFFFFFFFFFFFFFFFFFB89888FFFFFFD9E2FFC1CEFFFFFFFFFF
          FFFFFFFFFFFFFFFFA78270B18E7EE1D4CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          B89888B89888B49383B49383B08E7DB08E7DAC8877AC8877A78270E1D4CEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      end
      object N1: TMenuItem
        Action = aDiagnoz
        Caption = #1057#1087#1080#1089#1086#1082' '#1076#1080#1072#1075#1085#1086#1079#1086#1074
      end
    end
  end
  object pmTVA: TPopupMenu
    Images = IL
    Left = 888
    Top = 154
    object TV_menu_prn2: TMenuItem
      Action = aPrintLoc
    end
    object TV_menu_exp2: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 4
      object MenuItem8: TMenuItem
        Action = aTextLoc
      end
      object MenuItem9: TMenuItem
        Action = aWebLoc
      end
      object MenuItem10: TMenuItem
        Action = aXMLLoc
      end
      object MenuItem11: TMenuItem
        Action = aExcelLoc
      end
    end
    object MenuItem12: TMenuItem
      Action = aClearLoc
    end
  end
  object qDelete: TpFIBQuery
    SQL.Strings = (
      'DELETE FROM STUDIES'
      'WHERE STUDYUID = :STUDYUID')
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 537
    Top = 412
    qoAutoCommit = True
  end
  object CnsDMTable1: TCnsDMTable
    AutoShowReffrenceLine = True
    Currentindex = 0
    FetchCount = -1
    Left = 809
    Top = 473
  end
  object DicomServerCore1: TDicomServerCore
    ServerPort = 104
    ForceCheckTableBeforeOpen = False
    SynchronousCMove = False
    OnNormalisedReceived = DicomServerCore1NormalisedReceived
    OnDicomFind = DicomServerCore1DicomFind
    OnDicomGet = DicomServerCore1DicomGet
    OnDicomImage = DicomServerCore1DicomImage
    OnDicomAssociation = DicomServerCore1DicomAssociation
    Left = 376
    Top = 336
  end
  object dsFolderList: TDataSource
    DataSet = MDFolderList
    Left = 424
    Top = 184
  end
  object MDFolderList: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 336
    Top = 184
    object MDFolderListP_ENAME: TStringField
      FieldName = 'P_ENAME'
      Size = 100
    end
    object MDFolderListP_ENAME_RUS: TStringField
      FieldName = 'P_ENAME_RUS'
      Size = 100
    end
    object MDFolderListP_DATEBORN: TDateTimeField
      DisplayWidth = 20
      FieldName = 'P_DATEBORN'
    end
    object MDFolderListP_SEX: TStringField
      DisplayWidth = 5
      FieldName = 'P_SEX'
      Size = 3
    end
    object MDFolderListLDATE: TDateTimeField
      DisplayWidth = 20
      FieldName = 'LDATE'
    end
    object MDFolderListP_PID: TStringField
      DisplayWidth = 50
      FieldName = 'P_PID'
    end
    object MDFolderListCNT: TIntegerField
      DisplayWidth = 10
      FieldName = 'CNT'
    end
    object MDFolderListSTUDIES_IMAGE_TYPE: TStringField
      DisplayWidth = 20
      FieldName = 'STUDIES_IMAGE_TYPE'
      Size = 50
    end
    object MDFolderListNAME_DISC: TStringField
      DisplayWidth = 250
      FieldName = 'NAME_DISC'
      Size = 100
    end
    object MDFolderListACCESSIONNUMBER: TStringField
      DisplayWidth = 50
      FieldName = 'ACCESSIONNUMBER'
      Size = 100
    end
    object MDFolderListFILENAME: TStringField
      FieldName = 'FILENAME'
      Size = 250
    end
    object MDFolderListSTUDYUID: TStringField
      FieldName = 'STUDYUID'
      Size = 50
    end
    object MDFolderListVDESC: TStringField
      FieldName = 'VDESC'
      Size = 80
    end
    object MDFolderListSTUDYID: TStringField
      FieldName = 'STUDYID'
    end
    object MDFolderListTransferSyntax: TIntegerField
      FieldName = 'TransferSyntax'
    end
  end
  object OpenDialog3: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 710
    Top = 451
  end
  object pmTVB: TPopupMenu
    Images = IL
    Left = 888
    Top = 210
    object TV_menu_prn3: TMenuItem
      Action = APrintFolder
    end
    object TV_menu_exp3: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 4
      object MenuItem15: TMenuItem
        Action = actTextFolder
      end
      object MenuItem16: TMenuItem
        Action = actWebFolder
      end
      object MenuItem17: TMenuItem
        Action = actXMLFolder
      end
      object MenuItem18: TMenuItem
        Action = actExcelFolder
      end
    end
    object MenuItem19: TMenuItem
      Action = aClearFolder
    end
  end
  object pmOpen: TdxBarPopupMenu
    BarManager = BM
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton7'
      end
      item
        Visible = True
        ItemName = 'dxBarButton4'
      end
      item
        Visible = True
        ItemName = 'dxBarButton1'
      end>
    UseOwnFont = False
    Left = 712
    Top = 312
  end
  object MDFolderFullList: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 336
    Top = 240
    object StringField1: TStringField
      FieldName = 'P_ENAME'
      Size = 100
    end
    object StringField2: TStringField
      FieldName = 'P_ENAME_RUS'
      Size = 100
    end
    object DateTimeField1: TDateTimeField
      DisplayWidth = 20
      FieldName = 'P_DATEBORN'
    end
    object StringField3: TStringField
      DisplayWidth = 5
      FieldName = 'P_SEX'
      Size = 3
    end
    object DateTimeField2: TDateTimeField
      DisplayWidth = 20
      FieldName = 'LDATE'
    end
    object StringField4: TStringField
      DisplayWidth = 50
      FieldName = 'P_PID'
    end
    object IntegerField1: TIntegerField
      DisplayWidth = 10
      FieldName = 'CNT'
    end
    object StringField6: TStringField
      DisplayWidth = 20
      FieldName = 'STUDIES_IMAGE_TYPE'
      Size = 50
    end
    object StringField7: TStringField
      DisplayWidth = 250
      FieldName = 'NAME_DISC'
      Size = 100
    end
    object StringField8: TStringField
      DisplayWidth = 50
      FieldName = 'ACCESSIONNUMBER'
      Size = 100
    end
    object StringField9: TStringField
      FieldName = 'FILENAME'
      Size = 250
    end
    object MDFolderFullListSTUDYUID: TStringField
      FieldName = 'STUDYUID'
      Size = 50
    end
    object MDFolderFullListffile: TBlobField
      FieldName = 'ffile'
    end
    object MDFolderFullListVDESC: TStringField
      FieldName = 'VDESC'
      Size = 80
    end
    object MDFolderFullListSTUDYID: TStringField
      FieldName = 'STUDYID'
    end
  end
  object dxbar1: TdxBarSeparator
    Category = -1
    Visible = ivAlways
  end
  object dxbar2: TdxBarSeparator
    Category = -1
    Visible = ivAlways
  end
  object dsServ: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      '  from devices'
      'where fn_type = 1'
      '')
    AfterOpen = dsListAfterOpen
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 544
    Top = 260
    object dsServFC_IP: TFIBStringField
      FieldName = 'FC_IP'
      Size = 100
      EmptyStrToNull = True
    end
    object dsServFK_ID: TFIBIntegerField
      FieldName = 'FK_ID'
    end
    object dsServFN_PORT: TFIBIntegerField
      FieldName = 'FN_PORT'
    end
    object dsServFC_TITLE: TFIBStringField
      FieldName = 'FC_TITLE'
      Size = 15
      EmptyStrToNull = True
    end
    object dsServFC_COMMENT: TFIBStringField
      FieldName = 'FC_COMMENT'
      Size = 250
      EmptyStrToNull = True
    end
    object dsServFN_TYPE: TFIBIntegerField
      FieldName = 'FN_TYPE'
    end
  end
  object sServ: TDataSource
    DataSet = dsServ
    Left = 592
    Top = 300
  end
  object PMRemote: TPopupMenu
    Images = IL
    Left = 752
    Top = 154
    object TV_menu_prn1: TMenuItem
      Action = aPrintRemote
    end
    object TV_menu_exp1: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 4
      object MenuItem22: TMenuItem
        Action = aTextRemote
      end
      object MenuItem23: TMenuItem
        Action = aWebRemote
      end
      object MenuItem24: TMenuItem
        Action = aXMLRemote
      end
      object MenuItem25: TMenuItem
        Action = aExcelRemote
      end
    end
    object MenuItem26: TMenuItem
      Action = aClearRemote
    end
  end
  object MemPrnRemote: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 336
    Top = 296
    object MemPrnRemoteP_ENAME: TStringField
      FieldName = 'P_ENAME'
      Size = 50
    end
    object MemPrnRemoteP_ENAME_RUS: TStringField
      FieldName = 'P_ENAME_RUS'
      Size = 100
    end
    object MemPrnRemoteP_DATEBORN: TDateField
      FieldName = 'P_DATEBORN'
    end
    object MemPrnRemoteFP_SEX: TStringField
      FieldName = 'P_SEX'
      Size = 5
    end
    object MemPrnRemoteLDATE: TDateField
      FieldName = 'LDATE'
    end
    object MemPrnRemoteP_PID: TStringField
      FieldName = 'P_PID'
      Size = 80
    end
    object MemPrnRemoteSTUDIES_IMAGE_TYPE: TStringField
      FieldName = 'STUDIES_IMAGE_TYPE'
      Size = 5
    end
    object MemPrnRemoteACCESSIONNUMBER: TStringField
      FieldName = 'ACCESSIONNUMBER'
    end
    object MemPrnRemoteSTUDYUID: TStringField
      FieldName = 'STUDYUID'
      Size = 80
    end
    object MemPrnRemoteVDESC: TStringField
      FieldName = 'VDESC'
      Size = 80
    end
    object MemPrnRemoteSTUDYID: TStringField
      FieldName = 'STUDYID'
    end
  end
  object DSRemote: TDataSource
    DataSet = MemPrnRemote
    Left = 416
    Top = 296
  end
  object pmSave: TdxBarPopupMenu
    BarManager = BM
    ItemLinks = <
      item
        Visible = True
        ItemName = 'bbSaveHDD'
      end
      item
        Visible = True
        ItemName = 'bbSaveDisk'
      end
      item
        Visible = True
        ItemName = 'bbSaveToLocDB'
      end>
    UseOwnFont = False
    Left = 715
    Top = 364
  end
  object ltrRead: TpFIBTransaction
    DefaultDatabase = lDB
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_read_committed'
      'isc_tpb_rec_version')
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    TPBMode = tpbDefault
    Left = 424
    Top = 462
  end
  object ltrWrite: TpFIBTransaction
    DefaultDatabase = lDB
    TimeoutAction = TARollback
    CSMonitorSupport.Enabled = csmeDatabaseDriven
    Left = 376
    Top = 461
  end
  object lDB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = ltrRead
    DefaultUpdateTransaction = ltrWrite
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 320
    Top = 464
  end
  object dslocListPeriod: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT STUDIES.*,'
      
        '            case studies.p_sex when '#39'F'#39' then '#39#1046#39' else '#39#1052#39' end as' +
        ' fp_sex,'
      
        '            (SELECT COUNT(*) FROM IMAGES WHERE P_PID = STUDIES.P' +
        '_PID and images.studyuid=STUDIES.studyuid) AS CNT '
      'FROM STUDIES, PATIENTS'
      'WHERE STUDIES.LDATE >= :PFD_DATE1'
      '  AND STUDIES.LDATE < :PFD_DATE2 + 1'
      '  AND STUDIES.P_PID = PATIENTS.P_PID'
      '')
    AfterOpen = dsListPeriodAfterOpen
    Transaction = ltrRead
    Database = lDB
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 320
    Top = 512
    object dslocListPeriodFIBStringField36: TFIBStringField
      FieldName = 'STUDYUID'
      Size = 80
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBStringField37: TFIBStringField
      FieldName = 'P_ENAME'
      Size = 50
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBStringField38: TFIBStringField
      FieldName = 'P_SEX'
      Size = 4
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBStringField39: TFIBStringField
      FieldName = 'P_PID'
      Size = 80
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBStringField40: TFIBStringField
      FieldName = 'STUDYID'
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBStringField41: TFIBStringField
      FieldName = 'PEER_IP'
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBIntegerField10: TFIBIntegerField
      FieldName = 'BSTATE'
    end
    object dslocListPeriodFIBDateTimeField6: TFIBDateTimeField
      FieldName = 'LDATE'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object dslocListPeriodFIBDateTimeField7: TFIBDateTimeField
      FieldName = 'BACKUPTIME'
      DisplayFormat = 'dd.mm.yyyy hh:mm AMPM'
    end
    object dslocListPeriodFIBStringField42: TFIBStringField
      FieldName = 'BACKUPVAL'
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBIntegerField11: TFIBIntegerField
      FieldName = 'STUDY_IMAGE_COUNT'
    end
    object dslocListPeriodFIBStringField43: TFIBStringField
      FieldName = 'STUDIES_IMAGE_TYPE'
      Size = 4
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBStringField44: TFIBStringField
      FieldName = 'RPHYS'
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBStringField45: TFIBStringField
      FieldName = 'OPNAME'
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBStringField46: TFIBStringField
      FieldName = 'PERFORMPHYS'
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBStringField47: TFIBStringField
      FieldName = 'CALLING_AE_TITLE'
      Size = 16
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBStringField48: TFIBStringField
      FieldName = 'STUDYDESCRIPTION'
      Size = 80
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBStringField49: TFIBStringField
      FieldName = 'INSTITUTIONALDEPARTMENTNAME'
      Size = 80
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBStringField50: TFIBStringField
      FieldName = 'REFERRINGPHYSICIANNAME'
      Size = 80
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBIntegerField12: TFIBIntegerField
      FieldName = 'REPORTSTATE'
    end
    object dslocListPeriodFIBIntegerField13: TFIBIntegerField
      FieldName = 'PRINTSTATE'
    end
    object dslocListPeriodFIBStringField51: TFIBStringField
      FieldName = 'P_AGE'
      Size = 4
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBStringField52: TFIBStringField
      FieldName = 'P_DOB'
      Size = 4
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBIntegerField14: TFIBIntegerField
      FieldName = 'CNT'
    end
    object dslocListPeriodFIBDateTimeField8: TFIBDateTimeField
      FieldName = 'P_DATEBORN'
    end
    object dslocListPeriodFIBStringField53: TFIBStringField
      FieldName = 'P_ENAME_RUS'
      Size = 50
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBIntegerField15: TFIBIntegerField
      FieldName = 'STATUS'
    end
    object dslocListPeriodFIBStringField54: TFIBStringField
      FieldName = 'NAME_DISC'
      Size = 50
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBStringField55: TFIBStringField
      FieldName = 'FP_SEX'
      Size = 1
      EmptyStrToNull = True
    end
    object dslocListPeriodFIBStringField56: TFIBStringField
      FieldName = 'ACCESSIONNUMBER'
      EmptyStrToNull = True
    end
  end
  object locList: TDataSource
    DataSet = dslocListPeriod
    Left = 384
    Top = 512
  end
  object pmSend: TdxBarPopupMenu
    BarManager = BM
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton2'
      end
      item
        Visible = True
        ItemName = 'dxBarButton6'
      end>
    UseOwnFont = False
    Left = 624
    Top = 384
  end
  object pm_Snimok: TdxBarPopupMenu
    BarManager = BM
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton8'
      end
      item
        Visible = True
        ItemName = 'dxBarButton9'
      end>
    UseOwnFont = False
    Left = 752
    Top = 408
  end
  object UniServ: TUniQuery
    Left = 544
    Top = 301
  end
  object UniListPeriod: TUniQuery
    Left = 555
    Top = 153
  end
  object cxShellBrowserDialog1: TcxShellBrowserDialog
    Left = 536
    Top = 472
  end
  object frxReport1: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41767.438371782410000000
    ReportOptions.LastChange = 41767.555089629630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 320
    Top = 584
    Datasets = <>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'dPatientName'
        Value = ''
      end
      item
        Name = 'dPatientSex'
        Value = ''
      end
      item
        Name = 'dPatientBirthDate'
        Value = ''
      end
      item
        Name = 'dStudyDate'
        Value = ''
      end
      item
        Name = 'dPage'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 699.213050000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218' [dPatientName]')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          Top = 52.913420000000000000
          Width = 1046.929810000000000000
          Height = 158.740260000000000000
          ShowHint = False
          Stretched = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 26.456710000000000000
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039' [dPatientBirthDate]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 759.685530000000000000
          Top = 26.236240000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1105#1057#1027#1057#1027#1056#187#1056#181#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039' [dStudyDate]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 434.645950000000000000
          Top = 26.456710000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187'  [dPatientSex] ')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 778.583180000000000000
          Top = 3.779530000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8250#1056#1105#1057#1027#1057#8218' [dPage]')
          ParentFont = False
        end
        object Picture2: TfrxPictureView
          Top = 213.433210000000000000
          Width = 1046.929810000000000000
          Height = 158.740260000000000000
          ShowHint = False
          Stretched = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Picture3: TfrxPictureView
          Top = 374.953000000000000000
          Width = 1046.929810000000000000
          Height = 158.740260000000000000
          ShowHint = False
          Stretched = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Picture4: TfrxPictureView
          Top = 535.693260000000000000
          Width = 1046.929810000000000000
          Height = 158.740260000000000000
          ShowHint = False
          Stretched = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
    end
  end
  object OraListPeriod: TOracleDataSet
    Optimize = False
    Left = 552
    Top = 192
  end
  object OraServ: TOracleDataSet
    Optimize = False
    Left = 544
    Top = 336
  end
  object IL2: TImageList
    Left = 952
    Top = 416
    Bitmap = {
      494C010101003C053C0510001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6CDC60092725B00784E2D00734B
      2C008C725D00DAD3CF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DEC7B600BC754000D6905A00F4BE9500FCC2
      9600D68E550080513000D4CEC800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E9D6C900DD8B4D00CE9D780000000000000000000000
      000000000000F5AF7000896B5400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EEE3DB00DB8F5500C8956B000000000000000000000000000000
      000000000000FDEABC00955C3400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DE945C00CA906300CBB09B00A16B43009A694500D4C5B9000000
      000000000000FDE2AA00AC764E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E29D6900CF8F5D00D9B79F00E9934F00DCB09200F1B9870090613B000000
      0000FDE8D000FDAC6000BEA99800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E4A5
      7900DC925A00D8B7A100F0985200C6AC990000000000FDC28C00A9774E00FDDF
      C500FDA35900CAA2810000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEB68C00E797
      5900D9BAA200F89C5600C8AD980000000000FDBC8800D48C5400DCB28F00FDA2
      5600D2AF95000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFC39F00F4A05900D9BA
      A200FDA65B00CEAE970000000000FDBE8700D28F5800E2B58B00F9A35900D7BD
      A800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7BE8800DAB8A000FDAE
      6400CBA98E0000000000FDC18700D0905F00E8B98A00F5A25A00DDCABB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9EAE000FDBB6D00DAB2
      920000000000FDC48500CF936100EEBE8800EDA35F00E3D5CA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDD09600CEA078000000
      0000FDD69500CF966400F2C28700EAA56500E9DFDA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDE3C000C87F4500D5AA
      8700E7C5A800FCCA8700E6A86F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDECDD00E9AA
      7A00F3A85D00E0B0800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FF03000000000000
      FE01000000000000FC79000000000000F8F9000000000000F819000000000000
      F011000000000000E083000000000000C107000000000000820F000000000000
      841F000000000000883F000000000000907F00000000000081FF000000000000
      C3FF000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object dListImages: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT STUDIES.*,'
      
        '            case studies.p_sex when '#39'F'#39' then '#39#1046#39' else '#39#1052#39' end as' +
        ' fp_sex,'
      
        '            (SELECT COUNT(*) FROM IMAGES WHERE P_PID = STUDIES.P' +
        '_PID and images.studyuid=STUDIES.studyuid) AS CNT '
      'FROM STUDIES, PATIENTS'
      'WHERE STUDIES.LDATE >= :PFD_DATE1'
      '  AND STUDIES.LDATE < :PFD_DATE2 + 1'
      '  AND STUDIES.P_PID = PATIENTS.P_PID'
      '')
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    CSMonitorSupport.Enabled = csmeTransactionDriven
    Left = 872
    Top = 552
    object dListImagesINSTANCEUID: TStringField
      FieldName = 'INSTANCEUID'
      Size = 100
    end
  end
  object dsListImages: TDataSource
    DataSet = dListImages
    Left = 944
    Top = 552
  end
  object UniListImages: TUniQuery
    Left = 873
    Top = 601
  end
end
