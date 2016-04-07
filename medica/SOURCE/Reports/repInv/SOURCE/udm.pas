unit udm;

interface

uses
  oraclemonitor, SysUtils, Classes, Oracle, frxClass, frxExportXLS, frxDBSet, DB,
  OracleData, frxDCtrl,frxCustomDBRTTI, frxRich;

type
  Tdm = class(TDataModule)
    repInvMat: TfrxReport;
    odsSlVedTar: TOracleDataSet;
    odsOpisFR: TOracleDataSet;
    odsOLToxic: TOracleDataSet;
    odsOLSpirt: TOracleDataSet;
    dsOLSpirt: TfrxDBDataset;
    dsOLToxic: TfrxDBDataset;
    dsOpisFR: TfrxDBDataset;
    dsSlVed1: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    os: TOracleSession;
    frxInv: TfrxReport;
    odsOstByParties: TOracleDataSet;
    frxdsOstByParties: TfrxDBDataset;
    odsOstByMed: TOracleDataSet;
    frxdsOstByMed: TfrxDBDataset;
    OracleQuery1: TOracleQuery;
    odsOstByMedGroups: TOracleDataSet;
    frxDBdsOstByMedGroups: TfrxDBDataset;
    frxRichObject1: TfrxRichObject;
    oqINS_Tinv_opis_group: TOracleQuery;
    odsTinv_opis_group: TOracleDataSet;
    frxdsTinv_opis_group: TfrxDBDataset;
    frxInvOld: TfrxReport;
    odsRaznInv: TOracleDataSet;
    frxDBdsRaznInv: TfrxDBDataset;
    function frxInvUserFunction(const MethodName: String;
      var Params: Variant): Variant;
    procedure frxInvGetValue(const VarName: String; var Value: Variant);
    procedure frxInvClosePreview(Sender: TObject);
  private
    { Private declarations }
    function FLOAT_NUMBER_TO_WORDS(aSource : Double; aRod : integer = 1; aWordFor1 : string = ''; aWordFor234 : string=''; aWordFor567890_1x : string = ''): string;
    function INT_NUMBER_TO_WORDS(aSource: Integer; aRod: integer; aWordFor1, aWordFor234, aWordFor567890_1x: string): string;
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation
uses uGlobalConst;
{$R *.dfm}

function Tdm.FLOAT_NUMBER_TO_WORDS(aSource: Double; aRod: integer;
  aWordFor1, aWordFor234, aWordFor567890_1x: string): string;
var
  oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(Self);
  oq.Session := os;
  oq.DeclareAndSet('aSource', otFloat, aSource);
  oq.DeclareAndSet('aRod', otInteger, aRod);
  oq.DeclareAndSet('aWordFor1', otString, aWordFor1);
  oq.DeclareAndSet('aWordFor234', otString, aWordFor234);
  oq.DeclareAndSet('aWordFor567890_1x', otString, aWordFor567890_1x);
  oq.DeclareAndSet('aRes', otString, '');
  oq.SQL.Text := 'begin'#13#10' :aRes := ASU.FLOAT_NUMBER_TO_WORDS(:aSource, :aRod, :aWordFor1, :aWordFor234, :aWordFor567890_1x);'#13#10'end;';
  oq.Execute;
  Result := oq.GetVariable('aRes')
end;

function Tdm.INT_NUMBER_TO_WORDS(aSource: Integer; aRod: integer; aWordFor1, aWordFor234, aWordFor567890_1x: string): string;
var
  oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(Self);
  oq.Session := os;
  oq.DeclareAndSet('aSource', otFloat, aSource);
  oq.DeclareAndSet('aRod', otInteger, aRod);
  oq.DeclareAndSet('aWordFor1', otString, aWordFor1);
  oq.DeclareAndSet('aWordFor234', otString, aWordFor234);
  oq.DeclareAndSet('aWordFor567890_1x', otString, aWordFor567890_1x);
  oq.DeclareAndSet('aRes', otString, '');
  oq.SQL.Text := 'begin'#13#10' :aRes := ASU.INT_NUMBER_TO_WORDS(:aSource, :aRod, :aWordFor1, :aWordFor234, :aWordFor567890_1x);'#13#10'end;';
  oq.Execute;
  Result := oq.GetVariable('aRes')
end;

function Tdm.frxInvUserFunction(const MethodName: String;
  var Params: Variant): Variant;
begin
  if UpperCase(MethodName) = 'INT_NUMBER_TO_WORDS' then
		Result := FLOAT_NUMBER_TO_WORDS(Params[0], Params[1], Params[2], Params[3], Params[4]);


  if UpperCase(MethodName) = 'FLOAT_NUMBER_TO_WORDS' then
		Result := FLOAT_NUMBER_TO_WORDS(Params[0], 0, 'целое', 'целых', 'целых');

  if UpperCase(MethodName) = 'INSERT_TINV_OPIS_GROUP' then
  begin
    oqINS_Tinv_opis_group.SetVariable('pline1', Params[0]);
    oqINS_Tinv_opis_group.SetVariable('pline2', Params[1]);
    oqINS_Tinv_opis_group.SetVariable('pkol_by_page', Params[2]);
    oqINS_Tinv_opis_group.SetVariable('psumm_by_page', Params[3]);
    oqINS_Tinv_opis_group.Execute;
  end;

  if UpperCase(MethodName) = 'OPEN_TINV_OPIS_GROUP' then
  begin
    odsTinv_opis_group.Close;
    odsTinv_opis_group.Open;
  end;
end;

procedure Tdm.frxInvClosePreview(Sender: TObject);
begin
  os.Rollback;
end;

procedure Tdm.frxInvGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'MEDOTRADE_SIGN' then Value := ReadMedotradeSign;
end;

end.
