unit fm_Select_Sotr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdmMain, cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Menus, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, DB, OracleData, cxCustomData, cxStyles, cxTL, cxInplaceContainer,
  cxTLData, cxDBTL, ExtCtrls;

type
  TfmSelect_Sotr = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    acOk: TAction;
    acCancel: TAction;
    cxPopupEdit1: TcxPopupEdit;
    paSelectSotr: TPanel;
    tlSotr: TcxDBTreeList;
    paButtons: TPanel;
    buSelect: TcxButton;
    buCancel: TcxButton;
    odsSotr: TOracleDataSet;
    tlSotr_FK_ID: TcxDBTreeListColumn;
    tlSotr_FK_OWNERID: TcxDBTreeListColumn;
    tlSotr_FC_NAME: TcxDBTreeListColumn;
    tlSotr_FC_SPEC: TcxDBTreeListColumn;
    dsSotr: TDataSource;
    procedure acOkExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxPopupEdit1PropertiesChange(Sender: TObject);
    procedure buSelectClick(Sender: TObject);
    procedure buCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LastFIO, LastSpec : string;
  end;

  function DoShowSelectSotr_str(const aFC_SOTR : string; var aSpec : string) : string;  

implementation

{$R *.dfm}

function DoShowSelectSotr_str(const aFC_SOTR : string; var aSpec : string) : string;
var fmSelect_Sotr: TfmSelect_Sotr;
begin
  Application.CreateForm( TfmSelect_Sotr, fmSelect_Sotr );
  try
    fmSelect_Sotr.odsSotr.Open;
    if fmSelect_Sotr.odsSotr.Locate('FC_NAME', aFC_SOTR, [loCaseInsensitive]) then
    begin
      fmSelect_Sotr.LastSpec := fmSelect_Sotr.odsSotr.FieldByName('fc_spec').AsString;
      fmSelect_Sotr.LastFIO  := fmSelect_Sotr.odsSotr.FieldByName('FC_NAME').AsString;
    end;
    fmSelect_Sotr.cxPopupEdit1.Text := aFC_SOTR;

    if fmSelect_Sotr.ShowModal = mrOK then
    begin
      fmSelect_Sotr.cxPopupEdit1.PostEditValue;
      if fmSelect_Sotr.cxPopupEdit1.Text = '' then
        Result := fmSelect_Sotr.LastFIO
      else
        Result := fmSelect_Sotr.cxPopupEdit1.Text;

      aSpec := fmSelect_Sotr.LastSpec; 
    end
    else
      Result := aFC_SOTR;
    fmSelect_Sotr.odsSotr.Close;
    
  finally
    fmSelect_Sotr.Free;
  end;
end;

procedure TfmSelect_Sotr.acOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfmSelect_Sotr.buCancelClick(Sender: TObject);
begin
  cxPopupEdit1.DroppedDown := False;
end;

procedure TfmSelect_Sotr.buSelectClick(Sender: TObject);
begin
  LastFIO := odsSotr.FieldByName('FC_NAME').AsString;
  cxPopupEdit1.Text := LastFIO;

  LastSpec := odsSotr.FieldByName('fc_spec').AsString;
  cxPopupEdit1.DroppedDown := False;
end;

procedure TfmSelect_Sotr.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmSelect_Sotr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrNone then acCancel.Execute;
end;

procedure TfmSelect_Sotr.FormShow(Sender: TObject);
begin
  cxPopupEdit1.SetFocus;
end;

procedure TfmSelect_Sotr.cxPopupEdit1PropertiesChange(Sender: TObject);
begin
//  if cxPopupEdit1.Text <> '' then
//    LastText := cxPopupEdit1.Text;
end;

end.
