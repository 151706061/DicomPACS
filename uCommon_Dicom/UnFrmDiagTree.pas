unit UnFrmDiagTree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinsdxBarPainter, dxSkinBlack, Medotrade,
  dxSkinOffice2007Green, dxBar, dxBarExtItems, cxClasses, cxGraphics,
  cxCustomData, cxStyles, cxTL, cxControls, cxInplaceContainer, cxTLData, cxDBTL,
  ComCtrls, dxtree, dxdbtree, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, cxMaskEdit, StdCtrls, dxSkinOffice2007Black, MemDS, DBAccess,
  Uni;

type
  TfrmDiag = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dsListDiagnoz: TpFIBDataSet;
    dsSrcListDiagnoz: TDataSource;
    dsListDiagnozFK_ID: TIntegerField;
    dsListDiagnozFK_PARENTID: TIntegerField;
    dsListDiagnozFC_NAME: TStringField;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    GroupBox1: TGroupBox;
    rbOsn: TRadioButton;
    rbSop: TRadioButton;
    UniListDiagnoz: TUniQuery;
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure rbOsnKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rbOsnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure rbSopKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rbSopMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    procedure aRefresh;
  end;

var
  frmDiag: TfrmDiag;

implementation

{$R *.dfm}

Uses DB_CMN, UnDiagEdt, pFIBQuery, DCM_Connection, pFIBProps, FIBQuery;

procedure TfrmDiag.aRefresh;
begin
  if v_isOracle then begin
  end else if v_isPostgres then
  begin
    UniListDiagnoz.DisableControls;
    UniListDiagnoz.Close;
    UniListDiagnoz.SQL.Text;
    if frmDiag.rbOsn.Checked then
      UniListDiagnoz.SQL.Text:='select * from '+v_pg_Schema+'.diagnoz where ((fn_posn=0) or (fn_posn is null)) order by fc_name'
    else
      UniListDiagnoz.SQL.Text:='select * from '+v_pg_Schema+'.diagnoz where (fn_posn=1) order by fc_name';
    UniListDiagnoz.Open;
    UniListDiagnoz.First;
    dxBarLargeButton6.Enabled := not UniListDiagnoz.Eof;
    dxBarLargeButton3.Enabled := not UniListDiagnoz.Eof;
    dxBarLargeButton4.Enabled := not UniListDiagnoz.Eof;
    UniListDiagnoz.EnableControls;
  end else
  begin
    dsListDiagnoz.DisableControls;
    dsListDiagnoz.Close;
    dsListDiagnoz.SQLs.RefreshSQL.Clear;
    if frmDiag.rbOsn.Checked then
      dsListDiagnoz.SQLs.RefreshSQL.Text:='select * from DIAGNOZ where ((FN_POSN=0) or (FN_POSN is null)) order by FC_NAME'
    else
      dsListDiagnoz.SQLs.RefreshSQL.Text:='select * from DIAGNOZ where (FN_POSN=1) order by FC_NAME';
    dsListDiagnoz.SelectSQL.Text := dsListDiagnoz.SQLs.RefreshSQL.Text;
    dsListDiagnoz.Open;
    dsListDiagnoz.First;
    dxBarLargeButton6.Enabled := not dsListDiagnoz.Eof;
    dxBarLargeButton3.Enabled := not dsListDiagnoz.Eof;
    dxBarLargeButton4.Enabled := not dsListDiagnoz.Eof;
    dsListDiagnoz.EnableControls;
  end;
end;

procedure TfrmDiag.dxBarLargeButton1Click(Sender: TObject);
begin
  aRefresh;
end;

