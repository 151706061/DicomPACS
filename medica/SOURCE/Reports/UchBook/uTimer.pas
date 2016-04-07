unit uTimer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfTimer = class(TForm)
    Panel1: TPanel;
    Timer: TTimer;
    Timer1: TTimer;
    procedure TimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTimer: TfTimer;
  strCap: TStringList;
  i     : integer;

implementation

uses uUchBook;

{$R *.dfm}

procedure TfTimer.FormShow(Sender: TObject);
begin
  strCap := TStringList.Create;
  strCap.Clear;
  strCap.Add('Идёт сбор данных');
  strCap.Add('Идёт сбор данных.');
  strCap.Add('Идёт сбор данных..');
  strCap.Add('Идёт сбор данных...');
  i := 0;
  Timer.Enabled := true;
  Timer1.Enabled := true;
end;

procedure TfTimer.Timer1Timer(Sender: TObject);
begin
  Panel1.Caption := strCap.Strings[i];
  inc(i);
  if i >= 4 then i := 0;  
end;

procedure TfTimer.TimerTimer(Sender: TObject);
begin
  with frmUchBook do begin
    //Проверяем книгу учета (удаляем лишнее, добавляем новое)
    Screen.Cursor := crSQLWait;
    oqUchBookCreate.SetVariable('pDate1',dDate1);
    oqUchBookCreate.SetVariable('pDate2',dDate2);
    oqUchBookCreate.Execute;
    Screen.Cursor := crDefault;
    os.Commit;

    //Инициалицируем список Медикаментов
    odsMedic.Open;
    odsMedic.First;
    lcbMedic.EditValue := StrToInt(IniReadString(iniFileName,'Params','lcbMedic',IntToStr(odsMedic.FieldByName('MEDICID').AsInteger)));

    // Инициализируем период для подсчета остатка
    oqInitMOGroup.SetVariable('pDate2',dDate1);   
    oqInitMOGroup.SetVariable('NMO_GROUP',oqInitMO.GetVariable('nMO_GROUP'));
    oqInitMOGroup.Execute;

    //Находим остаток по медикаменту на начало периода
    odsOstNach.Close;
    odsOstNach.SetVariable('pMedic',lcbMedic.EditValue);
    odsOstNach.Open;
    nGlobalOst := odsOstNach.FieldByName('fn_kolost').AsFloat;

    //Получаем новый список
    odsUchBook.Close;
    odsUchBook.SetVariable('pOstatok',nGlobalOst);
    odsUchBook.SetVariable('pMedic',lcbMedic.EditValue);
    odsUchBook.SetVariable('pDate1',dDate1);
    odsUchBook.SetVariable('pDate2',dDate2);
    odsUchBook.Open;
    odsUchBook.Refresh;
  end;
  
  Timer.Enabled := false;
  Timer1.Enabled := false;
  strCap.Free;
  Self.Close;
end;

end.
