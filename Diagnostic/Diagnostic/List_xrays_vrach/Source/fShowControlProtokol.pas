unit fShowControlProtokol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RVStyle, RVScroll, RichView, RVEdit, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ActnList, DB, Oracle, OracleData, ExtCtrls;

type
  TfrmShowControlProtokol = class(TForm)
    rveText: TRichViewEdit;
    rvs: TRVStyle;
    al: TActionList;
    aOk: TAction;
    odsRVData: TOracleDataSet;
    odsRVDataFK_ID: TFloatField;
    odsRVDataFK_PACID: TFloatField;
    odsRVDataFB_BLOB: TBlobField;
    odsRVDataFN_COMPRESS: TFloatField;
    odsRVDataFB_HTML: TBlobField;
    odsRVDataFB_TEXT: TMemoField;
    Panel1: TPanel;
    bOk: TcxButton;
    procedure aOkExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DoShowForm(nIDSmid : Integer; pIDNaz : Integer);
    { Public declarations }
  end;

var
  frmShowControlProtokol: TfrmShowControlProtokol;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmShowControlProtokol.aOkExecute(Sender: TObject);
begin
  ModalResult := MrOk;
end;

procedure TfrmShowControlProtokol.DoShowForm(nIDSmid : Integer; pIDNaz : Integer);
var ods : TOracleDataSet;
    memStream : TMemoryStream;
begin
//------------------------------------------------------------------------------
  memStream :=  TMemoryStream.Create;
  odsRVData.Close;
  odsRVData.SetVariable('FK_PACID', pIDNaz);
  odsRVData.Open;
  TBlobField(odsRVData.FieldByName('FB_BLOB')).SaveToStream(memStream);
  memStream.Position := 0;
  rveText.Clear;
  if pIDNaz <> 0 then
    begin
      rveText.LoadRVFFromStream(memStream);
      rveText.Format;
    end;
  memStream.Free;
//------------------------------------------------------------------------------ 
  if (odsRVData.RecordCount = 0) or (pIDNaz = 0) then
  begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FB_BLOB FROM TRICHVIEW_TEMPL_DEF, TRICHVIEW_TEMPL '+
                    '  WHERE TRICHVIEW_TEMPL_DEF.FK_SOTR = :PFK_SOTR '+
                    '    AND TRICHVIEW_TEMPL_DEF.FK_SMID = :PFK_SMID '+
                    '    AND TRICHVIEW_TEMPL_DEF.FK_RICHVIEW_TEML = TRICHVIEW_TEMPL.FK_ID '+
                    ' ORDER BY TRICHVIEW_TEMPL.FN_ORDER DESC ';
    ods.DeclareAndSet('PFK_SOTR', otInteger, frmMain.pSOTRID);
    ods.DeclareAndSet('PFK_SMID', otInteger, nIDSmid);
    ods.Open;
    ods.First;
    if ods.RecordCount > 0 then
      begin
        while not ods.Eof do
          begin
            memStream := TMemoryStream.Create;
            memStream.Position := 0;
            TBlobField(ods.FieldByName('FB_BLOB')).SaveToStream(memStream);
            memStream.Position := 0;
            rveText.InsertRVFFromStreamEd(memStream);
            rveText.Format;
            memStream.Clear;
            ods.Next;
          end;
      end;
  finally
    ods.Free;
  end;
  end;
end;

end.
