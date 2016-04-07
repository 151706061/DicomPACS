unit fImportNakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, xmldom, XMLIntf, StdCtrls, msxmldom, XMLDoc, Grids, Oracle,
  DB, OracleData, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxDBLookupComboBox, cxCurrencyEdit,
  cxCalendar, cxSpinEdit, Menus, cxLookAndFeelPainters, Buttons,
  cxSplitter, cxButtons, ExtCtrls, cxGridBandedTableView,
  cxGridDBBandedTableView, cxContainer, cxGroupBox, JvComponentBase,
  JvFormPlacement, cxCalc, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel,
  cxCheckBox, uParams;

const
  IMPFIELD_HEADER_FIRST   = 1;
  IFH_DOC_NUM             = 1;
  IFH_DOC_DATE            = 2;
  IFH_DOC_POSTAVSHIK      = 3;
  IFH_DOC_KONTRAKT        = 4;
  IFH_DOC_VIDOPLATI       = 5;
  IFH_DOC_SCHET_FAKTURA   = 6;
  IFH_DOC_COMMENT         = 7;
  IFH_DOC_SUMMA_S_NDS     = 8;
  IFH_DOC_KOLVO_POS       = 9;
  IMPFIELD_HEADER_LAST    = 9;

  IMPFIELDS_ITEMS_FIRST   = 1;
  IFI_NUM                 = 1;
  IFI_MEDIC_TORG_NAME     = 2;
  IFI_MEDIC_ID_THEIR      = 3;
  IFI_MEDIC_ED_IZM        = 4;
  IFI_MEDIC_KOLVO         = 5;
  IFI_PARTY_SERIA         = 6;
  IFI_PARTY_GODNOST       = 7;
  IFI_PARTY_PRICE_BEZ_NDS = 8;
  IFI_PARTY_SUMM_NDS      = 9;
  IFI_NDS                 =10;
  IFI_PARTY_PROIZVODITEL  =11;
  IFI_PARTY_SERTIFIKAT    =12;
  IMPFIELDS_ITEMS_LAST    =12;

  // коды ошибок Parse Errors
  PE_FK_ED_IZM              =  8;
  PE_FK_PRODID              =  7;
  PE_FK_SERTID              =  6;
  PE_FK_MEDIC_THEIR         =  5;
  PE_FN_NDS_EMPTY           =  3;
  PE_FD_PARTY_GODNOST_EMPTY =  2;
  PE_FN_NUM                 =  1;
  PE_OK                     =  0;
  PE_FN_DOC_SUMMA_S_NDS     = -1;
  PE_FN_DOC_KOLVO_POS       = -2;
  PE_FD_DOC_DATE            = -3;
  PE_FK_MEDIC               = -4;
  PE_FN_MEDIC_KOLVO         = -5;
  PE_FD_PARTY_GODNOST       = -6;
  PE_FN_PARTY_PRICE         = -7;
  PE_FN_PARTY_SUMM_S_NDS    = -8;
  PE_FN_NDS                 = -9;
  PE_FK_DOC_POSTAVSHIK      =-10;

  PE_DOC_IS_ABSENT          =-11;

