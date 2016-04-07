unit uDM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData;

type
  TfrmDM = class(TForm)
    dsRg1: TDataSource;
    odsRg1: TOracleDataSet;
    dsRg2: TDataSource;
    odsRg2: TOracleDataSet;
    dsRg3: TDataSource;
    odsRg3: TOracleDataSet;
    dsRg4: TDataSource;
    odsRg4: TOracleDataSet;
    dsRg5: TDataSource;
    odsRg5: TOracleDataSet;
    dsRg6: TDataSource;
    odsRg6: TOracleDataSet;
    dsRg7: TDataSource;
    odsRg7: TOracleDataSet;
    dsRg8: TDataSource;
    odsRg8: TOracleDataSet;
    dsRg9: TDataSource;
    odsRg9: TOracleDataSet;
    dsRg10: TDataSource;
    odsRg10: TOracleDataSet;
    dsRg11: TDataSource;
    odsRg11: TOracleDataSet;
    dsRg12: TDataSource;
    odsRg12: TOracleDataSet;
    dsRg13: TDataSource;
    odsRg13: TOracleDataSet;
    dsRg14: TDataSource;
    odsRg14: TOracleDataSet;
    dsRg15: TDataSource;
    odsRg15: TOracleDataSet;
    dsRg16: TDataSource;
    odsRg16: TOracleDataSet;
    dsRg17: TDataSource;
    odsRg17: TOracleDataSet;
    dsRg18: TDataSource;
    odsRg18: TOracleDataSet;
    dsRg19: TDataSource;
    odsRg19: TOracleDataSet;
    dsRg20: TDataSource;
    odsRg20: TOracleDataSet;
    dsRg21: TDataSource;
    odsRg21: TOracleDataSet;
    dsRg22: TDataSource;
    odsRg22: TOracleDataSet;
    dsRg23: TDataSource;
    odsRg23: TOracleDataSet;
    dsRg24: TDataSource;
    odsRg24: TOracleDataSet;
    dsRg25: TDataSource;
    odsRg25: TOracleDataSet;
    dsRg26: TDataSource;
    odsRg26: TOracleDataSet;
    dsRg27: TDataSource;
    odsRg27: TOracleDataSet;
    dsRg28: TDataSource;
    odsRg28: TOracleDataSet;
    dsRg29: TDataSource;
    odsRg29: TOracleDataSet;
    dsRg30: TDataSource;
    odsRg30: TOracleDataSet;
    dsRg31: TDataSource;
    odsRg31: TOracleDataSet;
    dsRg32: TDataSource;
    odsRg32: TOracleDataSet;
    dsRg33: TDataSource;
    odsRg33: TOracleDataSet;
    dsRg35: TDataSource;
    odsRg35: TOracleDataSet;
    dsRg36: TDataSource;
    odsRg36: TOracleDataSet;
    dsRg37: TDataSource;
    odsRg37: TOracleDataSet;
    dsRg38: TDataSource;
    odsRg38: TOracleDataSet;
    dsRg39: TDataSource;
    odsRg39: TOracleDataSet;
    dsRg40: TDataSource;
    odsRg40: TOracleDataSet;
    dsRg41: TDataSource;
    odsRg41: TOracleDataSet;
    dsLf1: TDataSource;
    odsLf1: TOracleDataSet;
    dsLf2: TDataSource;
    odsLf2: TOracleDataSet;
    dsLf3: TDataSource;
    odsLf3: TOracleDataSet;
    dsLf4: TDataSource;
    odsLf4: TOracleDataSet;
    dsLf5: TDataSource;
    odsLf5: TOracleDataSet;
    dsLf6: TDataSource;
    odsLf6: TOracleDataSet;
    dsLf7: TDataSource;
    odsLf7: TOracleDataSet;
    dsLf8: TDataSource;
    odsLf8: TOracleDataSet;
    dsLf9: TDataSource;
    odsLf9: TOracleDataSet;
    dsLf10: TDataSource;
    odsLf10: TOracleDataSet;
    dsLf11: TDataSource;
    odsLf11: TOracleDataSet;
    dsLf12: TDataSource;
    odsLf12: TOracleDataSet;
    dsLf13: TDataSource;
    odsLf13: TOracleDataSet;
    dsLf14: TDataSource;
    odsLf14: TOracleDataSet;
    dsLf15: TDataSource;
    odsLf15: TOracleDataSet;
    dsLf16: TDataSource;
    odsLf16: TOracleDataSet;
    dsLf17: TDataSource;
    odsLf17: TOracleDataSet;
    dsLf18: TDataSource;
    odsLf18: TOracleDataSet;
    dsLf19: TDataSource;
    odsLf19: TOracleDataSet;
    dsLf20: TDataSource;
    odsLf20: TOracleDataSet;
    dsLf21: TDataSource;
    odsLf21: TOracleDataSet;
    dsLf22: TDataSource;
    odsLf22: TOracleDataSet;
    dsLf23: TDataSource;
    odsLf23: TOracleDataSet;
    dsLf24: TDataSource;
    odsLf24: TOracleDataSet;
    dsLf25: TDataSource;
    odsLf25: TOracleDataSet;
    dsLf26: TDataSource;
    odsLf26: TOracleDataSet;
    dsLf27: TDataSource;
    odsLf27: TOracleDataSet;
    dsLf28: TDataSource;
    odsLf28: TOracleDataSet;
    dsLf29: TDataSource;
    odsLf29: TOracleDataSet;
    dsLf30: TDataSource;
    odsLf30: TOracleDataSet;
    dsLf31: TDataSource;
    odsLf31: TOracleDataSet;
    dsLf32: TDataSource;
    odsLf32: TOracleDataSet;
    dsLf33: TDataSource;
    odsLf33: TOracleDataSet;
    dsLf34: TDataSource;
    odsLf34: TOracleDataSet;
    dsLf35: TDataSource;
    odsLf35: TOracleDataSet;
    dsLf36: TDataSource;
    odsLf36: TOracleDataSet;
    dsLf37: TDataSource;
    odsLf37: TOracleDataSet;
    dsLf38: TDataSource;
    odsLf38: TOracleDataSet;
    dsLf39: TDataSource;
    odsLf39: TOracleDataSet;
    dsLf40: TDataSource;
    odsLf40: TOracleDataSet;
    procedure FormCreate(Sender: TObject);
  private
    procedure DoActiveRightDatasets;
    procedure DoActiveLeftDatasets;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDM: TfrmDM;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmDM.DoActiveLeftDatasets;
