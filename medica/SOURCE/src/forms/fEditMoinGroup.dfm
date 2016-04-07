object frmEditMoinGroup: TfrmEditMoinGroup
  Left = 434
  Top = 461
  BorderIcons = [biSystemMenu]
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
  ClientHeight = 145
  ClientWidth = 218
  Color = clBtnFace
  Constraints.MinHeight = 172
  Constraints.MinWidth = 226
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 218
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 212
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 205
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 60
      Caption = 'ToolBar1'
      Images = dmMain.ilMain
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton2: TToolButton
        Left = 0
        Top = 0
        Action = acSave
      end
      object ToolButton5: TToolButton
        Left = 60
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 68
        Top = 0
        Action = acCancel
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 218
    Height = 105
    Align = alClient
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    DesignSize = (
      218
      105)
    object lblMO: TLabel
      Left = 8
      Top = 8
      Width = 148
      Height = 13
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1100#1085#1086'-'#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081
    end
    object Label1: TLabel
      Left = 8
      Top = 56
      Width = 35
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072
    end
    object lcbMO: TcxLookupComboBox
      Left = 8
      Top = 24
      Anchors = [akLeft, akTop, akRight]
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'MOID'
      Properties.ListColumns = <
        item
          Caption = #1052#1054#1051
          Width = 150
          FieldName = 'FC_NAME'
        end
        item
          Caption = 'MOID'
          Width = 50
          FieldName = 'MOID'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsMO
      EditValue = '0'
      TabOrder = 0
      Width = 175
    end
    object lcbGroup: TcxLookupComboBox
      Left = 8
      Top = 72
      Anchors = [akLeft, akTop, akRight]
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'GROUPID'
      Properties.ListColumns = <
        item
          Caption = #1043#1088#1091#1087#1087#1072' '#1052#1054
          Width = 150
          FieldName = 'FC_GROUP'
        end
        item
          Caption = 'GROUPID'
          Width = 50
          FieldName = 'GROUPID'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsGroup
      EditValue = '0'
      TabOrder = 1
      Width = 175
    end
    object bMO: TcxButton
      Left = 190
      Top = 26
      Width = 18
      Height = 18
      Action = acMO
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      LookAndFeel.Kind = lfFlat
    end
    object bGroup: TcxButton
      Left = 190
      Top = 74
      Width = 18
      Height = 18
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1052#1054' '#1075#1088#1091#1087#1087
      Action = acGroup
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      LookAndFeel.Kind = lfFlat
    end
  end
  object al: TActionList
    Images = dmMain.ilMain
    Left = 80
    Top = 304
    object acSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1080' '#1079#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      ImageIndex = 9
      ShortCut = 113
      OnExecute = acSaveExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' '#1073#1077#1079' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acCancelExecute
    end
    object acMO: TAction
      Caption = '...'
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1052#1054
      OnExecute = acMOExecute
    end
    object acGroup: TAction
      Caption = '...'
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1075#1088#1091#1087#1087' '#1052#1054
      OnExecute = acGroupExecute
    end
  end
  object odsMO: TOracleDataSet
    SQL.Strings = (
      'SELECT T.MOID,'
      '       T.FC_NAME'
      '       FROM MED.TMO T'
      'where T.FL_DEL = 0'
      'order by UPPER(T.FC_NAME)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0400000002000000040000004D4F49440100000000000700000046435F4E414D
      45010000000000}
    Session = dmMain.os
    Left = 238
    Top = 57
  end
  object dsMO: TDataSource
    DataSet = odsMO
    Left = 80
    Top = 210
  end
  object odsGroup: TOracleDataSet
    SQL.Strings = (
      'SELECT T.GROUPID,'
      '       T.FC_GROUP'
      '       FROM MED.TMO_GROUP T'
      #9'WHERE T.FL_DEL = 0'
      'ORDER BY UPPER(T.FC_GROUP)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000047524F555049440100000000000800000046435F
      47524F5550010000000000}
    Session = dmMain.os
    Left = 177
    Top = 59
  end
  object dsGroup: TDataSource
    DataSet = odsGroup
    Left = 80
    Top = 258
  end
  object oq: TOracleQuery
    SQL.Strings = (
      'DECLARE nTmp NUMBER;'
      'BEGIN'
      'SELECT COUNT(T.FK_ID)'
      '       INTO nTmp'
      '       FROM MED.TMO_IN_GROUP T'
      '       WHERE T.FK_MO = :pfk_mo'
      '       AND T.FK_GROUP = :pfk_group;'
      'IF nvl(nTmp, 0) = 0 THEN       '
      ' IF :pfk_id = 0 THEN'
      '  INSERT INTO MED.TMO_IN_GROUP'
      '   (FK_MO, FK_GROUP)'
      '  VALUES'
      '   (:pfk_mo, :pfk_group)'
      '  RETURNING FK_ID INTO :pfk_id;'
      ' ELSE'
      '  UPDATE MED.TMO_IN_GROUP'
      '  SET  FK_MO = :pfk_mo,'
      '       FK_GROUP = :pfk_group'
      '  WHERE FK_ID = :pfk_id;     '
      ' END IF;'
      'END IF; '
      'END;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {
      0300000003000000070000003A50464B5F4D4F0300000000000000000000000A
      0000003A50464B5F47524F5550030000000000000000000000070000003A5046
      4B5F4944030000000000000000000000}
    Left = 153
    Top = 5
  end
  object odsCheck: TOracleDataSet
    SQL.Strings = (
      'SELECT T.FK_ID'
      '       FROM MED.TMO_IN_GROUP T'
      '       WHERE T.FK_MO = :pfk_mo'
      '       AND T.FK_GROUP = :pfk_group'
      #9'AND T.FL_DEL = 0')
    Optimize = False
    Variables.Data = {
      0300000002000000070000003A50464B5F4D4F0300000000000000000000000A
      0000003A50464B5F47524F5550030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {040000000100000005000000464B5F4944010000000000}
    Session = dmMain.os
    Left = 32
    Top = 81
  end
  object odsData: TOracleDataSet
    SQL.Strings = (
      'SELECT T.FK_ID,'
      '       T.FK_MO,'
      '       T.FK_GROUP'
      '       FROM MED.TMO_IN_GROUP T'
      '       WHERE T.FK_ID = :pfk_id')
    Optimize = False
    Variables.Data = {0300000001000000070000003A50464B5F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000300000005000000464B5F494401000000000005000000464B5F4D4F
      01000000000008000000464B5F47524F5550010000000000}
    Session = dmMain.os
    Left = 128
    Top = 87
  end
  object oqSetCurMOGroup: TOracleQuery
    SQL.Strings = (
      'DECLARE'
      '  nTmp NUMBER;'
      '  GROUP_ID NUMBER;'
      'BEGIN'
      ''
      '  SELECT COUNT(T.FK_ID), MIN(T.FK_GROUP)'
      '    INTO nTmp, GROUP_ID'
      '    FROM MED.TMO_IN_GROUP T'
      '   WHERE T.FK_MO = :pfk_mo'
      '     AND T.FL_DEL = 0;'
      ''
      '  IF nvl(nTmp, 0) = 1 THEN       '
      
        '    UPDATE MED.TMO SET fk_curmogroupid = GROUP_ID WHERE TMO.moid' +
        ' = :pfk_mo;'
      '  END IF; '
      'END;')
    Session = dmMain.os
    Optimize = False
    Variables.Data = {0300000001000000070000003A50464B5F4D4F030000000000000000000000}
    Left = 221
    Top = 5
  end
end
