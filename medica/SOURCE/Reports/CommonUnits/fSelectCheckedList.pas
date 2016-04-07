unit fSelectCheckedList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus, StdCtrls, CheckLst, IniFiles,
  cxLookAndFeelPainters, cxButtons, cxClasses, cxControls, Grids, ValEdit;

type
  TfmSelectCheckedList = class(TForm)
    buOk: TcxButton;
    buCancel: TcxButton;
    buEdit: TcxButton;
    CheckListBox1: TCheckListBox;
    buCheckAll: TcxButton;
    buUncheckAll: TcxButton;
    procedure buEditClick(Sender: TObject);
    procedure buCheckAllClick(Sender: TObject);
    procedure buUncheckAllClick(Sender: TObject);
    procedure CheckListBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FDefValue, FSectionName, FIniName : string;
    procedure LoadIniParams;
  public
    { Public declarations }
  end;

var
  fmSelectCheckedList: TfmSelectCheckedList;
// aSelectedStrings - в конце лишний энтер
function DoShowSelectCheckedList(var aSelectedStrings : string; const aDefValue : string = ''; const aFormCaption : string = 'Выберите из списка'; const aSectionName : string = ''; const aIniName : string = '') : integer; overload;
//function DoShowSelectCheckedList(aOwner : TComponent; var aSelectedStrings : string; const aDefValue : string = ''; const aFormCaption : string = 'Выберите из списка'; const aSectionName : string = ''; const aIniName : string = '') : integer;

implementation
{$R *.dfm}
uses fCheckedListEdit, fm_Select_MO;



function DoShowSelectCheckedList(var aSelectedStrings : string; const aDefValue : string = ''; const aFormCaption : string = 'Выберите из списка'; const aSectionName : string = ''; const aIniName : string = '') : integer;
var
  i : Integer;
begin
  fmSelectCheckedList := TfmSelectCheckedList.Create( Application );
  fmSelectCheckedList.Caption := aFormCaption;
  fmSelectCheckedList.FDefValue := aDefValue;
  if aIniName = '' then
    fmSelectCheckedList.FIniName := ChangeFileExt(Application.ExeName,'.ini') // дефолтовое имя ини-файла
  else fmSelectCheckedList.FIniName := aIniName;
  if aSectionName = '' then
    fmSelectCheckedList.FSectionName := fmSelectCheckedList.Name // дефолтовая секция
  else fmSelectCheckedList.FSectionName := aSectionName;

  fmSelectCheckedList.LoadIniParams;
  Result := fmSelectCheckedList.ShowModal;
  // формируем список выбранных строк
  aSelectedStrings := '';
  for i := 0 to fmSelectCheckedList.CheckListBox1.Items.Count - 1 do
    if fmSelectCheckedList.CheckListBox1.Checked[i] then aSelectedStrings := aSelectedStrings +fmSelectCheckedList.CheckListBox1.Items[i] +#13#10;

  fmSelectCheckedList.Free;
end;

procedure TfmSelectCheckedList.buEditClick(Sender: TObject);
begin
  DoShowCheckedListEdit( FDefValue, FSectionName, FIniName );
  LoadIniParams;
end;

procedure TfmSelectCheckedList.LoadIniParams;
var
	ini: TIniFile;
begin
  ini := TIniFile.Create( FIniName );
  CheckListBox1.Items.Text := StringToListStr( ini.ReadString(FSectionName, 'CheckedList', FDefValue) );
//  CheckListBox1.Items.Text := StringReplace( ini.ReadString(FSectionName, 'CheckedList', FDefValue), '|', #13#10, [rfReplaceAll] );
  ini.free;
end;

procedure TfmSelectCheckedList.buCheckAllClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to CheckListBox1.Items.Count - 1 do
    CheckListBox1.Checked[i] := True;
end;

procedure TfmSelectCheckedList.buUncheckAllClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to CheckListBox1.Items.Count - 1 do
    CheckListBox1.Checked[i] := False;
end;

procedure TfmSelectCheckedList.CheckListBox1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i : integer;

begin
  if Button = mbRight then
  begin
    i := 0;
    while (i < CheckListBox1.Items.Count)and(CheckListBox1.Selected[i]=False) do
      inc( i );

    if (i < CheckListBox1.Items.Count) then
      CheckListBox1.Items.Values[ CheckListBox1.Items.Names[i] ] := DoShowSelectMO_str( CheckListBox1.Items.Values[ CheckListBox1.Items.Names[i] ] ); 
  end;
//  fm_Select_MO
end;

end.

