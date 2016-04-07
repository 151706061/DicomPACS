object dmTheirTables: TdmTheirTables
  OldCreateOrder = False
  Height = 405
  Width = 433
  object ADOquEI: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from'
      '('
      
        'select ei.key, ei.name from EdIzm ei, StoreInSub i where ei.key ' +
        '= i.EdIzm'
      ''
      'UNION'
      ''
      
        'select ei.key, ei.name from EdIzm ei, StoreOutSub o where ei.key' +
        ' = o.EdIzmKey'
      ')'
      'order by name')
    Left = 48
    Top = 14
  end
  object ADOquFARMGR: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select key, name from PharmGr'
      'order by name')
    Left = 46
    Top = 62
  end
  object ADOquMEDIC: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select a.*, ei.Number from('
      
        'SELECT Medication.Key, Medication.Name, Medication.Name_Latin, M' +
        'edication.List, Medication.PharmGr, Medication.FarmSubGr, Medica' +
        'tion.Group, Medication.TORKey as UchGrID,'
      
        '(select min(Edizm) from StoreInSub where Medication.key = StoreI' +
        'nSub.MedicationKey) as fk_edizm'
      'FROM Medication ) a, Edizm ei'
      'where  a.fk_edizm is not null'
      '  and a.fk_edizm = ei.key')
    Left = 46
    Top = 118
  end
  object ADOquPOSTAV: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Suppliers'
      'order by name')
    Left = 142
    Top = 67
  end
  object ADOquUCHGR: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select key, name from TypeOfReg'
      'order by name')
    Left = 138
    Top = 15
  end
  object ADOquMO_GROUP: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select key, name from Customers'
      'where Dept = True'
      'order by name')
    Left = 144
    Top = 121
  end
  object ADOquDOCS_IN: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT StoreIn.Key, StoreIn.Date, StoreIn.InvoiceN, StoreIn.Date' +
        'OfPayment, StoreIn.Supplier, StoreIn.PayCondKey, StoreIn.FinSour' +
        'ceKey, StoreIn.Tender'
      'FROM StoreIn;')
    Left = 46
    Top = 172
  end
  object ADOquDOCS_OUT_DEBTS: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT StoreOutDepts.Key, StoreOutDepts.DeptKey, StoreOutDepts.D' +
        'ate, StoreOutDepts.InvoiceN, StoreOutDepts.MOL, StoreOutDepts.MO' +
        'L2'
      'FROM StoreOutDepts')
    Left = 48
    Top = 237
  end
  object ADOquDOCS_OUT_CUST: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT StoreOutCustomers.Key, StoreOutCustomers.CustomerKey, Sto' +
        'reOutCustomers.Date, StoreOutCustomers.InvoiceN, StoreOutCustome' +
        'rs.MOL, StoreOutCustomers.MOL2'
      ', Customers.name as FC_CustName'
      'FROM StoreOutCustomers, Customers'
      'where StoreOutCustomers.CustomerKey = Customers.Key;')
    Left = 56
    Top = 295
  end
  object ADOquDOC_OUT_CUST_ITEMS: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pStoreOutCustKey'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT StoreOutSub.Key, StoreOutSub.StoreInSubKey, StoreOutSub.E' +
        'dizmKey, StoreOutSub.Quantity, StoreOutSub.Price, StoreOutSub.St' +
        'oreOutCustKey, StoreOutSub.StoreOutDeptKey, StoreOutSub.Medicati' +
        'onKey, StoreOutSub.Series, StoreOutSub.DateDeadline, StoreOutSub' +
        '.Certificate, StoreOutSub.FinSourceKey, StoreOutSub.QntRrq, Stor' +
        'eOutSub.TBD'
      ',Medication.name as FC_MEDIC_NAME'
      'FROM StoreOutSub, Medication'
      'where '
      '  StoreOutSub.StoreOutCustKey = :pStoreOutCustKey'
      'and Medication.Key =   StoreOutSub.MedicationKey')
    Left = 154
    Top = 311
  end
  object ADOquDOC_OUT_DEBTS_ITEMS: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pStoreOutDeptKey'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '0'
      end>
    SQL.Strings = (
      
        'SELECT StoreOutSub.Key, StoreOutSub.StoreInSubKey, StoreOutSub.E' +
        'dizmKey, '
      
        'StoreOutSub.Quantity, StoreOutSub.Price, StoreOutSub.StoreOutCus' +
        'tKey, '
      
        'StoreOutSub.StoreOutDeptKey, StoreOutSub.MedicationKey, StoreOut' +
        'Sub.Series, '
      
        'StoreOutSub.DateDeadline, StoreOutSub.Certificate, StoreOutSub.F' +
        'inSourceKey, '
      'StoreOutSub.QntRrq, StoreOutSub.TBD'
      ',Medication.name as FC_MEDIC_NAME'
      ''
      'FROM StoreOutSub, Medication'
      'where '
      '  StoreOutSub.StoreOutDeptKey = :pStoreOutDeptKey'
      'and Medication.Key =   StoreOutSub.MedicationKey')
    Left = 158
    Top = 255
  end
  object ADOquDOC_IN_ITEMS: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'pStoreInKey'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '0'
      end>
    SQL.Strings = (
      
        'SELECT StoreInSub.Key, StoreInSub.StoreInKey, StoreInSub.Medicat' +
        'ionKey, StoreInSub.Series, StoreInSub.DateDeadline, StoreInSub.C' +
        'ertificate, StoreInSub.Quantity, StoreInSub.Price,  Medication.n' +
        'ame as FC_MEDIC_NAME'
      'FROM StoreInSub, Medication'
      'where StoreInSub.StoreInKey = :pStoreInKey'
      'and Medication.Key =  StoreInSub.MedicationKey')
    Left = 150
    Top = 180
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=Provi' +
      'sor_data.mdb;Mode=Share Deny None;Persist Security Info=False;Je' +
      't OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:' +
      'Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database ' +
      'Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Glo' +
      'bal Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet O' +
      'LEDB:Create System Database=False;Jet OLEDB:Encrypt Database=Fal' +
      'se;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compac' +
      't Without Replica Repair=False;Jet OLEDB:SFP=False;'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 252
    Top = 16
  end
  object ADOquFinSource: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from FinSource'
      'order by name')
    Left = 258
    Top = 73
  end
  object ADOquPaymentCond: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from PaymentCond'
      'order by name')
    Left = 260
    Top = 133
  end
  object ADOquGroups: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select key, name from Groups'
      'order by name')
    Left = 258
    Top = 191
  end
end
