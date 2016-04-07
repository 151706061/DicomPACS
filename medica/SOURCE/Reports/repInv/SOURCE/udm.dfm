object dm: Tdm
  OldCreateOrder = False
  Height = 353
  Width = 463
  object repInvMat: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.OutlineExpand = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39357.743414884300000000
    ReportOptions.LastChange = 39364.387145717600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var rCnt : integer;'
      '                                                      '
      '                    '
      ''
      'procedure MasterData5OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        ' // MasterData5.RowCount := rCnt - MasterData4.DataSet.RecordCou' +
        'nt;'
      'end;'
      ''
      'procedure Header3OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '//  rcnt := rcnt +33;  '
      'end;'
      ''
      
        'procedure Memo36OnPreviewClick(Sender: TfrxView; Button: TMouseB' +
        'utton; Shift: Integer; var Modified: Boolean);'
      'var'
      '  s: String;    '
      'begin'
      '  s := TfrxMemoView(Sender).Text;'
      '  SetLength(s, Length(s) - 2); // cut off #13#10'
      
        '  TfrxMemoView(Sender).Text := InputBox('#39#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077#39', '#39#1042#1074#1077#1076#1080 +
        #1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077':'#39', s);'
      '  Modified := True;  '
      'end;'
      ''
      ''
      'procedure Button1OnClick(Sender: TfrxComponent);'
      '    '
      'begin                                    '
      '  Set('#39'PK2'#39','#39#39#39#39'+Edit1.Text+'#39#39#39#39');'
      '  SET('#39'M1'#39','#39#39#39#39'+eM1.TEXT+'#39#39#39#39');'
      '  SET('#39'M2'#39','#39#39#39#39'+eM2.TEXT+'#39#39#39#39');'
      '  SET('#39'M3'#39','#39#39#39#39'+eM3.TEXT+'#39#39#39#39');'
      '  SET('#39'M4'#39','#39#39#39#39'+eM4.TEXT+'#39#39#39#39');'
      '  SET('#39'M5'#39','#39#39#39#39'+eM5.TEXT+'#39#39#39#39');      '
      'end;'
      ''
      'procedure MasterData2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   if Engine.FreeSpace < footer2.height then Engine.NewPage;'
      'end;'
      ''
      'procedure Footer2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        ' Engine.CurY := engine.PageHeight - TfrxFooter(sender).height-10' +
        ';'
      'end;'
      ''
      ''
      ''
      ''
      'procedure SlVedOnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '    if TfrxDBDataSet(MasterData2.DataSet).IsEmpty then'
      '  begin'
      '   Engine.ShowBand(Footer2);'
      '  end; '
      '  '
      'end;'
      ''
      ''
      ''
      'procedure SlVedTarOnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '   if TfrxDBDataSet(MasterData3.DataSet).IsEmpty then'
      '  begin'
      '   Engine.ShowBand(footer1);'
      '  end;  '
      'end;'
      ''
      'procedure Memo39OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  TfrxMemoView(sender).memo.text := <PK2>;         '
      '        '
      'end;'
      ''
      '   '
      
        'procedure DialogPage1OnCloseQuery(Sender: TfrxComponent; var Can' +
        'Close: Boolean);'
      'begin'
      '            '
      'end;'
      ''
      ''
      ''
      'begin'
      ''
      'end.')
    Left = 32
    Top = 16
    Datasets = <
      item
        DataSet = dsOLSpirt
        DataSetName = 'dsOLSpirt'
      end
      item
        DataSet = dsOLToxic
        DataSetName = 'dsOLToxic'
      end
      item
        DataSet = dsOpisFR
        DataSetName = 'dsOpis'
      end
      item
        DataSet = dsSlVed1
        DataSetName = 'dsSlVedTar'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'PK2'
        Value = Null
      end
      item
        Name = 'M1'
        Value = Null
      end
      item
        Name = 'M2'
        Value = Null
      end
      item
        Name = 'M3'
        Value = Null
      end
      item
        Name = 'M4'
        Value = Null
      end
      item
        Name = 'M5'
        Value = Null
      end
      item
        Name = 'Place'
        Value = ''
      end
      item
        Name = 'Dat'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object DialogPage1: TfrxDialogPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Visible = False
      BorderStyle = bsToolWindow
      Height = 253.000000000000000000
      ClientHeight = 226.000000000000000000
      Left = 627.000000000000000000
      Top = 160.000000000000000000
      Width = 317.000000000000000000
      ClientWidth = 309.000000000000000000
      OnCloseQuery = 'DialogPage1OnCloseQuery'
      object Edit1: TfrxEditControl
        Left = 8.000000000000000000
        Top = 28.000000000000000000
        Width = 289.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        MaxLength = 0
        PasswordChar = #0
      end
      object Label1: TfrxLabelControl
        Left = 8.000000000000000000
        Top = 8.000000000000000000
        Width = 237.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = #1055#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1100' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1086#1085#1085#1086#1081' '#1082#1086#1084#1080#1089#1089#1080#1080':'
        Color = clBtnFace
      end
      object Label2: TfrxLabelControl
        Left = 8.000000000000000000
        Top = 56.000000000000000000
        Width = 82.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = #1063#1083#1077#1085#1099' '#1082#1086#1084#1080#1089#1089#1080#1080
        Color = clBtnFace
      end
      object Button1: TfrxButtonControl
        Left = 108.000000000000000000
        Top = 188.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
        Caption = 'OK'
        ModalResult = 1
        OnClick = 'Button1OnClick'
      end
      object Label3: TfrxLabelControl
        Left = 8.000000000000000000
        Top = 78.000000000000000000
        Width = 10.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = '1.'
        Color = clBtnFace
      end
      object Label4: TfrxLabelControl
        Left = 8.000000000000000000
        Top = 99.000000000000000000
        Width = 10.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = '2.'
        Color = clBtnFace
      end
      object eM1: TfrxEditControl
        Left = 24.000000000000000000
        Top = 72.000000000000000000
        Width = 273.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        MaxLength = 0
        PasswordChar = #0
      end
      object eM2: TfrxEditControl
        Left = 24.000000000000000000
        Top = 95.000000000000000000
        Width = 273.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        MaxLength = 0
        PasswordChar = #0
      end
      object Label5: TfrxLabelControl
        Left = 8.000000000000000000
        Top = 121.000000000000000000
        Width = 10.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = '3.'
        Color = clBtnFace
      end
      object Label6: TfrxLabelControl
        Left = 8.000000000000000000
        Top = 144.000000000000000000
        Width = 10.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = '4.'
        Color = clBtnFace
      end
      object eM3: TfrxEditControl
        Left = 24.000000000000000000
        Top = 116.000000000000000000
        Width = 273.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        MaxLength = 0
        PasswordChar = #0
      end
      object eM4: TfrxEditControl
        Left = 24.000000000000000000
        Top = 139.000000000000000000
        Width = 273.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        MaxLength = 0
        PasswordChar = #0
      end
      object Label7: TfrxLabelControl
        Left = 8.000000000000000000
        Top = 165.000000000000000000
        Width = 10.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = '5.'
        Color = clBtnFace
      end
      object eM5: TfrxEditControl
        Left = 24.000000000000000000
        Top = 160.000000000000000000
        Width = 273.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        MaxLength = 0
        PasswordChar = #0
      end
    end
    object Title: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 873.071430000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Top = 211.653680000000000000
          Width = 718.110700000000000000
          Height = 49.133890000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Align = baWidth
          Top = 260.787570000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#1029#1056#1109'-'#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1057#8230' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#181#1056#8470)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 430.866420000000000000
          Top = 294.803340000000000000
          Width = 158.740260000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1105' '#1074#8222#8211'  ______')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Top = 317.480520000000000000
          Width = 143.622140000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#1108#1056#176#1056#183' '#1074#8222#8211'  ____')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 502.677490000000000000
          Top = 340.157700000000000000
          Width = 215.433210000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1109#1057#8218'  __________  20 __ '#1056#1110'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 132.283550000000000000
          Top = 438.425480000000000000
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              ' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039' '#1056#1029#1056#176#1057#8225#1056#176#1057#8218#1056#176' .....................' +
              '........ 20 ....  '#1056#1110'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 7.559060000000000000
          Top = 404.409710000000000000
          Width = 136.063080000000000000
          Height = 75.590600000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#187#1056#176#1056#1029#1056#1109#1056#1030#1056#176#1057#1039
            '..........................'
            #1056#8217#1056#1029#1056#181#1056#1111#1056#187#1056#176#1056#1029#1056#1109#1056#1030#1056#176#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Align = baWidth
          Top = 495.118430000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039' '#1056#1109#1056#1108#1056#1109#1056#1029#1057#8225#1056#181#1056#1029#1056#176' ..................' +
              '..................................... 20 ....  '#1056#1110'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Align = baWidth
          Top = 566.929499999999900000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108 +
              #1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'  ................................................' +
              '.......')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Align = baWidth
          Top = 600.945270000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#167#1056#187#1056#181#1056#1029#1057#8249' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105 +
              ':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 393.071120000000000000
          Top = 563.149970000000100000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PK2]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 75.590600000000000000
          Top = 638.740570000000000000
          Width = 589.606680000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '1. _____________________________________________________________' +
              '_____________')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 75.590600000000000000
          Top = 672.756340000000000000
          Width = 589.606680000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '2. _____________________________________________________________' +
              '_____________')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 75.590600000000000000
          Top = 707.551640000000000000
          Width = 589.606680000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '3. _____________________________________________________________' +
              '_____________')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 75.590600000000000000
          Top = 744.567410000000000000
          Width = 589.606680000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '4. _____________________________________________________________' +
              '_____________')
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          Left = 75.590600000000000000
          Top = 778.583180000000000000
          Width = 589.606680000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '5. _____________________________________________________________' +
              '_____________')
          ParentFont = False
        end
        object Memo137: TfrxMemoView
          Left = 98.267780000000000000
          Top = 634.961040000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[M1]')
          ParentFont = False
        end
        object Memo139: TfrxMemoView
          Left = 98.267780000000000000
          Top = 668.976810000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[M2]')
          ParentFont = False
        end
        object Memo140: TfrxMemoView
          Left = 98.267780000000000000
          Top = 703.772110000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[M3]')
          ParentFont = False
        end
        object Memo141: TfrxMemoView
          Left = 98.267780000000000000
          Top = 740.787880000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[M4]')
          ParentFont = False
        end
        object Memo142: TfrxMemoView
          Left = 98.267780000000000000
          Top = 774.803650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[M5]')
          ParentFont = False
        end
        object Memo143: TfrxMemoView
          Left = 283.464750000000000000
          Top = 653.858690000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#8222'., '#1056#1105'., '#1056#1109'.,'#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo144: TfrxMemoView
          Left = 283.464750000000000000
          Top = 687.874460000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#8222'., '#1056#1105'., '#1056#1109'.,'#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo145: TfrxMemoView
          Left = 283.464750000000000000
          Top = 722.669760000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#8222'., '#1056#1105'., '#1056#1109'.,'#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo146: TfrxMemoView
          Left = 283.464750000000000000
          Top = 759.685530000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#8222'., '#1056#1105'., '#1056#1109'.,'#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo162: TfrxMemoView
          Left = 283.464750000000000000
          Top = 793.701300000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#8222'., '#1056#1105'., '#1056#1109'.,'#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
      end
    end
    object Page2: TfrxReportPage
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftBottom]
      object PageHeader2: TfrxPageHeader
        Height = 642.520100000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Align = baWidth
          Top = 15.118120000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1115#1056#8221#1056#1119#1056#152#1056#1038#1056#1113#1056#1106)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Align = baWidth
          Top = 75.590600000000000000
          Width = 718.110700000000000000
          Height = 56.692950000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            
              #1056#1031' ('#1056#1112#1057#8249') '#1056#1029#1056#1105#1056#182#1056#181#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#176#1056#1030#1057#8364#1056#1105#1056#181#1057#1027#1057#1039', '#1056#183#1056#176#1056#1030#1056#181#1056#1169#1057#1107#1057#1035#1057#8240#1056#1105 +
              #1056#8470' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470'('#1056#1112#1056#176#1056#1110#1056#176#1056#183#1056#1105#1056#1029#1056#1109#1056#1112') ')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Align = baWidth
          Top = 188.976500000000000000
          Width = 718.110700000000000000
          Height = 147.401670000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haBlock
          Memo.UTF8 = (
            
              #1056#1169#1056#176#1057#1035' ('#1056#1169#1056#176#1056#181#1056#1112') '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1057#1107#1057#1035' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1108#1057#1107' '#1056#1109' '#1057#8218#1056#1109#1056#1112',' +
              ' '#1057#8225#1057#8218#1056#1109' '#1056#1108' '#1056#1112#1056#1109#1056#1112#1056#181#1056#1029#1057#8218#1057#1107' '#1056#1029#1056#176#1057#8225#1056#176#1056#187#1056#176' '#1056#1111#1056#1109#1056#1030#1056#181#1056#1169#1056#181#1056#1029#1056#1105#1057#1039' '#1056#1105#1056#1029#1056#1030 +
              #1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105' '#1056#1030#1057#1027#1056#181' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1056#1029#1057#8249#1056#181' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057 +
              #8218#1057#8249' '#1056#1029#1056#176' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1057#8249', '#1057#8218#1056#176#1057#1026#1057#1107' '#1056#1105' '#1056#1169#1057#1026#1057#1107#1056#1110#1056#1105#1056#181' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105 +
              ' '#1056#1030#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1057#8249' '#1056#1030' '#1056#1109#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1105' '#1056#1108' '#1056#1112#1056#1109#1056#1112#1056#181#1056#1029#1057#8218#1057#1107' '#1056#1030#1056#181#1056#1169#1056#181#1056#1029#1056 +
              #1105#1057#1039' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105' '#1056#1030#1057#1027#1056#181' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1057#8249' '#1056#1105' '#1057#8218#1056#176#1057#1026#1056#176 +
              ', '#1056#1111#1056#1109#1057#1027#1057#8218#1057#1107#1056#1111#1056#1105#1056#1030#1057#8364#1056#1105#1056#181' '#1056#1029#1056#176' '#1056#1112#1056#1109#1057#1035'('#1056#1029#1056#176#1057#8364#1057#1107') '#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056 +
              #181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1109#1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1057#8249', '#1056#1030#1057#8249#1056#177#1057#8249#1056#1030#1057#8364#1056#1105#1056#181' '#1057#1027#1056#1111#1056#1105 +
              #1057#1027#1056#176#1056#1029#1057#8249' '#1056#1030' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169'. '#1056#1116#1056#1105#1056#1108#1056#176#1056#1108#1056#1105#1057#8230' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#1109#1056#1030' '#1056#1105 +
              ' '#1056#1029#1056#176#1056#187#1056#1105#1057#8225#1056#1029#1057#8249#1057#8230' '#1056#1169#1056#181#1056#1029#1056#181#1056#1110' '#1056#1029#1056#176' '#1057#1026#1057#1107#1056#1108#1056#176#1057#8230' '#1057#1107' '#1056#1112#1056#181#1056#1029#1057#1039' ('#1056#1029#1056#176#1057#1027 +
              ') '#1056#1029#1056#181' '#1056#1109#1057#1027#1057#8218#1056#176#1056#187#1056#1109#1057#1027#1057#1034'. '#1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1108#1056#1105' '#1056#1029#1056#176' '#1056#1112#1056#1109#1056#1112#1056#181#1056#1029#1057#8218' '#1056#1105#1056#1029#1056#1030 +
              #1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105' '#1056#1111#1056#1109' '#1056#1112#1056#1109#1056#1105#1056#1112' ('#1056#1029#1056#176#1057#8364#1056#1105#1056#1112') '#1056#183#1056#176#1056#1111#1056#1105#1057#1027#1057#1039#1056#1112 +
              ' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1057#1039#1057#1035#1057#8218' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1057#8249' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' '#1057#1026#1057#1107#1056#177)
          ParentFont = False
          WordBreak = True
        end
        object Memo14: TfrxMemoView
          Align = baWidth
          Top = 162.519790000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            
              #1056#1029#1056#176#1057#8230#1056#1109#1056#1169#1057#1039#1057#8240#1056#181#1056#8470#1057#1027#1057#1039'('#1056#1029#1056#176#1057#8230#1056#1109#1056#1169#1057#1039#1057#8240#1056#181#1056#1110#1056#1109#1057#1027#1057#1039') '#1056#1030' '#1056#1110#1056#1109#1057#1026#1056#1109#1056#1169#1056#181 +
              '('#1057#1027#1056#181#1056#187#1056#181')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Align = baWidth
          Top = 132.283550000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1112'. '#1056#183#1056#176#1056#1030#1056#181#1056#1169#1057#1107#1057#8240#1056#181#1056#1110#1056#1109' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470' ('#1056#1112#1056#176#1056#1110#1056#176#1056#183#1056#1105#1056#1029#1056#1109#1056#1112')')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Align = baLeft
          Top = 343.937230000000000000
          Width = 181.417440000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1118#1056#1109#1056#1030#1056#176#1057#1026#1057#8249' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Align = baLeft
          Top = 366.614410000000000000
          Width = 192.756030000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1118#1056#1109#1056#1111#1056#187#1056#1105#1056#1030#1056#1109' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Align = baLeft
          Top = 393.070866140000000000
          Width = 241.889920000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1114'-'#1057#8224' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1057#1039' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          Left = 181.417440000000000000
          Top = 343.937230000000000000
          Width = 536.693260000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Align = baLeft
          Left = 192.756030000000000000
          Top = 370.393940000000000000
          Width = 525.354352680000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          Left = 241.889920000000000000
          Top = 393.070866140000000000
          Width = 476.220780000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Align = baWidth
          Top = 415.748300000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          Top = 442.205010000000000000
          Width = 230.551330000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026#1056#1109#1056#8470#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1056#1109#1056#1030' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Align = baLeft
          Left = 230.551330000000000000
          Top = 442.205010000000000000
          Width = 487.559370000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Align = baWidth
          Top = 480.000310000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109'-'#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1056#181' '#1056#187#1056#1105#1057#8224#1056#176':')
          ParentFont = False
        end
        object Memo163: TfrxMemoView
          Left = 468.661720000000000000
          Top = 514.016080000000000000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '1. ____________________________')
          ParentFont = False
        end
        object Memo164: TfrxMemoView
          Left = 468.661720000000000000
          Top = 548.031849999999900000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '2. ____________________________')
          ParentFont = False
        end
        object Memo165: TfrxMemoView
          Left = 468.661720000000000000
          Top = 582.827150000000000000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '3. ____________________________')
          ParentFont = False
        end
        object Memo166: TfrxMemoView
          Left = 536.693260000000000000
          Top = 529.134199999999900000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#8222'., '#1056#1105'., '#1056#1109'.,'#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo167: TfrxMemoView
          Left = 536.693260000000000000
          Top = 563.149970000000100000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#8222'., '#1056#1105'., '#1056#1109'.,'#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo168: TfrxMemoView
          Left = 536.693260000000000000
          Top = 597.945270000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#8222'., '#1056#1105'., '#1056#1109'.,'#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 502.677490000000000000
          Top = 94.488250000000000000
          Width = 207.874150000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 120.944960000000000000
          Width = 706.772110000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Left = 306.141930000000000000
          Top = 147.401670000000000000
          Width = 404.409710000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo65: TfrxMemoView
          Left = 359.055350000000000000
          Top = 158.740260000000000000
          Width = 347.716760000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            #1056#1168#1056#176#1056#1029#1057#8218#1057#8249' - '#1056#1114#1056#176#1056#1029#1057#1027#1056#1105#1056#8470#1057#1027#1056#1108)
          ParentFont = False
        end
      end
    end
    object SlVed: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      OnAfterPrint = 'SlVedOnAfterPrint'
      object MasterData2: TfrxMasterData
        Height = 22.677180000000000000
        Top = 389.291590000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData2OnBeforePrint'
        DataSet = dsOpisFR
        DataSetName = 'dsOpis'
        OutlineText = '23'
        RowCount = 0
        Stretched = True
        object Memo34: TfrxMemoView
          Width = 257.008040000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = dsOpisFR
          DataSetName = 'dsOpis'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[dsOpis."FC_NAME"]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Align = baLeft
          Left = 257.008040000000000000
          Width = 71.810999210000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          DataSet = dsOpisFR
          DataSetName = 'dsOpis'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8 = (
            '[dsOpis."FN_KOLOST"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 393.071120000000000000
          Width = 147.401599210000000000
          Height = 22.677180000000000000
          OnPreviewClick = 'Memo36OnPreviewClick'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 540.472790000000000000
          Width = 83.149589210000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Align = baWidth
          Left = 328.819039210000000000
          Width = 64.252080790000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          AutoWidth = True
          DataField = 'EDIZM'
          DataSet = dsOpisFR
          DataSetName = 'dsOpis'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[dsOpis."EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle4: TfrxReportTitle
        Height = 264.567100000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo27: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#187#1056#1105#1057#8225#1056#1105#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#176#1057#1039' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1057#1034'-'#1056#176#1056#1108#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = -3.779530000000000000
          Top = 45.354360000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1056#1109#1057#1026#1056#1109#1056#1169' ('#1057#1027#1056#181#1056#187#1056#1109') ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 109.606370000000000000
          Top = 45.354360000000000000
          Width = 430.866420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Place]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 540.472790000000000000
          Top = 45.354360000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Dat]  '#1056#1110'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Align = baWidth
          Top = 75.590600000000000000
          Width = 718.110700000000000000
          Height = 83.149660000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              #1056#1114#1057#8249', '#1056#1029#1056#1105#1056#182#1056#181#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#176#1056#1030#1057#8364#1056#1105#1056#181#1057#1027#1057#1039', '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1057#1039' '#1056#1030' '#1057#1027 +
              #1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#181' '#1056#1111#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1039' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105 +
              #1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105' ____________________________________' +
              '_____________, '#1057#8225#1056#187#1056#181#1056#1029#1056#1109#1056#1030' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105)
          ParentFont = False
          WordBreak = True
        end
        object Memo32: TfrxMemoView
          Align = baWidth
          Top = 170.078850000000000000
          Width = 718.110700000000000000
          Height = 71.811070000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1030' '#1056#1111#1057#1026#1056#1105#1057#1027#1057#1107#1057#8218#1057#1027#1057#8218#1056#1030#1056#1105#1056#1105' '#1056#1112#1056#176#1057#8218'.-'#1056#1109#1057#8218#1056#1030'. '#1056#187#1056#1105#1057#8224#1056#176' _____________' +
              '______ '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1056#187#1056#1105' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#1105#1056#8470' '#1056#176#1056#1108#1057#8218' '#1056#1109' '#1057#1027#1056#187#1056#1105#1057#8225#1056 +
              #181#1056#1029#1056#1105#1056#1105' '#1057#8222#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1056#1029#1056#176#1056#187#1056#1105#1057#8225#1056#1105#1057#1039' '#1056#1029#1056#176#1057#1026#1056#1108#1056#1109#1057#8218#1056#1105#1057#8225 +
              #1056#181#1057#1027#1056#1108#1056#1105#1057#8230', '#1056#1111#1057#1027#1056#1105#1057#8230#1056#1109#1057#8218#1057#1026#1056#1109#1056#1111#1056#1029#1057#8249#1057#8230', '#1056#1038#1056#8221' '#1056#1105' '#1057#1039#1056#1169#1056#1109#1056#1030#1056#1105#1057#8218#1057#8249#1057#8230' '#1056 +
              #1111#1057#1026#1056#181#1056#1111#1056#176#1057#1026#1056#176#1057#8218#1056#1109#1056#1030' '#1057#1027' '#1056#1108#1056#1029#1056#1105#1056#1110#1056#1109#1056#8470' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176' '#1056#1111#1056#1109' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#1109#1057#1039 +
              #1056#1029#1056#1105#1057#1035' '#1056#1029#1056#176'  [Dat]  '#1056#1110'.')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Align = baWidth
          Top = 241.889920000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1057#1027#1057#8218#1056#176#1056#1029#1056#1109#1056#1030#1056#187#1056#181#1056#1029#1056#1109' '#1057#1027#1056#187#1056#181#1056#1169#1057#1107#1057#1035#1057#8240#1056#181#1056#181':')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 37.795300000000000000
          Top = 96.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PK2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          Left = 642.520100000000000000
          Top = 115.385900000000000000
          Width = 71.811070000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo67: TfrxMemoView
          Left = 3.779530000000000000
          Top = 116.165430000000000000
          Width = 706.772110000000000000
          Height = 45.354360000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[M1], [M2], [M3]')
          ParentFont = False
        end
        object Line15: TfrxLineView
          Left = 3.779530000000000000
          Top = 136.622140000000000000
          Width = 706.772110000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object Footer2: TfrxFooter
        Height = 181.417440000000000000
        Top = 434.645950000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'Footer2OnBeforePrint'
        object Memo44: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108 +
              #1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'  _________________________________')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 389.291590000000000000
          Top = 22.677180000000020000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249':')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 389.291590000000000000
          Top = 105.826840000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218'-'#1056#1109#1057#8218#1056#1030'. '#1056#187#1056#1105#1057#8224#1056#1109':')
          ParentFont = False
        end
        object Memo169: TfrxMemoView
          Left = 393.071120000000000000
          Top = 3.779530000000022000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PK2]')
          ParentFont = False
        end
        object Memo170: TfrxMemoView
          Left = 483.779840000000000000
          Top = 22.677180000000020000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '1. ____________________________')
          ParentFont = False
        end
        object Memo171: TfrxMemoView
          Left = 483.779840000000000000
          Top = 45.354359999999990000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '2. ____________________________')
          ParentFont = False
        end
        object Memo172: TfrxMemoView
          Left = 483.779840000000000000
          Top = 68.811069999999970000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '3. ____________________________')
          ParentFont = False
        end
        object Memo173: TfrxMemoView
          Left = 525.354670000000000000
          Top = 105.826840000000000000
          Width = 192.756030000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo174: TfrxMemoView
          Align = baWidth
          Top = 128.504020000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo175: TfrxMemoView
          Align = baWidth
          Top = 151.960730000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo179: TfrxMemoView
          Left = 510.236550000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[M1]')
          ParentFont = False
        end
        object Memo180: TfrxMemoView
          Left = 510.236550000000000000
          Top = 41.574830000000020000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[M2]')
          ParentFont = False
        end
        object Memo181: TfrxMemoView
          Left = 510.236550000000000000
          Top = 65.031540000000010000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[M3]')
          ParentFont = False
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        Height = 22.677180000000000000
        Top = 306.141930000000000000
        Width = 718.110700000000000000
        object Memo103: TfrxMemoView
          Width = 257.008040000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo104: TfrxMemoView
          Left = 257.008040000000000000
          Width = 136.063009210000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1029#1056#1105#1056#182#1056#1029#1057#8249#1056#8470' '#1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo133: TfrxMemoView
          Left = 393.071120000000000000
          Width = 147.401599210000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1105#1056#8470' '#1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo134: TfrxMemoView
          Left = 540.472790000000000000
          Width = 83.149589210000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1056#183#1056#187#1056#1105#1057#8364#1056#1108#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo136: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#181#1056#1169#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object SlVedTar: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      OnAfterPrint = 'SlVedTarOnAfterPrint'
      object MasterData3: TfrxMasterData
        Height = 22.677165350000000000
        Top = 374.173470000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData2OnBeforePrint'
        DataSet = dsSlVed1
        DataSetName = 'dsSlVedTar'
        RowCount = 0
        Stretched = True
        object Memo57: TfrxMemoView
          Width = 211.653680000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FC_NAME'
          DataSet = dsSlVed1
          DataSetName = 'dsSlVedTar'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[dsSlVedTar."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 211.653680000000000000
          Width = 117.165430000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = dsSlVed1
          DataSetName = 'dsSlVedTar'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dsSlVedTar."FN_KOLOST"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 328.819110000000000000
          Width = 151.181200000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 480.000310000000000000
          Width = 105.826840000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 585.827150000000000000
          Width = 132.283550000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 174.637910000000000000
        Top = 419.527830000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'Footer2OnBeforePrint'
        KeepChild = True
        object Memo182: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108 +
              #1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'  _________________________________')
          ParentFont = False
        end
        object Memo183: TfrxMemoView
          Left = 389.291590000000000000
          Top = 22.677180000000080000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249':')
          ParentFont = False
        end
        object Memo184: TfrxMemoView
          Left = 389.291590000000000000
          Top = 105.826840000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218'-'#1056#1109#1057#8218#1056#1030'. '#1056#187#1056#1105#1057#8224#1056#1109':')
          ParentFont = False
        end
        object Memo185: TfrxMemoView
          Left = 393.071120000000000000
          Top = 3.779530000000022000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PK2]')
          ParentFont = False
        end
        object Memo186: TfrxMemoView
          Left = 483.779840000000000000
          Top = 22.677180000000080000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '1. ____________________________')
          ParentFont = False
        end
        object Memo187: TfrxMemoView
          Left = 483.779840000000000000
          Top = 45.354359999999700000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '2. ____________________________')
          ParentFont = False
        end
        object Memo188: TfrxMemoView
          Left = 483.779840000000000000
          Top = 68.811069999999580000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '3. ____________________________')
          ParentFont = False
        end
        object Memo189: TfrxMemoView
          Left = 525.354670000000000000
          Top = 105.826840000000000000
          Width = 192.756030000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo190: TfrxMemoView
          Align = baWidth
          Top = 128.504020000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo191: TfrxMemoView
          Align = baWidth
          Top = 151.960729999999000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo192: TfrxMemoView
          Left = 510.236550000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[M1]')
          ParentFont = False
        end
        object Memo193: TfrxMemoView
          Left = 510.236550000000000000
          Top = 41.574830000000020000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[M2]')
          ParentFont = False
        end
        object Memo194: TfrxMemoView
          Left = 510.236550000000000000
          Top = 65.031540000000010000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[M3]')
          ParentFont = False
        end
      end
      object ReportTitle2: TfrxReportTitle
        Height = 241.889920000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo51: TfrxMemoView
          Align = baWidth
          Top = 219.212740000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1057#1027#1057#8218#1056#176#1056#1029#1056#1109#1056#1030#1056#187#1056#181#1056#1029#1056#1109' '#1057#1027#1056#187#1056#181#1056#1169#1057#1107#1057#1035#1057#8240#1056#181#1056#181':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#187#1056#1105#1057#8225#1056#1105#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#176#1057#1039' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1057#1034'-'#1056#176#1056#1108#1057#8218)
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Align = baWidth
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176' '#1057#8218#1056#176#1057#1026#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo177: TfrxMemoView
          Top = 49.133889999999990000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1056#1109#1057#1026#1056#1109#1056#1169' ('#1057#1027#1056#181#1056#187#1056#1109') ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo178: TfrxMemoView
          Left = 113.385900000000000000
          Top = 49.133889999999990000
          Width = 438.425480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Place]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo205: TfrxMemoView
          Left = 551.811380000000000000
          Top = 49.133889999999990000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '[Dat]  '#1056#1110'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo206: TfrxMemoView
          Align = baWidth
          Top = 80.590600000000000000
          Width = 718.110700000000000000
          Height = 83.149660000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              #1056#1114#1057#8249', '#1056#1029#1056#1105#1056#182#1056#181#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#176#1056#1030#1057#8364#1056#1105#1056#181#1057#1027#1057#1039', '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1057#1039' '#1056#1030' '#1057#1027 +
              #1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#181' '#1056#1111#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1039' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105 +
              #1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105' ____________________________________' +
              '_____________, '#1057#8225#1056#187#1056#181#1056#1029#1056#1109#1056#1030' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105)
          ParentFont = False
          WordBreak = True
        end
        object Memo207: TfrxMemoView
          Align = baWidth
          Top = 170.078850000000000000
          Width = 718.110700000000000000
          Height = 49.133890000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1030' '#1056#1111#1057#1026#1056#1105#1057#1027#1057#1107#1057#8218#1057#1027#1057#8218#1056#1030#1056#1105#1056#1105' '#1056#1112#1056#176#1057#8218'.-'#1056#1109#1057#8218#1056#1030'. '#1056#187#1056#1105#1057#8224#1056#176' _____________' +
              '______ '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1056#187#1056#1105' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#1105#1056#8470' '#1056#176#1056#1108#1057#8218' '#1056#1109' '#1057#1027#1056#187#1056#1105#1057#8225#1056 +
              #181#1056#1029#1056#1105#1056#1105' '#1057#8222#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1056#1029#1056#176#1056#187#1056#1105#1057#8225#1056#1105#1057#1039' '#1057#8218#1056#176#1057#1026#1057#8249' '#1057#1027' '#1056#1108#1056#1029 +
              #1056#1105#1056#1110#1056#1109#1056#8470' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176' '#1056#1111#1056#1109' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#1109#1057#1039#1056#1029#1056#1105#1057#1035' '#1056#1029#1056#176'  [Dat]  '#1056#1110'.')
          ParentFont = False
        end
        object Memo208: TfrxMemoView
          Left = 37.795300000000000000
          Top = 98.267780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PK2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line5: TfrxLineView
          Left = 646.299630000000000000
          Top = 119.165430000000000000
          Width = 68.031540000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line16: TfrxLineView
          Left = 3.779530000000000000
          Top = 142.401670000000000000
          Width = 710.551640000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo156: TfrxMemoView
          Left = 3.779530000000000000
          Top = 119.944960000000000000
          Width = 706.772110000000000000
          Height = 45.354360000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[M1], [M2], [M3]')
          ParentFont = False
        end
      end
      object ColumnHeader4: TfrxColumnHeader
        Height = 30.236240000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        object Memo52: TfrxMemoView
          Width = 211.653680000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 211.653680000000000000
          Width = 117.165430000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1029#1056#1105#1056#182#1056#1029#1057#8249#1056#8470' '#1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 328.819110000000000000
          Width = 151.181200000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#181' '#1056#1029#1056#176#1056#187#1056#1105#1057#8225#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 480.000310000000000000
          Width = 105.826840000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1056#183#1056#187#1056#1105#1057#8364#1056#1108#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 585.827150000000000000
          Width = 132.283550000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#181#1056#1169#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object OLToxic: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle3: TfrxReportTitle
        Height = 52.913420000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo62: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1056#1111#1056#1105#1057#1027#1056#1029#1056#1109#1056#8470' '#1056#187#1056#1105#1057#1027#1057#8218' '#1074#8222#8211)
          ParentFont = False
        end
        object Memo138: TfrxMemoView
          Align = baWidth
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1039#1056#1169#1056#1109#1056#1030#1056#1105#1057#8218#1057#8249#1056#181' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1056#181' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030#1056#176)
          ParentFont = False
        end
      end
      object MasterData4: TfrxMasterData
        Height = 22.677167800000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        DataSet = dsOLToxic
        DataSetName = 'dsOLToxic'
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo77: TfrxMemoView
          Width = 26.456710000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 26.456710000000000000
          Width = 26.456710000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          Rotation = 90
        end
        object Memo79: TfrxMemoView
          Left = 52.913420000000000000
          Width = 238.110390000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FC_NAME'
          DataSet = dsOLToxic
          DataSetName = 'dsOLToxic'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[dsOLToxic."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 291.023810000000000000
          Width = 60.472480000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'EDIZM'
          DataSet = dsOLToxic
          DataSetName = 'dsOLToxic'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dsOLToxic."EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590599999999990000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_KOLOST'
          DataSet = dsOLToxic
          DataSetName = 'dsOLToxic'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dsOLToxic."FN_KOLOST"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 427.086890000000000000
          Width = 68.031540000000010000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_PRICE'
          DataSet = dsOLToxic
          DataSetName = 'dsOLToxic'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dsOLToxic."FN_PRICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 495.118430000000000000
          Width = 68.031540000000010000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'SUMM'
          DataSet = dsOLToxic
          DataSetName = 'dsOLToxic'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dsOLToxic."SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 563.149970000000000000
          Width = 71.811070000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'SER'
          DataSet = dsOLToxic
          DataSetName = 'dsOLToxic'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dsOLToxic."SER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 634.961040000000000000
          Width = 83.149660000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter2: TfrxPageFooter
        Height = 181.417440000000000000
        Top = 359.055350000000000000
        Width = 718.110700000000000000
        object Memo88: TfrxMemoView
          Align = baWidth
          Top = 75.590600000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'                       ' +
              '                   '#1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105' '#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109'-'#1056#1109#1057#8218#1056#1030#1056 +
              #181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1057#8230' '#1056#187#1056#1105#1057#8224)
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          Align = baWidth
          Top = 120.944960000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105' '#1057#8225#1056#187#1056#181#1056#1029#1056#1109#1056#1030' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470 +
              ' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo86: TfrxMemoView
          Top = 18.897650000000110000
          Width = 128.504020000000000000
          Height = 56.692950000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1027#1057#8218#1057#1026'-'#1057#8224#1056#181' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 128.504020000000000000
          Top = 18.897650000000000000
          Width = 589.606680000000000000
          Height = 56.692950000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '   '#1056#1119#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1056#1109#1056#1030#1057#8249#1057#8230' '#1074#8222#8211' _________________________ '#1057#1027' '#1074#8222#8211' ___' +
              '__________ '#1056#1111#1056#1109' '#1074#8222#8211' ________________'
            ''
            
              '   '#1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#1029#1056#176#1057#8218#1057#1107#1057#1026#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1057#8230' '#1056#1111#1056#1109#1056#1108#1056#176#1056#183#1056#176#1057#8218#1056#181#1056 +
              #187#1056#181#1056#8470' ____________________________________________')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 52.913420000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1105#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1027#1057#8218#1057#1026'-'#1057#8224#1056#181)
          ParentFont = False
        end
        object Memo91: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590600000000000000
          Height = 18.897637800000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -15
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = 'value = 0'
          Memo.UTF8 = (
            '[SUM(<dsOLToxic."FN_KOLOST">,MasterData4)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 154.960730000000000000
          Top = 71.811069999999970000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          VAlign = vaCenter
        end
        object Line7: TfrxLineView
          Left = 585.827150000000000000
          Top = 90.708720000000030000
          Width = 124.724490000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          Left = 3.779530000000000000
          Top = 115.606370000000000000
          Width = 706.772110000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line6: TfrxLineView
          Left = 302.362400000000000000
          Top = 151.181200000000000000
          Width = 408.189240000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object MasterData5: TfrxMasterData
        Height = 22.677167800000000000
        Top = 275.905690000000000000
        Visible = False
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData5OnBeforePrint'
        RowCount = 0
        Stretched = True
        object Memo92: TfrxMemoView
          Width = 26.456710000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 26.456710000000000000
          Width = 26.456710000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          Rotation = 90
        end
        object Memo94: TfrxMemoView
          Left = 52.913420000000000000
          Width = 238.110390000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = dsSlVed1
          DataSetName = 'dsSlVedTar'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 291.023810000000000000
          Width = 60.472480000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590600000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = dsSlVed1
          DataSetName = 'dsSlVedTar'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 427.086890000000000000
          Width = 68.031540000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 495.118430000000000000
          Width = 68.031540000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 563.149970000000000000
          Width = 71.811070000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo100: TfrxMemoView
          Left = 634.961040000000000000
          Width = 83.149660000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ColumnHeader2: TfrxColumnHeader
        Height = 75.590575590000000000
        Top = 94.488250000000000000
        Width = 718.110700000000000000
        object Memo63: TfrxMemoView
          Width = 26.456710000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111#1056#1111)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 26.456710000000000000
          Width = 26.456710000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1056#1029#1056#1108#1056#187' '#1074#8222#8211)
          ParentFont = False
          Rotation = 90
        end
        object Memo69: TfrxMemoView
          Left = 52.913420000000000000
          Width = 238.110390000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#1109#1056#1030' '#1056#1105' '#1056#1169#1057#1026#1057#1107#1056#1110#1056#1105#1057#8230' '#1057#8224#1056#181#1056#1029#1056#1029 +
              #1056#1109#1057#1027#1057#8218#1056#181#1056#8470' '#1056#1111#1056#1109' '#1056#1111#1056#176#1057#1026#1057#8218#1056#1105#1057#1039#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 291.023810000000000000
          Width = 60.472480000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590600000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 427.086890000000000000
          Top = 37.795300000000000000
          Width = 68.031540000000000000
          Height = 37.795275590000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 427.086890000000000000
          Width = 136.063080000000000000
          Height = 37.795275590000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1057#1026#1056#1109#1056#183#1056#1029#1056#1105#1057#8225#1056#1029#1057#8249#1056#1112' '#1057#8224#1056#181#1056#1029#1056#176#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 495.118430000000000000
          Top = 37.795300000000000000
          Width = 68.031540000000000000
          Height = 37.795275590000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 563.149970000000000000
          Width = 71.811070000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211#1074#8222#8211' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111', '#1057#1027#1056#181#1057#1026#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 634.961040000000000000
          Width = 83.149660000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#1112#1056#181#1057#8225#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object OLTar: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle5: TfrxReportTitle
        Height = 52.913420000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle3OnBeforePrint'
        object Memo105: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1056#1111#1056#1105#1057#1027#1056#1029#1056#1109#1056#8470' '#1056#187#1056#1105#1057#1027#1057#8218' '#1074#8222#8211)
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Align = baWidth
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#8218#1056#176#1057#1026#1056#176)
          ParentFont = False
        end
      end
      object MasterData6: TfrxMasterData
        Height = 22.677167800000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        DataSet = dsSlVed1
        DataSetName = 'dsSlVedTar'
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo117: TfrxMemoView
          Width = 26.456710000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 26.456710000000000000
          Width = 26.456710000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          Rotation = 90
        end
        object Memo119: TfrxMemoView
          Left = 52.913420000000000000
          Width = 238.110390000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FC_NAME'
          DataSet = dsSlVed1
          DataSetName = 'dsSlVedTar'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[dsSlVedTar."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo120: TfrxMemoView
          Left = 291.023810000000000000
          Width = 60.472480000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'EDIZM'
          DataSet = dsSlVed1
          DataSetName = 'dsSlVedTar'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dsSlVedTar."EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo121: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590600000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_KOLOST'
          DataSet = dsSlVed1
          DataSetName = 'dsSlVedTar'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dsSlVedTar."FN_KOLOST"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          Left = 427.086890000000000000
          Width = 68.031540000000010000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_PRICE'
          DataSet = dsSlVed1
          DataSetName = 'dsSlVedTar'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dsSlVedTar."FN_PRICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo123: TfrxMemoView
          Left = 495.118430000000000000
          Width = 68.031540000000010000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'SUMM'
          DataSet = dsSlVed1
          DataSetName = 'dsSlVedTar'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dsSlVedTar."SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo124: TfrxMemoView
          Left = 563.149970000000000000
          Width = 71.811070000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'SER'
          DataSet = dsSlVed1
          DataSetName = 'dsSlVedTar'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dsSlVedTar."SER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo125: TfrxMemoView
          Left = 634.961040000000000000
          Width = 83.149660000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 173.858380000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        object Memo128: TfrxMemoView
          Top = 18.897650000000000000
          Width = 128.504020000000000000
          Height = 56.692950000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1027#1057#8218#1057#1026'-'#1057#8224#1056#181' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo129: TfrxMemoView
          Left = 128.504020000000000000
          Top = 18.897650000000000000
          Width = 589.606680000000000000
          Height = 56.692950000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '   '#1056#1119#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1056#1109#1056#1030#1057#8249#1057#8230' '#1074#8222#8211' _________________________ '#1057#1027' '#1074#8222#8211' ___' +
              '__________ '#1056#1111#1056#1109' '#1074#8222#8211' ________________'
            ''
            
              '   '#1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#1029#1056#176#1057#8218#1057#1107#1057#1026#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1057#8230' '#1056#1111#1056#1109#1056#1108#1056#176#1056#183#1056#176#1057#8218#1056#181#1056 +
              #187#1056#181#1056#8470' ____________________________________________')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo130: TfrxMemoView
          Left = 52.913420000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1105#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1027#1057#8218#1057#1026'-'#1057#8224#1056#181)
          ParentFont = False
        end
        object Memo131: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590600000000000000
          Height = 18.897637800000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -15
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = 'value = 0'
          Memo.UTF8 = (
            '[SUM(<dsSlVedTar."FN_KOLOST">,MasterData6)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Align = baWidth
          Top = 83.149659999999990000
          Width = 593.386210000000000000
          Height = 34.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105' ______________________' +
              ' '#1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105' '#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109'-'#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1057 +
              #8230' '#1056#187#1056#1105#1057#8224)
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Align = baWidth
          Top = 124.724490000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105' '#1057#8225#1056#187#1056#181#1056#1029#1056#1109#1056#1030' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470 +
              ' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'  ')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo211: TfrxMemoView
          Left = 158.740260000000000000
          Top = 79.370130000000010000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          VAlign = vaCenter
        end
        object Line9: TfrxLineView
          Left = 302.362400000000000000
          Top = 147.401670000000000000
          Width = 408.189240000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line10: TfrxLineView
          Left = 593.386210000000000000
          Top = 98.267780000000010000
          Width = 124.724490000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line11: TfrxLineView
          Left = 11.338590000000000000
          Top = 123.165430000000000000
          Width = 706.772110000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object ColumnHeader3: TfrxColumnHeader
        Height = 75.590575590000000000
        Top = 94.488250000000000000
        Width = 718.110700000000000000
        object Memo195: TfrxMemoView
          Width = 26.456710000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111#1056#1111)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo196: TfrxMemoView
          Left = 26.456710000000000000
          Width = 26.456710000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1056#1029#1056#1108#1056#187' '#1074#8222#8211)
          ParentFont = False
          Rotation = 90
        end
        object Memo197: TfrxMemoView
          Left = 52.913420000000000000
          Width = 238.110390000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#1109#1056#1030' '#1056#1105' '#1056#1169#1057#1026#1057#1107#1056#1110#1056#1105#1057#8230' '#1057#8224#1056#181#1056#1029#1056#1029 +
              #1056#1109#1057#1027#1057#8218#1056#181#1056#8470' '#1056#1111#1056#1109' '#1056#1111#1056#176#1057#1026#1057#8218#1056#1105#1057#1039#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo198: TfrxMemoView
          Left = 291.023810000000000000
          Width = 60.472480000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo199: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590600000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo200: TfrxMemoView
          Left = 427.086890000000000000
          Top = 37.795300000000110000
          Width = 68.031540000000000000
          Height = 37.795275590000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo201: TfrxMemoView
          Left = 427.086890000000000000
          Width = 136.063080000000000000
          Height = 37.795275590000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1057#1026#1056#1109#1056#183#1056#1029#1056#1105#1057#8225#1056#1029#1057#8249#1056#1112' '#1057#8224#1056#181#1056#1029#1056#176#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo202: TfrxMemoView
          Left = 495.118430000000000000
          Top = 37.795300000000110000
          Width = 68.031540000000000000
          Height = 37.795275590000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo203: TfrxMemoView
          Left = 563.149970000000000000
          Width = 71.811070000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211#1074#8222#8211' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111', '#1057#1027#1056#181#1057#1026#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo204: TfrxMemoView
          Left = 634.961040000000000000
          Width = 83.149660000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#1112#1056#181#1057#8225#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object OLSpirt: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle6: TfrxReportTitle
        Height = 52.913420000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle3OnBeforePrint'
        object Memo132: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1056#1111#1056#1105#1057#1027#1056#1029#1056#1109#1056#8470' '#1056#187#1056#1105#1057#1027#1057#8218' '#1074#8222#8211)
          ParentFont = False
        end
        object Memo135: TfrxMemoView
          Align = baWidth
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1027#1056#1111#1056#1105#1057#1026#1057#8218)
          ParentFont = False
        end
      end
      object MasterData7: TfrxMasterData
        Height = 22.677167800000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        DataSet = dsOLSpirt
        DataSetName = 'dsOLSpirt'
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo147: TfrxMemoView
          Width = 26.456710000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo148: TfrxMemoView
          Left = 26.456710000000000000
          Width = 26.456710000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          Rotation = 90
        end
        object Memo149: TfrxMemoView
          Left = 52.913420000000000000
          Width = 238.110390000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FC_NAME'
          DataSet = dsOLSpirt
          DataSetName = 'dsOLSpirt'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[dsOLSpirt."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo150: TfrxMemoView
          Left = 291.023810000000000000
          Width = 60.472480000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'EDIZM'
          DataSet = dsOLSpirt
          DataSetName = 'dsOLSpirt'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dsOLSpirt."EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo151: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590599999999990000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_KOLOST'
          DataSet = dsOLSpirt
          DataSetName = 'dsOLSpirt'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dsOLSpirt."FN_KOLOST"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo152: TfrxMemoView
          Left = 427.086890000000000000
          Width = 68.031540000000010000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_PRICE'
          DataSet = dsOLSpirt
          DataSetName = 'dsOLSpirt'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dsOLSpirt."FN_PRICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo153: TfrxMemoView
          Left = 495.118430000000000000
          Width = 68.031540000000010000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'SUMM'
          DataSet = dsOLSpirt
          DataSetName = 'dsOLSpirt'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dsOLSpirt."SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo154: TfrxMemoView
          Left = 563.149970000000000000
          Width = 71.811070000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'SER'
          DataSet = dsOLSpirt
          DataSetName = 'dsOLSpirt'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dsOLSpirt."SER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo155: TfrxMemoView
          Left = 634.961040000000000000
          Width = 83.149660000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter3: TfrxPageFooter
        Height = 177.637910000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        object Memo158: TfrxMemoView
          Top = 18.897650000000000000
          Width = 128.504020000000000000
          Height = 56.692950000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1027#1057#8218#1057#1026'-'#1057#8224#1056#181' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo159: TfrxMemoView
          Left = 128.504020000000000000
          Top = 18.897650000000000000
          Width = 589.606680000000000000
          Height = 56.692950000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '   '#1056#1119#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1056#1109#1056#1030#1057#8249#1057#8230' '#1074#8222#8211' _________________________ '#1057#1027' '#1074#8222#8211' ___' +
              '__________ '#1056#1111#1056#1109' '#1074#8222#8211' ________________'
            ''
            
              '   '#1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#1029#1056#176#1057#8218#1057#1107#1057#1026#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1057#8230' '#1056#1111#1056#1109#1056#1108#1056#176#1056#183#1056#176#1057#8218#1056#181#1056 +
              #187#1056#181#1056#8470' ____________________________________________')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo160: TfrxMemoView
          Left = 52.913420000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1105#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1027#1057#8218#1057#1026'-'#1057#8224#1056#181)
          ParentFont = False
        end
        object Memo161: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590600000000000000
          Height = 18.897637800000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -15
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = 'value = 0'
          Memo.UTF8 = (
            '[SUM(<dsOLSpirt."FN_KOLOST">,MasterData6)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo126: TfrxMemoView
          Align = baWidth
          Top = 94.488250000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'                       ' +
              '                   '#1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105' '#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109'-'#1056#1109#1057#8218#1056#1030#1056 +
              #181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1057#8230' '#1056#187#1056#1105#1057#8224)
          ParentFont = False
        end
        object Memo127: TfrxMemoView
          Align = baWidth
          Top = 136.063080000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105' '#1057#8225#1056#187#1056#181#1056#1029#1056#1109#1056#1030' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470 +
              ' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'  ')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo212: TfrxMemoView
          Left = 154.960730000000000000
          Top = 90.708720000000030000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          VAlign = vaCenter
        end
        object Line12: TfrxLineView
          Left = 298.582870000000000000
          Top = 158.740260000000000000
          Width = 408.189240000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line13: TfrxLineView
          Left = 570.709030000000000000
          Top = 109.606370000000000000
          Width = 143.622140000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line14: TfrxLineView
          Left = 3.559060000000000000
          Top = 133.504020000000000000
          Width = 706.772110000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line17: TfrxLineView
          Left = 158.740260000000000000
          Top = 109.606370000000000000
          Width = 151.181200000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object ColumnHeader5: TfrxColumnHeader
        Height = 75.590575590000000000
        Top = 94.488250000000000000
        Width = 718.110700000000000000
        object Memo107: TfrxMemoView
          Width = 26.456710000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111#1056#1111)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo108: TfrxMemoView
          Left = 26.456710000000000000
          Width = 26.456710000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1056#1029#1056#1108#1056#187' '#1074#8222#8211)
          ParentFont = False
          Rotation = 90
        end
        object Memo109: TfrxMemoView
          Left = 52.913420000000000000
          Width = 238.110390000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#1109#1056#1030' '#1056#1105' '#1056#1169#1057#1026#1057#1107#1056#1110#1056#1105#1057#8230' '#1057#8224#1056#181#1056#1029#1056#1029 +
              #1056#1109#1057#1027#1057#8218#1056#181#1056#8470' '#1056#1111#1056#1109' '#1056#1111#1056#176#1057#1026#1057#8218#1056#1105#1057#1039#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 291.023810000000000000
          Width = 60.472480000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 351.496290000000000000
          Width = 75.590600000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo112: TfrxMemoView
          Left = 427.086890000000000000
          Top = 37.795300000000000000
          Width = 68.031540000000000000
          Height = 37.795275590000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Left = 427.086890000000000000
          Width = 136.063080000000000000
          Height = 37.795275590000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1057#1026#1056#1109#1056#183#1056#1029#1056#1105#1057#8225#1056#1029#1057#8249#1056#1112' '#1057#8224#1056#181#1056#1029#1056#176#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Left = 495.118430000000000000
          Top = 37.795300000000000000
          Width = 68.031540000000000000
          Height = 37.795275590000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo115: TfrxMemoView
          Left = 563.149970000000000000
          Width = 71.811070000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211#1074#8222#8211' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111', '#1057#1027#1056#181#1057#1026#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Left = 634.961040000000000000
          Width = 83.149660000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#1112#1056#181#1057#8225#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object odsSlVedTar: TOracleDataSet
    SQL.Strings = (
      'SELECT ost.KARTID,'
      '       m.fc_name,'
      '       (SELECT med.tkart.fc_serial'
      '          FROM med.tkart'
      '         WHERE kartid = ost."KARTID") ser,'
      '       t.fc_name edizm,'
      '       ost.MEDICID,'
      '       (ost."FN_PRICE" * ost.fn_kolost) summ,'
      '       ost."FN_PRICE"'
      ''
      '   FROM med.vmedkart_kolost ost,'
      '       med.tmedic m,'
      '       med.tei t,'
      '       (SELECT U.UCHGRID FK_ID'
      '          FROM med.tuchgr U'
      '         WHERE UPPER(U.FC_UCHGR) LIKE '#39'%'#1058#1040#1056#1040'%'#39') uch,'
      '        (SELECT ME.FK_ID'
      '          FROM MED.TMEDICTYPE ME'
      '         WHERE UPPER(ME.FC_NAME) LIKE '#39'%'#1058#1040#1056#1040'%'#39') mt'
      ' WHERE M.eiid = T.eiid(+)'
      '   AND ost.MEDICID = m.medicid'
      '   AND (M.FK_TYPE = MT.FK_ID OR M.UCHGRID = uch.FK_ID)'
      ''
      '/*'
      'SELECT q1."KARTID",'
      '       q1.fc_name,'
      
        #9'(select med.tkart.fc_serial from med.tkart where kartid = q1."K' +
        'ARTID") ser,'
      #9'q1.edizm ,'
      '       q1."MEDICID",'
      '       q1."FN_FPACKINUPACK",'
      '       (q1."FN_PRICE"*nvl(q2.fn_kolostend, 0)) summ,'
      '       q1."FN_PRICE",'
      '       nvl(q2.fn_kolostend, 0) fn_kolost,'
      '       nvl(q2.fl_edit, 1) AS fl_edit'
      '  FROM (SELECT k.kartid,'
      '               k.medicid,'
      '               m.fn_fpackinupack,'
      '               k.FN_PRICE,'
      '               m.fc_name  AS fc_name,'
      #9#9't.fc_name as edizm'
      
        '          FROM med.tmedic m, med.tkart k, med.tei t, med.tuchgr ' +
        'U'
      '         WHERE m.fl_visible = 1'
      '           AND k.medicid = m.medicid'
      '           AND M.eiid = T.eiid(+)'
      '           AND k.fl_del = 0'
      '           AND U.UCHGRID = m.uchgrid'
      '           AND UPPER(U.FC_UCHGR) LIKE '#39'%'#1058#1040#1056#1040'%'#39
      '           ) q1,'
      '       (SELECT -- '#1079#1076#1077#1089#1100' '#1089#1086#1073#1080#1088#1072#1102#1090#1089#1103' '#1086#1089#1090#1072#1090#1082#1080' '#1087#1086' '#1082#1072#1078#1076#1086#1081' '#1087#1072#1088#1090#1080#1080
      
        '         NVL(SUM(D.mnoj * C.fn_kol), 0) AS FN_KOLOSTEND, k.karti' +
        'd, d.fl_edit'
      '          FROM (SELECT tdocs.*,'
      
        '                       MED.PKG_PRIHRASH.Get_PrihRashPriznak(TDOC' +
        'S.FP_VID,'
      
        '                                                            TDOC' +
        'S.FP_VIDMOVE,'
      
        '                                                            TDOC' +
        'S.fk_mogroupid_from,'
      
        '                                                            TDOC' +
        'S.fk_mogroupid_to,'
      
        '                                                            MED.' +
        'PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO) AS mnoj'
      '                  FROM med.tdocs'
      
        '                 WHERE MED.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO ' +
        'IN'
      
        '                       (TDOCS.fk_mogroupid_from, TDOCS.fk_mogrou' +
        'pid_to)'
      
        '                   AND TRUNC(tdocs.fd_data) BETWEEN med.pkg_meds' +
        'es.get_data1 AND :pdate2'
      '--                     med.pkg_medses.get_data2'
      
        '                   AND tdocs.fl_edit = 0 -- '#1090#1086#1083#1100#1082#1086' '#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1077' '#1076 +
        #1086#1082#1091#1084#1077#1085#1090#1099
      '                ) d,'
      '               med.tdpc c,'
      '               med.tkart k'
      '         WHERE k.kartid = c.kartid'
      '           AND c.dpid = d.dpid'
      '           AND d.mnoj <> 0'
      '           AND k.fl_del = 0'
      '         GROUP BY k.kartid, k.medicid, d.fl_edit) q2'
      ' WHERE q1.kartid = q2.kartid(+)'
      '   AND q2.fl_edit = 0'
      '   and nvl(q2.fn_kolostend, 0)>0'
      'order by 2 desc'
      '*/')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000080000000700000046435F4E414D45010000000000060000004B4152
      544944010000000000070000004D45444943494401000000000008000000464E
      5F505249434501000000000009000000464E5F4B4F4C4F535401000000000005
      0000004544495A4D0100000000000400000053554D4D01000000000003000000
      534552010000000000}
    Cursor = crHourGlass
    Session = os
    Left = 92
    Top = 18
  end
  object odsOpisFR: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '       ost.KARTID,'
      '       m.fc_name,'
      
        #9'(select med.tkart.fc_serial from med.tkart where kartid = ost."' +
        'KARTID") ser,'
      '       t.fc_name  edizm ,'
      '       ost.MEDICID,'
      '       (ost."FN_PRICE"*ost.fn_kolost) summ,'
      '       ost."FN_PRICE",'
      '       ost.fn_kolost'
      ''
      '  FROM med.vmedkart_kolost ost, med.tmedic m, med.tei t, '
      '('
      
        #9'   SELECT fk_id FROM med.tmedictype WHERE UPPER(fc_name) LIKE (' +
        #39'%'#1071#1044#1054#1042#1048#1058'%'#39')'
      #9'UNION ALL'
      
        #9'SELECT fk_id FROM med.tmedictype WHERE UPPER(fc_name) LIKE ('#39'%'#1053 +
        #1040#1056#1050#1054#1058#1048#1063'%'#39')'
      #9'UNION ALL'
      
        #9'SELECT fk_id FROM med.tmedictype WHERE UPPER(fc_name) LIKE ('#39'%'#1055 +
        #1057#1048#1061#1054#1058#1056#1054#1055'%'#39')'
      #9'UNION ALL'
      
        #9'SELECT fk_id FROM med.tmedictype WHERE UPPER(fc_name) LIKE ('#39'%'#1057 +
        #1048#1051#1068#1053#1054#1044#1045#1049#1057#1058#1042#1059#1070#1065'%'#39')) mt, '
      '  '
      
        '( SELECT uchgrid fk_id FROM med.tuchgr  WHERE UPPER(fc_uchgr) LI' +
        'KE ('#39'%'#1071#1044#1054#1042#1048#1058'%'#39')'
      #9'UNION ALL'
      
        #9'SELECT uchgrid FROM  med.tuchgr WHERE UPPER(fc_uchgr) LIKE ('#39'%'#1053 +
        #1040#1056#1050#1054#1058#1048#1063'%'#39')'
      #9'UNION ALL'
      
        #9'SELECT uchgrid FROM  med.tuchgr WHERE UPPER(fc_uchgr) LIKE ('#39'%'#1055 +
        #1057#1048#1061#1054#1058#1056#1054#1055'%'#39')'
      #9'UNION ALL'
      
        #9'SELECT uchgrid FROM  med.tuchgr WHERE UPPER(fc_uchgr) LIKE ('#39'%'#1057 +
        #1048#1051#1068#1053#1054#1044#1045#1049#1057#1058#1042#1059#1070#1065'%'#39')) TYP '
      ''
      ' WHERE M.eiid = T.eiid(+)'
      '  and ost.MEDICID = m.medicid'
      '  AND TYP.FK_ID = M.FK_TYPE'
      '  AND (M.FK_TYPE = MT.FK_ID OR M.UCHGRID = TYP.FK_ID)'
      ''
      '/*SELECT q1."KARTID",'
      '       q1.fc_name,'
      '       q1."MEDICID",'
      '       q1."FN_FPACKINUPACK",'
      '       q1."FN_PRICE",'
      '       nvl(q2.fn_kolostend, 0) fn_kolost,'
      #9'q1.edizm edizm,'
      '       nvl(q2.fl_edit, 1) AS fl_edit'
      '  FROM (SELECT k.kartid,'
      '               k.medicid,'
      '               m.fn_fpackinupack,'
      '               k.FN_PRICE,'
      '               m.fc_name,'
      #9#9't.fc_name AS edizm '
      '          FROM med.tmedic m, med.tkart k, med.tei T, ('
      
        #9'SELECT fk_id FROM med.tmedictype WHERE UPPER(fc_name) LIKE ('#39'%'#1071 +
        #1044#1054#1042'%'#39')'
      #9'UNION ALL'
      
        #9'SELECT fk_id FROM med.tmedictype WHERE UPPER(fc_name) LIKE ('#39'%'#1053 +
        #1040#1056#1050#1054#1058#1048#1063'%'#39')'
      #9'UNION ALL'
      
        #9'SELECT fk_id FROM med.tmedictype WHERE UPPER(fc_name) LIKE ('#39'%'#1055 +
        #1057#1048#1061#1054#1058#1056#1054#1055'%'#39')'
      #9'UNION ALL'
      
        #9'SELECT fk_id FROM med.tmedictype WHERE UPPER(fc_name) LIKE ('#39'%'#1057 +
        #1048#1051#1068#1053#1054#1044#1045#1049#1057#1058#1042#1059#1070#1065#1048#1045'%'#39')) TYP '
      '         WHERE m.fl_visible = 1'
      '           AND k.medicid = m.medicid'
      '           AND M.eiid = T.eiid(+)'
      #9'   AND TYP.FK_ID = M.FK_TYPE'
      '           AND k.fl_del = 0) q1,'
      '       (SELECT -- '#1079#1076#1077#1089#1100' '#1089#1086#1073#1080#1088#1072#1102#1090#1089#1103' '#1086#1089#1090#1072#1090#1082#1080' '#1087#1086' '#1082#1072#1078#1076#1086#1081' '#1087#1072#1088#1090#1080#1080
      
        '         NVL(SUM(D.mnoj * C.fn_kol), 0) AS FN_KOLOSTEND, k.karti' +
        'd, d.fl_edit'
      '          FROM (SELECT tdocs.*,'
      
        '                       MED.PKG_PRIHRASH.Get_PrihRashPriznak(TDOC' +
        'S.FP_VID,'
      
        '                                                            TDOC' +
        'S.FP_VIDMOVE,'
      
        '                                                            TDOC' +
        'S.fk_mogroupid_from,'
      
        '                                                            TDOC' +
        'S.fk_mogroupid_to,'
      
        '                                                            MED.' +
        'PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO) AS mnoj'
      '                  FROM med.tdocs'
      
        '                 WHERE MED.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO ' +
        'IN'
      
        '                       (TDOCS.fk_mogroupid_from, TDOCS.fk_mogrou' +
        'pid_to)'
      
        '                   AND TRUNC(tdocs.fd_data) BETWEEN med.pkg_meds' +
        'es.get_data1 AND :pdate2'
      '--                     med.pkg_medses.get_data2'
      
        '                   AND tdocs.fl_edit = 0 -- '#1090#1086#1083#1100#1082#1086' '#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1077' '#1076 +
        #1086#1082#1091#1084#1077#1085#1090#1099
      '                ) d,'
      '               med.tdpc c,'
      '               med.tkart k'
      '         WHERE k.kartid = c.kartid'
      '           AND c.dpid = d.dpid'
      '           AND d.mnoj <> 0'
      '           AND k.fl_del = 0'
      '         GROUP BY k.kartid, k.medicid, d.fl_edit) q2'
      ' WHERE q1.kartid = q2.kartid(+)'
      '   AND q2.fl_edit = 0'
      '   AND nvl(q2.fn_kolostend, 0) >0'
      'order by 2'
      '*/')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0400000008000000060000004B4152544944010000000000070000004D454449
      43494401000000000008000000464E5F50524943450100000000000900000046
      4E5F4B4F4C4F53540100000000000700000046435F4E414D4501000000000005
      0000004544495A4D010000000000030000005345520100000000000400000053
      554D4D010000000000}
    Cursor = crHourGlass
    Session = os
    Left = 156
    Top = 17
  end
  object odsOLToxic: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '       ost.KARTID,'
      '       m.fc_name,'
      
        #9'(select med.tkart.fc_serial from med.tkart where kartid = ost."' +
        'KARTID") ser,'
      '       t.fc_name  edizm ,'
      '       ost.MEDICID,'
      '       (ost."FN_PRICE"*ost.fn_kolost) summ,'
      '       ost."FN_PRICE",'
      '       ost.fn_kolost'
      '  FROM med.vmedkart_kolost ost,'
      '       med.tmedic m,'
      '       med.tei t,'
      '       (SELECT U.UCHGRID FK_ID'
      '          FROM med.tuchgr U'
      '         WHERE UPPER(U.FC_UCHGR) LIKE '#39'%'#1071#1044#1054#1042#1048#1058'%'#39') uch,'
      '        (SELECT ME.FK_ID'
      '          FROM MED.TMEDICTYPE ME'
      '         WHERE UPPER(ME.FC_NAME) LIKE '#39'%'#1071#1044#1054#1042#1048#1058'%'#39') mt'
      ' WHERE M.eiid = T.eiid(+)'
      '   AND ost.MEDICID = m.medicid'
      '   AND (M.FK_TYPE = MT.FK_ID OR M.UCHGRID = uch.FK_ID)'
      ''
      ''
      '/*'
      
        '  FROM med.vmedkart_kolost ost, med.tmedic m, med.tei e, med.tme' +
        'dictype t'
      ' WHERE M.eiid = e.eiid(+)'
      '   AND ost.MEDICID = m.medicid'
      '   AND T.FK_ID = M.FK_TYPE'
      '   AND UPPER(T.FC_NAME) LIKE '#39'%'#1071#1044#1054#1042#1048#1058#1067#1045'%'#39
      ''
      'SELECT q1.fc_name,'
      
        '       (select med.tkart.fc_serial from med.tkart where kartid =' +
        ' q1."KARTID") ser,'
      '       q1."FN_PRICE",'
      '       nvl(q2.fn_kolostend, 0) fn_kolost,'
      '       (q1."FN_PRICE"*nvl(q2.fn_kolostend, 0) ) sum,'
      '       q1."KARTID",'
      '       q1."MEDICID",'
      '       q1."FN_FPACKINUPACK",'
      '       nvl(q2.fl_edit, 1) AS fl_edit,'
      '       Q1.eizm '
      '  FROM (SELECT k.kartid,'
      '               k.medicid,'
      '               m.fc_name,'
      '               m.fn_fpackinupack,'
      '               k.FN_PRICE,'
      '               E.FC_NAME eizm'
      
        '          FROM med.tmedic m, med.tkart k, med.tmedictype t, med.' +
        'tei E'
      '         WHERE m.fl_visible = 1'
      '           AND k.medicid = m.medicid'
      '           AND k.fl_del = 0'
      '           AND T.FK_ID = M.FK_TYPE'
      '           AND M.eiid = E.eiid(+)'
      '           AND UPPER(T.FC_NAME) LIKE '#39'%'#1071#1044#1054#1042#1048#1058#1067#1045'%'#39') q1,'
      '       (SELECT -- '#1079#1076#1077#1089#1100' '#1089#1086#1073#1080#1088#1072#1102#1090#1089#1103' '#1086#1089#1090#1072#1090#1082#1080' '#1087#1086' '#1082#1072#1078#1076#1086#1081' '#1087#1072#1088#1090#1080#1080
      
        '         NVL(SUM(D.mnoj * C.fn_kol), 0) AS FN_KOLOSTEND, k.karti' +
        'd, d.fl_edit'
      '          FROM (SELECT tdocs.*,'
      
        '                       MED.PKG_PRIHRASH.Get_PrihRashPriznak(TDOC' +
        'S.FP_VID,'
      
        '                                                            TDOC' +
        'S.FP_VIDMOVE,'
      
        '                                                            TDOC' +
        'S.fk_mogroupid_from,'
      
        '                                                            TDOC' +
        'S.fk_mogroupid_to,'
      
        '                                                            MED.' +
        'PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO) AS mnoj'
      '                  FROM med.tdocs'
      
        '                 WHERE MED.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO ' +
        'IN'
      
        '                       (TDOCS.fk_mogroupid_from, TDOCS.fk_mogrou' +
        'pid_to)'
      
        '                   AND TRUNC(tdocs.fd_data) BETWEEN med.pkg_meds' +
        'es.get_data1 AND :pdate2'
      '--                     med.pkg_medses.get_data2'
      
        '                   AND tdocs.fl_edit = 0 -- '#1090#1086#1083#1100#1082#1086' '#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1077' '#1076 +
        #1086#1082#1091#1084#1077#1085#1090#1099
      '                ) d,'
      '               med.tdpc c,'
      '               med.tkart k'
      '         WHERE k.kartid = c.kartid'
      '           AND c.dpid = d.dpid'
      '           AND d.mnoj <> 0'
      '           AND k.fl_del = 0'
      '         GROUP BY k.kartid, k.medicid, d.fl_edit) q2'
      ' WHERE q1.kartid = q2.kartid(+)'
      '   AND q2.fl_edit = 0'
      '   AND nvl(q2.fn_kolostend, 0) >0'
      'order by 1'
      '*/')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0400000008000000060000004B4152544944010000000000070000004D454449
      43494401000000000008000000464E5F50524943450100000000000900000046
      4E5F4B4F4C4F53540100000000000700000046435F4E414D4501000000000003
      000000534552010000000000050000004544495A4D0100000000000400000053
      554D4D010000000000}
    Cursor = crHourGlass
    Session = os
    Left = 216
    Top = 16
  end
  object odsOLSpirt: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '       ost.KARTID,'
      '       m.fc_name,'
      
        #9'(select med.tkart.fc_serial from med.tkart where kartid = ost."' +
        'KARTID") ser,'
      '       t.fc_name  edizm ,'
      '       ost.MEDICID,'
      '       (ost."FN_PRICE"*ost.fn_kolost) summ,'
      '       ost."FN_PRICE",'
      '       ost.fn_kolost'
      '  FROM med.vmedkart_kolost ost,'
      '       med.tmedic m,'
      '       med.tei t,'
      '       (SELECT U.UCHGRID FK_ID'
      '          FROM med.tuchgr U'
      '         WHERE UPPER(U.FC_UCHGR) LIKE '#39'%'#1057#1055#1048#1056#1058'%'#39') uch,'
      '        (SELECT ME.FK_ID'
      '          FROM MED.TMEDICTYPE ME'
      '         WHERE UPPER(ME.FC_NAME) LIKE '#39'%'#1057#1055#1048#1056#1058'%'#39') mt'
      ' WHERE M.eiid = T.eiid(+)'
      '   AND ost.MEDICID = m.medicid'
      '   AND (M.FK_TYPE = MT.FK_ID OR M.UCHGRID = uch.FK_ID)'
      ''
      '/*'
      
        '  FROM med.vmedkart_kolost ost, med.tmedic m, med.tei e, med.tme' +
        'dictype t'
      ' WHERE M.eiid = e.eiid(+)'
      '   AND ost.MEDICID = m.medicid'
      '   AND T.FK_ID = M.FK_TYPE'
      '   AND UPPER(T.FC_NAME) LIKE '#39'%'#1057#1055#1048#1056#1058'%'#39
      ''
      'SELECT q1.fc_name,'
      
        '       (select med.tkart.fc_serial from med.tkart where kartid =' +
        ' q1."KARTID") ser,'
      '       q1."FN_PRICE",'
      '       nvl(q2.fn_kolostend, 0) fn_kolost,'
      '       (q1."FN_PRICE"*nvl(q2.fn_kolostend, 0) ) sum,'
      '       q1."KARTID",'
      '       q1."MEDICID",'
      '       q1."FN_FPACKINUPACK",'
      '       nvl(q2.fl_edit, 1) AS fl_edit,'
      '       Q1.eizm '
      '  FROM (SELECT k.kartid,'
      '               k.medicid,'
      '               m.fc_name,'
      '               m.fn_fpackinupack,'
      '               k.FN_PRICE,'
      '               E.FC_NAME eizm'
      
        '          FROM med.tmedic m, med.tkart k, med.tmedictype t, med.' +
        'tei E'
      '         WHERE m.fl_visible = 1'
      '           AND k.medicid = m.medicid'
      '           AND k.fl_del = 0'
      '           AND T.FK_ID = M.FK_TYPE'
      '           AND M.eiid = E.eiid(+)'
      '           AND UPPER(T.FC_NAME) LIKE '#39'%'#1057#1055#1048#1056#1058'%'#39') q1,'
      '       (SELECT -- '#1079#1076#1077#1089#1100' '#1089#1086#1073#1080#1088#1072#1102#1090#1089#1103' '#1086#1089#1090#1072#1090#1082#1080' '#1087#1086' '#1082#1072#1078#1076#1086#1081' '#1087#1072#1088#1090#1080#1080
      
        '         NVL(SUM(D.mnoj * C.fn_kol), 0) AS FN_KOLOSTEND, k.karti' +
        'd, d.fl_edit'
      '          FROM (SELECT tdocs.*,'
      
        '                       MED.PKG_PRIHRASH.Get_PrihRashPriznak(TDOC' +
        'S.FP_VID,'
      
        '                                                            TDOC' +
        'S.FP_VIDMOVE,'
      
        '                                                            TDOC' +
        'S.fk_mogroupid_from,'
      
        '                                                            TDOC' +
        'S.fk_mogroupid_to,'
      
        '                                                            MED.' +
        'PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO) AS mnoj'
      '                  FROM med.tdocs'
      
        '                 WHERE MED.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO ' +
        'IN'
      
        '                       (TDOCS.fk_mogroupid_from, TDOCS.fk_mogrou' +
        'pid_to)'
      
        '                   AND TRUNC(tdocs.fd_data) BETWEEN med.pkg_meds' +
        'es.get_data1 AND :pdate2'
      '--                     med.pkg_medses.get_data2'
      
        '                   AND tdocs.fl_edit = 0 -- '#1090#1086#1083#1100#1082#1086' '#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1077' '#1076 +
        #1086#1082#1091#1084#1077#1085#1090#1099
      '                ) d,'
      '               med.tdpc c,'
      '               med.tkart k'
      '         WHERE k.kartid = c.kartid'
      '           AND c.dpid = d.dpid'
      '           AND d.mnoj <> 0'
      '           AND k.fl_del = 0'
      '         GROUP BY k.kartid, k.medicid, d.fl_edit) q2'
      ' WHERE q1.kartid = q2.kartid(+)'
      '   AND q2.fl_edit = 0'
      '   AND nvl(q2.fn_kolostend, 0) >0'
      'order by 1'
      '*/')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0400000008000000060000004B4152544944010000000000070000004D454449
      43494401000000000008000000464E5F50524943450100000000000900000046
      4E5F4B4F4C4F53540100000000000700000046435F4E414D4501000000000003
      000000534552010000000000050000004544495A4D0100000000000400000053
      554D4D010000000000}
    Cursor = crHourGlass
    Session = os
    Left = 288
    Top = 16
  end
  object dsOLSpirt: TfrxDBDataset
    UserName = 'dsOLSpirt'
    CloseDataSource = False
    FieldAliases.Strings = (
      'KARTID=KARTID'
      'FC_NAME=FC_NAME'
      'SER=SER'
      'EDIZM=EDIZM'
      'MEDICID=MEDICID'
      'SUMM=SUMM'
      'FN_PRICE=FN_PRICE'
      'FN_KOLOST=FN_KOLOST')
    DataSet = odsOLSpirt
    BCDToCurrency = False
    Left = 288
    Top = 72
  end
  object dsOLToxic: TfrxDBDataset
    UserName = 'dsOLToxic'
    CloseDataSource = False
    FieldAliases.Strings = (
      'KARTID=KARTID'
      'FC_NAME=FC_NAME'
      'SER=SER'
      'EDIZM=EDIZM'
      'MEDICID=MEDICID'
      'SUMM=SUMM'
      'FN_PRICE=FN_PRICE'
      'FN_KOLOST=FN_KOLOST')
    DataSet = odsOLToxic
    BCDToCurrency = False
    Left = 216
    Top = 72
  end
  object dsOpisFR: TfrxDBDataset
    UserName = 'dsOpis'
    CloseDataSource = False
    FieldAliases.Strings = (
      'KARTID=KARTID'
      'FC_NAME=FC_NAME'
      'SER=SER'
      'EDIZM=EDIZM'
      'MEDICID=MEDICID'
      'SUMM=SUMM'
      'FN_PRICE=FN_PRICE'
      'FN_KOLOST=FN_KOLOST')
    DataSet = odsOpisFR
    BCDToCurrency = False
    Left = 155
    Top = 73
  end
  object dsSlVed1: TfrxDBDataset
    UserName = 'dsSlVedTar'
    CloseDataSource = False
    FieldAliases.Strings = (
      'KARTID=KARTID'
      'FC_NAME=FC_NAME'
      'SER=SER'
      'EDIZM=EDIZM'
      'MEDICID=MEDICID'
      'SUMM=SUMM'
      'FN_PRICE=FN_PRICE'
      'FN_KOLOST=FN_KOLOST')
    DataSet = odsSlVedTar
    BCDToCurrency = False
    Left = 96
    Top = 72
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 28
    Top = 70
  end
  object os: TOracleSession
    LogonUsername = 'asu'
    LogonPassword = 'asu'
    LogonDatabase = 'asu'
    Left = 24
    Top = 136
  end
  object frxInv: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.OutlineExpand = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39357.743414884300000000
    ReportOptions.LastChange = 41248.489849710600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      
        '  PageMinus, LastPage, OpisPageCount, OpisPageFirstNum : integer' +
        ';'
      
        '  LineFirst, LineLast, LineNum, CorrectLine, OpisPageNum, CurUch' +
        'Gr : Integer;'
      '  kol, SummByPage, KolByPage, GroupOpisSumm : double;'
      '    '
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Engine.FinalPass then'
      '  begin              '
      
        '    // '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1085#1086#1084#1077#1088#1086#1074' '#1087#1086#1079#1080#1094#1080#1081' '#1087#1088#1080' '#1088#1072#1079#1084#1077#1097#1077#1085#1080#1080' '#1086#1076#1085#1086' '#1091#1095'. '#1075#1088#1091 +
        #1087#1087#1099' '#1073#1086#1083#1077#1077' '#1095#1077#1084' '#1085#1072' 1 '#1089#1090#1088#1072#1085#1080#1094#1077
      
        '    {if (<frxdsOstByParties."UCHGRID"> = CurUchGr)and(CorrectLin' +
        'e = 0) then'
      '      CorrectLine := -1'
      '    else'
      '      CorrectLine := 0; }                                 '
      ''
      '    CurUchGr := <frxdsOstByParties."UCHGRID">;'
      '  end;              '
      'end;'
      ''
      'procedure PageFooter2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Engine.FinalPass then'
      '  begin  '
      '    {// '#1086#1087#1080#1089#1085#1086#1081' '#1083#1080#1089#1090' '#1087#1088#1072#1074#1080#1083#1100#1085#1086' '#1088#1072#1073#1086#1090#1072#1077#1090' '#1090#1086#1083#1100#1082#1086' '#1090#1072#1082
      '    if  //(OpisPageNum = 1)and'
      '    (OpisPageCount <> 1) then'
      
        '      LineLast := <frxdsOstByParties."ROWNUM"> - 1              ' +
        '            '
      '    else              '
      '      LineLast := <frxdsOstByParties."ROWNUM">;'
      ''
      '    if LineFirst = <frxdsOstByParties."ROWNUM"> then'
      '      LineLast := LineFirst'
      
        '    else   // '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1085#1086#1084#1077#1088#1086#1074' '#1087#1086#1079#1080#1094#1080#1081' '#1087#1088#1080' '#1088#1072#1079#1084#1077#1097#1077#1085#1080#1080' '#1086#1076#1085#1086#1081 +
        ' '#1091#1095'. '#1075#1088#1091#1087#1087#1099' '#1073#1086#1083#1077#1077' '#1095#1077#1084' '#1085#1072' 1 '#1089#1090#1088#1072#1085#1080#1094#1077'     '
      '      LineFirst := LineFirst + CorrectLine;        '
      ''
      
        '    LineNum := (LineLast - LineFirst+1); //'#1074#1099#1089#1095#1080#1090#1099#1074#1072#1077#1084' '#1082#1086#1083'-'#1074#1086' '#1089#1090 +
        #1088#1086#1095#1077#1082'                                                           ' +
        '                         '
      
        '    if ((OpisPageCount > 1)and(OpisPageNum = OpisPageCount*2)) /' +
        '/ *2 - '#1087#1086#1090#1086#1084#1091', '#1095#1090#1086' '#1087#1086#1089#1083#1077#1076#1085#1103#1103' '#1089#1090#1088#1072#1085#1080#1094#1072' '#1087#1086#1083#1091#1095#1072#1077#1090#1089#1103' '#1091#1076#1074#1086#1077#1085#1085#1086#1081' '#1080#1079'-'#1079#1072 +
        ' '#1076#1074#1086#1081#1085#1086#1075#1086' '#1087#1088#1086#1093#1086#1076#1072'                                               ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '  '
      
        '      and(<frxdsOstByParties."ROWNUM"> <> Masterdata4.dataset.re' +
        'cordCount) then  // '#1095#1072#1089#1090#1085#1099#1081' '#1089#1083#1091#1095#1072#1081' - '#1082#1086#1075#1076#1072' '#1087#1086#1089#1083#1077#1076#1085#1103#1103' '#1075#1088#1091#1087#1087#1072' '#1089#1086#1076#1077 +
        #1088#1078#1080#1090' '#1086#1076#1085#1091' '#1079#1072#1087#1080#1089#1100'                                                ' +
        '                                                                ' +
        '                                                                ' +
        '                                             '
      
        '      LineNum := LineNum + 1;                                   ' +
        '                             '
      ''
      
        '    if LineFirst = 0 then // '#1076#1083#1103' '#1086#1076#1085#1086#1075#1086' '#1086#1087#1080#1089#1085#1086#1075#1086' '#1083#1080#1089#1090#1072'          ' +
        '                                                         '
      '      LineFirst := 1;'
      ''
      
        '    LineLast := LineFirst + LineNum - 1; // '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1091#1077#1084' '#1087#1086#1079#1080#1094#1080#1102 +
        ' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1089#1090#1088#1086#1082#1080'                                '
      '    // '#1089#1086#1093#1088#1072#1085#1103#1077#1084' '#1076#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1083#1080#1089#1090#1072' '#1080#1090#1086#1075#1086#1074#1086#1081' '#1086#1087#1080#1089#1080
      '    }'
      '    if (OpisPageNum = OpisPageCount*2) then'
      
        '      LineLast := <frxdsOstByParties."ROWNUM"> + CorrectLine    ' +
        '                         '
      '    else                      '
      '      LineLast := <frxdsOstByParties."ROWNUM"> - 1;'
      '    '
      '    LineNum := <COUNT(MasterData4)>;'
      '    if LineNum = 1 then'
      '      CorrectLine := -1'
      '    else'
      
        '      CorrectLine := 0;                                         ' +
        '                  '
      '    LineFirst := LineLast - LineNum + 1;  '
      '    SummByPage := <SUM(<frxdsOstByParties."SUMM">,MasterData4)>;'
      
        '    KolByPage := <SUM(<frxdsOstByParties."FN_KOLOST">,MasterData' +
        '4)>;              '
      
        '    INSERT_TINV_OPIS_GROUP( LineFirst, LineLast, KolByPage, Summ' +
        'ByPage );'
      
        '    //CorrectLine := 0;   // '#1089#1073#1088#1072#1089#1099#1074#1072#1077#1084' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1091' '#1087#1086#1089#1083#1077' '#1077#1077' '#1080 +
        #1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103'                                                    ' +
        '                           '
      '  end;'
      'end;'
      ''
      'procedure OpisListOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  OpisPageNum := OpisPageNum;                   '
      '  if ((Engine.FinalPass = True) and(<Page> <> 1))  then'
      '  begin  '
      '    LineFirst := 0;'
      '    LineLast  := 0;'
      '    LineNum   := 0;'
      ''
      '//    OpisPageCount := <Page#>;                      '
      '  end;'
      'end;'
      ''
      'procedure PageHeader3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  LineFirst := 0;'
      '  '
      '    '
      '  OpisPageNum := OpisPageNum + 1;  '
      '  if (Engine.FinalPass = False) then'
      '  begin          '
      '    OpisPageCount := OpisPageNum;  '
      '  end;'
      ''
      '  if OpisPageFirstNum = 0 then'
      '    OpisPageFirstNum := <Page#>;      '
      'end;'
      ''
      'procedure Memo28OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  kol := <SUM(<frxdsOstByParties."FN_KOLOST">,MasterData4)>;    '
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  PageMinus := <Page#>;                  '
      'end;'
      ''
      'procedure Memo77OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  //if (Engine.FinalPass = True)and(LineFirst = 0)  then  '
      '  //  LineFirst := <frxdsOstByParties."ROWNUM">;'
      'end;'
      ''
      'procedure OpisListOnAfterPrint(Sender: TfrxComponent);'
      'begin'
      
        '  // '#1080#1084#1077#1085#1085#1086' '#1079#1076#1077#1089#1100' '#1085#1072#1076#1086' '#1086#1090#1082#1088#1099#1090#1100' '#1076#1072#1090#1072#1089#1077#1090' - '#1080#1090#1086#1075#1086#1074#1099#1081' '#1083#1080#1089#1090' '#1087#1086' '#1074#1089#1077#1084' '#1086 +
        #1087#1080#1089#1085#1099#1084' '#1083#1080#1089#1090#1072#1084'                                                   ' +
        '                                                                ' +
        '                                                                ' +
        '           '
      '  Open_TINV_OPIS_GROUP;'
      'end;'
      ''
      'procedure MasterData2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  GroupOpisSumm := GroupOpisSumm + <frxdsTinv_opis_group."summ_b' +
        'y_page">;  '
      'end;'
      ''
      'procedure PageHeader4OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  GroupOpisSumm := 0;                            '
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  if (Engine.FinalPass = False) then                            ' +
        '       '
      '    OpisPageNum := 0;'
      ''
      '  OpisPageFirstNum := 0;                        '
      'end;                      '
      '        '
      'begin'
      '     '
      'end.  ')
    OnGetValue = frxInvGetValue
    OnUserFunction = frxInvUserFunction
    OnClosePreview = frxInvClosePreview
    Left = 34
    Top = 204
    Datasets = <
      item
        DataSet = frxDBdsOstByMedGroups
        DataSetName = 'frxDBdsOstByMedGroups'
      end
      item
        DataSet = frxdsOstByMed
        DataSetName = 'frxdsOstByMed'
      end
      item
        DataSet = frxdsOstByParties
        DataSetName = 'frxdsOstByParties'
      end
      item
        DataSet = frxdsTinv_opis_group
        DataSetName = 'frxdsTinv_opis_group'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'PK2'
        Value = Null
      end
      item
        Name = 'M1'
        Value = Null
      end
      item
        Name = 'M2'
        Value = Null
      end
      item
        Name = 'M3'
        Value = Null
      end
      item
        Name = 'M4'
        Value = Null
      end
      item
        Name = 'M5'
        Value = Null
      end
      item
        Name = 'Place'
        Value = Null
      end
      item
        Name = 'Dat'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Title: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 873.071430000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Top = 211.653680000000000000
          Width = 718.110700000000000000
          Height = 49.133890000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Align = baWidth
          Top = 260.787570000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#1029#1056#1109'-'#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1057#8230' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#181#1056#8470)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 430.866420000000000000
          Top = 294.803340000000000000
          Width = 158.740260000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1105' '#1074#8222#8211'  ______')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Top = 317.480520000000000000
          Width = 143.622140000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#1108#1056#176#1056#183' '#1074#8222#8211'  ____')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 502.677490000000000000
          Top = 340.157700000000000000
          Width = 187.433210000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            #1056#1109#1057#8218'  [Dat]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 132.283550000000000000
          Top = 438.425480000000000000
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              ' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039' '#1056#1029#1056#176#1057#8225#1056#176#1057#8218#1056#176' .....................' +
              '........ 20 ....  '#1056#1110'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 7.559060000000000000
          Top = 404.409710000000000000
          Width = 136.063080000000000000
          Height = 75.590600000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#187#1056#176#1056#1029#1056#1109#1056#1030#1056#176#1057#1039
            '..........................'
            #1056#8217#1056#1029#1056#181#1056#1111#1056#187#1056#176#1056#1029#1056#1109#1056#1030#1056#176#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Align = baWidth
          Top = 495.118430000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039' '#1056#1109#1056#1108#1056#1109#1056#1029#1057#8225#1056#181#1056#1029#1056#176' ..................' +
              '..................................... 20 ....  '#1056#1110'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Align = baWidth
          Top = 566.929500000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108 +
              #1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'  ................................................' +
              '.......')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Align = baWidth
          Top = 600.945270000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#167#1056#187#1056#181#1056#1029#1057#8249' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105 +
              ':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 393.071120000000000000
          Top = 563.149970000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PK2]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 75.590600000000000000
          Top = 638.740570000000000000
          Width = 589.606680000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '1. [M1] ')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 75.590600000000000000
          Top = 672.756340000000000000
          Width = 589.606680000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '2. [M2]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 75.590600000000000000
          Top = 707.551640000000000000
          Width = 589.606680000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '3. [M3]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 75.590600000000000000
          Top = 744.567410000000000000
          Width = 589.606680000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '4. [M4]')
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          Left = 75.590600000000000000
          Top = 778.583180000000000000
          Width = 589.606680000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '5. [M5]')
          ParentFont = False
        end
        object Memo143: TfrxMemoView
          Left = 283.464750000000000000
          Top = 660.858690000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#8222'., '#1056#1105'., '#1056#1109'.,'#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo144: TfrxMemoView
          Left = 283.464750000000000000
          Top = 694.874460000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#8222'., '#1056#1105'., '#1056#1109'.,'#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo145: TfrxMemoView
          Left = 283.464750000000000000
          Top = 729.669760000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#8222'., '#1056#1105'., '#1056#1109'.,'#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo146: TfrxMemoView
          Left = 283.464750000000000000
          Top = 766.685530000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#8222'., '#1056#1105'., '#1056#1109'.,'#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo162: TfrxMemoView
          Left = 283.464750000000000000
          Top = 800.701300000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#8222'., '#1056#1105'., '#1056#1109'.,'#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
      end
      object PageFooter4: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 952.441560000000000000
        Width = 718.110700000000000000
        object Memo52: TfrxMemoView
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
        end
      end
    end
    object Podpiska: TfrxReportPage
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftBottom]
      object PageHeader2: TfrxPageHeader
        Height = 642.520100000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Align = baWidth
          Top = 15.118120000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1115#1056#8221#1056#1119#1056#152#1056#1038#1056#1113#1056#1106)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Align = baWidth
          Top = 75.590600000000000000
          Width = 3.779530000000000000
          Height = 56.692950000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            
              #1056#1031' ('#1056#1112#1057#8249') '#1056#1029#1056#1105#1056#182#1056#181#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#176#1056#1030#1057#8364#1056#1105#1056#181#1057#1027#1057#1039', '#1056#183#1056#176#1056#1030#1056#181#1056#1169#1057#1107#1057#1035#1057#8240#1056#1105 +
              #1056#8470' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470'('#1056#1112#1056#176#1056#1110#1056#176#1056#183#1056#1105#1056#1029#1056#1109#1056#1112') ')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Align = baWidth
          Top = 188.976500000000000000
          Width = 718.110700000000000000
          Height = 147.401670000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haBlock
          Memo.UTF8 = (
            
              #1056#1169#1056#176#1057#1035' ('#1056#1169#1056#176#1056#181#1056#1112') '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1057#1107#1057#1035' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1108#1057#1107' '#1056#1109' '#1057#8218#1056#1109#1056#1112',' +
              ' '#1057#8225#1057#8218#1056#1109' '#1056#1108' '#1056#1112#1056#1109#1056#1112#1056#181#1056#1029#1057#8218#1057#1107' '#1056#1029#1056#176#1057#8225#1056#176#1056#187#1056#176' '#1056#1111#1056#1109#1056#1030#1056#181#1056#1169#1056#181#1056#1029#1056#1105#1057#1039' '#1056#1105#1056#1029#1056#1030 +
              #1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105' '#1056#1030#1057#1027#1056#181' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1056#1029#1057#8249#1056#181' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057 +
              #8218#1057#8249' '#1056#1029#1056#176' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1057#8249', '#1057#8218#1056#176#1057#1026#1057#1107' '#1056#1105' '#1056#1169#1057#1026#1057#1107#1056#1110#1056#1105#1056#181' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105 +
              ' '#1056#1030#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1057#8249' '#1056#1030' '#1056#1109#1057#8218#1057#8225#1056#181#1057#8218' '#1056#1105' '#1056#1108' '#1056#1112#1056#1109#1056#1112#1056#181#1056#1029#1057#8218#1057#1107' '#1056#1030#1056#181#1056#1169#1056#181#1056#1029#1056 +
              #1105#1057#1039' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105' '#1056#1030#1057#1027#1056#181' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1057#8249' '#1056#1105' '#1057#8218#1056#176#1057#1026#1056#176 +
              ', '#1056#1111#1056#1109#1057#1027#1057#8218#1057#1107#1056#1111#1056#1105#1056#1030#1057#8364#1056#1105#1056#181' '#1056#1029#1056#176' '#1056#1112#1056#1109#1057#1035'('#1056#1029#1056#176#1057#8364#1057#1107') '#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056 +
              #181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1109#1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1057#8249', '#1056#1030#1057#8249#1056#177#1057#8249#1056#1030#1057#8364#1056#1105#1056#181' '#1057#1027#1056#1111#1056#1105 +
              #1057#1027#1056#176#1056#1029#1057#8249' '#1056#1030' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169'. '#1056#1116#1056#1105#1056#1108#1056#176#1056#1108#1056#1105#1057#8230' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#1109#1056#1030' '#1056#1105 +
              ' '#1056#1029#1056#176#1056#187#1056#1105#1057#8225#1056#1029#1057#8249#1057#8230' '#1056#1169#1056#181#1056#1029#1056#181#1056#1110' '#1056#1029#1056#176' '#1057#1026#1057#1107#1056#1108#1056#176#1057#8230' '#1057#1107' '#1056#1112#1056#181#1056#1029#1057#1039' ('#1056#1029#1056#176#1057#1027 +
              ') '#1056#1029#1056#181' '#1056#1109#1057#1027#1057#8218#1056#176#1056#187#1056#1109#1057#1027#1057#1034'. '#1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1108#1056#1105' '#1056#1029#1056#176' '#1056#1112#1056#1109#1056#1112#1056#181#1056#1029#1057#8218' '#1056#1105#1056#1029#1056#1030 +
              #1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105' '#1056#1111#1056#1109' '#1056#1112#1056#1109#1056#1105#1056#1112' ('#1056#1029#1056#176#1057#8364#1056#1105#1056#1112') '#1056#183#1056#176#1056#1111#1056#1105#1057#1027#1057#1039#1056#1112 +
              ' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1057#1039#1057#1035#1057#8218' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1057#8249' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' '#1057#1026#1057#1107#1056#177)
          ParentFont = False
          WordBreak = True
        end
        object Memo14: TfrxMemoView
          Align = baWidth
          Top = 162.519790000000000000
          Width = 359.055350000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            
              #1056#1029#1056#176#1057#8230#1056#1109#1056#1169#1057#1039#1057#8240#1056#181#1056#8470#1057#1027#1057#1039'('#1056#1029#1056#176#1057#8230#1056#1109#1056#1169#1057#1039#1057#8240#1056#181#1056#1110#1056#1109#1057#1027#1057#1039') '#1056#1030' '#1056#1110#1056#1109#1057#1026#1056#1109#1056#1169#1056#181 +
              '('#1057#1027#1056#181#1056#187#1056#181')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Align = baWidth
          Top = 132.283550000000000000
          Width = 306.141930000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1112'. '#1056#183#1056#176#1056#1030#1056#181#1056#1169#1057#1107#1057#8240#1056#181#1056#1110#1056#1109' '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470' ('#1056#1112#1056#176#1056#1110#1056#176#1056#183#1056#1105#1056#1029#1056#1109#1056#1112')')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Align = baLeft
          Top = 343.937230000000000000
          Width = 181.417440000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1118#1056#1109#1056#1030#1056#176#1057#1026#1057#8249' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Align = baLeft
          Top = 366.614410000000000000
          Width = 192.756030000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1118#1056#1109#1056#1111#1056#187#1056#1105#1056#1030#1056#1109' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Align = baLeft
          Top = 393.070866140000000000
          Width = 241.889920000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1114'-'#1057#8224' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1057#1039' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          Left = 181.417440000000000000
          Top = 343.937230000000000000
          Width = 536.693260000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Align = baLeft
          Left = 192.756030000000000000
          Top = 370.393940000000000000
          Width = 525.354352680000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          Left = 241.889920000000000000
          Top = 393.070866140000000000
          Width = 476.220780000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Align = baWidth
          Top = 415.748300000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          Top = 442.205010000000000000
          Width = 230.551330000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026#1056#1109#1056#8470#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1056#1109#1056#1030' '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Align = baLeft
          Left = 230.551330000000000000
          Top = 442.205010000000000000
          Width = 487.559370000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Align = baWidth
          Top = 480.000310000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109'-'#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1056#181' '#1056#187#1056#1105#1057#8224#1056#176':')
          ParentFont = False
        end
        object Memo163: TfrxMemoView
          Left = 468.661720000000000000
          Top = 514.016080000000000000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '1. ____________________________')
          ParentFont = False
        end
        object Memo164: TfrxMemoView
          Left = 468.661720000000000000
          Top = 548.031850000000000000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '2. ____________________________')
          ParentFont = False
        end
        object Memo165: TfrxMemoView
          Left = 468.661720000000000000
          Top = 582.827150000000000000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '3. ____________________________')
          ParentFont = False
        end
        object Memo166: TfrxMemoView
          Left = 536.693260000000000000
          Top = 529.134200000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#8222'., '#1056#1105'., '#1056#1109'.,'#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo167: TfrxMemoView
          Left = 536.693260000000000000
          Top = 563.149970000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#8222'., '#1056#1105'., '#1056#1109'.,'#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Memo168: TfrxMemoView
          Left = 536.693260000000000000
          Top = 597.945270000000000000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#8222'., '#1056#1105'., '#1056#1109'.,'#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034)
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 502.677490000000000000
          Top = 94.488250000000000000
          Width = 207.874150000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 120.944960000000000000
          Width = 706.772110000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Left = 306.141930000000000000
          Top = 147.401670000000000000
          Width = 404.409710000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo65: TfrxMemoView
          Left = 359.055350000000000000
          Top = 158.740260000000000000
          Width = 347.716760000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Place]')
          ParentFont = False
        end
      end
      object PageFooter3: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 721.890230000000000000
        Width = 718.110700000000000000
        object Memo48: TfrxMemoView
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
        end
      end
    end
    object SlVedom: TfrxReportPage
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      LargeDesignHeight = True
      OnBeforePrint = 'SlVedomOnBeforePrint'
      object Footer1: TfrxFooter
        Height = 174.637910000000000000
        Top = 415.748300000000000000
        Width = 718.101251175000000000
        KeepChild = True
        object Memo182: TfrxMemoView
          Align = baWidth
          Width = 718.101251175000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108 +
              #1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'  _________________________________')
          ParentFont = False
        end
        object Memo183: TfrxMemoView
          Left = 389.291590000000000000
          Top = 22.677180000000100000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249':')
          ParentFont = False
        end
        object Memo184: TfrxMemoView
          Left = 389.291590000000000000
          Top = 105.826840000000000000
          Width = 136.063080000000000000
          Height = 22.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218'-'#1056#1109#1057#8218#1056#1030'. '#1056#187#1056#1105#1057#8224#1056#1109':')
          ParentFont = False
        end
        object Memo185: TfrxMemoView
          Left = 393.071120000000000000
          Top = 3.779530000000020000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PK2]')
          ParentFont = False
        end
        object Memo186: TfrxMemoView
          Left = 483.779840000000000000
          Top = 22.677180000000000000
          Width = 23.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '1. ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo187: TfrxMemoView
          Left = 483.779840000000000000
          Top = 44.354360000000000000
          Width = 23.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '2.')
          ParentFont = False
        end
        object Memo188: TfrxMemoView
          Left = 483.779840000000000000
          Top = 64.811070000000000000
          Width = 23.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '3.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo189: TfrxMemoView
          Left = 525.354670000000000000
          Top = 105.826840000000000000
          Width = 192.756030000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo190: TfrxMemoView
          Align = baWidth
          Top = 128.504020000000000000
          Width = 718.101251175000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo191: TfrxMemoView
          Align = baWidth
          Top = 151.960730000000000000
          Width = 718.101251175000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo192: TfrxMemoView
          Left = 506.803340000000000000
          Top = 22.897650000000000000
          Width = 207.488250000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[M1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo193: TfrxMemoView
          Left = 507.236550000000000000
          Top = 43.574830000000000000
          Width = 206.488250000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[M2]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo194: TfrxMemoView
          Left = 507.236550000000000000
          Top = 65.031540000000000000
          Width = 206.488250000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[M3]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object Header1: TfrxHeader
        Height = 30.240000000000000000
        Top = 317.480520000000000000
        Width = 718.101251175000000000
        ReprintOnNewPage = True
        object Memo34: TfrxMemoView
          Left = 38.000000000000000000
          Width = 300.000000000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 338.000000000000000000
          Width = 95.000000000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1029#1056#1105#1056#182#1056#1029#1057#8249#1056#8470' '#1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 433.000000000000000000
          Width = 95.000000000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#181' '#1056#1029#1056#176#1056#187#1056#1105#1057#8225#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 528.000310000000000000
          Width = 95.000000000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1056#183#1056#187#1056#1105#1057#8364#1056#1108#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 623.000000000000000000
          Width = 95.000000000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#181#1056#1169#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Width = 38.000000000000000000
          Height = 30.240000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 274.897650000000000000
        Top = 18.897650000000000000
        Width = 718.101251175000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBdsOstByMedGroups
        DataSetName = 'frxDBdsOstByMedGroups'
        RowCount = 0
        StartNewPage = True
        object Memo51: TfrxMemoView
          Align = baWidth
          Top = 246.212740000000000000
          Width = 718.101251175000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1057#1027#1057#8218#1056#176#1056#1029#1056#1109#1056#1030#1056#187#1056#181#1056#1029#1056#1109' '#1057#1027#1056#187#1056#181#1056#1169#1057#1107#1057#1035#1057#8240#1056#181#1056#181':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Align = baWidth
          Top = 10.000000000000000000
          Width = 718.101251175000000000
          Height = 26.456710000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#187#1056#1105#1057#8225#1056#1105#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#176#1057#1039' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1057#1034'-'#1056#176#1056#1108#1057#8218)
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Align = baWidth
          Top = 36.456710000000000000
          Width = 718.101251175000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1111#1056#1109' '#1057#1107#1057#8225#1057#8216#1057#8218#1056#1029#1056#1109#1056#8470' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111#1056#181': [frxDBdsOstByMedGroups."FC_UCH' +
              'GR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo177: TfrxMemoView
          Top = 59.133890000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1056#1109#1057#1026#1056#1109#1056#1169' ('#1057#1027#1056#181#1056#187#1056#1109') ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo178: TfrxMemoView
          Left = 113.385900000000000000
          Top = 59.133890000000000000
          Width = 438.425480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Place]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo205: TfrxMemoView
          Left = 551.811380000000000000
          Top = 59.133890000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '[Dat]  '#1056#1110'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo206: TfrxMemoView
          Align = baWidth
          Top = 90.590600000000000000
          Width = 718.101251175000000000
          Height = 83.149660000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              #1056#1114#1057#8249', '#1056#1029#1056#1105#1056#182#1056#181#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#176#1056#1030#1057#8364#1056#1105#1056#181#1057#1027#1057#1039', '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1057#1039' '#1056#1030' '#1057#1027 +
              #1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#181' '#1056#1111#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1039' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105 +
              #1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105' ____________________________________' +
              '_____________, '#1057#8225#1056#187#1056#181#1056#1029#1056#1109#1056#1030' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105)
          ParentFont = False
          WordBreak = True
        end
        object Memo207: TfrxMemoView
          Align = baWidth
          Top = 180.078850000000000000
          Width = 718.101251175000000000
          Height = 64.252010000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1030' '#1056#1111#1057#1026#1056#1105#1057#1027#1057#1107#1057#8218#1057#1027#1057#8218#1056#1030#1056#1105#1056#1105' '#1056#1112#1056#176#1057#8218'.-'#1056#1109#1057#8218#1056#1030'. '#1056#187#1056#1105#1057#8224#1056#176' _____________' +
              '______ '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#1105#1056#187#1056#1105' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#1105#1056#8470' '#1056#176#1056#1108#1057#8218' '#1056#1109' '#1057#1027#1056#187#1056#1105#1057#8225#1056 +
              #181#1056#1029#1056#1105#1056#1105' '#1057#8222#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1056#1029#1056#176#1056#187#1056#1105#1057#8225#1056#1105#1057#1039' '#1056#1109#1056#177#1057#1033#1056#181#1056#1108#1057#8218#1056#1109#1056#1030 +
              ' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176' '#1056#1111#1056#1109' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111#1056#181' '#1057#1107#1057#8225#1057#8216#1057#8218#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105' "[frxDBdsOstByM' +
              'edGroups."FC_UCHGR"]" '#1057#1027' '#1056#1108#1056#1029#1056#1105#1056#1110#1056#1109#1056#8470' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176' '#1056#1111#1056#1109' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#1109 +
              #1057#1039#1056#1029#1056#1105#1057#1035' '#1056#1029#1056#176'  [Dat]  '#1056#1110'.')
          ParentFont = False
        end
        object Memo208: TfrxMemoView
          Left = 37.795300000000000000
          Top = 110.267780000000000000
          Width = 456.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[PK2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line5: TfrxLineView
          Left = 646.299630000000000000
          Top = 129.165430000000000000
          Width = 68.031540000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Line16: TfrxLineView
          Left = 3.779530000000000000
          Top = 152.401670000000000000
          Width = 710.551640000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo156: TfrxMemoView
          Left = 3.779530000000000000
          Top = 129.944960000000000000
          Width = 706.772110000000000000
          Height = 45.354360000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[M1], [M2], [M3]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 22.680000000000000000
        Top = 370.393940000000000000
        Width = 718.101251175000000000
        DataSet = frxdsOstByMed
        DataSetName = 'frxdsOstByMed'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo57: TfrxMemoView
          Left = 38.000000000000000000
          Width = 300.000000000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = dsSlVed1
          DataSetName = 'dsSlVedTar'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxdsOstByMed."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 338.000000000000000000
          Width = 95.000000000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = dsSlVed1
          DataSetName = 'dsSlVedTar'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsOstByMed."FN_KOLOST"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 433.000000000000000000
          Width = 95.000000000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 528.000310000000000000
          Width = 95.000000000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 623.000000000000000000
          Width = 95.000000000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Width = 38.000000000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 650.079160000000000000
        Width = 718.101251175000000000
        object Memo27: TfrxMemoView
          Left = 563.000000000000000000
          Width = 155.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[<Page#> - <PageMinus> + 1]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Width = 525.354670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
        end
      end
    end
    object OpisList: TfrxReportPage
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      OnAfterPrint = 'OpisListOnAfterPrint'
      OnBeforePrint = 'OpisListOnBeforePrint'
      object MasterData4: TfrxMasterData
        Height = 22.677167800000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        DataSet = frxdsOstByParties
        DataSetName = 'frxdsOstByParties'
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo77: TfrxMemoView
          Width = 38.456710000000000000
          Height = 22.677165350000000000
          OnBeforePrint = 'Memo77OnBeforePrint'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 38.456710000000000000
          Width = 26.456710000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 64.913420000000000000
          Width = 202.110390000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = dsOLToxic
          DataSetName = 'dsOLToxic'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.UTF8 = (
            '[frxdsOstByParties."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 267.023810000000000000
          Width = 60.472480000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = dsOLToxic
          DataSetName = 'dsOLToxic'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsOstByParties."EDIZM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 327.496290000000000000
          Width = 75.590600000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = dsOLToxic
          DataSetName = 'dsOLToxic'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsOstByParties."FN_KOLOST"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 403.086890000000000000
          Width = 74.031540000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = dsOLToxic
          DataSetName = 'dsOLToxic'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxdsOstByParties."FN_PRICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 477.118430000000000000
          Width = 86.031540000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = dsOLToxic
          DataSetName = 'dsOLToxic'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxdsOstByParties."SUMM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 563.149970000000000000
          Width = 71.811070000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = dsOLToxic
          DataSetName = 'dsOLToxic'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsOstByParties."FC_SERIAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 634.961040000000000000
          Width = 83.149660000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter2: TfrxPageFooter
        Height = 211.196970000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'PageFooter2OnBeforePrint'
        object Memo88: TfrxMemoView
          Align = baLeft
          Top = 95.590600000000000000
          Width = 154.960730000000000000
          Height = 19.015770000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105'                       ' +
              '                   '#1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105' '#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109'-'#1056#1109#1057#8218#1056#1030#1056 +
              #181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1057#8230' '#1056#187#1056#1105#1057#8224)
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          Align = baLeft
          Top = 121.944960000000000000
          Width = 303.000000000000000000
          Height = 23.236240000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105' '#1057#8225#1056#187#1056#181#1056#1029#1056#1109#1056#1030' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470 +
              ' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo86: TfrxMemoView
          Align = baLeft
          Top = 18.897650000000000000
          Width = 128.504020000000000000
          Height = 56.692950000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1027#1057#8218#1057#1026'-'#1057#8224#1056#181' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 143.622140000000000000
          Top = 44.897650000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#1029#1056#176#1057#8218#1057#1107#1057#1026#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1057#8230' '#1056#1111#1056#1109#1056#1108#1056#176#1056#183#1056#176#1057#8218#1056#181#1056#187#1056#181 +
              #1056#8470':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 52.913420000000000000
          Width = 81.110390000000000000
          Height = 18.897650000000000000
          Visible = False
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1105#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1027#1057#8218#1057#1026'-'#1057#8224#1056#181)
          ParentFont = False
        end
        object Memo91: TfrxMemoView
          Left = 404.842920000000000000
          Width = 158.307050000000000000
          Height = 18.897637800000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = 'value = 0'
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176': [SUM(<frxdsOstByParties."SUMM">,MasterData4)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 195.013296660000000000
          Width = 208.963203340000000000
          Height = 18.897637800000000000
          OnBeforePrint = 'Memo28OnBeforePrint'
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clWhite
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = 'value = 0'
          Memo.UTF8 = (
            
              #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109': [FormatFloat('#39'### ### ### ##0.#####'#39',SUM(<frxdsOstB' +
              'yParties."FN_KOLOST">,MasterData4))]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Rich1: TfrxRichView
          Left = 143.622140000000000000
          Top = 22.677180000000000000
          Width = 574.488560000000000000
          Height = 22.677180000000000000
          ShowHint = False
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235315C64656666305C6465
            666C616E67313034397B5C666F6E7474626C7B5C66305C666E696C5C66636861
            727365743230347B5C2A5C666E616D6520417269616C3B7D417269616C204359
            523B7D7B5C66315C666E696C5C66636861727365743020417269616C3B7D7B5C
            66325C666E696C204D532053616E732053657269663B7D7D0D0A7B5C2A5C6765
            6E657261746F72204D7366746564697420352E34312E32312E323531303B7D5C
            766965776B696E64345C7563315C706172645C66305C667332305C2763665C27
            65655C2766305C2766665C2765345C2765615C2765655C2765325C2766625C27
            6635205C2765645C2765655C2765635C2765355C2766305C2765655C2765323A
            205C6C616E67313033335C756C5C663120205B4C696E654E756D5D205C6C616E
            67313034395C756C6E6F6E655C6630202C20205C276631205C6C616E67313033
            335C66315C75383437303F205C756C20205B3C4C696E6546697273743E5D205C
            756C6E6F6E6520205C6C616E67313034395C66305C2765665C276565205C6C61
            6E67313033335C66315C75383437303F205C756C20205B3C4C696E654C617374
            3E5D205C756C6E6F6E655C66325C667331365C7061720D0A7D0D0A00}
        end
        object Memo29: TfrxMemoView
          Left = 389.291590000000000000
          Top = 45.354360000000000000
          Width = 328.819110000000000000
          Height = 18.897650000000000000
          ShowHint = False
          FlowTo = frxInv.Memo30
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[FLOAT_NUMBER_TO_WORDS(SUM(<frxdsOstByParties."FN_KOLOST">,Maste' +
              'rData4))]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo30: TfrxMemoView
          Left = 143.622140000000000000
          Top = 64.252010000000000000
          Width = 574.488560000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 97.063080000000000000
          Top = 152.000000000000000000
          Width = 621.047620000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Align = baLeft
          Top = 152.000000000000000000
          Width = 97.063080000000000000
          Height = 22.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218'-'#1056#1109#1057#8218#1056#1030'. '#1056#187#1056#1105#1057#8224#1056#176':')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 303.000000000000000000
          Top = 122.000000000000000000
          Width = 415.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 155.000000000000000000
          Top = 92.000000000000000000
          Width = 563.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[PK2]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Top = 187.976500000000000000
          Width = 514.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
        end
        object Memo121: TfrxMemoView
          Left = 516.000000000000000000
          Top = 190.000000000000000000
          Width = 203.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[<Page#>-<OpisPageFirstNum>+1]')
          ParentFont = False
        end
        object Memo124: TfrxMemoView
          Left = 150.000000000000000000
          Top = 1.600803330000000000
          Width = 27.821583330000000000
          Height = 18.897650000000000000
          Visible = False
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[COUNT(MasterData4)]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 126.000000000000000000
        Top = 105.826840000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = 'frxdsOstByParties."FC_UCHGR"'
        ReprintOnNewPage = True
        StartNewPage = True
        object Memo62: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1056#1111#1056#1105#1057#1027#1056#1029#1056#1109#1056#8470' '#1056#187#1056#1105#1057#1027#1057#8218' '#1074#8222#8211)
          ParentFont = False
        end
        object Memo138: TfrxMemoView
          Align = baWidth
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1057#8225#1056#181#1057#8218#1056#1029#1056#176#1057#1039' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111#1056#176': [frxdsOstByParties."FC_UCHGR"]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Top = 50.000000000000000000
          Width = 38.456710000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111#1056#1111)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 38.456710000000000000
          Top = 50.000000000000000000
          Width = 26.456710000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1056#1029#1056#1108#1056#187' '#1074#8222#8211)
          ParentFont = False
          Rotation = 90
        end
        object Memo69: TfrxMemoView
          Left = 64.913420000000000000
          Top = 50.000000000000000000
          Width = 202.110390000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#1109#1056#1030' '#1056#1105' '#1056#1169#1057#1026#1057#1107#1056#1110#1056#1105#1057#8230' '#1057#8224#1056#181#1056#1029#1056#1029 +
              #1056#1109#1057#1027#1057#8218#1056#181#1056#8470' '#1056#1111#1056#1109' '#1056#1111#1056#176#1057#1026#1057#8218#1056#1105#1057#1039#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 267.023810000000000000
          Top = 50.000000000000000000
          Width = 60.472480000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#1105#1056#183#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 327.496290000000000000
          Top = 50.000000000000000000
          Width = 75.590600000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 403.086890000000000000
          Top = 87.795300000000000000
          Width = 74.031540000000000000
          Height = 37.795275590000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 403.086890000000000000
          Top = 50.000000000000000000
          Width = 160.063080000000000000
          Height = 37.795275590000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1057#1026#1056#1109#1056#183#1056#1029#1056#1105#1057#8225#1056#1029#1057#8249#1056#1112' '#1057#8224#1056#181#1056#1029#1056#176#1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 477.118430000000000000
          Top = 87.795300000000000000
          Width = 86.031540000000000000
          Height = 37.795275590000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 563.149970000000000000
          Top = 50.000000000000000000
          Width = 71.811070000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211#1074#8222#8211' '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111', '#1057#1027#1056#181#1057#1026#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 634.961040000000000000
          Top = 50.000000000000000000
          Width = 83.149660000000000000
          Height = 75.590551180000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#1112#1056#181#1057#8225#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.680000000000000000
        Top = 298.582870000000000000
        Width = 718.110700000000000000
        object Memo92: TfrxMemoView
          Width = 38.456710000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 38.456710000000000000
          Width = 26.456710000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          Rotation = 90
        end
        object Memo94: TfrxMemoView
          Left = 64.913420000000000000
          Width = 202.110390000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = dsSlVed1
          DataSetName = 'dsSlVedTar'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 267.023810000000000000
          Width = 60.472480000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Left = 327.496290000000000000
          Width = 75.590600000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = dsSlVed1
          DataSetName = 'dsSlVedTar'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 403.086890000000000000
          Width = 74.031540000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 477.118430000000000000
          Width = 86.031540000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 563.149970000000000000
          Width = 71.811070000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo100: TfrxMemoView
          Left = 634.961040000000000000
          Width = 83.149660000000000000
          Height = 22.677165350000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader3: TfrxPageHeader
        Height = 3.779530000000000000
        Top = 41.574830000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'PageHeader3OnBeforePrint'
      end
      object ReportTitle1: TfrxReportTitle
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
      end
    end
    object OpisGroup: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 15.875000000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      Columns = 3
      ColumnWidth = 63.333312500000000000
      ColumnPositions.Strings = (
        '0'
        '63,33'
        '126,66')
      object Header2: TfrxHeader
        Height = 52.000000000000000000
        Top = 158.740260000000000000
        Width = 239.370154593125000000
        ReprintOnNewPage = True
        object Memo56: TfrxMemoView
          Left = 1.000000000000000000
          Top = 8.000000000000000000
          Width = 76.000000000000000000
          Height = 44.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026#1056#176' '#1056#1109#1056#1111#1056#1105#1057#1027#1056#181#1056#8470' '#1056#187#1056#1105#1057#1027#1057#8218#1056#1109#1056#1030
            'c '#1074#8222#8211' '#1056#1111#1056#1109' '#1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 77.000000000000000000
          Top = 8.000000000000000000
          Width = 68.000000000000000000
          Height = 44.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 145.000000000000000000
          Top = 8.000000000000000000
          Width = 84.000000000000000000
          Height = 44.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Height = 20.000000000000000000
        Top = 234.330860000000000000
        Width = 239.370154593125000000
        OnBeforePrint = 'MasterData2OnBeforePrint'
        DataSet = frxdsTinv_opis_group
        DataSetName = 'frxdsTinv_opis_group'
        KeepHeader = True
        KeepTogether = True
        RowCount = 0
        Stretched = True
        object Memo102: TfrxMemoView
          Left = 1.000000000000000000
          Width = 76.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsTinv_opis_group."line1"] - [frxdsTinv_opis_group."line2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo104: TfrxMemoView
          Left = 77.000000000000000000
          Width = 68.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsTinv_opis_group."kol_by_page"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo105: TfrxMemoView
          Left = 145.000000000000000000
          Width = 84.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsTinv_opis_group."summ_by_page"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader4: TfrxPageHeader
        Height = 80.000000000000000000
        Top = 18.897650000000000000
        Width = 695.901236837500000000
        OnBeforePrint = 'PageHeader4OnBeforePrint'
        object Memo54: TfrxMemoView
          Align = baWidth
          Top = 4.000000000000000000
          Width = 695.901236837500000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8220#1056#160#1056#1032#1056#1119#1056#1119#1056#152#1056#160#1056#1115#1056#8217#1056#1113#1056#1106' '#1056#1115#1056#1119#1056#152#1056#1038#1056#152)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 296.000000000000000000
          Top = 27.000000000000000000
          Width = 80.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1110#1056#1109#1057#1026#1056#1109#1056#1169' ('#1057#1027#1056#181#1056#187#1056#1109') ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Top = 27.000000000000000000
          Width = 52.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1106#1056#1111#1057#8218#1056#181#1056#1108#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo103: TfrxMemoView
          Left = 52.000000000000000000
          Top = 27.000000000000000000
          Width = 232.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          Left = 376.000000000000000000
          Top = 27.000000000000000000
          Width = 320.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Place]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo107: TfrxMemoView
          Left = 220.000000000000000000
          Top = 56.000000000000000000
          Width = 28.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1029#1056#176' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo108: TfrxMemoView
          Left = 248.000000000000000000
          Top = 56.000000000000000000
          Width = 232.000000000000000000
          Height = 16.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[Dat]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter5: TfrxPageFooter
        Height = 184.000000000000000000
        Top = 313.700990000000000000
        Width = 695.901236837500000000
        object Memo109: TfrxMemoView
          Top = 4.000000000000000000
          Width = 156.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1057#1027#1057#8218#1057#1026#1056#176#1056#1029#1056#1105#1057#8224#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Align = baWidth
          Width = 695.901236837500000000
          Height = 4.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 156.000000000000000000
          Top = 4.000000000000000000
          Width = 540.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[SUM(<frxdsTinv_opis_group."summ_by_page">, MasterData2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo112: TfrxMemoView
          Top = 24.000000000000000000
          Width = 156.000000000000000000
          Height = 24.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109' '#1057#1026#1057#1107#1056#177#1056#187#1056#181#1056#8470' '#1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo113: TfrxMemoView
          Left = 156.000000000000000000
          Top = 24.000000000000000000
          Width = 540.000000000000000000
          Height = 24.000000000000000000
          ShowHint = False
          FlowTo = frxInv.Memo114
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            
              '[INT_NUMBER_TO_WORDS(TRUNC(SUM(<frxdsTinv_opis_group."summ_by_pa' +
              'ge">, MasterData2)), 1, '#39#1057#1026#1057#1107#1056#177#1056#187#1057#1034#39', '#39#1057#1026#1057#1107#1056#177#1056#187#1057#1039#39', '#39#1057#1026#1057#1107#1056#177#1056#187#1056#181#1056 +
              #8470#39')] [INT_NUMBER_TO_WORDS(ROUND(100*Frac(SUM(<frxdsTinv_opis_gro' +
              'up."summ_by_page">, MasterData2))), 2, '#39#1056#1108#1056#1109#1056#1111#1056#181#1056#8470#1056#1108#1056#176#39', '#39#1056#1108#1056#1109#1056#1111 +
              #1056#181#1056#8470#1056#1108#1056#1105#39', '#39#1056#1108#1056#1109#1056#1111#1056#181#1056#181#1056#1108#39')]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo114: TfrxMemoView
          Left = 156.000000000000000000
          Top = 45.000000000000000000
          Width = 540.000000000000000000
          Height = 24.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo115: TfrxMemoView
          Top = 80.000000000000000000
          Width = 156.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Left = 156.000000000000000000
          Top = 80.000000000000000000
          Width = 540.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo117: TfrxMemoView
          Top = 100.000000000000000000
          Width = 156.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1030'. '#1056#176#1056#1111#1057#8218#1056#181#1056#1108#1056#1109#1056#8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 156.000000000000000000
          Top = 100.000000000000000000
          Width = 540.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo119: TfrxMemoView
          Top = 120.000000000000000000
          Width = 156.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8216#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo120: TfrxMemoView
          Left = 156.000000000000000000
          Top = 120.000000000000000000
          Width = 540.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo122: TfrxMemoView
          Top = 164.000000000000000000
          Width = 525.354670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[MEDOTRADE_SIGN]')
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          Left = 540.000000000000000000
          Top = 164.000000000000000000
          Width = 155.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[<Page#>-<OpisPageFirstNum>+1]')
          ParentFont = False
        end
      end
    end
  end
  object odsOstByParties: TOracleDataSet
    SQL.Strings = (
      'select ROWNUM, a.* from ('
      'SELECT ost.KARTID,'
      '       m.fc_name,'
      '       k.fc_serial,'
      '       t.fc_name edizm,'
      '       ost.MEDICID,'
      '       (ost.FN_PRICE * ost.fn_kolost) as summ,'
      '       ost.FN_PRICE,'
      '       ost.fn_kolost,'
      '       Uch.fc_uchgr,'
      '       uch.uchgrid '
      ''
      '   FROM med.vmedkart_kolost ost,'
      '       med.tmedic m,'
      '       med.tei t,'
      '       med.tkart k,'
      '       med.tuchgr Uch'
      ' WHERE '
      '       ost.KARTID = k.kartid'
      '   AND ost.MEDICID = m.medicid   '
      '   AND #uchgrid# = uch.uchgrid'
      '   AND M.eiid = t.eiid(+)'
      '   AND uch.uchgrid in(%UCHGR_NUMS)'
      '   AND K.FK_FINSOURCE_ID in(%FINSOURCE_NUMS)'
      '   AND ost.fn_kolost > 0'
      'order by Uch.fc_uchgr, m.fc_name'
      ''
      ') a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000700000046435F4E414D45010000000000060000004B4152
      544944010000000000070000004D45444943494401000000000008000000464E
      5F5052494345010000000000050000004544495A4D0100000000000400000053
      554D4D0100000000000900000046435F53455249414C01000000000009000000
      464E5F4B4F4C4F53540100000000000800000046435F55434847520100000000
      0006000000524F574E554D010000000000}
    Cursor = crHourGlass
    Session = os
    Left = 30
    Top = 248
  end
  object frxdsOstByParties: TfrxDBDataset
    UserName = 'frxdsOstByParties'
    CloseDataSource = False
    DataSet = odsOstByParties
    BCDToCurrency = False
    Left = 30
    Top = 294
  end
  object odsOstByMed: TOracleDataSet
    SQL.Strings = (
      'SELECT ost.medicid,'
      '       m.fc_name,'
      '       sum(ost.fn_kolost) fn_kolost,'
      '       Uch.fc_uchgr,'
      '       Uch.uchgrid'
      ''
      '   FROM med.vmedkart_kolost ost,'
      '       med.tmedic m,'
      '       med.tuchgr Uch,'
      '       med.tkart k'
      ' WHERE ost.fn_kolost > 0'
      '   AND ost.MEDICID = m.medicid   '
      '   AND #uchgrid# = uch.uchgrid'
      '   AND uch.uchgrid in(%UCHGR_NUMS)'
      '   AND uch.uchgrid = :uchgrid'
      '   AND K.KARTID = ost.KARTID'
      '   AND K.FK_FINSOURCE_ID in(%FINSOURCE_NUMS)'
      ' group by ost.medicid,'
      '          m.fc_name,'
      '          Uch.fc_uchgr,'
      '          Uch.uchgrid '
      'order by Uch.fc_uchgr, m.fc_name'
      '')
    Optimize = False
    Variables.Data = {
      0300000001000000080000003A55434847524944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000700000046435F4E414D4501000000000009000000464E5F
      4B4F4C4F53540100000000000800000046435F55434847520100000000000700
      000055434847524944010000000000}
    Cursor = crHourGlass
    Master = odsOstByMedGroups
    MasterFields = 'uchgrid'
    Session = os
    Left = 124
    Top = 248
  end
  object frxdsOstByMed: TfrxDBDataset
    UserName = 'frxdsOstByMed'
    CloseDataSource = False
    DataSet = odsOstByMed
    BCDToCurrency = False
    Left = 126
    Top = 294
  end
  object OracleQuery1: TOracleQuery
    SQL.Strings = (
      'begin'
      'med.pkg_medses.set_curmo(:MO);'
      
        '                  med.pkg_medses.set_curmo_group(med.pkg_medses.' +
        'GET_CUR_MOGROUP_BY_MOID(:MO));'
      '                  med.pkg_medses.ResetDatePeriod;'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {0300000001000000030000003A4D4F03000000040000007401000000000000}
    Left = 304
    Top = 180
  end
  object odsOstByMedGroups: TOracleDataSet
    SQL.Strings = (
      'SELECT distinct'
      '       Uch.fc_uchgr,'
      '       Uch.uchgrid '
      ''
      
        '   FROM med.vmedkart_kolost ost, /* '#1091#1073#1088#1072#1083' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1091' '#1080' '#1089#1091#1084#1084#1091', '#1074 +
        #1089#1105' '#1088#1072#1074#1085#1086' '#1085#1077' '#1080#1089#1087#1086#1083#1100#1079#1091#1102#1090#1089#1103'*/'
      '       med.tmedic m,'
      '       med.tuchgr Uch,'
      '       med.tkart k'
      ' WHERE ost.fn_kolost > 0'
      '   AND ost.MEDICID = m.medicid   '
      '   AND #uchgrid# = uch.uchgrid'
      '   AND uch.uchgrid in(%UCHGR_NUMS)'
      '   AND K.FK_FINSOURCE_ID in(%FINSOURCE_NUMS)'
      '   AND K.KARTID = ost.KARTID'
      ''
      'order by Uch.fc_uchgr'
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000020000000800000046435F5543484752010000000000070000005543
      4847524944010000000000}
    Cursor = crHourGlass
    Session = os
    Left = 233
    Top = 246
  end
  object frxDBdsOstByMedGroups: TfrxDBDataset
    UserName = 'frxDBdsOstByMedGroups'
    CloseDataSource = False
    DataSet = odsOstByMedGroups
    BCDToCurrency = False
    Left = 233
    Top = 294
  end
  object frxRichObject1: TfrxRichObject
    Left = 120
    Top = 192
  end
  object oqINS_Tinv_opis_group: TOracleQuery
    SQL.Strings = (
      
        'insert into med.tinv_opis_group a (line1, line2, kol_by_page, su' +
        'mm_by_page)'
      'VALUES(:pline1, :pline2, :pkol_by_page, :psumm_by_page)')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000004000000070000003A504C494E453103000000000000000000000007
      0000003A504C494E45320300000000000000000000000D0000003A504B4F4C5F
      42595F504147450400000000000000000000000E0000003A5053554D4D5F4259
      5F50414745040000000000000000000000}
    Left = 280
    Top = 136
  end
  object odsTinv_opis_group: TOracleDataSet
    SQL.Strings = (
      'SELECT a.line1, a.line2, a.kol_by_page, a.summ_by_page'
      '  FROM med.tinv_opis_group a'
      'order by a.line1')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000040000000700000046435F4E414D4501000000000009000000464E5F
      4B4F4C4F53540100000000000800000046435F55434847520100000000000700
      000055434847524944010000000000}
    Cursor = crSQLWait
    Session = os
    Left = 172
    Top = 136
  end
  object frxdsTinv_opis_group: TfrxDBDataset
    UserName = 'frxdsTinv_opis_group'
    CloseDataSource = False
    DataSet = odsTinv_opis_group
    BCDToCurrency = False
    Left = 174
    Top = 182
  end
  object frxInvOld: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40981.608786863400000000
    ReportOptions.LastChange = 40995.468398171300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  nSUM_CNT: double;'
      '  nSUM_SUM: double;'
      '    '
      'procedure Memo78OnAfterData(Sender: TfrxComponent);'
      'begin'
      
        '  nSUM_SUM := SUM(<frxDBdsRaznInv."SUMM">,MasterData1);         ' +
        '                                                                ' +
        '                                                 '
      'end;'
      ''
      'procedure Memo77OnAfterData(Sender: TfrxComponent);'
      'begin'
      '  nSUM_CNT := SUM(<frxDBdsRaznInv."FN_KOLOST">,MasterData1);'
      'end;'
      ''
      'begin'
      '  nSUM_CNT := 0;'
      '  nSUM_SUM := 0;  '
      'end.')
    OnGetValue = frxInvGetValue
    OnUserFunction = frxInvUserFunction
    OnClosePreview = frxInvClosePreview
    Left = 394
    Top = 196
    Datasets = <
      item
        DataSet = frxDBdsRaznInv
        DataSetName = 'frxDBdsRaznInv'
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
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 604.724800000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          Align = baWidth
          Width = 1046.929810000000000000
          Height = 37.795275590000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#152#1056#1116#1056#8217#1056#8226#1056#1116#1056#1118#1056#1106#1056#160#1056#152#1056#8212#1056#1106#1056#166#1056#152#1056#1115#1056#1116#1056#1116#1056#1106#1056#1031' '#1056#1115#1056#1119#1056#152#1056#1038#1056#172' '#1056#1118#1056#1115#1056#8217#1056#1106#1056#160#1056#1116#1056#1115'-'#1056 +
              #1114#1056#1106#1056#1118#1056#8226#1056#160#1056#152#1056#1106#1056#8250#1056#172#1056#1116#1056#171#1056#1168' '#1056#166#1056#8226#1056#1116#1056#1116#1056#1115#1056#1038#1056#1118#1056#8226#1056#8482
            ' '#1074#8222#8211' [DOCNUM]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 37.795300000000000000
          Width = 302.362400000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1032#1056#1029#1056#1105#1057#8222#1056#1105#1057#8224#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1029#1056#176#1057#1039' '#1057#8222#1056#1109#1057#1026#1056#1112#1056#176' '#1074#8222#8211#1056#152#1056#1116#1056#8217'-3'
            
              #1056#1032#1057#8218#1056#1030#1056#181#1057#1026#1056#182#1056#1169#1056#181#1056#1029#1056#176' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1029#1056#1109#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1056#181#1056#1112' '#1056#8220#1056#1109#1057#1027#1056#1108#1056#1109#1056#1112#1057#1027 +
              #1057#8218#1056#176#1057#8218#1056#176
            #1056#160#1056#1109#1057#1027#1057#1027#1056#1105#1056#1105' '#1056#1109#1057#8218' 18.08.98 '#1074#8222#8211'88')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1115#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1057#1039':')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Top = 113.385900000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026#1057#1107#1056#1108#1057#8218#1057#1107#1057#1026#1056#1029#1056#176#1057#1039' '#1056#181#1056#1169#1056#1105#1056#1029#1056#1105#1057#8224#1056#176' '#1056#1109#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105':')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 132.283550000000000000
          Width = 491.338900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1115#1057#1027#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1169#1056#187#1057#1039' '#1056#1111#1057#1026#1056#1109#1056#1030#1056#181#1056#1169#1056#181#1056#1029#1056#1105#1057#1039' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056 +
              #1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105': '#1056#1111#1057#1026#1056#1105#1056#1108#1056#176#1056#183', '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1029#1056#1109#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1056#181', '#1057#1026#1056#176#1057#1027#1056#1111#1056 +
              #1109#1057#1026#1057#1039#1056#182#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 245.669450000000000000
          Top = 151.181200000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1029#1057#1107#1056#182#1056#1029#1056#1109#1056#181' '#1056#1111#1056#1109#1056#1169#1057#8225#1056#181#1057#1026#1056#1108#1056#1029#1057#1107#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 207.874150000000000000
          Top = 113.385900000000000000
          Width = 548.031850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[CREATEMOGROUP]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 94.488250000000000000
          Top = 94.488250000000000000
          Width = 661.417750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[LOK]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 869.291900000000000000
          Top = 37.795300000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '   '#1056#1113#1056#1115#1056#8221#1056#171)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 869.291900000000000000
          Top = 56.692950000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '   0317004')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 869.291900000000000000
          Top = 75.590600000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 869.291900000000000000
          Top = 94.488250000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 869.291900000000000000
          Top = 113.385900000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 869.291900000000000000
          Top = 132.283550000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 869.291900000000000000
          Top = 151.181200000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 869.291900000000000000
          Top = 170.078850000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 869.291900000000000000
          Top = 188.976500000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 869.291900000000000000
          Top = 207.874150000000000000
          Width = 177.637910000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 869.291900000000000000
          Top = 234.330860000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[DAT]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 755.906000000000000000
          Top = 56.692950000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#164#1056#1109#1057#1026#1056#1112#1056#176' '#1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1032#1056#8221' ')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 755.906000000000000000
          Top = 75.590600000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1119#1056#1115' ')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 755.906000000000000000
          Top = 94.488250000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8217#1056#1105#1056#1169' '#1056#1169#1056#181#1057#1039#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105' ')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 812.598950000000000000
          Top = 113.385900000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026' ')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 812.598950000000000000
          Top = 132.283550000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' ')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 680.315400000000000000
          Top = 151.181200000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1029#1056#176#1057#8225#1056#176#1056#187#1056#176' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105' ')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 680.315400000000000000
          Top = 170.078850000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1109#1056#1108#1056#1109#1056#1029#1057#8225#1056#176#1056#1029#1056#1105#1057#1039' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105' ')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 755.906000000000000000
          Top = 188.976500000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8217#1056#1105#1056#1169' '#1056#1109#1056#1111#1056#181#1057#1026#1056#176#1057#8224#1056#1105#1056#1105' ')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 680.315400000000000000
          Top = 207.874150000000000000
          Width = 188.976500000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 680.315400000000000000
          Top = 234.330860000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[DOCNUM]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 37.795300000000000000
          Top = 264.567100000000000000
          Width = 971.339210000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo32: TfrxMemoView
          Left = 37.795300000000000000
          Top = 291.023810000000000000
          Width = 971.339210000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '('#1056#1030#1056#1105#1056#1169' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#1029#1056#1109'-'#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1057#8230' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#181 +
              #1056#8470')')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo33: TfrxMemoView
          Left = 37.795300000000000000
          Top = 317.480520000000000000
          Width = 971.339210000000000000
          Height = 18.897637795275600000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1116#1056#176#1057#8230#1056#1109#1056#1169#1057#1039#1057#8240#1056#1105#1056#181#1057#1027#1057#1039)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo34: TfrxMemoView
          Left = 37.795300000000000000
          Top = 336.378170000000000000
          Width = 971.339210000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo35: TfrxMemoView
          Left = 37.795300000000000000
          Top = 355.275820000000000000
          Width = 971.339210000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '('#1056#1030' '#1057#1027#1056#1109#1056#177#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105' '#1056#1109#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105', '#1056#1111#1056#1109#1056#187#1057#1107#1057 +
              #8225#1056#181#1056#1029#1056#1029#1057#8249#1056#181' '#1056#1169#1056#187#1057#1039' '#1056#1111#1056#181#1057#1026#1056#181#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1056#1108#1056#1105')')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Align = baWidth
          Top = 434.645950000000000000
          Width = 1046.929810000000000000
          Height = 56.692901180000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            
              '      '#1056#1113' '#1056#1029#1056#176#1057#8225#1056#176#1056#187#1057#1107' '#1056#1111#1057#1026#1056#1109#1056#1030#1056#181#1056#1169#1056#181#1056#1029#1056#1105#1057#1039' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056 +
              #176#1057#8224#1056#1105#1056#1105' '#1056#1030#1057#1027#1056#181' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1056#1029#1057#8249#1056#181' '#1056#1105' '#1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169#1056#1029#1057#8249#1056#181' '#1056#1169#1056#1109#1056#1108#1057#1107 +
              #1056#1112#1056#181#1056#1029#1057#8218#1057#8249' '#1056#1029#1056#176' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#1029#1056#1109'-'#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1056#181' '#1057#8224#1056#181#1056#1029#1056#1029 +
              #1056#1109#1057#1027#1057#8218#1056#1105' '#1057#1027#1056#1169#1056#176#1056#1029#1057#8249' '#1056#1030' '#1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026#1056#1105#1057#1035' '#1056#1105' '#1056#1030#1057#1027#1056#181' '#1057#8218#1056#1109#1056#1030#1056#176 +
              #1057#1026#1056#1029#1056#1109'-'#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1056#181' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105', '#1056#1111#1056#1109#1057#1027#1057#8218#1057#1107#1056#1111#1056#1105 +
              #1056#1030#1057#8364#1056#1105#1056#181' '#1056#1029#1056#176' '#1056#1112#1056#1109#1057#1035' ('#1056#1029#1056#176#1057#8364#1057#1107') '#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034', ' +
              #1056#1109#1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169#1056#1109#1056#1030#1056#176#1056#1029#1057#8249', '#1056#176' '#1056#1030#1057#8249#1056#177#1057#8249#1056#1030#1057#8364#1056#1105#1056#181' '#1057#1027#1056#1111#1056#1105#1057#1027#1056#176#1056#1029#1057#8249' '#1056#1030' ' +
              #1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169'.')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 37.795300000000000000
          Top = 396.850650000000000000
          Width = 971.339210000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1056#1111#1056#1105#1057#1027#1056#1108#1056#176)
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Top = 510.236550000000000000
          Width = 245.669450000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#1109'-'#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#181'('#1057#8249#1056#181') '#1056#187#1056#1105#1057#8224#1056#1109 +
              '('#1056#176'):')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 245.669450000000000000
          Top = 510.236550000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[CREATEMODOL]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 245.669450000000000000
          Top = 529.134200000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 585.827150000000000000
          Top = 529.134200000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 755.906000000000000000
          Top = 529.134200000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 755.906000000000000000
          Top = 510.236550000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[CREATEMO]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Top = 566.929500000000000000
          Width = 1046.929810000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#1109#1056#1105#1056#183#1056#1030#1056#181#1056#1169#1056#181#1056#1029#1056#1109' '#1057#1027#1056#1029#1057#1039#1057#8218#1056#1105#1056#181' '#1057#8222#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1105#1057#8230' '#1056#1109#1057#1027#1057 +
              #8218#1056#176#1057#8218#1056#1108#1056#1109#1056#1030' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#181#1056#8470' '#1056#1111#1056#1109' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#1109#1057#1039#1056#1029#1056#1105#1057#1035' '#1056#1029#1056#176' [DAT' +
              ']')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897637795275600000
        Top = 684.094930000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 907.087200000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [Page#]')
        end
      end
    end
    object Page2: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Header1: TfrxHeader
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        ReprintOnNewPage = True
        object Memo45: TfrxMemoView
          Width = 52.913385826771650000
          Height = 90.708720000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'/'#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 52.913420000000000000
          Width = 68.031496062992130000
          Height = 90.708720000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#8225#1056#181#1057#8218', '#1057#1027#1057#1107#1056#177#1057#1027#1057#8225#1056#181#1057#8218)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 120.944960000000000000
          Top = 18.897650000000000000
          Width = 185.196970000000000000
          Height = 71.811070000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181', '#1057#8230#1056#176#1057#1026#1056#176#1056#1108#1057#8218#1056#181#1057#1026#1056#1105#1057#1027#1057#8218#1056#1105#1056#1108#1056#176' ('#1056#1030#1056#1105#1056#1169', ' +
              #1057#1027#1056#1109#1057#1026#1057#8218', '#1056#1110#1057#1026#1057#1107#1056#1111#1056#1111#1056#176')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 306.141930000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 71.811070000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169' ('#1056#1029#1056#1109#1056#1112#1056#181#1056#1029#1056#1108#1056#187#1056#176#1057#8218#1057#1107#1057#1026#1056#1029#1057#8249#1056#8470' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026')')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 120.944960000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#1109#1056#1030#1056#176#1057#1026#1056#1029#1056#1109'-'#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1056#181' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 366.614410000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8226#1056#1169'. '#1056#152#1056#183#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 366.614410000000000000
          Top = 18.897650000000000000
          Width = 71.811070000000000000
          Height = 71.811070000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169' '#1056#1111#1056#1109' '#1056#1115#1056#1113#1056#8226#1056#152)
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 438.425480000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 71.811070000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 495.118430000000000000
          Width = 75.590551181102360000
          Height = 90.708720000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#166#1056#181#1056#1029#1056#176' '#1057#1026#1057#1107#1056#177'. '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 570.709030000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 570.709030000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 71.811070000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1029#1057#8249#1056#8470)
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 665.197280000000000000
          Top = 18.897650000000000000
          Width = 75.590551180000000000
          Height = 71.811070000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#1027#1056#1111#1056#1109#1057#1026#1057#8218#1056#176)
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 740.787880000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1109#1056#181' '#1056#1029#1056#176#1056#187#1056#1105#1057#8225#1056#1105#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 740.787880000000000000
          Top = 18.897650000000000000
          Width = 64.251968503937010000
          Height = 71.811070000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 805.039890000000000000
          Top = 18.897650000000000000
          Width = 102.047244094488200000
          Height = 71.811070000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 907.087200000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1056#1169#1056#176#1056#1029#1056#1029#1057#8249#1056#1112' '#1056#177#1057#1107#1057#8230'. '#1057#1107#1057#8225#1056#181#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 907.087200000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 71.811070000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 971.339210000000000000
          Top = 18.897650000000000000
          Width = 75.590551180000000000
          Height = 71.811070000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 132.283550000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBdsRaznInv
        DataSetName = 'frxDBdsRaznInv'
        RowCount = 0
        Stretched = True
        object Memo63: TfrxMemoView
          Width = 52.913385826771650000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[LINE#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 52.913420000000000000
          Width = 68.031496062992130000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FC_SCHET'
          DataSet = frxDBdsRaznInv
          DataSetName = 'frxDBdsRaznInv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsRaznInv."FC_SCHET"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 120.944960000000000000
          Width = 185.196970000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FC_NAME'
          DataSet = frxDBdsRaznInv
          DataSetName = 'frxDBdsRaznInv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBdsRaznInv."FC_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 306.141930000000000000
          Width = 60.472480000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'KARTID'
          DataSet = frxDBdsRaznInv
          DataSetName = 'frxDBdsRaznInv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsRaznInv."KARTID"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 366.614410000000000000
          Width = 71.811070000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FC_OKEI'
          DataSet = frxDBdsRaznInv
          DataSetName = 'frxDBdsRaznInv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsRaznInv."FC_OKEI"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 438.425480000000000000
          Width = 56.692950000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'EDIZM'
          DataSet = frxDBdsRaznInv
          DataSetName = 'frxDBdsRaznInv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsRaznInv."EDIZM"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 495.118430000000000000
          Width = 75.590551180000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_PRICE'
          DataSet = frxDBdsRaznInv
          DataSetName = 'frxDBdsRaznInv'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsRaznInv."FN_PRICE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 570.709030000000000000
          Width = 94.488250000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FC_INVNUM'
          DataSet = frxDBdsRaznInv
          DataSetName = 'frxDBdsRaznInv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsRaznInv."FC_INVNUM"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 665.197280000000000000
          Width = 75.590551180000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FC_PASSPORTNUM'
          DataSet = frxDBdsRaznInv
          DataSetName = 'frxDBdsRaznInv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsRaznInv."FC_PASSPORTNUM"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 740.787880000000000000
          Width = 64.251968500000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'FN_KOLOST'
          DataSet = frxDBdsRaznInv
          DataSetName = 'frxDBdsRaznInv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBdsRaznInv."FN_KOLOST"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 805.039890000000000000
          Width = 102.047244090000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'SUMM'
          DataSet = frxDBdsRaznInv
          DataSetName = 'frxDBdsRaznInv'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBdsRaznInv."SUMM"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 907.087200000000000000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = frxDBdsRaznInv
          DataSetName = 'frxDBdsRaznInv'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 971.339210000000000000
          Width = 75.590551180000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = frxDBdsRaznInv
          DataSetName = 'frxDBdsRaznInv'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 173.858380000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo76: TfrxMemoView
          Width = 740.787880000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109':')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 740.787880000000000000
          Width = 64.251968500000000000
          Height = 18.897637800000000000
          OnAfterData = 'Memo77OnAfterData'
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBdsRaznInv."FN_KOLOST">,MasterData1)]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 805.039890000000000000
          Width = 102.047244090000000000
          Height = 18.897637800000000000
          OnAfterData = 'Memo78OnAfterData'
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBdsRaznInv."SUMM">,MasterData1)]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 907.087200000000000000
          Width = 64.252010000000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 971.339210000000000000
          Width = 75.590551180000000000
          Height = 18.897637800000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
      end
      object PageFooter2: TfrxPageFooter
        Height = 109.606370000000000000
        Top = 253.228510000000000000
        Width = 1046.929810000000000000
        object Memo81: TfrxMemoView
          Top = 11.338590000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#187#1056#1105#1057#1027#1057#8218#1057#1107':')
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Top = 30.236240000000000000
          Width = 495.118063860000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#176') '#1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#1111#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1056#1109#1056#1030#1057#8249#1057#8230' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026#1056#1109#1056#1030': [C' +
              'OUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Top = 49.133890000000000000
          Width = 272.125793860000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#177') '#1056#1115#1056#177#1057#8240#1056#181#1056#181' '#1056#1108#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#181#1056#1169#1056#1105#1056#1029#1056#1105#1057#8224' '#1057#8222#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057 +
              #1027#1056#1108#1056#1105': ')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Top = 68.031540000000000000
          Width = 162.519423860000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1030') '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' '#1057#8222#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1105': ')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 903.307670000000000000
          Top = 90.708720000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [PAGE#]')
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 162.519790000000000000
          Top = 68.031540000000000000
          Width = 332.598273860000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[SUM(<frxDBdsRaznInv."SUMM">,MasterData1)]')
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          Left = 272.126160000000000000
          Top = 49.133890000000000000
          Width = 222.991903860000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[SUM(<frxDBdsRaznInv."FN_KOLOST">,MasterData1)]')
          ParentFont = False
        end
      end
    end
    object Page3: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 540.472790000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo87: TfrxMemoView
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1109#1056#1111#1056#1105#1057#1027#1056#1105':')
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          Top = 18.897650000000000000
          Width = 495.118063860000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#176') '#1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#1111#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1056#1109#1056#1030#1057#8249#1057#8230' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026#1056#1109#1056#1030': [C' +
              'NTALL]')
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          Top = 37.795300000000000000
          Width = 321.259683860000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#177') '#1056#1115#1056#177#1057#8240#1056#181#1056#181' '#1056#1108#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#181#1056#1169#1056#1105#1056#1029#1056#1105#1057#8224' '#1057#8222#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057 +
              #1027#1056#1108#1056#1105':')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Top = 56.692950000000000000
          Width = 192.755663860000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1030') '#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1057#1107' '#1057#8222#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027#1056#1108#1056#1105':')
          ParentFont = False
        end
        object Memo91: TfrxMemoView
          Align = baWidth
          Top = 94.488250000000000000
          Width = 1046.929810000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            
              '    '#1056#8217#1057#1027#1056#181' '#1057#8224#1056#181#1056#1029#1057#8249', '#1056#1111#1056#1109#1056#1169#1057#1027#1057#8225#1056#181#1057#8218#1057#8249' '#1056#1105#1057#8218#1056#1109#1056#1110#1056#1109#1056#1030' '#1056#1111#1056#1109' '#1057#1027#1057#8218#1057#1026#1056#1109 +
              #1056#1108#1056#176#1056#1112', '#1057#1027#1057#8218#1057#1026#1056#176#1056#1029#1056#1105#1057#8224#1056#176#1056#1112' '#1056#1105' '#1056#1030' '#1057#8224#1056#181#1056#187#1056#1109#1056#1112' '#1056#1111#1056#1109' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057 +
              #1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1109#1056#1111#1056#1105#1057#1027#1056#1105' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#1029#1056#1109'-'#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187 +
              #1057#1034#1056#1029#1057#8249#1057#8230' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#181#1056#8470' '#1056#1111#1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#181#1056#1029#1057#8249'.')
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          Left = 18.897650000000000000
          Top = 151.181200000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#181#1056#1169#1057#1027#1056#181#1056#1169#1056#176#1057#8218#1056#181#1056#187#1057#1034' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':  ')
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          Left = 18.897650000000000000
          Top = 170.078850000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#167#1056#187#1056#181#1056#1029#1057#8249' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105':  ')
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Left = 226.771800000000000000
          Top = 151.181200000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '  [PK2]')
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          Left = 226.771800000000000000
          Top = 170.078850000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '  [M1]')
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          Left = 226.771800000000000000
          Top = 188.976500000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '  [M2]')
          ParentFont = False
        end
        object Memo97: TfrxMemoView
          Left = 226.771800000000000000
          Top = 207.874150000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '  [M3]')
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          Align = baWidth
          Top = 245.669450000000000000
          Width = 1046.929810000000000000
          Height = 56.692950000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            
              '    '#1056#8217#1057#1027#1056#181' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#1029#1056#1109'-'#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1056#181' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057 +
              #8218#1056#1105', '#1056#1111#1056#1109#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1057#8249' '#1056#1030' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#181#1056#8470' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176 +
              #1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056#1029#1056#1029#1056#1109#1056#8470' '#1056#1109#1056#1111#1056#1105#1057#1027#1056#1105' '#1057#1027' '#1074#8222#8211' 1 '#1056#1111#1056#1109' '#1074#8222#8211' [CNTALL], '#1056#1108 +
              #1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#181#1056#8470' '#1056#1111#1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#181#1056#1029#1057#8249' '#1056#1030' '#1056#1112#1056#1109#1056#181#1056#1112' ('#1056#1029#1056#176#1057#8364#1056#181#1056#1112') '#1056#1111#1057 +
              #1026#1056#1105#1057#1027#1057#1107#1057#8218#1057#1027#1057#8218#1056#1030#1056#1105#1056#1105' '#1056#1105' '#1056#1030#1056#1029#1056#181#1057#1027#1056#181#1056#1029#1057#8249' '#1056#1030' '#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034', '#1056#1030' '#1057#1027#1056#1030#1057#1039#1056#183 +
              #1056#1105' '#1057#1027' '#1057#8225#1056#181#1056#1112' '#1056#1111#1057#1026#1056#181#1057#8218#1056#181#1056#1029#1056#183#1056#1105#1056#8470' '#1056#1108' '#1056#1105#1056#1029#1056#1030#1056#181#1056#1029#1057#8218#1056#176#1057#1026#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1109#1056 +
              #1029#1056#1029#1056#1109#1056#8470' '#1056#1108#1056#1109#1056#1112#1056#1105#1057#1027#1057#1027#1056#1105#1056#1105' '#1056#1029#1056#181' '#1056#1105#1056#1112#1056#181#1057#1035' ('#1056#1029#1056#181' '#1056#1105#1056#1112#1056#181#1056#181#1056#1112'). '#1056#1118#1056#1109#1056#1030 +
              #1056#176#1057#1026#1056#1029#1056#1109'- '#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1056#181' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109#1057#1027#1057#8218#1056#1105', '#1056#1111#1056#181#1057#1026#1056#181#1057#8225#1056 +
              #1105#1057#1027#1056#187#1056#181#1056#1029#1057#8249' '#1056#1111#1056#1109' '#1056#1109#1056#1111#1056#1105#1057#1027#1056#1105', '#1056#1029#1056#176#1057#8230#1056#1109#1056#1169#1057#1039#1057#8218#1057#1027#1057#1039' '#1056#1029#1056#176' '#1056#1112#1056#1109#1056#181#1056#1112' ('#1056 +
              #1029#1056#176#1057#8364#1056#181#1056#1112') '#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#1112' '#1057#8230#1057#1026#1056#176#1056#1029#1056#181#1056#1029#1056#1105#1056#1105'.')
          ParentFont = False
        end
        object Memo99: TfrxMemoView
          Align = baWidth
          Top = 359.055350000000000000
          Width = 1046.929810000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            
              #1056#8250#1056#1105#1057#8224#1056#1109'('#1056#176'), '#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#181' ('#1057#8249#1056#181') '#1056#183#1056#176' '#1057#1027#1056#1109#1057#8230#1057#1026#1056#176#1056 +
              #1029#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034' '#1057#8218#1056#1109#1056#1030#1056#176#1057#1026#1056#1029#1056#1109'-'#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1057#8230' '#1057#8224#1056#181#1056#1029#1056#1029#1056#1109'c'#1057 +
              #8218#1056#181#1056#8470':')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          Align = baWidth
          Top = 377.953000000000000000
          Width = 1046.929810000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haBlock
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          Align = baWidth
          Top = 396.850650000000000000
          Width = 1046.929810000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haBlock
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Align = baWidth
          Top = 415.748300000000000000
          Width = 1046.929810000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haBlock
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          Align = baWidth
          Top = 472.441250000000000000
          Width = 1046.929810000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8 = (
            
              #1056#1032#1056#1108#1056#176#1056#183#1056#176#1056#1029#1056#1029#1057#8249#1056#181' '#1056#1030' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#181#1056#8470' '#1056#1109#1056#1111#1056#1105#1057#1027#1056#1105' '#1056#1169#1056#176#1056#1029#1056#1029#1057#8249#1056#181 +
              ' '#1056#1105' '#1057#1026#1056#176#1057#1027#1057#8225#1056#181#1057#8218#1057#8249' '#1056#1111#1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1105#1056#187':')
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 132.283550000000000000
          Top = 491.338900000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[CHECKMODOL]')
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          Left = 132.283550000000000000
          Top = 510.236550000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 472.441250000000000000
          Top = 510.236550000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Left = 642.520100000000000000
          Top = 510.236550000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 642.520100000000000000
          Top = 491.338900000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[CHECKMO]')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 321.260050000000000000
          Top = 37.795300000000000000
          Width = 173.858013860000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[nSUM_CNT]')
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 192.756030000000000000
          Top = 56.692950000000000000
          Width = 302.362033860000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[nSUM_SUM]')
          ParentFont = False
        end
      end
      object PageFooter3: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 619.842920000000000000
        Width = 1046.929810000000000000
        object Memo86: TfrxMemoView
          Left = 903.307670000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1057#1027#1057#8218#1057#1026'. [PAGE#]')
          ParentFont = False
        end
      end
    end
  end
  object odsRaznInv: TOracleDataSet
    SQL.Strings = (
      'SELECT TO_CHAR(NULL) FC_SCHET,'
      '       M.FC_NAME,'
      '       OST.KARTID,'
      '       T.FC_OKEI,'
      '       T.FC_NAME EDIZM,'
      '       OST.FN_PRICE,'
      '       K.FC_SERIAL FC_INVNUM,'
      '       TO_CHAR(NULL) FC_PASSPORTNUM,'
      '       OST.MEDICID,'
      '       OST.FN_KOLOST,'
      '       (OST.FN_PRICE * OST.FN_KOLOST) AS SUMM'
      '   FROM MED.VMEDKART_KOLOST OST,'
      '       MED.TMEDIC M,'
      '       MED.TEI T,'
      '       MED.TKART K'
      ' WHERE OST.KARTID = K.KARTID'
      '   AND OST.MEDICID = M.MEDICID   '
      '   AND M.EIID = T.EIID(+)'
      '   AND OST.FN_KOLOST > 0'
      'ORDER BY M.FC_NAME')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000B0000000700000046435F4E414D45010000000000060000004B4152
      544944010000000000070000004D45444943494401000000000008000000464E
      5F5052494345010000000000050000004544495A4D0100000000000400000053
      554D4D01000000000009000000464E5F4B4F4C4F535401000000000008000000
      46435F53434845540100000000000700000046435F4F4B454901000000000009
      00000046435F494E564E554D0100000000000E00000046435F50415353504F52
      544E554D010000000000}
    Cursor = crHourGlass
    Session = os
    Left = 390
    Top = 248
  end
  object frxDBdsRaznInv: TfrxDBDataset
    UserName = 'frxDBdsRaznInv'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FC_SCHET=FC_SCHET'
      'FC_NAME=FC_NAME'
      'KARTID=KARTID'
      'FC_OKEI=FC_OKEI'
      'EDIZM=EDIZM'
      'FN_PRICE=FN_PRICE'
      'FC_INVNUM=FC_INVNUM'
      'FC_PASSPORTNUM=FC_PASSPORTNUM'
      'MEDICID=MEDICID'
      'FN_KOLOST=FN_KOLOST'
      'SUMM=SUMM')
    DataSet = odsRaznInv
    BCDToCurrency = False
    Left = 392
    Top = 296
  end
end
