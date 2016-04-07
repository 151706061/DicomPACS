unit fm_Main;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ActnList, ImgList,
  ComCtrls, ToolWin, Db, OracleData, Oracle, HtmlHlp,
  cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCheckComboBox, cxCheckBox,
  Menus, cxLookAndFeelPainters, cxButtons, OracleMonitor, JvCombobox,
  Variants, dxSkinsCore, dxSkinsDefaultPainters, cxCalendar, cxGroupBox,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dm_Main,
  JvArrowButton, cxDBLookupComboBox, cxLookupEdit, cxDBLookupEdit,
  cxGridBandedTableView, cxGridDBBandedTableView, JvExControls, JvExMask,
  JvToolEdit, cxCurrencyEdit, JvComponentBase, JvFormPlacement, cxSpinEdit,
  IniFiles, JvRichEditToHtml, JvExStdCtrls, JvRichEdit, cxMemo, cxRichEdit,
  cxCustomPivotGrid, cxDBPivotGrid, cxPC, cxGridCustomPopupMenu, cxGridPopupMenu;

const
// названия разделов в ini-файле
  cSECT_SCHEME_LIST   = 'SchemeList';
  cIDENT_SCHEMES_COUNT = 'SchemesCount';

  сSUM_FORMAT_CURRENCY = ',0.00;-,0.00';
  сSUM_FORMAT_NUMBER   = ',0.#######';

  сAUTOSAVE_NAME = 'Автосохранение';

type
  TfmMain = class(TForm)
    alActions: TActionList;
    acExit: TAction;
    pmDocsFilterPeriod: TPopupMenu;
    N19: TMenuItem;
    N14: TMenuItem;
    N20: TMenuItem;
    N18: TMenuItem;
    N16: TMenuItem;
    N21: TMenuItem;
    N17: TMenuItem;
    N15: TMenuItem;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    grbDocTypes: TcxGroupBox;
    chbOst: TcxCheckBox;
    chbPrihDocs: TcxCheckBox;
    chbRashDocs: TcxCheckBox;
    grbPeriod: TcxGroupBox;
    abuSetDocPeriod: TJvArrowButton;
    chbDate1: TcxCheckBox;
    chbDate2: TcxCheckBox;
    dedDate2: TcxDateEdit;
    dedDate1: TcxDateEdit;
    grbSelectBy: TcxGroupBox;
    chbSelectByDocs: TcxCheckBox;
    chbSelectByMedics: TcxCheckBox;
    Panel2: TPanel;
    buRefresh: TcxButton;
    buExcel: TcxButton;
    cxButton3: TcxButton;
    acExcel: TAction;
    acRefresh: TAction;
    lcbMO_group: TcxLookupComboBox;
    JvFormStorage1: TJvFormStorage;
    pmColumn: TPopupMenu;
    acColumnAddToGroup: TAction;
    acColumnHide: TAction;
    acColumnSortAsc: TAction;
    acColumnSortDesc: TAction;
    miColHide: TMenuItem;
    N2: TMenuItem;
    miColAddGroup: TMenuItem;
    N4: TMenuItem;
    miColSortAsc: TMenuItem;
    miColSortDesc: TMenuItem;
    miColSortNone: TMenuItem;
    miColClearGroup: TMenuItem;
    cmbDocScheme: TcxComboBox;
    buDocSchemeDel: TcxButton;
    buDocSchemeAdd: TcxButton;
    acSelectDocScheme: TAction;
    miColReturnFirstName: TMenuItem;
    N9: TMenuItem;
    miColSetName: TMenuItem;
    miColSumSeparator: TMenuItem;
    miColSumItog: TMenuItem;
    miColSumGroup: TMenuItem;
    miColSumGroupName: TMenuItem;
    miColSumDel: TMenuItem;
    ilImages: TImageList;
    acDocSchemeDel: TAction;
    acDocSchemeAdd: TAction;
    acSettings: TAction;
    cxButton2: TcxButton;
    cxPageControl1: TcxPageControl;
    tsTableReport: TcxTabSheet;
    tsCrossReport: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DPID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_DOCMIX: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FD_DATA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_DOCNAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FD_INVOICE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_DOC: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_DVIG_TYPE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_OTKUDA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_KUDA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_DOC_FINSOURCE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_DOC_PAYCOND: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_COMMENT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1POSTAVID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FN_PRICE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FL_EDIT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_VID_SPISANIE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_FIRST_LETTER: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_MEDICNAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_NAME_LAT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FN_KOL_UP: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_UP_EI: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FN_KOL_FAS: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_FAS_EI: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FN_FPACKINUPACK: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FN_PARTY_PRICE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FN_MED_SUM: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FD_GODEN: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_SERIAL: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_UCHGR: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FD_DATE_SPIS: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FK_CREATE_MO_ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FD_CREATE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FK_EDIT_MO_ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FD_EDIT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1MEDICID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1KARTID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DPCID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FK_SKLAD_ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FL_EQUIPMENT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_KART_FINSOURCE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_CERT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_PROD: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    cxDBPivotGrid1: TcxDBPivotGrid;
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    cxGrid1DBBandedTableView1FC_KONTRAKT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_INV_NOMER: TcxGridDBBandedColumn;
    tsOborot: TcxTabSheet;
    grOborot: TcxGrid;
    grOborot_tv: TcxGridDBBandedTableView;
    grOborot_tv_FC_FIRST_LETTER: TcxGridDBBandedColumn;
    grOborot_tv_FC_MEDICNAME: TcxGridDBBandedColumn;
    grOborot_tv_FC_NAME_LAT: TcxGridDBBandedColumn;
    cxGridDBBandedColumn21: TcxGridDBBandedColumn;
    grOborot_tv_FC_UP_EI: TcxGridDBBandedColumn;
    grOborot_tv_FC_FAS_EI: TcxGridDBBandedColumn;
    grOborot_tv_FN_FPACKINUPACK: TcxGridDBBandedColumn;
    grOborot_tv_FN_PARTY_PRICE: TcxGridDBBandedColumn;
    cxGridDBBandedColumn27: TcxGridDBBandedColumn;
    grOborot_tv_FD_GODEN: TcxGridDBBandedColumn;
    grOborot_tv_FC_SERIAL: TcxGridDBBandedColumn;
    grOborot_tv_FC_UCHGR: TcxGridDBBandedColumn;
    grOborot_tv_MEDICID: TcxGridDBBandedColumn;
    grOborot_tv_KARTID: TcxGridDBBandedColumn;
    grOborot_tv_FK_SKLAD_ID: TcxGridDBBandedColumn;
    grOborot_tv_FL_EQUIPMENT: TcxGridDBBandedColumn;
    grOborot_tv_FC_KART_FINSOURCE: TcxGridDBBandedColumn;
    grOborot_tv_FC_CERT: TcxGridDBBandedColumn;
    grOborot_tv_FC_PROD: TcxGridDBBandedColumn;
    grOborot_tv_FC_INV_NOMER: TcxGridDBBandedColumn;
    cxGridLevel1: TcxGridLevel;
    grOborot_tvColumn1: TcxGridDBBandedColumn;
    grOborot_tvColumn3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FN_NDS: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FN_NACENKA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FN_PRICE_MNF: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FL_JNVLS: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1fc_farmgr: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_INTERNATIONAL_NAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_QUOTA_CODE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_FOREIGHN: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_DOZA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_TRADENAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_OTKUDA_MO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_KUDA_MO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FL_MIBP: TcxGridDBBandedColumn;
    cxGridPopupMenu1: TcxGridPopupMenu;
    cxGrid1DBBandedTableView1fc_schet_faktura: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_ATC: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FC_ATC_ROOT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1POSTAV_INN: TcxGridDBBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure chbDate1Click(Sender: TObject);
    procedure chbDate2Click(Sender: TObject);
    procedure acExcelExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure chbPrihDocsClick(Sender: TObject);
    procedure chbOstClick(Sender: TObject);
    procedure chbSelectByDocsClick(Sender: TObject);
    procedure chbSelectByMedicsClick(Sender: TObject);
    procedure cxGrid1DBBandedTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure miColHideClick(Sender: TObject);
    procedure acSelectDocSchemeExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbDocSchemePropertiesCloseUp(Sender: TObject);
    procedure JvFormStorage1SavePlacement(Sender: TObject);
    procedure acDocSchemeDelExecute(Sender: TObject);
    procedure acDocSchemeAddExecute(Sender: TObject);
    procedure acSettingsExecute(Sender: TObject);
    procedure tsCrossReportShow(Sender: TObject);

  PRIVATE
    { Private declarations }
