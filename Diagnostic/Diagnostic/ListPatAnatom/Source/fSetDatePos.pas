unit fSetDatePos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, Menus, cxLookAndFeelPainters,
  ActnList, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxControls, cxContainer, cxEdit, cxLabel, dxSkinOffice2007Green,
  ExtCtrls;

type
  TfrmSetDatePos = class(TForm)
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    deDatePos: TcxDateEdit;
    bOK: TcxButton;
    cxButton1: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetDatePos: TfrmSetDatePos;

implementation

{$R *.dfm}

procedure TfrmSetDatePos.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetDatePos.aOkExecute(Sender: TObject);
begin
  if (deDatePos.Text = '') or (deDatePos.Text = '0') or (deDatePos.Text = '30.12.1899') then
    begin
      MessageDlg('Внимание!'+#13+#10+'Не указана или неправильно указана дата поступления!', mtWarning, [mbOK], 0);
      deDatePos.SetFocus;
      exit;
    end;

  ModalResult := mrOk;
end;

end.
