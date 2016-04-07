unit fModuleInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxStyles, cxGraphics, cxEdit, dxSkinsCore, dxSkinCaramel,
  dxSkinOffice2007Green, cxVGrid, cxControls, cxInplaceContainer, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList, JclFileUtils;

type
  TfrmModuleInfo = class(TForm)
    Panel2: TPanel;
    cxVerticalGrid1: TcxVerticalGrid;
    catMain: TcxCategoryRow;
    rowModule: TcxEditorRow;
    rowVersion: TcxEditorRow;
    rowDeveloper: TcxEditorRow;
    bClose: TcxButton;
    al: TActionList;
    aClose: TAction;
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModuleInfo: TfrmModuleInfo;

implementation

{$R *.dfm}

procedure TfrmModuleInfo.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmModuleInfo.FormCreate(Sender: TObject);
var Ver : TJclFileVersionInfo;
begin
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    rowVersion.Properties.Value := Ver.FileVersion;
  finally
    Ver.Free;
  end;
end;

end.
