unit DicomDatabaseLinkIBX;

interface
uses Windows, Messages, SysUtils, Variants, Classes, DB, DCM_Server, DCM_Attributes,
     IBDatabase, IBCustomDataSet, IBQuery, Forms, Uni, DB_CMN;

type
  TIBXDicomDatabaseOperator = class(TCustomDicomDatabaseOperator)
  private
    Database1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    // ‰Îˇ POSTGRES
    PGconn: TUniConnection;
    PGTrans : TUniTransaction;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function SumitSQL(ADBStr, ASQL: string; AFetchCount: Integer; UseMultiDatabase: Boolean; Params: TDicomAttribute; AClientThread: TDicomClientThread=nil): TDataSet; override;
    procedure ExecSQL(ADBStr, ASQL: string; Params: TDicomAttribute;AClientThread: TDicomClientThread=nil); override;
    procedure AddServerObject(Sender: TObject; AList: TList); override;
    procedure ExecProc(ADBStr, AStorageProc, AOutput: string; AParams: TDicomAttribute; var AResult: string); override;
    procedure GetGenID(ADatabaseName, ATableName, Fieldname: string; AutoInc: Boolean; ASetValue: Integer; var AResult: Integer); override;
    procedure GetTableFieldNames(ADBStr, ATableName: string; AStrs: TStrings); override;
    procedure GetTableNames(ADBstr: string; AStrs: TStrings); override;
    function GetDBType(ADatabaseName: string): Integer; override;
    procedure Cmn_Commit;
  end;
implementation

uses fMain, CmnUnit1, DICOM_charset, DICOM_CMN, pFIBQuery, pFIBProps, pFIBDatabase, pFIBDataSet;

procedure TIBXDicomDatabaseOperator.Cmn_Commit;
begin
  try
    if IBTransaction1.Active then IBTransaction1.Commit;
  except
    on E : Exception do
      CmnUnit1.Lg_ev('ERROR '+E.ClassName+' Cmn_Commit - Commit error raised, with message : '+E.Message);
  end;
  try
    if not IBTransaction1.Active then IBTransaction1.StartTransaction;
  except
    on E : Exception do
      CmnUnit1.Lg_ev('ERROR '+E.ClassName+' Cmn_Commit - StartTransaction error raised, with message : '+E.Message);
  end;
end;

constructor TIBXDicomDatabaseOperator.Create(AOwner : TComponent);
begin
  inherited;
  if DB_CMN.v_isPostgres then
  begin
    PGconn := DB_CMN.PgConnCrt;
    PGTrans := DB_CMN.PGTransCreate (PGconn) ;
  end else
  begin
    Database1 := TIBDatabase.Create(Self);   //
    with Database1 do
    begin
      CmnUnit1.Lg_ev('connect 2 to '+DB_CMN.sBase);
      DatabaseName := DB_CMN.sBase; //'c:\PACS\PACSDB.GDB'; // 'Localhost:' + ExtractFilePath(Application.ExeName) + 'PACSDB.GDB';
      Params.Clear;
      Params.Add('user_name=sysdba');
      Params.Add('password=masterkey');
      LoginPrompt := False;
      IdleTimer := 0;
      SQLDialect := 3;
      TraceFlags := [];
    end;

    Database1.Connected := true;

    CmnUnit1.Lg_ev('connected');

    IBTransaction1 := TIBTransaction.Create(Self);
    with IBTransaction1 do
    begin
      Active := False;
      DefaultAction:=TACommitRetaining;
      DefaultDatabase := Database1;
      AutoStopAction := saCommitRetaining; // (saNone, saRollback, saCommit, saRollbackRetaining, saCommitRetaining);
    end;
    IBTransaction1.StartTransaction;
    CmnUnit1.Lg_ev('active transaction : database '+Database1.DatabaseName);
  end;
end;

destructor TIBXDicomDatabaseOperator.Destroy;
begin
  if v_isPostgres then
  begin
    PgFree ( PGconn, PGTrans );
  end else begin
    Database1.Free;
  end;
  inherited;
end;

function TIBXDicomDatabaseOperator.SumitSQL(
                                ADBStr, ASQL: string;
                                AFetchCount: Integer;
                                UseMultiDatabase: Boolean;
                                Params: TDicomAttribute;
                                AClientThread: TDicomClientThread=nil): TDataSet;
var
  AQuery: TIBQuery;
  param1: TParam;
  das: TDicomAttributes;
  str1: string;
  da1: TDicomAttribute;
  FIBDataset : TpFIBDataset; v_UniQr : TUniQuery;
  //
  procedure prm_prp;
  var i:Integer;
  begin
    if Params <> nil then
      for i := 0 to Params.GetCount - 1 do
      begin
