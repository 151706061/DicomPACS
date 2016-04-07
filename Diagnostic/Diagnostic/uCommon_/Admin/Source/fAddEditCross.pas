unit fAddEditCross;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, cxLookAndFeelPainters, dxSkinsCore, dxSkinCaramel,
  dxSkinOffice2007Green, cxGraphics, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxControls, cxContainer,
  cxEdit, cxLabel, StdCtrls, cxButtons, ActnList, DB, OracleData;

type
  TfrmAddEditCross = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bOk: TcxButton;
    cxButton1: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    lcbStreet1: TcxLookupComboBox;
    lcbStreet2: TcxLookupComboBox;
    lcbRaion: TcxLookupComboBox;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    odsStreet1: TOracleDataSet;
    dsStreet1: TDataSource;
    dsStreet2: TDataSource;
    odsStreet2: TOracleDataSet;
    dsRaion: TDataSource;
    odsRaion: TOracleDataSet;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditCross: TfrmAddEditCross;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAddEditCross.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditCross.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAddEditCross.FormCreate(Sender: TObject);
begin
  if odsStreet1.Active = False then
    odsStreet1.Active := True;
  if odsStreet2.Active = False then
    odsStreet2.Active := True;
  if odsRaion.Active = False then
    odsRaion.Active := True;
end;

end.