begin
// -- Левая общая подвздошная артерия
  if odsLf1.Active = False then
    odsLf1.Active := True;
  if odsLf2.Active = False then
    odsLf2.Active := True;
  if odsLf3.Active = False then
    odsLf3.Active := True;
  if odsLf4.Active = False then
    odsLf4.Active := True;
  if odsLf5.Active = False then
    odsLf5.Active := True;
  if odsLf6.Active = False then
    odsLf6.Active := True;
  if odsLf7.Active = False then
    odsLf7.Active := True;
// -- Наружная подвздошная артерия
  if odsLf8.Active = False then
    odsLf8.Active := True;
  if odsLf9.Active = False then
    odsLf9.Active := True;
  if odsLf10.Active = False then
    odsLf10.Active := True;
  if odsLf11.Active = False then
    odsLf11.Active := True;
  if odsLf12.Active = False then
    odsLf12.Active := True;
// -- Внутреняя подвздошная артерия
  if odsLf13.Active = False then
    odsLf13.Active := True;
  if odsLf14.Active = False then
    odsLf14.Active := True;
  if odsLf15.Active = False then
    odsLf15.Active := True;
  if odsLf16.Active = False then
    odsLf16.Active := True;
  if odsLf17.Active = False then
    odsLf17.Active := True;
// -- Левая общая бедренная артерия
  if odsLf18.Active = False then
    odsLf18.Active := True;
  if odsLf19.Active = False then
    odsLf19.Active := True;
  if odsLf20.Active = False then
    odsLf20.Active := True;
  if odsLf21.Active = False then
    odsLf21.Active := True;
  if odsLf22.Active = False then
    odsLf22.Active := True;
// -- Поверхностная бедренная артерия
  if odsLf23.Active = False then
    odsLf23.Active := True;
  if odsLf24.Active = False then
    odsLf24.Active := True;
  if odsLf25.Active = False then
    odsLf25.Active := True;
  if odsLf26.Active = False then
    odsLf26.Active := True;
  if odsLf27.Active = False then
    odsLf27.Active := True;
