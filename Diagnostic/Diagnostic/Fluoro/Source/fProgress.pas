unit fProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinsDefaultPainters, cxLabel, cxControls,
  cxContainer, cxEdit, cxProgressBar, dxSkinOffice2007Green;

type
  TfrmProgress = class(TForm)
    Shape2: TShape;
    cxProgressBar1: TcxProgressBar;
    cxLabel1: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProgress: TfrmProgress;

implementation

{$R *.dfm}

end.
