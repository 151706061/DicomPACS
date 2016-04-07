object frmPacInfoKonsult: TfrmPacInfoKonsult
  Left = 345
  Top = 28
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1072#1094#1080#1077#1085#1090#1077
  ClientHeight = 660
  ClientWidth = 715
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcAll: TcxPageControl
    Left = 0
    Top = 0
    Width = 715
    Height = 617
    ActivePage = tsTalon
    Align = alTop
    HideTabs = True
    LookAndFeel.Kind = lfUltraFlat
    TabOrder = 0
    ClientRectBottom = 617
    ClientRectRight = 715
    ClientRectTop = 0
    object tsMain: TcxTabSheet
      Caption = #1043#1083#1072#1074#1085#1086#1077
      ImageIndex = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pcMain: TcxPageControl
        Left = 0
        Top = 0
        Width = 715
        Height = 288
        ActivePage = tsPac
        Align = alTop
        HideTabs = True
        LookAndFeel.Kind = lfUltraFlat
        TabOrder = 0
        ClientRectBottom = 288
        ClientRectRight = 715
        ClientRectTop = 0
        object tsPac: TcxTabSheet
          Caption = #1055#1072#1094#1080#1077#1085#1090
          ImageIndex = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object verGr: TcxVerticalGrid
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 709
            Height = 285
            Hint = #1051#1080#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1087#1072#1094#1080#1077#1085#1090#1072
            Margins.Bottom = 0
            Align = alClient
            LookAndFeel.Kind = lfUltraFlat
            OptionsView.RowHeaderWidth = 203
            TabOrder = 0
            object rowPacient: TcxCategoryRow
              Options.Focusing = False
              Options.TabStop = False
              Properties.Caption = #1055#1072#1094#1080#1077#1085#1090
            end
            object merFIOMK: TcxMultiEditorRow
              Options.CanResized = False
              Properties.Editors = <
                item
                  Caption = #1060#1048#1054
                  Hint = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
                  EditPropertiesClassName = 'TcxButtonEditProperties'
                  EditProperties.Alignment.Horz = taCenter
                  EditProperties.Buttons = <
                    item
                      Default = True
                      Glyph.Data = {
                        36040000424D3604000000000000360000002800000010000000100000000100
                        2000000000000004000000000000000000000000000000000000FF00FF00FF00
                        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00914413009144
                        1300914413009144130091441300914413009144130091441300FF00FF00FF00
                        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00F7E6DA00F5E0
                        D100F3DAC800F1D3BE00EFCDB500EDC7AC00EDC7AC0091441300FF00FF00FF00
                        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00F9EDE500F7E6
                        DA00F5E0D100F3DAC800F2D6C300F0D0BA00EECAB00091441300FF00FF00FF00
                        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00FCF5F000D383
                        5700D3835700D3835700D3835700D3835700F0D0BA0091441300FF00FF00FF00
                        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00FFFFFF00FDF8
                        F500FAF1EA00F8EADF00F6E3D500F4DDCC00F2D6C30091441300CEB8AA007A5A
                        46007A5A46007A5A46007A5A46007A5A46007A5A4600E0A98B00FFFFFF00D383
                        5700D3835700D3835700D3835700D3835700F4DDCC0091441300CEB8AA00EFE7
                        E300EBE1DC00E7DBD500E3D5CD00DFCFC600DBC9BF00E0A98B00FFFFFF00FFFF
                        FF00FFFFFF00FDF8F500FAF1EA00F8EADF00F6E3D50091441300CEB8AA00F4EE
                        EB00EFE7E300EBE1DC00E7DBD500E5D8D100E1D2CA00E0A98B00FFFFFF00D383
                        5700D3835700FFFFFF00E0A98B00AB542800AB542800AB542800CEB8AA00F9F5
                        F300DFA98300DFA98300DFA98300DFA98300DFA98300E0A98B00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00E0A98B00F3EBE600AB542800FF00FF00CEB8AA00FFFF
                        FF00FBF8F700F6F1EF00F1EAE700EDE4DF00E9DED800E0A98B00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00E8A98B00C56A3100FF00FF00FF00FF00CEB8AA00FFFF
                        FF00DFA98300DFA98300DFA98300DFA98300DFA98300E0A98B00E0A98B00E0A9
                        8B00E0A98B00E0A98B00E0A98B00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
                        FF00FFFFFF00FFFFFF00FBF8F700F6F1EF00F1EAE700EDE4DF0069473100FF00
                        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
                        FF00DFA98300DFA98300FFFFFF00CEB8AA00694731006947310069473100FF00
                        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00CEB8AA00F3EBE60069473100FF00FF00FF00
                        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00CEB8AA0069473100FF00FF00FF00FF00FF00
                        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00CEB8
                        AA00CEB8AA00CEB8AA00CEB8AA00CEB8AA00FF00FF00FF00FF00FF00FF00FF00
                        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                      Kind = bkGlyph
                    end>
                  EditProperties.ViewStyle = vsHideCursor
                  Width = 75
                  DataBinding.ValueType = 'String'
                  Options.Filtering = False
                  Options.IncSearch = False
                  Options.ShowEditButtons = eisbAlways
                  Value = Null
                end
                item
                  Caption = #8470' '#1052#1050
                  Hint = #1053#1086#1084#1077#1088' '#1052#1077#1076#1080#1094#1080#1085#1089#1082#1086#1081' '#1082#1072#1088#1090#1099' '#1087#1072#1094#1080#1077#1085#1090#1072
                  EditPropertiesClassName = 'TcxLabelProperties'
                  EditProperties.Alignment.Horz = taCenter
                  EditProperties.Orientation = cxoBottom
                  Width = 30
                  DataBinding.ValueType = 'String'
                  Value = Null
                end>
            end
            object merDateAgeSex: TcxMultiEditorRow
              Options.CanResized = False
              Options.Focusing = False
              Options.TabStop = False
              Properties.Editors = <
                item
                  Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
                  EditPropertiesClassName = 'TcxLabelProperties'
                  EditProperties.Alignment.Horz = taCenter
                  DataBinding.ValueType = 'String'
                  Value = Null
                end
                item
                  Caption = #1042#1086#1079#1088#1072#1089#1090
                  EditPropertiesClassName = 'TcxLabelProperties'
                  EditProperties.Alignment.Horz = taCenter
                  DataBinding.ValueType = 'String'
                  Value = Null
                end
                item
                  Caption = #1055#1086#1083
                  EditPropertiesClassName = 'TcxLabelProperties'
                  EditProperties.Alignment.Horz = taCenter
                  DataBinding.ValueType = 'String'
                  Value = Null
                end>
            end
            object rowDoc: TcxEditorRow
              Options.Focusing = False
              Options.Moving = False
              Options.TabStop = False
              Properties.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
              Properties.DataBinding.ValueType = 'String'
              Properties.Value = Null
            end
            object rowKem: TcxEditorRow
              Options.CanResized = False
              Options.Focusing = False
              Options.TabStop = False
              Properties.Caption = #1050#1077#1084' '#1085#1072#1087#1088#1072#1074#1083#1077#1085
              Properties.EditPropertiesClassName = 'TcxLabelProperties'
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.Editing = False
              Properties.Options.Filtering = False
              Properties.Options.IncSearch = False
              Properties.Value = Null
            end
            object rowAddress: TcxEditorRow
              Options.CanResized = False
              Options.Focusing = False
              Options.TabStop = False
              Properties.Caption = #1040#1076#1088#1077#1089
              Properties.EditPropertiesClassName = 'TcxLabelProperties'
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.Editing = False
              Properties.Options.Filtering = False
              Properties.Options.IncSearch = False
              Properties.Value = Null
            end
            object rowAdrProj: TcxEditorRow
              Options.CanResized = False
              Options.Focusing = False
              Options.Moving = False
              Options.TabStop = False
              Properties.Caption = #1040#1076#1088#1077#1089' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1075#1086' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103
              Properties.EditPropertiesClassName = 'TcxLabelProperties'
              Properties.DataBinding.ValueType = 'String'
              Properties.Value = Null
            end
            object rowPhone: TcxEditorRow
              Properties.Caption = #1058#1077#1083#1077#1092#1086#1085
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Glyph.Data = {
                    36040000424D3604000000000000360000002800000010000000100000000100
                    2000000000000004000000000000000000000000000000000000FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00914413009144
                    1300914413009144130091441300914413009144130091441300FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00F7E6DA00F5E0
                    D100F3DAC800F1D3BE00EFCDB500EDC7AC00EDC7AC0091441300FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00F9EDE500F7E6
                    DA00F5E0D100F3DAC800F2D6C300F0D0BA00EECAB00091441300FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00FCF5F000D383
                    5700D3835700D3835700D3835700D3835700F0D0BA0091441300FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00FFFFFF00FDF8
                    F500FAF1EA00F8EADF00F6E3D500F4DDCC00F2D6C30091441300CEB8AA007A5A
                    46007A5A46007A5A46007A5A46007A5A46007A5A4600E0A98B00FFFFFF00D383
                    5700D3835700D3835700D3835700D3835700F4DDCC0091441300CEB8AA00EFE7
                    E300EBE1DC00E7DBD500E3D5CD00DFCFC600DBC9BF00E0A98B00FFFFFF00FFFF
                    FF00FFFFFF00FDF8F500FAF1EA00F8EADF00F6E3D50091441300CEB8AA00F4EE
                    EB00EFE7E300EBE1DC00E7DBD500E5D8D100E1D2CA00E0A98B00FFFFFF00D383
                    5700D3835700FFFFFF00E0A98B00AB542800AB542800AB542800CEB8AA00F9F5
                    F300DFA98300DFA98300DFA98300DFA98300DFA98300E0A98B00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00E0A98B00F3EBE600AB542800FF00FF00CEB8AA00FFFF
                    FF00FBF8F700F6F1EF00F1EAE700EDE4DF00E9DED800E0A98B00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00E8A98B00C56A3100FF00FF00FF00FF00CEB8AA00FFFF
                    FF00DFA98300DFA98300DFA98300DFA98300DFA98300E0A98B00E0A98B00E0A9
                    8B00E0A98B00E0A98B00E0A98B00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
                    FF00FFFFFF00FFFFFF00FBF8F700F6F1EF00F1EAE700EDE4DF0069473100FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
                    FF00DFA98300DFA98300FFFFFF00CEB8AA00694731006947310069473100FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00CEB8AA00F3EBE60069473100FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00CEB8AA0069473100FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00CEB8
                    AA00CEB8AA00CEB8AA00CEB8AA00CEB8AA00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ViewStyle = vsHideCursor
              Properties.EditProperties.OnButtonClick = rowPhoneEditPropertiesButtonClick
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object rowWork: TcxEditorRow
              Options.CanResized = False
              Options.Focusing = False
              Options.TabStop = False
              Properties.Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099'('#1091#1095#1105#1073#1099')'
              Properties.EditPropertiesClassName = 'TcxLabelProperties'
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.Editing = False
              Properties.Options.Filtering = False
              Properties.Options.IncSearch = False
              Properties.Value = Null
            end
            object rowPolis: TcxEditorRow
              Options.CanResized = False
              Options.Focusing = False
              Options.TabStop = False
              Properties.Caption = #1055#1086#1083#1080#1089
              Properties.EditPropertiesClassName = 'TcxLabelProperties'
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.Editing = False
              Properties.Options.Filtering = False
              Properties.Options.IncSearch = False
              Properties.Value = Null
            end
            object rowProj: TcxEditorRow
              Properties.Caption = #1055#1088#1086#1078#1080#1074#1072#1077#1090
              Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.EditProperties.DropDownListStyle = lsFixedList
              Properties.EditProperties.DropDownSizeable = True
              Properties.EditProperties.GridMode = True
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.KeyFieldNames = 'FK_ID'
              Properties.EditProperties.ListColumns = <
                item
                  FieldName = 'FC_NAME'
                end>
              Properties.EditProperties.ListOptions.ShowHeader = False
              Properties.EditProperties.ListSource = dsRegPrin
              Properties.EditProperties.PostPopupValueOnTab = True
              Properties.EditProperties.OnEditValueChanged = rowProjEditPropertiesEditValueChanged
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object rowSnils: TcxEditorRow
              Properties.Caption = #1057#1053#1048#1051#1057
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Glyph.Data = {
                    36040000424D3604000000000000360000002800000010000000100000000100
                    2000000000000004000000000000000000000000000000000000FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00914413009144
                    1300914413009144130091441300914413009144130091441300FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00F7E6DA00F5E0
                    D100F3DAC800F1D3BE00EFCDB500EDC7AC00EDC7AC0091441300FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00F9EDE500F7E6
                    DA00F5E0D100F3DAC800F2D6C300F0D0BA00EECAB00091441300FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00FCF5F000D383
                    5700D3835700D3835700D3835700D3835700F0D0BA0091441300FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0A98B00FFFFFF00FDF8
                    F500FAF1EA00F8EADF00F6E3D500F4DDCC00F2D6C30091441300CEB8AA007A5A
                    46007A5A46007A5A46007A5A46007A5A46007A5A4600E0A98B00FFFFFF00D383
                    5700D3835700D3835700D3835700D3835700F4DDCC0091441300CEB8AA00EFE7
                    E300EBE1DC00E7DBD500E3D5CD00DFCFC600DBC9BF00E0A98B00FFFFFF00FFFF
                    FF00FFFFFF00FDF8F500FAF1EA00F8EADF00F6E3D50091441300CEB8AA00F4EE
                    EB00EFE7E300EBE1DC00E7DBD500E5D8D100E1D2CA00E0A98B00FFFFFF00D383
                    5700D3835700FFFFFF00E0A98B00AB542800AB542800AB542800CEB8AA00F9F5
                    F300DFA98300DFA98300DFA98300DFA98300DFA98300E0A98B00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00E0A98B00F3EBE600AB542800FF00FF00CEB8AA00FFFF
                    FF00FBF8F700F6F1EF00F1EAE700EDE4DF00E9DED800E0A98B00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00E8A98B00C56A3100FF00FF00FF00FF00CEB8AA00FFFF
                    FF00DFA98300DFA98300DFA98300DFA98300DFA98300E0A98B00E0A98B00E0A9
                    8B00E0A98B00E0A98B00E0A98B00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
                    FF00FFFFFF00FFFFFF00FBF8F700F6F1EF00F1EAE700EDE4DF0069473100FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
                    FF00DFA98300DFA98300FFFFFF00CEB8AA00694731006947310069473100FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00CEB8AA00F3EBE60069473100FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00CEB8AA0069473100FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEB8AA00CEB8
                    AA00CEB8AA00CEB8AA00CEB8AA00CEB8AA00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ViewStyle = vsHideCursor
              Properties.EditProperties.OnButtonClick = rowSnilsEditPropertiesButtonClick
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object rowAdmin: TcxCategoryRow
              Properties.Caption = #1051#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1072#1103' '#1085#1077#1087#1077#1088#1077#1085#1086#1089#1080#1084#1086#1089#1090#1100
            end
            object rowLek: TcxEditorRow
              Options.CanResized = False
              Properties.Caption = #1051#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1072#1103' '#1085#1077#1087#1077#1088#1077#1085#1086#1089#1080#1084#1086#1089#1090#1100
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.EditProperties.ViewStyle = vsHideCursor
              Properties.EditProperties.OnButtonClick = rowLekEditPropertiesButtonClick
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.Filtering = False
              Properties.Options.IncSearch = False
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object rowChar: TcxEditorRow
              Options.CanResized = False
              Options.Focusing = False
              Options.Moving = False
              Options.TabStop = False
              Properties.Caption = #1061#1072#1088#1072#1082#1090#1077#1088' '#1087#1086#1073#1086#1095#1085#1086#1075#1086' '#1076#1077#1081#1089#1090#1074#1080#1103
              Properties.EditPropertiesClassName = 'TcxLabelProperties'
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.Filtering = False
              Properties.Options.IncSearch = False
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
          end
        end
        object tsAllergy: TcxTabSheet
          Caption = #1053#1077#1087#1077#1088#1077#1085#1086#1089#1080#1084#1086#1089#1090#1100
          ImageIndex = 1
          object dxBarDockControl2: TdxBarDockControl
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 709
            Height = 28
            Align = dalTop
            BarManager = BM
            SunkenBorder = True
            UseOwnSunkenBorder = True
          end
          object grA: TcxGrid
            AlignWithMargins = True
            Left = 3
            Top = 34
            Width = 709
            Height = 251
            Margins.Top = 0
            Align = alClient
            PopupMenu = pmtvA
            TabOrder = 1
            LookAndFeel.Kind = lfFlat
            object tvA: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsListA
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
                  Column = tvADate
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
              object tvADate: TcxGridDBColumn
                Caption = #1044#1072#1090#1072
                DataBinding.FieldName = 'FD_DATE'
              end
              object tvANe: TcxGridDBColumn
                Caption = #1053#1077#1087#1077#1088#1077#1085#1086#1089#1080#1084#1086#1089#1090#1100
                DataBinding.FieldName = 'SMNAME'
              end
              object tvAWAction: TcxGridDBColumn
                Caption = #1055#1086#1073#1086#1095#1085#1086#1077' '#1076#1077#1081#1089#1090#1074#1080#1077
                DataBinding.FieldName = 'FC_CHAR'
              end
              object tvASotr: TcxGridDBColumn
                Caption = #1042#1088#1072#1095
                DataBinding.FieldName = 'SOTRFIO'
              end
            end
            object grALevel1: TcxGridLevel
              GridView = tvA
            end
          end
        end
      end
      object paList: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 288
        Width = 709
        Height = 326
        Margins.Top = 0
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object cxGr: TcxGrid
          AlignWithMargins = True
          Left = 0
          Top = 35
          Width = 709
          Height = 291
          Hint = #1057#1087#1080#1089#1086#1082' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1087#1086' '#1087#1072#1094#1080#1077#1085#1090#1091
          Margins.Left = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          PopupMenu = pmTV
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          ExplicitLeft = 48
          ExplicitTop = 195
          object TVLIST: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            OnCellDblClick = TVLISTCellDblClick
            DataController.DataSource = dsList
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skSum
                FieldName = 'DOZA'
              end
              item
                Kind = skCount
                Column = VLISTNAME
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CellHints = True
            OptionsBehavior.IncSearch = True
            OptionsBehavior.NavigatorHints = True
            OptionsCustomize.ColumnSorting = False
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object VLISTRUN: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1074#1099#1087'.'
              DataBinding.FieldName = 'FD_RUN'
              Width = 119
            end
            object VLISTNAME: TcxGridDBColumn
              Caption = #1048#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
              DataBinding.FieldName = 'FC_NAME'
              VisibleForCustomization = False
              Width = 478
            end
          end
          object cxGrLevel1: TcxGridLevel
            GridView = TVLIST
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 709
          Height = 32
          Hint = #1057#1087#1080#1089#1086#1082' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081' '#1087#1072#1094#1080#1077#1085#1090#1072
          Align = alTop
          BevelOuter = bvNone
          ParentBackground = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          object dxBarDockControl1: TdxBarDockControl
            AlignWithMargins = True
            Left = 0
            Top = 4
            Width = 709
            Height = 28
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = dalBottom
            BarManager = BM
            SunkenBorder = True
            UseOwnSunkenBorder = True
          end
        end
      end
    end
    object tsTalon: TcxTabSheet
      Caption = #1058#1072#1083#1086#1085#1099
      ImageIndex = 1
      object grTalons: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 34
        Width = 709
        Height = 381
        Margins.Top = 0
        Align = alClient
        PopupMenu = pmListT
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object tvTalons: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsListT
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = tvTalons_DateO
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
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
          Preview.Column = tvTalons_Preview
          Preview.Visible = True
          object tvTalons_DateO: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1086#1090#1082#1088#1099#1090#1080#1103
            DataBinding.FieldName = 'FD_OPENED'
            Width = 146
          end
          object tvTalons_DateC: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103
            DataBinding.FieldName = 'FD_CLOSED'
            Width = 128
          end
          object tvTalons_VidOpl: TcxGridDBColumn
            Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099
            DataBinding.FieldName = 'VIDOPL'
            Width = 146
          end
          object tvTalons_Sotr: TcxGridDBColumn
            Caption = #1054#1090#1082#1088#1099#1074#1096#1080#1081' '#1089#1086#1090#1088#1091#1076#1085#1080#1082
            DataBinding.FieldName = 'SOTRFIO'
            Width = 145
          end
          object tvTalons_Sos: TcxGridDBColumn
            Caption = #1057#1090#1072#1090#1091#1089
            DataBinding.FieldName = 'SOSTALON'
            Width = 130
          end
          object tvTalons_Preview: TcxGridDBColumn
            Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
            DataBinding.FieldName = 'PREVIEW_CON'
          end
        end
        object grTalonsLevel1: TcxGridLevel
          GridView = tvTalons
        end
      end
      object dxBarDockControl3: TdxBarDockControl
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 709
        Height = 28
        Align = dalTop
        BarManager = BM
        SunkenBorder = True
        UseOwnSunkenBorder = True
      end
      object paBottom: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 429
        Width = 709
        Height = 185
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        Visible = False
        object dxBarDockControl4: TdxBarDockControl
          Left = 2
          Top = 2
          Width = 30
          Height = 181
          Align = dalLeft
          BarManager = BM
          SunkenBorder = True
          UseOwnSunkenBorder = True
        end
        object grNaz: TcxGrid
          Left = 32
          Top = 2
          Width = 675
          Height = 181
          Align = alClient
          PopupMenu = pmListN
          TabOrder = 1
          LookAndFeel.Kind = lfFlat
          object tvNaz: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsListN
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                Column = tvNaz_Date
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
            object tvNaz_Date: TcxGridDBColumn
              Caption = #1044#1072#1090#1072
              DataBinding.FieldName = 'FD_RUN'
              Width = 173
            end
            object tvNaz_Name: TcxGridDBColumn
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              DataBinding.FieldName = 'FC_NAME'
              Width = 171
            end
            object tvNaz_Sotr: TcxGridDBColumn
              Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
              DataBinding.FieldName = 'SOTR'
              Width = 162
            end
            object tvNaz_State: TcxGridDBColumn
              Caption = #1057#1090#1072#1090#1091#1089
              DataBinding.FieldName = 'SOS'
              Width = 155
            end
          end
          object grNazLevel1: TcxGridLevel
            GridView = tvNaz
          end
        end
      end
      object cxSplitter1: TcxSplitter
        Left = 0
        Top = 418
        Width = 715
        Height = 8
        Margins.Top = 0
        Margins.Bottom = 0
        HotZoneClassName = 'TcxMediaPlayer9Style'
        AlignSplitter = salBottom
        Control = paBottom
        Visible = False
      end
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 617
    Width = 709
    Height = 40
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    object cxButton1: TcxButton
      Left = 625
      Top = 7
      Width = 75
      Height = 25
      Action = aClose
      TabOrder = 0
    end
    object bTalons: TcxButton
      Left = 11
      Top = 7
      Width = 75
      Height = 25
      Action = aTalons
      TabOrder = 1
    end
  end
  object odsInfo: TOracleDataSet
    SQL.Strings = (
      'select asu.get_ib(:pfk_pacid) as ib,'
      
        '       asu.pkg_regist_pacfunc.get_pac_fullfio(:pfk_pacid) as pac' +
        'fio,'
      
        '       asu.pkg_regist_pacfunc.get_pac_age_now(:pfk_pacid) as pac' +
        'age,'
      '       (select to_char(fd_rojd, '#39'dd.mm.yyyy'#39') '
      
        '          from asu.tpeoples where fk_id = (select fk_peplid from' +
        ' asu.tkarta where fk_id = :pfk_pacid '
      '                                           union all '
      
        '                                           select fk_peplid from' +
        ' asu.tambulance where fk_id = :pfk_pacid)) as fd_rojd,'
      '       asu.pkg_regist_pacfunc.get_pac_sex(:pfk_pacid) as sex,'
      
        '       asu.pkg_regist_pacfunc.get_pac_workplace(:pfk_pacid) as w' +
        'orkplace,'
      '       asu.get_insurdoc_onpac(:pfk_pacid) as polis,'
      '       (select fc_phone from asu.tkarta where fk_id = :pfk_pacid'
      '        union all'
      
        '        select fc_phone from asu.tambulance where fk_id = :pfk_p' +
        'acid) as fc_phone,'
      
        '       (select fc_snils from asu.tpeoples where fk_id = asu.get_' +
        'peplid(:pfk_pacid)) as fc_snils,'
      '       asu.get_allergy(:pfk_peplid, 1) as fc_allergy,'
      '       asu.get_allergy(:pfk_peplid, 2) as fc_action'
      ''
      '  from dual'
      '')
    Optimize = False
    Variables.Data = {
      03000000020000000A0000003A50464B5F504143494403000000000000000000
      00000B0000003A50464B5F5045504C4944030000000000000000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsInfoBeforeOpen
    AfterOpen = odsInfoAfterOpen
    Left = 153
    Top = 304
  end
  object al: TActionList
    Images = frmMain.ilMain
    Left = 48
    Top = 352
    object aClose: TAction
      Caption = #1054#1050
      Hint = #1047#1072#1082#1088#1099#1090#1100
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aProsmotr: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088
      ImageIndex = 9
      ShortCut = 118
      OnExecute = aProsmotrExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 8
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aText: TAction
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1089#1087#1080#1089#1082#1072' '#1074' '#1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 4
      OnExecute = aTextExecute
    end
    object aWeb: TAction
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1089#1087#1080#1089#1082#1072' '#1074' Web-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 5
      OnExecute = aWebExecute
    end
    object aXML: TAction
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1089#1087#1080#1089#1082#1072' '#1074' XML-'#1089#1090#1088#1072#1085#1080#1094#1091
      ImageIndex = 6
      OnExecute = aXMLExecute
    end
    object aXLS: TAction
      Caption = 'Excel '#1092#1072#1081#1083
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1089#1087#1080#1089#1082#1072' '#1074' Excel '#1092#1072#1081#1083
      ImageIndex = 7
      OnExecute = aXLSExecute
    end
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 12
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aCloseA: TAction
      Category = 'Allergy'
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1083#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1086#1081' '#1085#1077#1087#1077#1088#1077#1085#1086#1089#1080#1084#1086#1089#1090#1080
      ImageIndex = 2
      OnExecute = aCloseAExecute
    end
    object aAddA: TAction
      Category = 'Allergy'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1083#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1091#1102' '#1085#1077#1087#1077#1088#1077#1085#1086#1089#1080#1084#1086#1089#1090#1100
      ImageIndex = 18
      OnExecute = aAddAExecute
    end
    object aEditA: TAction
      Category = 'Allergy'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1086' '#1083#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1086#1081' '#1085#1077#1087#1077#1088#1077#1085#1086#1089#1080#1084#1086#1089#1090#1080
      ImageIndex = 1
      OnExecute = aEditAExecute
    end
    object aDelA: TAction
      Category = 'Allergy'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1086' '#1083#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1086#1081' '#1085#1077#1087#1077#1088#1077#1085#1086#1089#1080#1084#1086#1089#1090#1080
      ImageIndex = 21
      OnExecute = aDelAExecute
    end
    object aRefA: TAction
      Category = 'Allergy'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 12
      OnExecute = aRefAExecute
    end
    object aTalons: TAction
      Caption = #1058#1072#1083#1086#1085#1099
      Hint = #1057#1087#1080#1089#1086#1082' '#1090#1072#1083#1086#1085#1086#1074
      OnExecute = aTalonsExecute
    end
    object aLoad: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1081
      OnExecute = aLoadExecute
    end
    object aTextT: TAction
      Category = 'Talons'
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 4
      OnExecute = aTextTExecute
    end
    object aTextN: TAction
      Category = 'Naz'
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 4
      OnExecute = aTextNExecute
    end
    object aWebT: TAction
      Category = 'Talons'
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 5
      OnExecute = aWebTExecute
    end
    object aXMLT: TAction
      Category = 'Talons'
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 6
      OnExecute = aXMLTExecute
    end
    object aXLST: TAction
      Category = 'Talons'
      Caption = 'Excel '#1092#1072#1081#1083
      ImageIndex = 7
      OnExecute = aXLSTExecute
    end
    object aWebN: TAction
      Category = 'Naz'
      Caption = 'Web-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 5
      OnExecute = aWebNExecute
    end
    object aXMLN: TAction
      Category = 'Naz'
      Caption = 'XML-'#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 6
      OnExecute = aXMLNExecute
    end
    object aXLSN: TAction
      Category = 'Naz'
      Caption = 'Excel '#1092#1072#1081#1083
      ImageIndex = 7
      OnExecute = aXLSNExecute
    end
  end
  object odsList: TOracleDataSet
    SQL.Strings = (
      '/*'
      'SELECT VNAZ.FK_ID,'
      '       VNAZ.FK_NAZSOSID, '
      '       VNAZ.FK_SMID,'
      '       VNAZ.FK_PACID, '
      
        '       TO_CHAR(VNAZ.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') FD_RUN, VNAZ.F' +
        'D_RUN AS DATE_RUN, '
      '       ASU.GET_FULLPATH_SHA(VNAZ.FK_SMID) AS FC_NAME'
      '  FROM ASU.VNAZ, ASU.TKARTA'
      '  WHERE VNAZ.FK_NAZSOSID = ASU.GET_VIPNAZ'
      '    AND VNAZ.FK_PACID = TKARTA.FK_ID'
      '    AND TKARTA.FK_PEPLID = :PFK_PACID'
      
        '    AND ASU.GET_OWNER_FROM_SMID(VNAZ.FK_SMID) = (SELECT FK_ID FR' +
        'OM ASU.TSMID WHERE FC_SYNONIM = '#39'KONS_SPEC'#39')'
      '    '
      'UNION ALL'
      ''
      'SELECT VNAZ.FK_ID, '
      '       VNAZ.FK_NAZSOSID,'
      '       VNAZ.FK_SMID,'
      '       VNAZ.FK_PACID,'
      
        '       TO_CHAR(VNAZ.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') FD_RUN, VNAZ.F' +
        'D_RUN AS DATE_RUN,'
      '       ASU.GET_FULLPATH_SHA(VNAZ.FK_SMID) AS FC_NAME'
      '  FROM ASU.VNAZ, ASU.TAMBULANCE'
      '  WHERE VNAZ.FK_NAZSOSID = ASU.GET_VIPNAZ'
      '    AND VNAZ.FK_PACID = TAMBULANCE.FK_ID'
      '    AND TAMBULANCE.FK_PEPLID = :PFK_PACID'
      
        '    AND ASU.GET_OWNER_FROM_SMID(VNAZ.FK_SMID) = (SELECT FK_ID FR' +
        'OM ASU.TSMID WHERE FC_SYNONIM = '#39'KONS_SPEC'#39')'
      'ORDER BY DATE_RUN DESC '
      '*/'
      ''
      'SELECT n.FK_ID,'
      '       n.FK_NAZSOSID, '
      '       n.FK_SMID,'
      '       n.FK_PACID, '
      
        '       TO_CHAR(n.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') FD_RUN, n.FD_RUN ' +
        'AS DATE_RUN, '
      '       ASU.GET_FULLPATH_SHA(n.FK_SMID) AS FC_NAME'
      
        '  FROM ASU.VNAZ n, ASU.TKARTA k, ASU.TPRAVA_PASPORT pp, ASU.TUSL' +
        'VID u'
      '  WHERE n.FK_NAZSOSID = ASU.GET_VIPNAZ'
      '    AND n.FK_PACID = k.FK_ID'
      '    AND u.fk_id = pp.fk_typedoc'
      '    AND pp.FK_OTD = :POTDELID'
      '    AND k.fk_uslvidid = u.FK_ID'
      '    AND k.FK_PEPLID = :PFK_PACID'
      
        '    AND ASU.GET_OWNER_FROM_SMID(n.FK_SMID) = (SELECT FK_ID FROM ' +
        'ASU.TSMID WHERE FC_SYNONIM = '#39'KONS_SPEC'#39')'
      'UNION ALL'
      'SELECT n.FK_ID, '
      '       n.FK_NAZSOSID,'
      '       n.FK_SMID,'
      '       n.FK_PACID,'
      
        '       TO_CHAR(n.FD_RUN, '#39'DD.MM.YYYY HH24:MI'#39') FD_RUN, n.FD_RUN ' +
        'AS DATE_RUN,'
      '       ASU.GET_FULLPATH_SHA(n.FK_SMID) AS FC_NAME'
      
        '  FROM ASU.VNAZ n, ASU.TAMBULANCE a, ASU.TPRAVA_PASPORT pp, ASU.' +
        'TUSLVID u, ASU.TDOCOBSL o'
      'WHERE a.FK_PEPLID = :PFK_PACID'
      '      AND u.fk_id = pp.fk_typedoc'
      '      AND pp.FK_OTD = :POTDELID'
      '      AND a.fk_docobsl = o.fk_id'
      '      AND o.fk_viddocid = u.FK_ID'
      '      AND n.FK_NAZSOSID = ASU.GET_VIPNAZ'
      '      AND n.FK_PACID = a.FK_ID'
      
        '      AND ASU.GET_OWNER_FROM_SMID(n.FK_SMID) = (SELECT FK_ID FRO' +
        'M ASU.TSMID WHERE FC_SYNONIM = '#39'KONS_SPEC'#39')'
      'ORDER BY DATE_RUN DESC  '
      '')
    Optimize = False
    Variables.Data = {
      03000000020000000A0000003A50464B5F504143494403000000000000000000
      0000090000003A504F5444454C4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000600000046445F52554E0100000000000700000046435F4E
      414D4501000000000005000000464B5F49440100000000000B000000464B5F4E
      415A534F53494401000000000007000000464B5F534D49440100000000000800
      0000464B5F504143494401000000000008000000444154455F52554E01000000
      0000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsListBeforeOpen
    AfterOpen = odsListAfterOpen
    Left = 152
    Top = 411
  end
  object dsList: TDataSource
    DataSet = odsList
    Left = 200
    Top = 411
  end
  object dsRegPrin: TDataSource
    DataSet = odsRegPrin
    Left = 200
    Top = 361
  end
  object odsRegPrin: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FC_SYNONIM, FK_OWNER, FN_ORDER, FL_DEL  '
      '  FROM asu.TSMID '
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM ' +
        '= '#39'PD_MZ'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0 '
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FC_SYNONIM, FK_OWNER, FN_ORDER, FL_DEL  '
      '  FROM asu.TSMID '
      ' WHERE FC_SYNONIM = '#39'LIVEIN_SELO'#39
      '   AND FL_SHOWPRINT = 1 '
      '   AND FL_DEL = 0'
      ''
      'ORDER BY FN_ORDER   ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F53594E4F4E494D01000000000008000000
      464B5F4F574E455201000000000008000000464E5F4F52444552010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 152
    Top = 361
  end
  object frxRepProsmotr: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39299.753055555600000000
    ReportOptions.LastChange = 40273.369983842590000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepProsmotrGetValue
    Left = 434
    Top = 323
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 294.803340000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        AllowSplit = True
        StartNewPage = True
        Stretched = True
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Top = 161.874150000000000000
          Width = 747.156340000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          HAlign = haBlock
          Memo.UTF8 = (
            '[TEXTISSL]')
          WordBreak = True
        end
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 755.906000000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Align = baWidth
          Top = 16.456710000000000000
          Width = 755.906000000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[OTDELNAME]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Align = baWidth
          Top = 32.236240000000000000
          Width = 755.906000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clMaroon
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#160#1056#1115#1056#1118#1056#1115#1056#1113#1056#1115#1056#8250' '#1056#1113#1056#1115#1056#1116#1056#1038#1056#1032#1056#8250#1056#172#1056#1118#1056#1106#1056#166#1056#152#1056#152)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 139.622140000000000000
          Top = 56.913420000000000000
          Width = 616.063390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          DataSetName = 'Customers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[FIOPAC]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 56.913420000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 79.370130000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1026#1056#1109#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 139.842610000000000000
          Top = 79.370130000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = 15790320
          DataSetName = 'Customers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DATE_ROJD]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 464.882190000000000000
          Top = 79.370130000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1114#1056#1113)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 570.709030000000000000
          Top = 79.370130000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = 15790320
          DataSetName = 'Customers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[NUMIB]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 3.779530000000000000
          Top = 113.385900000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[NAMEISSL]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 136.063080000000000000
          Width = 755.906000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clMaroon
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1118#1056#8226#1056#1113#1056#1038#1056#1118' '#1056#1119#1056#160#1056#1115#1056#1118#1056#1115#1056#1113#1056#1115#1056#8250#1056#1106)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 11.338590000000000000
          Top = 207.874150000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 11.338590000000000000
          Top = 230.551330000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1057#1026#1056#176#1057#8225)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 147.401670000000000000
          Top = 207.874150000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = 15790320
          DataSetName = 'Customers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DATEISSL]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 147.401670000000000000
          Top = 230.551330000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Color = 15790320
          DataSetName = 'Customers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[SOTR]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.456710000000000000
        Top = 374.173470000000000000
        Width = 755.906000000000000000
        object Memo5: TfrxMemoView
          Left = 377.953000000000000000
          Top = 7.559060000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Top = 7.559060000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADESIGN]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object pmTV: TPopupMenu
    Images = frmMain.ilMain
    Left = 48
    Top = 402
    object N1: TMenuItem
      Action = aPrint
    end
    object MenuItem3: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 3
      object MenuItem4: TMenuItem
        Action = aText
      end
      object MenuItem5: TMenuItem
        Action = aWeb
      end
      object MenuItem6: TMenuItem
        Action = aXML
      end
      object MenuItem7: TMenuItem
        Action = aXLS
      end
    end
    object N2: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 13
      OnClick = N2Click
    end
  end
  object sdPopUp: TSaveDialog
    Left = 49
    Top = 451
  end
  object frxRepList: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39325.633441655100000000
    ReportOptions.LastChange = 40271.594141504630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepListGetValue
    Left = 432
    Top = 373
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 124.858262830000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo4: TfrxMemoView
          Align = baWidth
          Width = 755.906000000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[COMPANYNAME]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 16.456710000000000000
          Width = 755.906000000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[OTDELNAME]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Align = baWidth
          Top = 32.015770000000000000
          Width = 755.906000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clMaroon
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1038#1056#1119#1056#152#1056#1038#1056#1115#1056#1113' '#1056#1113#1056#1115#1056#1116#1056#1038#1056#1032#1056#8250#1056#172#1056#1118#1056#1106#1056#166#1056#152#1056#8482' '#1056#1119#1056#1106#1056#166#1056#152#1056#8226#1056#1116#1056#1118#1056#1106)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 139.622140000000000000
          Top = 56.692950000000000000
          Width = 616.063390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15790320
          DataSetName = 'Customers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[FIOPAC]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 56.692950000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#8224#1056#1105#1056#181#1056#1029#1057#8218)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 582.047620000000000000
          Top = 79.149660000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SYSDATE]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 170.078850000000000000
          Top = 105.826840000000000000
          Width = 585.827150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clGray
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1029#1057#1027#1057#1107#1056#187#1057#1034#1057#8218#1056#176#1057#8224#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 3.779530000000000000
          Top = 105.826840000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clGray
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 52.913420000000000000
          Top = 105.960612830000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clGray
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1030#1057#8249#1056#1111'.')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 204.094620000000000000
        Width = 755.906000000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        KeepTogether = True
        RowCount = 0
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 170.078850000000000000
          Width = 585.827150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clGray
          Memo.UTF8 = (
            '[frxDBDataSet1."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clGray
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 52.913420000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clGray
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataSet1."FD_RUN"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.456710000000000000
        Top = 283.464750000000000000
        Width = 755.906000000000000000
        object Memo6: TfrxMemoView
          Left = 377.953000000000000000
          Top = 7.559060000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026'. [Page] '#1056#1105#1056#183' [TotalPages#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Top = 7.559060000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -2147483640
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADESIGN]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = odsList
    BCDToCurrency = False
    Left = 488
    Top = 373
  end
  object BM: TdxBarManager
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
    ImageOptions.Images = frmMain.ilMain
    LookAndFeel.Kind = lfFlat
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 48
    Top = 301
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarManager1Bar1: TdxBar
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
      FloatLeft = 245
      FloatTop = 15
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
          ItemName = 'bbRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbShow'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbPrint'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BMBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Allergy'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 294
      FloatTop = 15
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cxBarEditItem2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbAdd'
        end
        item
          Visible = True
          ItemName = 'bbEdit'
        end
        item
          Visible = True
          ItemName = 'bbDel'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRef'
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
      Caption = 'Talons'
      CaptionButtons = <>
      DockControl = dxBarDockControl3
      DockedDockControl = dxBarDockControl3
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 259
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cxBarEditItem3'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbLoad'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BMBar3: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Naz'
      CaptionButtons = <>
      DockControl = dxBarDockControl4
      DockedDockControl = dxBarDockControl4
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 259
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cxBarEditItem4'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbShow: TdxBarButton
      Action = aProsmotr
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbPrint: TdxBarButton
      Action = aPrint
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefresh: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object cxBarEditItem1: TcxBarEditItem
      Caption = #1057#1087#1080#1089#1086#1082' '#1082#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1081
      Category = 0
      Hint = #1057#1087#1080#1089#1086#1082' '#1082#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1081
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
    end
    object cxBarEditItem2: TcxBarEditItem
      Caption = #1051#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1072#1103' '#1085#1077#1087#1077#1088#1077#1085#1086#1089#1080#1084#1086#1089#1090#1100
      Category = 0
      Hint = #1051#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1072#1103' '#1085#1077#1087#1077#1088#1077#1085#1086#1089#1080#1084#1086#1089#1090#1100
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
    end
    object bbAdd: TdxBarButton
      Action = aAddA
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEdit: TdxBarButton
      Action = aEditA
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDel: TdxBarButton
      Action = aDelA
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRef: TdxBarButton
      Action = aRefA
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbClose: TdxBarButton
      Action = aCloseA
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object cxBarEditItem3: TcxBarEditItem
      Caption = #1058#1072#1083#1086#1085#1099
      Category = 0
      Hint = #1058#1072#1083#1086#1085#1099
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
    end
    object cxBarEditItem4: TcxBarEditItem
      Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1103
      Category = 0
      Hint = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1103
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
    end
    object bbLoad: TdxBarButton
      Action = aLoad
      Category = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2
        BD8FF2C094FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF9CDA9C47E3CCC8139F8CEADFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9C1E08835FF
        D09BD3A779C87325FADCC5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFCE5D4D87C2BFEC991F7BA7DF7B776C99864C86E21FAE6D7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEDE3D4792AFAC289F4B577F0
        AF6CF0AB67EEA962C58C50C76F25FCEEE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FDF6F0D48239FDC58AF8C48DF0B579EBA660EAA35AE99F55EBA052C28440C775
        34FDF5F2FFFFFFFFFFFFFFFFFFFEFAF8D28441CA7020CB7831DD9656F2C18DE8
        9D53E69A4EDD9348BA6B24B45B12B4570ECB7F45FDFBFAFFFFFFFFFFFFFEFDFD
        FEF8F4FDF7F4FFFFFFCE782FF1BB84E49647E49445DC8F3EAA5511FFFFFFFCF7
        F4FCF8F4FEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC762EEFB77AE0
        8E3CE08E39D98834AA5410FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC9712AECAF70DD8630DB852ED68229A9500AFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC46C24E7A760D9
        7E21D87D21D37A1CA74D07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC46B20F0BC7EE49A4BE08B33D57B17A74A03FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD4909B14E0CAE
        4908AB4B0CAF4D0CA6430AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      PaintStyle = psCaptionGlyph
    end
  end
  object stRep: TcxStyleRepository
    Left = 411
    Top = 458
    PixelsPerInch = 96
    object stYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object stNone: TcxStyle
    end
  end
  object odsListA: TOracleDataSet
    SQL.Strings = (
      'select fk_id,'
      '       fk_smid, asu.get_smidname(fk_smid) as smname,'
      '       fc_char,'
      '       fc_charid,'
      '       fd_date,'
      '       asu.do_vrachfio(fk_sotrid) as sotrfio,'
      '       fk_peplid   '
      '  from asu.tallergy'
      ' where fk_peplid = :pfk_peplid'
      'order by fd_date')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F5045504C4944030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000005000000464B5F494401000000000007000000464B5F534D
      494401000000000006000000534D4E414D450100000000000700000046435F43
      4841520100000000000900000046435F43484152494401000000000007000000
      46445F4441544501000000000007000000534F545246494F0100000000000900
      0000464B5F5045504C4944010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    AfterOpen = odsListAAfterOpen
    Left = 209
    Top = 97
  end
  object dsListA: TDataSource
    DataSet = odsListA
    Left = 265
    Top = 97
  end
  object pmtvA: TPopupMenu
    Left = 299
    Top = 366
    object N3: TMenuItem
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
      OnClick = N3Click
    end
  end
  object odsDoc: TOracleDataSet
    SQL.Strings = (
      'select fc_docser,'
      '       fc_docnum,'
      '       fc_docvidan,'
      
        '       (select fc_name from asu.tviddoc where fk_id = tpeoples.f' +
        'k_docvid) as docname'
      '  from asu.tpeoples'
      ' where fk_id = :pfk_id')
    Optimize = False
    Variables.Data = {0300000001000000070000003A50464B5F4944030000000000000000000000}
    Session = frmMain.os
    BeforeOpen = odsDocBeforeOpen
    AfterOpen = odsDocAfterOpen
    Left = 203
    Top = 305
  end
  object dsListT: TDataSource
    DataSet = odsListT
    Left = 424
    Top = 112
  end
  object odsListT: TOracleDataSet
    SQL.Strings = (
      'select fk_id,'
      '       fd_opened,'
      '       fd_closed,'
      '       (select fc_name '
      '          from asu.ttypedoc t1, asu.tinsurdocs t2'
      '         where t1.fk_id = t2.fk_typedocid'
      '           and t2.fk_id = tambtalon.fk_insuranceid) as vidopl,'
      '       asu.do_vrachfio(fk_sotrid) as sotrfio,'
      
        '       decode(fn_sos, 0, '#39#1054#1090#1082#1088#1099#1090#39', 1, '#39#1047#1072#1082#1088#1099#1090#39', 2, '#39#1053#1077#1103#1074#1082#1072#39') as ' +
        'sostalon,'
      '       decode(asu.get_smidname(fk_result),'
      '              '#39#39', '#39#1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1073#1088#1072#1097#1077#1085#1080#1103': '#1085#1077' '#1091#1082#1072#1079#1072#1085#39','
      
        '              '#39#1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1073#1088#1072#1097#1077#1085#1080#1103': '#39'||asu.get_smidname(fk_resul' +
        't))||'#39'; '#39'||'
      
        '       decode((select fc_write from asu.tdiag where fk_id = tamb' +
        'talon.fk_diagmainpred),'
      '              '#39#39', '#39#1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1076#1080#1072#1075#1085#1086#1079': '#1085#1077' '#1087#1086#1089#1090#1072#1074#1083#1077#1085#39','
      
        '              '#39#1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1076#1080#1072#1075#1085#1086#1079': '#39'||(select fc_write from' +
        ' asu.tdiag where fk_id = tambtalon.fk_diagmainpred))||'#39'; '#39'||'
      
        '       decode((select fc_write from asu.tdiag where fk_id = tamb' +
        'talon.fk_diagmain),'
      '              '#39#39', '#39#1054#1089#1085#1086#1074#1085#1086#1081' '#1076#1080#1072#1075#1085#1086#1079': '#1085#1077' '#1087#1086#1089#1090#1072#1074#1083#1077#1085#39','
      
        '              '#39#1054#1089#1085#1086#1074#1085#1086#1081' '#1076#1080#1072#1075#1085#1086#1079': '#39'||(select fc_write from asu.td' +
        'iag where fk_id = tambtalon.fk_diagmain)) as preview_con '
      '  from asu.tambtalon'
      ' where fk_ambid = :pfk_ambid'
      'order by fd_opened')
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464B5F414D42494403000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      04000000070000000900000046445F4F50454E45440100000000000900000046
      445F434C4F534544010000000000060000005649444F504C0100000000000700
      0000534F545246494F01000000000008000000534F5354414C4F4E0100000000
      0005000000464B5F49440100000000000B000000505245564945575F434F4E01
      0000000000}
    Session = frmMain.os
    BeforeOpen = odsListTBeforeOpen
    AfterScroll = odsListTAfterScroll
    Left = 424
    Top = 160
  end
  object dsListN: TDataSource
    DataSet = odsListN
    Left = 352
    Top = 488
  end
  object odsListN: TOracleDataSet
    SQL.Strings = (
      'select t2.fd_run,'
      '       t2.fc_name,'
      '       asu.do_vrachfio(t2.fk_ispolid) as sotr,'
      '       t3.fc_name as sos'
      '  from asu.tambtalon_naz t1, asu.vnaz t2, asu.tnazsos t3'
      ' where t1.fk_talonid = :pfk_talonid'
      '   and t1.fk_nazid = t2.fk_id'
      '   and t2.fk_nazsosid = t3.fk_id'
      'order by fd_run')
    Optimize = False
    Variables.Data = {
      03000000010000000C0000003A50464B5F54414C4F4E49440300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000600000046445F52554E0100000000000700000046435F4E
      414D4501000000000004000000534F545201000000000003000000534F530100
      00000000}
    Session = frmMain.os
    BeforeOpen = odsListNBeforeOpen
    Left = 352
    Top = 536
  end
  object pmListT: TPopupMenu
    Images = frmMain.ilMain
    Left = 560
    Top = 104
    object N4: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 3
      object aTextT1: TMenuItem
        Action = aTextT
      end
      object aWebT1: TMenuItem
        Action = aWebT
      end
      object aXMLT1: TMenuItem
        Action = aXMLT
      end
      object aXLST1: TMenuItem
        Action = aXLST
      end
    end
    object N5: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 13
      OnClick = N5Click
    end
  end
  object pmListN: TPopupMenu
    Images = frmMain.ilMain
    Left = 560
    Top = 160
    object N6: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 3
      object aTextN1: TMenuItem
        Action = aTextN
      end
      object aWebN1: TMenuItem
        Action = aWebN
      end
      object aXMLN1: TMenuItem
        Action = aXMLN
      end
      object aWebN2: TMenuItem
        Action = aXLSN
      end
    end
    object N7: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 13
      OnClick = N7Click
    end
  end
end
