unit fSysInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, dxSkinsCore, ExtCtrls,
  cxControls, cxInplaceContainer, cxVGrid, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ActnList, cxButtonEdit, Clipbrd, dxSkinCaramel,
  dxSkinCoffee, dxSkinOffice2007Green;

type
  TfrmSysInfo = class(TForm)
    vgrSys: TcxVerticalGrid;
    Panel1: TPanel;
    cxButton1: TcxButton;
    al: TActionList;
    aClose: TAction;
    rowJurID: TcxEditorRow;
    rowFn_Stop: TcxEditorRow;
    bDefList: TcxButton;
    rowDrvID1: TcxEditorRow;
    rowDrvID2: TcxEditorRow;
    procedure aCloseExecute(Sender: TObject);
    procedure rowJurIDEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure bDefListClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSysInfo: TfrmSysInfo;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSysInfo.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSysInfo.bDefListClick(Sender: TObject);
begin
  frmMain.tvJournal.RestoreFromRegistry('\SoftWare\TaxiService\Disp\TVJOURNALDefault'+IntToStr(frmMain.pSOTRID), False, False, [], 'TVJOURNAL');
end;

procedure TfrmSysInfo.rowJurIDEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  Clipboard.AsText := rowJurID.Properties.Value;
end;

end.
