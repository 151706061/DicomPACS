unit dmMain;

interface

uses
  SysUtils, Classes, DB, OracleData,
  // frxDSet,
  // frxDBSet,
   Oracle, frxClass, frxDBSet;

type
  TfdmMain = class(TDataModule)
    odsOstByMonth: TOracleDataSet;
    odsTSMINI: TOracleDataSet;
    odsPrihDocs: TOracleDataSet;
    odsServerDate: TOracleDataSet;
    odsNacenkaUcenka: TOracleDataSet;
    odsRashDocs: TOracleDataSet;
    odsRashTreb: TOracleDataSet;
    odsGroupMo: TOracleDataSet;
    dsGroupMo: TDataSource;
    os: TOracleSession;
    frDBRashTreb: TfrxDBDataset;
    frDBRashDocs: TfrxDBDataset;
    frDBNacenkaUcenka: TfrxDBDataset;
    frDBPrihDocs: TfrxDBDataset;
    frDBOstByMonth: TfrxDBDataset;
    odsPrihDocs_GR_LF: TOracleDataSet;
    odsOstByMonth_GR_LF: TOracleDataSet;
    odsRashDocs_GR_LF: TOracleDataSet;
    frDBPrihDocs_GR_LF: TfrxDBDataset;
    frDBstByMonth_GR_LF: TfrxDBDataset;
    frDBRashDocs_GR_LF: TfrxDBDataset;
    frxDBOstByMonth_TM: TfrxDBDataset;
    odsOstByMonth_TM: TOracleDataSet;
    odsPrihDocs_TM: TOracleDataSet;
    frxDBPrihDocs_TM: TfrxDBDataset;
    odsRashDocs_TM: TOracleDataSet;
    frxDBRashDocs_TM: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fdmMain: TfdmMain;

implementation

{$R *.dfm}

end.
