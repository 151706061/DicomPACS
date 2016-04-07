unit dmImport;

interface

uses
  SysUtils, Classes, Oracle, OracleData, XMLDoc, Dialogs, xmldom, XMLIntf,
  msxmldom, DB;

type
  Tdm_Import = class(TDataModule)
    oqAddDoc: TOracleQuery;
    oqAddDocItem: TOracleQuery;
    opdXLS: TOpenDialog;
    opdXML: TOpenDialog;
    XMLDocument1: TXMLDocument;
    odsNaklByDogovor: TOracleDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    function OpenExcel(const aFileName: string; var aXlApp, aXlSheet : variant; var aDocID : Integer; aFC_DOC_DATE_FORMAT : string = 'DD.MM.YYYY'; aFC_PARTY_GODNOST_FORMAT : string = 'DD.MM.YYYY' ): Boolean;
    function OpenXML_OKB(const aFileName : string; var aXMLDocument1 : TXMLDocument; var aDocID : Integer; aFC_DOC_DATE_FORMAT : string = 'YYYY-MM-DD'; aFC_PARTY_GODNOST_FORMAT : string = 'DD/MM/YYYY' ): Boolean;
    procedure SetSession(aSession: TOracleSession);
  end;

var
  dm_Import: Tdm_Import;

  function OpenExcelFile(const aFileName: string; var aXlApp, aXlSheet : variant): Boolean;
  procedure CloseExcelFile(var aXlApp : variant);
  function NVL(aParam, aNullReplace: variant): variant;

implementation
uses Variants, Excel2000, ComObj;

{$R *.dfm}

function NVL(aParam, aNullReplace: variant): variant;
begin
  if (VarIsNull(aParam))or(VarIsEmpty(aParam)) then
    Result := aNullReplace
  else
    Result := aParam;
end;

procedure CloseExcelFile(var aXlApp : variant);
begin
  // If MsExcel in a manual way has closed, it will generate an exception
  if not VarIsEmpty(aXlApp) then begin   // We are connected with MsExcel
    // XlApp.ActiveWorkBook.SaveAs('MySheet'); // For save the WorkBook
    aXlApp.DisplayAlerts := False; // Discard unsaved changes
    aXlApp.Quit; // Close MsExcel
    VarClear(aXlApp);
  end;
end;

function OpenExcelFile(const aFileName: string; var aXlApp, aXlSheet : variant): Boolean;
var
  aXlBook : variant;
begin
  try
    if not VarIsEmpty(aXlApp) then  // если эксель уже открыт
    begin   // We are connected with MsExcel
      aXlApp.DisplayAlerts := False; // Discard unsaved changes
      CloseExcelFile(aXlApp); // Close MsExcel
    end;

    aXlApp  := CreateOleObject('Excel.Application'); // создаем объект эксель

    if VarType(aXlApp) <> VarDispatch then
    begin  // If we are not connected with MsExcel
      ShowMessage('MS Excel not this installed');
      Result := False;
      Exit;
    end;

    aXlBook := aXlApp.WorkBooks.Open( aFileName );
//    XlApp.Visible := True;
    aXlSheet  := aXlApp.WorkBooks[1].Sheets[1]; // Active Sheet
//    aXlSheets := aXlApp.Sheets; // Array of Sheets
    Result := True;

  except
    CloseExcelFile(aXlApp);
    Result := False;
    ShowMessage('Error when opening OLE with MsExcel');
  end;
end;

procedure Tdm_Import.SetSession(aSession: TOracleSession);
var
  i, n : integer;
begin
  n := Self.ComponentCount - 1;
  for i := 0 to n do
  begin
    if (UpperCase(Self.Components[i].ClassName) = 'TORACLEDATASET') then  TOracleDataSet(Self.Components[i]).Session := aSession;
    if(UpperCase(Self.Components[i].ClassName) = 'TORACLEQUERY') then TOracleQuery(Self.Components[i]).Session := aSession;
  end;
end;

function Tdm_Import.OpenExcel(const aFileName: string; var aXlApp, aXlSheet : variant; var aDocID : Integer; aFC_DOC_DATE_FORMAT : string = 'DD.MM.YYYY'; aFC_PARTY_GODNOST_FORMAT : string = 'DD.MM.YYYY' ): Boolean;
var
  i1, i2 : integer;
  ClearStr : boolean;
