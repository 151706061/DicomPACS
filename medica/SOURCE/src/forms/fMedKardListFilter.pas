unit fMedKardListFilter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, JvFormPlacement,
  JvComponentBase;

type
  TfrmMedKardListFilter = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    al: TActionList;
    aChoose: TAction;
    aCancel: TAction;
    ToolButton2: TToolButton;
    FormStorage: TJvFormStorage;
    Panel1: TPanel;
    edFilter: TEdit;
    rgFilter: TRadioGroup;
    procedure aCancelExecute(Sender: TObject);
    procedure aChooseExecute(Sender: TObject);
    procedure rgFilterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmMedKardListFilter: TfrmMedKardListFilter;

implementation

uses fdmMain;

{$R *.DFM}

procedure TfrmMedKardListFilter.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmMedKardListFilter.aChooseExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmMedKardListFilter.rgFilterClick(Sender: TObject);
begin
  if TRadioGroup(Sender).ItemIndex > 0 then
    edFilter.Color := clWindow
  else
    edFilter.Color := clBtnFace;
  edFilter.Enabled := TRadioGroup(Sender).ItemIndex > 0;
end;

procedure TfrmMedKardListFilter.FormCreate(Sender: TObject);
begin
  rgFilterClick(rgFilter);
end;

procedure TfrmMedKardListFilter.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F5 then rgFilter.ItemIndex := 0
  else if Key = vk_F6 then rgFilter.ItemIndex := 1;
end;

end.