procedure TfrmDiag.dxBarLargeButton2Click(Sender: TObject);
var vFIBQuery : TpFIBQuery; vteDiagnoz:string; v_UniQr : TUniQuery;
begin   //  Добавить в корень
  Application.CreateForm(TfrmDiagEdt, frmDiagEdt);
  try
    frmDiagEdt.Caption := 'Добавление записи';
    frmDiagEdt.rbSop.Checked:= not rbOsn.Checked;
    frmDiagEdt.rbOsn.Checked:= rbOsn.Checked;
    if frmDiagEdt.ShowModal=mrOk then
    begin
      vteDiagnoz:=frmDiagEdt.teDiagnoz.Text;
        if v_isOracle then begin
        end else if v_isPostgres then
        begin
          UniListDiagnoz.DisableControls;
          v_UniQr := TUniQuery.Create(nil);
          try
            v_UniQr.Connection:=DB_CMN.PGconn;
            v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
            v_UniQr.SQL.Text:='insert into '+v_pg_Schema+'.diagnoz '+
              '( fc_name, fn_posn ) values ( :fc_name, :fn_posn )';
            v_UniQr.ParamByName('fc_name').AsString := vteDiagnoz;
            if frmDiagEdt.rbOsn.Checked then
              v_UniQr.ParamByName('fn_posn').AsInteger := 0
            else
              v_UniQr.ParamByName('fn_posn').AsInteger := 1;
            v_UniQr.ExecSQL;
          finally
            v_UniQr.Free;
          end;
        end else
        begin
          vFIBQuery := TpFIBQuery.Create(nil);
          try
            vFIBQuery.Database := DB_CMN.DB;
            vFIBQuery.Transaction := DB_CMN.trWrite;
            if DB_CMN.trWrite.Active = False then
              DB_CMN.trWrite.StartTransaction;
            vFIBQuery.Options := vFIBQuery.Options + [qoAutoCommit];
            vFIBQuery.SQL.Text := 'insert into DIAGNOZ ( FC_NAME, FN_POSN ) values ( :FC_NAME, :FN_POSN )';
            vFIBQuery.ParamByName('FC_NAME').AsString := frmDiagEdt.teDiagnoz.Text;
            if frmDiagEdt.rbOsn.Checked then
              vFIBQuery.ParamByName('FN_POSN').AsInteger := 0
            else
              vFIBQuery.ParamByName('FN_POSN').AsInteger := 1;
            vFIBQuery.ExecQuery;
          finally
            vFIBQuery.Free;
          end;
        end;
    end;
  finally
    frmDiagEdt.Free;
    aRefresh;
    cxDBTreeList1.DataController.DataSet.Locate('FC_NAME',vteDiagnoz,[]);
  end;
end;

