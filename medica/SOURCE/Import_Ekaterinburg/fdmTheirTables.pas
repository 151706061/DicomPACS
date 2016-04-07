unit fdmTheirTables;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmTheirTables = class(TDataModule)
    ADOquEI: TADOQuery;
    ADOquFARMGR: TADOQuery;
    ADOquMEDIC: TADOQuery;
    ADOquPOSTAV: TADOQuery;
    ADOquUCHGR: TADOQuery;
    ADOquMO_GROUP: TADOQuery;
    ADOquDOCS_IN: TADOQuery;
    ADOquDOCS_OUT_DEBTS: TADOQuery;
    ADOquDOCS_OUT_CUST: TADOQuery;
    ADOquDOC_OUT_CUST_ITEMS: TADOQuery;
    ADOquDOC_OUT_DEBTS_ITEMS: TADOQuery;
    ADOquDOC_IN_ITEMS: TADOQuery;
    ADOConnection1: TADOConnection;
    ADOquFinSource: TADOQuery;
    ADOquPaymentCond: TADOQuery;
    ADOquGroups: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTheirTables: TdmTheirTables;

implementation

{$R *.dfm}

end.
