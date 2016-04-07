unit fEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, ExtCtrls, StdCtrls, cxButtons, ActnList,
  dxSkinsCore, cxControls, cxContainer, cxEdit, cxLabel, cxGroupBox,
  cxGraphics, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxButtonEdit, cxMemo, DB, OracleData,
  dxSkinOffice2007Green;

type
  TfrmEdit = class(TForm)
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    gbCompr: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    lcbNumCamera: TcxLookupComboBox;
    beDs: TcxButtonEdit;
    lcbCS: TcxLookupComboBox;
    lcbCT: TcxLookupComboBox;
    lcbIP: TcxLookupComboBox;
    lcbIT: TcxLookupComboBox;
    lcbDS: TcxLookupComboBox;
    lcbDT: TcxLookupComboBox;
    memRemark: TcxMemo;
    lcbTypeNaz: TcxLookupComboBox;
    lbNumJur: TcxLabel;
    lbPac: TcxLabel;
    odsNumCam: TOracleDataSet;
    dsNumCam: TDataSource;
    odsCompr_Speed: TOracleDataSet;
    dsCompr_Speed: TDataSource;
    odsCompr_Time: TOracleDataSet;
    dsCompr_Time: TDataSource;
    odsIzo_Press: TOracleDataSet;
    dsIzo_Press: TDataSource;
    odsIzo_Time: TOracleDataSet;
    dsIzo_Time: TDataSource;
    odsDecompr_Speed: TOracleDataSet;
    dsDecompr_Speed: TDataSource;
    odsDecompr_Time: TOracleDataSet;
    dsDecompr_Time: TDataSource;
    odsNazType: TOracleDataSet;
    dsNazType: TDataSource;
    lbMKB: TcxLabel;
    Panel2: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure beDsPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  private
    { Private declarations }
  public
    pPacID : Integer;
    { Public declarations }
  end;

var
  frmEdit: TfrmEdit;

implementation
uses fMain, fSetDs;
{$R *.dfm}

procedure TfrmEdit.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEdit.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmEdit.beDsPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSetDs, frmSetDs);
  try
    frmSetDs.odsDs.Close;
    frmSetDs.odsDs.SetVariable('pfk_pacid', pPacID);
    frmSetDs.odsDs.Open;
    frmSetDs.ShowModal;
    if frmSetDs.ModalResult = mrOk then
      begin
        lbMkb.Tag := frmSetDs.odsDs.FieldByName('fk_smdiagid').AsInteger;
        lbMkb.Caption := frmSetDs.odsDs.FieldByName('mkb10').AsString;
        beDs.Text := frmSetDs.odsDs.FieldByName('fc_write').AsString;
        beDs.Tag := frmSetDs.odsDs.FieldByName('fk_id').AsInteger;
      end;
  finally
    frmSetDs.Free;
  end;
end;

procedure TfrmEdit.FormCreate(Sender: TObject);
begin
  if odsNumCam.Active = False then
    odsNumCam.Active := True;
  if odsCompr_Speed.Active = False then
    odsCompr_Speed.Active := True;
  if odsCompr_Time.Active = False then
    odsCompr_Time.Active := True;
  if odsIzo_Press.Active = False then
    odsIzo_Press.Active := True;
  if odsIzo_Time.Active = False then
    odsIzo_Time.Active := True;
  if odsDecompr_Speed.Active = False then
    odsDecompr_Speed.Active := True;
  if odsDecompr_Time.Active = False then
    odsDecompr_Time.Active := True;
  if odsNazType.Active = False then
    odsNazType.Active := True;
end;

end.