begin
  Result := True;
  if OpenExcelFile(aFileName, aXlApp, aXlSheet) then
  begin
    oqAddDoc.Session.Savepoint('BeforeAdd');
    try
      try
        oqAddDoc.ClearVariables;
        oqAddDoc.SetVariable('pfc_src_doc_num', Trim(NVL( aXlSheet.Cells[ 1, 7 ].Value,'')));
        oqAddDoc.SetVariable('pfc_src_doc_date', Trim(NVL(aXlSheet.Cells[ 1, 3 ].Value,'')));
        oqAddDoc.SetVariable('pfc_src_postav', Trim(NVL(aXlSheet.Cells[ 2, 3 ].Value,'')));
        oqAddDoc.SetVariable('pfc_src_kontrakt', Trim(NVL(aXlSheet.Cells[ 3, 3 ].Value,'')));
        oqAddDoc.SetVariable('pfc_src_vid_oplati', Trim(NVL(aXlSheet.Cells[ 3, 7 ].Value,'')));
        oqAddDoc.SetVariable('pfc_src_schet_faktura', Trim(NVL(aXlSheet.Cells[ 3, 10 ].Value,'')));
        oqAddDoc.SetVariable('pfc_src_comment', Trim(NVL(aXlSheet.Cells[ 4, 3 ].Value,'')));
        oqAddDoc.SetVariable('pfc_src_summa_s_nds', Trim(NVL(aXlSheet.Cells[ 5, 3 ].Value,'')));
        oqAddDoc.SetVariable('pfc_src_kolvo_pos', Trim(NVL(aXlSheet.Cells[ 5, 7 ].Value,'')));

        oqAddDoc.SetVariable('pFC_DOC_DATE_FORMAT', aFC_DOC_DATE_FORMAT);
        oqAddDoc.SetVariable('pFC_PARTY_GODNOST_FORMAT', aFC_PARTY_GODNOST_FORMAT);

        oqAddDoc.SetVariable('pfc_imp_filename', aFileName);
        oqAddDoc.Execute;
        aDocID := oqAddDoc.GetVariable('pDocID');

        i1 := 10; // первая строка с наименованиями
        repeat
          oqAddDocItem.ClearVariables;
          oqAddDocItem.SetVariable('pfk_imp_doc_id', aDocID);
          oqAddDocItem.SetVariable('pfc_src_num', Trim(NVL(aXlSheet.Cells[ i1, 1 ].Value,'')));
          oqAddDocItem.SetVariable('pfc_src_medic_torg_name', Trim(NVL(aXlSheet.Cells[ i1, 2 ].Value,'')));
          oqAddDocItem.SetVariable('pfc_src_medic_id_their', Trim(NVL(aXlSheet.Cells[ i1, 3 ].Value,'')));
          oqAddDocItem.SetVariable('pfc_src_medic_ed_izm', Trim(NVL(aXlSheet.Cells[ i1, 4 ].Value,'')));
          oqAddDocItem.SetVariable('pfc_src_medic_kolvo', Trim(NVL(aXlSheet.Cells[ i1, 5 ].Value,'')));
          oqAddDocItem.SetVariable('pfc_src_party_seria', Trim(NVL(aXlSheet.Cells[ i1, 6 ].Value,'')));
          oqAddDocItem.SetVariable('pfc_src_party_godnost', Trim(NVL(aXlSheet.Cells[ i1, 7 ].Value,'')));
          oqAddDocItem.SetVariable('pfc_src_party_price_bez_nds',  Trim(NVL(aXlSheet.Cells[ i1, 8 ].Value,'')));
          oqAddDocItem.SetVariable('pfc_src_party_summ_nds', Trim(NVL(aXlSheet.Cells[ i1, 9 ].Value,'')));
          oqAddDocItem.SetVariable('pfc_src_nds', Trim(NVL(aXlSheet.Cells[ i1, 10 ].Value,'')));
          oqAddDocItem.SetVariable('pfc_src_party_proizvoditel', Trim(NVL(aXlSheet.Cells[ i1, 11 ].Value,'')));
          oqAddDocItem.SetVariable('pfc_src_party_sertifikat', Trim(NVL(aXlSheet.Cells[ i1, 12 ].Value,'')));
          ClearStr := True;
          for i2 := 0 to oqAddDocItem.VariableCount-1 do
          begin
            if (UpperCase(oqAddDocItem.VariableName(i2)) <> 'PFK_IMP_DOC_ID')and
               (UpperCase(oqAddDocItem.VariableName(i2)) <> 'PFK_ID')and(oqAddDocItem.VariableType(i2) = otString) then
              ClearStr := ClearStr and (oqAddDocItem.GetVariable(i2) = '');
          end;

          if ClearStr = False then
            oqAddDocItem.Execute;
          inc(i1);  
        until ClearStr;
        Result := True;
      except on E: Exception do
        begin
          result := False;
          oqAddDoc.Session.RollbackToSavepoint('BeforeAdd');
          aDocID := 0;
          ShowMessage('При разборе xls-файла произошла ошибка. Обратитесь в службу поддержки.'#13#10#13#10+E.Message);
        end;
      end;
    finally
      CloseExcelFile(aXlApp);
    end;
  end;
end;


function Tdm_Import.OpenXML_OKB(const aFileName : string; var aXMLDocument1 : TXMLDocument; var aDocID : Integer; aFC_DOC_DATE_FORMAT : string = 'YYYY-MM-DD'; aFC_PARTY_GODNOST_FORMAT : string = 'DD/MM/YYYY' ): Boolean;
var
  i1: Integer;
  N : IXMLNode;
begin
  aXMLDocument1.FileName := aFileName;
  try
    aXMLDocument1.Active:=True;
  except
    on E:Exception do
    begin
     ShowMessage('Не могу открыть настройки!'#13#10+E.Message);
     Result := False;
     Exit;
    end;
  end;

  oqAddDoc.Session.Savepoint('BeforeAdd');
  try
    try
      N := aXMLDocument1.DocumentElement.ChildNodes['ЗаголовокДокумента'];

      oqAddDoc.ClearVariables;
      oqAddDoc.SetVariable('pfc_src_doc_num', Trim(NVL(N.ChildNodes['НомерДок'].NodeValue,'')));
      oqAddDoc.SetVariable('pfc_src_doc_date', Trim(NVL(N.ChildNodes['ДатаДок'].NodeValue,'')));
      oqAddDoc.SetVariable('pfc_src_postav', Trim(NVL(N.ChildNodes['Поставщик'].NodeValue,'')));
      oqAddDoc.SetVariable('pfc_src_kontrakt', '');
      oqAddDoc.SetVariable('pfc_src_vid_oplati', '');
      oqAddDoc.SetVariable('pfc_src_schet_faktura', '');
      oqAddDoc.SetVariable('pfc_src_comment', '');
      oqAddDoc.SetVariable('pfc_src_summa_s_nds', Trim(NVL(N.ChildNodes['СуммаОптВклНДС'].NodeValue,'')));
      oqAddDoc.SetVariable('pfc_src_kolvo_pos', Trim(NVL(N.ChildNodes['Позиций'].NodeValue,'')));
      oqAddDoc.SetVariable('pFC_DOC_DATE_FORMAT', aFC_DOC_DATE_FORMAT);
      oqAddDoc.SetVariable('pFC_PARTY_GODNOST_FORMAT', aFC_PARTY_GODNOST_FORMAT);
      oqAddDoc.SetVariable('pfc_imp_filename', aFileName);
      oqAddDoc.Execute;
      aDocID := oqAddDoc.GetVariable('pDocID');      

      for i1 := 0 to aXMLDocument1.DocumentElement.ChildNodes['ТоварныеПозиции'].ChildNodes.Count-1 do
      begin
        N := aXMLDocument1.DocumentElement.ChildNodes['ТоварныеПозиции'].ChildNodes[i1];
        oqAddDocItem.ClearVariables;
        oqAddDocItem.SetVariable('pfk_imp_doc_id', aDocID);
        oqAddDocItem.SetVariable('pfc_src_num', '');
        oqAddDocItem.SetVariable('pfc_src_medic_torg_name', Trim(NVL(N.ChildNodes['Товар'].NodeValue,'')));
        oqAddDocItem.SetVariable('pfc_src_medic_id_their', '');
        oqAddDocItem.SetVariable('pfc_src_medic_ed_izm', Trim(NVL(N.ChildNodes['Единица'].NodeValue,'')));
        oqAddDocItem.SetVariable('pfc_src_medic_kolvo', Trim(NVL(N.ChildNodes['Количество'].NodeValue,'')));
        oqAddDocItem.SetVariable('pfc_src_party_seria', Trim(NVL(N.ChildNodes['Серии'].ChildNodes['Серия'].ChildNodes['СерияТовара'].NodeValue,'')));
        oqAddDocItem.SetVariable('pfc_src_party_godnost', Trim(NVL(N.ChildNodes['Серии'].ChildNodes['Серия'].ChildNodes['СрокГодностиТовара'].NodeValue,'')));
        oqAddDocItem.SetVariable('pfc_src_party_price_bez_nds',  Trim(NVL(N.ChildNodes['ЦенаОпт'].NodeValue,'')));
        oqAddDocItem.SetVariable('pfc_src_party_summ_nds', NVL(N.ChildNodes['СуммаОптВклНДС'].NodeValue,''));
        oqAddDocItem.SetVariable('pfc_src_nds', Trim(NVL(N.ChildNodes['СтавкаНДС'].NodeValue,'')));
        oqAddDocItem.SetVariable('pfc_src_party_proizvoditel', '');
        oqAddDocItem.SetVariable('pfc_src_party_sertifikat', Trim(NVL(N.ChildNodes['Серии'].ChildNodes['Серия'].ChildNodes['НомерСертиф'].NodeValue,''))+' до '+
                                                             Trim(NVL(N.ChildNodes['Серии'].ChildNodes['Серия'].ChildNodes['СрокДействияСертиф'].NodeValue,''))+', '+
                                                             Trim(NVL(N.ChildNodes['Серии'].ChildNodes['Серия'].ChildNodes['ОрганСертиф'].NodeValue,''))
                                                             );
        oqAddDocItem.Execute;
      end;
      Result := True;
    except
      result := False;
      oqAddDoc.Session.RollbackToSavepoint('BeforeAdd');
      aDocID := 0;
    end;
  finally
    aXMLDocument1.Active:=False;
  end;
end;

end.
