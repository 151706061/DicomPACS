unit fInputStr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfmInputStr = class(TForm)
    btOk: TBitBtn;
    btCancel: TBitBtn;
    edStr: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmInputStr: TfmInputStr;

implementation

{$R *.dfm}

end.