procedure TfrmDiag.dxBarLargeButton3Click(Sender: TObject);
var vFIBQuery : TpFIBQuery; vFK_ID:Integer; vteDiagnoz:string; v_UniQr : TUniQuery;
begin  // Изменить
  if not cxDBTreeList1.DataController.DataSet.Eof
  then begin
    Application.CreateForm(TfrmDiagEdt, frmDiagEdt);
    try
      frmDiagEdt.Caption := 'Изменение записи';
      frmDiagEdt.teDiagnoz.Text := cxDBTreeList1.DataController.DataSet.FieldByName('FC_NAME').AsString ;
      frmDiagEdt.rbSop.Checked:= not rbOsn.Checked;
      frmDiagEdt.rbOsn.Checked:= rbOsn.Checked;
      frmDiagEdt.rbSop.Visible:=False;
      frmDiagEdt.rbOsn.Visible:=False;
      vFK_ID:=cxDBTreeList1.DataController.DataSet.FieldByName('FK_ID').AsInteger;
      if frmDiagEdt.ShowModal=mrOk then
      begin
        if frmDiagEdt.teDiagnoz.Text <> cxDBTreeList1.DataController.DataSet.FieldByName('FC_NAME').AsString then
        begin
          vteDiagnoz:=frmDiagEdt.teDiagnoz.Text;
          if v_isOracle then begin
          end else if v_isPostgres then
          begin
            UniListDiagnoz.DisableControls;
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=DB_CMN.PGconn;
              v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
              v_UniQr.SQL.Text:='update '+v_pg_Schema+'.diagnoz set fc_name=:fc_name where fk_id=:fk_id';
              vFIBQuery.ParamByName('fc_name').AsString := frmDiagEdt.teDiagnoz.Text;
              vFIBQuery.ParamByName('fk_id').AsInteger := vFK_ID;
              v_UniQr.ExecSQL;
            finally
              v_UniQr.Free;
            end;
          end else
          begin
            vFIBQuery := TpFIBQuery.Create(nil);
            try
              vFIBQuery.Database := DB_CMN.DB;
              vFIBQuery.Transaction := DB_CMN.trWrite;
              if DB_CMN.trWrite.Active = False then
                DB_CMN.trWrite.StartTransaction;
              vFIBQuery.Options := vFIBQuery.Options + [qoAutoCommit];
              vFIBQuery.SQL.Text := 'update DIAGNOZ set FC_NAME=:FC_NAME where FK_ID=:FK_ID';
              vFIBQuery.ParamByName('FC_NAME').AsString := frmDiagEdt.teDiagnoz.Text;
              vFIBQuery.ParamByName('FK_ID').AsInteger := vFK_ID;
              vFIBQuery.ExecQuery;
            finally
              vFIBQuery.Free;
            end;
          end;
        end;
      end;
    finally
      frmDiagEdt.Free;
      aRefresh;
      cxDBTreeList1.DataController.DataSet.Locate('FK_ID',vFK_ID,[]);
    end;
  end;
end;