type
  // --------------------------------------------
  TfmImportNakl = class(TForm)
    cxGroupBox3: TcxGroupBox;
    grTIMP_DOC_ITEMS: TcxGrid;
    grTIMP_DOC_ITEMSDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridLevel3: TcxGridLevel;
    grbDocs: TcxGroupBox;
    grTIMP_DOC: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    Panel1: TPanel;
    bbuExit: TBitBtn;
    odsTIMP_DOC: TOracleDataSet;
    dsTIMP_DOC: TDataSource;
    odsTIMP_DOC_ITEMS: TOracleDataSet;
    dsTIMP_DOC_ITEMS: TDataSource;
    grTIMP_DOCDBBandedTableView1: TcxGridDBBandedTableView;
    grTIMP_DOCDBBandedTableView1FK_ID: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FC_SRC_DOC_NUM: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FC_SRC_DOC_DATE: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FC_SRC_POSTAV: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FC_SRC_VID_OPLATI: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FC_SRC_SCHET_FAKTURA: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FC_SRC_SUMMA_S_NDS: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FC_SRC_KOLVO_POS: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FD_INS_DATE: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FD_EDIT_DATE: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FK_INS_MO: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FK_EDIT_MO: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FK_POST_ID: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FN_SUMMA_S_NDS: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FN_KOLVO_POS: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FC_IMP_FILENAME: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FK_ID: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FK_IMP_DOC_ID: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_NUM: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_TORG_NAME: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_ID_THEIR: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_ED_IZM: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_MEDIC_KOLVO: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_SERIA: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_GODNOST: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_PRICE_BEZ_NDS: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_SUMM_NDS: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_NDS: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_PROIZVODITEL: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FC_SRC_PARTY_SERTIFIKAT: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FD_INS_DATE: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FD_EDIT_DATE: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FK_INS_MO: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FK_EDIT_MO: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ID_OUR: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ID_THEIR: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ED_IZM: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FN_PRS_MEDIC_KOLVO: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FD_PRS_PARTY_GODNOST: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FN_PRS_PARTY_PRICE: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FN_PRS_PARTY_SUMM_NDS: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FN_PRS_NDS: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_PARTY_PROIZVODITEL: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_PARTY_SERTIFIKAT: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FK_IMP_KARTID: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FK_IMP_TDPC: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FN_IMP_STATUS: TcxGridDBBandedColumn;
    grTIMP_DOC_ITEMSDBBandedTableView1FC_IMP_STATUS: TcxGridDBBandedColumn;
    oqMakeImportNaklMedics: TOracleQuery;
    oqSET_IMP_ITEM_STATUS: TOracleQuery;
    odsTLINK_IMPNAKL: TOracleDataSet;
    oqInsTLINK_IMPNAKL: TOracleQuery;
    odsTPostav: TOracleDataSet;
    odsTMedic: TOracleDataSet;
    oqUpdDoc: TOracleQuery;
    oqUpdDocItem: TOracleQuery;
    odsTIMP_DOC_ITEMS2: TOracleDataSet;
    odsMedicsList: TOracleDataSet;
    dsMedicsList: TDataSource;
    odsTEI: TOracleDataSet;
    Panel2: TPanel;
    buDelItem: TcxButton;
    buDelDoc: TcxButton;
    Splitter1: TSplitter;
    grTIMP_DOCDBBandedTableView1FN_IMP_DOC_STATUS: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FC_IMP_DOC_STATUS: TcxGridDBBandedColumn;
    JvFormStorage1: TJvFormStorage;
    grTIMP_DOCDBBandedTableView1FD_DOC_DATE: TcxGridDBBandedColumn;
    odsTProdCert: TOracleDataSet;
    odsTProdCert_list: TOracleDataSet;
    dsTProdCert_list: TDataSource;
    grTIMP_DOCDBBandedTableView1fc_src_kontrakt: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FC_SRC_COMMENT: TcxGridDBBandedColumn;
    buEdit: TcxButton;
    buImport: TcxButton;
    grTIMP_DOCDBBandedTableView1FL_CHECK_DOGOVOR: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FL_IS_CHECKED: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FK_MO_CHECKED: TcxGridDBBandedColumn;
    grTIMP_DOCDBBandedTableView1FD_CHECKED_DATE: TcxGridDBBandedColumn;
    buKontrNakl: TcxButton;
    oqInitMO: TOracleQuery;
    os: TOracleSession;
    oqAddProdCert: TOracleQuery;
    grTIMP_DOCDBBandedTableView1FD_IMPORT: TcxGridDBBandedColumn;
    odsTPostav_List: TOracleDataSet;
    dsTPostav_List: TDataSource;
    grTIMP_DOCDBBandedTableView1fk_spec_id: TcxGridDBBandedColumn;
    paOpen: TPanel;
    cmbImportSource: TcxComboBox;
    cxLabel1: TcxLabel;
    buLoad: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buLoadClick(Sender: TObject);
    procedure odsTIMP_DOCAfterScroll(DataSet: TDataSet);
    procedure odsTIMP_DOCBeforeOpen(DataSet: TDataSet);
    procedure odsTIMP_DOCAfterOpen(DataSet: TDataSet);
    procedure bbuExitClick(Sender: TObject);
    procedure buDelDocClick(Sender: TObject);
    procedure buDelItemClick(Sender: TObject);
    procedure grTIMP_DOCDBBandedTableView1FK_POST_IDPropertiesEditValueChanged(
      Sender: TObject);
    procedure buImportClick(Sender: TObject);
    procedure grTIMP_DOC_ITEMSDBBandedTableView1EditValueChanged(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure grTIMP_DOC_ITEMSDBBandedTableView1FC_IMP_STATUSCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grTIMP_DOCDBBandedTableView1FC_IMP_DOC_STATUSCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ID_OURPropertiesEditValueChanged(
      Sender: TObject);
    procedure grTIMP_DOCDBBandedTableView1FD_DOC_DATEPropertiesEditValueChanged(
      Sender: TObject);
    procedure grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ED_IZMPropertiesEditValueChanged(
      Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buEditClick(Sender: TObject);
    procedure buKontrNaklClick(Sender: TObject);
    procedure grTIMP_DOCDBBandedTableView1FL_CHECK_DOGOVORPropertiesEditValueChanged(
      Sender: TObject);
    procedure grTIMP_DOCDBBandedTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure grTIMP_DOCDBBandedTableView1FL_CHECK_DOGOVORPropertiesChange(
      Sender: TObject);
    procedure odsTIMP_DOCBeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
    XlApp, XlSheet : Variant; // Excel
    FK_APPSOTR_ID : Integer;
    FIsNeedRefreshItems : Boolean;
    ConfigParams : TParams;    
    function ExcludeNonFloatChars(aFloatStr: string): string;
    function TryStrToDateByFormat(const aStrDate : string; var aDate : TDateTime; const aDateFormat : string = 'DD.MM.YYYY') : Boolean;

//    function OpenExcelFile(aFileName: string): Boolean;
//    procedure CloseExcelFile;

    procedure LOAD_FUNC_DOGOVOR_NAKL_ENABLE(var aValue: variant);
    procedure LOAD_FUNC_IMP_NAKL_ENABLE(var aValue: variant);
    procedure LOAD_FUNC_NAKL_OPEN(var aValue: variant);


  public
    { Public declarations }
    DOC_DATE_FORMAT      : string;
    PARTY_GODNOST_FORMAT : string;
    DocID   : integer;

    ParseMessage : string;
    ParseError : integer;

//    function OpenXML_OKB(aXMLDocument1 : TXMLDocument; aFileName : string) : Boolean;
//    function OpenExcel( aFileName : string ) : Boolean;

    function DoParse : integer;

    procedure RefreshIMP_DOCS( aDocIDLocate : integer = -1 ; aRefreshItems : Boolean = True);
    procedure InsTLINK_IMPNAKL( afn_our_table_num,
                                afk_our_key_field_value,
                                afk_post_id,
                                afn_their_table_num,
                                afk_their_key_field_value,
                                afc_their_value : variant);
  end;

var
  fmImportNakl: TfmImportNakl;

implementation
uses
  ComObj, uTLINK_IMPNAKL, uGlobalConst, Excel2000, smmainAPI, uGlobal,
  fmKontrakt_Select, dmImport;
{$R *.dfm}

procedure TfmImportNakl.FormClose(Sender: TObject; var Action: TCloseAction);
var
  n, i : integer;
begin
//  Action := caHide;
  n := Self.ComponentCount - 1;
  for i := 0 to n do
  begin
    if (UpperCase(Self.Components[i].ClassName) = 'TORACLEDATASET') then  TOracleDataSet(Self.Components[i]).Close;
  end;
  Action := caFree;  
end;

function TfmImportNakl.ExcludeNonFloatChars(aFloatStr : string) : string;
var
  i : Integer;
begin
  Result := StringReplace(aFloatStr,'.',',', []);
  i := 1;
  while i < Length(Result) do
    if Result[i] in ['0','1','2','3','4','5','6','7','8','9',','] then Inc(i) else Delete(Result, 1, 1);
  if Result = '' then Result := '0';
end;

function TfmImportNakl.TryStrToDateByFormat(const aStrDate : string; var aDate : TDateTime; const aDateFormat : string = 'DD.MM.YYYY') : Boolean;
var
  i1 : integer;
  fs : TFormatSettings;
begin
  i1 := 1;
  while (i1 <= Length(aStrDate))and(aStrDate[i1] in['0'..'9']) do
    inc( i1 );

  if i1 <= Length(aStrDate) then
    fs.DateSeparator := aStrDate[i1];
  fs.ShortDateFormat := aDateFormat;
  fs.LongDateFormat  := aDateFormat;

  Result := TryStrToDate(aStrDate, aDate, fs);
end;

function TfmImportNakl.DoParse(): integer;
var
  i, n1 : integer;
  s : string;
  TempFloat : double;
  TempInt   : integer;
  TempDate  : TDateTime;
begin
  ParseMessage := '';
  Result := PE_DOC_IS_ABSENT;
  if DocID = 0 then Exit;
  Result := PE_OK;
  RefreshIMP_DOCS( DocID );

  try
    try
      oqUpdDoc.ClearVariables;
      oqUpdDoc.SetVariable('PDOCID', DocID);
      s := ExcludeNonFloatChars(nvl(odsTIMP_DOC.FieldByName('fc_src_summa_s_nds').AsString,''));
      if TryStrToFloat(s, TempFloat) then
        oqUpdDoc.SetVariable('PFN_SUMMA_S_NDS', TempFloat)
      else
      begin
        Result := PE_FN_DOC_SUMMA_S_NDS;
        ParseMessage := 'Поле "Сумма с НДС" содержит некорректную информацию';
      end;

      if TryStrToInt(odsTIMP_DOC.FieldByName('fc_src_kolvo_pos').AsString, TempInt) then
        oqUpdDoc.SetVariable('PFN_KOLVO_POS', TempInt)
      else
      begin
        Result := PE_FN_DOC_KOLVO_POS;
        ParseMessage := 'Поле "Кол-во позиций" содержит некорректную информацию';
      end;

      if TryStrToDateByFormat(odsTIMP_DOC.FieldByName('fc_src_doc_date').AsString, TempDate, DOC_DATE_FORMAT) then
        oqUpdDoc.SetVariable('PFD_DOC_DATE', TempDate)
      else
      begin
        Result := PE_FD_DOC_DATE;
        ParseMessage := 'Поле "Дата накладной" содержит некорректную информацию';
      end;

      // ищем поставщика
      // сначала прямое совпадение
      odsTPostav.Close;
      odsTPostav.SetVariable('pfc_name', odsTIMP_DOC.FieldByName('fc_src_postav').AsString);
      odsTPostav.Open;
      if (odsTPostav.RecordCount = 1) then
        oqUpdDoc.SetVariable('PFK_POST_ID', odsTPostav.FieldByName('postavid').AsVariant);

      if (nvl(oqUpdDoc.GetVariable('PFK_POST_ID'),0)=0)and(odsTPostav.RecordCount <> 1) then // потом через связующую таблицу  (tlink_impnakl)
      begin
        odsTLINK_IMPNAKL.Close;
        odsTLINK_IMPNAKL.SetVariable('pfc_their_value', odsTIMP_DOC.FieldByName('fc_src_postav').AsString);
        odsTLINK_IMPNAKL.SetVariable('pfn_our_table_num', TCO_TPOSTAV);
        odsTLINK_IMPNAKL.SetVariable('pfk_post_id', null);
        odsTLINK_IMPNAKL.Open;
        if (odsTLINK_IMPNAKL.RecordCount = 1) then
          oqUpdDoc.SetVariable('PFK_POST_ID', odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsVariant);
      end;

      if nvl(oqUpdDoc.GetVariable('PFK_POST_ID'),0)=0 then
      begin // не получилось найти
        n1 := -1;
        if (odsTPostav.RecordCount > 1) then
          n1 := nvl(odsTPostav.FieldByName('postavid').AsInteger,-1)
        else if (odsTLINK_IMPNAKL.RecordCount > 1) then
          n1 := nvl(odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsInteger,-1);
        oqUpdDoc.SetVariable('PFK_POST_ID', n1);
//        oqUpdDoc.SetVariable('PFK_POST_ID', DoShowPostavLst(n1, True, 'Поставщик:: '+odsTIMP_DOC.FieldByName('fc_src_postav').AsString));
        if (oqUpdDoc.GetVariable('PFK_POST_ID') < 0)or(odsTIMP_DOC.FieldByName('fc_src_postav').AsString='') then
        begin
          ParseMessage := 'Поставщик не определен.'#13#10'Дальнейшая обработка накладной невозможна.';

          Result := PE_FK_DOC_POSTAVSHIK; // без поставщика невозможна дальнейшая обработка
        end
        else
        begin
          InsTLINK_IMPNAKL(TCO_TPOSTAV, oqUpdDoc.GetVariable('PFK_POST_ID'), oqUpdDoc.GetVariable('PFK_POST_ID'),
                           TCT_TPOSTAV, null, nvl(odsTIMP_DOC_ITEMS.FieldByName('fc_src_medic_torg_name').AsVariant,''));
        end;
      end;
      odsTPostav.Close;
      odsTLINK_IMPNAKL.Close;
      oqUpdDoc.Execute;

      i := 0;
      odsTIMP_DOC_ITEMS2.CLose;
      odsTIMP_DOC_ITEMS2.SetVariable('PFK_IMP_DOC_ID', DocID);
      odsTIMP_DOC_ITEMS2.Open;
      odsTIMP_DOC_ITEMS2.First;
      while (odsTIMP_DOC_ITEMS2.Active)and(odsTIMP_DOC_ITEMS2.Eof = False) do
      begin
        oqUpdDocItem.ClearVariables;
        s := ExcludeNonFloatChars(nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_medic_kolvo').AsVariant,''));
        if TryStrToFloat(s, TempFloat) then
          oqUpdDocItem.SetVariable('PFN_PRS_MEDIC_KOLVO', TempFloat)
        else
        begin
          Result := PE_FN_MEDIC_KOLVO;
          ParseMessage := 'Поле "Кол-во медикаментов" в строке №'+IntToStr(i+1)+' содержит некорректную информацию';
        end;

        if Trim(nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_godnost').AsVariant,'')) = '' then
        begin
          Result := PE_FD_PARTY_GODNOST_EMPTY;
        end
        else
        begin
          if TryStrToDateByFormat(nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_godnost').AsVariant,''), TempDate, PARTY_GODNOST_FORMAT) then
            oqUpdDocItem.SetVariable('PFD_PRS_PARTY_GODNOST', TempDate)
          else
          begin
            Result := PE_FD_PARTY_GODNOST;
            ParseMessage := 'Поле "Срок годности" в строке №'+IntToStr(i+1)+' содержит некорректную информацию';
          end;
        end;

        s := ExcludeNonFloatChars(nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_summ_nds').AsVariant,''));
        if TryStrToFloat(s, TempFloat) then
          oqUpdDocItem.SetVariable('pfn_prs_party_summ_nds', TempFloat)
        else
        begin
          Result := PE_FN_PARTY_SUMM_S_NDS;
          ParseMessage := 'Поле "Сумма с НДС" в строке №'+IntToStr(i+1)+' содержит некорректную информацию';
        end;

        s := ExcludeNonFloatChars(nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_price_bez_nds').AsVariant,''));
        if TryStrToFloat(s, TempFloat) then
          oqUpdDocItem.SetVariable('PFN_PRS_PARTY_PRICE', TempFloat)
        else
        begin
          Result := PE_FN_PARTY_PRICE;
          ParseMessage := 'Поле "Цена без НДС" в строке №'+IntToStr(i+1)+' содержит некорректную информацию';
        end;

        if Trim(nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_nds').AsVariant,'')) = '' then
        begin
          Result := PE_FN_NDS_EMPTY;
        end
        else
        begin
          s := ExcludeNonFloatChars(nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_nds').AsVariant,''));
          if TryStrToFloat(s, TempFloat) then
            oqUpdDocItem.SetVariable('PFN_PRS_NDS', TempFloat)
          else
          begin
            Result := PE_FN_NDS;
            ParseMessage := 'Поле "НДС" в строке №'+IntToStr(i+1)+' содержит некорректную информацию';
          end;
        end;

        if Trim(nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_medic_id_their').AsVariant,'')) = '' then
        begin
          Result := PE_FK_MEDIC_THEIR;
        end
        else
        begin
          s := ExcludeNonFloatChars(nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_medic_id_their').AsVariant,''));
          if TryStrToInt(s, TempInt) then
            oqUpdDocItem.SetVariable('PFK_PRS_MEDIC_ID_THEIR', TempInt)
          else
          begin
            Result := PE_FK_MEDIC_THEIR;
            ParseMessage := 'Поле "ID наименования поставщика" в строке №'+IntToStr(i+1)+' содержит некорректную информацию';
          end;
        end;

        // ищем медикамент
        // сначала прямое совпадение
        odsTMedic.Close;
        odsTMedic.SetVariable('pfc_name', nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_medic_torg_name').AsVariant,''));
        odsTMedic.Open;
        if (odsTMedic.RecordCount = 1) then
          oqUpdDocItem.SetVariable('PFK_PRS_MEDIC_ID_OUR',odsTMedic.FieldByName('medicid').AsVariant);

        if (nvl(oqUpdDocItem.GetVariable('PFK_PRS_MEDIC_ID_OUR'),0)=0)and(odsTMedic.RecordCount <> 1) then // потом через связующую таблицу  (tlink_impnakl)
        begin
          odsTLINK_IMPNAKL.Close;
          odsTLINK_IMPNAKL.SetVariable('pfc_their_value', nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_medic_torg_name').AsVariant,''));
          odsTLINK_IMPNAKL.SetVariable('pfn_our_table_num', TCO_TMEDIC);
          odsTLINK_IMPNAKL.SetVariable('pfk_post_id', oqUpdDoc.GetVariable('PFK_POST_ID'));
          odsTLINK_IMPNAKL.Open;
          if (odsTLINK_IMPNAKL.RecordCount = 1) then
            oqUpdDocItem.SetVariable('PFK_PRS_MEDIC_ID_OUR', odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsVariant);
        end;

        if nvl(oqUpdDocItem.GetVariable('PFK_PRS_MEDIC_ID_OUR'),0)=0 then
        begin // не получилось найти
          n1 := -1;
          if (odsTMedic.RecordCount > 1) then
            n1 := nvl(odsTMedic.FieldByName('medicid').AsInteger,-1)
          else if (odsTLINK_IMPNAKL.RecordCount > 1) then
            n1 := nvl(odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsInteger,-1);
          if n1 <> -1 then
            oqUpdDocItem.SetVariable('PFK_PRS_MEDIC_ID_OUR', n1);
    //      DocImp.DocITEMSImp[i].FK_MEDIC_ID_OUR := DoShowMedic(n1, True, True, True, '', 'Медикамент:: '+DocImp.DocITEMSImp[i].ImpItem[IFI_MEDIC_TORG_NAME], nvl(dmMain.CurMO_SKLAD_ID,0));
          if (nvl(oqUpdDocItem.GetVariable('PFK_PRS_MEDIC_ID_OUR'),-1) < 0)or( nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_medic_torg_name').AsVariant,'')='') then
          begin
            ParseMessage := ParseMessage + #13#10'Медикамент из строки №'+IntToStr(i+1)+' не определен. ('+ nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_medic_torg_name').AsVariant,'')+')';
            Result := PE_FK_MEDIC; // без медикамента невозможна дальнейшая обработка
          end
          else
          begin
            InsTLINK_IMPNAKL(TCO_TMEDIC, oqUpdDocItem.GetVariable('PFK_PRS_MEDIC_ID_OUR'), oqUpdDoc.GetVariable('PFK_POST_ID'),
                             TCT_TMEDIC, oqUpdDocItem.GetVariable('PFK_PRS_MEDIC_ID_THEIR'), nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_medic_torg_name').AsVariant,''));
          end;
        end;
        odsTMedic.Close;

        // ищем единицу измерения
        // сначала прямое совпадение
        odsTEI.Close;
        odsTEI.SetVariable('pfc_name', nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_medic_ed_izm').AsVariant,''));
        odsTEI.Open;
        if (odsTEI.RecordCount = 1) then
          oqUpdDocItem.SetVariable('pfk_prs_medic_ed_izm', odsTEI.FieldByName('eiid').AsVariant);

        if (nvl(oqUpdDocItem.GetVariable('pfk_prs_medic_ed_izm'),0)=0)and(odsTEI.RecordCount <> 1) then // потом через связующую таблицу  (tlink_impnakl)
        begin
          odsTLINK_IMPNAKL.Close;
          odsTLINK_IMPNAKL.SetVariable('pfc_their_value', nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_medic_ed_izm').AsVariant,''));
          odsTLINK_IMPNAKL.SetVariable('pfn_our_table_num', TCO_TEI);
          odsTLINK_IMPNAKL.SetVariable('pfk_post_id', oqUpdDoc.GetVariable('PFK_POST_ID'));
          odsTLINK_IMPNAKL.Open;
          if (odsTLINK_IMPNAKL.RecordCount = 1) then
            oqUpdDocItem.SetVariable('pfk_prs_medic_ed_izm', odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsVariant);
        end;

        if nvl(oqUpdDocItem.GetVariable('pfk_prs_medic_ed_izm'),0)=0 then
        begin // не получилось найти
          n1 := -1;
          if (odsTEI.RecordCount > 1) then
            n1 := nvl(odsTEI.FieldByName('eiid').AsInteger,-1)
          else if (odsTLINK_IMPNAKL.RecordCount > 1) then
            n1 := nvl(odsTLINK_IMPNAKL.FieldByName('fk_prs_medic_ed_izm').AsInteger,-1);
          if n1 <> -1 then
          begin
            oqUpdDocItem.SetVariable('pfk_prs_medic_ed_izm', n1);
            InsTLINK_IMPNAKL(TCO_TPRODCERT, oqUpdDocItem.GetVariable('pfk_prs_medic_ed_izm'),   oqUpdDoc.GetVariable('PFK_POST_ID'),
                             TCT_TPROD,     null, nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_medic_ed_izm').AsVariant,''));
          end;

          if (nvl(oqUpdDocItem.GetVariable('pfk_prs_party_proizvoditel'),-1) < 0)or( nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_medic_ed_izm').AsVariant,'')='') then
          begin
            ParseMessage := ParseMessage + #13#10'Единица измерения из строки №'+IntToStr(i+1)+' не определена. ('+ nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_medic_ed_izm').AsVariant,'')+')';
            Result := PE_FK_ED_IZM;
          end;
        end;
        odsTEI.close;

        // ищем производителя
        // сначала прямое совпадение
        odsTProdCert.Close;
        odsTProdCert.SetVariable('pfc_name', nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_proizvoditel').AsVariant,'Не указан'));
        odsTProdCert.SetVariable('PISCERT', 0);
        odsTProdCert.Open;
        if (odsTProdCert.RecordCount = 1) then
          oqUpdDocItem.SetVariable('pfk_prs_party_proizvoditel', odsTProdCert.FieldByName('fk_id').AsVariant);

        if (nvl(oqUpdDocItem.GetVariable('pfk_prs_party_proizvoditel'),0)=0)and(odsTProdCert.RecordCount <> 1) then // потом через связующую таблицу  (tlink_impnakl)
        begin
          odsTLINK_IMPNAKL.Close;
          odsTLINK_IMPNAKL.SetVariable('pfc_their_value', nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_proizvoditel').AsVariant,''));
          odsTLINK_IMPNAKL.SetVariable('pfn_our_table_num', TCO_TPRODCERT);
          odsTLINK_IMPNAKL.SetVariable('pfk_post_id', oqUpdDoc.GetVariable('PFK_POST_ID'));
          odsTLINK_IMPNAKL.Open;
          if (odsTLINK_IMPNAKL.RecordCount = 1) then
            oqUpdDocItem.SetVariable('pfk_prs_party_proizvoditel', odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsVariant);
        end;

        if nvl(oqUpdDocItem.GetVariable('pfk_prs_party_proizvoditel'),0)=0 then
        begin // не получилось найти
          n1 := -1;
          if (odsTProdCert.RecordCount > 1) then
            n1 := nvl(odsTProdCert.FieldByName('fk_id').AsInteger,-1)
          else if (odsTLINK_IMPNAKL.RecordCount > 1) then
            n1 := nvl(odsTLINK_IMPNAKL.FieldByName('fk_prs_party_proizvoditel').AsInteger,-1);

          if n1 <> -1 then
          begin
            oqUpdDocItem.SetVariable('pfk_prs_party_proizvoditel', n1);
            InsTLINK_IMPNAKL(TCO_TPRODCERT, oqUpdDocItem.GetVariable('pfk_prs_party_proizvoditel'),   oqUpdDoc.GetVariable('PFK_POST_ID'),
                             TCT_TPROD,     null, nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_proizvoditel').AsVariant,''));
          end;

          if (nvl(oqUpdDocItem.GetVariable('pfk_prs_party_proizvoditel'),-1) < 0)or( nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_proizvoditel').AsVariant,'')='') then
          begin
            ParseMessage := ParseMessage + #13#10'Производитель из строки №'+IntToStr(i+1)+' не определен. ('+ nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_proizvoditel').AsVariant,'')+')';
            Result := PE_FK_PRODID;
          end;
        end;
        odsTProdCert.close;        

        // ищем сертификат
        // сначала прямое совпадение
        odsTProdCert.Close;
        odsTProdCert.SetVariable('pfc_name', nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_sertifikat').AsVariant,''));
        odsTProdCert.SetVariable('PISCERT', 1);        
        odsTProdCert.Open;
        if (odsTProdCert.RecordCount = 1) then
          oqUpdDocItem.SetVariable('pfk_prs_party_sertifikat', odsTProdCert.FieldByName('fk_id').AsVariant);

        if (nvl(oqUpdDocItem.GetVariable('pfk_prs_party_sertifikat'),0)=0)and(odsTProdCert.RecordCount <> 1) then // потом через связующую таблицу  (tlink_impnakl)
        begin
          odsTLINK_IMPNAKL.Close;
          odsTLINK_IMPNAKL.SetVariable('pfc_their_value', nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_sertifikat').AsVariant,''));
          odsTLINK_IMPNAKL.SetVariable('pfn_our_table_num', TCO_TPRODCERT);
          odsTLINK_IMPNAKL.SetVariable('pfk_post_id', oqUpdDoc.GetVariable('PFK_POST_ID'));
          odsTLINK_IMPNAKL.Open;
          if (odsTLINK_IMPNAKL.RecordCount = 1) then
            oqUpdDocItem.SetVariable('pfk_prs_party_sertifikat', odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsVariant);
        end;

        if nvl(oqUpdDocItem.GetVariable('pfk_prs_party_sertifikat'),0)=0 then
        begin // не получилось найти
          n1 := -1;
          if (odsTProdCert.RecordCount > 1) then
            n1 := nvl(odsTProdCert.FieldByName('fk_id').AsInteger,-1)
          else if (odsTLINK_IMPNAKL.RecordCount > 1) then
            n1 := nvl(odsTLINK_IMPNAKL.FieldByName('fk_our_key_field_value').AsInteger,-1);
          if n1 <> -1 then
          begin
            oqUpdDocItem.SetVariable('pfk_prs_party_sertifikat', n1);
            InsTLINK_IMPNAKL(TCO_TPRODCERT, oqUpdDocItem.GetVariable('pfk_prs_party_sertifikat'), oqUpdDoc.GetVariable('PFK_POST_ID'),
                             TCT_TCERT,     null,                                                 nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_sertifikat').AsVariant,''));
          end;

          if (nvl(oqUpdDocItem.GetVariable('pfk_prs_party_sertifikat'),-1) < 0)or( nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_sertifikat').AsVariant,'')='') then
          begin
            TempFloat := nvl(oqUpdDocItem.GetVariable('pfk_prs_party_proizvoditel'),0);
            if TempFloat = 0 then
            begin
              oqAddProdCert.SetVariable('FC_VALUE', nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_proizvoditel').AsVariant,'Не указан'));
              oqAddProdCert.SetVariable('PID', 0);
              oqAddProdCert.Execute;
              TempFloat := nvl(oqAddProdCert.GetVariable('pID'),-1);

              oqUpdDocItem.SetVariable('pfk_prs_party_proizvoditel', TempFloat);

              InsTLINK_IMPNAKL(TCO_TPRODCERT, oqUpdDocItem.GetVariable('pfk_prs_party_proizvoditel'),   oqUpdDoc.GetVariable('PFK_POST_ID'),
                               TCT_TPROD,     null, nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_proizvoditel').AsVariant,''));
            end;

            oqAddProdCert.SetVariable('FC_VALUE', nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_sertifikat').AsVariant,''));
            oqAddProdCert.SetVariable('PID', TempFloat);
            oqAddProdCert.Execute;
            TempFloat := nvl(oqAddProdCert.GetVariable('pID'),-1);
//            dmMain.pkgProdCert.Add(nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_sertifikat').AsVariant,''), TempFloat);
            oqUpdDocItem.SetVariable('pfk_prs_party_sertifikat', TempFloat);
            InsTLINK_IMPNAKL(TCO_TPRODCERT, oqUpdDocItem.GetVariable('pfk_prs_party_sertifikat'), oqUpdDoc.GetVariable('PFK_POST_ID'),
                             TCT_TCERT,     null,                                                 nvl(odsTIMP_DOC_ITEMS2.FieldByName('fc_src_party_sertifikat').AsVariant,''));
          end;
        end;
        odsTProdCert.close;

        oqUpdDocItem.SetVariable('pDocItemID', odsTIMP_DOC_ITEMS2.FieldByName('FK_ID').AsVariant);
        oqUpdDocItem.Execute;

        // ставим статус
        oqSET_IMP_ITEM_STATUS.SetVariable('PFK_DOCITEM_ID', odsTIMP_DOC_ITEMS2.FieldByName('FK_ID').AsVariant);
        oqSET_IMP_ITEM_STATUS.Execute;

        odsTIMP_DOC_ITEMS2.Next;
        Inc( i );
      end;
    except
      Application.MessageBox('Документ не может быть корректно разобран.'#13#10'Обратитесь к в службу поддержки.', 'ОШИБКА', MB_OK+MB_ICONERROR);
    end;
    
  finally
    os.Commit;
    odsTProdCert_list.Close;
    odsTProdCert_list.Open;
    RefreshIMP_DOCS( DocID );
  end;
end;

//function TfmImportNakl.OpenXML_OKB(aXMLDocument1 : TXMLDocument; aFileName : string) : Boolean;
//var
//  i1: Integer;
//  N : IXMLNode;
//begin
//  aXMLDocument1.FileName := aFileName;
//  try
//    aXMLDocument1.Active:=True;
//  except
//    on E:Exception do
//    begin
//     ShowMessage('Не могу открыть настройки!'#13#10+E.Message);
//     Result := False;
//     Exit;
//    end;
//  end;
//
//  oqAddDoc.Session.Savepoint('BeforeAdd');
//  try
//    try
//      N := aXMLDocument1.DocumentElement.ChildNodes['ЗаголовокДокумента'];
//
//      oqAddDoc.ClearVariables;
//      oqAddDoc.SetVariable('pfc_src_doc_num', Trim(NVL(N.ChildNodes['НомерДок'].NodeValue,'')));
//      oqAddDoc.SetVariable('pfc_src_doc_date', Trim(NVL(N.ChildNodes['ДатаДок'].NodeValue,'')));
//      oqAddDoc.SetVariable('pfc_src_postav', Trim(NVL(N.ChildNodes['Поставщик'].NodeValue,'')));
//      oqAddDoc.SetVariable('pfc_src_kontrakt', '');
//      oqAddDoc.SetVariable('pfc_src_vid_oplati', '');
//      oqAddDoc.SetVariable('pfc_src_schet_faktura', '');
//      oqAddDoc.SetVariable('pfc_src_comment', '');
//      oqAddDoc.SetVariable('pfc_src_summa_s_nds', Trim(NVL(N.ChildNodes['СуммаОптВклНДС'].NodeValue,'')));
//      oqAddDoc.SetVariable('pfc_src_kolvo_pos', Trim(NVL(N.ChildNodes['Позиций'].NodeValue,'')));
//      oqAddDoc.SetVariable('pfc_imp_filename', aFileName);
//      oqAddDoc.Execute;
//      DocID := oqAddDoc.GetVariable('pDocID');      
//
//      for i1 := 0 to aXMLDocument1.DocumentElement.ChildNodes['ТоварныеПозиции'].ChildNodes.Count-1 do
//      begin
//        N := aXMLDocument1.DocumentElement.ChildNodes['ТоварныеПозиции'].ChildNodes[i1];
//        oqAddDocItem.ClearVariables;
//        oqAddDocItem.SetVariable('pfk_imp_doc_id', DocID);
//        oqAddDocItem.SetVariable('pfc_src_num', '');
//        oqAddDocItem.SetVariable('pfc_src_medic_torg_name', Trim(NVL(N.ChildNodes['Товар'].NodeValue,'')));
//        oqAddDocItem.SetVariable('pfc_src_medic_id_their', '');
//        oqAddDocItem.SetVariable('pfc_src_medic_ed_izm', Trim(NVL(N.ChildNodes['Единица'].NodeValue,'')));
//        oqAddDocItem.SetVariable('pfc_src_medic_kolvo', Trim(NVL(N.ChildNodes['Количество'].NodeValue,'')));
//        oqAddDocItem.SetVariable('pfc_src_party_seria', Trim(NVL(N.ChildNodes['Серии'].ChildNodes['Серия'].ChildNodes['СерияТовара'].NodeValue,'')));
//        oqAddDocItem.SetVariable('pfc_src_party_godnost', Trim(NVL(N.ChildNodes['Серии'].ChildNodes['Серия'].ChildNodes['СрокГодностиТовара'].NodeValue,'')));
//        oqAddDocItem.SetVariable('pfc_src_party_price_bez_nds',  Trim(NVL(N.ChildNodes['ЦенаОпт'].NodeValue,'')));
//        oqAddDocItem.SetVariable('pfc_src_party_summ_nds', NVL(N.ChildNodes['СуммаОптВклНДС'].NodeValue,''));
//        oqAddDocItem.SetVariable('pfc_src_nds', Trim(NVL(N.ChildNodes['СтавкаНДС'].NodeValue,'')));
//        oqAddDocItem.SetVariable('pfc_src_party_proizvoditel', '');
//        oqAddDocItem.SetVariable('pfc_src_party_sertifikat', Trim(NVL(N.ChildNodes['Серии'].ChildNodes['Серия'].ChildNodes['НомерСертиф'].NodeValue,''))+' до '+
//                                                             Trim(NVL(N.ChildNodes['Серии'].ChildNodes['Серия'].ChildNodes['СрокДействияСертиф'].NodeValue,''))+', '+
//                                                             Trim(NVL(N.ChildNodes['Серии'].ChildNodes['Серия'].ChildNodes['ОрганСертиф'].NodeValue,''))
//                                                             );
//        oqAddDocItem.Execute;
//      end;
//      Result := True;
//    except
//      result := False;
//      oqAddDoc.Session.RollbackToSavepoint('BeforeAdd');
//      DocID := 0;
//    end;
//  finally
//    aXMLDocument1.Active:=False;
//  end;
//  os.Commit;
//  DOC_DATE_FORMAT      := 'YYYY-MM-DD';
//  PARTY_GODNOST_FORMAT := 'DD/MM/YYYY';
//end;



procedure TfmImportNakl.buLoadClick(Sender: TObject);
begin
  if cmbImportSource.ItemIndex >= 0 then
  begin
    case cmbImportSource.ItemIndex of
      0:
      begin
        if dm_Import.opdXLS.Execute then
        begin
          if dm_Import.OpenExcel(dm_Import.opdXLS.FileName, XlApp, XlSheet, DocID ) then
          begin
            os.Commit;
            DOC_DATE_FORMAT      := 'DD.MM.YYYY';
            PARTY_GODNOST_FORMAT := 'DD.MM.YYYY';

            ParseError := DoParse;
          end;
        end;
      end;
      1:
      begin
        if dm_Import.opdXML.Execute then
        begin
          if dm_Import.OpenXML_OKB(dm_Import.opdXML.FileName, dm_Import.XMLDocument1, DocID) then
          begin
            os.Commit;
            DOC_DATE_FORMAT      := 'YYYY-MM-DD';
            PARTY_GODNOST_FORMAT := 'MM/DD/YYYY';
            ParseError := DoParse;
          end;
        end;
      end;
    end;
  end
  else
  begin
    Application.MessageBox('Не выбран источник импорта','ВНИМАНИЕ', MB_OK+MB_ICONWARNING);
    cmbImportSource.DroppedDown := True;
  end;
end;

procedure TfmImportNakl.odsTIMP_DOCAfterScroll(DataSet: TDataSet);
begin
  if FIsNeedRefreshItems then
  begin
    odsTIMP_DOC_ITEMS.Close;
    odsTIMP_DOC_ITEMS.SetVariable('PFK_IMP_DOC_ID', odsTIMP_DOC.FieldByName('FK_ID').AsVariant);
    odsTIMP_DOC_ITEMS.Open;
    odsTIMP_DOC_ITEMS.First;
    FIsNeedRefreshItems := False;
  end;

  buImport.Enabled := ( odsTIMP_DOC.FieldByName('FN_IMP_DOC_STATUS').AsInteger >= 0 )and
                      ( odsTIMP_DOC.FieldByName('FD_IMPORT').IsNull );
  buKontrNakl.Enabled := (odsTIMP_DOC.FieldByName('fk_post_id').IsNull = False);
  grTIMP_DOCDBBandedTableView1FL_CHECK_DOGOVOR.Options.Editing := VarIsNull(grTIMP_DOCDBBandedTableView1fk_spec_id.EditValue);
  grTIMP_DOCDBBandedTableView1FL_IS_CHECKED.Options.Editing    := VarIsNull(grTIMP_DOCDBBandedTableView1fk_spec_id.EditValue);
end;

procedure TfmImportNakl.odsTIMP_DOCBeforeEdit(DataSet: TDataSet);
begin
  grTIMP_DOCDBBandedTableView1FL_CHECK_DOGOVOR.Options.Editing := VarIsNull(grTIMP_DOCDBBandedTableView1fk_spec_id.EditValue);
  grTIMP_DOCDBBandedTableView1FL_IS_CHECKED.Options.Editing    := VarIsNull(grTIMP_DOCDBBandedTableView1fk_spec_id.EditValue);
end;

procedure TfmImportNakl.odsTIMP_DOCBeforeOpen(DataSet: TDataSet);
begin
  odsTIMP_DOC.AfterScroll := nil;
end;

procedure TfmImportNakl.odsTIMP_DOCAfterOpen(DataSet: TDataSet);
begin
  odsTIMP_DOC.AfterScroll := odsTIMP_DOCAfterScroll;
  odsTIMP_DOCAfterScroll(DataSet);
end;

procedure TfmImportNakl.bbuExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmImportNakl.RefreshIMP_DOCS( aDocIDLocate : integer = -1 ; aRefreshItems : Boolean = True);
begin
  odsTIMP_DOC.AfterScroll := nil;
  odsTIMP_DOC.BeforeOpen := nil;
  odsTIMP_DOC.AfterOpen := nil;

  odsTIMP_DOC.Close;
  odsTIMP_DOC.Open;

  if aDocIDLocate > 0 then
  begin
    odsTIMP_DOC.Locate('FK_ID', aDocIDLocate, []);
  end;

  odsTIMP_DOC.AfterScroll := odsTIMP_DOCAfterScroll;
  odsTIMP_DOC.BeforeOpen := odsTIMP_DOCBeforeOpen;
  odsTIMP_DOC.AfterOpen := odsTIMP_DOCAfterOpen;

  FIsNeedRefreshItems := aRefreshItems;
  odsTIMP_DOCAfterScroll(odsTIMP_DOC);
end;

procedure TfmImportNakl.grTIMP_DOCDBBandedTableView1FK_POST_IDPropertiesEditValueChanged(Sender: TObject);
begin
  InsTLINK_IMPNAKL(TCO_TPOSTAV, grTIMP_DOCDBBandedTableView1FK_POST_ID.EditValue, grTIMP_DOCDBBandedTableView1FK_POST_ID.EditValue,
                   TCT_TPOSTAV, null, odsTIMP_DOC.FieldByName('fc_src_postav').AsString);

  odsTIMP_DOC_ITEMS2.Close;
  odsTIMP_DOC_ITEMS2.SetVariable('PFK_IMP_DOC_ID', odsTIMP_DOC.FieldByName('FK_ID').AsVariant);
  odsTIMP_DOC_ITEMS2.Open;
  odsTIMP_DOC_ITEMS2.First;
  while (odsTIMP_DOC_ITEMS2.Active)and(odsTIMP_DOC_ITEMS2.Eof = False) do
  begin
    oqSET_IMP_ITEM_STATUS.SetVariable('PFK_DOCITEM_ID', odsTIMP_DOC_ITEMS2.FieldByName('FK_ID').AsVariant);
    oqSET_IMP_ITEM_STATUS.Execute;
    odsTIMP_DOC_ITEMS2.Next;
  end;
  os.Commit;
  RefreshIMP_DOCS( odsTIMP_DOC_ITEMS2.GetVariable('PFK_IMP_DOC_ID') );
  odsTIMP_DOC_ITEMS2.Close;
end;

procedure TfmImportNakl.grTIMP_DOCDBBandedTableView1FL_CHECK_DOGOVORPropertiesChange(
  Sender: TObject);
begin
    grTIMP_DOCDBBandedTableView1FL_CHECK_DOGOVOR.Options.Editing := VarIsNull(grTIMP_DOCDBBandedTableView1fk_spec_id.EditValue);
    grTIMP_DOCDBBandedTableView1FL_IS_CHECKED.Options.Editing    := VarIsNull(grTIMP_DOCDBBandedTableView1fk_spec_id.EditValue);
end;

procedure TfmImportNakl.grTIMP_DOCDBBandedTableView1FL_CHECK_DOGOVORPropertiesEditValueChanged(
  Sender: TObject);
begin
  odsTIMP_DOC_ITEMS2.Close;
  odsTIMP_DOC_ITEMS2.SetVariable('PFK_IMP_DOC_ID', odsTIMP_DOC.FieldByName('FK_ID').AsVariant);
  odsTIMP_DOC_ITEMS2.Open;
  odsTIMP_DOC_ITEMS2.First;
  while (odsTIMP_DOC_ITEMS2.Active)and(odsTIMP_DOC_ITEMS2.Eof = False) do
  begin
    oqSET_IMP_ITEM_STATUS.SetVariable('PFK_DOCITEM_ID', odsTIMP_DOC_ITEMS2.FieldByName('FK_ID').AsVariant);
    oqSET_IMP_ITEM_STATUS.Execute;
    odsTIMP_DOC_ITEMS2.Next;
  end;
  os.Commit;
  RefreshIMP_DOCS( odsTIMP_DOC_ITEMS2.GetVariable('PFK_IMP_DOC_ID') );
  odsTIMP_DOC_ITEMS2.Close;
end;

procedure TfmImportNakl.grTIMP_DOCDBBandedTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  FIsNeedRefreshItems := True;
end;

procedure TfmImportNakl.InsTLINK_IMPNAKL(afn_our_table_num,
  afk_our_key_field_value, afk_post_id, afn_their_table_num,
  afk_their_key_field_value, afc_their_value: variant);
begin
  oqInsTLINK_IMPNAKL.ClearVariables;
  oqInsTLINK_IMPNAKL.SetVariable('pfn_our_table_num', afn_our_table_num);
  oqInsTLINK_IMPNAKL.SetVariable('pfk_our_key_field_value', afk_our_key_field_value);
  oqInsTLINK_IMPNAKL.SetVariable('pfk_post_id', afk_post_id);
  oqInsTLINK_IMPNAKL.SetVariable('pfn_their_table_num', afn_their_table_num);
  oqInsTLINK_IMPNAKL.SetVariable('pfk_their_key_field_value', afk_their_key_field_value);
  oqInsTLINK_IMPNAKL.SetVariable('pfc_their_value', afc_their_value);
  oqInsTLINK_IMPNAKL.Execute;
end;

procedure TfmImportNakl.buDelDocClick(Sender: TObject);
begin
  if Application.MessageBox('Вы уверены что хотите удалить документ?','Внимание', MB_YESNO+MB_ICONQUESTION) = IDYES	then
  begin
    grTIMP_DOCDBBandedTableView1.DataController.DeleteFocused;
    os.Commit;
  end;
end;

procedure TfmImportNakl.buDelItemClick(Sender: TObject);
begin
  if Application.MessageBox('Вы уверены что хотите удалить позицию из документа?','Внимание', MB_YESNO+MB_ICONQUESTION) = IDYES	then
  begin
    grTIMP_DOC_ITEMSDBBandedTableView1.DataController.DeleteFocused;
    os.Commit;
    // обновляем статус документа
    RefreshIMP_DOCS( odsTIMP_DOC.FieldByName('FK_ID').AsInteger, False );
  end;
end;

procedure TfmImportNakl.buEditClick(Sender: TObject);
begin
  grTIMP_DOCDBBandedTableView1.OptionsData.Editing       := buEdit.SpeedButtonOptions.Down;
  grTIMP_DOC_ITEMSDBBandedTableView1.OptionsData.Editing := buEdit.SpeedButtonOptions.Down;

  if (grTIMP_DOCDBBandedTableView1.OptionsData.Editing)and(odsTIMP_DOC.FieldByName('FD_DOC_DATE').IsNull) then
  begin
    DocID := odsTIMP_DOC.FieldByName('fk_id').AsInteger;
    DOC_DATE_FORMAT      := odsTIMP_DOC.FieldByName('FC_DOC_DATE_FORMAT').AsString;
    PARTY_GODNOST_FORMAT := odsTIMP_DOC.FieldByName('FC_PARTY_GODNOST_FORMAT').AsString;
    if Application.MessageBox('Документ не был до конца сопоставлен.'#13#10'Сопоставить сейчас?', '', MB_YESNO+MB_ICONQUESTION) = ID_YES then
      ParseError := DoParse;
  end;  
end;

procedure TfmImportNakl.buImportClick(Sender: TObject);
begin
  if odsTIMP_DOC.FieldByName('FN_IMP_DOC_STATUS').AsInteger >= 0 then
    try
      oqMakeImportNaklMedics.ClearVariables;
      oqMakeImportNaklMedics.SetVariable('PFK_IMP_DOC_ID', odsTIMP_DOC.FieldByName('FK_ID').AsVariant);
      oqMakeImportNaklMedics.Execute;
      os.Commit;
      Application.MessageBox('Импорт прошел успешно.'#13#10'Не забудьте подписать документ в списке приходов.', '', MB_OK+MB_ICONINFORMATION);
    except
      Application.MessageBox('Не удается импортировать документ.'#13#10'Обратитесь в службу поддержки.', 'ОШИБКА', MB_OK+MB_ICONERROR);
    end
  else
    Application.MessageBox('Не заполнены все обязательные поля. Импорт не возможен.'#13#10'Обратитесь в службу поддержки.', 'ОШИБКА', MB_OK+MB_ICONERROR);  
end;

procedure TfmImportNakl.buKontrNaklClick(Sender: TObject);
var
  i, HeaderRow : integer;
  Excel : Variant;
  kontr : string;
  fn_summ_dogovor, fn_summ_nakl : double;
begin
  kontr := odsTIMP_DOC.FieldByName('fc_src_kontrakt').AsString;

//  kontr := InputBox( 'Контракт', 'Введите номер контракта:', odsTIMP_DOC.FieldByName('fc_src_kontrakt').AsString );
  if DoSelectKontrakt( os, odsTIMP_DOC.FieldByName('FK_POST_ID').AsInteger, kontr )=False then Exit;

  Screen.Cursor := crHourGlass;
  Excel:=CreateOleObject('Excel.Application');
  Excel.Workbooks.Add;

//   настройки страницы
  Excel.ActiveSheet.PageSetup.LeftMargin := 57;
  Excel.ActiveSheet.PageSetup.RightMargin := 27;
  Excel.ActiveSheet.PageSetup.TopMargin := 27;
  Excel.ActiveSheet.PageSetup.BottomMargin := 27;
  Excel.ActiveSheet.PageSetup.FooterMargin := Excel.ActiveSheet.PageSetup.BottomMargin - 7;
  Excel.ActiveSheet.PageSetup.LeftFooter := '&"Arial,обычный"&7' + ReadMedotradeSign;

//   настройка столбиков
  Excel.ActiveSheet.Columns['A:A'].ColumnWidth := 3;
  Excel.ActiveSheet.Columns['B:B'].ColumnWidth := 23;
  Excel.ActiveSheet.Columns['C:C'].ColumnWidth := 8;
  Excel.ActiveSheet.Columns['D:D'].ColumnWidth := 8;
  Excel.ActiveSheet.Columns['E:E'].ColumnWidth := 9;
  Excel.ActiveSheet.Columns['F:F'].ColumnWidth := 13;
  Excel.ActiveSheet.Columns['G:G'].ColumnWidth := 8;
  Excel.ActiveSheet.Columns['H:H'].ColumnWidth := 13;
  Excel.ActiveSheet.Columns['I:I'].ColumnWidth := 8;
  Excel.ActiveSheet.Columns['J:J'].ColumnWidth := 13;

// шапка
  Excel.ActiveSheet.Range['A1','B1'].MergeCells := True;
  Excel.ActiveSheet.Range['A1','B1'].Font.Bold := True;
  Excel.ActiveSheet.Range['A1','B1'].Font.Size := 14;
  Excel.ActiveSheet.Range['A1','B1'].HorizontalAlignment := xlRight;
  Excel.ActiveSheet.Range['A1','B1'].VerticalAlignment := xlCenter;
  Excel.ActiveSheet.Cells[ 1, 1 ].Value := 'Поставщик:';
  Excel.ActiveSheet.Range['C1','F1'].MergeCells := True;
  Excel.ActiveSheet.Range['C1','F1'].Font.Size := 14;
  Excel.ActiveSheet.Range['C1','F1'].HorizontalAlignment := xlLeft;
  Excel.ActiveSheet.Range['C1','F1'].VerticalAlignment := xlCenter;
  Excel.ActiveSheet.Cells[ 1, 3 ].Value := grTIMP_DOCDBBandedTableView1FK_POST_ID.Properties.GetDisplayText( grTIMP_DOCDBBandedTableView1FK_POST_ID.EditValue );

  Excel.ActiveSheet.Range['A2','B2'].MergeCells := True;
  Excel.ActiveSheet.Range['A2','B2'].Font.Bold := True;
  Excel.ActiveSheet.Range['A2','B2'].Font.Size := 14;
  Excel.ActiveSheet.Range['A2','B2'].HorizontalAlignment := xlRight;
  Excel.ActiveSheet.Range['A2','B2'].VerticalAlignment := xlCenter;
  Excel.ActiveSheet.Cells[ 2, 1 ].Value := 'Контракт:';

  Excel.ActiveSheet.Range['C2','F2'].MergeCells := True;
  Excel.ActiveSheet.Range['C2','F2'].Font.Size := 14;
  Excel.ActiveSheet.Range['C2','F2'].HorizontalAlignment := xlLeft;
  Excel.ActiveSheet.Range['C2','F2'].VerticalAlignment := xlCenter;
  Excel.ActiveSheet.Cells[ 2, 3 ].Value := kontr;

//   настройка заголовка
  HeaderRow := 4;
  Excel.ActiveSheet.Range['A'+IntToStr(HeaderRow),'J'+IntToStr(HeaderRow)].Interior.ColorIndex := 15;
  Excel.ActiveSheet.Range['A'+IntToStr(HeaderRow),'J'+IntToStr(HeaderRow)].Interior.Pattern := xlSolid;
  Excel.ActiveSheet.Range['A'+IntToStr(HeaderRow),'J'+IntToStr(HeaderRow)].Borders.LineStyle := xlContinuous;
  Excel.ActiveSheet.Range['A'+IntToStr(HeaderRow),'J'+IntToStr(HeaderRow)].HorizontalAlignment := xlCenter;
  Excel.ActiveSheet.Range['A'+IntToStr(HeaderRow),'J'+IntToStr(HeaderRow)].VerticalAlignment := xlCenter;
  Excel.ActiveSheet.Rows[IntToStr(HeaderRow)+':'+IntToStr(HeaderRow)].RowHeight := 40;
  Excel.ActiveSheet.Range['A'+IntToStr(HeaderRow),'J'+IntToStr(HeaderRow)].Font.Bold := True;

  Excel.ActiveSheet.Cells[ HeaderRow, 1 ].Value := '№';
  Excel.ActiveSheet.Cells[ HeaderRow, 2 ].Value := 'Название';
  Excel.ActiveSheet.Cells[ HeaderRow, 3 ].Value := 'Ед. имз.';
  Excel.ActiveSheet.Cells[ HeaderRow, 4 ].Value := 'Кол-во по дог.';
  Excel.ActiveSheet.Cells[ HeaderRow, 5 ].Value := 'Цена по дог.';
  Excel.ActiveSheet.Cells[ HeaderRow, 6 ].Value := 'Сумма по дог.';
  Excel.ActiveSheet.Cells[ HeaderRow, 7 ].Value := 'Кол-во по накл.';
  Excel.ActiveSheet.Cells[ HeaderRow, 8 ].Value := 'Сумма по накл.';
  Excel.ActiveSheet.Cells[ HeaderRow, 9 ].Value := 'Недопост. кол.';
  Excel.ActiveSheet.Cells[ HeaderRow, 10].Value := 'Недопост. сумма';
  Excel.ActiveSheet.Range['A'+IntToStr(HeaderRow),'J'+IntToStr(HeaderRow)].WrapText := True;


//          Excel.ActiveSheet.Range['A'+IntToStr(CurRow),'C'+IntToStr(CurRow)].MergeCells := True;
//          Excel.ActiveSheet.Range['A'+IntToStr(CurRow),'C'+IntToStr(CurRow)].Interior.ColorIndex := 15;
//          Excel.ActiveSheet.Range['A'+IntToStr(CurRow),'C'+IntToStr(CurRow)].Interior.Pattern := xlSolid;
//          Excel.ActiveSheet.Cells[ CurRow, 1 ].Value := CUR_OTD;
//          Excel.ActiveSheet.Range['A'+IntToStr(CurRow),'C'+IntToStr(CurRow)].Font.Bold := True;
//  Excel.ActiveSheet.Range['A1','C1'].MergeCells := True;
//  Excel.ActiveSheet.Range['A1','C1'].Font.Bold := True;
//  Excel.ActiveSheet.Range['A1','C1'].Font.Size := 14;


//  Excel.ActiveSheet.Cells[ 1, 1 ].Value := 'Прейскурант цен на платные услуги';

  fn_summ_dogovor := 0; fn_summ_nakl := 0;
  dm_Import.odsNaklByDogovor.Close;
  dm_Import.odsNaklByDogovor.SetVariable('PPOSTID', odsTIMP_DOC.FieldByName('fk_post_id').AsVariant);
  dm_Import.odsNaklByDogovor.SetVariable('PFC_DOG_NUM', kontr);
  dm_Import.odsNaklByDogovor.Open;
  dm_Import.odsNaklByDogovor.First;
  i := 1;
  while i <= dm_Import.odsNaklByDogovor.RecordCount do
  begin
    Excel.ActiveSheet.Cells[ i+HeaderRow, 1 ].Value := i;
    Excel.ActiveSheet.Cells[ i+HeaderRow, 2 ].Value := dm_Import.odsNaklByDogovor.FieldByName('fc_medic').AsVariant;
    Excel.ActiveSheet.Cells[ i+HeaderRow, 3 ].Value := dm_Import.odsNaklByDogovor.FieldByName('fc_ei').AsVariant;
    Excel.ActiveSheet.Cells[ i+HeaderRow, 4 ].Value := dm_Import.odsNaklByDogovor.FieldByName('fn_dog_kol').AsVariant;
    Excel.ActiveSheet.Cells[ i+HeaderRow, 5 ].Value := dm_Import.odsNaklByDogovor.FieldByName('fn_dog_price').AsVariant;
    Excel.ActiveSheet.Cells[ i+HeaderRow, 6 ].Value := dm_Import.odsNaklByDogovor.FieldByName('fn_dog_sum').AsVariant;
    Excel.ActiveSheet.Cells[ i+HeaderRow, 7 ].Value := dm_Import.odsNaklByDogovor.FieldByName('fn_nakl_kol').AsVariant;
    Excel.ActiveSheet.Cells[ i+HeaderRow, 8 ].Value := dm_Import.odsNaklByDogovor.FieldByName('fn_nakl_sum').AsVariant;
    Excel.ActiveSheet.Cells[ i+HeaderRow, 9 ].Value := dm_Import.odsNaklByDogovor.FieldByName('fn_nedopost_kol').AsVariant;
    Excel.ActiveSheet.Cells[ i+HeaderRow, 10].Value := dm_Import.odsNaklByDogovor.FieldByName('fn_nedopost_sum').AsVariant;

    fn_summ_dogovor := fn_summ_dogovor + dm_Import.odsNaklByDogovor.FieldByName('fn_dog_sum').AsFloat;
    fn_summ_nakl    := fn_summ_nakl    + dm_Import.odsNaklByDogovor.FieldByName('fn_nakl_sum').AsFloat;
    dm_Import.odsNaklByDogovor.Next;
    inc( i );
  end;
  dm_Import.odsNaklByDogovor.Close;

// итоговые суммы
  Excel.ActiveSheet.Range['F'+IntToStr(i+HeaderRow),'F'+IntToStr(i+HeaderRow)].Font.Bold := True;
  Excel.ActiveSheet.Range['F'+IntToStr(i+HeaderRow),'F'+IntToStr(i+HeaderRow)].HorizontalAlignment := xlRight;
  Excel.ActiveSheet.Range['F'+IntToStr(i+HeaderRow),'F'+IntToStr(i+HeaderRow)].VerticalAlignment := xlCenter;
  Excel.ActiveSheet.Cells[ i+HeaderRow, 6 ].Value := fn_summ_dogovor;

  Excel.ActiveSheet.Range['H'+IntToStr(i+HeaderRow),'H'+IntToStr(i+HeaderRow)].Font.Bold := True;
  Excel.ActiveSheet.Range['H'+IntToStr(i+HeaderRow),'H'+IntToStr(i+HeaderRow)].HorizontalAlignment := xlRight;
  Excel.ActiveSheet.Range['H'+IntToStr(i+HeaderRow),'H'+IntToStr(i+HeaderRow)].VerticalAlignment := xlCenter;
  Excel.ActiveSheet.Cells[ i+HeaderRow, 8 ].Value := fn_summ_nakl;


  Excel.Visible:=True;
  Excel.ActiveSheet.Range['A'+IntToStr(HeaderRow),'J'+IntToStr(i+HeaderRow-1)].Borders.LineStyle := xlContinuous;
  Screen.Cursor := crDefault;
end;

procedure TfmImportNakl.grTIMP_DOC_ITEMSDBBandedTableView1EditValueChanged( Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem );
begin
//  if AItem.Index = grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ID_OUR.Index then
//    InsTLINK_IMPNAKL(TCO_TMEDIC, grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ID_OUR.EditValue, odsTIMP_DOC.FieldByName('fk_post_id').AsVariant,
//                     TCT_TMEDIC, grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ID_THEIR.EditValue, nvl(odsTIMP_DOC_ITEMS.FieldByName('fc_src_medic_torg_name').AsVariant,''));

  grTIMP_DOC_ITEMSDBBandedTableView1.DataController.PostEditingData;
  oqSET_IMP_ITEM_STATUS.SetVariable('PFK_DOCITEM_ID', odsTIMP_DOC_ITEMS.FieldByName('FK_ID').AsVariant);
  oqSET_IMP_ITEM_STATUS.Execute;
  os.Commit;

  odsTIMP_DOC_ITEMS.Close;
  odsTIMP_DOC_ITEMS.Open;
  odsTIMP_DOC_ITEMS.Locate('FK_ID', oqSET_IMP_ITEM_STATUS.GetVariable('PFK_DOCITEM_ID'), []);

  // обновляем статус документа
//  RefreshIMP_DOCS( odsTIMP_DOC.FieldByName('FK_ID').AsInteger, False );
  odsTIMP_DOC.RefreshRecord;
end;

procedure TfmImportNakl.grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ID_OURPropertiesEditValueChanged(
  Sender: TObject);
begin
  InsTLINK_IMPNAKL(TCO_TMEDIC, grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ID_OUR.EditValue, odsTIMP_DOC.FieldByName('fk_post_id').AsVariant,
                   TCT_TMEDIC, grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ID_THEIR.EditValue, nvl(odsTIMP_DOC_ITEMS.FieldByName('fc_src_medic_torg_name').AsVariant,''));

  oqSET_IMP_ITEM_STATUS.SetVariable('PFK_DOCITEM_ID', odsTIMP_DOC_ITEMS.FieldByName('FK_ID').AsVariant);
  oqSET_IMP_ITEM_STATUS.Execute;
  os.Commit;

//  odsTIMP_DOC_ITEMS.Close;
//  odsTIMP_DOC_ITEMS.Open;
//  odsTIMP_DOC_ITEMS.Locate('FK_ID', oqSET_IMP_ITEM_STATUS.GetVariable('PFK_DOCITEM_ID'), []);
  odsTIMP_DOC_ITEMS.RefreshRecord;

  RefreshIMP_DOCS( odsTIMP_DOC.FieldByName('FK_ID').AsVariant, False );
end;

procedure TfmImportNakl.grTIMP_DOC_ITEMSDBBandedTableView1FC_IMP_STATUSCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[ grTIMP_DOC_ITEMSDBBandedTableView1FN_IMP_STATUS.Index ] >= 0 then
    ACanvas.Brush.Color := $00E5FFE5
  else
    ACanvas.Brush.Color := $00E5E5FF;
end;

procedure TfmImportNakl.grTIMP_DOCDBBandedTableView1FC_IMP_DOC_STATUSCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[ grTIMP_DOCDBBandedTableView1FN_IMP_DOC_STATUS.Index ] >= 0 then
    ACanvas.Brush.Color := $00E5FFE5
  else
    ACanvas.Brush.Color := $00E5E5FF;
end;

procedure TfmImportNakl.grTIMP_DOCDBBandedTableView1FD_DOC_DATEPropertiesEditValueChanged(
  Sender: TObject);
begin
//  odsTIMP_DOC.AfterScroll := nil;
//  odsTIMP_DOC.RefreshRecord;
//  odsTIMP_DOC.AfterScroll := odsTIMP_DOCAfterScroll;
//  RefreshIMP_DOCS( odsTIMP_DOC.FieldByName('FK_ID').AsVariant );
  grTIMP_DOCDBBandedTableView1.DataController.PostEditingData;
  grTIMP_DOCDBBandedTableView1.DataController.Post();
  RefreshIMP_DOCS( odsTIMP_DOC.FieldByName('FK_ID').AsVariant );

end;

procedure TfmImportNakl.grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ED_IZMPropertiesEditValueChanged(
  Sender: TObject);
begin
  InsTLINK_IMPNAKL(TCO_TEI, grTIMP_DOC_ITEMSDBBandedTableView1FK_PRS_MEDIC_ED_IZM.EditValue, odsTIMP_DOC.FieldByName('fk_post_id').AsVariant,
                   TCT_TEI, null, nvl(odsTIMP_DOC_ITEMS.FieldByName('fc_src_medic_ed_izm').AsVariant,''));
                   
  oqSET_IMP_ITEM_STATUS.SetVariable('PFK_DOCITEM_ID', odsTIMP_DOC_ITEMS.FieldByName('FK_ID').AsVariant);
  oqSET_IMP_ITEM_STATUS.Execute;
  os.Commit;

//  odsTIMP_DOC_ITEMS.RefreshRecord;
  odsTIMP_DOC_ITEMS.Close;
  odsTIMP_DOC_ITEMS.Open;
  odsTIMP_DOC_ITEMS.Locate('FK_ID', oqSET_IMP_ITEM_STATUS.GetVariable('PFK_DOCITEM_ID'), []);
end;

procedure TfmImportNakl.FormCreate(Sender: TObject);
//var
//  OstDate : TDate;
begin
  // выставляем сессии
  dm_Import.SetSession( os );
  // открываем сессию
	try
    if GetSession(os, 'ASU') = False then RaiseException(0,0,0,nil);
//  		os.LogOn;
	except
		MessageBox(Application.Handle, pChar('Невозможно соединиться с сервером БД!' + #10#13 +
			'Обратитесь к администратору.'),'Ошибка',mb_ok + mb_iconerror);
		Application.Terminate;
		Abort;
	end;

  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;

  Self.Caption := Application.Title;

  // загружаем из базы флаги работы аптеки
  ConfigParams := uParams.TParams.Create;
  ConfigParams.AddParam('FUNC_DOGOVOR_NAKL_ENABLE',          False, LOAD_FUNC_DOGOVOR_NAKL_ENABLE, '', '');
  ConfigParams.AddParam('FUNC_IMP_NAKL_ENABLE',              False, LOAD_FUNC_IMP_NAKL_ENABLE, '', '');
  ConfigParams.AddParam('FUNC_NAKL_OPEN',                    False, LOAD_FUNC_NAKL_OPEN, '', '');

  ConfigParams.LoadAllParams;

  odsTPostav_List.Open;
  FIsNeedRefreshItems := True;
  odsTIMP_DOC.Open;
//  odsMedicsList.SetVariable('PFK_SKLAD_ID', oqInitMO.GetVariable('PCUR_MO_SKLAD_ID'));
  odsMedicsList.Open;
  odsTProdCert_list.Open;
  odsTIMP_DOCAfterScroll( odsTIMP_DOC );
  FIsNeedRefreshItems := True;  

  buKontrNakl.Visible := (ConfigParams.GetParamValue('FUNC_DOGOVOR_NAKL_ENABLE', False));
  buImport.Visible    := (ConfigParams.GetParamValue('FUNC_IMP_NAKL_ENABLE', False)    );
  paOpen.Visible      := (ConfigParams.GetParamValue('FUNC_NAKL_OPEN', False)    );
end;

procedure TfmImportNakl.LOAD_FUNC_DOGOVOR_NAKL_ENABLE(var aValue: variant);
begin
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(os, FK_APPSOTR_ID, 'FUNC_DOGOVOR_NAKL_ENABLE') > 0);// Added by Voronov 30.09.2009
  except
    aValue := False;
  end;
end;

procedure TfmImportNakl.LOAD_FUNC_NAKL_OPEN(var aValue: variant);
begin
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(os, FK_APPSOTR_ID, 'FUNC_NAKL_OPEN') > 0);// Added by Voronov 37.10.2009
  except
    aValue := False;
  end;
end;


procedure TfmImportNakl.LOAD_FUNC_IMP_NAKL_ENABLE(var aValue: variant);
begin
  try
    aValue := (DO_CHECK_OBJECT_ACCESS(os, FK_APPSOTR_ID, 'FUNC_IMP_NAKL_ENABLE') > 0);// Added by Voronov 30.09.2009
  except
    aValue := False;
  end;
end;

end.

