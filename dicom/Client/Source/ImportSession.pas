unit ImportSession;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Menus, cxLookAndFeelPainters, cxButtons, ActnList;

type
  TfrmSessions = class(TForm)
    lb: TListBox;
    Button1: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lMedium: TLabel;
    lDiscSize: TLabel;
    lUsedSpace: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    lFreeSpace: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    al: TActionList;
    aClose: TAction;
    aFiles: TAction;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aFilesExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSessions: TfrmSessions;

implementation

uses fCD, TreeView;

//uses unit1, TreeView;

{$R *.DFM}

procedure TfrmSessions.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then close;
end;

procedure TfrmSessions.aCloseExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmSessions.aFilesExecute(Sender: TObject);
begin
  if lb.ItemIndex = -1 then
  begin
    ShowMessage('Выберите сессию из списка!');
    exit;
  end;
  if lb.Items.Count > 0 then
  begin
    frmCD.mcdb.ClearAll;
    frmCD.mcdb.ImportSession(lb.ItemIndex+1, frmCD.mcdb.RootDir);
    frmTree := TfrmTree.Create(Self);
    frmTree.ShowModal;
  end;
end;

procedure TfrmSessions.Button1Click(Sender: TObject);
begin
  Close;
end;

end.

