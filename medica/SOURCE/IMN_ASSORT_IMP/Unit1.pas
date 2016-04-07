unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    XlApp, XlBook, XlSheet, XlSheets : Variant; // Excel

    function  OpenExcelFile( aFileName: string ): Boolean;
    procedure CloseExcelFile;
    procedure GetMedics;
    procedure GetMedicsPushino;

  end;

var
  Form1: TForm1;

implementation
uses ComObj;

{$R *.dfm}
function TForm1.OpenExcelFile(aFileName: string): Boolean;
begin
  try
    if not VarIsEmpty(XlApp) then  // если эксель уже открыт
    begin   // We are connected with MsExcel
      XlApp.DisplayAlerts := False; // Discard unsaved changes
      CloseExcelFile; // Close MsExcel
    end;

    XlApp  := CreateOleObject('Excel.Application'); // создаем объект эксель

    if VarType(XlApp) <> VarDispatch then
    begin  // If we are not connected with MsExcel
      ShowMessage('MS Excel not this installed');
      Result := False;
      Exit;
    end;

    XlBook := XlApp.WorkBooks.Open( aFileName );
//    XlApp.Visible := True;
    XlSheet  := XlApp.WorkBooks[1].Sheets[1]; // Active Sheet
    XlSheets := XlApp.Sheets; // Array of Sheets
    Result := True;

  except
    CloseExcelFile;
    Result := False;
    ShowMessage('Error when opening OLE with MsExcel');
  end;
end;
//------------------------------------------------------------------------------
procedure TForm1.Button2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    OpenExcelFile(OpenDialog1.FileName);
    GetMedicsPushino;
    CloseExcelFile;
  end;
end;

procedure TForm1.CloseExcelFile;
begin
  // If MsExcel in a manual way has closed, it will generate an exception
  if not VarIsEmpty(XlApp) then begin   // We are connected with MsExcel
    // XlApp.ActiveWorkBook.SaveAs('MySheet'); // For save the WorkBook
    XlApp.DisplayAlerts := False; // Discard unsaved changes
    XlApp.Quit; // Close MsExcel
    VarClear(XlApp);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    OpenExcelFile(OpenDialog1.FileName);
    GetMedics;
    CloseExcelFile;
  end;
end;

procedure TForm1.GetMedics;
var
  FN_Row, FN_Col, i : Integer;
  IsEmpty : Boolean;

  MedicName     : string;
  MedicsUpEdIzm : string;
  MedicsKol, MedicsPrice : Double;
  MedicsSumm : Double;

begin
  Memo1.Clear;
  FN_Row := 1;
  repeat
    MedicsUpEdIzm := '';
    MedicName := XlSheet.Cells[ FN_Row, 1 ].Value;
    if MedicName = '' then Exit;
    i := Length(MedicName);
    if (i > 0)and(MedicName[Length(MedicName)] = ')') then
    begin
      while (i > 0)and(MedicName[i]<>'(') do
        Dec(i);
      if i > 0 then MedicsUpEdIzm := Copy(MedicName, i+1, Length(MedicName)-i-1);
    end;

    MedicsPrice := StrToFloat(StringReplace( XlSheet.Cells[ FN_Row, 2 ].Value, '.', ',', []));

//    if TryStrToFloat(StringReplace(XlSheet.Cells[ FN_Row, 6 ].Value,'.', ',', []) , MedicsSumm) then
    if (TryStrToFloat(StringReplace(XlSheet.Cells[ FN_Row+1, 6 ].Value,'.', ',', []) , MedicsKol) = False) then
      MedicsKol := 0;

    Self.Caption := 'Строк считано: '+IntToStr(FN_Row);
    Application.ProcessMessages;
    if MedicName <> '' then
    begin
      Memo1.Lines.Add(MedicName+#9+MedicsUpEdIzm+#9+FloatToStr(MedicsPrice)+#9+FloatToStr(MedicsKol)+#9);
    end;

    Inc( FN_Row, 2 );
  until MedicName = '';
end;

procedure TForm1.GetMedicsPushino;
var
  FN_Row, FN_Col, i : Integer;
  IsEmpty : Boolean;

  MedicName     : string;
  MedicsUpEdIzm : string;
  FinSource, NomenNum, Serial : string;

  MedicsKol, MedicsPrice : Double;
  MedicsSumm : Double;

begin
  Memo1.Clear;
  FN_Row := 1;
  repeat
    MedicsUpEdIzm := '';
    FinSource := ''; NomenNum := '';
    Serial := '';
    MedicName := XlSheet.Cells[ FN_Row, 1 ].Value;
    if MedicName = '' then Exit;

    NomenNum := XlSheet.Cells[ FN_Row+1, 1 ].Value;
    FinSource := Copy(NomenNum, Pos('(', NomenNum)+1, 9999);
    Delete(FinSource, Length(FinSource), 1);
    Delete(NomenNum, Length(NomenNum) - Length(FinSource)-1, 9999);

    MedicsUpEdIzm :=  XlSheet.Cells[ FN_Row+2, 8 ].Value;
    Serial :=  XlSheet.Cells[ FN_Row+2, 5 ].Value;

    if (TryStrToFloat(StringReplace(XlSheet.Cells[ FN_Row+2, 9 ].Value,'.', ',', []) , MedicsKol) = False) then
      MedicsKol := 0;

    if TryStrToFloat(StringReplace( XlSheet.Cells[ FN_Row+2, 10 ].Value, '.', ',', []), MedicsSumm) then
    begin
      if (MedicsSumm > 0) and (MedicsKol > 0) then
        MedicsPrice := MedicsSumm / MedicsKol
      else
        TryStrToFloat(StringReplace( XlSheet.Cells[ FN_Row+2, 11 ].Value, '.', ',', []), MedicsPrice);
    end
    else
      TryStrToFloat(StringReplace( XlSheet.Cells[ FN_Row+2, 11 ].Value, '.', ',', []), MedicsPrice);

    Self.Caption := 'Строк считано: '+IntToStr(FN_Row);
    Application.ProcessMessages;
    if MedicName <> '' then
    begin
      Memo1.Lines.Add(MedicName +#9+ MedicsUpEdIzm +#9+Serial +#9+ FloatToStr(MedicsKol)+#9+ FloatToStr(MedicsPrice)  +#9+ FinSource +#9+ ''''+NomenNum);
    end;

    Inc( FN_Row, 3 );
  until MedicName = '';
end;

end.
 