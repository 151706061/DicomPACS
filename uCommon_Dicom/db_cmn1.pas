unit db_cmn1;

interface

Uses pFIBDatabase, SysUtils, Dialogs, pFIBQuery, pFIBDataSet,
     FIBDatabase, CmnUnit, pFIBProps, Registry, Windows, Forms,
     Variants, Uni, IniFiles, DB, DCM_Server, PostgreSQLUniProvider,
     Oracle, OracleData, dxdbtrel, ComCtrls, DCM_Attributes, DB_CMN;

procedure frmDiagTree ( pTreeViewEdit:TdxTreeViewEdit; pTreeNode:TTreeNode; pParentID:integer=-1; pOsn:Integer=0 ) ;

implementation

procedure frmDiagTree ( pTreeViewEdit:TdxTreeViewEdit; pTreeNode:TTreeNode; pParentID:integer=-1; pOsn:Integer=0 ) ;
var vFIBQuery : TpFIBDataSet; vTreeNode:TTreeNode;
    vFK_ID : integer; vFC_NAME, vAdd:string;
    v_UniQr : TUniQuery;
begin
  if v_isOracle then     // ORACLE
  begin
    ShowMessage('Not supported');
    Exit;
  end else if v_isPostgres then   // POSTGRES
  begin
    if not PGconn.Connected then Exit;
    v_UniQr := TUniQuery.Create(nil);
    try
      v_UniQr.Connection:=DB_CMN.PGconn;
      v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
      if pOsn=0 then begin
        vAdd:=' and ((fn_posn=0) or (fn_posn is null)) ';
      end else begin
        vAdd:=' and (fn_posn=1) ';
      end;
      if pParentID=-1 then
      begin
        v_UniQr.SQL.Text := 'select * from '+v_pg_Schema+'.diagnoz where ((fk_parentid=0) or (fk_parentid is null)) '+vAdd+' order by fc_name';
      end else
      begin
        v_UniQr.SQL.Text := 'select * from '+v_pg_Schema+'.diagnoz where (fk_parentid=:fk_parentid) '+vAdd+' order by fc_name';
        v_UniQr.ParamByName('fk_parentid').AsInteger := pParentID;
      end;
      v_UniQr.Open; v_UniQr.First;
      while not v_UniQr.Eof do
      begin
        vFK_ID := v_UniQr.FieldByName('FK_ID').AsInteger ;
        vFC_NAME := v_UniQr.FieldByName('FC_NAME').AsString ;
        if pParentID=-1 then
          vTreeNode:=pTreeViewEdit.Items.Add( nil, vFC_NAME )
        else
          vTreeNode:=pTreeViewEdit.Items.AddChild( pTreeNode, vFC_NAME );
        vTreeNode.Data := Pointer( vFK_ID );
        frmDiagTree ( pTreeViewEdit, vTreeNode, vFK_ID, pOsn ) ;
        v_UniQr.Next;
      end;
    finally
      v_UniQr.Free;
    end;
  end else
  begin // firebird
    if not DB_CMN.DB.Connected then Exit;
    vFIBQuery := TpFIBDataSet.Create(nil);
    try
      vFIBQuery.Database := DB_CMN.DB;
      vFIBQuery.Transaction := DB_CMN.trRead;
      if DB_CMN.trRead.Active = False then
        DB_CMN.trRead.StartTransaction;
      if pOsn=0 then begin
        vAdd:=' and ((FN_POSN=0) or (FN_POSN is null)) ';
      end else begin
        vAdd:=' and (FN_POSN=1) ';
      end;
      if pParentID=-1 then
      begin
        vFIBQuery.SQLs.SelectSQL.Text := 'select * from DIAGNOZ where (FK_PARENTID is null) '+vAdd+' order by fc_name';
      end else
      begin
        vFIBQuery.SQLs.SelectSQL.Text := 'select * from DIAGNOZ where (FK_PARENTID=:FK_PARENTID) '+vAdd+' order by fc_name';
        vFIBQuery.ParamByName('FK_PARENTID').AsInteger := pParentID;
      end;
      vFIBQuery.Open; vFIBQuery.First;
      while not vFIBQuery.Eof do
      begin
        vFK_ID := vFIBQuery.FieldByName('FK_ID').AsInteger ;
        vFC_NAME := vFIBQuery.FieldByName('FC_NAME').AsString ;
        if pParentID=-1 then
          vTreeNode:=pTreeViewEdit.Items.Add( nil, vFC_NAME )
        else
          vTreeNode:=pTreeViewEdit.Items.AddChild( pTreeNode, vFC_NAME );
        vTreeNode.Data := Pointer( vFK_ID );
        frmDiagTree ( pTreeViewEdit, vTreeNode, vFK_ID, pOsn ) ;
        vFIBQuery.Next;
      end;
    finally
      vFIBQuery.Free;
    end;
  end;
end;

end.
