object frmSetPeriodOsm: TfrmSetPeriodOsm
  Left = 542
  Top = 253
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100
  ClientHeight = 100
  ClientWidth = 273
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
    Width = 267
    Height = 46
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 16
      Top = 14
      Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100':'
    end
    object cxPeriod: TcxLookupComboBox
      Left = 109
      Top = 13
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'FK_ID'
      Properties.ListColumns = <
        item
          FieldName = 'FC_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsPeriod
      Style.LookAndFeel.SkinName = 'Office2007Green'
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Green'
      StyleFocused.LookAndFeel.SkinName = 'Office2007Green'
      StyleHot.LookAndFeel.SkinName = 'Office2007Green'
      TabOrder = 1
      Width = 145
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 52
    Width = 267
    Height = 45
    Margins.Top = 0
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = -24
    ExplicitTop = 55
    ExplicitWidth = 185
    ExplicitHeight = 41
    object cxButton1: TcxButton
      Left = 101
      Top = 10
      Width = 75
      Height = 25
      Action = aOK
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2007Green'
    end
    object cxButton2: TcxButton
      Left = 179
      Top = 10
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 1
      LookAndFeel.SkinName = 'Office2007Green'
    end
  end
  object odsPeriod: TOracleDataSet
    SQL.Strings = (
      'SELECT FK_ID, FC_NAME, FN_ORDER, FC_SYNONIM '
      '  FROM ASU.TSMID'
      
        ' WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM ' +
        '= '#39'XRAY_PERIOD_OSMOTROV'#39')'
      '   AND FL_SHOWPRINT = 1'
      '   AND FL_DEL = 0'
      'ORDER BY FN_ORDER')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000400000005000000464B5F49440100000000000700000046435F4E41
      4D4501000000000008000000464E5F4F524445520100000000000A0000004643
      5F53594E4F4E494D010000000000}
    Session = frmMain.os
    Left = 25
    Top = 43
  end
  object dsPeriod: TDataSource
    DataSet = odsPeriod
    Left = 57
    Top = 43
  end
  object al: TActionList
    Left = 19
    Top = 11
    object aOK: TAction
      Caption = 'OK'
      ShortCut = 113
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
