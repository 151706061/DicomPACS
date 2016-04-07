object PortListener: TPortListener
  OldCreateOrder = False
  DisplayName = 'PortListener'
  OnExecute = ServiceExecute
  Left = 387
  Top = 146
  Height = 459
  Width = 626
  object os: TOracleSession
    DesignConnection = True
    Left = 376
    Top = 128
  end
  object HL7Listener1: THL7Listener
    OnError = HL7Listener1Error
    OnMsgReceived = HL7Listener1MsgReceived
    LogEnabled = False
    Left = 264
    Top = 64
  end
  object odsInfo: TOracleDataSet
    SQL.Strings = (
      'select fc_value '
      '  from asu.tsmini '
      ' where fc_key = '#39'LOOKINSIDE_HL7PORT_SEND'#39)
    Optimize = False
    Cursor = crSQLWait
    Session = os
    Left = 304
    Top = 216
  end
  object oqUpdate: TOracleQuery
    SQL.Strings = (
      'update asu.txrayguid'
      '   set fk_risguid = :pfk_risguid'
      ' where fk_nazid = :pfk_nazid')
    Session = os
    Optimize = False
    Variables.Data = {
      03000000020000000C0000003A50464B5F524953475549440500000000000000
      000000000A0000003A50464B5F4E415A4944030000000000000000000000}
    Left = 304
    Top = 264
  end
  object oqUnbind: TOracleQuery
    SQL.Strings = (
      'update asu.txrayguid'
      '   set fk_risguid = null'
      ' where fk_nazid = :pfk_nazid')
    Session = os
    Optimize = False
    Variables.Data = {
      03000000010000000A0000003A50464B5F4E415A494403000000000000000000
      0000}
    Left = 304
    Top = 352
  end
  object oqBind: TOracleQuery
    SQL.Strings = (
      'update asu.txrayguid'
      '   set fk_risguid = :pfk_risguid'
      ' where fk_nazid = :pfk_nazid')
    Session = os
    Optimize = False
    Variables.Data = {
      03000000020000000A0000003A50464B5F4E415A494403000000000000000000
      00000C0000003A50464B5F52495347554944050000000000000000000000}
    Left = 304
    Top = 312
  end
  object oqNaz: TOracleQuery
    SQL.Strings = (
      'update asu.tnazis'
      '   set fk_resultid = :pfk_resultid'
      ' where fk_id = :pfk_nazid')
    Session = os
    Optimize = False
    Variables.Data = {
      03000000020000000A0000003A50464B5F4E415A494403000000000000000000
      00000D0000003A50464B5F524553554C544944030000000000000000000000}
    Left = 368
    Top = 312
  end
end
