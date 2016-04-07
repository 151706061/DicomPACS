object frmGetPeriod: TfrmGetPeriod
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1046#1091#1088#1085#1072#1083' '#1091#1095#1077#1090#1072' '#1086#1087#1077#1088#1072#1094#1080#1081
  ClientHeight = 212
  ClientWidth = 354
  Color = clBtnFace
  Constraints.MaxHeight = 240
  Constraints.MaxWidth = 360
  Constraints.MinHeight = 240
  Constraints.MinWidth = 360
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 354
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 348
      end>
    Images = ilImages
    ParentShowHint = False
    ShowHint = True
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 341
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 46
      Caption = 'ToolBar1'
      Images = ilImages
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object btnSave: TToolButton
        Left = 0
        Top = 0
        Action = aSave
      end
      object btnCancel: TToolButton
        Left = 46
        Top = 0
        Action = aCancel
        AutoSize = True
      end
    end
  end
  object panPeriod: TPanel
    Left = 0
    Top = 40
    Width = 354
    Height = 106
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object lcMain: TdxLayoutControl
      Left = 2
      Top = 2
      Width = 350
      Height = 102
      Align = alClient
      TabOrder = 0
      TabStop = False
      DesignSize = (
        350
        102)
      object rbByMonth: TRadioButton
        Left = 10
        Top = 10
        Width = 113
        Height = 17
        Action = aCheck
        Caption = #1047#1072' '#1084#1077#1089#1103#1094
        TabOrder = 0
      end
      object rbPeriod: TRadioButton
        Left = 10
        Top = 38
        Width = 113
        Height = 17
        Action = aCheck
        Caption = #1047#1072' '#1087#1077#1088#1080#1086#1076
        TabOrder = 3
      end
      object cbMonth: TComboBox
        Left = 129
        Top = 10
        Width = 155
        Height = 21
        AutoCloseUp = True
        Style = csDropDownList
        DropDownCount = 12
        ItemHeight = 13
        TabOrder = 1
      end
      object edtYear: TSpinEdit
        Left = 290
        Top = 10
        Width = 50
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        EditorEnabled = False
        MaxLength = 4
        MaxValue = 3000
        MinValue = 1900
        TabOrder = 2
        Value = 1900
      end
      object cbPeriodFromM: TComboBox
        Left = 149
        Top = 38
        Width = 135
        Height = 21
        AutoCloseUp = True
        Style = csDropDownList
        DropDownCount = 12
        ItemHeight = 13
        TabOrder = 4
      end
      object edtPeriodFromY: TSpinEdit
        Left = 290
        Top = 38
        Width = 50
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        EditorEnabled = False
        MaxLength = 4
        MaxValue = 3000
        MinValue = 1900
        TabOrder = 5
        Value = 1900
      end
      object cbPeriodToM: TComboBox
        Left = 149
        Top = 66
        Width = 135
        Height = 21
        AutoCloseUp = True
        Style = csDropDownList
        DropDownCount = 12
        ItemHeight = 13
        TabOrder = 6
      end
      object edtPeriodToY: TSpinEdit
        Left = 290
        Top = 66
        Width = 50
        Height = 22
        Anchors = [akLeft, akTop, akBottom]
        EditorEnabled = False
        MaxLength = 4
        MaxValue = 3000
        MinValue = 1900
        TabOrder = 7
        Value = 1900
      end
      object lg_Root: TdxLayoutGroup
        ShowCaption = False
        Hidden = True
        ShowBorder = False
        object lcgMonth: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          object lcirbByMonth: TdxLayoutItem
            Caption = 'RadioButton2'
            ShowCaption = False
            Control = rbByMonth
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcgMonthEdit: TdxLayoutGroup
            Caption = 'MonthGroup'
            ShowCaption = False
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcicbMonth: TdxLayoutItem
              Caption = 'ComboBox1'
              ShowCaption = False
              Control = cbMonth
              ControlOptions.ShowBorder = False
            end
            object lciedtYear: TdxLayoutItem
              Caption = 'SpinEdit1'
              ShowCaption = False
              Control = edtYear
              ControlOptions.ShowBorder = False
            end
          end
        end
        object lcgPeriod: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          object lcirbPeriod: TdxLayoutItem
            Caption = 'RadioButton3'
            ShowCaption = False
            Control = rbPeriod
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcgPeriodEdit: TdxLayoutGroup
            Caption = 'PeriodGroup'
            ShowCaption = False
            ShowBorder = False
            object lcMainGroup3: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcicbPeriodFromM: TdxLayoutItem
                Caption = 'c '
                Control = cbPeriodFromM
                ControlOptions.ShowBorder = False
              end
              object lciedtPeriodFromY: TdxLayoutItem
                Control = edtPeriodFromY
                ControlOptions.ShowBorder = False
              end
            end
            object lcMainGroup2: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcicbPeriodToM: TdxLayoutItem
                Caption = #1087#1086' '
                Control = cbPeriodToM
                ControlOptions.ShowBorder = False
              end
              object lciedtPeriodToY: TdxLayoutItem
                Control = edtPeriodToY
                ControlOptions.ShowBorder = False
              end
            end
          end
        end
      end
    end
  end
  object panMoGroup: TPanel
    Left = 0
    Top = 181
    Width = 354
    Height = 31
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      354
      31)
    object lMO_GROUP: TLabel
      Left = 9
      Top = 6
      Width = 107
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090'. '#1086#1090#1074'. '#1083#1080#1094':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lcbMO_GROUP: TDBLookupComboBox
      Left = 131
      Top = 6
      Width = 210
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'GROUPID'
      ListField = 'FC_GROUP'
      ListSource = dsGroupMo
      TabOrder = 0
      OnCloseUp = lcbCloseUp
    end
  end
  object panMedic: TPanel
    Left = 0
    Top = 146
    Width = 354
    Height = 35
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    DesignSize = (
      354
      35)
    object lMedic: TLabel
      Left = 9
      Top = 10
      Width = 24
      Height = 13
      Caption = #1058#1052#1062
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lcbMedic: TDBLookupComboBox
      Left = 131
      Top = 6
      Width = 210
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'MEDICID'
      ListField = 'FC_MEDIC'
      ListSource = dsMedic
      TabOrder = 0
      OnCloseUp = lcbCloseUp
    end
  end
  object ilImages: TImageList
    Left = 112
    Bitmap = {
      494C010102000400380010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B0000007B00
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000080000000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B000000007B00007B00
      00007B0000007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000007B00000000000000
      00007B7B7B00000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      00007B0000007B0000007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000007B0000007B000000
      00007B7B7B007B7B7B0000000000000000000000000000007B00000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      0000007B0000007B00007B0000007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000007B0000007B000000
      7B0000000000000000007B7B7B000000000000007B0000007B0000007B000000
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      0000007B0000007B0000007B00007B0000007B7B7B007B7B7B00000000000000
      000000000000000000000000000000000000000000000000FF0000007B000000
      7B0000007B00000000000000000000007B0000007B0000007B0000007B000000
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B0000007B
      000000FF0000007B0000007B0000007B00007B0000007B7B7B007B7B7B000000
      00000000000000000000000000000000000000000000000000000000FF000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      000000FF000000FF0000007B0000007B0000007B00007B0000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000007B0000007B0000007B0000007B0000007B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B000000000000FF0000007B0000007B0000007B00007B0000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      00000000FF0000007B0000007B0000007B0000007B007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B000000000000FF000000FF0000007B0000007B0000007B00007B00
      00007B7B7B000000000000000000000000000000000000000000000000000000
      00000000FF0000007B0000007B0000007B0000007B00000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063FF000000FF0000007B
      00000000000000000000000000000000000000FF0000007B0000007B00007B00
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      FF0000007B0000007B0000007B0000007B0000007B0000007B00000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000A5FF0000007B0000007B
      00007B0000007B7B7B007B7B7B00000000000000000000000000000000000000
      FF0000007B0000007B0000007B000000FF000000FF0000007B00000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF0000007B
      0000007B00007B0000007B7B7B007B7B7B0000000000000000000000FF000000
      7B0000007B00000000007B7B7B0000000000000000000000FF0000007B000000
      7B00000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      0000007B0000007B00007B0000007B7B7B00000000000000FF0000007B000000
      7B00000000007B7B7B00000000000000000000000000000000000000FF000000
      7B0000007B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF0000007B00007B0000007B7B7B0000000000000000000000FF000000
      7B00848484000000000000000000000000000000000000000000000000000000
      FF0000007B0000007B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000007B00007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00E7FFFFFF00000000C3FF8FFF00000000
      81FF078F0000000000FF038700000000007F810700000000003F800F00000000
      001FC01F00000000001FE03F00000000040FF03F000000000407F01F00000000
      8F03E00F00000000FF01E00700000000FFC0C18300000000FFE083C300000000
      FFF0C7E100000000FFF8FFF30000000000000000000000000000000000000000
      000000000000}
  end
  object alActions: TActionList
    Images = ilImages
    OnUpdate = alActionsUpdate
    Left = 144
    object aSave: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 0
      ShortCut = 13
      OnExecute = aSaveExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 1
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object acExcelExport: TAction
      Caption = #1042' Excel'
      Hint = #1069#1082#1087#1086#1088#1090' '#1074' Excel'
    end
    object aCheck: TAction
      Caption = 'aCheck'
      OnExecute = aCheckExecute
    end
  end
  object os: TOracleSession
    LogonUsername = 'ASU'
    LogonPassword = 'ASU'
    LogonDatabase = 'asu'
    Left = 84
  end
  object odsGroupMo: TOracleDataSet
    SQL.Strings = (
      'SELECT * from'
      '(SELECT groupid, fc_group, fl_del, 0 as FN_ORDER'
      
        'FROM med.tmo_group WHERE (fl_del = 0) and (UPPER(fc_group) like ' +
        #39'%'#1040#1055#1058#1045#1050#1040'%'#39')'
      'UNION'
      'SELECT groupid, fc_group, fl_del, 1 as FN_ORDER'
      
        'FROM med.tmo_group WHERE fl_del = 0 and (not (UPPER(fc_group) li' +
        'ke '#39'%'#1040#1055#1058#1045#1050#1040'%'#39'))'
      ')'
      'ORDER BY FN_ORDER, UPPER(fc_group) '
      '/*'
      'select * from vchmo'
      'order by fc_name'
      '*/')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000047524F555049440100000000000800000046435F
      47524F555001000000000006000000464C5F44454C010000000000}
    Session = os
    Left = 58
    Top = 143
  end
  object dsGroupMo: TDataSource
    DataSet = odsGroupMo
    Left = 88
    Top = 149
  end
  object oqInitMO: TOracleQuery
    SQL.Strings = (
      'begin'
      '  SELECT NVL(MAX(MOID),-1) into :nMOID FROM'
      
        '   (SELECT MOID FROM MED.TMO T WHERE T.FK_SOTRID IN (SELECT logi' +
        'n.GET_SOTRID(:pAppSotrID) FROM DUAL));'
      
        '   SELECT MAX(fk_curmogroupid) into :nMO_GROUP FROM med.tmo wher' +
        'e moid = :nMOID;'
      ''
      '  med.pkg_medses.set_curmo(:nMOID);'
      '  med.pkg_medses.set_curmo_group( :nMO_GROUP );'
      '  med.pkg_medses.ResetDatePeriod;'
      ''
      
        '  select MAX(m.FK_SKLAD_ID), NVL(MAX(m.fl_treb),0), MAX(M.FC_NAM' +
        'E) into :PFK_SKLAD_ID, :PFL_Provizor, :PFC_NAME from med.tmo m w' +
        'here m.MOID = :nMOID;'
      '  '
      '  if :PFK_SKLAD_ID is null then'
      
        '    select NVL(MAX(mg.FK_SKLAD_ID),-1) into :PFK_SKLAD_ID from m' +
        'ed.tmo_group mg where mg.GROUPID = :nMO_GROUP;'
      '  end if;'
      '  :PFK_SKLAD_ID := NVL(:PFK_SKLAD_ID,-1);'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      03000000060000000B0000003A50415050534F54524944030000000000000000
      000000060000003A4E4D4F494403000000040000000C010000000000000A0000
      003A4E4D4F5F47524F55500300000004000000FFFFFFFF000000000D0000003A
      50464B5F534B4C41445F4944030000000400000001000000000000000D000000
      3A50464C5F50524F56495A4F5203000000040000000000000000000000090000
      003A5046435F4E414D45050000000000000000000000}
    Left = 172
  end
  object odsMedic: TOracleDataSet
    SQL.Strings = (
      'SELECT M.MEDICID,'
      '  M.FC_NAME AS FC_MEDIC,'
      '  E.FC_NAME AS FC_EDIZM,'
      '  M.fn_mass,'
      '  MASS_E.FC_SHORTNAME as FC_MASS_EDIZM'
      '--  ,MT.FC_NAME AS FC_MEDICTYPE'
      'FROM MED.V$TMEDIC M, MED.TEI E, '
      '     MED.TMASSUNITS MASS_E--, MED.TMEDICTYPE MT --, TPAYTYPE P'
      ''
      'WHERE M.EIID = E.EIID(+)'
      '--  AND M.FK_TYPE = MT.FK_ID(+)'
      '  AND M.FL_VISIBLE = 1'
      '  and M.fk_massunits = MASS_E.FK_ID(+)'
      ''
      'ORDER BY LOWER(M.FC_NAME)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0400000004000000070000004D4544494349440100000000000800000046435F
      4D454449430100000000000800000046435F4544495A4D0100000000000C0000
      0046435F4D4544494354595045010000000000}
    Session = os
    Top = 143
  end
  object dsMedic: TDataSource
    DataSet = odsMedic
    Left = 28
    Top = 145
  end
  object frxRep: TfrxReport
    Version = '4.9.46'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41661.435085925900000000
    ReportOptions.LastChange = 41661.590264513900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRepGetValue
    Left = 320
    Datasets = <
      item
        DataSet = frxdsMain
        DataSetName = 'frxdsMain'
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
        Height = 309.921460000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo4: TfrxMemoView
          Left = 39.685065000000000000
          Top = 147.401670000000000000
          Width = 967.559680000000000000
          Height = 71.811070000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8211#1057#1107#1057#1026#1056#1029#1056#176#1056#187
            
              #1057#1107#1057#8225#1056#181#1057#8218#1056#176' '#1056#1109#1056#1111#1056#181#1057#1026#1056#176#1057#8224#1056#1105#1056#8470', '#1057#1027#1056#1030#1057#1039#1056#183#1056#176#1056#1029#1056#1029#1057#8249#1057#8230' '#1057#1027' '#1056#1109#1056#177#1057#1026#1056#176#1057#8240#1056#181#1056 +
              #1029#1056#1105#1056#181#1056#1112' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1057#8230' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030
            #1056#1169#1056#187#1057#1039' '#1056#1112#1056#181#1056#1169#1056#1105#1057#8224#1056#1105#1056#1029#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1056#1111#1057#1026#1056#1105#1056#1112#1056#181#1056#1029#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Top = 18.897650000000000000
          Width = 491.338900000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[S_NAME]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Top = 60.472480000000000000
          Width = 491.338900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[MOGROUP_NAME]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Top = 79.370130000000000000
          Width = 491.338900000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '('#1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1112#1056#181#1056#1169#1056#1105#1057#8224#1056#1105#1056#1029#1057#1027#1056#1108#1056#1109#1056#8470' '#1056#1109#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056 +
              #176#1057#8224#1056#1105#1056#1105', '#1056#164'.'#1056#152'.'#1056#1115'. '#1056#1105#1056#1029#1056#1169#1056#1105#1056#1030#1056#1105#1056#1169#1057#1107#1056#176#1056#187#1057#1034#1056#1029#1056#1109#1056#1110#1056#1109' '#1056#1111#1057#1026#1056#181#1056#1169#1056#1111#1057#1026#1056#1105 +
              #1056#1029#1056#1105#1056#1112#1056#176#1057#8218#1056#181#1056#187#1057#1039', '#1056#1105#1056#1112#1056#181#1057#1035#1057#8240#1056#1105#1057#8230' '#1056#187#1056#1105#1057#8224#1056#181#1056#1029#1056#183#1056#1105#1056#1105' '#1056#1029#1056#176' '#1056#1112#1056#181#1056#1169#1056#1105#1057 +
              #8224#1056#1105#1056#1029#1057#1027#1056#1108#1057#1107#1057#1035' '#1056#1169#1056#181#1057#1039#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 226.771800000000000000
          Top = 230.551330000000000000
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[MEDIC_NAME]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 226.771800000000000000
          Top = 264.567100000000000000
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 1.500000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[DOZ] [LF] [UNIT]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 226.771800000000000000
          Top = 249.448980000000000000
          Width = 604.724800000000000000
          Height = 15.118120000000000000
          GroupIndex = 1
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '('#1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#187#1056#181#1056#1108#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#1110#1056#1109' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057 +
              #8218#1056#1030#1056#176' '#1056#1169#1056#187#1057#1039' '#1056#1112#1056#181#1056#1169#1056#1105#1057#8224#1056#1105#1056#1029#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1056#1111#1057#1026#1056#1105#1056#1112#1056#181#1056#1029#1056#181#1056#1029#1056#1105#1057#1039')')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 226.771800000000000000
          Top = 283.464750000000000000
          Width = 604.724800000000000000
          Height = 15.118120000000000000
          GroupIndex = 1
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '('#1056#1169#1056#1109#1056#183#1056#1105#1057#1026#1056#1109#1056#1030#1056#1108#1056#176', '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#176#1057#1039' '#1057#8222#1056#1109#1057#1026#1056#1112#1056#176', '#1056#181#1056#1169 +
              #1056#1105#1056#1029#1056#1105#1057#8224#1056#176' '#1056#1105#1056#183#1056#1112#1056#181#1057#1026#1056#181#1056#1029#1056#1105#1057#1039')')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 495.118430000000000000
        Width = 1046.929810000000000000
        DataSet = frxdsMain
        DataSetName = 'frxdsMain'
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'Month'
          DataSet = frxdsMain
          DataSetName = 'frxdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxdsMain."Month"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 79.370130000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'RemainOn1Day'
          DataSet = frxdsMain
          DataSetName = 'frxdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxdsMain."RemainOn1Day"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 154.960730000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'PrihFrom'
          DataSet = frxdsMain
          DataSetName = 'frxdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxdsMain."PrihFrom"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 268.346630000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'PrihDoc'
          DataSet = frxdsMain
          DataSetName = 'frxdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMain."PrihDoc"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 347.716760000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'PrihCnt'
          DataSet = frxdsMain
          DataSetName = 'frxdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxdsMain."PrihCnt"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 419.527830000000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'PrihWithRemain'
          DataSet = frxdsMain
          DataSetName = 'frxdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxdsMain."PrihWithRemain"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 495.118430000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'RashDate'
          DataSet = frxdsMain
          DataSetName = 'frxdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMain."RashDate"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 566.929499999999900000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'RashDoc'
          DataSet = frxdsMain
          DataSetName = 'frxdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxdsMain."RashDoc"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 680.315400000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'RashCnt'
          DataSet = frxdsMain
          DataSetName = 'frxdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxdsMain."RashCnt"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 755.906000000000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'RashSum'
          DataSet = frxdsMain
          DataSetName = 'frxdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxdsMain."RashSum"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 831.496600000000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'RemainByRepOnEnd'
          DataSet = frxdsMain
          DataSetName = 'frxdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxdsMain."RemainByRepOnEnd"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 982.677800000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataSet = frxdsMain
          DataSetName = 'frxdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 907.087200000000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'RemainByRepOnEnd'
          DataSet = frxdsMain
          DataSetName = 'frxdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxdsMain."RemainByRepOnEnd"]')
          ParentFont = False
        end
      end
      object Memo3: TfrxMemoView
        Align = baRight
        Left = 661.417750000000100000
        Width = 385.512060000000000000
        Height = 139.842610000000000000
        ShowHint = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.UTF8 = (
          #1056#1119#1057#1026#1056#1105#1056#187#1056#1109#1056#182#1056#181#1056#1029#1056#1105#1056#181' '#1074#8222#8211' 3'
          
            #1056#1108' '#1056#1119#1057#1026#1056#176#1056#1030#1056#1105#1056#187#1056#176#1056#1112' '#1057#1026#1056#181#1056#1110#1056#1105#1057#1027#1057#8218#1057#1026#1056#176#1057#8224#1056#1105#1056#1105' '#1056#1109#1056#1111#1056#181#1057#1026#1056#176#1057#8224#1056#1105#1056#8470', '#1057#1027#1056 +
            #1030#1057#1039#1056#183#1056#176#1056#1029#1056#1029#1057#8249#1057#8230' '#1057#1027' '#1056#1109#1056#177#1057#1026#1056#176#1057#8240#1056#181#1056#1029#1056#1105#1056#181#1056#1112
          
            #1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1057#8230' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030' '#1056#1169#1056#187#1057#1039' '#1056#1112#1056#181#1056#1169#1056#1105#1057#8224#1056#1105#1056#1029#1057 +
            #1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1056#1111#1057#1026#1056#1105#1056#1112#1056#181#1056#1029#1056#181#1056#1029#1056#1105#1057#1039','
          
            #1056#1030#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1056#1029#1057#8249#1057#8230' '#1056#1030' '#1056#1111#1056#181#1057#1026#1056#181#1057#8225#1056#181#1056#1029#1057#1034' '#1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057 +
            #8249#1057#8230' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030' '#1056#1169#1056#187#1057#1039' '#1056#1112#1056#181#1056#1169#1056#1105#1057#8224#1056#1105#1056#1029#1057#1027#1056#1108#1056#1109#1056#1110#1056#1109' '
          
            #1056#1111#1057#1026#1056#1105#1056#1112#1056#181#1056#1029#1056#181#1056#1029#1056#1105#1057#1039', '#1056#1111#1056#1109#1056#1169#1056#187#1056#181#1056#182#1056#176#1057#8240#1056#1105#1057#8230' '#1056#1111#1057#1026#1056#181#1056#1169#1056#1112#1056#181#1057#8218#1056#1029#1056#1109'-'#1056#1108 +
            #1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#1112#1057#1107' '#1057#1107#1057#8225#1056#181#1057#8218#1057#1107','
          
            #1056#1030' '#1057#1027#1056#1111#1056#181#1057#8224#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1057#8230' '#1056#182#1057#1107#1057#1026#1056#1029#1056#176#1056#187#1056#176#1057#8230' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176' '#1056#1109#1056#1111#1056#181#1057#1026#1056#176 +
            #1057#8224#1056#1105#1056#8470', '#1057#1027#1056#1030#1057#1039#1056#183#1056#176#1056#1029#1056#1029#1057#8249#1057#8230' '#1057#1027' '#1056#1109#1056#177#1057#1026#1056#176#1057#8240#1056#181#1056#1029#1056#1105#1056#181#1056#1112
          
            #1056#187#1056#181#1056#1108#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1057#8230' '#1057#1027#1057#1026#1056#181#1056#1169#1057#1027#1057#8218#1056#1030' '#1056#1169#1056#187#1057#1039' '#1056#1112#1056#181#1056#1169#1056#1105#1057#8224#1056#1105#1056#1029#1057 +
            #1027#1056#1108#1056#1109#1056#1110#1056#1109' '#1056#1111#1057#1026#1056#1105#1056#1112#1056#181#1056#1029#1056#181#1056#1029#1056#1105#1057#1039','
          
            #1057#1107#1057#8218#1056#1030#1056#181#1057#1026#1056#182#1056#1169#1056#181#1056#1029#1056#1029#1057#8249#1056#1112' '#1056#1111#1057#1026#1056#1105#1056#1108#1056#176#1056#183#1056#1109#1056#1112' '#1056#1114#1056#1105#1056#1029#1056#1105#1057#1027#1057#8218#1056#181#1057#1026#1057#1027#1057#8218#1056#1030 +
            #1056#176' '#1056#183#1056#1169#1057#1026#1056#176#1056#1030#1056#1109#1056#1109#1057#8230#1057#1026#1056#176#1056#1029#1056#181#1056#1029#1056#1105#1057#1039
          
            #1056#160#1056#1109#1057#1027#1057#1027#1056#1105#1056#8470#1057#1027#1056#1108#1056#1109#1056#8470' '#1056#164#1056#181#1056#1169#1056#181#1057#1026#1056#176#1057#8224#1056#1105#1056#1105' '#1056#1109#1057#8218' 17.06.2013 '#1074#8222#8211' 378'#1056 +
            #1029)
        ParentFont = False
      end
      object Header1: TfrxHeader
        Height = 83.149660000000000000
        Top = 389.291590000000000000
        Width = 1046.929810000000000000
        object Memo7: TfrxMemoView
          Width = 79.370130000000000000
          Height = 83.149660000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#181#1057#1027#1057#1039#1057#8224)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 154.960730000000000000
          Width = 264.567100000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 79.370130000000000000
          Width = 75.590551180000000000
          Height = 83.149660000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' '#1056#1029#1056#176' 1-'#1056#181' '#1057#8225#1056#1105#1057#1027#1056#187#1056#1109' '#1056#1112#1056#181#1057#1027#1057#1039#1057#8224#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 154.960730000000000000
          Top = 34.015769999999970000
          Width = 113.385900000000000000
          Height = 49.133890000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1057#8218' '#1056#1108#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#181#1056#1029#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 268.346630000000000000
          Top = 34.015769999999970000
          Width = 79.370130000000000000
          Height = 49.133890000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1105' '#1056#1169#1056#176#1057#8218#1056#176' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 347.716760000000000000
          Top = 34.015769999999970000
          Width = 71.811070000000000000
          Height = 49.133890000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 419.527830000000000000
          Width = 75.590600000000000000
          Height = 83.149660000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#183#1056#176' '#1056#1112#1056#181#1057#1027#1057#1039#1057#8224' '#1056#1111#1056#1109' '#1056#1111#1057#1026#1056#1105#1057#8230#1056#1109#1056#1169#1057#1107' '#1057#1027' '#1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1108#1056#1109 +
              #1056#1112)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 495.118430000000000000
          Width = 260.787570000000000000
          Height = 34.015770000000010000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8230#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 680.315400000000000000
          Top = 34.015769999999970000
          Width = 75.590551180000000000
          Height = 49.133890000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 495.118430000000000000
          Top = 34.015769999999970000
          Width = 71.811070000000000000
          Height = 49.133890000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1030#1057#8249#1056#1169#1056#176#1057#8225#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 566.929500000000000000
          Top = 34.015769999999970000
          Width = 113.385900000000000000
          Height = 49.133890000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1112#1056#181#1056#1169'. '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176' ('#1056#164'.'#1056#152'.'#1056#1115' '#1056#177#1056#1109#1056#187#1057#1034#1056#1029#1056#1109#1056#1110#1056#1109' )')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 755.906000000000000000
          Width = 75.590600000000000000
          Height = 83.149660000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1057#1026#1056#176#1057#1027#1057#8230#1056#1109#1056#1169' '#1056#183#1056#176' '#1056#1112#1056#181#1057#1027#1057#1039#1057#8224)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 831.496600000000000000
          Width = 75.590551180000000000
          Height = 83.149660000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1115#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' '#1056#1111#1056#1109' '#1056#182#1057#1107#1057#1026#1056#1029#1056#176#1056#187#1057#1107' '#1057#1107#1057#8225#1056#181#1057#8218#1056#176' '#1056#1029#1056#176' '#1056#1108#1056#1109#1056#1029#1056#181#1057#8224' '#1056#1112 +
              #1056#181#1057#1027#1057#1039#1057#8224#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 907.087200000000000000
          Width = 75.590551180000000000
          Height = 83.149660000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1108#1057#8218#1056#1105#1057#8225#1056#181#1057#1027'-'
            #1056#1108#1056#1105#1056#8470' '#1056#1109#1057#1027#1057#8218#1056#176#1057#8218#1056#1109#1056#1108' '#1056#1029#1056#176' '#1056#1108#1056#1109#1056#1029#1056#181#1057#8224' '#1056#1112#1056#181#1057#1027#1057#1039#1057#8224#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 982.677800000000000000
          Width = 64.252010000000000000
          Height = 83.149660000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034' '#1057#1107#1056#1111#1056#1109#1056#187#1056#1029#1056#1109#1056#1112#1056#1109'-'#1057#8225#1056#181#1056#1029#1056#1029#1056#1109#1056#1110#1056#1109' '#1056#187#1056#1105#1057#8224#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object mdMain: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 256
    object mdMainMonth: TStringField
      FieldName = 'Month'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object mdMainRemainOn1DayOfMonth: TFloatField
      DisplayWidth = 20
      FieldName = 'RemainOn1Day'
      ProviderFlags = [pfInWhere]
    end
    object mdMainPrihFrom: TStringField
      DisplayWidth = 300
      FieldName = 'PrihFrom'
      Size = 300
    end
    object mdMainPrihDoc: TStringField
      DisplayWidth = 100
      FieldName = 'PrihDoc'
      Size = 100
    end
    object mdMainPrihCnt: TFloatField
      DisplayWidth = 20
      FieldName = 'PrihCnt'
    end
    object mdMainPrihWithRemain: TFloatField
      DisplayWidth = 20
      FieldName = 'PrihWithRemain'
    end
    object mdMainRashDate: TDateField
      DisplayWidth = 20
      FieldName = 'RashDate'
    end
    object mdMainRashDoc: TStringField
      DisplayWidth = 100
      FieldName = 'RashDoc'
      Size = 100
    end
    object mdMainRashCnt: TFloatField
      DisplayWidth = 20
      FieldName = 'RashCnt'
    end
    object mdMainRashSum: TStringField
      FieldName = 'RashSum'
    end
    object mdMainRemainByRepOnEnd: TFloatField
      DisplayWidth = 20
      FieldName = 'RemainByRepOnEnd'
    end
  end
  object odsRep1: TOracleDataSet
    SQL.Strings = (
      'SELECT M.*,'
      '       NVL(OST.FN_KOLOSTBEGIN,0) as FN_KOLOSTBEGIN,'
      '       NVL(FN_SUMOSTBEGIN,0) as FN_SUMOSTBEGIN,'
      '       NVL(FN_KOLOSTEND,0) AS FN_KOLOSTEND,'
      '       NVL(FN_SUMOSTEND,0) AS FN_SUMOSTEND       '
      'FROM'
      '(SELECT '
      '  M.medicid,'
      '  M.FC_NAME,'
      '  E.FC_NAME as FC_EDIZM'
      'FROM MED.TMEDIC M, MED.TEI E  '
      'WHERE M.MEDICID = :MEDICID'
      '  AND M.EIID = E.EIID'
      ') M,'
      '  '
      '(SELECT     '
      '  B.MEDICID,'
      '  SUM(B.FN_KOLOSTBEGIN) AS FN_KOLOSTBEGIN, '
      '  SUM(B.FN_SUMOSTBEGIN) as FN_SUMOSTBEGIN,'
      '  SUM(B.FN_KOLOSTEND) AS FN_KOLOSTEND,'
      '  SUM(B.FN_SUMOSTEND) AS FN_SUMOSTEND'
      'FROM ('
      'SELECT'
      'A.MEDICID,'
      'SUM(A.FN_KOLOSTBEGIN) AS FN_KOLOSTBEGIN, '
      'SUM(A.FN_KOLOSTBEGIN*A.FN_PRICE) as FN_SUMOSTBEGIN,'
      'SUM(A.FN_KOLOSTEND) AS FN_KOLOSTEND,'
      'SUM(A.FN_KOLOSTEND*A.FN_PRICE) AS FN_SUMOSTEND'
      'FROM ('
      'SELECT '
      'K.MEDICID,'
      'K.FN_PRICE,'
      
        'CASE WHEN TRUNC(D.fd_data) < TRUNC(:DATE1) THEN C.FN_KOL*D.mnoj ' +
        'ELSE 0 END AS FN_KOLOSTBEGIN,'
      
        'CASE WHEN TRUNC(D.fd_data) <= TRUNC(:DATE2) THEN C.FN_KOL*D.mnoj' +
        ' ELSE 0 END AS FN_KOLOSTEND'
      ''
      'FROM (SELECT TDOCS.*, '
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUPID ) ' +
        'as mnoj             '
      '      FROM MED.TDOCS '
      '      WHERE TDOCS.FL_EDIT = 0'
      '        AND (not tdocs.FP_VIDMOVE in (4,5))'
      
        '        AND TRUNC(TDOCS.fd_data) BETWEEN TO_DATE('#39'01.01.2000'#39', '#39 +
        'DD.MM.YYYY'#39') AND TRUNC(:DATE2)'
      
        '        AND :MOGROUPID in (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGRO' +
        'UPID_FROM) '
      '      ) D,'
      '      MED.TDPC C, MED.TKART K'
      'WHERE D.DPID = C.DPID'
      '  AND C.KARTID = K.KARTID'
      '  AND K.MEDICID = :MEDICID'
      '  ) A'
      'GROUP BY MEDICID, FN_PRICE) B '
      'WHERE (B.FN_KOLOSTBEGIN <> 0) OR (B.FN_KOLOSTEND <> 0)'
      'GROUP BY MEDICID'
      ') OST'
      ''
      'WHERE M.MEDICID = OST.MEDICID(+)')
    Optimize = False
    Variables.Data = {
      0300000004000000060000003A44415445320C00000000000000000000000800
      00003A4D454449434944030000000000000000000000060000003A4441544531
      0C00000000000000000000000A0000003A4D4F47524F55504944030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000800000008000000464E5F50524943450100000000000A000000464E
      5F4B4F4C505249480100000000000A000000464E5F53554D5052494801000000
      00000A000000464E5F4B4F4C524153480100000000000A000000464E5F53554D
      524153480100000000000C000000464E5F4B4F4C4F5354454E44010000000000
      0C000000464E5F53554D4F5354454E440100000000000800000046435F47524F
      5550010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 11
    Top = 36
  end
  object frxdsMain: TfrxDBDataset
    UserName = 'frxdsMain'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RecId=RecId'
      'Month=Month'
      'RemainOn1Day=RemainOn1Day'
      'PrihFrom=PrihFrom'
      'PrihDoc=PrihDoc'
      'PrihCnt=PrihCnt'
      'PrihWithRemain=PrihWithRemain'
      'RashDate=RashDate'
      'RashDoc=RashDoc'
      'RashCnt=RashCnt'
      'RashSum=RashSum'
      'RemainByRepOnEnd=RemainByRepOnEnd')
    DataSet = mdMain
    BCDToCurrency = False
    Left = 288
  end
  object odsRep2: TOracleDataSet
    SQL.Strings = (
      'SELECT TRUNC(D.fd_data) as fd_data, '
      '       D.FC_COMMENT,'
      '       FS.FC_NAME as FC_FINSOURCE,'
      
        '       med.GET_DECODEDOCVIDMOVE(d.fp_vidmove)||'#39' '#8470' '#39'||D.fc_doc||' +
        #39' '#1086#1090' '#39'||to_char(D.fd_invoice,'#39'dd.mm.yyyy'#39') AS fc_docmix,'
      
        '       MED.PKGTDOCS.GET_DOC_SOURCE(D.fp_vid, D.fp_vidmove, D.fk_' +
        'mogroupid_FROM, D.postavid) as FC_NAME,'
      #9'D.fc_doc,'
      '       D.FC_KONTRAKT,'
      
        '--DECODE(D.fp_vidmove, 9, MED.PKG_MEDSES.GET_MOGROUP_NAME(D.FK_M' +
        'OGROUPID_TO)||'#39' - '#1074#1074#1086#1076' '#1086#1089#1090#1072#1090#1082#1086#1074#39', P.fc_name) as FC_NAME,'
      ''
      
        ' K.fc_serial, TRUNC(K.fd_goden) as fd_goden, DPC.fn_kol, K.fn_pr' +
        'ice, (DPC.fn_kol * K.fn_price) as FN_Summa'
      'FROM (SELECT TDOCS.*, '
      
        '             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID,' +
        ' TDOCS.FP_VIDMOVE,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_from,'
      
        '                                                   TDOCS.fk_mogr' +
        'oupid_to,'
      
        '                                                   :MOGROUPID ) ' +
        'as mnoj             '
      '      FROM MED.TDOCS '
      '      WHERE TDOCS.FL_EDIT = 0'
      '        AND (not tdocs.FP_VIDMOVE in (4,5))'
      
        '        AND TRUNC(TDOCS.fd_data) BETWEEN TRUNC(:DATE1) AND TRUNC' +
        '(:DATE2)'
      '        AND :MOGROUPID = TDOCS.FK_MOGROUPID_TO'
      '      ) D,'
      ''
      'MED.TPOSTAV P, MED.TDPC DPC, MED.TKART K, MED.TFINSOURCE FS'
      'WHERE D.mnoj > 0 -- '#1087#1088#1080#1093#1086#1076', '#1086#1076#1085#1072#1082#1086
      '  AND D.postavid = P.postavid(+)'
      '  AND DPC.dpid = D.dpid'
      '  AND k.kartid = DPC.KARTID'
      '  AND k.medicid = :MEDICID'
      '  AND k.FK_FINSOURCE_ID = FS.FK_ID(+)'
      'ORDER BY D.fd_data, K.fn_party_num')
    Optimize = False
    Variables.Data = {
      0300000004000000060000003A44415445320C00000000000000000000000800
      00003A4D454449434944030000000000000000000000060000003A4441544531
      0C00000000000000000000000A0000003A4D4F47524F55504944030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000008000000464E5F5052494345010000000000070000004644
      5F444154410100000000000700000046435F4E414D4501000000000009000000
      46435F53455249414C0100000000000800000046445F474F44454E0100000000
      0006000000464E5F4B4F4C01000000000008000000464E5F53554D4D41010000
      000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 51
    Top = 40
  end
  object odsRep3: TOracleDataSet
    SQL.Strings = (
      'select d.DPID,'
      '       d.FD_DATE_OTP,'
      '       d.FC_DOC,'
      '       d.FC_DOCMIX,'
      '       d.FC_SPISANIEDESCR,'
      '       sum(dpc.FN_KOL) as FN_KOL'
      '  from (select TDOCS.DPID,'
      
        '               MED.GET_DECODEDOCVIDMOVE(TDOCS.FP_VIDMOVE) || '#39' '#8470 +
        ' '#39' || TDOCS.FC_DOC || '#39' '#1086#1090' '#39' || TO_CHAR(TDOCS.FD_INVOICE, '#39'dd.mm' +
        '.yyyy'#39') as FC_DOCMIX,'
      '               case'
      '                 when TDOCS.FP_VID = 3 then'
      
        '                    MED.PKGTDOCS.GET_SPISANIE_DETAIL_DESCR(TDOCS' +
        '.FP_VID, TDOCS.FP_VIDMOVE, TDOCS.FN_SPISANIEVID, TDOCS.FK_MOGROU' +
        'PID_TO)'
      '                 else null'
      '               end as FC_SPISANIEDESCR,'
      '               TRUNC(TDOCS.FD_DATA) as FD_DATE_OTP,'
      '               trim(TDOCS.FC_DOC) as FC_DOC'
      '          from MED.TDOCS'
      '         where TDOCS.FK_MOGROUPID_FROM = :MOGROUPID'
      '           and (not TDOCS.FP_VIDMOVE in (4, 5))'
      
        '           and TDOCS.FP_VID in (2, 3) -- '#1087#1077#1088#1077#1076#1072#1095#1080' '#1076#1088#1091#1075#1080#1084' '#1086#1090#1076#1077#1083#1077#1085 +
        #1080#1103#1084', '#1089#1087#1080#1089#1072#1085#1080#1103
      '           and TDOCS.FP_VID <> 6 -- '#1082#1088#1086#1084#1077' '#1074#1086#1079#1074#1088#1072#1090#1086#1074' '#1074' '#1072#1087#1090#1077#1082#1091
      '           and TDOCS.FL_EDIT = 0 -- '#1090#1086#1083#1100#1082#1086' '#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      
        '           and TRUNC(TDOCS.FD_DATA) between TRUNC(:DATE1) and TR' +
        'UNC(:DATE2)) d,'
      '         MED.TDPC dpc,'
      '         MED.TKART k'
      ' where d.DPID = dpc.DPID'
      '   and k.KARTID = dpc.KARTID'
      '   and k.MEDICID = :MEDICID '
      ' group by d.DPID,'
      '       d.FD_DATE_OTP,'
      '       d.FC_DOC,'
      '       d.FC_DOCMIX,'
      '       d.FC_SPISANIEDESCR'
      ' order by d.FD_DATE_OTP,  d.FC_DOC')
    Optimize = False
    Variables.Data = {
      0300000004000000060000003A44415445320C00000000000000000000000800
      00003A4D454449434944030000000000000000000000060000003A4441544531
      0C00000000000000000000000A0000003A4D4F47524F55504944030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000004000000445049440100000000000E00000046435F4D4F47
      52544F5F4E414D450100000000000900000046435F444F434D49580100000000
      000B00000046445F444154455F4F545001000000000006000000464E5F4B4F4C
      01000000000007000000464E5F53554D4D010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 83
    Top = 40
  end
  object odsRep5: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  D.dpid,'
      '  D.fc_docmix,'
      '  D.FD_DATE_OTP,'
      '  D.fc_doc,'
      '  MG.FC_GROUP as FC_MOGRFROM_NAME,'
      
        '  SUM(DPC.fn_kol) as fn_kol, SUM(DPC.fn_kol*K.fn_price) as FN_SU' +
        'MM'
      '  '
      'FROM (SELECT TDOCS.dpid,'
      '             TDOCS.fk_mogroupid_from,'
      
        '             MED.GET_DECODEDOCVIDMOVE(TDOCS.fp_vidmove)||'#39' '#8470' '#39'||' +
        'TDOCS.fc_doc||'#39' '#1086#1090' '#39'||to_char(TRUNC(TDOCS.fd_invoice),'#39'dd.mm.yyy' +
        'y'#39') AS fc_docmix,'
      '             TRUNC(TDOCS.fd_data) as FD_DATE_OTP,'
      '             TDOCS.fc_doc             '
      '      FROM MED.TDOCS'
      '      WHERE TDOCS.fk_mogroupid_to = :MOGROUPID'
      '        AND TDOCS.fp_vid = 2'
      '        AND TDOCS.fp_vidmove = 6 -- '#1090#1086#1083#1100#1082#1086' '#1074#1086#1079#1074#1088#1072#1090#1099
      '        AND TDOCS.fl_edit = 0 -- '#1090#1086#1083#1100#1082#1086' '#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      
        '        AND TRUNC(TDOCS.fd_data) BETWEEN TRUNC(:DATE1) AND TRUNC' +
        '(:DATE2)        '
      '      ) D,'
      '     MED.TDPC DPC, MED.TKART K, MED.TMO_GROUP MG'
      'WHERE DPC.dpid = D.dpid'
      '  AND K.kartid = DPC.kartid'
      '  AND K.medicid = :MEDICID  '
      '  AND D.fk_mogroupid_FROM = MG.GROUPID(+)'
      
        'GROUP BY D.FD_DATE_OTP, MG.FC_GROUP, D.fc_docmix , D.dpid, D.fc_' +
        'doc')
    Optimize = False
    Variables.Data = {
      0300000004000000060000003A44415445320C000000070000007872011F0101
      0100000000080000003A4D4544494349440300000004000000618E0000000000
      00060000003A44415445310C0000000700000078720101010101000000000A00
      00003A4D4F47524F555049440300000004000000B901000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000600000004000000445049440100000000000900000046435F444F43
      4D49580100000000001000000046435F53504953414E49454445534352010000
      0000000B00000046445F444154455F4F545001000000000006000000464E5F4B
      4F4C01000000000007000000464E5F53554D4D010000000000}
    Cursor = crSQLWait
    CommitOnPost = False
    Session = os
    Left = 123
    Top = 40
  end
  object oqPKG_SMINI: TOracleQuery
    SQL.Strings = (
      'begin'
      '  if :pValue is null then'
      '    if :pdefault is null then :pdefault := '#39#39'; end if;'
      
        '    :pValue := asu.PKG_SMINI.readstring(:psection,:pident,:pdefa' +
        'ult);'
      '  else'
      '    asu.PKG_SMINI.WRITESTRING( :psection, :pident, :pvalue);'
      '  end if;'
      'end;')
    Session = os
    Optimize = False
    Variables.Data = {
      0300000004000000070000003A5056414C554505000000000000000000000009
      0000003A5053454354494F4E050000000000000000000000070000003A504944
      454E54050000000000000000000000090000003A5044454641554C5405000000
      0000000000000000}
    Cursor = crSQLWait
    Left = 201
    Top = 65532
  end
end
