unit fTemplates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, ComCtrls, ToolWin, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxContainer, cxGroupBox, OracleData,
  fdmMain, ExtCtrls, cxSpinEdit, cxButtonEdit, fMedic;

type
  TfmTemplates = class(TForm)
    grbTemplates: TcxGroupBox;
    grTemplates: TcxGrid;
    grTemplatesDBTableView1: TcxGridDBTableView;
    grTemplatesLevel1: TcxGridLevel;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    tbuSelect: TToolButton;
    tbuClose: TToolButton;
    ToolButton1: TToolButton;
    tbuDel: TToolButton;
    grTemplates_FC_DESCR: TcxGridDBColumn;
    grTemplates_FK_ID: TcxGridDBColumn;
    odsTTEMPLATE_DOC: TOracleDataSet;
    dsTTEMPLATE_DOC: TDataSource;
    dsTTemplate_dpc: TDataSource;
    cxGroupBox2: TcxGroupBox;
    grTemplate_DPC: TcxGrid;
    grTemplate_DPCDBTableView1: TcxGridDBTableView;
    grTemplate_DPCLevel1: TcxGridLevel;
    Splitter1: TSplitter;
    grTemplate_DPC_fk_id: TcxGridDBColumn;
    grTemplate_DPC_fk_template_doc_id: TcxGridDBColumn;
    grTemplate_DPC_fk_medic_id: TcxGridDBColumn;
    grTemplate_DPC_fn_kol: TcxGridDBColumn;
    ToolButton3: TToolButton;
    tbuEdit: TToolButton;
    grTemplate_DPC_fc_medic: TcxGridDBColumn;
    procedure odsTTEMPLATE_DOCAfterScroll(DataSet: TDataSet);
    procedure tbuCloseClick(Sender: TObject);
    procedure tbuEditClick(Sender: TObject);
    procedure tbuDelClick(Sender: TObject);
    procedure grTemplate_DPCDBTableView1Column1PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure tbuSelectClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure grTemplatesEnter(Sender: TObject);
    procedure grTemplate_DPCEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FocusedDoc : boolean;
    FocusedDPC : boolean;
  end;

  Function DoShowTemplates( aGroupID : integer; aMOID : integer = -1 ) : integer;


implementation

{$R *.dfm}

Function DoShowTemplates( aGroupID : integer; aMOID : integer = -1 ) : integer;
var
  fmTemplates: TfmTemplates;
begin
  Result := -1;
  Application.CreateForm( TfmTemplates, fmTemplates );
  fmTemplates.odsTTEMPLATE_DOC.AfterScroll := nil;
  fmTemplates.odsTTEMPLATE_DOC.SetVariable( 'FK_MO_GROUP_ID', aGroupID );
  fmTemplates.odsTTEMPLATE_DOC.Open;
  fmTemplates.odsTTEMPLATE_DOC.AfterScroll := fmTemplates.odsTTEMPLATE_DOCAfterScroll;
  fmTemplates.odsTTEMPLATE_DOCAfterScroll( fmTemplates.odsTTEMPLATE_DOC );

  if fmTemplates.ShowModal = mrOk then
    Result := fmTemplates.odsTTEMPLATE_DOC.FieldByName('FK_ID').AsInteger;
end;

procedure TfmTemplates.FormActivate(Sender: TObject);
begin
  FocusedDoc := True;
  FocusedDPC := False;
end;

procedure TfmTemplates.grTemplatesEnter(Sender: TObject);
begin
  FocusedDoc := True;
  FocusedDPC := False;
end;

procedure TfmTemplates.grTemplate_DPCDBTableView1Column1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  MedicID : integer;
begin
  MedicID := grTemplate_DPC_fk_medic_id.EditValue;
  MedicID := DoShowMedic( MedicID, True);
  if MedicID > 0 then
  begin
    grTemplate_DPC_fk_medic_id.EditValue := MedicID;
    odsTTEMPLATE_DOCAfterScroll( odsTTEMPLATE_DOC );
  end;
end;

procedure TfmTemplates.grTemplate_DPCEnter(Sender: TObject);
begin
  FocusedDoc := False;
  FocusedDPC := True;
end;

procedure TfmTemplates.odsTTEMPLATE_DOCAfterScroll(DataSet: TDataSet);
begin
  dmMain.odsTTemplate_dpc.Close;
  dmMain.odsTTemplate_dpc.SetVariable('fk_template_doc_id', odsTTEMPLATE_DOC.FieldByName('FK_ID').AsInteger);
  dmMain.odsTTemplate_dpc.Open;
end;

procedure TfmTemplates.tbuEditClick(Sender: TObject);
begin
  if tbuEdit.Down = False then
  begin
    grTemplatesDBTableView1.DataController.PostEditingData;
    grTemplatesDBTableView1.DataController.Post();

    grTemplate_DPCDBTableView1.DataController.PostEditingData;
    grTemplate_DPCDBTableView1.DataController.Post();
  end;

  grTemplatesDBTableView1.OptionsData.Editing := tbuEdit.Down;
  grTemplate_DPCDBTableView1.OptionsData.Editing := tbuEdit.Down;
end;

procedure TfmTemplates.tbuSelectClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfmTemplates.tbuCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  dmMain.odsTTemplate_dpc.Close;
end;

procedure TfmTemplates.tbuDelClick(Sender: TObject);
begin
  if (FocusedDoc) then
  begin
    grTemplatesDBTableView1.DataController.DeleteFocused;
  end;

  if (FocusedDPC) then
  begin
    grTemplate_DPCDBTableView1.DataController.DeleteFocused;
  end;
end;

end.
