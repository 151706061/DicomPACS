unit uGetDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, Buttons;

type
  TfGetDate = class(TForm)
    chbUseDefaultDateBeg: TCheckBox;
    btOK: TBitBtn;
    de: TcxDateEdit;
    btCanel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGetDate: TfGetDate;

implementation

{$R *.dfm}

end.