//        CmnUnit1.Lg_ev('       params '+inttostr(i)+'  '+Params.Attributes[i].);
        das := Params.Attributes[i];

        ds_sav(das);

        str1 := das.GetString($2809, $28);         // FieldName
        param1 := AQuery.Params.FindParam(str1);
        if param1 <> nil then
          case das.getInteger($2809, $29) of  // FunctionCode
            0:
              begin
                param1.AsString := das.GetString($2809, $23);
              end;
            1:
              begin
                da1 := das.Item[$2809, $20];
                if assigned(da1) then
                  param1.AsInteger := da1.asInteger[0]
                else
                  param1.AsInteger := 0;
              end;
            2:
              begin
                da1 := das.Item[$2809, $21];
                if assigned(da1) then
                  param1.AsFloat := da1.AsFloat[0]
                else
                  param1.AsFloat := 0;
              end;
            3:
              begin
                da1 := das.Item[$2809, $25];
                if assigned(da1) then
                  param1.AsDatetime := da1.AsDatetime[0]
                else
                  param1.AsDatetime := now;
              end;
            4:
              begin
                param1.AsMemo := das.GetString($2809, $23);
              end;
          end;
      end;
  end;
  //
begin
  if v_isPostgres then begin
    v_UniQr := TUniQuery.Create(nil);
    try
      if AClientThread=nil then begin
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
      end else begin
        v_UniQr.Connection:=AClientThread.PGconn;
        v_UniQr.Transaction:=AClientThread.PGTrans;
      end;
      v_UniQr.SQL.Text := ASQL;
      //
      prm_prp;
      //
      try // ‰Ó·‡‚ËÚ¸ Ô‡‡ÏÂÚ˚
        v_UniQr.Transaction.StartTransaction;
        v_UniQr.ExecSQL;
        if v_UniQr.Transaction.Active then
          v_UniQr.Transaction.Commit;
      except
        on e:Exception do
        begin
          v_UniQr.Transaction.Rollback;
          Lg_ev('ERROR: '+E.ClassName+' '+E.Message+' in SQL QUERY: '+ASQL);
        end;
      end;
      Result := v_UniQr;
    finally
      v_UniQr.Free;
    end;
  end else
  if (AClientThread<>nil) then
  begin
    FIBDataset    := TpFIBDataset.Create(nil);
    FIBDataSet.AutoCommit := True;
    if AClientThread=nil then begin
      FIBDataset.Database    := (AClientThread.v_ClThr_DB as TpFIBDatabase);
      FIBDataset.Transaction := (AClientThread.v_ClThr_trWrite as TpFIBTransaction);
    end else begin
      FIBDataset.Database    := DB_CMN.DB;
      FIBDataset.Transaction := DB_CMN.trWrite;
    end;
    if not FIBDataset.Transaction.Active then
          FIBDataset.Transaction.Active:=True;
    FIBDataset.SQLs.SelectSQL.Text:= ASQL;
    //
    prm_prp;
    //
    try // ‰Ó·‡‚ËÚ¸ Ô‡‡ÏÂÚ˚
      FIBDataset.Open;
      FIBDataset.First;
    except
      on e:Exception do
      begin
        Lg_ev('ERROR: '+E.ClassName+' '+E.Message+' in SQL QUERY: '+ASQL);
      end;
    end;
    Result := FIBDataset;
  end else
  begin
    Cmn_Commit;   // quant

    AQuery := TIBQuery.Create(nil);
    AQuery.Database := Database1;
    try

      AQuery.SQL.Clear;

      // ≈—À» Õ¿ƒŒ - ¬—“¿¬»“‹ ƒ–”√Œ≈ œŒÀ≈ ƒÀﬂ »ƒ≈Õ“»‘» ¿÷»»
      AQuery.SQL.Add(ASQL);

      AQuery.Prepare;

      prm_prp;

     // CmnUnit1.Lg_ev('TIBXDicomDatabaseOperator.SumitSQL: ' + lg_SQL1(AQuery,'',''));
      AQuery.Open;
      CmnUnit1.Lg_ev('TIBXDicomDatabaseOperator.SumitSQL: success...');
    except
      on e: Exception do
      begin

      //  CmnUnit1.Lg_ev('ERROR TIBXDicomDatabaseOperator.SumitSQL: ' + lg_SQL1(AQuery,E.ClassName,E.Message));

        AQuery.Close;
        FreeAndNil(AQuery);
        raise;
      end;
    end;
    Result := AQuery;
  end;
