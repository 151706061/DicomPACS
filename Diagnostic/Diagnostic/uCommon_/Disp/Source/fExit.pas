unit fExit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  dxSkinsCore, cxControls, cxContainer, cxEdit, cxLabel, IniFiles,
  ActnList, dxSkinCaramel, dxSkinCoffee, dxSkinOffice2007Green;

type
  TfrmExit = class(TForm)
    bContinue: TcxButton;
    bClose: TcxButton;
    bChange: TcxButton;
    Shape1: TShape;
    cxLabel1: TcxLabel;
    al: TActionList;
    aContinueWork: TAction;
    procedure bCloseClick(Sender: TObject);
    procedure bChangeClick(Sender: TObject);
    procedure aContinueWorkExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExit: TfrmExit;

implementation

uses fLogin, fMain;

{$R *.dfm}

procedure TfrmExit.bCloseClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmExit.aContinueWorkExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmExit.bChangeClick(Sender: TObject);
var Ini : TIniFile;
begin
  frmExit.Visible := False;
  ModalResult := mrCancel;
  frmMain.Visible := False;
  if (frmMain.DoLogin()) then
    begin
      Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Dispetcher.ini');
      try
        frmMain.DoTapi(IntToStr(Ini.ReadInteger('PHONE', 'PhoneNumber', -1)), frmMain.Phone);
        frmMain.DoTapi(IntToStr(Ini.ReadInteger('PHONE', 'PhoneNumber2', -1)), frmMain.Phone2);
        frmMain.DoParams;
        frmMain.pcOptions.ActivePageIndex := 0;
        frmMain.tAlarm.Enabled := True;
      finally
        Ini.Free;
      end;
    end else
    begin
      Application.Terminate();
      exit;
    end;
  frmMain.Visible := True;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

end.
