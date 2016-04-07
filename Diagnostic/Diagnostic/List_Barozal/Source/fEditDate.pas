unit fEditDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinOffice2007Green, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit, cxLabel, Menus,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons;

type
  TfrmEditDate = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    deDate: TcxDateEdit;
    bOk: TcxButton;
    bCancel: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditDate: TfrmEditDate;

implementation

{$R *.dfm}

procedure TfrmEditDate.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEditDate.aOkExecute(Sender: TObject);
begin
  if (deDate.Text = '') or (deDate.Text = '0') or (deDate.Text = '30.12.1899') then
    begin
      Application.MessageBox('Вам необходимо указать дату!', 'Предупреждение!', MB_OK + MB_ICONWARNING);
      deDate.SetFocus;
      exit;
    end;
  if deDate.Date < StrToDateTime('01.01.1899') then
    begin
      Application.MessageBox('Проверьте правильность ввода даты!', 'Предупреждение!', MB_OK + MB_ICONWARNING);
      deDate.SetFocus;
      exit;
    end;
  ModalResult := mrOk;
end;

end.
