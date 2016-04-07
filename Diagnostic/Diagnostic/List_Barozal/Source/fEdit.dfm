object frmEdit: TfrmEdit
  Left = 299
  Top = 121
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1087#1088#1086#1094#1077#1076#1091#1088#1099
  ClientHeight = 364
  ClientWidth = 606
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
    Width = 600
    Height = 310
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 16
      Top = 16
      Caption = #8470' '#1078#1091#1088#1085#1072#1083#1072':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
    end
    object cxLabel2: TcxLabel
      Left = 16
      Top = 39
      Caption = #1055#1072#1094#1080#1077#1085#1090':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
    end
    object cxLabel3: TcxLabel
      Left = 16
      Top = 68
      Caption = #8470' '#1073#1072#1088#1086#1082#1072#1084#1077#1088#1099':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
    end
    object cxLabel4: TcxLabel
      Left = 16
      Top = 94
      Caption = #1044#1080#1072#1075#1085#1086#1079':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.IsFontAssigned = True
    end
    object gbCompr: TcxGroupBox
      Left = 16
      Top = 120
      Caption = #1050#1086#1084#1087#1088#1077#1089#1089#1080#1103
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 4
      Height = 81
      Width = 185
      object cxLabel5: TcxLabel
        Left = 12
        Top = 24
        Caption = #1057#1082#1086#1088#1086#1089#1090#1100':'
        Style.TextColor = clBlack
        Style.TextStyle = []
      end
      object cxLabel6: TcxLabel
        Left = 12
        Top = 49
        Caption = #1042#1088#1077#1084#1103':'
        Style.TextColor = clBlack
        Style.TextStyle = []
      end
      object lcbCS: TcxLookupComboBox
        Left = 77
        Top = 22
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
        Properties.ListSource = dsCompr_Speed
        Properties.PostPopupValueOnTab = True
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 2
        Width = 93
      end
      object lcbCT: TcxLookupComboBox
        Left = 77
        Top = 47
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
        Properties.ListSource = dsCompr_Time
        Properties.PostPopupValueOnTab = True
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 3
        Width = 93
      end
    end
    object cxGroupBox1: TcxGroupBox
      Left = 207
      Top = 120
      Caption = #1048#1079#1086#1087#1088#1077#1089#1089#1080#1103
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 5
      Height = 81
      Width = 185
      object cxLabel7: TcxLabel
        Left = 11
        Top = 24
        Caption = #1044#1072#1074#1083#1077#1085#1080#1077':'
        Style.TextColor = clBlack
        Style.TextStyle = []
      end
      object cxLabel8: TcxLabel
        Left = 11
        Top = 49
        Caption = #1042#1088#1077#1084#1103':'
        Style.TextColor = clBlack
        Style.TextStyle = []
      end
      object lcbIP: TcxLookupComboBox
        Left = 77
        Top = 22
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
        Properties.ListSource = dsIzo_Press
        Properties.PostPopupValueOnTab = True
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 2
        Width = 93
      end
      object lcbIT: TcxLookupComboBox
        Left = 77
        Top = 47
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
        Properties.ListSource = dsIzo_Time
        Properties.PostPopupValueOnTab = True
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 3
        Width = 93
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 398
      Top = 120
      Caption = #1044#1077#1082#1086#1084#1087#1088#1077#1089#1089#1080#1103
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 6
      Height = 81
      Width = 185
      object cxLabel9: TcxLabel
        Left = 11
        Top = 24
        Caption = #1057#1082#1086#1088#1086#1089#1090#1100':'
        Style.TextColor = clBlack
        Style.TextStyle = []
      end
      object cxLabel10: TcxLabel
        Left = 11
        Top = 49
        Caption = #1042#1088#1077#1084#1103':'
        Style.TextColor = clBlack
        Style.TextStyle = []
      end
      object lcbDS: TcxLookupComboBox
        Left = 77
        Top = 22
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
        Properties.ListSource = dsDecompr_Speed
        Properties.PostPopupValueOnTab = True
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 2
        Width = 93
      end
      object lcbDT: TcxLookupComboBox
        Left = 77
        Top = 47
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
        Properties.ListSource = dsDecompr_Time
        Properties.PostPopupValueOnTab = True
        Style.LookAndFeel.SkinName = 'Office2007Green'
        StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
        StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
        StyleHot.LookAndFeel.SkinName = 'Office2007Green'
        TabOrder = 3
        Width = 93
      end
    end
    object cxLabel11: TcxLabel
      Left = 16
      Top = 207
      Caption = #1054#1089#1086#1073#1077#1085#1085#1086#1089#1090#1080':'
      Style.TextColor = clBlack
      Style.TextStyle = []
    end
    object cxLabel12: TcxLabel
      Left = 16
      Top = 274
      Caption = #1058#1080#1087' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103':'
      Style.TextColor = clBlack
      Style.TextStyle = []
    end
    object lcbNumCamera: TcxLookupComboBox
      Left = 117
      Top = 68
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
      Properties.ListSource = dsNumCam
      Properties.PostPopupValueOnTab = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 9
      Width = 141
    end
    object beDs: TcxButtonEdit
      Left = 117
      Top = 93
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ViewStyle = vsHideCursor
      Properties.OnButtonClick = beDsPropertiesButtonClick
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 10
      Width = 466
    end
    object memRemark: TcxMemo
      Left = 117
      Top = 207
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 11
      Height = 58
      Width = 466
    end
    object lcbTypeNaz: TcxLookupComboBox
      Left = 117
      Top = 273
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
      Properties.ListSource = dsNazType
      Properties.PostPopupValueOnTab = True
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 12
      Width = 141
    end
    object lbNumJur: TcxLabel
      Left = 117
      Top = 16
      Caption = '--'
    end
    object lbPac: TcxLabel
      Left = 117
      Top = 39
      Caption = '--'
    end
    object lbMKB: TcxLabel
      Left = 571
      Top = 70
      Caption = '--'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 583
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 316
    Width = 600
    Height = 45
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 144
    ExplicitTop = 320
    ExplicitWidth = 185
    ExplicitHeight = 41
    object bOk: TcxButton
      Left = 439
      Top = 10
      Width = 75
      Height = 25
      Action = aOk
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object bCancel: TcxButton
      Left = 517
      Top = 10
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object al: TActionList
    Left = 344
    Top = 32
    object aOk: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 113
      OnExecute = aOkExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object odsNumCam: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39#39' as fc_name'
      '  from dual'
      'union all'
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      'start with fc_synonim = '#39'BAROZAL_NUMCAMERS'#39
      'connect by prior fk_id = fk_owner')
    Optimize = False
    Session = frmMain.os
    Left = 664
    Top = 24
  end
  object dsNumCam: TDataSource
    DataSet = odsNumCam
    Left = 728
    Top = 24
  end
  object odsCompr_Speed: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39#39' as fc_name'
      '  from dual'
      'union all'
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      'start with fc_synonim = '#39'BAROZAL_COMPR_SPEED'#39
      'connect by prior fk_id = fk_owner')
    Optimize = False
    Session = frmMain.os
    Left = 664
    Top = 72
  end
  object dsCompr_Speed: TDataSource
    DataSet = odsCompr_Speed
    Left = 728
    Top = 72
  end
  object odsCompr_Time: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39#39' as fc_name'
      '  from dual'
      'union all'
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      'start with fc_synonim = '#39'BAROZAL_COMPR_TIME'#39
      'connect by prior fk_id = fk_owner')
    Optimize = False
    Session = frmMain.os
    Left = 664
    Top = 120
  end
  object dsCompr_Time: TDataSource
    DataSet = odsCompr_Time
    Left = 728
    Top = 120
  end
  object odsIzo_Press: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39#39' as fc_name'
      '  from dual'
      'union all'
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      'start with fc_synonim = '#39'BAROZAL_IZO_PRESSURE'#39
      'connect by prior fk_id = fk_owner')
    Optimize = False
    Session = frmMain.os
    Left = 664
    Top = 168
  end
  object dsIzo_Press: TDataSource
    DataSet = odsIzo_Press
    Left = 728
    Top = 168
  end
  object odsIzo_Time: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39#39' as fc_name'
      '  from dual'
      'union all'
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      'start with fc_synonim = '#39'BAROZAL_IZO_TIME'#39
      'connect by prior fk_id = fk_owner')
    Optimize = False
    Session = frmMain.os
    Left = 664
    Top = 216
  end
  object dsIzo_Time: TDataSource
    DataSet = odsIzo_Time
    Left = 728
    Top = 216
  end
  object odsDecompr_Speed: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39#39' as fc_name'
      '  from dual'
      'union all'
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      'start with fc_synonim = '#39'BAROZAL_DECOMPR_SPEED'#39
      'connect by prior fk_id = fk_owner')
    Optimize = False
    Session = frmMain.os
    Left = 664
    Top = 264
  end
  object dsDecompr_Speed: TDataSource
    DataSet = odsDecompr_Speed
    Left = 728
    Top = 264
  end
  object odsDecompr_Time: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39#39' as fc_name'
      '  from dual'
      'union all'
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      'start with fc_synonim = '#39'BAROZAL_DECOMPR_TIME'#39
      'connect by prior fk_id = fk_owner')
    Optimize = False
    Session = frmMain.os
    Left = 664
    Top = 312
  end
  object dsDecompr_Time: TDataSource
    DataSet = odsDecompr_Time
    Left = 728
    Top = 312
  end
  object odsNazType: TOracleDataSet
    SQL.Strings = (
      'select -1 as fk_id, '#39#39' as fc_name'
      '  from dual'
      'union all'
      'select fk_id, fc_name'
      '  from asu.tsmid'
      ' where level <> 1'
      'start with fc_synonim = '#39'NAZN_TYPES'#39
      'connect by prior fk_id = fk_owner'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000200000005000000464B5F49440100000000000700000046435F4E41
      4D45010000000000}
    Session = frmMain.os
    Left = 664
    Top = 360
  end
  object dsNazType: TDataSource
    DataSet = odsNazType
    Left = 728
    Top = 360
  end
end
