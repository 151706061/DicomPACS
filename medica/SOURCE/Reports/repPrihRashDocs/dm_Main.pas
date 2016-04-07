unit dm_Main;

interface

uses
  SysUtils, Classes, DB, OracleData, Oracle, JvComponentBase, JvAppStorage,
  JvAppIniStorage;

type
  TdmMain = class(TDataModule)
    odsRepByDoc: TOracleDataSet;
    dsRep: TDataSource;
    os: TOracleSession;
    oqGetDateTime: TOracleQuery;
    odsTMO_GROUP: TOracleDataSet;
    dsTMO_GROUP: TDataSource;
    odsTPOSTAV: TOracleDataSet;
    dsTPOSTAV: TDataSource;
    odsRepByDocAndMedics: TOracleDataSet;
    odsRepByOst: TOracleDataSet;
    oqRepByOstInit: TOracleQuery;
    JvAppIniFileStorage1: TJvAppIniFileStorage;
    odsTMO: TOracleDataSet;
    dsTMO: TDataSource;
    procedure osAfterLogOn(Sender: TOracleSession);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetServerDateTime : TDateTime;
  end;

var
  dmMain: TdmMain;

implementation

{$R *.dfm}

{ TdmMain }

function TdmMain.GetServerDateTime: TDateTime;
begin
  oqGetDateTime.Execute;
  Result := oqGetDateTime.GetVariable(0);
end;

procedure TdmMain.osAfterLogOn(Sender: TOracleSession);
begin
  odsTMO_GROUP.Open;
  odsTPOSTAV.Open;
  odsTMO.Open;
end;

end.
