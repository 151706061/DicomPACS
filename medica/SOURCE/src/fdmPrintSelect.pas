unit fdmPrintSelect;

interface

uses
  SysUtils, Classes, Menus, frxClass, frxExportXLS,
  frXMLExl, frxExportXML, frxExportODF, FR_Class, frOLEExl;

type
  TPageOrientation = ( poPortrait, poLandscape, poNone); // TPrinterOrientation

  TdmPrintSelect = class(TDataModule)
    pmPrintSelect: TPopupMenu;
    miPrintToExcel: TMenuItem;
    miPrintToFastReport: TMenuItem;
    frxXLSExport1: TfrxXLSExport;
    frOLEExcelExport1: TfrOLEExcelExport;
    frxXMLExport1: TfrxXMLExport;
    frXMLExcelExport1: TfrXMLExcelExport;
    frxODSExport1: TfrxODSExport;
    frxODTExport1: TfrxODTExport;
    pmOrientationSelect: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure miPrintToExcelClick(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    FPrintFlag : Integer;
    fPageOrientation : TPageOrientation;
    procedure SetPrintFlag(const Value: Integer); // флаг печати - 1 - в эксель, 2 - в фастрепорт, 0 - ничего не печатаем
  public
    { Public declarations }
    property PrintFlag:Integer  read FPrintFlag write SetPrintFlag;
    property PageOrientation : TPageOrientation read fPageOrientation write fPageOrientation;
  end;

  // экспорт отчета в указанный файл в каталог Reports (рядом с ехе-шником приложения)
  // aFileName - это только имя файла, без пути
  procedure ExportFRToExcel( var aReport : TfrReport;  const aFileName : string ); overload;
  procedure ExportFRToExcel( var aReport : TfrxReport; const aFileName : string ); overload;
  procedure ExportFRToFilter( var aReport : TfrReport;  const aFileName : string; aFilter : TfrExportFilter); overload;
  procedure ExportFRToFilter( var aReport : TfrxReport;  const aFileName : string; aFilter : TfrxCustomExportFilter); overload;

  function PrepareFilePath(const aFileName : string ) : string;

var
  dmPrintSelect: TdmPrintSelect;

implementation
uses Forms, comobj, uGlobalConst, windows, Dialogs;

{$R *.dfm}
                                               
function PrepareFilePath(const aFileName : string ) : string;
var
  CurPath : string;
  i, Len : integer;
begin
  CurPath := IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))+'Reports\';
  CreateDir(CurPath);
  Len := Length( aFileName );
  for i:= 1 to Len do
    if aFileName[i] in['\','/',':','*','?','<','>','|'] then CurPath := CurPath + '_' else CurPath := CurPath + aFileName[i];
//  CurPath := CurPath + FExcelFileName;
  DeleteFile(PChar(CurPath));
  Result := CurPath;
end;

procedure TdmPrintSelect.miPrintToExcelClick(Sender: TObject);
begin
  PrintFlag := TMenuItem(Sender).Tag;
end;

procedure TdmPrintSelect.N1Click(Sender: TObject);
begin
  fPageOrientation := poPortrait;
end;

procedure TdmPrintSelect.N2Click(Sender: TObject);
begin
  fPageOrientation := poLandscape;
end;

procedure TdmPrintSelect.SetPrintFlag(const Value: Integer);
begin
  FPrintFlag := Value;
end;

procedure TdmPrintSelect.DataModuleCreate(Sender: TObject);
begin
  PrintFlag := 0;
  fPageOrientation := poNone;
end;

procedure ExportFRToExcel( var aReport : TfrReport; const aFileName : string);
var i, len:Integer;
  Excel : Variant;
  s : string;
begin
  //Если не стоит печать в Open Office
  if not ((ReadMedotradePrintDocLocal() = '0') or ((ReadMedotradePrintDocLocal() = '') and (ReadMedotradePrintDocGlobal() = '0'))) then
  begin
    s :=  PrepareFilePath(aFileName);
    dmPrintSelect.frOLEExcelExport1.OpenExcelAfterExport := False;

    try
      aReport.ExportTo( dmPrintSelect.frOLEExcelExport1, s );
    except
      MessageDlg('MS Excel не установлен на компьютере !', mtWarning, [mbOK], 0);
      exit;
    end;
    dmPrintSelect.frOLEExcelExport1.OpenExcelAfterExport := True;

    try
      Excel:=CreateOleObject('Excel.Application');
    except
      MessageDlg('MS Excel не установлен на компьютере !', mtWarning, [mbOK], 0);
      exit;
    end;
    Excel.Workbooks.Open(s);

//Excel.Visible:=True;
   { for i := 1 to 100 do
    begin
      len:=Excel.ActiveSheet.Columns[i].ColumnWidth ; // *0.98
      Excel.ActiveSheet.Columns[i].ColumnWidth := len ;
    end; }
  //  Excel.ActiveSheet.Columns[1].ColumnWidth := 200;

    Excel.ActiveSheet.PageSetup.FooterMargin := Excel.ActiveSheet.PageSetup.BottomMargin - 7;
   // Excel.ActiveSheet.PageSetup.RightMargin := Excel.ActiveSheet.PageSetup.RightMargin + 10;
   // Excel.ActiveSheet.PageSetup.FitToPagesWide := 1;
    Excel.ActiveSheet.PageSetup.LeftFooter := '&"Arial,обычный"&7' + ReadMedotradeSign();
    Excel.ActiveSheet.PageSetup.Zoom := 90;
    Excel.Visible:=True;
  end;
end;

procedure ExportFRToExcel( var aReport : TfrxReport; const aFileName : string );
var
  Excel : Variant;
begin
  //Если стоит печать в Open Office
  if ((ReadMedotradePrintDocLocal() = '0') or ((ReadMedotradePrintDocLocal() = '') and (ReadMedotradePrintDocGlobal() = '0'))) then
  begin
    dmPrintSelect.frxODSExport1.FileName := PrepareFilePath(aFileName);
    dmPrintSelect.frxODSExport1.OpenAfterExport := False;
    aReport.Export( dmPrintSelect.frxODSExport1 );
    dmPrintSelect.frxODSExport1.OpenAfterExport := True;
  end
  else
  begin
    dmPrintSelect.frxXLSExport1.FileName := PrepareFilePath(aFileName);
    //  dmPrintReports.frxXMLExport1.FileName := PrepareFilePath(aFileName);
    dmPrintSelect.frxXLSExport1.OpenExcelAfterExport := False;
    aReport.Export( dmPrintSelect.frxXLSExport1 );
    dmPrintSelect.frxXLSExport1.OpenExcelAfterExport := True;

    try
      Excel:=CreateOleObject('Excel.Application');
    except
      MessageDlg('MS Excel не установлен на компьютере !', mtWarning, [mbOK], 0);
      exit;
    end;
    Excel.Workbooks.Open(dmPrintSelect.frxXLSExport1.FileName);
    Excel.ActiveSheet.PageSetup.FooterMargin := Excel.ActiveSheet.PageSetup.BottomMargin - 7;
    Excel.ActiveSheet.PageSetup.LeftFooter := '&"Arial,обычный"&7' + ReadMedotradeSign();
    Excel.Visible:=True;
    //  aReport.Export( dmPrintReports.frxXMLExport1 );
  end;
end;

procedure ExportFRToFilter( var aReport : TfrReport;  const aFileName : string; aFilter : TfrExportFilter); overload;
begin
  aReport.ExportTo( aFilter, PrepareFilePath(aFileName) );
end;

procedure ExportFRToFilter( var aReport : TfrxReport;  const aFileName : string; aFilter : TfrxCustomExportFilter); overload;
begin
  aFilter.FileName := PrepareFilePath(aFileName);
  aReport.Export(aFilter);
end;

end.
 