// -- Поверхностная бедренная артерия
  if odsLf28.Active = False then
    odsLf28.Active := True;
  if odsLf29.Active = False then
    odsLf29.Active := True;
  if odsLf30.Active = False then
    odsLf30.Active := True;
  if odsLf31.Active = False then
    odsLf31.Active := True;
  if odsLf32.Active = False then
    odsLf32.Active := True;
// -- Подколенная бедренная артерия
  if odsLf33.Active = False then
    odsLf33.Active := True;
  if odsLf34.Active = False then
    odsLf34.Active := True;
  if odsLf35.Active = False then
    odsLf35.Active := True;
  if odsLf36.Active = False then
    odsLf36.Active := True;
// -- Большеберцовая артерия
  if odsLf37.Active = False then
    odsLf37.Active := True;
  if odsLf38.Active = False then
    odsLf38.Active := True;
  if odsLf39.Active = False then
    odsLf39.Active := True;
  if odsLf40.Active = False then
    odsLf40.Active := True;
end;

procedure TfrmDM.DoActiveRightDatasets;
begin
// -- Правая общая подвздошная артерия
  if odsRg1.Active = False then
    odsRg1.Active := True;
  if odsRg2.Active = False then
    odsRg2.Active := True;
  if odsRg3.Active = False then
    odsRg3.Active := True;
  if odsRg4.Active = False then
    odsRg4.Active := True;
  if odsRg5.Active = False then
    odsRg5.Active := True;
  if odsRg6.Active = False then
    odsRg6.Active := True;
  if odsRg7.Active = False then
    odsRg7.Active := True;
// -- Наружная подвздошная артерия
  if odsRg8.Active = False then
    odsRg8.Active := True;
  if odsRg9.Active = False then
    odsRg9.Active := True;
  if odsRg10.Active = False then
    odsRg10.Active := True;
  if odsRg11.Active = False then
    odsRg11.Active := True;
  if odsRg12.Active = False then
    odsRg12.Active := True;
// -- Внутреняя подвздошная артерия
  if odsRg13.Active = False then
    odsRg13.Active := True;
  if odsRg14.Active = False then
    odsRg14.Active := True;
  if odsRg15.Active = False then
    odsRg15.Active := True;
  if odsRg16.Active = False then
    odsRg16.Active := True;
  if odsRg17.Active = False then
    odsRg17.Active := True;
// -- Правая общая бедренная артерия
  if odsRg18.Active = False then
    odsRg18.Active := True;
  if odsRg19.Active = False then
    odsRg19.Active := True;
  if odsRg20.Active = False then
    odsRg20.Active := True;
  if odsRg21.Active = False then
    odsRg21.Active := True;
  if odsRg22.Active = False then
    odsRg22.Active := True;
// -- Поверхностная бедренная артерия
  if odsRg23.Active = False then
    odsRg23.Active := True;
  if odsRg24.Active = False then
    odsRg24.Active := True;
  if odsRg25.Active = False then
    odsRg25.Active := True;
  if odsRg26.Active = False then
    odsRg26.Active := True;
  if odsRg27.Active = False then
    odsRg27.Active := True;
// -- Поверхностная бедренная артерия
  if odsRg28.Active = False then
    odsRg28.Active := True;
  if odsRg29.Active = False then
    odsRg29.Active := True;
  if odsRg30.Active = False then
    odsRg30.Active := True;
  if odsRg31.Active = False then
    odsRg31.Active := True;
  if odsRg32.Active = False then
    odsRg32.Active := True;
// -- Подколенная бедренная артерия
  if odsRg33.Active = False then
    odsRg33.Active := True;
  if odsRg35.Active = False then
    odsRg35.Active := True;
  if odsRg36.Active = False then
    odsRg36.Active := True;
  if odsRg37.Active = False then
    odsRg37.Active := True;
// -- Большеберцовая артерия
  if odsRg38.Active = False then
    odsRg38.Active := True;
  if odsRg39.Active = False then
    odsRg39.Active := True;
  if odsRg40.Active = False then
    odsRg40.Active := True;
  if odsRg41.Active = False then
    odsRg41.Active := True;
end;

procedure TfrmDM.FormCreate(Sender: TObject);
begin
  DoActiveRightDatasets;
  DoActiveLeftDatasets;
end;

end.
