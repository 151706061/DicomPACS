object frmMain: TfrmMain
  Left = 275
  Top = 33
  BorderStyle = bsDialog
  Caption = #1044#1072#1085#1085#1099#1077' '#1072#1084#1073#1091#1083#1072#1090#1086#1088#1085#1086#1075#1086' '#1090#1072#1083#1086#1085#1072
  ClientHeight = 621
  ClientWidth = 864
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
  object pcMain: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 858
    Height = 573
    ActivePage = cxTabSheet1
    Align = alTop
    TabOrder = 0
    ClientRectBottom = 573
    ClientRectRight = 858
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = #1058#1072#1083#1086#1085
      ImageIndex = 0
      object verGr: TcxVerticalGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 852
        Height = 546
        Hint = #1051#1080#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1087#1072#1094#1080#1077#1085#1090#1072
        Margins.Bottom = 0
        Align = alClient
        LookAndFeel.Kind = lfUltraFlat
        OptionsView.RowHeaderWidth = 213
        OptionsBehavior.BandSizing = False
        OptionsBehavior.HeaderSizing = False
        TabOrder = 0
        object rowPacient: TcxCategoryRow
          Options.CanResized = False
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
              EditPropertiesClassName = 'TcxLabelProperties'
              EditProperties.Alignment.Horz = taCenter
              Width = 75
              DataBinding.ValueType = 'String'
              Options.Filtering = False
              Options.IncSearch = False
              Options.ShowEditButtons = eisbNever
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
          Options.CanResized = False
          Properties.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.EditProperties.ViewStyle = vsHideCursor
          Properties.EditProperties.OnButtonClick = rowDocEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowAddress: TcxEditorRow
          Options.CanResized = False
          Options.Focusing = False
          Options.TabStop = False
          Properties.Caption = #1040#1076#1088#1077#1089' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          Properties.EditPropertiesClassName = 'TcxLabelProperties'
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.Editing = False
          Properties.Options.Filtering = False
          Properties.Options.IncSearch = False
          Properties.Value = Null
        end
        object rowAdrPreb: TcxEditorRow
          Options.CanResized = False
          Options.Focusing = False
          Options.Moving = False
          Options.TabStop = False
          Properties.Caption = #1040#1076#1088#1077#1089' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1075#1086' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103
          Properties.EditPropertiesClassName = 'TcxLabelProperties'
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.Editing = False
          Properties.Options.Filtering = False
          Properties.Options.IncSearch = False
          Properties.Value = Null
        end
        object rowWork: TcxEditorRow
          Options.Focusing = False
          Options.TabStop = False
          Properties.Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
          Properties.EditPropertiesClassName = 'TcxLabelProperties'
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.Editing = False
          Properties.Options.Filtering = False
          Properties.Options.IncSearch = False
          Properties.Value = Null
        end
        object rowNat: TcxEditorRow
          Options.CanResized = False
          Properties.Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086'*'
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.EditProperties.ViewStyle = vsHideCursor
          Properties.EditProperties.OnButtonClick = rowNatEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowSocStatus: TcxEditorRow
          Options.CanResized = False
          Properties.Caption = #1057#1086#1094#1080#1072#1083#1100#1085#1099#1081' '#1089#1090#1072#1090#1091#1089'*'
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.EditProperties.ViewStyle = vsHideCursor
          Properties.EditProperties.OnButtonClick = rowSocStatusEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object catTalon: TcxCategoryRow
          Options.CanResized = False
          Options.Focusing = False
          Options.Moving = False
          Options.TabStop = False
          Properties.Caption = #1040#1084#1073#1091#1083#1072#1090#1086#1088#1085#1099#1081' '#1090#1072#1083#1086#1085
        end
        object rowSos: TcxEditorRow
          Options.CanResized = False
          Options.Focusing = False
          Options.Moving = False
          Options.TabStop = False
          Properties.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
          Properties.EditPropertiesClassName = 'TcxLabelProperties'
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
          Styles.Content = stDefault
        end
        object rowDateBeg: TcxEditorRow
          Options.CanResized = False
          Properties.Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1089#1083#1091#1095#1072#1103
          Properties.EditPropertiesClassName = 'TcxDateEditProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.ShowTime = False
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowDateEnd: TcxEditorRow
          Options.CanResized = False
          Options.Focusing = False
          Options.Moving = False
          Options.TabStop = False
          Properties.Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1089#1083#1091#1095#1072#1103
          Properties.EditPropertiesClassName = 'TcxLabelProperties'
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowSotr: TcxEditorRow
          Options.CanResized = False
          Properties.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082', '#1086#1090#1082#1088#1099#1074#1096#1080#1081' '#1090#1072#1083#1086#1085
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.EditProperties.ViewStyle = vsHideCursor
          Properties.EditProperties.OnButtonClick = rowSotrEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowPolis: TcxEditorRow
          Options.CanResized = False
          Properties.Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099'*'
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.EditProperties.OnButtonClick = rowPolisEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.Filtering = False
          Properties.Options.IncSearch = False
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowVidPos: TcxEditorRow
          Properties.Caption = #1042#1080#1076' '#1087#1086#1089#1077#1097#1077#1085#1080#1103
          Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.EditProperties.DropDownListStyle = lsFixedList
          Properties.EditProperties.DropDownSizeable = True
          Properties.EditProperties.GridMode = True
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.KeyFieldNames = 'fk_id'
          Properties.EditProperties.ListColumns = <
            item
              FieldName = 'fc_name'
            end>
          Properties.EditProperties.ListOptions.ShowHeader = False
          Properties.EditProperties.ListSource = dsVidPos
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowPlace: TcxEditorRow
          Options.CanResized = False
          Properties.Caption = #1052#1077#1089#1090#1086' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103'*'
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.EditProperties.ViewStyle = vsHideCursor
          Properties.EditProperties.OnButtonClick = rowPlaceEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowNapr: TcxEditorRow
          Options.CanResized = False
          Properties.Caption = #1053#1072#1087#1088#1072#1074#1080#1074#1096#1077#1077' '#1091#1095#1088#1077#1078#1076#1077#1085#1080#1077'*'
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.EditProperties.ViewStyle = vsHideCursor
          Properties.EditProperties.OnButtonClick = rowNaprEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowReason: TcxEditorRow
          Options.CanResized = False
          Properties.Caption = #1062#1077#1083#1100' '#1087#1086#1089#1077#1097#1077#1085#1080#1103'*'
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.EditProperties.ViewStyle = vsHideCursor
          Properties.EditProperties.OnButtonClick = rowReasonEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowTravma: TcxEditorRow
          Options.CanResized = False
          Properties.Caption = #1058#1088#1072#1074#1084#1072
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.EditProperties.ViewStyle = vsHideCursor
          Properties.EditProperties.OnButtonClick = rowTravmaEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowResult: TcxEditorRow
          Options.CanResized = False
          Options.Focusing = False
          Options.Moving = False
          Options.TabStop = False
          Properties.Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1073#1088#1072#1097#1077#1085#1080#1103
          Properties.EditPropertiesClassName = 'TcxLabelProperties'
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.Editing = False
          Properties.Value = Null
        end
        object rowDop: TcxEditorRow
          Options.CanResized = False
          Options.Focusing = False
          Options.Moving = False
          Options.TabStop = False
          Properties.Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1080#1089#1093#1086#1076
          Properties.EditPropertiesClassName = 'TcxLabelProperties'
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.Editing = False
          Properties.Value = Null
        end
        object rowStandart: TcxEditorRow
          Properties.Caption = #1057#1090#1072#1085#1076#1072#1088#1090' '#1084#1077#1076#1087#1086#1084#1086#1097#1080'*'
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.EditProperties.ViewStyle = vsHideCursor
          Properties.EditProperties.OnButtonClick = rowStandartEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowTypeMedHelp: TcxEditorRow
          Properties.Caption = #1058#1080#1087' '#1074#1080#1076#1072' '#1084#1077#1076#1080#1094#1080#1085#1089#1082#1086#1081' '#1087#1086#1084#1086#1097#1080'*'
          Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.EditProperties.DropDownListStyle = lsFixedList
          Properties.EditProperties.DropDownSizeable = True
          Properties.EditProperties.GridMode = True
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.KeyFieldNames = 'fk_id'
          Properties.EditProperties.ListColumns = <
            item
              FieldName = 'fc_name'
            end>
          Properties.EditProperties.ListOptions.ShowHeader = False
          Properties.EditProperties.ListSource = dsTypeMedHelp
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowRezim: TcxEditorRow
          Properties.Caption = #1056#1077#1078#1080#1084'*'
          Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.EditProperties.DropDownListStyle = lsFixedList
          Properties.EditProperties.DropDownSizeable = True
          Properties.EditProperties.GridMode = True
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.KeyFieldNames = 'fk_id'
          Properties.EditProperties.ListColumns = <
            item
              FieldName = 'fc_name'
            end>
          Properties.EditProperties.ListOptions.ShowHeader = False
          Properties.EditProperties.ListSource = dsRezim
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowTypeTalon: TcxEditorRow
          Properties.Caption = #1058#1080#1087' '#1090#1072#1083#1086#1085#1072'*'
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
          Properties.EditProperties.ListSource = dsTypeTalon
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowTypeTalonEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object merDateNum: TcxMultiEditorRow
          Properties.Editors = <
            item
              Caption = #1044#1072#1090#1072'*'
              EditPropertiesClassName = 'TcxDateEditProperties'
              EditProperties.DateButtons = [btnToday]
              EditProperties.ImmediatePost = True
              EditProperties.PostPopupValueOnTab = True
              EditProperties.SaveTime = False
              EditProperties.ShowTime = False
              DataBinding.ValueType = 'String'
              Options.ShowEditButtons = eisbAlways
              Value = Null
            end
            item
              Caption = #1053#1086#1084#1077#1088'*'
              EditPropertiesClassName = 'TcxTextEditProperties'
              DataBinding.ValueType = 'String'
              Value = Null
            end>
        end
        object rowUch: TcxEditorRow
          Properties.Caption = #1059#1095#1072#1089#1090#1086#1082'*'
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000206B0030AAE0000A600000000000000
                00000000000000000000A700009A0000A70000000000000000000000000000A9
                1844F6194DF81031D20102AB0000000000000000000000B10928D7092ED70313
                B30000AC0000000000000000000103B32451F91F52FF1D4FFF1744E8040BB000
                00000000AC0D2EDD1142F90D3DF50B3BF0041ABC0000A50000000000000000AE
                1832DB285BFF2456FF2253FF1B4BF1050DB10F30DD164AFE1344F91041F60E3E
                F60A3CF000009F0000000000000000BE1F37DD3A6FFF2C5EFF295AFF2657FF20
                52FC1C4FFF194AFD1646FA1445FA0F3DF2020AB10000A8000000000000000000
                0000C8121DC83D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED0002
                AC0000BA0000000000000000000000000000000000CC0000B62E4EE73668FF2E
                5EFF2859FF2254FF163DEA0000A80000AB000000000000000000000000000000
                0000000000000000BF253FDF3B6DFF3464FF2E5EFF2759FF1B46EA0001AC0000
                A90000000000000000000000000000000000000000000203C84B7CFF4170FF3B
                6BFF396CFF2D5EFF2558FF1336D70000B6000000000000000000000000000000
                0000000000D9263CDB5080FF4575FF3662FA0D14C33C6DFF2A5BFF2053FD0B1D
                C40000C00000000000000000000000000000000000CB527CFA5081FF4B7DFF0B
                13C90000BB0E15C7386AFF2456FF1A4AF20207B30000B5000000000000000000
                000000131CDD6A9CFF5788FF2B46E70000CD0000000000CD0F1BCB3065FF1F51
                FF1439DD0000B10000000000000000000000000000DE3A52E45782FB0101D000
                00000000000000000000CC1426D6265AFF0F2EE30103B8000000000000000000
                0000000000000000CF0000C00000CE0000000000000000000000000000C40001
                B80000B500000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Kind = bkGlyph
            end>
          Properties.EditProperties.ViewStyle = vsHideCursor
          Properties.EditProperties.OnButtonClick = rowUchEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object catUsl: TcxCategoryRow
          Options.CanResized = False
          Options.Focusing = False
          Options.Moving = False
          Options.TabStop = False
          Properties.Caption = #1059#1089#1083#1091#1075#1072
        end
        object rowNameUsl: TcxEditorRow
          Options.CanResized = False
          Options.Focusing = False
          Options.Moving = False
          Options.TabStop = False
          Properties.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
          Properties.EditPropertiesClassName = 'TcxLabelProperties'
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowDateUsl: TcxEditorRow
          Options.CanResized = False
          Options.Focusing = False
          Options.Moving = False
          Options.TabStop = False
          Properties.Caption = #1044#1072#1090#1072' '#1074#1099#1087'. '#1091#1089#1083#1091#1075#1080
          Properties.EditPropertiesClassName = 'TcxLabelProperties'
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
      end
      object bSetDate: TcxButton
        Left = 195
        Top = 200
        Width = 20
        Height = 17
        Action = aSetDate
        TabOrder = 1
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000F00A0000F00A00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000D85D00BA5400C7500000
          0000000000000000000000000000000000000000000000000000000000000000
          000000DB6A00CF7318FBC87ECF7523CB4D000000000000000000000000000000
          00000000000000000000000000000000000000C75C00EDB36CF5B86CF9B85ACD
          6E19C34400000000000000000000000000000000000000000000000000000000
          000000CD6600C65A00E69D4BEFA648F6A737CD6B0FB93E000000000000000000
          00000000000000000000000000000000000000000000DF6400BD5500DF8D30ED
          9728F59716CD6602B03700000000000000000000000000000000000000000000
          000000000000000000DE4E00B54D00D97C17E98609F18B00CF6700AE31000000
          00000000000000000000000000000000000000000000000000000000AB4200A8
          4200CF6A02E68000F28C00D66E00A63500000000000000000000000000000000
          000000000000000000000000AD4200A94200CA6501E07900EB8500D36A00A634
          00000000000000000000000000000000000000000000000000C96700B74C00CB
          6F15D87407DD7700C45B00AD3400000000000000000000000000000000000000
          000000000000E65B00C05400CC782ED27A26D67714BD5501B23A000000000000
          00000000000000000000000000000000000000DC6500C55E00CE854BCF8544D2
          8135BA580DC04200000000000000000000000000000000000000000000000000
          000000C76000D0966DD0946AD08E57BC5C15C64A000000000000000000000000
          00000000000000000000000000000000000000DB6800CA6A14D39C79C0631CCF
          5100000000000000000000000000000000000000000000000000000000000000
          000000000000D05700BB5400C953000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        LookAndFeel.Kind = lfUltraFlat
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = #1044#1080#1072#1075#1085#1086#1079#1099
      ImageIndex = 1
      object verGrDS: TcxVerticalGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 852
        Height = 546
        Margins.Bottom = 0
        Align = alClient
        LookAndFeel.Kind = lfUltraFlat
        OptionsView.RowHeaderWidth = 219
        TabOrder = 0
        object catDiags: TcxCategoryRow
          Properties.Caption = #1055#1077#1088#1077#1095#1077#1085#1100' '#1076#1080#1072#1075#1085#1086#1079#1086#1074
        end
        object rowDSNapr: TcxEditorRow
          Properties.Caption = #1053#1072#1087#1088#1072#1074#1080#1090#1077#1083#1100#1085#1099#1081' DS'
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FF3E494E3E494EFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3E494E35474A
                35474A9EE4FF98E1FF87D8FF638EA8FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF35474AB5EEFFB4EDFFB5EDFFB2ECFF73C8FE54
                6A7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB7ECFF
                C3F1FFC3F1FFC3F1FFC0F0FF92DBFE6FC6FE5F7383FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB4E9FFD1F6FFD1F6FFD0F5FFBAECFF71CBF58E
                DBFC73C8FE555B62FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0DFFF
                DBF8FFDAF8FFC5EFFF5EB7FD5EBCF86EC8F58CDAFB79CCFF35474AFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFB0E6FE89D1FB3CA3FA3DA2FE4DACFE5D
                BBF96DC8F58BD9FA7DCEFF35474AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF1898E9249AF2309CF93CA0FE4BABFE5CB9F96BC6F588D8F981D1FF7C61
                56FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1798E9239AF22F9CF93A
                A0FE4AAAFE5BB8FA6AC6F585D7F982D0FCC59782FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF1797E62299F02E9BF83A9FFE49A9FE59B7FA68C4F682D5
                F83E494E8A7D78FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C95DE20
                99F02D9BF8399FFD47A8FE58B5FB6AB2D8393939444443FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF2D95D31F99EF2C9BF7389FFD62B4FEBBBB
                BF4F4F50464551827DC6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FF3D8AB82099ED6D97BAB3B3B68F8F91C1C1C57D6FDA938ACEFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB2B8BCBCBCBC7F7F7FCAC9
                CDA48FDB846BC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FF9C999F7B63A69478BD8667B4846EB2FF00FF}
              Kind = bkGlyph
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000F00A0000F00A00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000808080A0A0A00000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000121212
                2323231B1B1B0202020000000000000000000000000000000000000000000000
                000000000000000000000000000000001616162626262E2E2E0F0F0F00000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000002222222B2B2B3C3C3C2323230808080000000000000000000000000000
                000000000000000000000000000000000000000000001F1F1F33333346464632
                32321414150101045F5F5C67676137373A000000000000000000000000000000
                0000000000000000000000003838384D4D4E404041ACAC9DF8F8D9FFFFEED6D6
                BE5858580000000000000000000000000000000000005040414B4E4E00000035
                353681817DC9C9B3D3D3BBE0E0C5E8E8CC9A9A8B4C4C4C0000000000007E6565
                7A6C6A584B4E9187857267650000000000009F9F98CFCFC4CFCFC0CBCBB8C9CA
                B49C9C9157585A0000000000009D8888F3EAE0B19E8CFFFFE8776867565B5C00
                0000909190D7D7D1E6E7E2DDDFD88D827D7C726F4238390000000000007E595B
                DED4D1FFFFF7FFEDC5F9E2C1A39791614D4E828788706D6EAAACAAACABA8AB8E
                8CFFFFE8786767000000000000A88281FFEEC4FFFFF5FFFFFFCAAF9A83747175
                5F5F684B4EB19E916E6261666D6EAB7C7DB48B8B8B696A000000000000D9B0AE
                D1A89FB9968EFFFFF5936F73000000A58684E9E0DEFFFFE2EDD6B48577756258
                59000000000000000000000000000000000000C19496CFA6A0C29293000000A6
                6667D0B4A2FFFFFFE1D2C37A6968000000000000000000000000000000000000
                000000000000000000000000000000C7999BC6A098967071B69B9A9D7C7D0000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              Hint = #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1076#1080#1072#1075#1085#1086#1079#1099' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
              Kind = bkGlyph
            end>
          Properties.EditProperties.ViewStyle = vsHideCursor
          Properties.EditProperties.OnButtonClick = rowDSNaprEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowDSPred: TcxEditorRow
          Properties.Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' DS'
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FF3E494E3E494EFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3E494E35474A
                35474A9EE4FF98E1FF87D8FF638EA8FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF35474AB5EEFFB4EDFFB5EDFFB2ECFF73C8FE54
                6A7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB7ECFF
                C3F1FFC3F1FFC3F1FFC0F0FF92DBFE6FC6FE5F7383FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB4E9FFD1F6FFD1F6FFD0F5FFBAECFF71CBF58E
                DBFC73C8FE555B62FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0DFFF
                DBF8FFDAF8FFC5EFFF5EB7FD5EBCF86EC8F58CDAFB79CCFF35474AFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFB0E6FE89D1FB3CA3FA3DA2FE4DACFE5D
                BBF96DC8F58BD9FA7DCEFF35474AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF1898E9249AF2309CF93CA0FE4BABFE5CB9F96BC6F588D8F981D1FF7C61
                56FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1798E9239AF22F9CF93A
                A0FE4AAAFE5BB8FA6AC6F585D7F982D0FCC59782FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF1797E62299F02E9BF83A9FFE49A9FE59B7FA68C4F682D5
                F83E494E8A7D78FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C95DE20
                99F02D9BF8399FFD47A8FE58B5FB6AB2D8393939444443FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF2D95D31F99EF2C9BF7389FFD62B4FEBBBB
                BF4F4F50464551827DC6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FF3D8AB82099ED6D97BAB3B3B68F8F91C1C1C57D6FDA938ACEFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB2B8BCBCBCBC7F7F7FCAC9
                CDA48FDB846BC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FF9C999F7B63A69478BD8667B4846EB2FF00FF}
              Kind = bkGlyph
            end>
          Properties.EditProperties.ViewStyle = vsHideCursor
          Properties.EditProperties.OnButtonClick = rowDSPredEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowDSZakl: TcxEditorRow
          Properties.Caption = #1047#1072#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1099#1081' '#1086#1089#1085#1086#1074#1085#1086#1081' DS*'
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FF3E494E3E494EFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3E494E35474A
                35474A9EE4FF98E1FF87D8FF638EA8FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF35474AB5EEFFB4EDFFB5EDFFB2ECFF73C8FE54
                6A7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB7ECFF
                C3F1FFC3F1FFC3F1FFC0F0FF92DBFE6FC6FE5F7383FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB4E9FFD1F6FFD1F6FFD0F5FFBAECFF71CBF58E
                DBFC73C8FE555B62FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0DFFF
                DBF8FFDAF8FFC5EFFF5EB7FD5EBCF86EC8F58CDAFB79CCFF35474AFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFB0E6FE89D1FB3CA3FA3DA2FE4DACFE5D
                BBF96DC8F58BD9FA7DCEFF35474AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF1898E9249AF2309CF93CA0FE4BABFE5CB9F96BC6F588D8F981D1FF7C61
                56FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1798E9239AF22F9CF93A
                A0FE4AAAFE5BB8FA6AC6F585D7F982D0FCC59782FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF1797E62299F02E9BF83A9FFE49A9FE59B7FA68C4F682D5
                F83E494E8A7D78FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C95DE20
                99F02D9BF8399FFD47A8FE58B5FB6AB2D8393939444443FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF2D95D31F99EF2C9BF7389FFD62B4FEBBBB
                BF4F4F50464551827DC6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FF3D8AB82099ED6D97BAB3B3B68F8F91C1C1C57D6FDA938ACEFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB2B8BCBCBCBC7F7F7FCAC9
                CDA48FDB846BC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FF9C999F7B63A69478BD8667B4846EB2FF00FF}
              Kind = bkGlyph
            end>
          Properties.EditProperties.ViewStyle = vsHideCursor
          Properties.EditProperties.OnButtonClick = rowDSZaklEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowDSZaklSop: TcxEditorRow
          Properties.Caption = #1047#1072#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1099#1081' '#1089#1086#1087#1091#1090#1089#1090#1074#1091#1102#1097#1080#1081' DS'
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FF3E494E3E494EFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3E494E35474A
                35474A9EE4FF98E1FF87D8FF638EA8FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF35474AB5EEFFB4EDFFB5EDFFB2ECFF73C8FE54
                6A7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB7ECFF
                C3F1FFC3F1FFC3F1FFC0F0FF92DBFE6FC6FE5F7383FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB4E9FFD1F6FFD1F6FFD0F5FFBAECFF71CBF58E
                DBFC73C8FE555B62FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0DFFF
                DBF8FFDAF8FFC5EFFF5EB7FD5EBCF86EC8F58CDAFB79CCFF35474AFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFB0E6FE89D1FB3CA3FA3DA2FE4DACFE5D
                BBF96DC8F58BD9FA7DCEFF35474AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF1898E9249AF2309CF93CA0FE4BABFE5CB9F96BC6F588D8F981D1FF7C61
                56FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1798E9239AF22F9CF93A
                A0FE4AAAFE5BB8FA6AC6F585D7F982D0FCC59782FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF1797E62299F02E9BF83A9FFE49A9FE59B7FA68C4F682D5
                F83E494E8A7D78FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C95DE20
                99F02D9BF8399FFD47A8FE58B5FB6AB2D8393939444443FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF2D95D31F99EF2C9BF7389FFD62B4FEBBBB
                BF4F4F50464551827DC6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FF3D8AB82099ED6D97BAB3B3B68F8F91C1C1C57D6FDA938ACEFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB2B8BCBCBCBC7F7F7FCAC9
                CDA48FDB846BC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FF9C999F7B63A69478BD8667B4846EB2FF00FF}
              Kind = bkGlyph
            end>
          Properties.EditProperties.ViewStyle = vsHideCursor
          Properties.EditProperties.OnButtonClick = verGrDSEditorRow1EditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
      end
    end
    object tsNaz: TcxTabSheet
      Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1103
      object grNaz: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 852
        Height = 546
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object tvNaz: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsNaz
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = tvNazRun
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
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object tvNazRun: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1074#1099#1087'.'
            DataBinding.FieldName = 'FD_RUN'
            Width = 126
          end
          object tvNazName: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_NAME'
            Width = 363
          end
          object tvNazState: TcxGridDBColumn
            Caption = #1057#1090#1072#1090#1091#1089
            DataBinding.FieldName = 'STATE'
          end
          object tvNazIspol: TcxGridDBColumn
            Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
            DataBinding.FieldName = 'ISPOLFIO'
            Width = 352
          end
        end
        object grNazLevel1: TcxGridLevel
          GridView = tvNaz
        end
      end
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 579
    Width = 858
    Height = 39
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object cxLabel1: TcxLabel
      Left = 5
      Top = 10
      Caption = '* - '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1099#1077' '#1076#1083#1103' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1086#1083#1103
    end
    object bCommit: TcxButton
      Left = 616
      Top = 7
      Width = 75
      Height = 25
      Action = aCommit
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bSave: TcxButton
      Left = 697
      Top = 7
      Width = 75
      Height = 25
      Action = aSave
      TabOrder = 2
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bClose: TcxButton
      Left = 777
      Top = 7
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 3
      OnClick = bCloseClick
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object os: TOracleSession
    DesignConnection = True
    LogonUsername = 'system'
    LogonPassword = 'sys123'
    LogonDatabase = 'ASU'
    Connected = True
    Left = 592
    Top = 224
  end
  object odsInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT tambulance.fk_peplid,'
      
        '       tambulance.fc_fam||'#39' '#39'||tambulance.fc_im||'#39' '#39'||tambulance' +
        '.fc_otch as pacfio,'
      '       tambulance.fd_rojd,'
      
        '       decode(tambulance.fp_sex, 0, '#39#1046#1077#1085#1089#1082#1080#1081#39', 1, '#39#1052#1091#1078#1089#1082#1086#1081#39') as ' +
        'sex,'
      '       tpeoples.fk_docvid, '
      
        '       (select fc_name from asu.tviddoc where fk_id = tpeoples.f' +
        'k_docvid) as docname, tpeoples.fc_docser, tpeoples.fc_docnum, tp' +
        'eoples.fc_docvidan,'
      '       ASU.GET_IB(tambulance.fk_id) AS IB,'
      
        '       ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(tambulance.fk_id) ' +
        'AS PACAGE,'
      
        '       ASU.PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE(tambulance.fk_id' +
        ') AS WORKPLACE,'
      
        '       ASU.PKG_REGIST_PACFUNC.GET_PAC_ADRFULL(tambulance.fk_id) ' +
        'AS ADDRESS,'
      
        '       asu.pkg_regist_pacfunc.get_pac_adrfull(tambulance.fk_id, ' +
        'asu.get_registid) AS ADR_PROJ,'
      '       to_char(sysdate, '#39'dd.mm.yyyy'#39') as date_sys,'
      
        '       (select fc_value from asu.tsmini where fc_key = '#39'DB_NAME'#39 +
        ' and fc_section = '#39'CONFIG'#39') as db_name,'
      '       asu.get_admins_for_xray(:pfk_sotrid) as is_admin,'
      
        '       (select fk_otdelid from asu.tsotr where fk_id = :pfk_sotr' +
        'id) as otdelid'
      ''
      '  FROM asu.tambulance, asu.tpeoples'
      ' where tambulance.fk_peplid = tpeoples.fk_id'
      '   and tambulance.fk_id = :pfk_pacid ')
    Optimize = False
    Variables.Data = {
      03000000020000000A0000003A50464B5F504143494403000000000000000000
      00000B0000003A50464B5F534F54524944030000000000000000000000}
    Session = os
    BeforeOpen = odsInfoBeforeOpen
    AfterOpen = odsInfoAfterOpen
    Left = 641
    Top = 224
  end
  object odsTalon: TOracleDataSet
    SQL.Strings = (
      'select fk_id, '
      '       fk_travma, '
      '       fk_insuranceid,'
      '       fk_sotrid, '
      
        '       (select fc_name from asu.tsmid where fk_id = asu.get_owne' +
        'r_from_smid(fk_travma))||'#39' '#39'||asu.get_smidname(fk_travma) as tra' +
        'vma,'
      '       asu.do_vrachfio(fk_sotrid) as sotrfio, '
      '       asu.do_vrachfio(:pfk_sotrid) as sotrclosed,'
      '       to_char(fd_opened, '#39'dd.mm.yyyy'#39') as fd_opened, '
      '       to_char(fd_closed, '#39'dd.mm.yyyy'#39') as fd_closed, '
      
        '       decode(fn_sos, 0, '#39#1054#1090#1082#1088#1099#1090#39', 1, '#39#1047#1072#1082#1088#1099#1090#39', 2, '#39#1053#1077#1103#1074#1082#1072#39') as ' +
        'sos,'
      '       fn_sos,'
      '       decode(fk_servplace, '
      
        '              null, (select fk_id from asu.tsmid where fk_defaul' +
        't = 1 start with fc_synonim = '#39'AMBTALON_SERVPLACE'#39' connect by pr' +
        'ior fk_id = fk_owner),'
      
        '              -1, (select fk_id from asu.tsmid where fk_default ' +
        '= 1 start with fc_synonim = '#39'AMBTALON_SERVPLACE'#39' connect by prio' +
        'r fk_id = fk_owner),'
      '              fk_servplace) as fk_servplace, '
      '       decode(fk_servplace,'
      
        '              null, (select fc_name from asu.tsmid where fk_defa' +
        'ult = 1 start with fc_synonim = '#39'AMBTALON_SERVPLACE'#39' connect by ' +
        'prior fk_id = fk_owner),'
      
        '              -1, (select fc_name from asu.tsmid where fk_defaul' +
        't = 1 start with fc_synonim = '#39'AMBTALON_SERVPLACE'#39' connect by pr' +
        'ior fk_id = fk_owner),'
      '              asu.get_smidname(fk_servplace)) as servplace,'
      '       decode(fk_reason,'
      
        '              null, (select fk_id from asu.tsmid where fk_defaul' +
        't = 1 start with fc_synonim = '#39'AMBTALON_REASON'#39' connect by prior' +
        ' fk_id = fk_owner),'
      
        '              -1, (select fk_id from asu.tsmid where fk_default ' +
        '= 1 start with fc_synonim = '#39'AMBTALON_REASON'#39' connect by prior f' +
        'k_id = fk_owner),'
      '              fk_reason) as fk_reason, '
      '       decode(fk_reason,'
      
        '              null, (select fc_name from asu.tsmid where fk_defa' +
        'ult = 1 start with fc_synonim = '#39'AMBTALON_REASON'#39' connect by pri' +
        'or fk_id = fk_owner),'
      
        '              -1, (select fc_name from asu.tsmid where fk_defaul' +
        't = 1 start with fc_synonim = '#39'AMBTALON_REASON'#39' connect by prior' +
        ' fk_id = fk_owner),'
      '              asu.get_smidname(fk_reason)) as reason,'
      '       fk_result, asu.get_smidname(fk_result) as resultpos,'
      
        '       fk_dopishodid, asu.get_smidname(fk_dopishodid) as dopisho' +
        'd,'
      '       asu.get_nevip,'
      '       nvl(fd_naprdate, '#39#39') as fd_naprdate, fc_naprnum, '
      
        '       (select to_char(fk_id)||'#39';'#39'||fc_name||'#39'-'#39'||asu.get_smidna' +
        'me(fk_typeid) from asu.tdistrict_name where fk_id = tambtalon.fk' +
        '_uchid) as uch,'
      '       fk_rezhimid      '
      '  from asu.tambtalon, asu.tambtalon_naz '
      ' where tambtalon.fk_id = tambtalon_naz.fk_talonid'
      '   and tambtalon_naz.fk_nazid = :pfk_nazid')
    Optimize = False
    Variables.Data = {
      03000000020000000A0000003A50464B5F4E415A494403000000000000000000
      00000B0000003A50464B5F534F54524944030000000000000000000000}
    Session = os
    BeforeOpen = odsTalonBeforeOpen
    Left = 641
    Top = 272
  end
  object al: TActionList
    Left = 544
    Top = 224
    object aCommit: TAction
      Caption = #1055#1086#1076#1087#1080#1089#1072#1090#1100
      Hint = 
        #1047#1072#1082#1088#1099#1090#1100' '#1072#1084#1073#1091#1083#1072#1090#1086#1088#1085#1099#1081' '#1090#1072#1083#1086#1085#13#10#1042#1085#1080#1084#1072#1085#1080#1077'!'#13#10#1055#1086#1089#1083#1077' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1072#1084#1073#1091#1083#1072#1090#1086#1088#1085 +
        #1099#1081' '#1090#1072#1083#1086#1085' '#1085#1077#1083#1100#1079#1103' '#1073#1091#1076#1077#1090' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100'!'
      ShortCut = 118
      OnExecute = aCommitExecute
    end
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1072#1084#1073#1091#1083#1072#1090#1086#1088#1085#1086#1075#1086' '#1090#1072#1083#1086#1085#1072
      ShortCut = 113
      OnExecute = aSaveExecute
    end
    object aSetDate: TAction
      OnExecute = aSetDateExecute
    end
  end
  object cxStyleRep: TcxStyleRepository
    Left = 544
    Top = 280
    PixelsPerInch = 96
    object stBoldRed: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object stDefault: TcxStyle
    end
  end
  object odsNaz: TOracleDataSet
    SQL.Strings = (
      'select t1.fk_id,'
      '       t1.fc_name,'
      
        '       t1.fd_run, to_char(fd_run, '#39'dd.mm.yyyy hh24:mi'#39') as fd_ru' +
        'n_str, to_char(fd_run, '#39'dd.mm.yyyy'#39') as fd_run_str_tr,'
      '       asu.do_vrachfio(t1.fk_ispolid) as ispolfio,'
      '       decode(t1.fk_nazsosid, '
      '              asu.get_nevip, '#39#1053#1077' '#1074#1099#1087'.'#39', '
      '              asu.get_vipnaz, '#39#1042#1099#1087'.'#39', '
      '              asu.get_labvip, '#39#1042#1099#1087'. '#1088#1083#39',  '
      '              asu.get_recomend, '#39#1056#1077#1082#1086#1084#1077#1085#1076#1086#1074#1072#1085#1086#39', '
      '              asu.get_nazcancel, '#39#1054#1090#1084#1077#1085#1077#1085#1086#39') state'
      ''
      '  from asu.vnaz t1, asu.tambtalon_naz t2'
      ' where t1.fk_id = t2.fk_nazid'
      '   and t2.fk_talonid = :ptalonid'
      '   and t1.fk_nazsosid = asu.get_vipnaz'
      'order by fd_run')
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A5054414C4F4E49440300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000600000046445F52554E010000000000080000004953504F
      4C46494F010000000000050000005354415445010000000000}
    Session = os
    BeforeOpen = odsNazBeforeOpen
    Left = 171
    Top = 171
  end
  object dsNaz: TDataSource
    DataSet = odsNaz
    Left = 171
    Top = 227
  end
  object dsStandart: TDataSource
    DataSet = odsStandart
    Left = 363
    Top = 291
  end
  object odsStandart: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name '
      '  from asu.tsmid '
      ' where fk_owner = (select fk_id '
      '                     from asu.tsmid '
      '                    where fc_synonim = '#39'CPD_STANDARTGROUP'#39')')
    Optimize = False
    Session = os
    Left = 363
    Top = 347
  end
  object odsCntOut: TOracleDataSet
    SQL.Strings = (
      'select max(fn_count) as cnt_out '
      '  from (select count(te.id_ill) as fn_count       '
      '          from (select max(t.fk_id) fk_id,'
      '                       t.lpu_id,'
      '                       t.person_idl,'
      '                       t.id_ill,'
      '                       t.p_id_ill,'
      '                       nvl(max(t.fl_cancel), 0) fl_cancel,'
      '                       count(*) fn_count'
      '                  from asu.texsluch t'
      '                 where t.id_ill = :pTalonID'
      
        '                group by t.lpu_id, t.person_idl, t.id_ill, t.p_i' +
        'd_ill) tem'
      
        '                inner join asu.texsluch te on te.fk_id = tem.fk_' +
        'id'
      '                 where tem.fl_cancel = 0'
      '        union all'
      '        select count(*) as fn_count'
      '          from exch43.toutpaclog l '
      '         where l.fp_result = 0 '
      '           and l.fc_function = '#39'ADD_CASE'#39' '
      '           and l.fk_pacid = :pTalonID'
      
        '           and not exists (select fk_id from asu.tchange_loaded_' +
        'sluch c where c.fk_sluch = l.fk_pacid and c.fd_todate > sysdate)' +
        ')')
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A5054414C4F4E49440300000000000000000000
      00}
    Session = os
    BeforeOpen = odsTalonBeforeOpen
    Left = 641
    Top = 320
  end
  object dsTypeTalon: TDataSource
    DataSet = odsTypeTalon
    Left = 483
    Top = 363
  end
  object odsTypeTalon: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39#39' as fc_name, '#39#39' as fc_synonim'
      '  from dual'
      ''
      'union all'
      ''
      'select fk_id, fc_name, fc_synonim'
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1'
      'start with fc_synonim = '#39'TALON_TYPE_CREATE'#39
      'connect by prior fk_id = fk_owner')
    Optimize = False
    Session = os
    Left = 483
    Top = 411
  end
  object odsTypeMedHelp: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39#39' as fc_name'
      '  from dual'
      'union all'
      'select fk_id, fc_name '
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1 '
      'start with fc_synonim = '#39'TYPE_V_MU'#39
      'connect by prior fk_id = fk_owner')
    Optimize = False
    Session = os
    Left = 363
    Top = 67
  end
  object dsTypeMedHelp: TDataSource
    DataSet = odsTypeMedHelp
    Left = 315
    Top = 67
  end
  object odsRezim: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39#39' as fc_name'
      '  from dual'
      '  '
      'union all'
      ''
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where fk_owner = asu.get_synid('#39'NAZN_TYPES'#39')'
      '   and fc_synonim in ('#39'NAZTYPE_PLAN'#39', '#39'NAZTYPE_URGENTLY'#39')'
      '   and fl_del = 0')
    Optimize = False
    Session = os
    Left = 363
    Top = 115
  end
  object dsRezim: TDataSource
    DataSet = odsRezim
    Left = 315
    Top = 115
  end
  object odsPolis: TOracleDataSet
    SQL.Strings = (
      'select decode(t2.fl_notdoc,'
      
        '              0, t2.fc_name||'#39' '#39'||t1.fc_ser||'#39' '#39'||t1.fc_num||'#39' '#1044 +
        #1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1086': '#39'||to_char(case when t1.fd_prolong > t1.fd_end' +
        ' then t1.fd_prolong else t1.fd_end end, '#39'dd.mm.yyyy'#39'),'
      
        '              null, t2.fc_name||'#39' '#39'||t1.fc_ser||'#39' '#39'||t1.fc_num||' +
        #39' '#1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1086': '#39'||to_char(case when t1.fd_prolong > t1.fd_' +
        'end then t1.fd_prolong else t1.fd_end end, '#39'dd.mm.yyyy'#39'),'
      '              1, t2.fc_name) as oplataname,'
      '       t2.fc_synonim'
      '  from asu.tinsurdocs t1, asu.ttypedoc t2 '
      ' where t2.fk_id = t1.fk_typedocid'
      '   and t1.fk_id = :pTalonID')
    Optimize = False
    Variables.Data = {
      0300000001000000090000003A5054414C4F4E49440300000000000000000000
      00}
    Session = os
    Left = 643
    Top = 371
  end
  object dsVidPos: TDataSource
    DataSet = odsVidPos
    Left = 315
    Top = 171
  end
  object odsVidPos: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39#39' as fc_name'
      '  from dual'
      'union all'
      'select fk_id, fc_name '
      '  from asu.tsmid'
      ' where fl_del = 0'
      '   and level <> 1 '
      'start with fc_synonim = '#39'VID_AMB_POS'#39
      'connect by prior fk_id = fk_owner')
    Optimize = False
    Session = os
    Left = 363
    Top = 171
  end
end
