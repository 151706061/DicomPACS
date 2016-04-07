unit uTLINK_IMPNAKL;

interface
const
  // коды наших таблиц Table Code Our
  TCO_TPOSTAV               =  1;
  TCO_TMEDIC                =  2;
  TCO_TEI                   =  3;
  TCO_TPRODCERT             =  4;
  TCO_TFARMGR               =  5;
  TCO_TUCHGR                =  6;
  TCO_TMO_GROUP             =  7;
  TCO_TDOCS                 =  8;
  TCO_TDPC                  =  9;
  TCO_TKART                 = 10;
  TCO_TFINSOURCE            = 11;
  TCO_TPAYCOND              = 12;
  TCO_TGROUP_LF             = 13;          

  // коды ихних таблиц Table Code Their (всмысле поставщиков)
  TCT_TPOSTAV               =  1;
  TCT_TMEDIC                =  2;
  TCT_TEI                   =  3;
  TCT_TPROD                 =  4;
  TCT_TCERT                 =  5;

  TCT_EKAT_PHARMGR          =  6;
  TCT_EKAT_TypeOfReg        =  7;
  TCT_EKAT_Customers_Dept   =  8;
  TCT_EKAT_Suppliers        =  9;
  TCT_EKAT_Edizm            = 10;
  TCT_EKAT_Medication       = 11;
  TCT_EKAT_StoreIn          = 12;
  TCT_EKAT_StoreInSub       = 13;
  TCT_EKAT_StoreOutDebts    = 14;
  TCT_EKAT_StoreOutSub      = 15;
  TCT_EKAT_StoreOutCust     = 16;
  TCT_EKAT_FINSOURCE        = 17;
  TCT_EKAT_PAYMENTCOND      = 18;
  TCT_EKAT_GROUPS           = 19;


  // ѕоставщики (статичные ID) Static Postavsh'ik Code только отрицательные !!!
  SPC_EKATERINBURG = -1;

implementation

end.
