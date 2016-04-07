unit UnOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, dxSkinsCore, Medotrade, dxSkinOffice2007Black,
  dxSkinOffice2007Green, Menus, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxGroupBox, ComCtrls;

type
  TfOptions = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxLabel30: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxECHO: TcxButton;
    cxButton1: TcxButton;
    hkKadr: THotKey;
    hkStartVideo: THotKey;
    hkStopVideo: THotKey;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOptions: TfOptions;

implementation

{$R *.dfm}

procedure TfOptions.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then ModalResult := mrCancel;  
end;

end.
