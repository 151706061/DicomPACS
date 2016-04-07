unit UnMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxControls, cxSplitter, ActnList, dxBar, dxBarExtItems,
  cxClasses;

type
  TForm1 = class(TForm)
    paLeft: TPanel;
    cxSplitter2: TcxSplitter;
    Panel2: TPanel;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarDockControl1: TdxBarDockControl;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    ActionList1: TActionList;
    aRefresh: TAction;
    aExit: TAction;
    aEdit: TAction;
    procedure cxSplitter2BeforeClose(Sender: TObject; var AllowClose: Boolean);
    procedure cxSplitter2BeforeOpen(Sender: TObject; var NewSize: Integer;
      var AllowOpen: Boolean);
    procedure aRefreshExecute(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.aEditExecute(Sender: TObject);
begin // edit

end;

procedure TForm1.aExitExecute(Sender: TObject);
begin  // exit

end;

procedure TForm1.aRefreshExecute(Sender: TObject);
begin  // refresh

end;

procedure TForm1.cxSplitter2BeforeClose(Sender: TObject;
  var AllowClose: Boolean);
begin
  paLeft.Visible := False;
end;

procedure TForm1.cxSplitter2BeforeOpen(Sender: TObject; var NewSize: Integer;
  var AllowOpen: Boolean);
begin
  paLeft.Visible := True;
end;

end.
