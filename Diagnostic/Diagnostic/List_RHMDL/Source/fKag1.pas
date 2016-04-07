unit fKag1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, fRVMedEditor, uIntfRichEdit;

type
  TfrmKag1 = class(TForm)
    paMedEditorDock: TPanel;
  private
    FMedEditorForm : TfmRVMedEditor;
    { Private declarations }
  public
    procedure DoShowForm(nSmid, nNazid : Integer);
    { Public declarations }
  end;

var
  frmKag1: TfrmKag1;

implementation
uses uDllIntf, fMain;
{$R *.dfm}

procedure TfrmKag1.DoShowForm(nSmid, nNazid: Integer);
begin
  CreateMedEditorData;
	InitMedEditorData(frmMain.pSOTRID);
	FMedEditorForm:=CreateAndDocMedEditor(Self, paMedEditorDock);
	FMedEditorForm.Show;
	FMedEditorForm.Init(nSmid, nNazid);
end;

end.
