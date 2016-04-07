unit fPrintPreview_FR2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fPrintPreview_Base, ExtCtrls, FR_View, FR_Class, ComCtrls, ToolWin, fMainForm;

type
  TfmPrintPreview_FR2 = class(TfmPrintPreview_Base)
    frPreview1: TfrPreview;
    procedure tbuRepaintClick(Sender: TObject);
    procedure tbuExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbuPrintClick(Sender: TObject);
  private
    { Private declarations }
    FReport : TfrReport;
    FExcelFileName : string;
  public
    { Public declarations }
  end;

 procedure  DoShowMDIChildReport( frReport : TfrReport; aExcelFileName : string = '' );

var
  fmPrintPreview_FR2: TfmPrintPreview_FR2;

implementation
uses
  fdmMain, fdmPrintReports, fdmPrintSelect;
{$R *.dfm}
procedure  DoShowMDIChildReport( frReport : TfrReport; aExcelFileName : string = '' );
begin
  frReport.PrepareReport;
  frmMain.CreateChild(TfmPrintPreview_FR2, fmPrintPreview_FR2);
  fmPrintPreview_FR2.FReport := frReport;
  fmPrintPreview_FR2.FExcelFileName := aExcelFileName;
  fmPrintPreview_FR2.FReport.Preview := fmPrintPreview_FR2.frPreview1;
  fmPrintPreview_FR2.FReport.ShowPreparedReport;
end;


procedure TfmPrintPreview_FR2.tbuRepaintClick(Sender: TObject);
begin
  inherited;
  frPreview1.Repaint;
end;

procedure TfmPrintPreview_FR2.tbuExcelClick(Sender: TObject);
var
  CurPath : string;
begin
  inherited;
  CurPath := IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))+'Reports\';
  CreateDir(CurPath);
  CurPath := CurPath + FExcelFileName;
  DeleteFile(CurPath);
  FReport.ExportTo( dmPrintSelect.frOLEExcelExport1, CurPath );
end;

procedure TfmPrintPreview_FR2.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  FReport.Preview := nil;
  inherited;
end;

procedure TfmPrintPreview_FR2.tbuPrintClick(Sender: TObject);
begin
  inherited;
  FReport.PrintPreparedReport('', 1, False, frAll);
end;

end.
