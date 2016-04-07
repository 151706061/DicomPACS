unit fUchgrpsChr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdmMain, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxDBLookupComboBox,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, OracleData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, ComCtrls,
  ToolWin, Oracle, ActnList;

type
  TFrmUchGrpsChanges = class(TForm)
    clbr1: TCoolBar;
    tlb1: TToolBar;
    btn3: TToolButton;
    btnInsert: TToolButton;
    btn6: TToolButton;
    btn8: TToolButton;
    btn11: TToolButton;
    grdUchGrpChangesTabVw: TcxGridDBTableView;
    grdUchGrpChangesLvl: TcxGridLevel;
    grdUchGrpChanges: TcxGrid;
    odsMedicUchGrpChanges: TOracleDataSet;
    dsMedicUchGrpChanges: TDataSource;
    grdUchGrpChangesTabVwDATE_END: TcxGridDBColumn;
    grdUchGrpChangesTabVwUCHGR_NAME: TcxGridDBColumn;
    ToolButton1: TToolButton;
    grdUchGrpChangesTabVwROWID: TcxGridDBColumn;
    grdUchGrpChangesTabVwMO_NAME: TcxGridDBColumn;
    aclMain: TActionList;
    acInsert: TAction;
    acDelete: TAction;
    acRefresh: TAction;
    acExit: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acInsertExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acInsertUpdate(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
  private
    { Private declarations }
    fMedicId : Integer;
    procedure SetMedicId ( AMedicId : Integer ) ;
  public
    property MedicId : Integer read fMedicId write SetMedicId;
  end;

var
  frmUchGrpsChanges: TFrmUchGrpsChanges;

implementation

{$R *.dfm}

{-------------------------------------------------------------------------------
  ���������:  TFrmUchGrpsChanges.FormCreate
  ����������: ����������� �����
  �����:      �������� �.�.
  ����:       01.11.2013
  ������� ���������: Sender: TObject
-------------------------------------------------------------------------------}
procedure TFrmUchGrpsChanges.FormCreate(Sender: TObject);
begin
  fMedicId := -1;

  // ��������� �������������� � �����
  grdUchGrpChangesTabVw.OptionsData.Editing := False;
end;

{-------------------------------------------------------------------------------
  ���������:  TFrmUchGrpsChanges.SetMedicId
  ����������: ��������� �� ������� �����
  �����:      �������� �.�.
  ����:       01.11.2013
  ������� ���������: AMedicId: Integer
-------------------------------------------------------------------------------}
procedure TFrmUchGrpsChanges.SetMedicId(AMedicId: Integer);
begin
  fMedicId := AMedicId;

  acRefresh.Execute;
end;

{-------------------------------------------------------------------------------
  ���������:  TFrmUchGrpsChanges.FormClose
  ����������: �������� �����
  �����:      �������� �.�.
  ����:       01.11.2013
  ������� ���������: Sender: TObject; var Action: TCloseAction
-------------------------------------------------------------------------------}
procedure TFrmUchGrpsChanges.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  odsMedicUchGrpChanges.Close;

  Action := caFree;
end;

{-------------------------------------------------------------------------------
  ���������:  TFrmUchGrpsChanges.acInsertExecute
  ����������: ���������� �������� "��������"
  �����:      �������� �.�.
  ����:       01.11.2013
  ������� ���������: Sender: TObject
-------------------------------------------------------------------------------}
procedure TFrmUchGrpsChanges.acInsertExecute(Sender: TObject);
var v_OraQr : TOracleQuery;
begin
  v_OraQr := TOracleQuery.Create(nil);
  try
    v_OraQr.Session:=dmMain.os;
    v_OraQr.SQL.Text:='insert into med.TMEDIC_CHRONO '+
        '(MEDICID, DATE_END, UCHGRID, MOID ) values '+
        '(:p_MEDICID, :p_DATE_END, :p_UCHGRID, :p_MOID)';

    v_OraQr.DeclareVariable('p_MEDICID',otInteger);
    v_OraQr.DeclareVariable('p_DATE_END',otDate);
    v_OraQr.DeclareVariable('p_UCHGRID',otInteger);
    v_OraQr.DeclareVariable('p_MOID',otInteger);

    v_OraQr.SetVariable('p_MEDICID', MedicId);
    v_OraQr.SetVariable('p_DATE_END',Date);
    v_OraQr.SetVariable('p_UCHGRID', -1);
    v_OraQr.SetVariable('p_MOID', dmMain.MOID);

    v_OraQr.Execute;
    v_OraQr.Session.Commit;

  finally
    v_OraQr.Free;
  end;

  acRefresh.Execute;
end;

{-------------------------------------------------------------------------------
  ���������:  TFrmUchGrpsChanges.acInsertUpdate
  ����������: ������ � ���������
  �����:      �������� �.�.
  ����:       01.11.2013
  ������� ���������: Sender: TObject
-------------------------------------------------------------------------------}
procedure TFrmUchGrpsChanges.acInsertUpdate(Sender: TObject);
begin
  { �������� "��������" � "�������" ���� ���������,
    �� ������ �������, ����� ��� � ���� ����� ����� }
  ( Sender as TAction ).Enabled := False;
  ( Sender as TAction ).Visible := ( Sender as TAction ).Enabled;
end;

{-------------------------------------------------------------------------------
  ���������:  TFrmUchGrpsChanges.acExitExecute
  ����������: �������� "�������"
  �����:      �������� �.�.
  ����:       01.11.2013
  ������� ���������: Sender: TObject
-------------------------------------------------------------------------------}
procedure TFrmUchGrpsChanges.acExitExecute(Sender: TObject);
begin
  Close;
end;

{-------------------------------------------------------------------------------
  ���������:  TFrmUchGrpsChanges.acDeleteExecute
  ����������: �������� "�������"
  �����:      �������� �.�.
  ����:       01.11.2013
  ������� ���������: Sender: TObject
-------------------------------------------------------------------------------}
procedure TFrmUchGrpsChanges.acDeleteExecute(Sender: TObject);
var v_OraQr : TOracleQuery;
begin
  if not odsMedicUchGrpChanges.Eof then
  begin
    v_OraQr := TOracleQuery.Create(nil);
    try
      v_OraQr.Session:=dmMain.os;
      v_OraQr.SQL.Text:='delete from med.TMEDIC_CHRONO '+
          ' where MEDICID=:p_MEDICID and DATE_END =:p_DATE_END ';
      v_OraQr.DeclareVariable('p_MEDICID',otInteger);
      v_OraQr.DeclareVariable('p_DATE_END',otDate);
      v_OraQr.SetVariable('p_MEDICID', MedicId);
      v_OraQr.SetVariable('p_DATE_END',odsMedicUchGrpChanges.FieldByName('DATE_END').AsDateTime);
      v_OraQr.Execute;
      v_OraQr.Session.Commit;
      
    finally
      v_OraQr.Free;
    end;
  end;

  acRefresh.Execute;
end;

{-------------------------------------------------------------------------------
  ���������:  TFrmUchGrpsChanges.acRefreshExecute
  ����������: �������� "��������"
  �����:      �������� �.�.
  ����:       01.11.2013
  ������� ���������: Sender: TObject
-------------------------------------------------------------------------------}
procedure TFrmUchGrpsChanges.acRefreshExecute(Sender: TObject);
begin
  if MedicId > 0  then
  with odsMedicUchGrpChanges do
  Try
    DisableControls;
    Close;
    DeclareVariable('P_MEDICID',otInteger);
    SetVariable('P_MEDICID', MedicId );
    Open;
  Finally
    EnableControls;
  End;
end;


end.
