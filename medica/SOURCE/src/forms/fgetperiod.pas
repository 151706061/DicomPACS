unit fgetperiod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, JvToolEdit, Buttons, ActnList, JvFormPlacement, ImgList,
  ComCtrls, ToolWin, HtmlHlp, JvComponentBase, JvExMask;

type
  TfrmGetPeriod = class(TForm)
    Panel1: TPanel;
    rbM1: TRadioButton;
    rbM2: TRadioButton;
    rbM3: TRadioButton;
    rbM4: TRadioButton;
    rbM5: TRadioButton;
    rbM6: TRadioButton;
    rbM7: TRadioButton;
    rbM8: TRadioButton;
    rbM9: TRadioButton;
    rbM10: TRadioButton;
    rbM11: TRadioButton;
    rbM12: TRadioButton;
    rbK1: TRadioButton;
    rbK2: TRadioButton;
    rbK3: TRadioButton;
    rbK4: TRadioButton;
    rbG1: TRadioButton;
    rbG2: TRadioButton;
    rbG3: TRadioButton;
    Panel2: TPanel;
    Label1: TLabel;
    dDate1: TJvDateEdit;
    dDate2: TJvDateEdit;
    Label2: TLabel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    FormStorage1: TJvFormStorage;
    aSave: TAction;
    aCancel: TAction;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure rbAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmGetPeriod: TfrmGetPeriod;

implementation

{$R *.DFM}

uses Oracle, fdmMain;

procedure TfrmGetPeriod.rbAllClick(Sender: TObject);
var
  cName: string;
  dDate: tdate;
  nMon: word;
  nYear: word;
begin
  cName := uppercase(tcomponent(Sender).getnamepath);
  dDate := 0;
  decodedate(date, nYear, nMon, nMon);
  if cName = 'RBM1' then begin
    dDate := encodedate(nYear, 1, 1);
    nMon := 1
  end
  else if cName = 'RBM2' then begin
    dDate := encodedate(nYear, 2, 1);
    nMon := 1
  end
  else if cName = 'RBM3' then begin
    dDate := encodedate(nYear, 3, 1);
    nMon := 1
  end
  else if cName = 'RBM4' then begin
    dDate := encodedate(nYear, 4, 1);
    nMon := 1
  end
  else if cName = 'RBM5' then begin
    dDate := encodedate(nYear, 5, 1);
    nMon := 1
  end
  else if cName = 'RBM6' then begin
    dDate := encodedate(nYear, 6, 1);
    nMon := 1
  end
  else if cName = 'RBM7' then begin
    dDate := encodedate(nYear, 7, 1);
    nMon := 1
  end
  else if cName = 'RBM8' then begin
    dDate := encodedate(nYear, 8, 1);
    nMon := 1
  end
  else if cName = 'RBM9' then begin
    dDate := encodedate(nYear, 9, 1);
    nMon := 1
  end
  else if cName = 'RBM10' then begin
    dDate := encodedate(nYear, 10, 1);
    nMon := 1
  end
  else if cName = 'RBM11' then begin
    dDate := encodedate(nYear, 11, 1);
    nMon := 1
  end
  else if cName = 'RBM12' then begin
    dDate := encodedate(nYear, 12, 1);
    nMon := 1
  end
  else if cName = 'RBK1' then begin
    dDate := encodedate(nYear, 1, 1);
    nMon := 3
  end
  else if cName = 'RBK2' then begin
    dDate := encodedate(nYear, 4, 1);
    nMon := 3
  end
  else if cName = 'RBK3' then begin
    dDate := encodedate(nYear, 7, 1);
    nMon := 3
  end
  else if cName = 'RBK4' then begin
    dDate := encodedate(nYear, 10, 1);
    nMon := 3
  end
  else if cName = 'RBG1' then begin
    dDate := encodedate(nYear, 1, 1);
    nMon := 6
  end
  else if cName = 'RBG2' then begin
    dDate := encodedate(nYear, 7, 1);
    nMon := 6
  end
  else if cName = 'RBG3' then begin
    dDate := encodedate(nYear, 1, 1);
    nMon := 12
  end;
  Self.dDate1.date := dDate;
  Self.dDate2.date := incmonth(dDate, nMon) - 1;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
begin
  Self.rbM1.checked := true;
end;

procedure TfrmGetPeriod.aSaveExecute(Sender: TObject);
  function GetLastDateInMonth(os: TOracleSession): TDateTime;
  var oq: TOracleQuery;
  begin
    Result := 47218;
    oq := TOracleQuery.Create(nil);
    try
      oq.Session := os;
      oq.Sql.Text := 'SELECT TRUNC(LAST_DAY(SYSDATE)) AS LASTDAY FROM DUAL';
      try
        oq.Execute;
        Result := oq.FieldAsDate(0);
      except
      end;
    finally
      oq.Free;
    end;
  end;
begin
  try
    dDate1.CheckValiddate;
  except
    on EConvertError do
    begin
      MessageBox(Self.Handle, 'Неверно введена начальная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate1.SetFocus;
      Exit;
    end;
  end;
  try
    dDate2.CheckValiddate;
  except
    on EConvertError do begin
      MessageBox(Self.Handle, 'Неверно введена конечная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate2.SetFocus;
      Exit;
    end;
  end;
  if dDate1.date > dDate2.date then begin
    MessageBox(Self.Handle, 'Неверно задан период', 'Ошибка', MB_OK + MB_ICONERROR);
    Self.dDate1.SetFocus;
    Exit;
  end;
  if (dDate2.date > GetLastDateInMonth(dmMain.os)) then
  begin
    MessageBox(Handle, 'Закрытие периода возможно в текущем, либо предыдущих месяцах!', 'Ошибка', MB_OK + MB_ICONERROR);
    dDate2.SetFocus;
    Exit;
  end;
  aSave.Enabled := False;
  
  ModalResult := mrOK;
end;

procedure TfrmGetPeriod.aCancelExecute(Sender: TObject);
begin
  Self.aSave.Enabled := False;
  Self.ModalResult := mrCancel;
end;

procedure TfrmGetPeriod.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Self.aSave.Enabled then
    if MessageBoxEx(Self.Handle, 'Вы хотите сохранить изменения?', 'Подтверждение', MB_YESNO + MB_ICONQUESTION,$0419 {Russian}) = mrYes then
      Self.aSave.Execute
    else
      Self.aCancel.Execute;
end;

function TfrmGetPeriod.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
	Result := False;
  try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0)
		else
			HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;

end;

end.
