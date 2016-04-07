unit fSetParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList,
  cxClasses, ExtCtrls, Menus, cxLookAndFeelPainters, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, cxButtons, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, dxSkinOffice2007Green;

type
  TfrmSetParam = class(TForm)
    alOkCancel: TActionList;
    aSet: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxNameMetodic: TcxTextEdit;
    bbSetMetodic: TcxButton;
    cxLabel2: TcxLabel;
    cxDateBeg: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxDateEnd: TcxDateEdit;
    bbSetPeriod: TcxButton;
    Panel2: TPanel;
    bCancel: TcxButton;
    bOk: TcxButton;
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure bbSetMetodicClick(Sender: TObject);
    procedure bbSetPeriodClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetParam: TfrmSetParam;

implementation
uses fMain, fNazRgOne1, uPeriod;
{$R *.dfm}

procedure TfrmSetParam.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetParam.aSetExecute(Sender: TObject);
begin
  if cxNameMetodic.Tag = 0 then
    begin
      Application.MessageBox('Вы не выбрали методику! Вы можете выбрать методику, нажав на кнопку "Выбрать..."', 'Предупреждение', MB_OK+MB_ICONWARNING);
      bbSetMetodic.SetFocus;
    end else
    begin
      ModalResult := mrOk;
    end;
end;

procedure TfrmSetParam.bbSetMetodicClick(Sender: TObject);
begin
  Application.CreateForm(TfrmNazRg1, frmNazRg1);
  frmNazRg1.DoShowfrmNazRg;
  frmNazRg1.ShowModal;
  if frmNazRg1.ModalResult = mrOK then
    begin
      cxNameMetodic.Text := frmNazRg1.odsChild.FieldByName('NAMEMETODIC').AsString;
      cxNameMetodic.Tag := frmNazRg1.odsChild.FieldByName('FK_ID').AsInteger;
    end;
  frmNazRg1.Free;
end;

procedure TfrmSetParam.bbSetPeriodClick(Sender: TObject);
begin
  with TfrmParamDate.Create(Self) do
    begin
      if Execute then
        begin
      if ModalResult = MrOK then
        begin
          cxDateBeg.Date := Period.First;
          cxDateEnd.Date := Period.Last; 
        end;
        end;
    Free;
  end;
end;

end.
