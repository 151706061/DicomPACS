object frmMain: TfrmMain
  Left = 262
  Top = 11
  BorderIcons = []
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1088#1077#1085#1090#1075#1077#1085#1072
  ClientHeight = 751
  ClientWidth = 1271
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxPage: TcxPageControl
    Left = 191
    Top = 34
    Width = 1080
    Height = 717
    ActivePage = tsKontrast
    Align = alClient
    LookAndFeel.Kind = lfUltraFlat
    TabOrder = 0
    OnChange = cxPageChange
    ClientRectBottom = 717
    ClientRectRight = 1080
    ClientRectTop = 24
    object cx: TcxTabSheet
      Caption = #1043#1083#1072#1074#1085#1086#1077
      ImageIndex = 0
      object VerGrMain: TcxVerticalGrid
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 1074
        Height = 690
        Margins.Top = 0
        Align = alClient
        LookAndFeel.Kind = lfUltraFlat
        OptionsView.CellAutoHeight = True
        OptionsView.ShowEditButtons = ecsbAlways
        OptionsView.RowHeaderWidth = 243
        TabOrder = 0
        OnKeyDown = VerGrMainKeyDown
        object catMain: TcxCategoryRow
          Properties.Caption = #1054#1073#1097#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
        end
        object rowBoss: TcxEditorRow
          Properties.Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.EditProperties.ViewStyle = vsHideCursor
          Properties.EditProperties.OnButtonClick = rowBossEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = ''
        end
        object rowZav: TcxEditorRow
          Properties.Caption = #1047#1072#1074#1077#1076#1091#1102#1097#1080#1081' '#1086#1090#1076#1077#1083#1077#1085#1080#1077#1084
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
          Properties.EditProperties.OnButtonClick = rowZavEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowOtdel: TcxEditorRow
          Properties.Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1077
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
          Properties.EditProperties.OnButtonClick = rowOtdelEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowPhone: TcxEditorRow
          Properties.Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.AutoSelect = False
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Enabled = False
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
              Kind = bkGlyph
            end>
          Properties.EditProperties.ClickKey = 13
          Properties.EditProperties.ValidateOnEnter = False
          Properties.EditProperties.OnButtonClick = rowPhoneEditPropertiesButtonClick
          Properties.EditProperties.OnChange = rowPhoneEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = ''
        end
        object catDop: TcxCategoryRow
          Properties.Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
        end
        object rowNew: TcxEditorRow
          Properties.Caption = #1053#1086#1074#1099#1081' '#1074#1080#1076
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowNewEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowKolvoDays: TcxEditorRow
          Properties.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081' '#1076#1083#1103' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Enabled = False
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
              Kind = bkGlyph
            end>
          Properties.EditProperties.ClickKey = 13
          Properties.EditProperties.MaskKind = emkRegExpr
          Properties.EditProperties.EditMask = '\d+'
          Properties.EditProperties.OnButtonClick = rowKolvoDaysEditPropertiesButtonClick
          Properties.EditProperties.OnChange = rowKolvoDaysEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowKolvoRaspred: TcxEditorRow
          Properties.Caption = #1050#1086#1083'-'#1074#1086' '#1076#1085#1077#1081' '#1076#1083#1103' '#1088#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1103
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Enabled = False
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
              Kind = bkGlyph
            end>
          Properties.EditProperties.ClickKey = 13
          Properties.EditProperties.MaskKind = emkRegExpr
          Properties.EditProperties.EditMask = '\d+'
          Properties.EditProperties.OnButtonClick = rowKolvoRaspredEditPropertiesButtonClick
          Properties.EditProperties.OnChange = rowKolvoRaspredEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowSumDoza: TcxEditorRow
          Properties.Caption = #1043#1086#1076#1086#1074#1072#1103' '#1101#1092#1092#1077#1082#1090#1080#1074#1085#1072#1103' '#1076#1086#1079#1072' ('#1084#1047#1074')'
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Enabled = False
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
              Kind = bkGlyph
            end>
          Properties.EditProperties.ClickKey = 13
          Properties.EditProperties.MaskKind = emkRegExpr
          Properties.EditProperties.EditMask = '\d+'
          Properties.EditProperties.OnButtonClick = rowSumDozaEditPropertiesButtonClick
          Properties.EditProperties.OnChange = rowSumDozaEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowDozapol: TcxEditorRow
          Properties.Caption = #1044#1086#1079#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1072#1084#1073#1091#1083#1072#1090#1086#1088#1085#1086#1075#1086' '#1090#1072#1083#1086#1085#1072
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowDozapolEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowShowDolgTalon: TcxEditorRow
          Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1085#1086#1087#1082#1091' "'#1044#1086#1083#1075#1080' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084'"'
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowShowDolgTalonEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowMk: TcxEditorRow
          Properties.Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' "'#1087#1086' '#1090#1077#1082#1091#1097#1077#1081' '#1052#1050'"'
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowMkEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object catProtocol: TcxCategoryRow
          Height = 15
          Properties.Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
        end
        object rowNumProtocol: TcxEditorRow
          Properties.Caption = #1054#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1079#1072#1087#1086#1083#1085#1103#1090#1100' '#8470' '#1087#1088#1086#1090#1086#1082#1086#1083#1072' '
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowNumProtocolEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowAgreePac: TcxEditorRow
          Properties.Caption = #1057#1086#1075#1083#1072#1089#1080#1077' '#1087#1072#1094#1080#1077#1085#1090#1072
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowAgreePacEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowShowAgree: TcxEditorRow
          Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1085#1086#1087#1082#1091' "'#1057#1086#1075#1083#1072#1089#1080#1077' '#1087#1072#1094#1080#1077#1085#1090#1072'"'
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowShowAgreeEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowBlockLab: TcxEditorRow
          Properties.Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1076#1087#1080#1089#1100' '#1083#1072#1073#1086#1088#1072#1085#1090#1072' '#1087#1086#1089#1083#1077' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowBlockLabEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowAmbTalon: TcxEditorRow
          Properties.Caption = #1057#1074#1103#1079#1082#1072' '#1089' '#1072#1084#1073#1091#1083#1072#1090#1086#1088#1085#1099#1084' '#1090#1072#1083#1086#1085#1086#1084
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowAmbTalonEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowEng: TcxEditorRow
          Properties.Caption = #1040#1085#1075#1083#1080#1081#1089#1082#1072#1103' '#1088#1072#1089#1082#1083#1072#1076#1082#1072' '#1074' '#8470' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowEngEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowShowWork: TcxEditorRow
          Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1085#1086#1087#1082#1091' "'#1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099'"'
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowShowWorkEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowShowAdd: TcxEditorRow
          Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1085#1086#1087#1082#1091' "'#1044#1086#1073#1072#1074#1080#1090#1100'"'
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowShowAddEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowAddTalonInfo: TcxEditorRow
          Properties.Caption = #1044#1086#1079#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1072#1084#1073#1090#1072#1083#1086#1085#1072' '#1083#1072#1073#1086#1088#1072#1085#1090#1086#1084
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowAddTalonInfoEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowShowHand: TcxEditorRow
          Properties.Caption = #1055#1088#1080' '#1086#1090#1084#1077#1085#1077' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' "'#1054#1090' '#1088#1091#1082#1080'"'
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowShowHandEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowEditTime: TcxEditorRow
          Properties.Caption = #1047#1072#1087#1088#1077#1090#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1074#1088#1077#1084#1077#1085#1080' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowEditTimeEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
      end
    end
    object cxDefault: TcxTabSheet
      Caption = #1047#1085#1072#1095#1077#1085#1080#1103' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      ImageIndex = 1
      object vGrDefaults: TcxVerticalGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1074
        Height = 687
        Align = alClient
        LookAndFeel.Kind = lfUltraFlat
        OptionsView.RowHeaderWidth = 163
        TabOrder = 0
        object catNapravDef: TcxCategoryRow
          Properties.Caption = #1047#1085#1072#1095#1077#1085#1080#1103' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1076#1083#1103' '#1088#1077#1085#1090#1075#1077#1085#1072
        end
        object rowTarget: TcxEditorRow
          Properties.Caption = #1062#1077#1083#1100
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
          Properties.EditProperties.ListSource = dsTarget
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowTargetEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowUrgent: TcxEditorRow
          Properties.Caption = #1057#1088#1086#1095#1085#1086#1089#1090#1100
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
          Properties.EditProperties.ListSource = dsUrgent
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowUrgentEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowVidOplat: TcxEditorRow
          Properties.Caption = #1057#1087#1086#1089#1086#1073' '#1086#1087#1083#1072#1090#1099
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
          Properties.EditProperties.ListSource = dsVidOplat
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowVidOplatEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowVidSnimok: TcxEditorRow
          Properties.Caption = #1042#1080#1076' '#1089#1085#1080#1084#1082#1072
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
          Properties.EditProperties.ListSource = dsVidSnimok
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowVidSnimokEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowProj: TcxEditorRow
          Properties.Caption = #1055#1088#1086#1078#1080#1074#1072#1077#1090' '#1087#1086#1089#1090#1086#1103#1085#1085#1086
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
        object rowCompanyDog: TcxEditorRow
          Properties.Caption = #1050#1086#1084#1087#1072#1085#1080#1103' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091
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
          Properties.EditProperties.ListSource = dsCompDog
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowCompanyDogEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowNumDisk: TcxEditorRow
          Properties.Caption = #1053#1086#1084#1077#1088' '#1076#1080#1089#1082#1072
          Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
          Properties.EditProperties.Buttons = <
            item
              Default = True
              Enabled = False
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
              Kind = bkGlyph
            end>
          Properties.EditProperties.ClickKey = 13
          Properties.EditProperties.OnButtonClick = rowNumDiskEditPropertiesButtonClick
          Properties.EditProperties.OnChange = rowNumDiskEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowKonsult: TcxEditorRow
          Properties.Caption = #1050#1086#1085#1089#1091#1083#1100#1090#1072#1090#1080#1074#1085#1099#1077' '#1091#1089#1083#1091#1075#1080
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowKonsultEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object catFluDef: TcxCategoryRow
          Properties.Caption = #1047#1085#1072#1095#1077#1085#1080#1103' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1076#1083#1103' '#1092#1083#1102#1086#1088#1086#1075#1088#1072#1092#1080#1080
        end
        object rowVidPriem: TcxEditorRow
          Properties.Caption = #1042#1080#1076' '#1087#1088#1080#1077#1084#1072
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
          Properties.EditProperties.ListSource = dsPriem
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowVidPriemEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowApparat: TcxEditorRow
          Properties.Caption = #1040#1087#1087#1072#1088#1072#1090
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
          Properties.EditProperties.ListSource = dsApparat
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowApparatEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowTargetFlu: TcxEditorRow
          Properties.Caption = #1062#1077#1083#1100
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
          Properties.EditProperties.ListSource = dsTarget
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowTargetFluEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowVidOplFlu: TcxEditorRow
          Properties.Caption = #1057#1087#1086#1089#1086#1073' '#1086#1087#1083#1072#1090#1099
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
          Properties.EditProperties.ListSource = dsVidOplat
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowVidOplFluEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowPeriod: TcxEditorRow
          Properties.Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100
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
          Properties.EditProperties.ListSource = dsPeriod
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowPeriodEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object catAmbTalon: TcxCategoryRow
          Options.Focusing = False
          Options.TabStop = False
          Properties.Caption = #1047#1085#1072#1095#1077#1085#1080#1103' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1076#1083#1103' '#1072#1084#1073#1091#1083#1072#1090#1086#1088#1085#1086#1075#1086' '#1090#1072#1083#1086#1085#1072
        end
        object rowRes: TcxEditorRow
          Properties.Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1073#1088#1072#1097#1077#1085#1080#1103
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
          Properties.EditProperties.ListSource = dsRes
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowResEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowDopIshod: TcxEditorRow
          Properties.Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1080#1089#1093#1086#1076
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
          Properties.EditProperties.ListSource = dsDopIshod
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowDopIshodEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowPlace: TcxEditorRow
          Properties.Caption = #1052#1077#1089#1090#1086' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
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
          Properties.EditProperties.ListSource = dsPlace
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowPlaceEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowTargetTalon: TcxEditorRow
          Properties.Caption = #1062#1077#1083#1100' '#1087#1086#1089#1077#1097#1077#1085#1080#1103
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
          Properties.EditProperties.ListSource = dsTargetTalon
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowTargetTalonEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowStandart: TcxEditorRow
          Properties.Caption = #1057#1090#1072#1085#1076#1072#1088#1090' '#1084#1077#1076'. '#1087#1086#1084#1086#1097#1080
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
          Properties.EditProperties.ListSource = dsStandarMP
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowStandartEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowTypeVid: TcxEditorRow
          Properties.Caption = #1058#1080#1087' '#1074#1080#1076#1072' '#1084#1077#1076'. '#1087#1086#1084#1086#1097#1080
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
          Properties.EditProperties.ListSource = dsTypeVMU
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.EditProperties.OnEditValueChanged = rowTypeVidEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
      end
    end
    object tsProtocol: TcxTabSheet
      Caption = #1055#1088#1086#1090#1086#1082#1086#1083
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = False
      object cxVerticalGrid1: TcxVerticalGrid
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 1074
        Height = 265
        Margins.Top = 0
        Align = alTop
        LookAndFeel.Kind = lfUltraFlat
        OptionsView.CellAutoHeight = True
        OptionsView.ShowEditButtons = ecsbAlways
        OptionsView.RowHeaderWidth = 243
        TabOrder = 0
        OnKeyDown = VerGrMainKeyDown
        object cxCategoryRow4: TcxCategoryRow
          Properties.Caption = #1055#1088#1086#1090#1086#1082#1086#1083
        end
        object rowShowPass: TcxEditorRow
          Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1085#1086#1087#1082#1091' "'#1047#1072#1095#1077#1089#1090#1100'"'
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowShowPassEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowShowSnimki: TcxEditorRow
          Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1085#1086#1087#1082#1091' "'#1057#1085#1080#1084#1082#1080'"'
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowShowSnimkiEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowShowDs: TcxEditorRow
          Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' "'#1044#1080#1072#1075#1085#1086#1079'"'
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowShowDsEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowShowRecom: TcxEditorRow
          Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' "'#1056#1077#1082#1086#1084#1077#1085#1076#1072#1094#1080#1080'"'
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowShowRecomEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowPod: TcxEditorRow
          Height = 17
          Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1085#1086#1087#1082#1091' "'#1055#1086#1076#1087#1080#1089#1072#1090#1100'"'
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowPodEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object RowMoreMet: TcxEditorRow
          Properties.Caption = #1053#1077#1089#1082#1086#1083#1100#1082#1086' '#1084#1077#1090#1086#1076#1080#1082' '#1074' 1 '#1087#1088#1086#1090#1086#1082#1086#1083#1077
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = RowMoreMetEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowShowSpeed: TcxEditorRow
          Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' "'#1057#1082#1086#1088#1086#1089#1090#1100' '#1074#1074#1086#1076#1072' '#1082#1086#1085#1090#1088#1072#1089#1090#1072'"'
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowShowSpeedEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowShowPrint: TcxEditorRow
          Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' "'#1055#1077#1095#1072#1090#1100' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1084#1077#1090#1086#1076#1080#1082'"'
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowShowPrintEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowSpell: TcxEditorRow
          Properties.Caption = #1055#1088#1086#1074#1077#1088#1103#1090#1100' '#1086#1088#1092#1086#1075#1088#1072#1092#1080#1102
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowSpellEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowShowInsPic: TcxEditorRow
          Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' "'#1042#1089#1090#1072#1074#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077'"'
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowShowInsPicEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object rowPF: TcxEditorRow
          Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1085#1086#1087#1082#1091' "'#1055#1088#1086#1092#1060#1072#1082#1090#1086#1088#1099'"'
          Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.NullStyle = nssUnchecked
          Properties.EditProperties.ValueChecked = '-1'
          Properties.EditProperties.ValueUnchecked = '0'
          Properties.EditProperties.OnChange = rowPFEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
      end
      object Panel3: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 268
        Width = 1074
        Height = 422
        Margins.Top = 0
        Align = alClient
        Caption = 'Panel3'
        TabOrder = 1
        object dxBarDockControl12: TdxBarDockControl
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 1072
          Height = 28
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Align = dalTop
          BarManager = dxBM
          SunkenBorder = True
          UseOwnSunkenBorder = True
        end
        object grEdit: TcxGrid
          AlignWithMargins = True
          Left = 1
          Top = 32
          Width = 1072
          Height = 389
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          TabOrder = 1
          LookAndFeel.Kind = lfFlat
          object tvEdit: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsEdit
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
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
            object tvEditOtdel: TcxGridDBColumn
              Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1077
              DataBinding.FieldName = 'FC_KEY'
              Width = 495
            end
            object tvEditDays: TcxGridDBColumn
              Caption = #1050#1086#1083'-'#1074#1086' '#1076#1085#1077#1081
              DataBinding.FieldName = 'FC_VALUE'
              Width = 351
            end
          end
          object grEditLevel1: TcxGridLevel
            GridView = tvEdit
          end
        end
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = #1060#1083#1102#1086#1088#1086#1075#1088#1072#1092#1080#1103
      ImageIndex = 2
      object vGrFlu: TcxVerticalGrid
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 1077
        Height = 174
        Margins.Left = 0
        Align = alTop
        LookAndFeel.Kind = lfUltraFlat
        OptionsView.RowHeaderWidth = 184
        TabOrder = 0
        object catFlu: TcxCategoryRow
          Properties.Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1092#1083#1102#1086#1088#1086#1075#1088#1072#1092#1080#1080
        end
        object rowDoobsl: TcxEditorRow
          Properties.Caption = #1044#1086#1086#1073#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
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
          Properties.EditProperties.OnButtonClick = rowDoobslEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowPat: TcxEditorRow
          Properties.Caption = #1042' '#1089#1074#1103#1079#1080' '#1089' '#1087#1072#1090#1072#1083#1086#1075#1080#1077#1081
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
          Properties.EditProperties.OnButtonClick = rowPatEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowBrak: TcxEditorRow
          Properties.Caption = #1042' '#1089#1074#1103#1079#1080' '#1089' '#1073#1088#1072#1082#1086#1084
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
          Properties.EditProperties.OnButtonClick = rowBrakEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowPnevmo: TcxEditorRow
          Properties.Caption = #1055#1085#1077#1074#1084#1086#1085#1080#1103
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
          Properties.EditProperties.OnButtonClick = rowPnevmoEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowNorma: TcxEditorRow
          Properties.Caption = #1053#1086#1088#1084#1072
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
          Properties.EditProperties.OnButtonClick = rowNormaEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
        object rowPrPat: TcxEditorRow
          Properties.Caption = #1055#1088#1086#1095#1080#1077' '#1087#1072#1090#1086#1083#1086#1075#1080#1080
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
          Properties.EditProperties.OnButtonClick = rowPrPatEditPropertiesButtonClick
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbAlways
          Properties.Value = Null
        end
      end
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 180
        Width = 1077
        Height = 510
        Margins.Left = 0
        Margins.Top = 0
        Align = alClient
        TabOrder = 1
        object dxBarDockControl7: TdxBarDockControl
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 1072
          Height = 28
          Margins.Left = 0
          Margins.Top = 0
          Align = dalTop
          BarManager = dxBM
          SunkenBorder = True
          UseOwnSunkenBorder = True
        end
        object grMetods: TcxGrid
          AlignWithMargins = True
          Left = 1
          Top = 32
          Width = 1072
          Height = 474
          Margins.Left = 0
          Margins.Top = 0
          Align = alClient
          TabOrder = 1
          LookAndFeel.Kind = lfFlat
          object TVMETODS: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsMetods
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CellHints = True
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnFiltering = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object TVMETODS_NAME: TcxGridDBColumn
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1084#1077#1090#1086#1076#1080#1082#1080
              DataBinding.FieldName = 'FIO'
            end
          end
          object cxGridLevel5: TcxGridLevel
            GridView = TVMETODS
          end
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = #1056#1077#1072#1085#1080#1084#1072#1094#1080#1103
      ImageIndex = 3
      object dxBarDockControl2: TdxBarDockControl
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 1077
        Height = 28
        Margins.Left = 0
        Align = dalTop
        BarManager = dxBM
        SunkenBorder = True
        UseOwnSunkenBorder = True
      end
      object cxGrReanim: TcxGrid
        AlignWithMargins = True
        Left = 0
        Top = 34
        Width = 1077
        Height = 656
        Margins.Left = 0
        Margins.Top = 0
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfFlat
        object TV: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsReanim
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object VNAME: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
            DataBinding.FieldName = 'NAMEOTDEL'
          end
        end
        object cxGrReanimLevel1: TcxGridLevel
          GridView = TV
        end
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100
      ImageIndex = 5
      object dxBarDockControl3: TdxBarDockControl
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 1077
        Height = 28
        Margins.Left = 0
        Align = dalTop
        BarManager = dxBM
        SunkenBorder = True
        UseOwnSunkenBorder = True
      end
      object cxGrid1: TcxGrid
        AlignWithMargins = True
        Left = 0
        Top = 34
        Width = 1077
        Height = 656
        Margins.Left = 0
        Margins.Top = 0
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfFlat
        object TVPERIOD: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsPeriodSpisok
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object TVPERIODNAME: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_NAME'
            Width = 372
          end
          object TVPERIODKOLVO: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1076#1085#1077#1081
            DataBinding.FieldName = 'FN_NORM0'
            Width = 113
          end
          object TVPERIODMONTHS: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1084#1077#1089#1103#1094#1077#1074
            DataBinding.FieldName = 'FN_NORM1'
            Width = 112
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = TVPERIOD
        end
      end
    end
    object cxAccess: TcxTabSheet
      Caption = #1044#1086#1089#1090#1091#1087
      ImageIndex = 7
      object dxBarDockControl5: TdxBarDockControl
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 1077
        Height = 28
        Margins.Left = 0
        Align = dalTop
        BarManager = dxBM
        SunkenBorder = True
        UseOwnSunkenBorder = True
      end
      object cxGrid2: TcxGrid
        AlignWithMargins = True
        Left = 0
        Top = 34
        Width = 1077
        Height = 656
        Margins.Left = 0
        Margins.Top = 0
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfFlat
        object TVACCESS: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsAccess
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object VFIO: TcxGridDBColumn
            Caption = #1060#1048#1054' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
            DataBinding.FieldName = 'FIO'
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = TVACCESS
        end
      end
    end
    object cxDicom: TcxTabSheet
      Caption = 'DICOM'
      ImageIndex = 8
      object pcDicom1: TcxPageControl
        Left = 0
        Top = 0
        Width = 1080
        Height = 693
        ActivePage = cxTabSheet2
        Align = alClient
        TabOrder = 0
        OnChange = pcDicom1Change
        ClientRectBottom = 693
        ClientRectRight = 1080
        ClientRectTop = 24
        object cxTabSheet2: TcxTabSheet
          Caption = 'Dicom-'#1089#1077#1088#1074#1077#1088
          ImageIndex = 0
          object vGrDicom: TcxVerticalGrid
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 1074
            Height = 663
            Align = alClient
            LookAndFeel.Kind = lfUltraFlat
            OptionsView.RowHeaderWidth = 283
            TabOrder = 0
            OnKeyDown = vGrDicomKeyDown
            object catDicom: TcxCategoryRow
              Properties.Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' Dicom-'#1089#1077#1088#1074#1077#1088#1072
            end
            object rowPort: TcxEditorRow
              Properties.Caption = #1055#1086#1088#1090
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Enabled = False
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
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ClickKey = 13
              Properties.EditProperties.MaskKind = emkRegExpr
              Properties.EditProperties.EditMask = '\d+'
              Properties.EditProperties.OnButtonClick = rowPortEditPropertiesButtonClick
              Properties.EditProperties.OnChange = rowPortEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object rowIP: TcxEditorRow
              Properties.Caption = 'IP-'#1072#1076#1088#1077#1089' '#1089#1077#1088#1074#1077#1088#1072
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Enabled = False
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
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ClickKey = 13
              Properties.EditProperties.OnButtonClick = rowIPEditPropertiesButtonClick
              Properties.EditProperties.OnChange = rowIPEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object rowCalled: TcxEditorRow
              Properties.Caption = 'Called AE Title'
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Enabled = False
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
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ClickKey = 13
              Properties.EditProperties.OnButtonClick = rowCalledEditPropertiesButtonClick
              Properties.EditProperties.OnChange = rowCalledEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object rowShow3D: TcxEditorRow
              Properties.Caption = #1042#1082#1083#1102#1095#1080#1090#1100' 3D'
              Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.NullStyle = nssUnchecked
              Properties.EditProperties.ValueChecked = '-1'
              Properties.EditProperties.ValueUnchecked = '0'
              Properties.EditProperties.OnChange = rowShow3DEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Value = Null
            end
            object catInteg: TcxCategoryRow
              Options.Focusing = False
              Options.Moving = False
              Options.TabStop = False
              Properties.Caption = #1048#1085#1090#1077#1075#1088#1072#1094#1080#1103' '#1089' LookInside'
            end
            object rowLookInside: TcxEditorRow
              Properties.Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1080#1085#1090#1077#1075#1088#1072#1094#1080#1102' '#1089' LookInside'
              Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.NullStyle = nssUnchecked
              Properties.EditProperties.ValueChecked = '-1'
              Properties.EditProperties.ValueUnchecked = '0'
              Properties.EditProperties.OnChange = rowLookInsideEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Value = Null
            end
            object rowPortWeb: TcxEditorRow
              Properties.Caption = #1055#1086#1088#1090' '#1076#1083#1103' Web-'#1072
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Enabled = False
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
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ClickKey = 13
              Properties.EditProperties.OnButtonClick = rowPortWebEditPropertiesButtonClick
              Properties.EditProperties.OnChange = rowPortWebEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object catArch: TcxCategoryRow
              Options.Focusing = False
              Options.Moving = False
              Options.TabStop = False
              Properties.Caption = #1040#1088#1093#1080#1074
            end
            object rowPortLookInside: TcxEditorRow
              Properties.Caption = #1055#1086#1088#1090' '#1089#1077#1088#1074#1077#1088#1072' LookInside'
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Enabled = False
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
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ClickKey = 13
              Properties.EditProperties.MaskKind = emkRegExprEx
              Properties.EditProperties.EditMask = '\d+'
              Properties.EditProperties.OnButtonClick = rowPortLookInsideEditPropertiesButtonClick
              Properties.EditProperties.OnChange = rowPortLookInsideEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object rowIPLookInside: TcxEditorRow
              Properties.Caption = 'IP-'#1072#1076#1088#1077#1089' '#1089#1077#1088#1074#1077#1088#1072' LookInside'
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Enabled = False
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
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ClickKey = 13
              Properties.EditProperties.OnButtonClick = rowIPLookInsideEditPropertiesButtonClick
              Properties.EditProperties.OnChange = rowIPLookInsideEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object rowAETitleServer: TcxEditorRow
              Properties.Caption = 'AE Title '#1089#1077#1088#1074#1077#1088#1072
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Enabled = False
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
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ClickKey = 13
              Properties.EditProperties.OnButtonClick = rowAETitleServerEditPropertiesButtonClick
              Properties.EditProperties.OnChange = rowAETitleServerEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object rowLoginLookInside: TcxEditorRow
              Properties.Caption = #1051#1086#1075#1080#1085
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Enabled = False
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
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ClickKey = 13
              Properties.EditProperties.OnButtonClick = rowLoginLookInsideEditPropertiesButtonClick
              Properties.EditProperties.OnChange = rowLoginLookInsideEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object rowPasswordLookInside: TcxEditorRow
              Properties.Caption = #1055#1072#1088#1086#1083#1100
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Enabled = False
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
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ClickKey = 13
              Properties.EditProperties.EchoMode = eemPassword
              Properties.EditProperties.OnButtonClick = rowPasswordLookInsideEditPropertiesButtonClick
              Properties.EditProperties.OnChange = rowPasswordLookInsideEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object catWLM: TcxCategoryRow
              Options.Focusing = False
              Options.Moving = False
              Options.TabStop = False
              Properties.Caption = 'HL7/WLM - '#1089#1077#1088#1074#1077#1088
            end
            object rowPortSend: TcxEditorRow
              Properties.Caption = #1055#1086#1088#1090' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1089#1086#1086#1073#1097#1077#1085#1080#1081
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Enabled = False
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
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ClickKey = 13
              Properties.EditProperties.OnButtonClick = rowPortSendEditPropertiesButtonClick
              Properties.EditProperties.OnChange = rowPortSendEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object rowPortRec: TcxEditorRow
              Properties.Caption = #1055#1086#1088#1090' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1089#1086#1086#1073#1097#1077#1085#1080#1081
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Enabled = False
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
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ClickKey = 13
              Properties.EditProperties.OnButtonClick = rowPortRecEditPropertiesButtonClick
              Properties.EditProperties.OnChange = rowPortRecEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object rowIPHL7: TcxEditorRow
              Properties.Caption = 'IP-'#1072#1076#1088#1077#1089' HL7/WLM-'#1089#1077#1088#1074#1077#1088#1072
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Enabled = False
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
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ClickKey = 13
              Properties.EditProperties.OnButtonClick = rowIPHL7EditPropertiesButtonClick
              Properties.EditProperties.OnChange = rowIPHL7EditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object catDopDicom: TcxCategoryRow
              Properties.Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
            end
            object rowCMOVE: TcxEditorRow
              Properties.Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' C-MOVE '#1076#1083#1103' '#1076#1086#1089#1090#1091#1087#1072' '#1082' '#1089#1085#1080#1084#1082#1072#1084
              Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.NullStyle = nssUnchecked
              Properties.EditProperties.ValueChecked = '-1'
              Properties.EditProperties.ValueUnchecked = '0'
              Properties.EditProperties.OnChange = rowCMOVEEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Value = Null
            end
            object rowLocalPort: TcxEditorRow
              Properties.Caption = #1051#1086#1082#1072#1083#1100#1085#1099#1081' '#1087#1086#1088#1090' '#1076#1083#1103' '#1086#1073#1088#1072#1090#1085#1086#1081' '#1089#1074#1103#1079#1080
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Enabled = False
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
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ClickKey = 13
              Properties.EditProperties.OnButtonClick = rowLocalPortEditPropertiesButtonClick
              Properties.EditProperties.OnChange = rowLocalPortEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
          end
        end
        object cxTabSheet5: TcxTabSheet
          Caption = 'WorkList-'#1089#1077#1088#1074#1077#1088
          ImageIndex = 1
          object vGrWL: TcxVerticalGrid
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 1074
            Height = 663
            Align = alClient
            OptionsView.RowHeaderWidth = 146
            TabOrder = 0
            object catWL: TcxCategoryRow
              Options.Focusing = False
              Options.Moving = False
              Options.TabStop = False
              Properties.Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' WL-'#1089#1077#1088#1074#1077#1088#1072
            end
            object rowWLInUse: TcxEditorRow
              Properties.Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' WorkList'
              Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.NullStyle = nssUnchecked
              Properties.EditProperties.ValueChecked = '-1'
              Properties.EditProperties.ValueUnchecked = '0'
              Properties.EditProperties.OnChange = rowWLInUseEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Value = Null
            end
            object rowPortWL: TcxEditorRow
              Properties.Caption = #1055#1086#1088#1090':'
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Enabled = False
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
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ClickKey = 13
              Properties.EditProperties.MaskKind = emkRegExprEx
              Properties.EditProperties.EditMask = '\d+'
              Properties.EditProperties.OnButtonClick = rowPortWLEditPropertiesButtonClick
              Properties.EditProperties.OnChange = rowPortWLEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
            object rowIPWL: TcxEditorRow
              Properties.Caption = 'IP-'#1072#1076#1088#1077#1089':'
              Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
              Properties.EditProperties.Buttons = <
                item
                  Default = True
                  Enabled = False
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
                  Kind = bkGlyph
                end>
              Properties.EditProperties.ClickKey = 13
              Properties.EditProperties.OnButtonClick = rowIPWLEditPropertiesButtonClick
              Properties.EditProperties.OnChange = rowIPWLEditPropertiesChange
              Properties.DataBinding.ValueType = 'String'
              Properties.Options.ShowEditButtons = eisbAlways
              Properties.Value = Null
            end
          end
        end
        object cxTabSheet6: TcxTabSheet
          Caption = #1063#1072#1089#1090#1080' '#1090#1077#1083#1072
          ImageIndex = 2
          object dxBarDockControl11: TdxBarDockControl
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 1074
            Height = 28
            Align = dalTop
            BarManager = dxBM
            SunkenBorder = True
            UseOwnSunkenBorder = True
          end
          object grBodyParts: TcxGrid
            AlignWithMargins = True
            Left = 3
            Top = 34
            Width = 1074
            Height = 632
            Margins.Top = 0
            Align = alClient
            TabOrder = 1
            LookAndFeel.Kind = lfFlat
            object tvBodyParts: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsBodyParts
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
                  Column = tvBodyName
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
              object tvBodyName: TcxGridDBColumn
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'FC_NAME'
              end
              object tvBodyPartsNameEng: TcxGridDBColumn
                Caption = #1040#1085#1075#1083#1080#1081#1089#1082#1080#1081' '#1101#1082#1074#1080#1074#1072#1083#1077#1085#1090
                DataBinding.FieldName = 'FC_NAME_ENG'
              end
            end
            object grBodyPartsLevel1: TcxGridLevel
              GridView = tvBodyParts
            end
          end
        end
      end
    end
    object cxKabs: TcxTabSheet
      Caption = #1050#1072#1073#1080#1085#1077#1090#1099
      ImageIndex = 7
      object grMRTKabs: TcxGrid
        AlignWithMargins = True
        Left = 0
        Top = 34
        Width = 1077
        Height = 189
        Margins.Left = 0
        Margins.Top = 0
        Align = alTop
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object tvMRTKabs: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsMrtKabs
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object tvMRTKabs_Name: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'KABNAME'
          end
        end
        object cxGridLevel3: TcxGridLevel
          GridView = tvMRTKabs
        end
      end
      object dxBarDockControl4: TdxBarDockControl
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 1077
        Height = 28
        Margins.Left = 0
        Align = dalTop
        BarManager = dxBM
        SunkenBorder = True
        UseOwnSunkenBorder = True
      end
      object dxBarDockControl6: TdxBarDockControl
        AlignWithMargins = True
        Left = 0
        Top = 229
        Width = 1077
        Height = 28
        Margins.Left = 0
        Align = dalTop
        BarManager = dxBM
        SunkenBorder = True
        UseOwnSunkenBorder = True
      end
      object grFluKabs: TcxGrid
        AlignWithMargins = True
        Left = 0
        Top = 260
        Width = 1077
        Height = 188
        Margins.Left = 0
        Margins.Top = 0
        Align = alClient
        TabOrder = 3
        LookAndFeel.Kind = lfFlat
        object tvFluKabs: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsFluKabs
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object TV_NAME: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'KABNAME'
            Width = 553
          end
          object TV_LITER: TcxGridDBColumn
            Caption = #1041#1091#1082#1074#1072
            DataBinding.FieldName = 'FC_LITER'
            Width = 94
          end
        end
        object cxGridLevel4: TcxGridLevel
          GridView = tvFluKabs
        end
      end
      object grCitoExtra: TcxGrid
        Left = 0
        Top = 493
        Width = 1080
        Height = 200
        Align = alBottom
        TabOrder = 4
        LookAndFeel.Kind = lfFlat
        object grdbtvCitoExtra: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsOtdelInCito
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object grdbtvCitoExtraFK_ID: TcxGridDBColumn
            DataBinding.FieldName = 'FK_ID'
            Visible = False
            VisibleForCustomization = False
          end
          object grdbtvCitoExtraFC_NAME: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_NAME'
            Width = 579
          end
          object grdbtvCitoExtraFC_SHORT: TcxGridDBColumn
            Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_SHORT'
            Width = 487
          end
        end
        object grlCitoExtra: TcxGridLevel
          GridView = grdbtvCitoExtra
        end
      end
      object bdcCitoExtra: TdxBarDockControl
        AlignWithMargins = True
        Left = 3
        Top = 462
        Width = 1074
        Height = 28
        Align = dalBottom
        BarManager = dxBM
        SunkenBorder = True
        UseOwnSunkenBorder = True
      end
      object cxSplitter2: TcxSplitter
        Left = 0
        Top = 451
        Width = 1080
        Height = 8
        AlignSplitter = salBottom
        Control = grFluKabs
      end
    end
    object cxApModal: TcxTabSheet
      Caption = #1040#1087#1087#1072#1088#1072#1090#1099', '#1084#1086#1076#1072#1083#1100#1085#1086#1089#1090#1080
      ImageIndex = 8
      object pcDicom: TcxPageControl
        Left = 0
        Top = 0
        Width = 1080
        Height = 693
        ActivePage = tsModality
        Align = alClient
        TabOrder = 0
        ClientRectBottom = 693
        ClientRectRight = 1080
        ClientRectTop = 24
        object tsApparats: TcxTabSheet
          Caption = #1040#1087#1087#1072#1088#1072#1090#1099
          ImageIndex = 0
          object paApparats: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 1074
            Height = 663
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object dxBarDockControl8: TdxBarDockControl
              AlignWithMargins = True
              Left = 0
              Top = 3
              Width = 1071
              Height = 28
              Margins.Left = 0
              Align = dalTop
              BarManager = dxBM
              SunkenBorder = True
              UseOwnSunkenBorder = True
            end
            object grAp: TcxGrid
              AlignWithMargins = True
              Left = 0
              Top = 34
              Width = 1071
              Height = 626
              Margins.Left = 0
              Margins.Top = 0
              Align = alClient
              PopupMenu = pmtvAp
              TabOrder = 1
              LookAndFeel.Kind = lfFlat
              object tvAp: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsAp
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Kind = skCount
                    Column = tvApName
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
                OptionsView.ColumnAutoWidth = True
                OptionsView.Footer = True
                OptionsView.GroupByBox = False
                OptionsView.Indicator = True
                object tvApName: TcxGridDBColumn
                  Caption = #1053#1072#1079#1074#1072#1085#1080#1077'('#1084#1072#1088#1082#1072', '#1084#1086#1076#1077#1083#1100')'
                  DataBinding.FieldName = 'FC_NAME'
                  Width = 242
                end
                object tvApAE: TcxGridDBColumn
                  Caption = 'AE Title'
                  DataBinding.FieldName = 'FC_AETITLE'
                  Width = 123
                end
                object tvApIP: TcxGridDBColumn
                  Caption = 'IP-'#1072#1076#1088#1077#1089
                  DataBinding.FieldName = 'FC_IP'
                  Width = 123
                end
                object tvApKab: TcxGridDBColumn
                  Caption = #1050#1072#1073#1080#1085#1077#1090
                  DataBinding.FieldName = 'FC_KAB'
                  Width = 151
                end
              end
              object grApLevel1: TcxGridLevel
                GridView = tvAp
              end
            end
          end
        end
        object tsModality: TcxTabSheet
          Caption = #1052#1086#1076#1072#1083#1100#1085#1086#1089#1090#1080
          ImageIndex = 1
          object Panel2: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 1074
            Height = 663
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel2'
            TabOrder = 0
            object dxBarDockControl9: TdxBarDockControl
              AlignWithMargins = True
              Left = 0
              Top = 3
              Width = 1071
              Height = 28
              Margins.Left = 0
              Align = dalTop
              BarManager = dxBM
              SunkenBorder = True
              UseOwnSunkenBorder = True
            end
            object grModal: TcxGrid
              AlignWithMargins = True
              Left = 0
              Top = 34
              Width = 1071
              Height = 626
              Margins.Left = 0
              Margins.Top = 0
              Align = alClient
              TabOrder = 1
              LookAndFeel.Kind = lfFlat
              object tvModal: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsModal
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Kind = skCount
                    Column = tvModalName
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
                OptionsView.ColumnAutoWidth = True
                OptionsView.Footer = True
                OptionsView.GroupByBox = False
                OptionsView.Indicator = True
                object tvModalName: TcxGridDBColumn
                  Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                  DataBinding.FieldName = 'FC_NAME'
                  Width = 242
                end
              end
              object cxGridLevel6: TcxGridLevel
                GridView = tvModal
              end
            end
          end
        end
        object cxMetodsModality: TcxTabSheet
          Caption = #1052#1077#1090#1086#1076#1080#1082#1080'/'#1084#1086#1076#1072#1083#1100#1085#1086#1089#1090#1100
          ImageIndex = 2
          OnShow = cxMetodsModalityShow
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 337
            Height = 669
            Align = alLeft
            TabOrder = 0
            object cxGrid3: TcxGrid
              Left = 1
              Top = 1
              Width = 335
              Height = 667
              Align = alClient
              TabOrder = 0
              object cxGrid3DBTableView1: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsTSMINI_GROUP
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsView.GroupByBox = False
                object VGROUPNAME: TcxGridDBColumn
                  Caption = #1043#1088#1091#1087#1087#1072
                  DataBinding.FieldName = 'FC_NAME'
                  Width = 308
                end
              end
              object cxGrid3Level1: TcxGridLevel
                GridView = cxGrid3DBTableView1
              end
            end
          end
          object cxSplitter1: TcxSplitter
            Left = 337
            Top = 0
            Width = 4
            Height = 669
            Control = Panel4
          end
          object Panel5: TPanel
            Left = 341
            Top = 0
            Width = 739
            Height = 669
            Align = alClient
            TabOrder = 2
            object cxGrid4: TcxGrid
              Left = 1
              Top = 42
              Width = 737
              Height = 626
              Align = alClient
              TabOrder = 0
              object cxGrid4DBTableView1: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = DataSource1
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsView.GroupByBox = False
                object cxGrid4DBTableView1FC_NAME: TcxGridDBColumn
                  Caption = #1053#1080#1084#1072#1085#1086#1074#1072#1085#1080#1077' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
                  DataBinding.FieldName = 'FC_NAME'
                  Width = 408
                end
                object cxGrid4DBTableView1FC_MOD_NAME: TcxGridDBColumn
                  Caption = #1052#1086#1076#1072#1083#1100#1085#1086#1089#1090#1100
                  DataBinding.FieldName = 'FC_MOD_NAME'
                  Width = 93
                end
              end
              object cxGrid4Level1: TcxGridLevel
                GridView = cxGrid4DBTableView1
              end
            end
            object Panel6: TPanel
              Left = 1
              Top = 1
              Width = 737
              Height = 41
              Align = alTop
              TabOrder = 1
              object Label1: TLabel
                Left = 16
                Top = 16
                Width = 68
                Height = 13
                Caption = #1052#1086#1076#1072#1083#1100#1085#1086#1089#1090#1100
              end
              object edMOD: TEdit
                Left = 96
                Top = 11
                Width = 41
                Height = 21
                TabOrder = 0
              end
              object Button1: TButton
                Left = 143
                Top = 9
                Width = 75
                Height = 25
                Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
                TabOrder = 1
                OnClick = Button1Click
              end
            end
          end
        end
      end
    end
    object tsKontrast: TcxTabSheet
      Caption = #1052#1077#1090#1086#1076#1080#1082#1080' '#1080' '#1082#1086#1085#1090#1088#1072#1089#1090
      ImageIndex = 9
      object dxBarDockControl10: TdxBarDockControl
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 1077
        Height = 28
        Margins.Left = 0
        Align = dalTop
        BarManager = dxBM
        SunkenBorder = True
        UseOwnSunkenBorder = True
      end
      object grListMK: TcxGrid
        AlignWithMargins = True
        Left = 0
        Top = 34
        Width = 1077
        Height = 656
        Margins.Left = 0
        Margins.Top = 0
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfFlat
        object tvListMK: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsListMK
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = tvListMKName
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
          object tvListMKName: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FC_NAME'
          end
          object tvListMKID: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'FK_SMID'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object grListMKLevel1: TcxGridLevel
          GridView = tvListMK
        end
      end
    end
  end
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1265
    Height = 28
    Align = dalTop
    BarManager = dxBM
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object tvTree: TcxTreeView
    AlignWithMargins = True
    Left = 3
    Top = 34
    Width = 185
    Height = 714
    Margins.Top = 0
    Align = alLeft
    ParentShowHint = False
    ShowHint = True
    Style.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 6
    Items.NodeData = {
      010B00000023000000000000000000000000000000FFFFFFFF00000000000000
      00051E04310449043504350443000000000000000100000001000000FFFFFFFF
      00000000000000001517043D043004470435043D0438044F0420003F043E0420
      0043043C043E043B04470430043D0438044E0429000000000000000200000002
      000000FFFFFFFF0000000000000000081F0440043E0442043E043A043E043B04
      31000000000000000300000003000000FFFFFFFF00000000000000000C24043B
      044E043E0440043E04330440043004440438044F042D00000000000000040000
      0004000000FFFFFFFF00000000000000000A2004350430043D0438043C043004
      460438044F0433000000000000000500000005000000FFFFFFFF000000000000
      00000D1F043504400438043E043404380447043D043E04410442044C04250000
      00000000000600000006000000FFFFFFFF00000000000000000614043E044104
      420443043F0423000000000000000700000007000000FFFFFFFF000000000000
      0000054400690063006F006D0029000000000000000800000008000000FFFFFF
      FF0000000000000000081A043004310438043D04350442044B04430000000000
      00000900000009000000FFFFFFFF00000000000000001510043F043F04300440
      04300442044B042C0020003C043E04340430043B044C043D043E044104420438
      0443000000000000000A0000000A000000FFFFFFFF0000000000000000151C04
      350442043E04340438043A0438042000410420003A043E043D04420440043004
      410442043E043C04}
    RowSelect = True
    OnChange = tvTreeChange
  end
  object dxBM: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default'
      'CitoExtra')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    DockColor = clBtnFace
    ImageOptions.Images = ilMain
    LookAndFeel.Kind = lfFlat
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 1080
    Top = 160
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBMBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Main'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 228
      FloatTop = 112
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
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
    object dxBMBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Reanim'
      CaptionButtons = <>
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 349
      FloatTop = 128
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbAddReanim'
        end
        item
          Visible = True
          ItemName = 'bbDelReanim'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBMBar4: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Period'
      CaptionButtons = <>
      DockControl = dxBarDockControl3
      DockedDockControl = dxBarDockControl3
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 292
      FloatTop = 141
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbAddPeriod'
        end
        item
          Visible = True
          ItemName = 'bbEditPeriod'
        end
        item
          Visible = True
          ItemName = 'bbDelPeriod'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefresh'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBMBar5: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Access'
      CaptionButtons = <>
      DockControl = dxBarDockControl5
      DockedDockControl = dxBarDockControl5
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1298
      FloatTop = 10
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbAddAccess'
        end
        item
          Visible = True
          ItemName = 'bbDelAccess'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBMBar3: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'MRTKabs'
      CaptionButtons = <>
      DockControl = dxBarDockControl4
      DockedDockControl = dxBarDockControl4
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1294
      FloatTop = 10
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
          ItemName = 'bbAddMrt'
        end
        item
          Visible = True
          ItemName = 'bbDelMrt'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBMBar6: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'FluKabs'
      CaptionButtons = <>
      DockControl = dxBarDockControl6
      DockedDockControl = dxBarDockControl6
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1294
      FloatTop = 10
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
          ItemName = 'bbAddFlu'
        end
        item
          Visible = True
          ItemName = 'bbDelFlu'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbLiter'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBMBar7: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Metodics_for_Flu'
      CaptionButtons = <>
      DockControl = dxBarDockControl7
      DockedDockControl = dxBarDockControl7
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1294
      FloatTop = 10
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
          ItemName = 'bbAddMetod'
        end
        item
          Visible = True
          ItemName = 'bbDelMetod'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBMBar8: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'DicomApparats'
      CaptionButtons = <>
      DockControl = dxBarDockControl8
      DockedDockControl = dxBarDockControl8
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1294
      FloatTop = 10
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbAddAp'
        end
        item
          Visible = True
          ItemName = 'bbEditAp'
        end
        item
          Visible = True
          ItemName = 'bbDelAp'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefreshAp'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbExcel'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBMBar9: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Modality'
      CaptionButtons = <>
      DockControl = dxBarDockControl9
      DockedDockControl = dxBarDockControl9
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1294
      FloatTop = 10
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbAddModal'
        end
        item
          Visible = True
          ItemName = 'bbEditModal'
        end
        item
          Visible = True
          ItemName = 'bbDelModal'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefModal'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBMBar10: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'MetodsKontrast'
      CaptionButtons = <>
      DockControl = dxBarDockControl10
      DockedDockControl = dxBarDockControl10
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1384
      FloatTop = 10
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbAddMK'
        end
        item
          Visible = True
          ItemName = 'bbDelMK'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefMK'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBMBar11: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'BodyParts'
      CaptionButtons = <>
      DockControl = dxBarDockControl11
      DockedDockControl = dxBarDockControl11
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1384
      FloatTop = 10
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbAddBody'
        end
        item
          Visible = True
          ItemName = 'bbEditBody'
        end
        item
          Visible = True
          ItemName = 'bbDelBody'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefreshBody'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbExportBody'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBMBar12: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'SpecialEdit'
      CaptionButtons = <>
      DockControl = dxBarDockControl12
      DockedDockControl = dxBarDockControl12
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1384
      FloatTop = 10
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cxBarEditItem4'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbAddEdit'
        end
        item
          Visible = True
          ItemName = 'bbEditEdit'
        end
        item
          Visible = True
          ItemName = 'bbDelEdit'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbRefEdit'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object brCitoExtra: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'CitoExtra'
      CaptionButtons = <>
      DockControl = bdcCitoExtra
      DockedDockControl = bdcCitoExtra
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1305
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cxBarEditItem5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbAddOtdelCito'
        end
        item
          Visible = True
          ItemName = 'bbDelOtdelCito'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object bbClose: TdxBarButton
      Action = actClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbAddReanim: TdxBarButton
      Action = actAddReanim
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDelReanim: TdxBarButton
      Action = actDelReanim
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbAddPeriod: TdxBarButton
      Action = aAddPeriod
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEditPeriod: TdxBarButton
      Action = aEditPeriod
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDelPeriod: TdxBarButton
      Action = aDelPeriod
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefresh: TdxBarButton
      Action = aRefreshPeriod
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbAddAccess: TdxBarButton
      Action = aAddAccess
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDelAccess: TdxBarButton
      Action = aDelAccess
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object cxBarEditItem1: TcxBarEditItem
      Caption = #1052#1056#1058' '#1082#1072#1073#1080#1085#1077#1090#1099
      Category = 0
      Hint = #1052#1056#1058' '#1082#1072#1073#1080#1085#1077#1090#1099
      Style = stBold
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
      StyleEdit = stBold
    end
    object bbAddMrt: TdxBarButton
      Action = aAddMrt
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDelMrt: TdxBarButton
      Action = aDelMrt
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object cxBarEditItem2: TcxBarEditItem
      Caption = #1060#1083#1102#1086#1088#1086' '#1082#1072#1073#1080#1085#1077#1090#1099
      Category = 0
      Hint = #1060#1083#1102#1086#1088#1086' '#1082#1072#1073#1080#1085#1077#1090#1099
      Style = stBold
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
      StyleEdit = stBold
    end
    object bbAddFlu: TdxBarButton
      Action = aAddFlu
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDelFlu: TdxBarButton
      Action = aDelFlu
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbAddMetod: TdxBarButton
      Action = aAddMet
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDelMetod: TdxBarButton
      Action = aDelMet
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object cxBarEditItem3: TcxBarEditItem
      Caption = #1052#1077#1090#1086#1076#1080#1082#1080' '#1076#1083#1103' '#1079#1072#1095#1080#1090#1099#1074#1072#1085#1080#1103' '#1060#1043
      Category = 0
      Hint = #1052#1077#1090#1086#1076#1080#1082#1080' '#1076#1083#1103' '#1079#1072#1095#1080#1090#1099#1074#1072#1085#1080#1103' '#1060#1043
      Style = stBold
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
      StyleEdit = stBold
    end
    object bbLiter: TdxBarButton
      Action = aSetLiter
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbAddAp: TdxBarButton
      Action = aAddAp
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEditAp: TdxBarButton
      Action = aEditAp
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDelAp: TdxBarButton
      Action = aDelAp
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefreshAp: TdxBarButton
      Action = aRefreshAp
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbExcel: TdxBarButton
      Action = aXLS
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbAddModal: TdxBarButton
      Action = aAddModal
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEditModal: TdxBarButton
      Action = aEditModal
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDelModal: TdxBarButton
      Action = aDelModal
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefModal: TdxBarButton
      Action = aRefModal
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbAddMK: TdxBarButton
      Action = aAddMK
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDelMK: TdxBarButton
      Action = aDelMK
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefMK: TdxBarButton
      Action = aRefMK
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbAddBody: TdxBarButton
      Action = aAddBody
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEditBody: TdxBarButton
      Action = aEditBody
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDelBody: TdxBarButton
      Action = aDelBody
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefreshBody: TdxBarButton
      Action = aRefreshBody
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbExportBody: TdxBarButton
      Action = aExcelBody
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object cxBarEditItem4: TcxBarEditItem
      Caption = #1054#1089#1086#1073#1099#1077' '#1091#1089#1083#1086#1074#1080#1103' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103
      Category = 0
      Hint = #1054#1089#1086#1073#1099#1077' '#1091#1089#1083#1086#1074#1080#1103' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103
      Style = stBold
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
      StyleEdit = stBold
    end
    object bbAddEdit: TdxBarButton
      Action = aAddEdit
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbEditEdit: TdxBarButton
      Action = aEditEdit
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbDelEdit: TdxBarButton
      Action = aDelEdit
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbRefEdit: TdxBarButton
      Action = aRefEdit
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object cxBarEditItem5: TcxBarEditItem
      Caption = #1069#1082#1089#1090#1088#1077#1085#1085#1086
      Category = 1
      Hint = #1069#1082#1089#1090#1088#1077#1085#1085#1086
      Style = stBold
      Visible = ivAlways
      Width = 100
      PropertiesClassName = 'TcxLabelProperties'
      StyleEdit = stBold
    end
    object bbAddOtdelCito: TdxBarButton
      Action = aAddOtdelCito
      Category = 1
      PaintStyle = psCaptionGlyph
    end
    object bbDelOtdelCito: TdxBarButton
      Action = aDelOtdelCito
      Category = 1
      PaintStyle = psCaptionGlyph
    end
  end
  object actlstMain: TActionList
    Images = ilMain
    Left = 1120
    Top = 160
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1077
      ImageIndex = 0
      ShortCut = 32883
      OnExecute = actCloseExecute
    end
    object actAddReanim: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1077#1072#1085#1080#1084#1072#1094#1080#1086#1085#1085#1086#1077' '#1086#1090#1076#1077#1083#1077#1085#1080#1077' '#1074' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 4
      OnExecute = actAddReanimExecute
    end
    object actDelReanim: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1088#1077#1072#1085#1080#1084#1072#1094#1080#1086#1085#1085#1086#1077' '#1086#1090#1076#1077#1083#1077#1085#1080#1077' '#1080#1079' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 3
      OnExecute = actDelReanimExecute
    end
    object aAddPeriod: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1080#1076' '#1087#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1080' '#1087#1088#1086#1093#1086#1078#1076#1077#1085#1080#1103' '#1092#1083#1102#1086#1088#1086#1075#1088#1072#1092#1080#1080
      ImageIndex = 4
      OnExecute = aAddPeriodExecute
    end
    object aEditPeriod: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1080#1076' '#1087#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1080' '#1087#1088#1086#1093#1086#1078#1076#1077#1085#1080#1103' '#1092#1083#1102#1086#1088#1086#1075#1088#1072#1092#1080#1080
      ImageIndex = 5
      OnExecute = aEditPeriodExecute
    end
    object aDelPeriod: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1080#1076' '#1087#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1080' '#1087#1088#1086#1093#1086#1078#1076#1077#1085#1080#1103' '#1092#1083#1102#1086#1088#1086#1075#1088#1072#1092#1080#1080
      ImageIndex = 3
      OnExecute = aDelPeriodExecute
    end
    object aRefreshPeriod: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 6
      OnExecute = aRefreshPeriodExecute
    end
    object aAddAccess: TAction
      Category = 'Dostup'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1074' '#1089#1087#1080#1089#1086#1082' "'#1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1099'"'
      ImageIndex = 4
      OnExecute = aAddAccessExecute
    end
    object aDelAccess: TAction
      Category = 'Dostup'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1080#1079' '#1089#1087#1080#1089#1082#1072' "'#1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1099'"'
      ImageIndex = 3
      OnExecute = aDelAccessExecute
    end
    object aAddMrt: TAction
      Category = 'Kabinets'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1052#1056#1058' '#1082#1072#1073#1080#1085#1077#1090' '#1074' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 4
      OnExecute = aAddMrtExecute
    end
    object aDelMrt: TAction
      Category = 'Kabinets'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1052#1056#1058' '#1082#1072#1073#1080#1085#1077#1090' '#1080#1079' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 3
      OnExecute = aDelMrtExecute
    end
    object aAddFlu: TAction
      Category = 'Kabinets'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1083#1102#1086#1088#1086'-'#1082#1072#1073#1080#1085#1077#1090' '#1074' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 4
      OnExecute = aAddFluExecute
    end
    object aDelFlu: TAction
      Category = 'Kabinets'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1083#1102#1086#1088#1086'-'#1082#1072#1073#1080#1085#1077#1090' '#1080#1079' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 3
      OnExecute = aDelFluExecute
    end
    object aAddMet: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1077#1090#1086#1076#1080#1082#1091' '#1074' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 4
      OnExecute = aAddMetExecute
    end
    object aDelMet: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1084#1077#1090#1086#1076#1080#1082#1091' '#1080#1079' '#1089#1087#1080#1089#1082#1072
      ImageIndex = 3
      OnExecute = aDelMetExecute
    end
    object aSetLiter: TAction
      Category = 'Kabinets'
      Caption = #1041#1091#1082#1074#1072
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1073#1091#1082#1074#1091' '#1076#1083#1103' '#1060#1043' '#1082#1072#1073#1080#1085#1077#1090#1072' '#1076#1083#1103' '#1085#1091#1084#1077#1088#1072#1094#1080#1080' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1081
      ImageIndex = 5
      OnExecute = aSetLiterExecute
    end
    object aAddAp: TAction
      Category = 'Apparats'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1087#1087#1072#1088#1072#1090
      ImageIndex = 4
      OnExecute = aAddApExecute
    end
    object aEditAp: TAction
      Category = 'Apparats'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1072#1087#1087#1072#1088#1072#1090
      ImageIndex = 7
      OnExecute = aEditApExecute
    end
    object aDelAp: TAction
      Category = 'Apparats'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1072#1087#1087#1072#1088#1072#1090
      ImageIndex = 3
      OnExecute = aDelApExecute
    end
    object aRefreshAp: TAction
      Category = 'Apparats'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1072#1087#1087#1072#1088#1072#1090#1086#1074
      ImageIndex = 6
      OnExecute = aRefreshApExecute
    end
    object aXLS: TAction
      Category = 'Apparats'
      Caption = #1074' Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      ImageIndex = 12
      OnExecute = aXLSExecute
    end
    object aAddModal: TAction
      Category = 'Modality'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1086#1076#1072#1083#1100#1085#1086#1089#1090#1100
      ImageIndex = 4
      OnExecute = aAddModalExecute
    end
    object aEditModal: TAction
      Category = 'Modality'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1084#1086#1076#1072#1083#1100#1085#1086#1089#1090#1100
      ImageIndex = 7
      OnExecute = aEditModalExecute
    end
    object aDelModal: TAction
      Category = 'Modality'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1084#1086#1076#1072#1083#1100#1085#1086#1089#1090#1100
      ImageIndex = 3
      OnExecute = aDelModalExecute
    end
    object aRefModal: TAction
      Category = 'Modality'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1084#1086#1076#1072#1083#1100#1085#1086#1089#1090#1077#1081
      ImageIndex = 6
      OnExecute = aRefModalExecute
    end
    object aAddMK: TAction
      Category = 'MetodsKontrast'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1077#1090#1086#1076#1080#1082#1080', '#1089#1074#1103#1079#1072#1085#1085#1099#1077' '#1089' '#1082#1086#1085#1090#1088#1072#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077#1084
      ImageIndex = 4
      OnExecute = aAddMKExecute
    end
    object aDelMK: TAction
      Category = 'MetodsKontrast'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = aDelMKExecute
    end
    object aRefMK: TAction
      Category = 'MetodsKontrast'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 6
      OnExecute = aRefMKExecute
    end
    object aAddBody: TAction
      Category = 'BodyParts'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 4
      OnExecute = aAddBodyExecute
    end
    object aEditBody: TAction
      Category = 'BodyParts'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 5
      OnExecute = aEditBodyExecute
    end
    object aDelBody: TAction
      Category = 'BodyParts'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = aDelBodyExecute
    end
    object aRefreshBody: TAction
      Category = 'BodyParts'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 6
      OnExecute = aRefreshBodyExecute
    end
    object aExcelBody: TAction
      Category = 'BodyParts'
      Caption = #1069#1082#1089#1087#1086#1088#1090
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      ImageIndex = 12
      OnExecute = aExcelBodyExecute
    end
    object aAddEdit: TAction
      Category = 'SpecialEdit'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 4
      OnExecute = aAddEditExecute
    end
    object aDelEdit: TAction
      Category = 'SpecialEdit'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = aDelEditExecute
    end
    object aEditEdit: TAction
      Category = 'SpecialEdit'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 7
      OnExecute = aEditEditExecute
    end
    object aRefEdit: TAction
      Category = 'SpecialEdit'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 6
      OnExecute = aRefEditExecute
    end
    object aAddOtdelCito: TAction
      Category = 'Cito'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 4
      OnExecute = aAddOtdelCitoExecute
    end
    object aDelOtdelCito: TAction
      Category = 'Cito'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = aDelOtdelCitoExecute
    end
  end
  object ilMain: TImageList
    Left = 1048
    Top = 160
    Bitmap = {
      494C01010E00AC00B00010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000848484000000FF0084848400000000000000
      0000848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF00008400000084
      0000008400000084000000840000008400000084000000840000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF00008400000084
      000000840000C6C6C60000840000008400000084000000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF00FFFFFF000084
      0000C6C6C600008400000084000000840000FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF0000840000C6C6
      C600008400000084000000840000FFFFFF00FFFFFF0000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF00C6C6C6000084
      000000840000008400000084000000840000FFFFFF0000840000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF00008400000084
      0000FFFFFF00FFFFFF000084000000840000FFFFFF0000840000C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000FFFFFF00FFFF
      FF0084848400FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
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
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084848400848484008484840084848400C6C6C6000000
      00000000000000000000000000000000000000000000838582007A7B79007071
      6F006C6D6B005151510000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE8400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084848400008400000084000084848400C6C6C6000000
      00000000000000000000000000000000000000000000878A8600878A86000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008484840084848400FFCE8400FF0000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      000000000000C6C6C60084848400008400000084000084848400C6C6C6000000
      0000000000000000000000000000000000000000000000000000A0C6DC004472
      9D0020416B000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FF00
      0000FF000000FF000000FF000000FF000000FF00000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000C6C6C60084848400008400000084000084848400C6C6C6000000
      00000000000000000000000000000000000000000000000000006F9BC0006F9B
      C00043729D005A86970000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFDEAD00FF000000FF00
      0000FFCE8400FFCE8400FF000000FF000000FF000000FF000000848484000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400008400000084000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000007DE3
      FC002FD4FD0039B5D8005A869700000000000000000000000000000000000000
      000000000000000000000000000000000000FFDEAD00FF000000FF000000FF00
      00000000000000000000FFCE8400FF000000FF00000084848400000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60084848400848484008484
      8400848484008484840084848400008400000084000084848400848484008484
      8400848484008484840084848400C6C6C60000000000000000000000000039B5
      D8002FD4FD002FD4FD0039B5D8005A8697000000000000000000000000000000
      000000000000000000000000000000000000FFDEAD00FF000000848484000000
      00000000000000000000FFCE8400FF000000848484000000000000000000FF00
      0000848484000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000C6C6C6000000000000000000000000000000
      0000000000002FD4FD002FD4FD0039B5D800229BC10000000000000000000000
      000000000000000000000000000000000000FFDEAD00FF000000848484000000
      00000000000000000000FFCE840084848400000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000848484000000000000FF000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      000000840000008400000084000000FF00000000000000000000000000000000
      00000000000039B5D8007DE3FC0014CDFD0039B5D8005A869700000000000000
      000000000000000000000000000000000000FFDEAD00FF000000848484000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000848484000000000000FF000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      000000840000008400000084000000FF00000000000000000000000000000000
      0000000000000000000039B5D8007DE3FC002FD4FD0039B5D8005A8697000000
      000000000000000000000000000000000000FFDEAD00FF000000848484000000
      00000000000000000000FF00000084848400000000000000000000000000FFCE
      8400FF0000008484840000000000000000000000000000000000FFFFFF009936
      2F0099362F0099362F0099362F0099362F0099362F0099362F0099362F009936
      2F00FFFFFF0000000000848484000000000000FF000000FF000000FF000000FF
      000000FF000000FF00000084000000840000008400000084000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      000000000000000000000000000039B5D8002FD4FD002FD4FD0039B5D8005A86
      97000000000000000000000000000000000000000000FFA5A500FF0000000000
      000000000000FF000000FF000000848484000000000000000000FF000000FF00
      0000848484000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      00000000000000FF00000084000000840000008400000084000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002FD4FD00ABCAD3008989
      8900636364000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000848484008484840084848400FF000000FF00
      0000848484000000000000000000000000000000000000000000FFFFFF009936
      2F0099362F0099362F0099362F0099362F0099362F0099362F00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      00000000000000FF00000084000000840000008400000084000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039B5D800D0D6D700B9B8
      B90071727E00110875000000000000000000000000000000000000000000FFCE
      8400FF000000FF000000FF000000FF000000FF000000FF000000FF0000008484
      8400000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      00000000000000FF00000084000000840000008400000084000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B0AFAF007E99
      DC00455FC400212D9A0000000000000000000000000000000000000000000000
      0000FFCE8400FF000000FF000000FFCE8400FFCE8400FFCE8400000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000084848400000000000000000000000000000000000000
      00000000000000FF00000084000000840000008400000084000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000455F
      C400708AD5000000000000000000000000000000000000000000000000000000
      000000000000FFCE8400FF000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE8400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000043E9000043E9000043E9000043E9000043E9000043E90000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B009C4B4C00B64B4C009F4B4C004E1E1F0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000034B
      B400034BB4000C5DCF004586CF006392C7005E8CBF003D73B40008479F00003A
      9900043E90000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000824B4B009A4D
      4E00AF4E4F00C04D4E00BF4C4D009F4B4C004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000034BB400045B
      DE0077B1F000F6F4F600D9E6F000B7D3F000B5D0EE00CFDAE600DED9D5005580
      B0000141A400043E900000000000000000000000000000000000000000000000
      0000000000000000000000000000008000000080000000800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000824B4B00CC57
      5800CB565700C9545500C7535400A34E4F004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B000000000000000000034BB400045BDE009ECA
      F800FEFEFF00599EEF001069E500025CE200025CE2001069E5005CA0EF00F8F4
      EF00809EBC000141A400043E9000000000000000000000000000000000000000
      0000000000000000000000800000008000000080000000800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000824B4B00D05A
      5B00CF595A00CC575800CB565700A55050004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B000000000000000000034BB4007AB5F600FEFE
      FF00287BE700025CE2000055E000025CE2000055E000025CE2000055E0003688
      ED00F8FAF6005E8CBF00043E9000000000000000000000000000000000000000
      0000000000000080000000800000008000000080000000800000008000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000824B4B00D962
      6300D8606200D55E5F00D45D5E00A95354004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B00000000000F6ADE001169DE00FEFEFF00599E
      EF00025CE200E9F3FD0088BCF3000055E000025CE200C4DDF900C4DDF900025C
      E20064A6F200EEEAE700094FAF00043E90000000000000000000000000000000
      0000008000000080000000800000008000000000000000800000008000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000824B4B00DD65
      6600DC646500D9626300D8606200AB5555004E1E1F001EBC4C001EBC4C001EBC
      4C001EBC4C00F7B5B600824B4B00000000000F6ADE005DA5F200E6F2FD001674
      E7000565E500C4DDF900FEFEFF0088BCF300C4DDF900FEFEFF0088BCF3000055
      E0000D67E200E3EEF7004787D100043E90000000000000000000000000000080
      0000008000000080000000800000000000000000000000800000008000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000824B4B00E66C
      6D00E56B6C00EEA6A700FFFFFF00AF5859004E1E1F00B7EBAA005ED3770045CA
      670045CA6700F7B5B600824B4B00000000000F6ADE0088BCF300C6E1FA001176
      EA00096DE9001176EA00C9E2FB00FEFEFF00FEFEFF0088BCF300025CE2000055
      E000025CE200C4DDF90070A9E600043E90000000000000000000008000000080
      0000008000000080000000000000000000000000000000000000008000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000824B4B00EA6F
      7000E96E6F00F2A9AA00FFFFFF00B15A5A004E1E1F00FFFFD300FFFFD300FFFF
      D300D9F6BD00F7B5B600824B4B00000000000F6ADE0089C4F700C9E2FB001A82
      EE00117AED001A82EE00C9E2FB00FEFEFF00FEFEFF0088BCF3000055E000025C
      E2000055E000C4DDF9007AB5F600043E90000000000000000000008000000080
      0000008000000000000000000000000000000000000000000000008000000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000824B4B00F377
      7800F2767700EF747500EE737400B55D5D004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000F6ADE0076BDF900E9F3FD003599
      F3001E89F000C9E2FB00FEFEFF0096C7F700C6E1FA00FEFEFF0088BCF300004F
      E0001069E500E9F3FD00529EF400043E90000000000000000000008000000080
      0000000000000000000000000000000000000000000000000000000000000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000824B4B00F77A
      7B00F6797A00F3777800F2767700B75F5F004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B00000000000F6ADE003599F300FEFEFF007FC5
      FA002996F400EFF8FF009ECAF800117AED00117AED00C9E2FB00C4DDF900004F
      E00066A7EF00FEFEFF000D67E200043E90000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      0000008000000080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400000000000000000000000000000000000000000000000000824B4B00FF81
      8200FE808100FC7F8000FB7E7F00BB6363004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B0000000000000000000F6ADE00A5DDFD00FEFE
      FF005AB6F8002A99F4001E89F0001A82EE000B70E9000768E700025CE2003688
      ED00FEFEFF0070AFF400034BB400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008000000080000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000824B4B00FF81
      8200FF818200FF818200FE808100BD6565004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B0000000000000000000F6ADE0041AFFC00C5ED
      FF00FEFEFF0081C7FA003599F3001E89F000117AED001878E9005CA0EF00FEFE
      FF009ECAF800045BDE00034BB400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008000000080000000800000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000824B4B00AF5E
      5F00D56F7000FF818200FF818200BF6666004E1E1F00FFFFD300FFFFD300FFFF
      D300FFFFD300F7B5B600824B4B000000000000000000000000000F6ADE0045B4
      FE00A5DDFD00FEFEFF00E9F3FD00C9E2FB00C9E2FB00E6F2FD00FEFEFF0070AF
      F400045BDE00034BB40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000800000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000000000000000000000000000824B
      4B00824B4B00B6626300EE7A7B00BF6666004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000000000000F6A
      DE001169DE003AA0F60076BDF9008EC7F80087C0F6005DA5F2000F6AE000034B
      B400034BB4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000F6ADE000F6ADE000F6ADE000F6ADE000F6ADE000F6ADE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00E000C00F00000000E000C00700000000
      E000800300000000E000BFF3000000000000BFF3000000000000BE3100000000
      000080010000000000008001000000000000C001000000000000E00100000000
      0000F003000000000000F00F000000000000F00F000000000001F00F00000000
      E003F00700000000E007F80700000000C001800FFFFFFFFE80310007E0010002
      80310007E001000280310007C001000280010007A00100028001000700010002
      80010007000100028FF10007000100028FF10007800100028C71000780010002
      8C710007C00100028C710007E001000289350007E001001E81810007E0030000
      E18F800FE0070000E00FD55FE00F0000F81FFFFFFFFFFFFFF81F83FFFC7FFFFF
      F81F9FFFE03FC001F81FC7FFC01F8001F81FC3FF801F80010000E1FF0C3F8001
      0000E0FF1C6780010000F87F1CE380010000F83F1FE380010000FC1F1CE38001
      0000FE0F98C78001F81FFF87F0078001F81FFF83E00F8001F81FFFC3F03F8001
      F81FFFE7F8FF8001F81FFFFFFCFF8003FE7FF81FFFFFFFFFE07FE007FF7FC007
      C001C003FE3FDE07C0018001FC3FD407C0018001F81FD407C0010000F09FD407
      C0010000E18FD407C0010000C3CFD407C0010000C7C7D407C0010000CFE7D507
      C0010000FFE3DF87C0018001FFF3C007C0018001FFF1DF07C001C003FFF9C007
      E001E007FFF9FC7FFE7FF81FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object osMain: TOracleSession
    AfterLogOn = osMainAfterLogOn
    DesignConnection = True
    LogonUsername = 'system'
    LogonPassword = 'sys123'
    LogonDatabase = 'ASU'
    Left = 1168
    Top = 162
  end
  object odsTarget: TOracleDataSet
    SQL.Strings = (
      'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FN_ORDER'
      'FROM DUAL'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FN_ORDER '
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'I' +
        'SSL_TARGET'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = osMain
    Left = 1081
    Top = 587
  end
  object dsTarget: TDataSource
    DataSet = odsTarget
    Left = 1138
    Top = 587
  end
  object odsUrgent: TOracleDataSet
    SQL.Strings = (
      
        'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FN_ORDER, -1 AS FK_DEFAUL' +
        'T'
      'FROM DUAL'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FN_ORDER, FK_DEFAULT '
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'NAZN_TYPES'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = osMain
    Left = 1130
    Top = 98
  end
  object dsUrgent: TDataSource
    DataSet = odsUrgent
    Left = 1186
    Top = 99
  end
  object odsVidOplat: TOracleDataSet
    SQL.Strings = (
      'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FN_ORDER'
      'FROM DUAL'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FN_ORDER '
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'A' +
        'MBTALON_OPL'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = osMain
    Left = 1074
    Top = 395
  end
  object dsVidOplat: TDataSource
    DataSet = odsVidOplat
    Left = 1138
    Top = 395
  end
  object odsRegPrin: TOracleDataSet
    SQL.Strings = (
      
        'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME, '#39#39' AS FC_SYNONIM, 0 AS FK_OWNE' +
        'R, 0 AS FN_ORDER, 0 AS FL_DEL, -1 AS FK_DEFAULT'
      '  FROM DUAL'
      ''
      'UNION ALL'
      ''
      
        'SELECT FK_ID, FC_NAME, FC_SYNONIM, FK_OWNER, FN_ORDER, FL_DEL, F' +
        'K_DEFAULT  '
      '  FROM ASU.TSMID '
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'PD_MZ'#39')'
      '   AND FL_SHOWPRINT = 1 '
      '   AND FL_DEL = 0'
      ''
      'ORDER BY FN_ORDER   ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000600000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000A00000046435F53594E4F4E494D01000000000008000000
      464B5F4F574E455201000000000008000000464E5F4F52444552010000000000
      06000000464C5F44454C010000000000}
    Session = osMain
    Left = 998
    Top = 153
  end
  object dsRegPrin: TDataSource
    DataSet = odsRegPrin
    Left = 1072
    Top = 97
  end
  object odsPriem: TOracleDataSet
    SQL.Strings = (
      
        'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FN_ORDER, -1 AS FK_DEFAUL' +
        'T'
      'FROM DUAL'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FN_ORDER, FK_DEFAULT '
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'XRAY_PRIEM'#39')'
      '   AND FL_SHOWPRINT = 1'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = osMain
    Left = 1081
    Top = 542
  end
  object dsPriem: TDataSource
    DataSet = odsPriem
    Left = 1137
    Top = 542
  end
  object odsApparat: TOracleDataSet
    SQL.Strings = (
      
        'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FN_ORDER, -1 AS FK_DEFAUL' +
        'T'
      'FROM DUAL'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FN_ORDER, FK_DEFAULT '
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'XRAY_APPARAT'#39')'
      '   AND FL_SHOWPRINT = 1'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = osMain
    Left = 1080
    Top = 635
  end
  object dsApparat: TDataSource
    DataSet = odsApparat
    Left = 1136
    Top = 635
  end
  object dsReanim: TDataSource
    DataSet = odsReanim
    Left = 1136
    Top = 490
  end
  object odsReanim: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, '
      '       FC_SECTION, '
      '       FC_KEY, '
      '       FC_VALUE, '
      
        '       (SELECT FC_NAME FROM TOTDEL WHERE FK_ID = TSMINI.FC_VALUE' +
        ') AS NAMEOTDEL'
      ' FROM TSMINI'
      'WHERE FC_SECTION = '#39'XRAY'#39
      '  AND FC_KEY LIKE '#39#1056#1045#1040#1053#1048#1052#1040#1062#1048#1054#1053#1053#1054#1045'_'#1054#1058#1044#1045#1051#1045#1053#1048#1045'%'#39)
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000A00000046435F5345
      4354494F4E0100000000000600000046435F4B45590100000000000800000046
      435F56414C5545010000000000090000004E414D454F5444454C010000000000}
    Session = osMain
    Left = 1080
    Top = 490
  end
  object odsCompDog: TOracleDataSet
    SQL.Strings = (
      
        'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FN_ORDER, -1 AS FK_DEFAUL' +
        'T'
      'FROM DUAL'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FN_ORDER, FK_DEFAULT '
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'XRAY_COMPANY_DOGOVOR'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = osMain
    Left = 1074
    Top = 443
  end
  object dsCompDog: TDataSource
    DataSet = odsCompDog
    Left = 1138
    Top = 443
  end
  object odsPeriod: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER, FK_DEFAULT '
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'XRAY_PERIOD_OSMOTROV'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = osMain
    Left = 1081
    Top = 235
  end
  object dsPeriod: TDataSource
    DataSet = odsPeriod
    Left = 1137
    Top = 235
  end
  object odsPeriodSpisok: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER, FN_NORM0, FN_NORM1 '
      '  FROM TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = '#39'X' +
        'RAY_PERIOD_OSMOTROV'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F5244455201000000000008000000464E
      5F4E4F524D3001000000000008000000464E5F4E4F524D31010000000000}
    Cursor = crSQLWait
    Session = osMain
    Left = 1081
    Top = 339
  end
  object dsPeriodSpisok: TDataSource
    DataSet = odsPeriodSpisok
    Left = 1137
    Top = 339
  end
  object dsAccess: TDataSource
    DataSet = odsAccess
    Left = 1136
    Top = 290
  end
  object odsAccess: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, '
      '       FC_SECTION, '
      '       FC_KEY, '
      '       FC_VALUE,'
      '       ASU.DO_VRACHFIO(FC_VALUE) AS FIO'
      '  FROM ASU.TSMINI'
      ' WHERE FC_SECTION = '#39'XRAY'#39
      '   AND FC_KEY LIKE '#39#1055#1056#1040#1042#1040'_'#1040#1044#1052#1048#1053#1048#1057#1058#1056#1040#1058#1054#1056#1040'%'#39)
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000A00000046435F5345
      4354494F4E0100000000000600000046435F4B45590100000000000800000046
      435F56414C55450100000000000300000046494F010000000000}
    Session = osMain
    Left = 1080
    Top = 290
  end
  object odsMrtkabs: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, '
      '       FC_SECTION, '
      '       FC_KEY, '
      '       FC_VALUE,'
      
        '       (SELECT FC_NAME FROM ASU.TKABINET WHERE FK_ID = TSMINI.FC' +
        '_VALUE) as KABNAME'
      '  FROM ASU.TSMINI'
      ' WHERE FC_SECTION = '#39'XRAY'#39
      '   AND FC_KEY LIKE '#39#1052#1056#1058'_'#1050#1040#1041#1048#1053#1045#1058#1067'%'#39)
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000A00000046435F5345
      4354494F4E0100000000000600000046435F4B45590100000000000800000046
      435F56414C55450100000000000300000046494F010000000000}
    Session = osMain
    Left = 792
    Top = 386
  end
  object dsMrtKabs: TDataSource
    DataSet = odsMrtkabs
    Left = 912
    Top = 274
  end
  object odsFluKabs: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, '
      '       FC_SECTION, '
      '       FC_KEY, '
      '       FC_VALUE,'
      
        '       (SELECT FC_NAME FROM ASU.TKABINET WHERE FK_ID = TS.FC_VAL' +
        'UE) as KABNAME,'
      
        '       (select fc_value from asu.tsmini where fc_section = '#39'LITE' +
        'R_FOR_FLUKAB'#39'||TS.FC_VALUE and fc_key = TS.FC_VALUE) as fc_liter'
      '  FROM ASU.TSMINI TS'
      ' WHERE FC_SECTION = '#39'XRAY'#39
      '   AND FC_KEY LIKE '#39#1060#1051#1070#1054#1056#1054'_'#1050#1040#1041#1048#1053#1045#1058#1067'%'#39)
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000A00000046435F5345
      4354494F4E0100000000000600000046435F4B45590100000000000800000046
      435F56414C55450100000000000300000046494F010000000000}
    Session = osMain
    AfterOpen = odsFluKabsAfterOpen
    Left = 792
    Top = 442
  end
  object dsFluKabs: TDataSource
    DataSet = odsFluKabs
    Left = 912
    Top = 330
  end
  object stRep: TcxStyleRepository
    Left = 988
    Top = 427
    PixelsPerInch = 96
    object stBold: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object odsMetods: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, '
      '       FC_SECTION, '
      '       FC_KEY, '
      '       FC_VALUE,'
      '       ASU.GET_SMIDNAME(FC_VALUE) AS FIO'
      '  FROM ASU.TSMINI'
      ' WHERE FC_SECTION = '#39'XRAY'#39
      '   AND FC_KEY LIKE '#39#1052#1045#1058#1054#1044#1048#1050#1048'_'#1044#1051#1071'_'#1060#1043'%'#39)
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000500000005000000464B5F49440100000000000A00000046435F5345
      4354494F4E0100000000000600000046435F4B45590100000000000800000046
      435F56414C55450100000000000300000046494F010000000000}
    Session = osMain
    Left = 792
    Top = 506
  end
  object dsMetods: TDataSource
    DataSet = odsMetods
    Left = 912
    Top = 394
  end
  object odsVidSnimok: TOracleDataSet
    SQL.Strings = (
      
        'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FN_ORDER, -1 AS FK_DEFAUL' +
        'T'
      'FROM DUAL'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FN_ORDER, FK_DEFAULT '
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'VID_SNIMOK'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = osMain
    Left = 218
    Top = 587
  end
  object dsVidSnimok: TDataSource
    DataSet = odsVidSnimok
    Left = 282
    Top = 587
  end
  object odsDopIshod: TOracleDataSet
    SQL.Strings = (
      
        'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FN_ORDER, -1 AS FK_DEFAUL' +
        'T'
      'FROM DUAL'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FN_ORDER, FK_DEFAULT '
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'DOP_ISHOD_PARENT'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = osMain
    Left = 216
    Top = 531
  end
  object dsDopIshod: TDataSource
    DataSet = odsDopIshod
    Left = 272
    Top = 531
  end
  object odsRes: TOracleDataSet
    SQL.Strings = (
      
        'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FN_ORDER, -1 as FK_DEFAUL' +
        'T'
      'FROM DUAL'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FN_ORDER, FK_DEFAULT '
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'AMBTALON_RESULT'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = osMain
    Left = 216
    Top = 483
  end
  object dsRes: TDataSource
    DataSet = odsRes
    Left = 272
    Top = 475
  end
  object odsAp: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name, fc_aetitle, fc_ip, fk_kabinet,'
      
        '       (select fc_name from asu.tkabinet where fk_id = fk_kabine' +
        't) as fc_kab'
      '  from asu.txray_apparats'
      'order by fc_name')
    Optimize = False
    Cursor = crSQLWait
    Session = osMain
    Left = 580
    Top = 299
  end
  object dsAp: TDataSource
    DataSet = odsAp
    Left = 580
    Top = 251
  end
  object sdPopUp: TSaveDialog
    Left = 985
    Top = 363
  end
  object pmtvAp: TPopupMenu
    Images = ilMain
    Left = 576
    Top = 354
    object N2: TMenuItem
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
      ImageIndex = 21
      OnClick = N2Click
    end
  end
  object dsModal: TDataSource
    DataSet = odsModal
    Left = 644
    Top = 251
  end
  object odsModal: TOracleDataSet
    SQL.Strings = (
      'select fk_id, fc_name'
      '  from asu.tmodality'
      'order by fc_name')
    Optimize = False
    Cursor = crSQLWait
    Session = osMain
    Left = 644
    Top = 299
  end
  object dsListMK: TDataSource
    DataSet = odsListMK
    Left = 577
    Top = 414
  end
  object odsListMK: TOracleDataSet
    SQL.Strings = (
      
        'select fk_smid, asu.get_smidname(fk_smid) as fc_name from asu.tm' +
        'k')
    Optimize = False
    Cursor = crSQLWait
    Session = osMain
    AfterOpen = odsListMKAfterOpen
    Left = 633
    Top = 414
  end
  object odsBodyParts: TOracleDataSet
    SQL.Strings = (
      'select * from asu.tbodyparts')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000B00000046435F4E414D455F454E47010000000000}
    Cursor = crSQLWait
    Session = osMain
    Left = 647
    Top = 138
  end
  object dsBodyParts: TDataSource
    DataSet = odsBodyParts
    Left = 647
    Top = 186
  end
  object dsEdit: TDataSource
    DataSet = odsEdit
    Left = 578
    Top = 470
  end
  object odsEdit: TOracleDataSet
    SQL.Strings = (
      'select fk_id, '
      '       fc_section, '
      
        '       (select fc_name from asu.totdel where fk_id = substr(fc_k' +
        'ey, 16, length(fc_key)-length('#39#1056#1045#1044#1040#1050#1058#1048#1056#1054#1042#1040#1053#1048#1045'_'#39'))) as fc_key,'
      
        '      substr(fc_key, 16, length(fc_key)-length('#39#1056#1045#1044#1040#1050#1058#1048#1056#1054#1042#1040#1053#1048#1045'_'#39 +
        ')) as idOtdel, '
      '       fc_value '
      '  from asu.tsmini'
      ' where fc_section = '#39'XRAY'#39
      '   and fc_key like '#39#1056#1045#1044#1040#1050#1058#1048#1056#1054#1042#1040#1053#1048#1045'%'#39
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000A00000046435F5345
      4354494F4E0100000000000600000046435F4B45590100000000000800000046
      435F56414C5545010000000000}
    Cursor = crSQLWait
    Session = osMain
    AfterOpen = odsEditAfterOpen
    Left = 634
    Top = 470
  end
  object odsPlace: TOracleDataSet
    SQL.Strings = (
      
        'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FN_ORDER, -1 AS FK_DEFAUL' +
        'T'
      'FROM DUAL'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FN_ORDER, FK_DEFAULT '
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'AMBTALON_SERVPLACE'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = osMain
    Left = 368
    Top = 475
  end
  object dsPlace: TDataSource
    DataSet = odsPlace
    Left = 424
    Top = 475
  end
  object odsTargetTalon: TOracleDataSet
    SQL.Strings = (
      
        'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FN_ORDER, -1 AS FK_DEFAUL' +
        'T'
      'FROM DUAL'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FN_ORDER, FK_DEFAULT '
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'AMBTALON_REASON'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = osMain
    Left = 368
    Top = 523
  end
  object dsTargetTalon: TDataSource
    DataSet = odsTargetTalon
    Left = 424
    Top = 523
  end
  object odsStandartMP: TOracleDataSet
    SQL.Strings = (
      
        'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FN_ORDER, -1 AS FK_DEFAUL' +
        'T'
      'FROM DUAL'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FN_ORDER, FK_DEFAULT '
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'CPD_STANDARTGROUP'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = osMain
    Left = 368
    Top = 579
  end
  object dsStandarMP: TDataSource
    DataSet = odsStandartMP
    Left = 424
    Top = 579
  end
  object odsTypeVMU: TOracleDataSet
    SQL.Strings = (
      
        'SELECT 0 AS FK_ID, '#39#39' AS FC_NAME, 0 AS FN_ORDER, -1 AS FK_DEFAUL' +
        'T'
      'FROM DUAL'
      ''
      'UNION ALL'
      ''
      'SELECT FK_ID, FC_NAME, FN_ORDER, FK_DEFAULT '
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'TYPE_V_MU'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F52444552010000000000}
    Session = osMain
    Left = 496
    Top = 579
  end
  object dsTypeVMU: TDataSource
    DataSet = odsTypeVMU
    Left = 552
    Top = 579
  end
  object oraTSMINI_GROUP: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME'
      '  FROM ASU.TSMID TS '
      'WHERE FK_OWNER = ASU.GET_RG_GROUP '
      '  AND FL_SHOWPRINT = 1'
      '  AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    Session = osMain
    AfterScroll = oraTSMINI_GROUPAfterScroll
    Left = 208
    Top = 136
  end
  object dsTSMINI_GROUP: TDataSource
    DataSet = oraTSMINI_GROUP
    Left = 247
    Top = 138
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select fk_id,'
      '       fc_name,'
      '       fc_name || '#39'/'#39' || T.FC_TIME || '#39'/'#39' ||'
      '       TRIM(TO_CHAR(T.FN_NORM0,'
      '                    '#39'B9G999G999G990D99'#39','
      
        '                    '#39'NLS_NUMERIC_CHARACTERS = '#39#39'.0'#39#39#39')) AS FC_NA' +
        'ME,'
      '       (select t1.fc_name'
      '          from asu.tmodality t1, asu.tsmid_modality t2'
      '         where t1.fk_id = t2.fk_modality'
      '           and t2.fk_smid = t.fk_id) as fc_mod_name'
      '  from asu.tsmid t'
      ' where t.fk_default = :P_FK_DEFAULT')
    Optimize = False
    Variables.Data = {
      03000000010000000D0000003A505F464B5F44454641554C5403000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000900000046435F4E414D455F310100000000000B00000046
      435F4D4F445F4E414D45010000000000}
    Session = osMain
    AfterScroll = OracleDataSet1AfterScroll
    Left = 424
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 463
    Top = 138
  end
  object odsOtdelInCito: TOracleDataSet
    SQL.Strings = (
      'SELECT O.FK_ID, O.FC_NAME, O.FC_SHORT'
      '  FROM LOGIN.TOTDEL O'
      ' WHERE O.FK_ID IN (SELECT FK_OTDELID FROM ASU.TOTDELS_IN_CITO)'
      '   AND O.FL_DEL = 0'
      ' ORDER BY O.FC_NAME')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000800000046435F53484F5254010000000000}
    Session = osMain
    AfterOpen = odsOtdelInCitoAfterOpen
    Left = 640
    Top = 568
  end
  object dsOtdelInCito: TDataSource
    DataSet = odsOtdelInCito
    Left = 672
    Top = 568
  end
end
