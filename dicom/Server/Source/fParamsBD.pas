unit fParamsBD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList, dxSkinsCore,
  dxSkinsDefaultPainters, cxControls, cxContainer, cxEdit, cxLabel, cxTextEdit,
  cxMemo, cxImage, ExtDlgs, dxSkinscxPCPainter, cxGroupBox, cxPC,
  dxSkinOffice2007Green;

type
  TfrmParamsBD = class(TForm)
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    OpenDialog1: TOpenDialog;
    pcParam: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    JvPanel3: TJvPanel;
    cxImage2: TcxImage;
    cxLabel7: TcxLabel;
    cxGroupBox3: TcxGroupBox;
    tePathBD: TcxTextEdit;
    bPathBD: TcxButton;
    JvPanel2: TJvPanel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    Panel1: TPanel;
    bSave: TcxButton;
    bClose: TcxButton;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure bPathBDClick(Sender: TObject);
    procedure tePathBDPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamsBD: TfrmParamsBD;

implementation

{$R *.dfm}

procedure TfrmParamsBD.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmParamsBD.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmParamsBD.bPathBDClick(Sender: TObject);
begin
  OpenDialog1.Filter := '<Базы данных (*.gdb)|*.gdb';
  if OpenDialog1.Execute then
    tePathBD.Text := OpenDialog1.FileName;
end;

procedure TfrmParamsBD.FormCreate(Sender: TObject);
begin
  pcParam.HideTabs := True;
end;

procedure TfrmParamsBD.tePathBDPropertiesChange(Sender: TObject);
begin
  if tePathBD.Text <> '' then
    aSave.Enabled := True
  else
    aSave.Enabled := False;
end;

end.
