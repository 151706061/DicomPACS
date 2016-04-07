unit fSetDateFG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls, cxContainer,
  cxEdit, cxLabel, dxSkinsCore, dxSkinOffice2007Green, ExtCtrls;

type
  TfrmSetDateFG = class(TForm)
    al: TActionList;
    aSet: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    deDate: TcxDateEdit;
    bbOk: TcxButton;
    bbCancel: TcxButton;
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetDateFG: TfrmSetDateFG;

implementation

{$R *.dfm}

procedure TfrmSetDateFG.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetDateFG.aSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetDateFG.FormCreate(Sender: TObject);
begin
  deDate.Date := Date;
end;

end.
