object frmSetDrv: TfrmSetDrv
  Left = 317
  Top = 136
  BorderStyle = bsNone
  Caption = #1042#1099#1073#1086#1088' '#1090#1072#1082#1089#1080#1089#1090#1072
  ClientHeight = 455
  ClientWidth = 849
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 843
    Height = 396
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitTop = 2
    object Shape2: TShape
      Left = 661
      Top = 7
      Width = 25
      Height = 27
      Pen.Color = clBlue
      Pen.Width = 2
    end
    object Shape3: TShape
      Left = 693
      Top = 7
      Width = 25
      Height = 27
      Pen.Color = 16744703
      Pen.Width = 2
    end
    object Shape4: TShape
      Left = 724
      Top = 7
      Width = 25
      Height = 27
      Pen.Color = clRed
      Pen.Width = 2
    end
    object Label1: TLabel
      Left = 486
      Top = 14
      Width = 40
      Height = 16
      Caption = #1055#1086#1080#1089#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxLabel1: TcxLabel
      Left = 667
      Top = 9
      Caption = '1'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 699
      Top = 9
      Caption = '2'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel3: TcxLabel
      Left = 725
      Top = 9
      Caption = '>2'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object teFilter: TcxTextEdit
      Left = 532
      Top = 10
      ParentFont = False
      Properties.ClearKey = 119
      Properties.OnChange = teFilterPropertiesChange
      Style.BorderColor = clTeal
      Style.BorderStyle = ebsThick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 3
      OnKeyDown = teFilterKeyDown
      OnKeyPress = teFilterKeyPress
      Width = 121
    end
    object lbCap: TcxLabel
      Left = 7
      Top = 9
      Caption = #1042#1099#1073#1086#1088' '#1090#1072#1082#1089#1080#1089#1090#1072
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clDefault
      Style.IsFontAssigned = True
      Transparent = True
    end
    object Panel1: TPanel
      Left = 7
      Top = 37
      Width = 827
      Height = 356
      BevelOuter = bvNone
      Caption = 'Panel1'
      Color = clCream
      ParentBackground = False
      TabOrder = 5
      object paPeregon: TPanel
        Left = 0
        Top = 315
        Width = 827
        Height = 41
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #1055#1077#1088#1077#1075#1086#1085'! '#1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1073#1088#1072#1090#1100' 2 '#1084#1072#1096#1080#1085#1099'!'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        Visible = False
      end
      object pcMain: TcxPageControl
        Left = 0
        Top = 0
        Width = 827
        Height = 315
        ActivePage = tsAll
        Align = alClient
        Color = clCream
        ParentBackground = False
        ParentColor = False
        TabOrder = 1
        OnChange = pcMainChange
        ExplicitLeft = 48
        ExplicitTop = 46
        ClientRectBottom = 315
        ClientRectRight = 827
        ClientRectTop = 24
        object tsLocal: TcxTabSheet
          Caption = #1056#1072#1081#1086#1085
          ImageIndex = 0
          object grCars: TcxGrid
            Left = 0
            Top = 0
            Width = 827
            Height = 291
            Align = alClient
            PopupMenu = pmRaion
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            LookAndFeel.SkinName = ''
            object TVCARS: TcxGridDBTableView
              OnKeyDown = TVCARSKeyDown
              OnKeyPress = TVCARSKeyPress
              NavigatorButtons.ConfirmDelete = False
              OnCellClick = TVCARSCellClick
              OnCellDblClick = TVCARSCellDblClick
              OnCustomDrawCell = TVCARSCustomDrawCell
              OnGetCellHeight = TVCARSGetCellHeight
              DataController.DataSource = dsLocal
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.CellHints = True
              OptionsBehavior.IncSearch = True
              OptionsBehavior.IncSearchItem = VCARS_NAME
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnMoving = False
              OptionsCustomize.ColumnSorting = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              OptionsView.Indicator = True
              object VCARS_NAME: TcxGridDBColumn
                Caption = #1055#1086#1079#1099#1074#1085#1086#1081
                DataBinding.FieldName = 'FC_NAME'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Options.Editing = False
                Width = 164
              end
              object VCARS_AUTO: TcxGridDBColumn
                Caption = #1040#1074#1090#1086
                DataBinding.FieldName = 'FC_AUTO'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Options.Editing = False
                Width = 223
              end
              object VCARSChoose: TcxGridDBColumn
                DataBinding.FieldName = 'FC_COMMENT'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Buttons = <
                  item
                    Default = True
                    Glyph.Data = {
                      8E050000424D8E05000000000000360000002800000018000000130000000100
                      18000000000058050000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D4B8D87B27CA66
                      28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D0B2
                      D67826FFC88DC76328FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFF8CEACD97C25FCC58AF9C48DC66228FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFF8CBA8DC802AFCC68EF5B778F6C592BE5922FFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFF9CAA4DE832CFEC991F5B87AF1B67AF4C18DC35C
                      10C46016C35E13C25C11C05A10BE570DBC5409BB5309BB5209AF5217FFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C79FE0852EFFCB96F6BA7FF1B172
                      F3BC87F6D1ABF6C99AF4C798F2C392F0BF8BF0BD87EEB97EEDB378EBB071E9A5
                      56B04F13FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC598E38B34FFCC99F7
                      BC81F2B477F0B06DEFB276EEB87EECB377EAAD6FE8AA6AE6A664E5A15DE39B54
                      DF954BE29F5DE8A760AC4A10FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC392CF7F
                      2FFFD19FF8BE84F3B67AF1B171EFAD6AECA862EAA259E79C50E59949E39444E0
                      8E3BDE8934DB842DD97F24DA8933E6A35AAA4910FFFFFFFFFFFFFFFFFFFFFFFF
                      F4BF8DD1853ACDA984FFC78CF5B97DF2B374F0AF6DEDAA66EBA55FE8A057E69B
                      50E49749E19242DF8D3BDC8834DA842DD87F24D77B20E5A157AC4710FFFFFFFF
                      FFFFFFFFFFFFFFFFF5C495CF8136C29E7AE1AC78F9BA7AF3B371EEAC6AECA762
                      E9A25AE79D53E4994CE29445E08F3EDD8A37DB8630D98128D67C21D47414E39A
                      4DAA4B13FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC79AD07A28C0996EDBA56BF5
                      B36FEFAA66EAA45DE89F56E59B4FE39648E29141DE8C3ADC8934DB832BD77E24
                      D5791DD27313DF8E39AB4B15FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8
                      A0CC7222C19465D79D61F1AB63EBA25AE79E52E89B4CE89646E5913FE38E38E1
                      882FDD8328DB7E21D7791AD5720FDC8321AA4D16FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFF9CCA7C8701EC0905DD49656EDA258E99D50C2813FB97B
                      38BB7833BA762DBA7227B96F20B96B1AB96913B8640CBD6909AF5119FFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8CDABC66B1BC08B52D18E4B
                      EB9D4DE49645B04E0AB2510BB24F09B04D09AF4B07AE4905AC4703AC4502AB44
                      01AC4811FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
                      CFAFC56718C18648CD8942D3883BBD5B24FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFF6CFB3C26316BE8140C27E36C46028FFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D3B9BF6016C38137C661
                      28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      F5D4BEBF6114C66128FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFF6D7C2C9672EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    Kind = bkGlyph
                    Width = 30
                  end>
                Properties.ViewStyle = vsButtonsAutoWidth
                Properties.OnButtonClick = VCARSChoosePropertiesButtonClick
                Visible = False
                MinWidth = 35
                Options.ShowEditButtons = isebAlways
                Options.HorzSizing = False
                VisibleForCustomization = False
                Width = 35
                IsCaptionAssigned = True
              end
              object VCARS_STATUS: TcxGridDBColumn
                Caption = #1057#1090#1072#1090#1091#1089
                DataBinding.FieldName = 'STATUS'
                Visible = False
                Width = 248
              end
              object VCARS_BONUS: TcxGridDBColumn
                Caption = #1050#1086#1083'-'#1074#1086' '#1073#1077#1089#1087#1083#1072#1090#1085#1099#1093
                DataBinding.FieldName = 'FN_BESPLATCNT'
                Visible = False
                VisibleForCustomization = False
              end
              object VCARS_COM: TcxGridDBColumn
                Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
                DataBinding.FieldName = 'FC_COMMENT'
                Width = 178
              end
            end
            object grCarsLevel1: TcxGridLevel
              GridView = TVCARS
            end
          end
        end
        object tsAuto: TcxTabSheet
          Caption = #1040#1074#1090#1086
          ImageIndex = 1
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object grAllCars: TcxGrid
            Left = 223
            Top = 0
            Width = 604
            Height = 291
            Align = alClient
            PopupMenu = pmCars
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            LookAndFeel.SkinName = ''
            object TVALLCARS: TcxGridDBTableView
              OnKeyDown = TVALLCARSKeyDown
              OnKeyPress = TVALLCARSKeyPress
              NavigatorButtons.ConfirmDelete = False
              OnCellClick = TVALLCARSCellClick
              OnCellDblClick = TVALLCARSCellDblClick
              OnCustomDrawCell = TVALLCARSCustomDrawCell
              OnGetCellHeight = TVCARSGetCellHeight
              DataController.DataSource = dsAllCars
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              DataController.OnCompare = TVALLCARSDataControllerCompare
              OptionsBehavior.CellHints = True
              OptionsBehavior.IncSearch = True
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnMoving = False
              OptionsCustomize.ColumnSorting = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              OptionsView.Indicator = True
              object VALLCARSColumn1: TcxGridDBColumn
                DataBinding.FieldName = 'FC_COMMENT'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Buttons = <
                  item
                    Default = True
                    Glyph.Data = {
                      8E050000424D8E05000000000000360000002800000018000000130000000100
                      18000000000058050000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D4B8D87B27CA66
                      28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D0B2
                      D67826FFC88DC76328FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFF8CEACD97C25FCC58AF9C48DC66228FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFF8CBA8DC802AFCC68EF5B778F6C592BE5922FFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFF9CAA4DE832CFEC991F5B87AF1B67AF4C18DC35C
                      10C46016C35E13C25C11C05A10BE570DBC5409BB5309BB5209AF5217FFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C79FE0852EFFCB96F6BA7FF1B172
                      F3BC87F6D1ABF6C99AF4C798F2C392F0BF8BF0BD87EEB97EEDB378EBB071E9A5
                      56B04F13FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC598E38B34FFCC99F7
                      BC81F2B477F0B06DEFB276EEB87EECB377EAAD6FE8AA6AE6A664E5A15DE39B54
                      DF954BE29F5DE8A760AC4A10FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC392CF7F
                      2FFFD19FF8BE84F3B67AF1B171EFAD6AECA862EAA259E79C50E59949E39444E0
                      8E3BDE8934DB842DD97F24DA8933E6A35AAA4910FFFFFFFFFFFFFFFFFFFFFFFF
                      F4BF8DD1853ACDA984FFC78CF5B97DF2B374F0AF6DEDAA66EBA55FE8A057E69B
                      50E49749E19242DF8D3BDC8834DA842DD87F24D77B20E5A157AC4710FFFFFFFF
                      FFFFFFFFFFFFFFFFF5C495CF8136C29E7AE1AC78F9BA7AF3B371EEAC6AECA762
                      E9A25AE79D53E4994CE29445E08F3EDD8A37DB8630D98128D67C21D47414E39A
                      4DAA4B13FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC79AD07A28C0996EDBA56BF5
                      B36FEFAA66EAA45DE89F56E59B4FE39648E29141DE8C3ADC8934DB832BD77E24
                      D5791DD27313DF8E39AB4B15FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8
                      A0CC7222C19465D79D61F1AB63EBA25AE79E52E89B4CE89646E5913FE38E38E1
                      882FDD8328DB7E21D7791AD5720FDC8321AA4D16FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFF9CCA7C8701EC0905DD49656EDA258E99D50C2813FB97B
                      38BB7833BA762DBA7227B96F20B96B1AB96913B8640CBD6909AF5119FFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8CDABC66B1BC08B52D18E4B
                      EB9D4DE49645B04E0AB2510BB24F09B04D09AF4B07AE4905AC4703AC4502AB44
                      01AC4811FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
                      CFAFC56718C18648CD8942D3883BBD5B24FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFF6CFB3C26316BE8140C27E36C46028FFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D3B9BF6016C38137C661
                      28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      F5D4BEBF6114C66128FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFF6D7C2C9672EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    Kind = bkGlyph
                    Width = 30
                  end>
                Properties.ViewStyle = vsButtonsAutoWidth
                Properties.OnButtonClick = VALLCARSColumn1PropertiesButtonClick
                Visible = False
                MinWidth = 35
                Options.ShowEditButtons = isebAlways
                Options.HorzSizing = False
                VisibleForCustomization = False
                Width = 35
                IsCaptionAssigned = True
              end
              object VALLCARS_NAME: TcxGridDBColumn
                Caption = #1055#1086#1079#1099#1074#1085#1086#1081
                DataBinding.FieldName = 'FC_NAME'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Options.Editing = False
                Width = 92
              end
              object VALLCARS_AUTO: TcxGridDBColumn
                Caption = #1040#1074#1090#1086
                DataBinding.FieldName = 'FC_AUTO'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Options.Editing = False
                Width = 244
              end
              object VALLCARS_STATUS: TcxGridDBColumn
                Caption = #1057#1090#1072#1090#1091#1089
                DataBinding.FieldName = 'STATUS'
                Visible = False
                Options.Editing = False
                Width = 267
              end
              object VALLCARS_BONUS: TcxGridDBColumn
                Caption = #1050#1086#1083'-'#1074#1086' '#1073#1086#1085#1091#1089#1086#1074
                DataBinding.FieldName = 'FN_BESPLATCNT'
                Visible = False
                Options.Editing = False
                VisibleForCustomization = False
              end
              object VALLCARS_COM: TcxGridDBColumn
                Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
                DataBinding.FieldName = 'FC_COMMENT'
                Options.Editing = False
                Width = 210
              end
              object TVALLCARSFK_ID: TcxGridDBColumn
                DataBinding.FieldName = 'FK_ID'
                Visible = False
                Options.Editing = False
              end
              object TVALLCARSFC_SYNONYM: TcxGridDBColumn
                DataBinding.FieldName = 'FC_SYNONYM'
                Visible = False
                Options.Editing = False
              end
              object TVALLCARSFC_PLACE: TcxGridDBColumn
                Caption = #1052#1077#1089#1090#1086
                DataBinding.FieldName = 'FC_PLACE'
                Visible = False
                Options.Editing = False
              end
              object VALLCARSOrder: TcxGridDBColumn
                DataBinding.FieldName = 'fn_rorder'
                Visible = False
                Options.Editing = False
              end
              object TVALLCARSFC_RAION: TcxGridDBColumn
                Caption = #1056#1072#1081#1086#1085
                DataBinding.FieldName = 'FC_RAION'
                Options.Editing = False
              end
            end
            object cxGridLevel2: TcxGridLevel
              GridView = TVALLCARS
            end
          end
          object pcRaion: TcxPageControl
            Left = 0
            Top = 0
            Width = 223
            Height = 291
            ActivePage = cxTabSheet6
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            LookAndFeel.Kind = lfStandard
            LookAndFeel.SkinName = 'Office2007Green'
            ParentFont = False
            Rotate = True
            TabOrder = 1
            TabPosition = tpLeft
            TabSlants.Positions = [spLeft, spRight]
            OnPageChanging = pcRaionPageChanging
            ClientRectBottom = 285
            ClientRectLeft = 204
            ClientRectRight = 217
            ClientRectTop = 3
            object cxTabSheet4: TcxTabSheet
              Caption = #1057#1090#1072#1088#1099#1081' '#1074#1086#1082#1079#1072#1083
              ImageIndex = 0
            end
            object cxTabSheet5: TcxTabSheet
              Caption = #1055#1088#1086#1089#1090#1086#1082#1074#1072#1096#1080#1085#1086
              ImageIndex = 1
            end
            object cxTabSheet6: TcxTabSheet
              Caption = #1063#1077#1093#1086#1074#1072' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1072#1103
              ImageIndex = 2
            end
          end
        end
        object tsAll: TcxTabSheet
          Caption = #1058#1072#1082#1089#1080
          ImageIndex = 2
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object grAllTaxi: TcxGrid
            Left = 223
            Top = 0
            Width = 604
            Height = 291
            Align = alClient
            PopupMenu = pmTaxi
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            LookAndFeel.SkinName = ''
            object TVALLTAXI: TcxGridDBTableView
              OnKeyDown = TVALLTAXIKeyDown
              OnKeyPress = TVALLTAXIKeyPress
              NavigatorButtons.ConfirmDelete = False
              OnCellClick = TVALLTAXICellClick
              OnCellDblClick = TVALLTAXICellDblClick
              OnCustomDrawCell = TVALLTAXICustomDrawCell
              OnGetCellHeight = TVCARSGetCellHeight
              DataController.DataSource = dsAllTaxi
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              DataController.OnCompare = TVALLTAXIDataControllerCompare
              OptionsBehavior.CellHints = True
              OptionsBehavior.IncSearch = True
              OptionsBehavior.IncSearchItem = VALLTAXI_NAME
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnMoving = False
              OptionsCustomize.ColumnSorting = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              OptionsView.Indicator = True
              object VALLTAXIColumn1: TcxGridDBColumn
                DataBinding.FieldName = 'FC_COMMENT'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Buttons = <
                  item
                    Default = True
                    Glyph.Data = {
                      8E050000424D8E05000000000000360000002800000018000000130000000100
                      18000000000058050000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D4B8D87B27CA66
                      28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D0B2
                      D67826FFC88DC76328FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFF8CEACD97C25FCC58AF9C48DC66228FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFF8CBA8DC802AFCC68EF5B778F6C592BE5922FFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFF9CAA4DE832CFEC991F5B87AF1B67AF4C18DC35C
                      10C46016C35E13C25C11C05A10BE570DBC5409BB5309BB5209AF5217FFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C79FE0852EFFCB96F6BA7FF1B172
                      F3BC87F6D1ABF6C99AF4C798F2C392F0BF8BF0BD87EEB97EEDB378EBB071E9A5
                      56B04F13FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC598E38B34FFCC99F7
                      BC81F2B477F0B06DEFB276EEB87EECB377EAAD6FE8AA6AE6A664E5A15DE39B54
                      DF954BE29F5DE8A760AC4A10FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC392CF7F
                      2FFFD19FF8BE84F3B67AF1B171EFAD6AECA862EAA259E79C50E59949E39444E0
                      8E3BDE8934DB842DD97F24DA8933E6A35AAA4910FFFFFFFFFFFFFFFFFFFFFFFF
                      F4BF8DD1853ACDA984FFC78CF5B97DF2B374F0AF6DEDAA66EBA55FE8A057E69B
                      50E49749E19242DF8D3BDC8834DA842DD87F24D77B20E5A157AC4710FFFFFFFF
                      FFFFFFFFFFFFFFFFF5C495CF8136C29E7AE1AC78F9BA7AF3B371EEAC6AECA762
                      E9A25AE79D53E4994CE29445E08F3EDD8A37DB8630D98128D67C21D47414E39A
                      4DAA4B13FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC79AD07A28C0996EDBA56BF5
                      B36FEFAA66EAA45DE89F56E59B4FE39648E29141DE8C3ADC8934DB832BD77E24
                      D5791DD27313DF8E39AB4B15FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8
                      A0CC7222C19465D79D61F1AB63EBA25AE79E52E89B4CE89646E5913FE38E38E1
                      882FDD8328DB7E21D7791AD5720FDC8321AA4D16FFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFF9CCA7C8701EC0905DD49656EDA258E99D50C2813FB97B
                      38BB7833BA762DBA7227B96F20B96B1AB96913B8640CBD6909AF5119FFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8CDABC66B1BC08B52D18E4B
                      EB9D4DE49645B04E0AB2510BB24F09B04D09AF4B07AE4905AC4703AC4502AB44
                      01AC4811FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
                      CFAFC56718C18648CD8942D3883BBD5B24FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFF6CFB3C26316BE8140C27E36C46028FFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D3B9BF6016C38137C661
                      28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      F5D4BEBF6114C66128FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFF6D7C2C9672EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    Kind = bkGlyph
                    Width = 30
                  end>
                Properties.ViewStyle = vsButtonsAutoWidth
                Properties.OnButtonClick = VALLTAXIColumn1PropertiesButtonClick
                Visible = False
                MinWidth = 35
                Options.ShowEditButtons = isebAlways
                Options.HorzSizing = False
                VisibleForCustomization = False
                Width = 35
                IsCaptionAssigned = True
              end
              object VALLTAXI_NAME: TcxGridDBColumn
                Caption = #1055#1086#1079#1099#1074#1085#1086#1081
                DataBinding.FieldName = 'FC_NAME'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Options.Editing = False
                Width = 83
              end
              object TVALLTAXIFC_NAME_1: TcxGridDBColumn
                Caption = #1058#1072#1082#1089#1080
                DataBinding.FieldName = 'TAXI_NAME'
                Options.Editing = False
                Width = 51
              end
              object VALLTAXI_AUTO: TcxGridDBColumn
                Caption = #1040#1074#1090#1086
                DataBinding.FieldName = 'FC_AUTO'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Options.Editing = False
                Width = 193
              end
              object VALLTAXI_STATUS: TcxGridDBColumn
                Caption = #1057#1090#1072#1090#1091#1089
                DataBinding.FieldName = 'STATUS'
                Visible = False
                Options.Editing = False
                Width = 246
              end
              object VALLTAXI_BONUS: TcxGridDBColumn
                Caption = #1050#1086#1083'-'#1074#1086' '#1073#1086#1085#1091#1089#1086#1074
                DataBinding.FieldName = 'FN_BESPLATCNT'
                Visible = False
                Options.Editing = False
                VisibleForCustomization = False
              end
              object VALLTAXI_COM: TcxGridDBColumn
                Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
                DataBinding.FieldName = 'FC_COMMENT'
                Options.Editing = False
                Width = 150
              end
              object TVALLTAXIFK_ID: TcxGridDBColumn
                DataBinding.FieldName = 'FK_ID'
                Visible = False
                Options.Editing = False
              end
              object TVALLTAXIFC_SYNONYM: TcxGridDBColumn
                DataBinding.FieldName = 'FC_SYNONYM'
                Visible = False
                Options.Editing = False
              end
              object TVALLTAXIFK_RAION: TcxGridDBColumn
                DataBinding.FieldName = 'FK_RAION'
                Visible = False
                Options.Editing = False
              end
              object TVALLTAXIFN_RORDER: TcxGridDBColumn
                DataBinding.FieldName = 'FN_RORDER'
                Visible = False
                Options.Editing = False
              end
              object TVALLTAXIFC_PLACE: TcxGridDBColumn
                DataBinding.FieldName = 'FC_PLACE'
                Visible = False
                Options.Editing = False
              end
              object TVALLTAXIFC_RAION: TcxGridDBColumn
                Caption = #1056#1072#1081#1086#1085
                DataBinding.FieldName = 'FC_RAION'
                Options.Editing = False
                Width = 78
              end
            end
            object cxGridLevel3: TcxGridLevel
              GridView = TVALLTAXI
            end
          end
          object pcAllTaxi: TcxPageControl
            Left = 0
            Top = 0
            Width = 223
            Height = 291
            ActivePage = cxTabSheet1
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            LookAndFeel.SkinName = 'Office2007Green'
            ParentFont = False
            Rotate = True
            TabOrder = 1
            TabPosition = tpLeft
            TabSlants.Positions = [spLeft, spRight]
            OnPageChanging = pcAllTaxiPageChanging
            ClientRectBottom = 285
            ClientRectLeft = 204
            ClientRectRight = 217
            ClientRectTop = 3
            object cxTabSheet1: TcxTabSheet
              Caption = #1057#1090#1072#1088#1099#1081' '#1074#1086#1082#1079#1072#1083
              ImageIndex = 0
            end
            object cxTabSheet2: TcxTabSheet
              Caption = #1055#1088#1086#1089#1090#1086#1082#1074#1072#1096#1080#1085#1086
              ImageIndex = 1
            end
            object cxTabSheet3: TcxTabSheet
              Caption = #1063#1077#1093#1086#1074#1072' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1072#1103
              Color = clWhite
              ImageIndex = 2
              ParentColor = False
            end
          end
        end
      end
    end
    object bMove: TcxButton
      AlignWithMargins = True
      Left = 785
      Top = 1
      Width = 28
      Height = 25
      Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1092#1086#1088#1084#1091
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnMouseDown = bMoveMouseDown
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE3B8FF9900FF9900FF9900FF9900FF9900FF
        9900FF9900FF9900FF9900FF9900FF9900FF9900FFE3B8FFFFFFFFFFFFFF9900
        FFE5E5FFE5E5FFE5E5FFE5E5FFE3E3FFE0E0FFDEDEFFDBDBFFD7D7FFD4D4FFCF
        CFFFCCCCFF9900FFFFFFFFFFFFFF9900FFEAEAFFEAEAFFEAEAFFEAEAFFE6E6FF
        E5E5FFE1E1FFDEDEFFDBDBFFD6D6FFD2D2FFCFCFFF9900FFFFFFFFFFFFFF9900
        FFF0F0FFF0F0FFF0F0FFEEEEFFECECFFE8E8FFE5E5FFE1E1FFDEDEFFD9D9FFD6
        D6FFD1D1FF9900FFFFFFFFFFFFFF9900FFF5F5FFF5F5FFF5F5FFF3F3FFF0F0FF
        EEEEFFE8E8FFE5E5FFE0E0FFDCDCFFD7D7FFD2D2FF9900FFFFFFFFFFFFFF9900
        FFFBFBFFFBFBFFFBFBFFF9F9FFF5F5FFF0F0FFECECFFE6E6FFE3E3FFDEDEFFD9
        D9FFD4D4FF9900FFFFFFFFFFFFFF9900FFFFFFFFFFFFFFFFFFFFFDFDFFF9F9FF
        F3F3FFEEEEFFEAEAFFE5E5FFE0E0FFDBDBFFD6D6FF9900FFFFFFFFFFFFFF9900
        FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFF5F5FFF0F0FFEAEAFFE5E5FFE0E0FFDB
        DBFFD6D6FF9900FFFFFFFFFFFFFF9900FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFF
        F5F5FFF0F0FFEAEAFFE5E5FFE0E0FFDBDBFFD6D6FF9900FFFFFFFFFFFFFF9900
        FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFF5F5FFF0F0FFEAEAFFE5E5FFE0E0FFDB
        DBFFD6D6FF9900FFFFFFFFFFFFFF9900D6D6D6D6D6D6D6D6D6D6D6D6D6D3D3D6
        CECED6CBCBD6C7C7D6C3C3D6BFBFD6BABAD6B6B6FF9900FFFFFFFFFFFFFF9900
        FF9900EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB85
        00F79100FF9900FFFFFFFFFFFFFF9900FFCC99FFCC99FFCC99FFCC99FFCC99FF
        CC99FFCC99FFCC99FFCC99FFCC99FFCC99FFAD3DFF9900FFFFFFFFFFFFFFE3B8
        FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF99
        00FF9900FFE3B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bClose: TcxButton
      AlignWithMargins = True
      Left = 813
      Top = 1
      Width = 28
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = aCloseExecute
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF5251CE0B15AE9E88A4FFDBA53630AC2C29B2DA
        BAA8FFA318FF9900FF9900FF9900FF9900FF9900FFE3B8FFFFFFFFFFFF2E28AC
        2C72FF1534D42135C4174EFF155CFF3639C4FFF0F0FFDBDBFFD7D7FFD4D4FFCF
        CFFFCCCCFF9900FFFFFFFFFFFF9F89B11325C62C67FF255DFF205BFF1522BECD
        C8EDFFEBEBFFDEDEFFDBDBFFD6D6FFD2D2FFCFCFFF9900FFFFFFFFFFFFFFC266
        BEBBE21022BF2D66FF1C49F47876CBFFF6F6FFE5E5FFE1E1FFDEDEFFD9D9FFD6
        D6FFD1D1FF9900FFFFFFFFFFFFFFD0892D2CAF3F7DFF1C3FDD2961FF1323C5E5
        E1F4FFEDEDFFE5E5FFE0E0FFDCDCFFD7D7FFD2D2FF9900FFFFFFFFFFFFFFD89E
        161EC2396DFF8B8BD43A3BB72B6DFF2A2CBFFFF7F7FFE6E6FFE3E3FFDEDEFFD9
        D9FFD4D4FF9900FFFFFFFFFFFFFFAA2BBDBDF14242C4FFFFFFF4F3FC3434BFC4
        C2F1FFF4F4FFEAEAFFE5E5FFE0E0FFDBDBFFD6D6FF9900FFFFFFFFFFFFFF9900
        FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFFF8F8FFF0F0FFEAEAFFE5E5FFE0E0FFDB
        DBFFD6D6FF9900FFFFFFFFFFFFFF9900FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFF
        F5F5FFF0F0FFEAEAFFE5E5FFE0E0FFDBDBFFD6D6FF9900FFFFFFFFFFFFFF9900
        FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFF5F5FFF0F0FFEAEAFFE5E5FFE0E0FFDB
        DBFFD6D6FF9900FFFFFFFFFFFFFF9900D6D6D6D6D6D6D6D6D6D6D6D6D6D3D3D6
        CECED6CBCBD6C7C7D6C3C3D6BFBFD6BABAD6B6B6FF9900FFFFFFFFFFFFFF9900
        FF9900EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB85
        00F79100FF9900FFFFFFFFFFFFFF9900FFCC99FFCC99FFCC99FFCC99FFCC99FF
        CC99FFCC99FFCC99FFCC99FFCC99FFCC99FFAD3DFF9900FFFFFFFFFFFFFFE3B8
        FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF99
        00FF9900FFE3B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 402
    Width = 843
    Height = 50
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bRaion: TcxButton
      Left = 7
      Top = 7
      Width = 90
      Height = 26
      Hint = #1052#1072#1096#1080#1085#1099' '#1087#1086' '#1088#1072#1081#1086#1085#1091
      Caption = #1055#1086' '#1088#1072#1081#1086#1085#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bRaionClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bAllCars: TcxButton
      Left = 100
      Top = 7
      Width = 93
      Height = 26
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1074#1089#1077' '#1084#1072#1096#1080#1085#1099' '#1090#1072#1082#1089#1080
      Caption = #1042#1089#1077' '#1072#1074#1090#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bAllCarsClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bAllTaxi: TcxButton
      Left = 196
      Top = 7
      Width = 90
      Height = 26
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1074#1089#1077' '#1084#1072#1096#1080#1085#1099' '#1074#1089#1077#1093' '#1090#1072#1082#1089#1080
      Caption = #1042#1089#1077' '#1090#1072#1082#1089#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bAllTaxiClick
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bEnter: TcxButton
      Left = 575
      Top = 6
      Width = 126
      Height = 38
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1090#1072#1082#1089#1080#1089#1090#1072
      Caption = #1054#1050
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bEnterClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4E5C4339D331D931F80C480FEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDE6BD0D951114B02B14B129
        0B9B156FC36FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEE9BE0F9A1317
        B22F13AD2B12AB2613AF270A9A1471C371FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0EA
        C00F9E1419B53516B03015AE2C14AD2914AD2713AF290A9A1473C473FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC2EDC210A1151BB63B1AB43518B13116AF2F13AE2A13AD2913AD2814B0
        280A9A1476C676FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFC3EEC310A51520B9411CB53A1AB33619B23417B1323DBE52
        27B43C0EAC2613AC2814B02A0A9A1478C778FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFC6EECA16AB1F22BB451FB8401DB63B1DB6391B
        B53A17B0310E9F1776D18641BF560EAC2514AE2914B0290A99147AC87AFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2CB23944C7651FBA431FB8
        411EB73E1FB8401AB33632AA32B6E1B6129B1272D1843FBF530EAC2614AD2916
        B12B0A99147CC97CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FB132
        76D89117B83D1FBA4321BB441CB63931AD31EDF9EDFFFFFFC9ECC90F9A0F74D2
        853DBF530EAC2614AD2A15B12D0A99147FCA7FFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF85CE9046C1616FD58B38C45B26BA462FB131EAF8EAFFFFFFFFFFFF
        FFFFFFC6ECC60E9B0E74D2853ABD5010AE2714AD2B15B12C0A991481CB81FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFD77D5842ABB4041BF5735B53EE9FAEAFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFC5ECC50C9A0C76D2883ABD5010AE2815AF2B
        17B32E0A991483CC83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2FAE4C0ED
        C4F6FDF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0E9C00C9D0D77
        D38938BC4E10AE2915AE2C17B32F0A991386CE86FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFBFE9BF0B9C0D79D48B35BB4C11AF2A15AE2D17B22F0A991392CD92FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAE8BA099D0C77D58B35BB4C11AF2B16B0
        2D17B4321C951EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8E7B8099D0E
        79D48C34BA4C11AF2B18B4342F9D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFB4E7B4079E0E74D58954CA6C089D13ADDDADFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5E3B521A121259F25A6DBA6FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton1: TcxButton
      Left = 707
      Top = 6
      Width = 126
      Height = 38
      Action = aClose
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFC6C6EE2626B51515AF5959C4D0D0F1FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3FA6464C3A7A7DCFCFCFEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF2F2FA191AB91542F01545E80E2CC8070BAB74
        74D4F8F8FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1FB3B3BB50520C60312AC
        2929AB5D5DC5E4E4F6FFFFFFFFFFFFFFFFFFFFFFFF9494DC0E27D81B4FFF194A
        FB1948F51643E3091CB73434BAE1E1F8FFFFFFFFFFFFFFFFFFEEEEFA3636B30A
        29D60D3EF40B39E6072ED4041CB92525AAE6E6F7FFFFFFFFFFFFFFFFFF3939BF
        2554FC2356FF1D4FFF1C4DFE1A4BFB1947F0102DC61818B1CACAF1FFFFFFEEEE
        FA3232B30C2DDA1142F80E3FF40D3CF20B39EE0A37E8041FBB3939B3FBFBFDFF
        FFFFFFFFFF9898E30F10BB2957F92456FF2051FF1F51FF1D4EFD1B4BF41338CE
        0E0EADAAAAE53333B60F31DE1446FC1243F81040F50E3EF40D3DF40B3AEF0A36
        E50212ACA1A1DBFFFFFFFFFFFFFFFFFF3636C62D5DFE2859FF2657FF2455FF23
        55FF2051FF1D4CF7153DD60202A71131DE184CFE1547F91444F81243F71040F5
        0E3EF40C3DF30C3CF2072CD55757BEFFFFFFFFFFFFFFFFFF1214C73C71FF2F61
        FF2B5BFF295AFF2859FF2758FF2455FF1D4EF81B4BF31C4EFD1B4AFD1848FB15
        46F91444F81243F71040F50F41F80B34E70D10AFA4A4E1FFFFFFFFFFFFFDFDFE
        3333C92239DA4275FF3769FF2F60FF2C5DFF2A5AFF285AFF2657FF2152FE1E4F
        FF1C4DFF1A4BFD1849FB1546F91544F91347FB0B29D92A2AB0D5D5F3FFFFFFFF
        FFFFFFFFFFFFFFFFF9F9FE8080DF0F14C13B63F44273FF3565FF2F60FF2B5CFF
        295AFF2859FF2354FF1F50FE1C4EFE1A4BFE1949FC164AFF0920CC4949BEF1F1
        FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3F63535C12338D748
        7AFF3A6BFF3162FF2D5EFF2A5AFF2758FF2354FF1F50FE1D4EFE1C4FFF0A1CC8
        6464CFFBFBFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFBFBFE8080D90F14C0406CFB3768FF3262FF2E5FFF2A5BFF2758FF2455FE1D
        4FFB091AC66B6BD1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFEFEFFB1011BB4273FF3A6AFF3565FF3262FF2E5F
        FF2A5AFF2657FE1E4EF8102DCA3E3EC0FBFBFDFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8787E12740DF4576FF3D6DFF
        3969FF3565FF3262FF2D5EFF295BFF2555FE1C4CEF0A1AB87B7BDAFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFF1A1AC04D
        7DFF4675FF406FFF3D6EFF396AFF3A6BFF3565FF2C5CFF295AFF2252FD1947E3
        060BB1C0C0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFA8A8EC2337D85183FF4877FF4372FF406EFF3D6FFF243FE04375FF3364FF2A
        5BFF2657FF1D4FF9143AD11F1FB8F0F0FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF4545D54D76F85280FF4B79FF4877FF4374FF2342E52929
        BC1420C84274FF3062FF2859FF2353FE1B4BF30C23BF6060D3FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2FA121ACD6091FF5280FF4D7BFF497AFF
        3C69FA2020C2F1F1FC8989E11522CD4071FF2D5DFF2455FE1F4FFC1847E7050D
        B4B2B2EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8DEA3750E45E8EFF54
        82FF507EFF4B7EFF0F1BCCB9B9F2FFFFFFFFFFFF7C7CE4182AD23B6DFF2859FF
        2051FF1B4AF8133AD31A1AB8EEEEFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F
        DC6893FC6491FF5885FF5281FF3252ED5858DAFFFFFFFFFFFFFFFFFFFFFFFF66
        66D91D35DA3367FF2454FF1C4EFD1948F20B24C36060CEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9B9BF21E28D3719EFF6A9AFF5485FF0F11C9E4E4FBFFFFFFFFFF
        FFFFFFFFFFFFFFFBFBFE4A4ACA2341E52C60FF2053FF1C52FF1032E11010B8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABABF52828D7212ED62637DA8686E8
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2FC3131C42246EB102ADC0F11
        C06868D8DBDBF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5
        C5F56969DCF8F8FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6F9
        3737C69292E0F2F2FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object odsLocal: TOracleDataSet
    SQL.Strings = (
      'select s.fk_id,'
      '       s.fc_name||'
      
        '         decode(t.fc_synonym, '#39'GO_FROM_CAR'#39', '#39'->'#39', '#39'START_CLIENT' +
        '_MOVE'#39','#39'*'#39', '#39'MOVE_TO_CLIENT'#39','#39'*'#39', '#39'CANCEL_CLIENT_MOVE'#39','#39'*'#39',NULL)' +
        '||'#39' '#39'||'
      '         fc_bag||'
      '         fc_tros||'#39' '#39'||'
      
        '         (select max(fc_name) from taxi.ts_places where fk_id = ' +
        's.fk_place) as fc_name,'
      '       s.fc_auto,'
      '       '#39#39' as status,'
      '       s.fn_besplatcnt, '
      '       t.fc_synonym,'
      '       s.fc_comment'
      '  from taxi.ts_drivers s, taxi.ts_drivereventtype t'
      ' where s.fl_del = 0'
      '   and s.fd_out is null'
      '   and s.fk_taxiid = :pfk_taxiid'
      '   and s.fk_place in (select :pfk_place from dual'
      '                      union'
      
        '                      select fk_id from taxi.ts_places pl where ' +
        'pl.fk_raionid = :pfk_place)'
      '   and s.fk_lastdrivereventtype = t.fk_id'
      '   and t.fl_isonline = 1'
      '   and t.fc_synonym <> '#39'MOVE_TO_CLIENT'#39
      
        'order by s.fk_taxiid, decode(t.fc_synonym, '#39'START_CLIENT_MOVE'#39', ' +
        '1, '#39'MOVE_TO_CLIENT'#39', 1, '#39'CANCEL_CLIENT_MOVE'#39', 1, 0), s.fn_raiono' +
        'rder asc')
    Optimize = False
    Variables.Data = {
      03000000020000000A0000003A50464B5F504C41434503000000000000000000
      00000B0000003A50464B5F544158494944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000700000046435F4155544F01000000000006000000535441
      5455530100000000000A00000046435F53594E4F4E594D0100000000000D0000
      00464E5F424553504C4154434E540100000000000A00000046435F434F4D4D45
      4E54010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    Left = 360
    Top = 200
  end
  object dsLocal: TDataSource
    DataSet = odsLocal
    Left = 360
    Top = 152
  end
  object odsAllCars: TOracleDataSet
    SQL.Strings = (
      'select s.fk_id,'
      
        '       s.fc_name ||decode(t.fc_synonym,'#39'START_CLIENT_MOVE'#39','#39'*'#39','#39 +
        'MOVE_TO_CLIENT'#39','#39'*'#39','#39'CANCEL_CLIENT_MOVE'#39','#39'*'#39',NULL)||'#39' '#39'||'
      ' fc_bag || fc_tros ||'#39' '#39'||(select max(p.fc_name)'
      '          from taxi.ts_places p'
      '         where p.fk_id = s.fk_place) as fc_name,'
      '       s.fc_auto,'
      '       '#39#39' as status,'
      '       s.fn_besplatcnt,'
      '       t.fc_synonym,'
      '       s.fc_comment,'
      '       nvl((select max(r.fk_id)'
      '          from taxi.ts_raion r'
      '         where r.fk_id = nvl((select max(p.fk_raionid)'
      '                               from taxi.ts_places p'
      '                              where p.fk_id = s.fk_place),'
      '                             s.fk_place)),999999999) fk_raion,'
      '       nvl((select max(r.fn_order)'
      '          from taxi.ts_raion r'
      '         where r.fk_id = nvl((select max(p.fk_raionid)'
      '                               from taxi.ts_places p'
      '                              where p.fk_id = s.fk_place),'
      '                             s.fk_place)),999999999) fn_rorder,'
      '       nvl((select max(r.fc_name)'
      '          from taxi.ts_raion r'
      '         where r.fk_id = nvl((select max(p.fk_raionid)'
      '                               from taxi.ts_places p'
      '                              where p.fk_id = s.fk_place),'
      '                             s.fk_place)),'#39#1085#1077' '#1091#1082#1072#1079#1072#1085#39') fc_raion,'
      '(select max(p.fc_name)'
      '          from taxi.ts_places p'
      '         where p.fk_id = s.fk_place) fc_place'
      ' from taxi.ts_drivers s, taxi.ts_drivereventtype t'
      ' where s.fl_del = 0'
      '   and s.fd_out is null'
      '   and s.fk_taxiid = :pfk_taxiid'
      '   and s.fk_lastdrivereventtype = t.fk_id'
      '   and t.fl_isonline = 1'
      '   and t.fc_synonym <> '#39'MOVE_TO_CLIENT'#39
      
        ' order by fn_rorder, s.fk_taxiid, decode(t.fc_synonym, '#39'START_CL' +
        'IENT_MOVE'#39', 1, '#39'MOVE_TO_CLIENT'#39', 1, '#39'CANCEL_CLIENT_MOVE'#39', 1, 0) ' +
        '/* s.fn_raionorder, s.fd_raionarive */ asc')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F544158494944030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000000900000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000700000046435F4155544F01000000000006000000535441
      5455530100000000000D000000464E5F424553504C4154434E54010000000000
      0A00000046435F53594E4F4E594D0100000000000A00000046435F434F4D4D45
      4E540100000000000800000046435F5241494F4E010000000000080000004643
      5F504C414345010000000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsAllCarsBeforeOpen
    AfterOpen = odsAllCarsAfterOpen
    Left = 408
    Top = 200
  end
  object dsAllCars: TDataSource
    DataSet = odsAllCars
    Left = 408
    Top = 152
  end
  object dsAllTaxi: TDataSource
    DataSet = odsAllTaxi
    Left = 464
    Top = 152
  end
  object odsAllTaxi: TOracleDataSet
    SQL.Strings = (
      'select s.fk_id,'
      
        '       s.fc_name||decode(t.fc_synonym,'#39'START_CLIENT_MOVE'#39','#39'*'#39','#39'M' +
        'OVE_TO_CLIENT'#39','#39'*'#39','#39'CANCEL_CLIENT_MOVE'#39','#39'*'#39',NULL)||'#39' '#39'||'
      'fc_bag||fc_tros as fc_name,'
      '       s.fc_auto,'
      '       '#39#39' as status,'
      '       s.fn_besplatcnt, '
      '       t.fc_synonym,'
      '       s.fc_comment,'
      '       nvl((select max(r.fk_id)'
      '          from taxi.ts_raion r'
      '         where r.fk_id = nvl((select max(p.fk_raionid)'
      '                               from taxi.ts_places p'
      '                              where p.fk_id = s.fk_place),'
      '                             s.fk_place)),999999999) fk_raion,'
      '       nvl((select max(r.fn_order)'
      '          from taxi.ts_raion r'
      '         where r.fk_id = nvl((select max(p.fk_raionid)'
      '                               from taxi.ts_places p'
      '                              where p.fk_id = s.fk_place),'
      '                             s.fk_place)),999999999) fn_rorder,'
      '       nvl((select max(r.fc_name)'
      '          from taxi.ts_raion r'
      '         where r.fk_id = nvl((select max(p.fk_raionid)'
      '                               from taxi.ts_places p'
      '                              where p.fk_id = s.fk_place),'
      '                             s.fk_place)),'#39#1085#1077' '#1091#1082#1072#1079#1072#1085#39') fc_raion,'
      '(select max(p.fc_name)'
      '          from taxi.ts_places p'
      '         where p.fk_id = s.fk_place) fc_place,'
      '  x.fc_name taxi_name'
      
        '  from taxi.ts_drivers s, taxi.ts_drivereventtype t, taxi.ts_tax' +
        'i x'
      ' where s.fd_out is null'
      '   and s.fl_del = 0'
      '   and s.fk_lastdrivereventtype = t.fk_id   '
      '   and t.fl_isonline = 1'
      '   and t.fc_synonym <> '#39'MOVE_TO_CLIENT'#39
      '   and x.fk_id = s.fk_taxiid'
      
        'order by fn_rorder, s.fk_taxiid, decode(t.fc_synonym, '#39'START_CLI' +
        'ENT_MOVE'#39', 1, '#39'MOVE_TO_CLIENT'#39', 1, '#39'CANCEL_CLIENT_MOVE'#39', 1, 0) /' +
        '* s.fn_raionorder, s.fd_raionarive */ asc')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000C00000005000000464B5F49440100000000000700000046435F4E41
      4D450100000000000700000046435F4155544F01000000000006000000535441
      5455530100000000000D000000464E5F424553504C4154434E54010000000000
      0A00000046435F53594E4F4E594D0100000000000A00000046435F434F4D4D45
      4E5401000000000008000000464B5F5241494F4E01000000000009000000464E
      5F524F524445520100000000000800000046435F5241494F4E01000000000008
      00000046435F504C41434501000000000009000000544158495F4E414D450100
      00000000}
    Cursor = crSQLWait
    Session = frmMain.os
    BeforeOpen = odsAllTaxiBeforeOpen
    AfterOpen = odsAllTaxiAfterOpen
    Left = 464
    Top = 200
  end
  object JvFormStorage1: TJvFormStorage
    AppStoragePath = 'frmSetDrv\'
    StoredValues = <>
    Left = 294
    Top = 214
  end
  object odsRaionList: TOracleDataSet
    SQL.Strings = (
      'select distinct nvl((select max(r.fk_id)'
      '          from taxi.ts_raion r'
      '         where r.fk_id = nvl((select max(p.fk_raionid)'
      '                               from taxi.ts_places p'
      '                              where p.fk_id = s.fk_place),'
      '                             s.fk_place)),999999999) fk_id,'
      '       nvl((select max(r.fn_order)'
      '          from taxi.ts_raion r'
      '         where r.fk_id = nvl((select max(p.fk_raionid)'
      '                               from taxi.ts_places p'
      '                              where p.fk_id = s.fk_place),'
      '                             s.fk_place)),999999999) fn_rorder,'
      '       nvl((select max(r.fc_name)'
      '          from taxi.ts_raion r'
      '         where r.fk_id = nvl((select max(p.fk_raionid)'
      '                               from taxi.ts_places p'
      '                              where p.fk_id = s.fk_place),'
      '                             s.fk_place)),'#39#1085#1077' '#1091#1082#1072#1079#1072#1085#39') fc_name'
      ' from taxi.ts_drivers s, taxi.ts_drivereventtype t'
      ' where s.fl_del = 0'
      '   and s.fd_out is null'
      '   and s.fk_taxiid = :pfk_taxiid'
      '   and s.fk_lastdrivereventtype = t.fk_id'
      '   and t.fl_isonline = 1'
      '   and t.fc_synonym <> '#39'MOVE_TO_CLIENT'#39
      ' order by fn_rorder')
    Optimize = False
    Variables.Data = {
      03000000010000000B0000003A50464B5F544158494944030000000000000000
      000000}
    Session = frmMain.os
    Left = 552
    Top = 224
  end
  object mdAllCars: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 680
    Top = 152
  end
  object al: TActionList
    Left = 296
    Top = 152
    object aClose: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aTab: TAction
      Caption = 'aTab'
      ShortCut = 16393
      OnExecute = aTabExecute
    end
  end
  object mdAllTaxi: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 680
    Top = 208
  end
  object tmrSearch: TTimer
    Interval = 100
    OnTimer = tmrSearchTimer
    Left = 192
    Top = 120
  end
  object odsJournal: TOracleDataSet
    SQL.Strings = (
      'select * from taxi.tjournal j where j.fk_id = :pid')
    Optimize = False
    Variables.Data = {0300000001000000040000003A504944030000000000000000000000}
    Session = frmMain.os
    Left = 552
    Top = 272
  end
  object pmRaion: TPopupMenu
    Left = 369
    Top = 264
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
  object pmCars: TPopupMenu
    Left = 417
    Top = 264
    object MenuItem1: TMenuItem
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
      OnClick = MenuItem1Click
    end
  end
  object pmTaxi: TPopupMenu
    Left = 473
    Top = 264
    object MenuItem2: TMenuItem
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
      OnClick = MenuItem2Click
    end
  end
end
