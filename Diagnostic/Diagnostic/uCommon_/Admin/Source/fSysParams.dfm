object frmSysParams: TfrmSysParams
  Left = 271
  Top = 86
  Caption = #1057#1080#1089#1090#1077#1084#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 473
  ClientWidth = 862
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object vgParams: TcxVerticalGrid
    AlignWithMargins = True
    Left = 3
    Top = 32
    Width = 856
    Height = 438
    Margins.Top = 0
    Align = alClient
    LookAndFeel.SkinName = 'Caramel'
    OptionsView.RowHeaderWidth = 282
    TabOrder = 0
    object catAll: TcxCategoryRow
      Properties.Caption = #1054#1073#1097#1077#1077
    end
    object rowSavePass: TcxEditorRow
      Properties.Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1089#1086#1093#1088#1072#1085#1103#1090#1100' '#1087#1072#1088#1086#1083#1100
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.NullStyle = nssUnchecked
      Properties.EditProperties.ValueChecked = '1'
      Properties.EditProperties.ValueUnchecked = '0'
      Properties.EditProperties.OnEditValueChanged = rowSavePassEditPropertiesEditValueChanged
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
    end
    object rowAutoAdres: TcxEditorRow
      Properties.Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1074#1099#1074#1086#1076#1080#1090#1100' '#1086#1082#1085#1086' '#1040#1076#1088#1077#1089#1072
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.NullStyle = nssUnchecked
      Properties.EditProperties.ValueChecked = '1'
      Properties.EditProperties.ValueUnchecked = '0'
      Properties.EditProperties.OnEditValueChanged = rowAutoAdresEditPropertiesEditValueChanged
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
    end
    object rowAutoRef: TcxEditorRow
      Properties.Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1089#1077#1090#1082#1080' '#1084#1072#1096#1080#1085
      Properties.EditPropertiesClassName = 'TcxCheckBoxProperties'
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.NullStyle = nssUnchecked
      Properties.EditProperties.ValueChecked = '1'
      Properties.EditProperties.ValueUnchecked = '0'
      Properties.EditProperties.OnEditValueChanged = rowSetAvtoRefEditPropertiesEditValueChanged
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
    end
    object rowTimeAutoRef: TcxEditorRow
      Properties.Caption = #1054#1073#1085#1086#1074#1083#1103#1090#1100' '#1082#1072#1078#1076#1099#1077' ('#1089#1077#1082'.)'
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.CanEdit = False
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.MaxValue = 60.000000000000000000
      Properties.EditProperties.MinValue = 10.000000000000000000
      Properties.EditProperties.OnChange = rowTimeAutoRefEditPropertiesChange
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
    object catParam: TcxCategoryRow
      Options.Focusing = False
      Options.TabStop = False
      Properties.Caption = #1042#1099#1073#1086#1088' '#1088#1077#1075#1080#1086#1085#1072' '#1080' '#1075#1086#1088#1086#1076#1072
    end
    object rowObl: TcxEditorRow
      Properties.Caption = #1054#1073#1083#1072#1089#1090#1100' ('#1088#1077#1075#1080#1086#1085')'
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.EditProperties.ViewStyle = vsHideCursor
      Properties.EditProperties.OnButtonClick = rowOblEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
    object rowTown: TcxEditorRow
      Properties.Caption = #1043#1086#1088#1086#1076
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.EditProperties.ViewStyle = vsHideCursor
      Properties.EditProperties.OnButtonClick = rowTownEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
    object rowTarif: TcxCategoryRow
      Options.Focusing = False
      Options.Moving = False
      Options.TabStop = False
      Properties.Caption = #1054#1089#1086#1073#1099#1077' '#1086#1090#1084#1077#1090#1082#1080' '#1076#1083#1103' '#1090#1072#1088#1080#1092#1086#1074
    end
    object rowStopClientPercent: TcxEditorRow
      Properties.Caption = #1054#1089#1090#1072#1085#1086#1074#1082#1072' '#1087#1086' '#1087#1088#1086#1089#1100#1073#1077', '#1087#1088#1086#1094#1077#1085#1090
      Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
      Properties.EditProperties.DisplayFormat = '0.00'
      Properties.EditProperties.OnChange = rowStopClientPercentEditPropertiesChange
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
    object rowPercentObratno: TcxEditorRow
      Properties.Caption = #1055#1088#1086#1094#1077#1085#1090' '#1086#1073#1088#1072#1090#1085#1086' '#1087#1086' '#1084'/'#1075
      Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
      Properties.EditProperties.DisplayFormat = '0.00'
      Properties.EditProperties.OnChange = rowPercentObratnoEditPropertiesChange
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
    object rowBagage: TcxEditorRow
      Properties.Caption = #1055#1088#1086#1094#1077#1085#1090' '#1079#1072' '#1087#1077#1088#1077#1075#1088#1091#1079'('#1073#1072#1075#1072#1078')'
      Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
      Properties.EditProperties.DisplayFormat = '0.00'
      Properties.EditProperties.OnChange = rowBagageEditPropertiesChange
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
    end
    object rowPeregon: TcxEditorRow
      Properties.Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1079#1072' '#1087#1077#1088#1077#1075#1086#1085
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.OnChange = rowPeregonEditPropertiesChange
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
    object rowMin: TcxEditorRow
      Properties.Caption = #1054#1087#1083#1072#1090#1072' "'#1052#1080#1085#1080#1084#1072#1083#1082#1072'" ('#1088#1091#1073'.)'
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.OnChange = rowMinEditPropertiesChange
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
    object catIdent: TcxCategoryRow
      Options.Focusing = False
      Options.Moving = False
      Options.TabStop = False
      Properties.Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088#1099
    end
    object rowIdentMG: TcxEditorRow
      Properties.Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' "'#1052#1077#1078#1075#1086#1088#1086#1076'"'
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
      Properties.EditProperties.OnButtonClick = rowIdentMGEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
    object rowPers: TcxEditorRow
      Properties.Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' "'#1055#1077#1088#1089#1086#1085#1072#1083#1082#1072'"'
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.EditProperties.ViewStyle = vsHideCursor
      Properties.EditProperties.OnButtonClick = rowPersEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
    object rowBonusMin: TcxEditorRow
      Properties.Caption = #1050#1086#1083'-'#1074#1086' '#1073#1077#1089#1087#1083#1072#1090#1085#1099#1093' '#1084#1080#1085#1091#1090
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.OnChange = rowBonusMinEditPropertiesChange
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
    object rowPredMin: TcxEditorRow
      Properties.Caption = #1050#1086#1083'-'#1074#1086' '#1084#1080#1085#1091#1090' '#1076#1086' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1086#1075#1086' '#1079#1072#1082#1072#1079#1072
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.OnChange = rowPredEditPropertiesChange
      Properties.DataBinding.ValueType = 'String'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = Null
    end
    object rowShowSecHelp: TcxEditorRow
      Properties.Caption = #1042#1088#1077#1084#1103' '#1074' '#1089#1077#1082#1091#1085#1076#1072#1093' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103' '#1087#1086#1076#1089#1082#1072#1079#1082#1080
      Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
      Properties.EditProperties.AssignedValues.MinValue = True
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.OnChange = rowShowSecHelpEditPropertiesChange
      Properties.DataBinding.ValueType = 'Integer'
      Properties.Options.ShowEditButtons = eisbAlways
      Properties.Value = 0
    end
  end
  object dxBarDockControl1: TdxBarDockControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 856
    Height = 26
    Align = dalTop
    BarManager = BM
    SunkenBorder = False
    UseOwnSunkenBorder = True
  end
  object al: TActionList
    Images = frmMain.IL
    Left = 320
    Top = 152
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091' '#1085#1072#1089#1090#1088#1086#1077#1082
      ImageIndex = 3
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 8
      ShortCut = 113
      OnExecute = aSaveExecute
    end
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
    ImageOptions.Images = frmMain.IL
    LookAndFeel.SkinName = 'Caramel'
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 224
    Top = 176
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
      Caption = 'Sys'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 181
      FloatTop = 158
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbSave'
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
    object bbClose: TdxBarButton
      Action = aClose
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object bbSave: TdxBarButton
      Action = aSave
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
end
