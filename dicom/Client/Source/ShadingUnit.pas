unit ShadingUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, dxSkinsCore, dxSkinsDefaultPainters,
  cxControls, cxContainer, cxEdit, cxTextEdit, Menus, cxLookAndFeelPainters,
  cxButtons, ActnList;

type
  TShadingForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit4: TcxTextEdit;
    bOK: TcxButton;
    bCancel: TcxButton;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TShadingForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TShadingForm.aSaveExecute(Sender: TObject);
begin
  ModalResult := MrOk;
end;

end.