end;

procedure TIBXDicomDatabaseOperator.ExecSQL(ADBStr, ASQL: string;
  Params: TDicomAttribute;
  AClientThread: TDicomClientThread=nil);
var
  i: Integer;
  AQuery: TIBQuery;
  das: TDicomAttributes;
  da1, dd1: TDicomAttribute;
  str1: string;
  param1: TParam;
  o1: TOBStream;
begin

  Cmn_Commit;

  AQuery := TIBQuery.Create(nil);
  AQuery.Database := Database1;
  try
    AQuery.SQL.Clear;
    // ≈—À» Õ¿ƒŒ - ¬—“¿¬»“‹ ƒ–”√Œ≈ œŒÀ≈ ƒÀﬂ »ƒ≈Õ“»‘» ¿÷»»
    AQuery.SQL.Add(ASQL);

    if Params <> nil then
      for i := 0 to Params.GetCount - 1 do
      begin
        das := Params.Attributes[i];
        if assigned(das) then
        begin
          str1 := das.GetString($2809, $28);
          param1 := AQuery.Params.FindParam(str1);
          if param1 <> nil then
            case das.getInteger($2809, $29) of
              0:
                begin
                  param1.AsString := das.GetString($2809, $23);
                end;
              1:
                begin
                  da1 := das.Item[$2809, $20];
                  if assigned(da1) then
                    param1.AsInteger := da1.asInteger[0]
                  else
                    param1.AsInteger := 0;
                end;
              2:
                begin
                  da1 := das.Item[$2809, $21];
                  if assigned(da1) then
                    param1.AsFloat := da1.AsFloat[0]
                  else
                    param1.AsFloat := 0;
                end;
              3:
                begin
                  da1 := das.Item[$2809, $25];
                  if assigned(da1) then
                    param1.AsDatetime := da1.AsDatetime[0]
                  else
                    param1.AsDatetime := now;
                end;
              4:
                begin
                  param1.AsBlob := das.GetString($2809, $23);
                  //param1.AsBlob
                end;
              5:
                begin
                  dd1 := das.Item[$2809, $24];
                  if dd1.GetCount > 0 then
                  begin
                    o1 := dd1.AsOBData[0];
                    param1.SetBlobData(o1.Memory, o1.Size);
                  end;
                  //param1.AsBlob
                end;
            end;
        end;
      end;
    try
    //  CmnUnit1.Lg_ev('TIBXDicomDatabaseOperator.ExecSQL: ' + lg_SQL1(AQuery,'',''));
      AQuery.ExecSQL;
      CmnUnit1.Lg_ev('TIBXDicomDatabaseOperator.ExecSQL: success...');

      Cmn_Commit;
    except
      on e: Exception do
      begin
        if IBTransaction1.Active then IBTransaction1.Rollback;
      //  CmnUnit1.Lg_ev('ERROR TIBXDicomDatabaseOperator.ExecSQL: ' + lg_SQL1(AQuery,E.ClassName,E.Message));
      end;
    end;
  finally
    AQuery.Free;
  end;
end;

procedure TIBXDicomDatabaseOperator.AddServerObject(Sender: TObject;
  AList: TList);
begin

end;

procedure TIBXDicomDatabaseOperator.ExecProc(ADBStr, AStorageProc, AOutput: string;
  AParams: TDicomAttribute; var AResult: string);
begin
  CmnUnit1.Lg_ev('TIBXDicomDatabaseOperator.ExecProc');
end;

procedure TIBXDicomDatabaseOperator.GetGenID(ADatabaseName,
  ATableName, Fieldname: string; AutoInc: Boolean; ASetValue: Integer;
  var AResult: Integer);
begin
  CmnUnit1.Lg_ev('TIBXDicomDatabaseOperator.GetGenID');
end;

procedure TIBXDicomDatabaseOperator.GetTableFieldNames(ADBStr, ATableName: string; AStrs:
  TStrings);
begin
  CmnUnit1.Lg_ev('TIBXDicomDatabaseOperator.GetTableFieldNames');
  Database1.GetFieldNames(ATableName, AStrs);
end;

procedure TIBXDicomDatabaseOperator.GetTableNames(ADBstr: string; AStrs: TStrings);
begin
  CmnUnit1.Lg_ev('TIBXDicomDatabaseOperator.GetTableNames');
  Database1.GetTableNames(AStrs);
end;

function TIBXDicomDatabaseOperator.GetDBType(ADatabaseName: string): Integer;
begin
  CmnUnit1.Lg_ev('TIBXDicomDatabaseOperator.GetDBType');
  Result := 7;
end;

end.

