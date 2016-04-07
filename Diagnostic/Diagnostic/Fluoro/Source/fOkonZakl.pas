unit fOkonZakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, dxBar,
  cxClasses, ActnList, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo,
  dxSkinOffice2007Green;

type
  TfrmOkonZakl = class(TForm)
    dxBarDockControl1: TdxBarDockControl;
    dxBM: TdxBarManager;
    dxBMBar1: TdxBar;
    bbSave: TdxBarButton;
    bbCancel: TdxBarButton;
    actlst1: TActionList;
    actCancel: TAction;
    actOK: TAction;
    cxOkonZakl: TcxMemo;
    bbDs: TdxBarButton;
    aDs: TAction;
    procedure actOKExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxOkonZaklClick(Sender: TObject);
    procedure cxOkonZaklEnter(Sender: TObject);
    procedure aDsExecute(Sender: TObject);
  private
    pPACID : Integer;
    Russian : HKL;
    { Private declarations }
  public
    procedure DoShowForm(nPacId : Integer);
    { Public declarations }
  end;

var
  frmOkonZakl: TfrmOkonZakl;

implementation
uses fMain, fDs;
{$R *.dfm}

procedure TfrmOkonZakl.actCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmOkonZakl.actOKExecute(Sender: TObject);
begin
  ModalResult := MrOK;
end;

procedure TfrmOkonZakl.aDsExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmDs, frmDs);
  try
    frmDs.odsDs.Close;
    frmDs.odsDs.SetVariable('pfk_pacid', pPACID);
    frmDs.odsDs.Open;
    if frmDs.odsDs.RecordCount = 0  then
      frmDs.aOk.Enabled := false;
    frmDs.ShowModal;
    if frmDs.ModalResult = mrOk then
      begin
        cxOkonZakl.Lines.Text := cxOkonZakl.Lines.Text + ' ' + frmDs.odsDs.FieldByName('fc_write').AsString;
      end;
  finally
    frmDs.Free;
  end;
end;

procedure TfrmOkonZakl.cxOkonZaklClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmOkonZakl.cxOkonZaklEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmOkonZakl.DoShowForm(nPacId: Integer);
begin
  pPACID := nPacId;
end;

procedure TfrmOkonZakl.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
end;

end.