procedure TfrmDiag.dxBarLargeButton4Click(Sender: TObject);
var vFIBQuery : TpFIBQuery; vFK_ID:Integer; v_UniQr : TUniQuery;
begin  // Удалить
  if not cxDBTreeList1.DataController.DataSet.Eof
  then begin
    if MessageDlg('Удалить запись ?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
    begin
      vFK_ID:=cxDBTreeList1.DataController.DataSet.FieldByName('FK_ID').AsInteger;
      if v_isOracle then begin
      end else if v_isPostgres then
      begin
        UniListDiagnoz.DisableControls;
        v_UniQr := TUniQuery.Create(nil);
        try
          v_UniQr.Connection:=DB_CMN.PGconn;
          v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
          v_UniQr.SQL.Text:='delete from '+v_pg_Schema+'.diagnoz where fk_id=:fk_id';
          v_UniQr.ParamByName('fk_id').AsInteger := vFK_ID;
          v_UniQr.ExecSQL;
        finally
          v_UniQr.Free;
          aRefresh;
        end;
      end else
      begin
        vFIBQuery := TpFIBQuery.Create(nil);
        try
          vFIBQuery.Database := DB_CMN.DB;
          vFIBQuery.Transaction := DB_CMN.trWrite;
          if DB_CMN.trWrite.Active = False then
            DB_CMN.trWrite.StartTransaction;
          vFIBQuery.Options := vFIBQuery.Options + [qoAutoCommit];
          vFIBQuery.SQL.Text := 'delete from DIAGNOZ where FK_ID=:FK_ID';
          vFIBQuery.ParamByName('FK_ID').AsInteger := vFK_ID;
          vFIBQuery.ExecQuery;
        finally
          vFIBQuery.Free;
          aRefresh;
        end;
      end;
    end;
  end;
end;

procedure TfrmDiag.dxBarLargeButton5Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfrmDiag.dxBarLargeButton6Click(Sender: TObject);
var vFIBQuery : TpFIBQuery; vFK_ID:Integer; vteDiagnoz:string; v_UniQr : TUniQuery;
begin   // Добавить в группу
  if not cxDBTreeList1.DataController.DataSet.Eof
  then begin
    Application.CreateForm(TfrmDiagEdt, frmDiagEdt);
    try
      frmDiagEdt.Caption := 'Добавление записи в группу';
      frmDiagEdt.rbSop.Checked:= not rbOsn.Checked;
      frmDiagEdt.rbOsn.Checked:= rbOsn.Checked;
      if frmDiagEdt.ShowModal=mrOk then
      begin
        vFK_ID:=cxDBTreeList1.DataController.DataSet.FieldByName('FK_ID').AsInteger;
        vteDiagnoz:=frmDiagEdt.teDiagnoz.Text;
        if v_isOracle then begin
        end else if v_isPostgres then
        begin
          UniListDiagnoz.DisableControls;
          v_UniQr := TUniQuery.Create(nil);
          try
            v_UniQr.Connection:=DB_CMN.PGconn;
            v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
            v_UniQr.SQL.Text:='insert into '+v_pg_Schema+'.diagnoz '+
              '( fk_parentid, fc_name, fn_posn ) values ( :fk_parentid, :fc_name, :fn_posn )';
            v_UniQr.ParamByName('fk_parentid').AsInteger := vFK_ID;
            v_UniQr.ParamByName('fc_name').AsString := vteDiagnoz;
            if frmDiagEdt.rbOsn.Checked then
              v_UniQr.ParamByName('fn_posn').AsInteger := 0
            else
              v_UniQr.ParamByName('fn_posn').AsInteger := 1;
            v_UniQr.ExecSQL;
          finally
            v_UniQr.Free;
          end;
        end else
        begin
          vFIBQuery := TpFIBQuery.Create(nil);
          try
            vFIBQuery.Database := DB_CMN.DB;
            vFIBQuery.Transaction := DB_CMN.trWrite;
            if DB_CMN.trWrite.Active = False then
              DB_CMN.trWrite.StartTransaction;
            vFIBQuery.Options := vFIBQuery.Options + [qoAutoCommit];
            vFIBQuery.SQL.Text := 'insert into DIAGNOZ ( FK_PARENTID, FC_NAME, FN_POSN ) values ( :FK_PARENTID, :FC_NAME, :FN_POSN )';
            vFIBQuery.ParamByName('FK_PARENTID').AsInteger := vFK_ID;
            vFIBQuery.ParamByName('FC_NAME').AsString := vteDiagnoz;
            if frmDiagEdt.rbOsn.Checked then
              vFIBQuery.ParamByName('FN_POSN').AsInteger := 0
            else
              vFIBQuery.ParamByName('FN_POSN').AsInteger := 1;
            vFIBQuery.ExecQuery;
          finally
            vFIBQuery.Free;
          end;
        end;
      end;
    finally
      frmDiagEdt.Free;
      aRefresh;
      cxDBTreeList1.DataController.DataSet.Locate('FK_PARENTID;FC_NAME',VarArrayOf([vFK_ID,vteDiagnoz]),[]);
    end;
  end;
end;

procedure TfrmDiag.FormCreate(Sender: TObject);
begin
  if v_isOracle then begin
  end else if v_isPostgres then
  begin
    UniListDiagnoz.SQL.Text := 'select * from '+v_pg_Schema+'.diagnoz';
    UniListDiagnoz.Connection:=DB_CMN.PGconn;
    UniListDiagnoz.Transaction:=DB_CMN.MnUniTransaction;
    dsSrcListDiagnoz.DataSet := UniListDiagnoz;
  end else
  begin
    dsListDiagnoz.Database := DB_CMN.DB;
    dsListDiagnoz.Transaction := DB_CMN.trRead;
    dsSrcListDiagnoz.DataSet := dsListDiagnoz;
  end;
  aRefresh;
end;

procedure TfrmDiag.rbOsnKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  aRefresh;
end;

procedure TfrmDiag.rbOsnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  aRefresh;
end;

procedure TfrmDiag.rbSopKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  aRefresh;
end;

procedure TfrmDiag.rbSopMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  aRefresh;
end;

end.
