object fmSelect_MO: TfmSelect_MO
  Left = 372
  Top = 170
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = #1042#1099#1073#1086#1088' '#1084#1072#1090'.'#1086#1090#1074'. '#1083#1080#1094#1072
  ClientHeight = 33
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  DesignSize = (
    387
    33)
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 264
    Top = 3
    Width = 55
    Height = 25
    Action = acOk
    Anchors = [akTop, akRight]
    TabOrder = 0
  end
  object cxButton2: TcxButton
    Left = 328
    Top = 3
    Width = 55
    Height = 25
    Action = acCancel
    Anchors = [akTop, akRight]
    TabOrder = 1
  end
  object cxLookupComboBox1: TcxLookupComboBox
    Left = 4
    Top = 7
    Properties.AutoSelect = False
    Properties.DropDownListStyle = lsEditList
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'MOID'
    Properties.ListColumns = <
      item
        Caption = #1060'.'#1048'.'#1054'.'
        Width = 200
        FieldName = 'FC_NAME'
      end>
    Properties.ListSource = dmMain.dsMO
    Properties.OnChange = cxLookupComboBox1PropertiesChange
    TabOrder = 2
    Width = 245
  end
  object ActionList1: TActionList
    Left = 188
    Top = 2
    object acOk: TAction
      Caption = 'OK'
      ShortCut = 13
      OnExecute = acOkExecute
    end
    object acCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 32883
      OnExecute = acCancelExecute
    end
  end
  object odsSpecMO: TOracleDataSet
    SQL.Strings = (
      'select '
      '  max(m.fc_name) as fc_mo, max(sp.fc_name) as fc_spec'
      'from'
      '  login.tsotr s, '
      '  asu.ts_sprav sp,'
      '  med.tmo m'
      'where m.moid = :moid and'
      '      s.FK_SPRAVID = sp.fk_id and'
      '      m.fk_sotrid = s.fk_id')
    Optimize = False
    Variables.Data = {0300000001000000050000003A4D4F4944030000000000000000000000}
    Session = dmMain.os
    Left = 80
  end
end
