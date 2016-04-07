unit fAddNaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinOffice2007Green, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxCheckBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, OracleData,
  cxContainer, cxLabel, ExtCtrls, cxTextEdit, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ActnList;

type
  TfrmAddNaz = class(TForm)
    dsList: TDataSource;
    odsList: TOracleDataSet;
    odsListFL_CHECK: TFloatField;
    odsListFC_NAME: TStringField;
    odsListFC_NAME_UP: TStringField;
    grList: TcxGrid;
    tvList: TcxGridDBTableView;
    tvListCheck: TcxGridDBColumn;
    tvListName: TcxGridDBColumn;
    tvListID: TcxGridDBColumn;
    grListLevel1: TcxGridLevel;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teFilter: TcxTextEdit;
    Panel2: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    odsListFK_ID: TFloatField;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddNaz: TfrmAddNaz;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmAddNaz.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddNaz.aOkExecute(Sender: TObject);
begin
  if Length(teFilter.Text) > 0 then
    teFilter.Clear;
  odsList.Filtered := False; 
  ModalResult := mrOk;
end;

procedure TfrmAddNaz.FormCreate(Sender: TObject);
begin
  if odsList.Active = False then
    odsList.Active := True;  
end;

procedure TfrmAddNaz.FormShow(Sender: TObject);
begin
  teFilter.SetFocus;
end;

procedure TfrmAddNaz.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmAddNaz.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmAddNaz.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  odsList.Filtered := True;
  odsList.Filter := 'fc_name_up = ''*' + teFilter.Text + '*'' ';
end;

end.
