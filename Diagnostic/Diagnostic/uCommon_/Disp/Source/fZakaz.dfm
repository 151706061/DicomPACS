object frmEditZakaz: TfrmEditZakaz
  Left = 241
  Top = 102
  BorderStyle = bsDialog
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1079#1072#1082#1072#1079#1072
  ClientHeight = 473
  ClientWidth = 862
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object paMain: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 856
    Height = 467
    Align = alClient
    BevelInner = bvLowered
    Color = clCream
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 16
      Top = 16
      Caption = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
    end
    object teDateTime: TcxTextEdit
      Left = 133
      Top = 16
      Enabled = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.Color = clCream
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 1
      Width = 121
    end
    object cxLabel2: TcxLabel
      Left = 16
      Top = 41
      Caption = #8470' '#1090#1077#1083#1077#1092#1086#1085#1072':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
    end
    object beNumTel: TcxButtonEdit
      Left = 133
      Top = 41
      Properties.Buttons = <
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
      Properties.ClickKey = 13
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 3
      Width = 161
    end
    object cxLabel3: TcxLabel
      Left = 16
      Top = 65
      Caption = #1040#1073#1086#1085#1077#1085#1090':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
    end
    object cxLabel4: TcxLabel
      Left = 16
      Top = 90
      Caption = #1050#1086#1076#1086#1074#1086#1077' '#1089#1083#1086#1074#1086':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
    end
    object cxLabel5: TcxLabel
      Left = 16
      Top = 115
      Caption = #1044#1086#1084#1072#1096#1085#1080#1081' '#1072#1076#1088#1077#1089':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
    end
    object grTrips: TcxGrid
      Left = 488
      Top = 41
      Width = 353
      Height = 154
      TabOrder = 7
      LookAndFeel.SkinName = 'Caramel'
      object tvTrips: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsHis
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object tvTrips_Adr1: TcxGridDBColumn
          Caption = #1054#1090#1082#1091#1076#1072
          DataBinding.FieldName = 'FC_ADR1'
          Options.Editing = False
          Width = 183
        end
        object tvTrips_Adr2: TcxGridDBColumn
          Caption = #1050#1091#1076#1072
          DataBinding.FieldName = 'FC_ADR2'
          Options.Editing = False
          Width = 121
        end
        object tvTrips_Button: TcxGridDBColumn
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
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
          Properties.ViewStyle = vsButtonsOnly
          Options.ShowEditButtons = isebAlways
          Width = 35
        end
      end
      object grTripsLevel1: TcxGridLevel
        GridView = tvTrips
      end
    end
    object teAbonent: TcxTextEdit
      Left = 133
      Top = 65
      Enabled = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.Color = clCream
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 8
      Width = 161
    end
    object teKod: TcxButtonEdit
      Left = 133
      Top = 90
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 13
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 9
      Width = 161
    end
    object beHomeAdr: TcxButtonEdit
      Left = 133
      Top = 115
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 13
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 10
      Width = 343
    end
    object cxLabel8: TcxLabel
      Left = 488
      Top = 16
      Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1077' '#1087#1086#1077#1079#1076#1082#1080
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
    end
    object cxLabel9: TcxLabel
      Left = 16
      Top = 153
      Caption = #1040#1076#1088#1077#1089' '#1082#1083#1080#1077#1085#1090#1072':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
    end
    object cxLabel10: TcxLabel
      Left = 16
      Top = 178
      Caption = #1040#1076#1088#1077#1089' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
    end
    object beAdr1: TcxButtonEdit
      Left = 133
      Top = 153
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 13
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 14
      Width = 343
    end
    object beAdr2: TcxButtonEdit
      Left = 133
      Top = 178
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 13
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 15
      Width = 343
    end
    object cxLabel13: TcxLabel
      Left = 16
      Top = 225
      Caption = #1055#1086#1079#1099#1074#1085#1086#1081':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
    end
    object beNumDrv: TcxButtonEdit
      Left = 133
      Top = 225
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 13
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 17
      Width = 121
    end
    object cxLabel14: TcxLabel
      Left = 16
      Top = 250
      Caption = #1060#1080#1082#1089#1072#1094#1080#1103':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
    end
    object beStart: TcxButtonEdit
      Left = 133
      Top = 250
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 13
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 19
      Width = 121
    end
    object cxLabel15: TcxLabel
      Left = 16
      Top = 275
      Caption = #1056#1072#1089#1095#1077#1090':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
    end
    object teEnd: TcxTextEdit
      Left = 133
      Top = 275
      Enabled = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.Color = clCream
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 21
      Width = 121
    end
    object cxLabel16: TcxLabel
      Left = 280
      Top = 250
      Caption = #1042#1088#1077#1084#1103' '#1074' '#1087#1091#1090#1080':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
    end
    object teTimeTrip: TcxTextEdit
      Left = 369
      Top = 250
      Enabled = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.Color = clCream
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 23
      Width = 107
    end
    object lbAuto: TcxLabel
      Left = 280
      Top = 225
      Caption = #1052#1072#1096#1080#1085#1072
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clMaroon
      Style.IsFontAssigned = True
    end
    object cxLabel6: TcxLabel
      Left = 16
      Top = 300
      Caption = #1057#1091#1084#1084#1072':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clTeal
      Style.IsFontAssigned = True
    end
    object teSum: TcxTextEdit
      Left = 133
      Top = 300
      Enabled = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.Color = clCream
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 26
      Width = 121
    end
    object lbVip: TcxLabel
      Left = 300
      Top = 65
      Caption = 'VIP'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clMaroon
      Style.IsFontAssigned = True
    end
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = frmMain.AppStorage
    AppStoragePath = 'frmEditZakaz\'
    StoredValues = <>
    Left = 806
    Top = 158
  end
  object odsHis: TOracleDataSet
    SQL.Strings = (
      'select distinct fc_adr1,'
      '       fc_adr2,'
      '       fd_datein,'
      '       fk_adr1id,'
      '       fk_adr2id '
      '  from taxi.tjournal t1'
      ' where fc_num = :pfc_num'
      '   and fn_sos = 1'
      '   and rownum <= 5'
      '   and ((fc_adr1 is not null) and (fc_adr2 is not null)) '
      'order by fd_datein desc')
    Optimize = False
    Variables.Data = {
      0300000001000000080000003A5046435F4E554D050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000900000046445F44415445494E0100000000000700000046
      435F414452310100000000000700000046435F41445232010000000000090000
      00464B5F41445231494401000000000009000000464B5F414452324944010000
      000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 560
    Top = 81
  end
  object dsHis: TDataSource
    DataSet = odsHis
    Left = 528
    Top = 81
  end
  object al: TActionList
    Left = 619
    Top = 251
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ShortCut = 27
      OnExecute = aCloseExecute
    end
  end
end
