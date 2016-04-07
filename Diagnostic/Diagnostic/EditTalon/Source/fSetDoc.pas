unit fSetDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxDBLookupComboBox, cxLabel,
  cxCalendar, dxSkinsCore, dxSkinsDefaultPainters, Menus, cxLookAndFeelPainters,
  cxVGrid, StdCtrls, cxButtons, cxControls, cxInplaceContainer, ActnList,
  cxTextEdit, DB, OracleData, cxButtonEdit, cxCheckBox, dxSkinOffice2007Green,
  ExtCtrls;

type
  TfrmSetDoc = class(TForm)
    cxVerticalGrid1: TcxVerticalGrid;
    catDoc: TcxCategoryRow;
    rowTypeDoc: TcxEditorRow;
    rowSer: TcxEditorRow;
    rowNum: TcxEditorRow;
    rowKem: TcxEditorRow;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    dsType: TDataSource;
    odsType: TOracleDataSet;
    Panel1: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetDoc: TfrmSetDoc;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetDoc.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetDoc.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetDoc.FormCreate(Sender: TObject);
begin
  if odsType.Active = False then
    odsType.Active := True;
end;

end.
