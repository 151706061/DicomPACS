unit fdmMoveEdit;

interface

uses
  SysUtils, Classes, Oracle, DB, OracleData, fdmMain;

type
  TdmMoveEdit = class(TDataModule)
    oqUpdateFK_VID_POST: TOracleQuery;
    oqUpdateFC_KONTRAKT: TOracleQuery;
    oqDoSetDocToTreb: TOracleQuery;
    oqCheckNaznByDoc: TOracleQuery;
    oqUpdateFC_SCHET_FAKTURA: TOracleQuery;
    odsTDOCS: TOracleDataSet;
    odsTTREB: TOracleDataSet;
    odsTrebByDoc: TOracleDataSet;
    odsKonractsList: TOracleDataSet;
    dsKonractsList: TDataSource;
    dsSchetFaktura: TDataSource;
    odsSchetFaktura: TOracleDataSet;
    odsMO_GroupFrom: TOracleDataSet;
    odsMO_GroupTo: TOracleDataSet;
    odsPostav: TOracleDataSet;
    odsMO_TO: TOracleDataSet;
    odsMO_FROM: TOracleDataSet;
    dsMO_GroupFrom: TDataSource;
    dsMO_GroupTo: TDataSource;
    dsPostav: TDataSource;
    dsMO_FROM: TDataSource;
    dsMO_TO: TDataSource;
    oqKartClear: TOracleQuery;
    oqKartEnteredOst: TOracleQuery;
    odsCheckSpisMedicOnGiven: TOracleDataSet;
    oqSetKartFinSource: TOracleQuery;
    odsProfil: TOracleDataSet;
    dsProfil: TDataSource;
    odsComment: TOracleDataSet;
    dsComment: TDataSource;
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  dmMoveEdit: TdmMoveEdit;

implementation

{$R *.dfm}

{ TdmMoveEdit }

end.
