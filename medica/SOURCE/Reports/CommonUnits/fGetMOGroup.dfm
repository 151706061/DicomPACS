object frmGetMOGroup: TfrmGetMOGroup
  Left = 491
  Top = 345
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = #1043#1088#1091#1087#1087#1072' '#1052#1054
  ClientHeight = 23
  ClientWidth = 398
  Color = clBtnFace
  Constraints.MaxHeight = 50
  Constraints.MaxWidth = 406
  Constraints.MinHeight = 50
  Constraints.MinWidth = 406
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    398
    23)
  PixelsPerInch = 96
  TextHeight = 13
  object lcbMO_GROUP: TcxLookupComboBox
    Left = 0
    Top = 2
    Anchors = [akLeft, akTop, akRight]
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'GROUPID'
    Properties.ListColumns = <
      item
        Caption = #1043#1088#1091#1087#1087#1072' '#1052#1054
        FieldName = 'FC_GROUP'
      end>
    Properties.ListSource = dsGroupMo
    Properties.OnCloseUp = lcbMO_GROUPPropertiesCloseUp
    TabOrder = 0
    Width = 397
  end
  object dsGroupMo: TDataSource
    Left = 116
    Top = 65515
  end
end