//    FSelStr : string;
    {FDefValue, FSectionName,} FIniName : string;
    FNotRefresh : Boolean;
    iniFile : TiniFile;
    FIsLoadScheme : Boolean;
    FFirstColumnName : TStringList;
    FColSumGroupName : array of string;

    procedure SetColumnSettings(aCol : TcxGridDBBandedColumn; aSettingID : integer);
    function EncodeHexToString(aHexStr: string): string;
    function EncodeStringToHex(aStr: string): string;
    function HideScheme(aSchemeName: string): boolean;
    procedure SaveScheme(aSchemeName: string);
    function LoadScheme(aSchemeName: string; aIsShowErrorMessage : Boolean = True) : Boolean;

  PUBLIC
    { Public declarations }
  end;

var
  fmMain      : TfmMain;

implementation


uses {fSelectCheckedList,} fCheckedListEdit, ComObj, DateUtils, ShellAPI,
     cxGridExportLink, cxExportPivotGridLink,
     fHeaderSetup, Excel2000, OleCtrls, Word2000,  uGlobalConst, StrUtils
     {$IFDEF MIS2}
     {$ELSE}
     ,SmmainAPI
     {$ENDIF}
     ;

{$R *.DFM}

function GetTempFileFullName( aPrefix : string ) : string;
var
  temp_path, temp_file : array[1..MAX_PATH] of Char;
