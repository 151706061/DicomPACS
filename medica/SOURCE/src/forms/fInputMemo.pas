unit fInputMemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ActnList, ImgList, ExtCtrls, StdCtrls;

type
  TfrmInputMemo = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    alOtmena: TActionList;
    ToolButton1: TToolButton;
    acApply: TAction;
    acCancel: TAction;
    ToolButton2: TToolButton;
    Me: TMemo;
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FAOwner: TControl;
    FReadOnly: Boolean;
    FBorder : Boolean;
    procedure SetAOwner(const Value: TControl);
    procedure SetReadOnly(const Value: Boolean);
    { Private declarations }
  public
    property AOwner : TControl read FAOwner write SetAOwner;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    { Public declarations }
  end;

//var
//  frmInputMemo: TfrmInputMemo;

function GetMemoText(pText: String; pOwner: TControl = nil;
  pReadOnly: Boolean = False; pFormCaption : string = ''; pBorder : Boolean = false): String;

implementation

uses fdmMain;

{$R *.DFM}

function GetMemoText(pText: String; pOwner: TControl = nil;
  pReadOnly: Boolean = False; pFormCaption : string = ''; pBorder : Boolean = false): String;
var frmInputMemo: TfrmInputMemo;
begin
  frmInputMemo := TfrmInputMemo.Create(nil);
  try
    frmInputMemo.ReadOnly := pReadOnly;
    frmInputMemo.Caption := pFormCaption;
    frmInputMemo.FBorder := pBorder;
    frmInputMemo.AOwner := pOwner;
    frmInputMemo.Me.Text := pText;

//    frmInputMemo.ShowModal; -- а нахера ж тогда на этой форме кнопки ОК и Отмена? Креатиф не говно, но аффтар мудаг
    if frmInputMemo.ShowModal = mrOk then // делаем правильно Воронов О.А.
      Result := frmInputMemo.Me.Text
    else
      Result := pText;
  finally
    frmInputMemo.Free;
  end;
end;

procedure TfrmInputMemo.acApplyExecute(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfrmInputMemo.acCancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfrmInputMemo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmInputMemo.SetAOwner(const Value: TControl);
var MyPoint: TPoint;
    Ycoord : Integer;
begin
  FAOwner := Value;
  if Assigned(FAOwner) then
  begin
    //отключить бордерс
    if not FBorder then
    begin
      SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle,GWL_STYLE) and not WS_CAPTION);
      Self.Height := Self.ClientHeight;

      MyPoint := FAOwner.ClientToScreen(Point(0,0));

      if MyPoint.y + Self.Height > Screen.Height then
        Ycoord := MyPoint.y - Self.Height
      else
        Ycoord := MyPoint.y + FAOwner.Height;

      Self.Left := MyPoint.x;
      Self.Top := Ycoord;
      if Self.Width < FAOwner.Width then
        Self.Width := FAOwner.Width;
    end;        
  end;
end;

procedure TfrmInputMemo.SetReadOnly(const Value: Boolean);
begin
  FReadOnly := Value;
  me.ReadOnly := Value;
  acApply.Enabled := not Value;
end;

end.
