unit UnFrmFileBrowse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw;

type
  TfrmFileBrowse = class(TForm)
    wb1: TWebBrowser;
  private
    { Private declarations }
  public
    procedure ShowForm ( pFileName : string );
  end;

var
  frmFileBrowse: TfrmFileBrowse;

implementation

{$R *.dfm}

procedure TfrmFileBrowse.ShowForm ( pFileName : string );
begin
  wb1.Navigate( pFileName );
  frmFileBrowse.ShowModal;
end;

end.