begin
   // генерим временный файл
   ZeroMemory(@temp_path, MAX_PATH);
   GetTempPath(MAX_PATH, @temp_path);
   ZeroMemory(@temp_file, MAX_PATH);
   GetTempFileName(@temp_path, PAnsiChar(aPrefix), 0, @temp_file );
   Result :=  Trim(StringReplace(String(temp_file), #0, ' ', [rfReplaceAll]));
end;

function IniReadString(sIniFile: string; Section, Ident: string; Default: string = ''): string;
var
	ini: TIniFile;
begin
	ini := TIniFile.Create(sIniFile);
	Result := ini.ReadString(Section, Ident, Default);
	ini.free;
end;

procedure IniWriteString(sIniFile: string; Section, Ident: string; val: string = '');
var
	ini: TIniFile;
begin
	ini := TIniFile.Create(sIniFile);
	ini.WriteString(Section, Ident, val);
	ini.free;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  i, SchemesCount : Integer;
  SchemeName : string;
  f : TcxDBPivotGridField;
begin
  try
//    dmMain.os.LogOn;
  {$IFDEF MIS2}
    dmMain.os.Preferences.ConvertUTF := cuUTF8ToUTF16;
    dmMain.os.LogonDatabase := 'MIS2';
    dmMain.os.LogonUsername := 'MIS';
    dmMain.os.LogonPassword := '1';
    dmMain.os.LogOn;
  {$ELSE}
    GetSession(dmMain.os, 'ASU');
  {$ENDIF}
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;


  FIniName := ChangeFileExt(Application.ExeName,'.ini'); // дефолтовое имя ини-файла
  iniFile := TIniFile.Create( FIniName );
  Self.Caption := Application.Title;
  FIsLoadScheme := False;

// сохраняем первоначальные названия столбцов
  FFirstColumnName := TStringList.Create;
  FFirstColumnName.Clear;
  for I := 0 to cxGrid1DBBandedTableView1.ColumnCount - 1 do
    FFirstColumnName.Add(cxGrid1DBBandedTableView1.Columns[i].Caption);

  // заполняем комбобокс значениями из ини-файла
  cmbDocScheme.Properties.Items.Clear;
  SchemesCount := iniFile.ReadInteger(cSECT_SCHEME_LIST, cIDENT_SCHEMES_COUNT, 0);
  for i := 1 to SchemesCount do
  begin
    SchemeName := iniFile.ReadString (cSECT_SCHEME_LIST, 'Scheme_'+IntToStr(i), '');
    if iniFile.ReadInteger(SchemeName,    'Visible', 0) = 1 then
      cmbDocScheme.Properties.Items.Add( EncodeHexToString(SchemeName));
  end;
  SetLength(FColSumGroupName, cxGrid1DBBandedTableView1.ColumnCount);

  dedDate2.EditValue := Now;
  dedDate1.EditValue := StartOfTheMonth(Now);

 // инициализация  полей для формирования сводного отчета
  while (cxDBPivotGrid1.FieldCount > 0) do
    cxDBPivotGrid1.Fields[0].Destroy;

  for i := 0 to cxGrid1DBBandedTableView1.ColumnCount-1 do
  begin
    if (cxGrid1DBBandedTableView1.Columns[i].Position.Band.Visible) and (cxGrid1DBBandedTableView1.Columns[i].Visible) then
    begin // если поле видимо, добавляем его а список
      f := TcxDBPivotGridField.Create( cxDBPivotGrid1 );
      f.PivotGrid := cxDBPivotGrid1;
      f.DataBinding.FieldName :=  cxGrid1DBBandedTableView1.Columns[i].DataBinding.FieldName;
      f.Caption :=  cxGrid1DBBandedTableView1.Columns[i].Caption;
    end;
  end; // for i := 0 to cxGrid1DBBandedTableView1.ColumnCount-1 do

  cxPageControl1.ActivePageIndex := 0;
end;

procedure TfmMain.acDocSchemeAddExecute(Sender: TObject);
var
  sSchemeName : string;
  i : Integer;
begin
  sSchemeName := Trim(cmbDocScheme.Text);
  if sSchemeName = '' then
  begin
    Application.MessageBox('Не введено название схемы отчета ', 'Внимание', MB_OK+MB_ICONERROR);
    Exit;
  end;

  SaveScheme( sSchemeName );
  i := 0;
  while (i < cmbDocScheme.Properties.Items.Count)and(cmbDocScheme.Properties.Items[i] <> sSchemeName) do
    Inc( i );

  if (i >= cmbDocScheme.Properties.Items.Count) then
    cmbDocScheme.Properties.Items.Add(sSchemeName);
  cmbDocScheme.ItemIndex := i; // автоматически выбираем сохраненную схему
  buDocSchemeDel.Enabled := (cmbDocScheme.ItemIndex <> -1); // CloseUp не срабатывает - делаем вручную
end;

procedure TfmMain.acDocSchemeDelExecute(Sender: TObject);
begin
  if (cmbDocScheme.ItemIndex < 0) then
  begin
    Application.MessageBox('Не выбрана схема отчета', 'Внимание', MB_OK+MB_ICONERROR);
    Exit;
  end;
  if HideScheme(cmbDocScheme.Text) then
  begin
    cmbDocScheme.Properties.Items.Delete(cmbDocScheme.ItemIndex);
    cmbDocScheme.ItemIndex := -1;
  end;
end;

procedure TfmMain.acExcelExecute(Sender: TObject);
var
  StrLHF, StrL2 : TStringList;
  InsPosH, InsPosF, i, i1, i2 : integer;
  s, s_table, fname : string;
  Excel, MSWord : Variant;
  ExcelVersion : integer;
begin
   fname :=  GetTempFileFullName('repPrihRashDocs');

   if cxPageControl1.ActivePage.Caption = 'Таблица' then
     ExportGridToExcel(fname+'.xls', cxGrid1)
   else if cxPageControl1.ActivePage.Caption = 'Сводный отчет' then
     cxExportPivotGridToExcel(fname+'.xls', cxDBPivotGrid1)
   else
     Exit;
   
  //Если стоит печать в Open Office
  if ((ReadMedotradePrintDocLocal() = '0') or ((ReadMedotradePrintDocLocal() = '') and (ReadMedotradePrintDocGlobal() = '0'))) then
  begin
    ShellExecute( 0, PChar('open'), PChar(fname+'.xls'), nil, nil, SW_SHOWMAXIMIZED );
  end
  else
  begin
   Excel:=CreateOleObject('Excel.Application');
   Excel.Workbooks.Open(fname+'.xls');
//   Excel.ActiveSheet.PageSetup.Orientation:=xlLandscape;
   Excel.ActiveSheet.PageSetup.LeftMargin := 27;
   Excel.ActiveSheet.PageSetup.RightMargin := 27;
   Excel.ActiveSheet.PageSetup.TopMargin := 27;
   Excel.ActiveSheet.PageSetup.BottomMargin := 27;
   Excel.ActiveSheet.PageSetup.FooterMargin := Excel.ActiveSheet.PageSetup.BottomMargin - 7;
   Excel.ActiveSheet.PageSetup.LeftFooter := '&"Arial,обычный"&7' + ReadMedotradeSign;

   if TryStrToInt(copy(Excel.Version,1,2), ExcelVersion) = False then
     ExcelVersion := 12; // 2007 офис

   if ExcelVersion < 12 then
   begin
     Excel.DisplayAlerts := False;
     Excel.ActiveWorkbook.SaveAs (fname+'.html', xlHtml);

     if not VarIsEmpty(Excel) then begin   // We are connected with MsExcel
       Excel.Quit; // Close MsExcel
  //     FreeAndNil(Excel);
       VarClear(Excel);
     end;

     MSWord:=CreateOleObject('Word.Application');

     StrLHF := TStringList.Create;
     StrL2:= TStringList.Create;
     StrL2.LoadFromFile(fname+'.html');
     s := StrL2.Text;

     // достаем настройку основной таблицы для правильного формирования футера
     s_table := '';
     i1 := pos('<table', s);
     i2 := pos('<tr', s);
     if (i1 > 0) and (i2 > 0) and (i1 < i2) then
       s_table := Copy(s, i1, i2-i1)+#13#10' <tr> </tr> </table>'#13#10;

     InsPosH := Pos('<col ', s);
     if  InsPosH > 0 then
     begin
       // сохраняем header
       StrLHF.Clear;
       MSWord.Documents.Add;
       fmHeaderAndFooter.reHeader.SelectAll;
       fmHeaderAndFooter.reHeader.CopyToClipboard;
       MSWord.Selection.Paste;
       MSWord.ActiveDocument.SaveAs(fname+'_H.html', wdFormatHTML);
       MSWord.ActiveDocument.Close;
       StrLHF.LoadFromFile(fname+'_H.html');

       i1 := pos('<p class', StrLHF.Text);
       i2 := pos('</div>', StrLHF.Text);
       if (i1 > 0) and (i2 > 0) then
         StrLHF.Text := Copy(StrLHF.Text, i1, i2-i1)
       else
         StrLHF.Text := '';       

       Insert(StrLHF.Text, s,InsPosH);
     end;

     InsPosF := Pos('</body>', s);
     if  InsPosF > 0 then
     begin
       StrLHF.Clear;
       // сохраняем footer
       MSWord.Documents.Add;
       fmHeaderAndFooter.reFooter.SelectAll;
       fmHeaderAndFooter.reFooter.CopyToClipboard;
       MSWord.Selection.Paste;
       MSWord.ActiveDocument.SaveAs(fname+'_F.html', wdFormatHTML);
       MSWord.ActiveDocument.Close;
       StrLHF.LoadFromFile(fname+'_F.html');

       i1 := pos('<p class', StrLHF.Text);
       i2 := pos('</div>', StrLHF.Text);
       if (i1 > 0) and (i2 > 0) and (i1 < i2) then
         StrLHF.Text := Copy(StrLHF.Text, i1, i2-i1)
       else
         StrLHF.Text := '';       
       i := Pos('<col', s_table);
       Insert(StrLHF.Text, s_table, i);
       Insert(StrLHF.Text, s, InsPosF);
     end;

     StrL2.Text := s;
     StrL2.SaveToFile(fname+'_HF.html');
     StrL2.free;
     StrLHF.Free;

     MSWord.Quit;
     // чистим все временные файлы
     DeleteFile(fname);
     DeleteFile(fname+'.xls');
     DeleteFile(fname+'.html');
     DeleteFile(fname+'_H.html');
     DeleteFile(fname+'_F.html');

     // напоследок открываем полученный файл
     Excel:=CreateOleObject('Excel.Application');
     Excel.Workbooks.Open(fname+'_HF.html');
   end;

   Excel.Visible:= True;
  end;
end;

procedure TfmMain.acExitExecute(Sender: TObject);
begin
  if Application.MessageBox('Вы действительно хотите выйти из программы?','Подтверждение',MB_YESNO+MB_ICONINFORMATION)=ID_YES then
    Close;
end;

procedure TfmMain.acRefreshExecute(Sender: TObject);
var
  ods : TOracleDataSet;
  OLD_SQL, NEW_SQL, OLD_SQL_UPPER : string;
  i, j, start_search_pos, end_search_pos, cur_search_pos : integer;
  f : TcxDBPivotGridField;
begin
  if (chbPrihDocs.Checked or chbRashDocs.Checked or chbOst.Checked)and(lcbMO_group.Text = '') then
  begin
    lcbMO_group.DroppedDown := True;
    Exit;
  end;
  // сохраняем введенные значения
  dedDate1.PostEditValue;
  dedDate2.PostEditValue;
  lcbMO_group.PostEditValue;

  // заменяем датасет
  if chbOst.Checked then
  begin
    ods := dmMain.odsRepByOst;
  end
  else
  begin
    if chbSelectByMedics.Checked then
    begin
      ods := dmMain.odsRepByDocAndMedics;
    end
    else
    begin
      ods := dmMain.odsRepByDoc;
    end;
  end;

  cxGrid1DBBandedTableView1.Bands[0].Visible := chbSelectByDocs.Checked;
  cxGrid1DBBandedTableView1.Bands[1].Visible := chbSelectByMedics.Checked;

  cxGrid1DBBandedTableView1FC_DVIG_TYPE.VisibleForCustomization := (chbPrihDocs.Checked or chbRashDocs.Checked);
  if not(chbPrihDocs.Checked or chbRashDocs.Checked) then
    cxGrid1DBBandedTableView1FC_DVIG_TYPE.Visible := False;

  // автоматически комментим неиспользуемые столбцы
  dmMain.dsRep.DataSet.Close;
  dmMain.dsRep.DataSet := ods;

  Screen.Cursor := crHourGlass;
  ods.Close;
  OLD_SQL  := ods.SQL.Text;
  NEW_SQL := OLD_SQL;
  OLD_SQL_UPPER := AnsiUpperCase(OLD_SQL);

  try
    start_search_pos := pos('--------- BEGIN ---------', OLD_SQL_UPPER);
    end_search_pos := pos('--------- END ---------', OLD_SQL_UPPER);
    for i := 0 to cxGrid1DBBandedTableView1.ColumnCount-1 do
    begin
      if (cxGrid1DBBandedTableView1.Columns[i].Position.Band.Visible) and (cxGrid1DBBandedTableView1.Columns[i].Visible) then
      begin // если поле видимо, добавляем его а список
        j := 0;
        while (j < cxDBPivotGrid1.FieldCount)and(TcxDBPivotGridField(cxDBPivotGrid1.Fields[j]).DataBinding.FieldName <> cxGrid1DBBandedTableView1.Columns[i].DataBinding.FieldName) do
          Inc( j );
        if j >= cxDBPivotGrid1.FieldCount then // если его конечно там еще нет
        begin
          f := TcxDBPivotGridField.Create( cxDBPivotGrid1 );
          f.PivotGrid := cxDBPivotGrid1;
          f.DataBinding.FieldName :=  cxGrid1DBBandedTableView1.Columns[i].DataBinding.FieldName;
          f.Caption :=  cxGrid1DBBandedTableView1.Columns[i].Caption;
        end
        else
          TcxDBPivotGridField(cxDBPivotGrid1.Fields[j]).Caption := cxGrid1DBBandedTableView1.Columns[i].Caption;
      end // (cxGrid1DBBandedTableView1.Columns[i].Position.Band.Visible) and (cxGrid1DBBandedTableView1.Columns[i].Visible) then
      else
      begin // поле не используется - убираем все ссылки на него
        j := 0;
        while (j < cxDBPivotGrid1.FieldCount)and(TcxDBPivotGridField(cxDBPivotGrid1.Fields[j]).DataBinding.FieldName <> cxGrid1DBBandedTableView1.Columns[i].DataBinding.FieldName) do
          Inc( j );
        if j < cxDBPivotGrid1.FieldCount then
          cxDBPivotGrid1.Fields[j].Destroy;

        cur_search_pos := posEx(' AS '+UpperCase(cxGrid1DBBandedTableView1.Columns[i].DataBinding.FieldName), OLD_SQL_UPPER, start_search_pos);
        if (cur_search_pos < end_search_pos)and(cur_search_pos > start_search_pos) then
        begin
          j := cur_search_pos;
          while OLD_SQL_UPPER[j]<>#10 do
            dec(j);
          Insert('--', OLD_SQL_UPPER, j+1);
          Insert('--', NEW_SQL,      j+1);
          Inc(end_search_pos, 2);
        end; // if cur_search_pos < end_search_pos then
      end;
    end;
    ods.SQL.Text := NEW_SQL;

    if chbOst.Checked then
    begin
      if chbDate1.Checked then
        dmMain.oqRepByOstInit.SetVariable('PDATE1_FILTERED', 1)
      else
        dmMain.oqRepByOstInit.SetVariable('PDATE1_FILTERED', 0);
      dmMain.oqRepByOstInit.SetVariable('PDATE1', dedDate1.Date);

      if chbDate2.Checked then
        dmMain.oqRepByOstInit.SetVariable('PDATE2_FILTERED', 1)
      else
        dmMain.oqRepByOstInit.SetVariable('PDATE2_FILTERED', 0);
      dmMain.oqRepByOstInit.SetVariable('PDATE2', dedDate2.Date);

      dmMain.oqRepByOstInit.SetVariable('PCUR_MOGROUP', lcbMO_group.EditValue);
      dmMain.oqRepByOstInit.Execute;
    end
    else
    begin
      if chbDate1.Checked then
        ods.SetVariable('PDATE1_FILTERED', 1)
      else
        ods.SetVariable('PDATE1_FILTERED', 0);
      ods.SetVariable('PDATE1', dedDate1.Date);

      if chbDate2.Checked then
        ods.SetVariable('PDATE2_FILTERED', 1)
      else
        ods.SetVariable('PDATE2_FILTERED', 0);
      ods.SetVariable('PDATE2', dedDate2.Date);

      ods.SetVariable('PCUR_MOGROUP', lcbMO_group.EditValue);
      if chbPrihDocs.Checked then
        ods.SetVariable('PPRIHDOC', 1)
      else
        ods.SetVariable('PPRIHDOC', 0);

      if chbRashDocs.Checked then
        ods.SetVariable('PRASHDOC', 1)
      else
        ods.SetVariable('PRASHDOC', 0);
    end;
    ods.Open;
  finally
    Screen.Cursor := crDefault;
    ods.SQL.Text := OLD_SQL;
  end;
end;

procedure TfmMain.N15Click(Sender: TObject);
var
  CurDate : TDate;
begin
  if not Assigned(Sender) then Exit;
  FNotRefresh := True;
  CurDate := dmMain.GetServerDateTime;
  case TMenuItem(Sender).Tag of
    1:  // прошлый год
    begin
      dedDate1.EditValue := Trunc(StartOfTheYear(IncYear(CurDate, -1)));
      dedDate2.EditValue := Trunc(EndOfTheYear(IncYear(CurDate, -1)));
    end;

    2:  // Текущий год
    begin
      dedDate1.EditValue := Trunc(StartOfTheYear(CurDate));
      dedDate2.EditValue := Trunc(EndOfTheYear(CurDate));
    end;

    3:  // прошлый месяц
    begin
      dedDate1.EditValue := Trunc(StartOfTheMonth(IncMonth(CurDate,-1)));
      dedDate2.EditValue := Trunc(EndOfTheMonth(IncMonth(CurDate,-1)));
    end;

    4:  // текущий месяц
    begin
      dedDate1.EditValue := Trunc(StartOfTheMonth(CurDate));
      dedDate2.EditValue := Trunc(EndOfTheMonth(CurDate));
    end;

    5:  // текущий день
    begin
      dedDate1.EditValue := Trunc(CurDate);
      dedDate2.EditValue := Trunc(CurDate);
    end;
  end;

  chbDate1.Checked := (TMenuItem(Sender).Tag <> 0)and(chbDate1.Enabled);
  chbDate2.Checked := (TMenuItem(Sender).Tag <> 0)and(chbDate2.Enabled);
  FNotRefresh := False;
end;

procedure TfmMain.miColHideClick(Sender: TObject);
begin
  pmColumn.Tag := TMenuItem(Sender).Tag;
end;

procedure TfmMain.chbDate1Click(Sender: TObject);
begin
  dedDate1.Enabled := chbDate1.Checked;
end;

procedure TfmMain.chbDate2Click(Sender: TObject);
begin
  dedDate2.Enabled := chbDate2.Checked;
end;

procedure TfmMain.chbOstClick(Sender: TObject);
begin
  chbPrihDocs.Enabled       := not chbOst.Checked;
  chbRashDocs.Enabled       := not chbOst.Checked;
  chbSelectByDocs.Enabled   := not chbOst.Checked;
  chbSelectByMedics.Enabled := not chbOst.Checked;
  chbSelectByMedics.Checked := chbOst.Checked;

  if chbOst.Checked then
  begin
    chbPrihDocs.Checked       := False;
    chbRashDocs.Checked       := False;
    chbSelectByDocs.Checked   := False;
  end;

  lcbMO_group.Enabled := (chbPrihDocs.Checked or chbRashDocs.Checked or chbOst.Checked);
  if (chbPrihDocs.Checked or chbRashDocs.Checked or chbOst.Checked) then
  begin
    if (lcbMO_group.Text='')and(FIsLoadScheme = False) then
      lcbMO_group.DroppedDown := True;
  end
  else
    lcbMO_group.EditValue := null;

  chbDate1.Enabled := not chbOst.Checked;
//  chbDate1.Visible := not chbOst.Checked;
//  dedDate1.Visible := not chbOst.Checked;
  if chbOst.Checked then
    chbDate1.Checked := False;
end;

procedure TfmMain.chbPrihDocsClick(Sender: TObject);
begin
  chbOst.Enabled := not(chbPrihDocs.Checked or chbRashDocs.Checked);
  chbSelectByDocs.Enabled := chbOst.Enabled;

  if (chbPrihDocs.Checked or chbRashDocs.Checked) then
  begin
    chbSelectByDocs.Checked := True;
  end;

  lcbMO_group.Enabled := (chbPrihDocs.Checked or chbRashDocs.Checked or chbOst.Checked);
  if (chbPrihDocs.Checked or chbRashDocs.Checked or chbOst.Checked) then
  begin
    if (lcbMO_group.Text='')and(FIsLoadScheme = False) then
      lcbMO_group.DroppedDown := True;
  end
  else
    lcbMO_group.EditValue := null;
end;

procedure TfmMain.chbSelectByDocsClick(Sender: TObject);
begin
  if (chbSelectByDocs.Checked = False)and(chbSelectByMedics.Checked = False) then
    chbSelectByDocs.Checked := True;
end;

procedure TfmMain.chbSelectByMedicsClick(Sender: TObject);
begin
  if (chbSelectByDocs.Checked = False)and(chbSelectByMedics.Checked = False) then
    chbSelectByMedics.Checked := True;
end;

procedure TfmMain.cmbDocSchemePropertiesCloseUp(Sender: TObject);
begin
  buDocSchemeDel.Enabled := cmbDocScheme.ItemIndex <> -1;
  acSelectDocScheme.Execute;
end;

procedure TfmMain.SetColumnSettings(aCol : TcxGridDBBandedColumn; aSettingID : integer);
var
  i : Integer;
begin
  case aSettingID of
    1  : aCol.Visible    := False;
    2  : // Добавить столбец в группировку
    begin
      aCol.GroupIndex := cxGrid1DBBandedTableView1.GroupedColumnCount;
      aCol.Visible    := False;
    end;
    6  : // Убрать все группировки
      while cxGrid1DBBandedTableView1.GroupedColumnCount > 0 do
        cxGrid1DBBandedTableView1.GroupedColumns[0].GroupIndex := -1;
    // сортировки
    3  : aCol.SortOrder  := soAscending;
    4  : aCol.SortOrder  := soDescending;
    5  : aCol.SortOrder  := soNone;

    7  :// Название столбца по умолчанию
      begin
        if (aCol.Index >=0)and(aCol.Index < FFirstColumnName.Count) then
          aCol.Caption := FFirstColumnName.Strings[aCol.Index];
      end;

    8  : // Задать название столбца
    begin
      aCol.Caption := InputBox('Введите название столбца', 'Название', aCol.Caption);
    end;

    9  : // Итоговая сумма
      begin
        if miColSumItog.Checked then
        begin
          if aCol.PropertiesClassName = 'TcxCurrencyEditProperties' then
             aCol.Summary.FooterFormat := aCol.Caption+': '+сSUM_FORMAT_CURRENCY;
          if aCol.PropertiesClassName = 'TcxSpinEditProperties' then
             aCol.Summary.FooterFormat := aCol.Caption+': '+сSUM_FORMAT_NUMBER;
          aCol.Summary.FooterKind := skSum;
        end
        else
        begin
          aCol.Summary.FooterKind   := skNone;
          aCol.Summary.FooterFormat := '';
        end;
      end;

    10 : // Сумма в группировке
      begin
        if miColSumGroup.Checked then
        begin
          if aCol.PropertiesClassName = 'TcxCurrencyEditProperties' then
             aCol.Summary.GroupFormat := FColSumGroupName[aCol.Index]+сSUM_FORMAT_CURRENCY;
          if aCol.PropertiesClassName = 'TcxSpinEditProperties' then
             aCol.Summary.GroupFormat := FColSumGroupName[aCol.Index]+сSUM_FORMAT_NUMBER;
          aCol.Summary.GroupKind := skSum;
        end
        else
        begin
          aCol.Summary.GroupKind   := skNone;
          aCol.Summary.GroupFormat := '';
        end;
      end;

    11 : // Подпись к сумме группировки столбца
      begin
        FColSumGroupName[aCol.Index] := InputBox('Введите подпись к сумме группировки столбца', 'Подпись', FColSumGroupName[aCol.Index]);
        if cxGrid1DBBandedTableView1.GroupedColumnCount > 0 then
        begin
          SetColumnSettings(aCol, 9);
          SetColumnSettings(aCol, 10);
        end;        
      end;

    12 : // Убрать все суммы
      begin
        for i := 0 to cxGrid1DBBandedTableView1.ColumnCount - 1 do
        begin
          cxGrid1DBBandedTableView1.Columns[i].Summary.GroupKind    := skNone;
          cxGrid1DBBandedTableView1.Columns[i].Summary.GroupFormat  := '';
          cxGrid1DBBandedTableView1.Columns[i].Summary.FooterKind   := skNone;
          cxGrid1DBBandedTableView1.Columns[i].Summary.FooterFormat := '';
        end;
      end;
  end;
end;

procedure TfmMain.cxGrid1DBBandedTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
  var
    IsSumEnable : Boolean;
    Col : TcxGridDBBandedColumn;
begin
  if AButton = mbRight then
  begin
    Col := cxGrid1DBBandedTableView1.Columns[ACellViewInfo.Item.Index];
    // проверка на одинаковость названий заголовков
    miColReturnFirstName.Enabled := (Col.Index >=0)and(Col.Index < FFirstColumnName.Count)and
                                    (Col.Caption <> FFirstColumnName.Strings[Col.Index]);

    // загрузка настроек для текущего столбца
    IsSumEnable := (Col.PropertiesClassName = 'TcxCurrencyEditProperties') or
                   (Col.PropertiesClassName = 'TcxSpinEditProperties');
    miColSumSeparator.Visible := IsSumEnable;
    miColSumItog.Visible      := IsSumEnable;
    miColSumGroup.Visible     := IsSumEnable;
    miColSumItog.Checked      := (Col.Summary.FooterKind = skSum);
    miColSumGroup.Checked     := (Col.Summary.GroupKind  = skSum);
    //--------------------------------------------------------------------------
    pmColumn.Tag := 0;
    pmColumn.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
    Application.ProcessMessages;

    SetColumnSettings(Col, pmColumn.Tag);

    pmColumn.Tag := 0;    
  end;
end;

procedure TfmMain.tsCrossReportShow(Sender: TObject);
var
  f : TcxDBPivotGridField;
  i, j : integer;
begin
  for i := 0 to cxGrid1DBBandedTableView1.ColumnCount-1 do
  begin
    if (cxGrid1DBBandedTableView1.Columns[i].Position.Band.Visible) and (cxGrid1DBBandedTableView1.Columns[i].Visible) then
    begin // если поле видимо, добавляем его а список
      j := 0;
      while (j < cxDBPivotGrid1.FieldCount)and(TcxDBPivotGridField(cxDBPivotGrid1.Fields[j]).DataBinding.FieldName <> cxGrid1DBBandedTableView1.Columns[i].DataBinding.FieldName) do
        Inc( j );
      if j >= cxDBPivotGrid1.FieldCount then // если его конечно там еще нет
      begin
        f := TcxDBPivotGridField.Create( cxDBPivotGrid1 );
        f.PivotGrid := cxDBPivotGrid1;
        f.DataBinding.FieldName :=  cxGrid1DBBandedTableView1.Columns[i].DataBinding.FieldName;
        f.Caption :=  cxGrid1DBBandedTableView1.Columns[i].Caption;
      end
      else
        TcxDBPivotGridField(cxDBPivotGrid1.Fields[j]).Caption := cxGrid1DBBandedTableView1.Columns[i].Caption;
    end // (cxGrid1DBBandedTableView1.Columns[i].Position.Band.Visible) and (cxGrid1DBBandedTableView1.Columns[i].Visible) then
    else
    begin // поле не используется - убираем все ссылки на него
      j := 0;
      while (j < cxDBPivotGrid1.FieldCount)and(TcxDBPivotGridField(cxDBPivotGrid1.Fields[j]).DataBinding.FieldName <> cxGrid1DBBandedTableView1.Columns[i].DataBinding.FieldName) do
        Inc( j );
      if j < cxDBPivotGrid1.FieldCount then
        cxDBPivotGrid1.Fields[j].Destroy;
    end;
  end;
end;


function TfmMain.EncodeStringToHex(aStr: string): string;
var
  i, Len : Integer;
begin
  Result := '';
  Len := Length(aStr);
  for i := 1 to Len do
    Result := Result+IntToHex(Ord(aStr[i]), 2);
end;
//------------------------------------------------------------------------------
function TfmMain.EncodeHexToString(aHexStr: string): string;
var
  i, Len : Integer;
begin
  Result := '';
  Len := Length(aHexStr) div 2;
  for i := 1 to Len do
    Result := Result+Chr(HexToByte(aHexStr[(i*2)-1]+aHexStr[i*2]));
end;
//------------------------------------------------------------------------------
procedure TfmMain.acSelectDocSchemeExecute(Sender: TObject);
begin
  if cmbDocScheme.ItemIndex < 0 then Exit;
  LoadScheme(cmbDocScheme.Text);
end;
//------------------------------------------------------------------------------
procedure TfmMain.acSettingsExecute(Sender: TObject);
begin
  fmHeaderAndFooter.Left := Self.Left + ((Self.Width - fmHeaderAndFooter.Width) div 2);
  fmHeaderAndFooter.Top := Self.Top + ((Self.Height - fmHeaderAndFooter.Height) div 2);
  fmHeaderAndFooter.ShowModal;
end;
//------------------------------------------------------------------------------
function TfmMain.LoadScheme(aSchemeName: string; aIsShowErrorMessage : Boolean = True) : Boolean;
var
  sEncodeSchemeName, s : string;
  i : integer;
  f : TcxDBPivotGridField;
begin
  Result := False;
  sEncodeSchemeName := EncodeStringToHex(aSchemeName);
  if iniFile.ReadInteger(sEncodeSchemeName,    'Visible', 0) = 0 then // признак видимости схемы
  begin
    if aIsShowErrorMessage = True then
      Application.MessageBox('Не найдена выбранная схема сбора отчета', 'ОШИБКА', MB_OK+MB_ICONERROR);
    Exit;
  end;
  Screen.Cursor := crHourGlass;
  try
    // освобождаем память
    dmMain.dsRep.DataSet.Close;

    FIsLoadScheme := True;
    // загружаем галочки и поля ввода
    chbDate1.Checked := (iniFile.ReadInteger(sEncodeSchemeName, 'chbDate1_Checked', 0) = 1);
    dedDate1.Text    := iniFile.ReadString(sEncodeSchemeName, 'dedDate1_Text', '01.01.2001');
    chbDate2.Checked := (iniFile.ReadInteger(sEncodeSchemeName, 'chbDate2_Checked', 0) = 1);
    dedDate2.Text    := iniFile.ReadString(sEncodeSchemeName, 'dedDate2_Text', DateToStr(Now));

    chbPrihDocs.Checked := (iniFile.ReadInteger(sEncodeSchemeName, 'chbPrihDocs_Checked', 0) = 1);
    chbRashDocs.Checked := (iniFile.ReadInteger(sEncodeSchemeName, 'chbRashDocs_Checked', 0) = 1);
    chbOst.Checked      := (iniFile.ReadInteger(sEncodeSchemeName, 'chbOst_Checked', 1) = 1);

    lcbMO_group.EditValue := iniFile.ReadInteger(sEncodeSchemeName, 'lcbMO_group_EditValue', -1);

    chbSelectByDocs.Checked   := (iniFile.ReadInteger(sEncodeSchemeName, 'chbSelectByDocs_Checked', 0) = 1);
    chbSelectByMedics.Checked := (iniFile.ReadInteger(sEncodeSchemeName, 'chbSelectByMedics_Checked', 0) = 1);

    while cxDBPivotGrid1.FieldCount > 0 do // чистим все предыдущие поля
      cxDBPivotGrid1.Fields[0].Destroy;

    // загружаем параметры столбцов
    for i := 0 to cxGrid1DBBandedTableView1.ColumnCount-1 do // сохраняем привязки на столбцах
    begin
      cxGrid1DBBandedTableView1.Columns[i].Visible := (iniFile.ReadInteger(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_Visible', 0) = 1);

      if cxGrid1DBBandedTableView1.Columns[i].Visible then
      begin
        f := TcxDBPivotGridField.Create( cxDBPivotGrid1 );
        f.PivotGrid := cxDBPivotGrid1;
        f.DataBinding.FieldName :=  cxGrid1DBBandedTableView1.Columns[i].DataBinding.FieldName;
        f.Caption :=  cxGrid1DBBandedTableView1.Columns[i].Caption;

        // загружаем настройки столбцов сводного отчета
        case iniFile.ReadInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_Area', 0) of
          1 : f.Area := faColumn;
          2 : f.Area := faRow;
          3 : f.Area := faData;
        else //         faFilter: ;
          f.Area := faFilter;
        end;

        f.AreaIndex := iniFile.ReadInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_AreaIndex', 0);

        case iniFile.ReadInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_Visible', 0) of
          1: f.Visible := True;
        else
          f.Visible := False;
        end;
      end;

      cxGrid1DBBandedTableView1.Columns[i].Position.ColIndex := iniFile.ReadInteger(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_Position_ColIndex', 0);
      cxGrid1DBBandedTableView1.Columns[i].GroupIndex := iniFile.ReadInteger(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_GroupIndex', -1);
      cxGrid1DBBandedTableView1.Columns[i].SortIndex :=  iniFile.ReadInteger(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_SortIndex', -1);

      case iniFile.ReadInteger(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_SortOrder', 0) of
        1 : cxGrid1DBBandedTableView1.Columns[i].SortOrder := soAscending;
        2 : cxGrid1DBBandedTableView1.Columns[i].SortOrder := soDescending;
      else
        cxGrid1DBBandedTableView1.Columns[i].SortOrder := soNone;
      end;
      s := iniFile.ReadString(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_Caption', cxGrid1DBBandedTableView1.Columns[i].Caption);
      if s <> '' then // если заголовок полностью стерли, восстанавливаем его прежнее название
        cxGrid1DBBandedTableView1.Columns[i].Caption := s;
      cxGrid1DBBandedTableView1.Columns[i].Width :=  iniFile.ReadInteger(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_Width', cxGrid1DBBandedTableView1.Columns[i].Width);
      FColSumGroupName[i] := iniFile.ReadString(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_ColSumGroupName', '');
    end;

    // сохраняем конфигурацию сводного отчета
    for i := 0 to cxDBPivotGrid1.FieldCount-1 do
    begin
      f := TcxDBPivotGridField(cxDBPivotGrid1.Fields[i]);
      case f.Area of
        faColumn: iniFile.WriteInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_Area', 1);
        faRow   : iniFile.WriteInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_Area', 2);
        faData  : iniFile.WriteInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_Area', 3);
      else //         faFilter: ;
        iniFile.WriteInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_Area', 0);
      end;

      iniFile.WriteInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_AreaIndex', f.AreaIndex);

      case f.Visible of
        True: iniFile.WriteInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_Visible', 1);
      else
        iniFile.WriteInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_Visible', 0);
      end;
    end; // for i := 0 to cxDBPivotGrid1.FieldCount-1 do


    fmHeaderAndFooter.reHeader.EditValue := EncodeHexToString(iniFile.ReadString(sEncodeSchemeName, 'HeaderRTF', ''));
    fmHeaderAndFooter.reFooter.EditValue := EncodeHexToString(iniFile.ReadString(sEncodeSchemeName, 'FooterRTF', ''));

    cxGrid1DBBandedTableView1.RestoreFromIniFile(FIniName, True, False, [gsoUseFilter, gsoUseSummary], sEncodeSchemeName);
    Result := True;    
  finally
    Screen.Cursor := crDefault;
    FIsLoadScheme := False;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmMain.SaveScheme( aSchemeName : string);
var
  sEncodeSchemeName : string;
  i, SchemesCount : integer;
  f : TcxDBPivotGridField;
begin
  Screen.Cursor := crHourGlass;
  try
    sEncodeSchemeName := EncodeStringToHex(aSchemeName);
    // общие настройки схемы
    if iniFile.ReadInteger(sEncodeSchemeName, 'Visible', 2) = 2 then // если такого раздела еще не было, увеличиваем счетчик
    begin
      SchemesCount := iniFile.ReadInteger(cSECT_SCHEME_LIST, cIDENT_SCHEMES_COUNT, 0)+1;
      iniFile.WriteInteger(cSECT_SCHEME_LIST, cIDENT_SCHEMES_COUNT, SchemesCount); // пишем в ини-файл новое кол-во схем
      iniFile.WriteString (cSECT_SCHEME_LIST, 'Scheme_'+IntToStr(SchemesCount), sEncodeSchemeName); // и имя схемы
    end;
    iniFile.WriteInteger(sEncodeSchemeName, 'Visible', 1);  // признак видимости схемы

    // сохраняем галочки и поля ввода
    if chbDate1.Checked then
      iniFile.WriteInteger(sEncodeSchemeName, 'chbDate1_Checked', 1)
    else
      iniFile.WriteInteger(sEncodeSchemeName, 'chbDate1_Checked', 0);
    iniFile.WriteString(sEncodeSchemeName, 'dedDate1_Text', dedDate1.Text);

    if chbDate2.Checked then
      iniFile.WriteInteger(sEncodeSchemeName, 'chbDate2_Checked', 1)
    else
      iniFile.WriteInteger(sEncodeSchemeName, 'chbDate2_Checked', 0);
    iniFile.WriteString(sEncodeSchemeName, 'dedDate2_Text', dedDate2.Text);

    if chbPrihDocs.Checked then
      iniFile.WriteInteger(sEncodeSchemeName, 'chbPrihDocs_Checked', 1)
    else
      iniFile.WriteInteger(sEncodeSchemeName, 'chbPrihDocs_Checked', 0);
    if chbRashDocs.Checked then
      iniFile.WriteInteger(sEncodeSchemeName, 'chbRashDocs_Checked', 1)
    else
      iniFile.WriteInteger(sEncodeSchemeName, 'chbRashDocs_Checked', 0);
    if chbOst.Checked then
      iniFile.WriteInteger(sEncodeSchemeName, 'chbOst_Checked', 1)
    else
      iniFile.WriteInteger(sEncodeSchemeName, 'chbOst_Checked', 0);

    if VarIsNull(lcbMO_group.EditValue) then
      lcbMO_group.EditValue := -1;
    iniFile.WriteInteger(sEncodeSchemeName, 'lcbMO_group_EditValue', lcbMO_group.EditValue);

    if chbSelectByDocs.Checked then
      iniFile.WriteInteger(sEncodeSchemeName, 'chbSelectByDocs_Checked', 1)
    else
      iniFile.WriteInteger(sEncodeSchemeName, 'chbSelectByDocs_Checked', 0);
    if chbSelectByMedics.Checked then
      iniFile.WriteInteger(sEncodeSchemeName, 'chbSelectByMedics_Checked', 1)
    else
      iniFile.WriteInteger(sEncodeSchemeName, 'chbSelectByMedics_Checked', 0);

    // сохраняем параметры столбцов
    for i := 0 to cxGrid1DBBandedTableView1.ColumnCount-1 do // сохраняем привязки на столбцах
    begin
      if cxGrid1DBBandedTableView1.Columns[i].Visible then
        iniFile.WriteInteger(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_Visible', 1)
      else
        iniFile.WriteInteger(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_Visible', 0);

      iniFile.WriteInteger(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_Position_ColIndex', cxGrid1DBBandedTableView1.Columns[i].Position.ColIndex);
      iniFile.WriteInteger(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_GroupIndex', cxGrid1DBBandedTableView1.Columns[i].GroupIndex);
      iniFile.WriteInteger(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_SortIndex', cxGrid1DBBandedTableView1.Columns[i].SortIndex);

      case cxGrid1DBBandedTableView1.Columns[i].SortOrder of
        soNone       : iniFile.WriteInteger(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_SortOrder', 0);
        soAscending  : iniFile.WriteInteger(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_SortOrder', 1);
        soDescending : iniFile.WriteInteger(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_SortOrder', 2);
      end;
      iniFile.WriteString(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_Caption', cxGrid1DBBandedTableView1.Columns[i].Caption);
      iniFile.WriteInteger(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_Width', cxGrid1DBBandedTableView1.Columns[i].Width);

      iniFile.WriteString(sEncodeSchemeName, cxGrid1DBBandedTableView1.Columns[i].Name+'_ColSumGroupName', FColSumGroupName[i]);
    end;

    // сохраняем конфигурацию сводного отчета
    for i := 0 to cxDBPivotGrid1.FieldCount-1 do
    begin
      f := TcxDBPivotGridField(cxDBPivotGrid1.Fields[i]);
      case f.Area of
        faColumn: iniFile.WriteInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_Area', 1);
        faRow   : iniFile.WriteInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_Area', 2);
        faData  : iniFile.WriteInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_Area', 3);
      else //         faFilter: ;
        iniFile.WriteInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_Area', 0);
      end;

      iniFile.WriteInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_AreaIndex', f.AreaIndex);

      case f.Visible of
        True: iniFile.WriteInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_Visible', 1);
      else
        iniFile.WriteInteger(sEncodeSchemeName, f.DataBinding.FieldName+'_Visible', 0);
      end;
    end; // for i := 0 to cxDBPivotGrid1.FieldCount-1 do    

    if VarIsNull(fmHeaderAndFooter.reHeader.EditValue) then
      iniFile.WriteString(sEncodeSchemeName, 'HeaderRTF', '')
    else
      iniFile.WriteString(sEncodeSchemeName, 'HeaderRTF', EncodeStringToHex(fmHeaderAndFooter.reHeader.EditValue));


    if VarIsNull(fmHeaderAndFooter.reHeader.EditValue) then
      iniFile.WriteString(sEncodeSchemeName, 'FooterRTF', '')
    else
      iniFile.WriteString(sEncodeSchemeName, 'FooterRTF', EncodeStringToHex(fmHeaderAndFooter.reFooter.EditValue));


    cxGrid1DBBandedTableView1.StoreToIniFile(FIniName, False, [gsoUseFilter, gsoUseSummary], sEncodeSchemeName);
  finally
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
function TfmMain.HideScheme(aSchemeName: string) : boolean;
var
  sEncodeSchemeName : string;
begin
  Result := False;
  if aSchemeName = '' then Exit;
  sEncodeSchemeName := EncodeStringToHex(aSchemeName);
  iniFile.WriteInteger(sEncodeSchemeName,    'Visible', 0);  // признак видимости схемы
  Result := True;
end;

procedure TfmMain.JvFormStorage1SavePlacement(Sender: TObject);
begin
//  SaveScheme( сAUTOSAVE_NAME );
end;

end.

