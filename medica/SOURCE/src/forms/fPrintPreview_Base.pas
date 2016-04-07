unit fPrintPreview_Base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdmMain, ComCtrls, ToolWin;

type
  TfmPrintPreview_Base = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbuRepaint: TToolButton;
    tbuExcel: TToolButton;
    ToolButton7: TToolButton;
    tbuPrint: TToolButton;
    tbuPrintSettings: TToolButton;
    ToolButton2: TToolButton;
    tbuClose: TToolButton;
    procedure tbuCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrintPreview_Base: TfmPrintPreview_Base;

implementation

{$R *.dfm}

procedure TfmPrintPreview_Base.tbuCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfmPrintPreview_Base.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
