unit fmGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, Buttons, ExtCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Grids,
  ComObj, Oracle, uExcludes, OracleData, ComCtrls, cxTextEdit, cxSpinEdit,
  cxCurrencyEdit, OracleMonitor, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, Menus;

const
  OSTLIST_INC = 50;
  GRID_IMP_COL_SHIFT = 0;

  IMPFIELDS_FIRST         = 1;
  IMPFIELD_MEDIC_TORG_NAME= 1;
  IMPFIELD_MEDIC_LAT_NAME = 2;
  IMPFIELD_EDIZM_UP       = 3;
  IMPFIELD_EDIZM_FAS      = 4;
  IMPFIELD_FAS_KOL        = 5;
  IMPFIELD_MAS_LEK_F      = 6;
  IMPFIELD_ED_IZM_LEK_F   = 7;
  IMPFIELD_EAN            = 8;
  IMPFIELD_UCH_GR         = 9;
  IMPFIELD_FARM_GR        =10;
  IMPFIELD_KOL            =11;
  IMPFIELD_PRICE          =12;
  IMPFIELD_SERIAL         =13;
  IMPFIELD_GODENDO        =14;
  IMPFIELD_OTD            =15;
  IMPFIELDS_LAST          =15;

type
  SOstItem = record
    // поля, которые берем напрямую из экселя
    ImpFields : array[IMPFIELDS_FIRST..IMPFIELDS_LAST] of string;
{    FC_MEDIC_TORG_NAME : string;
    FC_MEDIC_LAT_NAME  : string;
    FC_EDIZM_UP        : string;
    FC_EDIZM_FAS       : string;
    FN_FAS_KOL         : Double;
    FN_MAS_LEK_F       : Double;
    FC_ED_IZM_LEK_F    : string;
    FC_EAN             : string;
    FC_UCH_GR          : string;
    FC_FARM_GR         : string;
    FN_PRICE           : Double;
    FC_SERIAL          : string;
    FC_GODENDO         : string;
    FC_OTD             : string;}

    // поля после анализа и сравнения с БД
    FK_MEDICID     : Integer;
    FK_EDIZM_UP    : Integer;
    FK_EDIZM_FAS   : Integer;
    FK_ED_IZM_LEK_F: Integer;
    FK_UCH_GR      : Integer;
    FK_FARM_GR     : Integer;
    FK_OTD         : Integer;
    FK_PARTY_ID    : Integer;
    FN_KOL         : Double;
    FN_PRICE       : Double;
    // флаги для хранения результов анализа
    IsMedicConvertable : Boolean; // true - все поля медикамента распознаны, обработка записи возможна
  end;

  TForm1 = class(TForm)
    OracleSession1: TOracleSession;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    bbuOpenExcel: TBitBtn;
    bbuExit: TBitBtn;
    bbuSaveToDB: TBitBtn;
    odsTMEDIC: TOracleDataSet;
    oqAdd_TMEDIC: TOracleQuery;
    oqAdd_TEI: TOracleQuery;
    oqAdd_TFARMGR: TOracleQuery;
    oqAdd_TUCHGR: TOracleQuery;
    oqAdd_TMASSUNITS: TOracleQuery;
    odsTEI: TOracleDataSet;
    odsTFARMGR: TOracleDataSet;
    odsTUCHGR: TOracleDataSet;
    odsTMASSUNITS: TOracleDataSet;
    odsTMO_GROUP: TOracleDataSet;
    oqAdd_TMO_GROUP: TOracleQuery;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    tsImportExcel: TTabSheet;
    tsAddedMedics: TTabSheet;
    cxGridImport: TcxGrid;
    cxGridImportLevel1: TcxGridLevel;
    tsAddedParties: TTabSheet;
    cxGridMedics_: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridParty: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    odsAddedMedics: TOracleDataSet;
    dsAddedMedics: TDataSource;
    cxGridDBTableView1FC_NAME: TcxGridDBColumn;
    cxGridDBTableView1EIID: TcxGridDBColumn;
    cxGridDBTableView1FARMGRID: TcxGridDBColumn;
    cxGridDBTableView1UCHGRID: TcxGridDBColumn;
    cxGridDBTableView1FK_ID: TcxGridDBColumn;
    cxGridDBTableView1LEVELID: TcxGridDBColumn;
    cxGridDBTableView1FC_COMMENT: TcxGridDBColumn;
    cxGridDBTableView1FL_PKU: TcxGridDBColumn;
    cxGridDBTableView1FK_NOMEN_RLS: TcxGridDBColumn;
    cxGridDBTableView1FC_EANCODE: TcxGridDBColumn;
    cxGridDBTableView1FK_TYPE: TcxGridDBColumn;
    cxGridDBTableView1FK_PAYTYPE: TcxGridDBColumn;
    cxGridDBTableView1FN_FPACKINUPACK: TcxGridDBColumn;
    cxGridDBTableView1FK_FPACKID: TcxGridDBColumn;
    cxGridDBTableView1FN_MASS: TcxGridDBColumn;
    cxGridDBTableView1FK_MASSUNITS: TcxGridDBColumn;
    cxGridDBTableView1FC_NAME_LAT: TcxGridDBColumn;
    cxGridDBTableView1FL_LGOTA: TcxGridDBColumn;
    cxGridDBTableView1FL_VISIBLE: TcxGridDBColumn;
    cxGridDBTableView1FC_UCHNAME: TcxGridDBColumn;
    cxGridDBTableView1FC_FARMNAME: TcxGridDBColumn;
    cxGridDBTableView1FC_UEDIZM: TcxGridDBColumn;
    cxGridDBTableView1FC_FEDIZM: TcxGridDBColumn;
    cxGridDBTableView1FC_MASSUNITS: TcxGridDBColumn;
    cxGridImportTableView1: TcxGridTableView;
    cxGridImportTableView1Column1: TcxGridColumn;
    cxGridImportTableView1Column2: TcxGridColumn;
    cxGridImportTableView1Column3: TcxGridColumn;
    cxGridImportTableView1Column4: TcxGridColumn;
    cxGridImportTableView1Column5: TcxGridColumn;
    cxGridImportTableView1Column6: TcxGridColumn;
    cxGridImportTableView1Column7: TcxGridColumn;
    cxGridImportTableView1Column8: TcxGridColumn;
    cxGridImportTableView1Column9: TcxGridColumn;
    cxGridImportTableView1Column10: TcxGridColumn;
    cxGridImportTableView1Column11: TcxGridColumn;
    cxGridImportTableView1Column12: TcxGridColumn;
    cxGridImportTableView1Column13: TcxGridColumn;
    cxGridImportTableView1Column14: TcxGridColumn;
    cxGridImportTableView1Column15: TcxGridColumn;
    oqAdd_TKART: TOracleQuery;
    odsAddedParties: TOracleDataSet;
    dsAddedParties: TDataSource;
    cxGridDBTableView2FC_NAME: TcxGridDBColumn;
    cxGridDBTableView2FC_UEDIZM: TcxGridDBColumn;
    cxGridDBTableView2FN_KOL: TcxGridDBColumn;
    cxGridDBTableView2FN_PRICE: TcxGridDBColumn;
    cxGridDBTableView2FD_GODEN: TcxGridDBColumn;
    cxGridDBTableView2FC_SERIAL: TcxGridDBColumn;
    cxGridDBTableView2FK_MOGROUPID: TcxGridDBColumn;
    cxGridDBTableView2FC_GROUP: TcxGridDBColumn;
    oqAdd_TDOCS: TOracleQuery;
    oqAdd_TDPC: TOracleQuery;
    oqUpdateTDOCS_FN_PRICE: TOracleQuery;
    oqTKART_Commit: TOracleQuery;
    oqTMEDIC_Commit: TOracleQuery;
    CheckBox1: TCheckBox;
    oqTDOCS_Commit: TOracleQuery;
    bbuClear: TBitBtn;
    pmClear: TPopupMenu;
    miDocAndParties: TMenuItem;
    miMedics: TMenuItem;
    miEdIzm: TMenuItem;
    miGrUch: TMenuItem;
    oqDelDocAndParties: TOracleQuery;
    oqDelMedics: TOracleQuery;
    miTrebs: TMenuItem;
    oqDelTrebs: TOracleQuery;
    procedure bbuOpenExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbuExitClick(Sender: TObject);
    procedure bbuSaveToDBClick(Sender: TObject);
    procedure bbuClearClick(Sender: TObject);
    procedure miDocAndPartiesClick(Sender: TObject);
    procedure miTrebsClick(Sender: TObject);
    procedure miMedicsClick(Sender: TObject);
  private
    { Private declarations }
    XlApp, XlBook, XlSheet, XlSheets : Variant; // Excel
    OstList : array of SOstItem;
    OstListCount : Integer;
    FLogName : string;
    StrList : TStringList;
    procedure OstListClear;
    procedure AddOstToList( aOst : SOstItem );
    procedure ClearOst( var aOst : SOstItem );    
    function IsOstRecordEmpty( aOst : SOstItem ) : Boolean;

    function  OpenExcelFile( aFileName: string ): Boolean;
    procedure CloseExcelFile;

    procedure FillOst;
    procedure DrawImportTable;
    procedure DrawImportTableRecord( aRecordIndex : Integer);
    procedure AddMedics( aStrList : TStringList);
    procedure AddParties( aStrList : TStringList);
    procedure AddDocs( aStrList : TStringList);    

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses StrUtils;

{$R *.dfm}
//------------------------------------------------------------------------------
function LoginMedotrade( var OracleSession: TOracleSession ):boolean;
var
  Handle : THandle;
begin
  OracleSession.LogonDatabase:='asu';
  OracleSession.LogonUsername:='asu';

  Handle := LoadLibrary('SMMain.dll');
  case Handle of
    0 : MessageDlg('Ошибка при обращении к библиотеке SMMain.dll', mtError, [mbOK], 0);
  else
    begin
      OracleSession.LogonPassword := GetUserPassword( OracleSession.LogonUsername );
      OracleSession.Connected     := True;
    end
  end;

  FreeLibrary(Handle);

  result := OracleSession.Connected;
end;
//------------------------------------------------------------------------------
  function ExcludeNonFloatChars(aFloatStr : string) : string;
  var
    i : Integer;
  begin
    Result := StringReplace(aFloatStr,'.',',', []);
    i := 1;
    while i < Length(Result) do
      if Result[i] in ['0','1','2','3','4','5','6','7','8','9',','] then Inc(i) else Delete(Result, 1, 1);
    if Result = '' then Result := '0';
  end;
//------------------------------------------------------------------------------
{ TForm1 }
//------------------------------------------------------------------------------
// работа с Excel
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
// функции для формирования массива для хранения остатков
//------------------------------------------------------------------------------
procedure TForm1.OstListClear;
begin
  SetLength(OstList, 0);
  OstListCount := 0;
end;
//------------------------------------------------------------------------------
procedure TForm1.AddOstToList( aOst : SOstItem );
var
  i : Integer;
begin
  if Length(OstList) <= OstListCount then
    SetLength(OstList, Length(OstList) + OSTLIST_INC);

  // заполняем поля новой записи - поскольку в массиве используются record-ы, а не объекты
  for i := IMPFIELDS_FIRST to IMPFIELDS_LAST do
    OstList[ OstListCount ].ImpFields[ i ] := aOst.ImpFields[ i ];
  OstList[ OstListCount ].FK_MEDICID       := aOst.FK_MEDICID;
  OstList[ OstListCount ].FK_PARTY_ID      := aOst.FK_PARTY_ID;

  OstList[ OstListCount ].FK_EDIZM_UP      := aOst.FK_EDIZM_UP;
  OstList[ OstListCount ].FK_EDIZM_FAS     := aOst.FK_EDIZM_FAS;
  OstList[ OstListCount ].FK_ED_IZM_LEK_F  := aOst.FK_ED_IZM_LEK_F;
  OstList[ OstListCount ].FK_UCH_GR        := aOst.FK_UCH_GR;
  OstList[ OstListCount ].FK_FARM_GR       := aOst.FK_FARM_GR;
  OstList[ OstListCount ].FK_OTD           := aOst.FK_OTD;

  OstList[ OstListCount ].FN_KOL           := aOst.FN_KOL;
  OstList[ OstListCount ].FN_PRICE         := aOst.FN_PRICE;

  Inc( OstListCount );
end;
//------------------------------------------------------------------------------
function TForm1.IsOstRecordEmpty(aOst: SOstItem): Boolean;
var
  i : Integer;
  Res : Boolean;
begin
  Res := True;
  for i := IMPFIELDS_FIRST to IMPFIELDS_LAST do
    Res := Res and (Trim(aOst.ImpFields[ i ]) = '');
  Result := Res;
end;

procedure TForm1.miDocAndPartiesClick(Sender: TObject);
begin
  if Application.MessageBox('Вы действительно хотите удалить ВСЕ документы и партии?', 'ВНИМАНИЕ', MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    oqDelDocAndParties.Execute;
    ShowMessage('Удаление документов и партий успешно выполнено');
  end;
end;

procedure TForm1.miMedicsClick(Sender: TObject);
begin
  if Application.MessageBox('Вы действительно хотите удалить ВСЕ медикаменты?', 'ВНИМАНИЕ', MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    oqDelMedics.Execute;
    if oqDelMedics.GetVariable('KART_NUM') <> 0 then
      ShowMessage('Удаление медикаментов не выполнено. Имеются партии ('+IntToStr(oqDelMedics.GetVariable('KART_NUM'))+' шт.)');
    if oqDelMedics.GetVariable('TREB_NUM') <> 0 then
      ShowMessage('Удаление медикаментов не выполнено. Имеются требования ('+IntToStr(oqDelMedics.GetVariable('TREB_NUM'))+' шт.)');

    if (oqDelMedics.GetVariable('TREB_NUM') = 0)and(oqDelMedics.GetVariable('KART_NUM') = 0) then
      ShowMessage('Удаление медикаментов успешно выполнено');
  end;
end;

procedure TForm1.miTrebsClick(Sender: TObject);
begin
  if Application.MessageBox('Вы действительно хотите удалить ВСЕ требования?', 'ВНИМАНИЕ', MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    oqDelTrebs.Execute;
    ShowMessage('Удаление требований успешно выполнено');
  end;
end;

//------------------------------------------------------------------------------
procedure TForm1.ClearOst(var aOst: SOstItem);
var
  i : Integer;
begin
  for i := IMPFIELDS_FIRST to IMPFIELDS_LAST do
    aOst.ImpFields[ i ] := '';

  aOst.FK_MEDICID     := -1;
  aOst.FK_PARTY_ID    := -1;
  aOst.FK_EDIZM_UP    := -1;
  aOst.FK_EDIZM_FAS   := -1;
  aOst.FK_ED_IZM_LEK_F:= -1;
  aOst.FK_UCH_GR      := -1;
  aOst.FK_FARM_GR     := -1;
  aOst.FK_OTD         := -1;
  aOst.FN_KOL         := 0;
  aOst.FN_PRICE       := 0;    

  aOst.IsMedicConvertable := False;
end;
//------------------------------------------------------------------------------
// обработчеги кнопок
//------------------------------------------------------------------------------
procedure TForm1.FormCreate(Sender: TObject);
begin
  tsAddedMedics.TabVisible := False;
  tsAddedParties.TabVisible := False;
end;
//------------------------------------------------------------------------------
procedure TForm1.bbuOpenExcelClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    bbuClear.Enabled := False;
    StrList := TStringList.Create;
    StrList.Add('[Excel]');
    StrList.Add('Filename = '+OpenDialog1.FileName);
    StrList.Add('OpenTime = '+DateTimeToStr(Now));
    bbuOpenExcel.Enabled := False;
    OpenExcelFile( OpenDialog1.FileName );
    StatusBar1.Panels[0].Text := 'Чтение из Excel';
    StatusBar1.Panels[1].Text := '';

    FillOst; // сканим Excel
    CloseExcelFile;
    if CheckBox1.Checked then DrawImportTable; // отображаем то, что нашли

//    OracleSession1.LogOff;
//    OracleSession1.Preferences.ConvertUTF := cuUTF8ToUTF16;
    OracleSession1.LogOn;
    if OracleSession1.Connected = False then
    begin
      ShowMessage( 'Нет подключения к БД' );
      Exit;
    end;

    StatusBar1.Panels[0].Text := 'Формирование медикаментов';
    StatusBar1.Panels[1].Text := '';
    AddMedics( StrList );
    StatusBar1.Panels[0].Text := 'Формирование партий';
    StatusBar1.Panels[1].Text := '';
    AddParties( StrList );
    StatusBar1.Panels[0].Text := 'Формирование прих. документов';
    StatusBar1.Panels[1].Text := '';
    AddDocs( StrList );
    StatusBar1.Panels[0].Text := '';
    DateTimeToString(FLogName, 'yyyymmdd_hh_nn_ss', Now);
    FLogName := FLogName +'_'+ExtractFileName(OpenDialog1.FileName)+'_MedicaImporter1'+'.log';
    StrList.SaveToFile(FLogName);
    bbuSaveToDB.Enabled := True;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm1.bbuClearClick(Sender: TObject);
var
  P : TPoint;
begin
  P.X := 0;
  P.Y := bbuClear.Height;
  P := bbuClear.ClientToScreen(P);
  pmClear.Popup(P.X, P.Y);
end;

procedure TForm1.bbuExitClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TForm1.bbuSaveToDBClick(Sender: TObject);
begin
  if (odsAddedMedics.RecordCount = 0)and(Application.MessageBox('Не было найдено ни одного, полностью заполненного, медикамента.'#13#10'Вы уверены что хотите продолжить?', 'ВНИМАНИЕ', MB_YESNO+MB_ICONWARNING) = IDNO	) then  Exit;
  if (odsAddedParties.RecordCount = 0)and(Application.MessageBox('Не было сформировано ни одной партии медикаментов.'#13#10'Вы уверены что хотите продолжить?', 'ВНИМАНИЕ', MB_YESNO+MB_ICONWARNING) = IDNO) then  Exit;
  if Application.MessageBox('Данные, отображенные, на закладках "Медикаменты" и "Партии" будут сохранены в БД.'#13#10'Если Вы уверены в правильности этих данных нажмите "Да".'#13#10'Для отмены сохранения нажмите "Нет"','ВНИМАНИЕ',MB_YESNO+MB_ICONWARNING) = IDYES then
  begin
    oqTMEDIC_Commit.Execute;
    oqTKART_Commit.Execute;
    oqTDOCS_Commit.Execute;
    OracleSession1.Commit;
    StrList.Add('[Commit]');
    StrList.Add('CommitTime = '+DateTimeToStr(Now));
    StrList.SaveToFile(FLogName);
    bbuSaveToDB.Enabled := False;
  end;
end;
//------------------------------------------------------------------------------
// функции для сопряжения Excel и БД
//------------------------------------------------------------------------------
procedure TForm1.FillOst;
var
  Ost : SOstItem;
  FN_Row, FN_Col : Integer;
  IsEmpty : Boolean;
begin
  FN_Row := 3;
  repeat
    // заполняем поля из экселя
    ClearOst( Ost ); // чистим переменную от предыдущих значений
    for FN_Col := IMPFIELDS_FIRST to IMPFIELDS_LAST do
      Ost.ImpFields[ FN_Col ] := Trim( XlSheet.Cells[ FN_Row, FN_Col ].Value );

    IsEmpty := IsOstRecordEmpty (Ost);
    if not IsEmpty then //если есть хоть какая-то информация, то заносим - потом разберемся
      AddOstToList( Ost );

    StatusBar1.Panels[1].Text := 'Строк считано: '+IntToStr(OstListCount);
    Application.ProcessMessages;

    Inc( FN_Row );
  until IsEmpty;
  SetLength( OstList, OstListCount); // оставляем в массиве только полезные записи
end;
//------------------------------------------------------------------------------
procedure TForm1.DrawImportTable;
var
  Row : Integer;
begin
  cxGridImportTableView1.DataController.RecordCount := OstListCount;
  StatusBar1.Panels[0].Text := 'Рисуем таблицу';
  for Row := 0 to (OstListCount-1) do//FWorkmans.Count - 1 do
  begin
    DrawImportTableRecord( Row );
    StatusBar1.Panels[1].Text := IntToStr(Row+1)+' из '+IntToStr(OstListCount);
    Application.ProcessMessages;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm1.DrawImportTableRecord(aRecordIndex: Integer);
var
  Col : Integer;
begin
  for Col := IMPFIELDS_FIRST to IMPFIELDS_LAST do
    cxGridImportTableView1.DataController.Values[aRecordIndex, Col-1+GRID_IMP_COL_SHIFT] := OstList[aRecordIndex].ImpFields[Col];
end;
//------------------------------------------------------------------------------
procedure TForm1.AddMedics;
var
  i, AddedMedicsCount : Integer;
  IsLocated : Boolean;
  sMes : string;
  //----------------------------------------------------------------------------
  // ищем или вставляем строчку в таблицу
  // считается что : 1) в датасете ключ называется FK_ID
  //                 2) искомое поле в датасете и переменная в квери назваются одинаково
  function LocateOrIns( aLocateDataSet : TOracleDataSet; aInsQuery : TOracleQuery; const aLocateField, aLocateValue : string; var aFK_ID : Integer ) : Boolean;
  begin
    try
      if (aLocateValue <> '')and(aLocateDataSet.Locate(aLocateField, aLocateValue, [loCaseInsensitive] ))  then
      begin
        aFK_ID := aLocateDataSet.FieldByName('FK_ID').AsInteger;
        Result := True;
      end
      else
      begin
        if aLocateValue <> '' then
        begin
          aInsQuery.SetVariable(aLocateField, aLocateValue);
          aInsQuery.Execute;
          aFK_ID:= aInsQuery.GetVariable('FK_ID');
          aLocateDataSet.Close; aLocateDataSet.Open;
        end;
        Result := False;
      end;
    except
      aFK_ID := -1;  // а вдрух че не так?!
      Result := False;
    end;
  end;
  //----------------------------------------------------------------------------
begin
  odsTMEDIC.Open;
  odsTEI.Open;
  odsTFARMGR.Open;
  odsTUCHGR.Open;
  odsTMASSUNITS.Open;
  odsTMO_GROUP.Open;
  AddedMedicsCount := 0;
  aStrList.Add('[AddMedics]');
  for i := 0 to OstListCount-1 do
  begin
    StatusBar1.Panels[1].Text := 'Добавлено: '+IntToStr(AddedMedicsCount) + '  ( '+IntToStr(ROUND(((i+1)/OstListCount)*100))+'% )';
    Application.ProcessMessages;
    IsLocated := True;
    IsLocated := LocateOrIns( odsTEI,       oqAdd_TEI,        'fc_name',      OstList[i].ImpFields[IMPFIELD_EDIZM_UP],     OstList[i].FK_EDIZM_UP     ) and IsLocated;
    IsLocated := LocateOrIns( odsTEI,       oqAdd_TEI,        'fc_name',      OstList[i].ImpFields[IMPFIELD_EDIZM_FAS],    OstList[i].FK_EDIZM_FAS    ) and IsLocated;
//    IsLocated := LocateOrIns( odsTMASSUNITS,oqAdd_TMASSUNITS, 'fc_shortname', OstList[i].ImpFields[IMPFIELD_ED_IZM_LEK_F], OstList[i].FK_ED_IZM_LEK_F ) and IsLocated;
    LocateOrIns( odsTMASSUNITS,oqAdd_TMASSUNITS, 'fc_shortname', OstList[i].ImpFields[IMPFIELD_ED_IZM_LEK_F], OstList[i].FK_ED_IZM_LEK_F ); //Added by Neronov A.S.
    LocateOrIns( odsTFARMGR,   oqAdd_TFARMGR,    'fc_farmgr',    OstList[i].ImpFields[IMPFIELD_FARM_GR],      OstList[i].FK_FARM_GR      ); //Added by Neronov A.S.
    IsLocated := LocateOrIns( odsTUCHGR,    oqAdd_TUCHGR,     'fc_uchgr',     OstList[i].ImpFields[IMPFIELD_UCH_GR],       OstList[i].FK_UCH_GR       ) and IsLocated;
//    IsLocated := LocateOrIns( odsTFARMGR,   oqAdd_TFARMGR,    'fc_farmgr',    OstList[i].ImpFields[IMPFIELD_FARM_GR],      OstList[i].FK_FARM_GR      ) and IsLocated;
                 LocateOrIns( odsTMO_GROUP, oqAdd_TMO_GROUP,  'fc_group',     OstList[i].ImpFields[IMPFIELD_OTD],          OstList[i].FK_OTD          );

    if IsLocated then // типа все внешние ключи медикамента нашлись - возможно такой препарат уже есть - будем искать
    begin
      try
        IsLocated :=  (OstList[i].ImpFields[IMPFIELD_FAS_KOL]<>'')and
//                      (OstList[i].ImpFields[IMPFIELD_MAS_LEK_F]<>'')and
                       odsTMEDIC.Locate('fc_name;fc_name_lat;fn_fpackinupack'{;fn_mass'},
                                        varArrayOf([OstList[i].ImpFields[IMPFIELD_MEDIC_TORG_NAME],
                                                    OstList[i].ImpFields[IMPFIELD_MEDIC_LAT_NAME],
                                                    StrToFloat(OstList[i].ImpFields[IMPFIELD_FAS_KOL]){,
                                                    StrToFloat(OstList[i].ImpFields[IMPFIELD_MAS_LEK_F])}]), [loCaseInsensitive]);
      except
        IsLocated := False;
      end;
    end;
    if IsLocated then // здесь уже либо медикамент найден, либо нет
    begin
      OstList[i].FK_MEDICID := odsTMEDIC.FieldByName('FK_ID').AsInteger;
      OstList[i].IsMedicConvertable := True;
    end
    else
    begin
      try
        if (OstList[i].ImpFields[IMPFIELD_MEDIC_TORG_NAME]<>'')and
//           (OstList[i].ImpFields[IMPFIELD_FAS_KOL]<>'')and (OstList[i].FK_EDIZM_FAS>=0) and
//           (OstList[i].ImpFields[IMPFIELD_MAS_LEK_F]<>'') and(OstList[i].FK_ED_IZM_LEK_F>=0) and
           (OstList[i].FK_UCH_GR >= 0)and(OstList[i].FK_EDIZM_UP>=0){(OstList[i].FK_FARM_GR>=0)} then
        begin
          oqAdd_TMEDIC.SetVariable('fc_name',     OstList[i].ImpFields[IMPFIELD_MEDIC_TORG_NAME]      );
          oqAdd_TMEDIC.SetVariable('uchgrid',     OstList[i].FK_UCH_GR                                );
          oqAdd_TMEDIC.SetVariable('eiid',        OstList[i].FK_EDIZM_UP                              );
          oqAdd_TMEDIC.SetVariable('farmgrid',    OstList[i].FK_FARM_GR                               );
          oqAdd_TMEDIC.SetVariable('fc_eancone',  OstList[i].ImpFields[IMPFIELD_EAN]                  );
          sMes := ' Столбец: "Кол-во фас. ед. в уп."';
          oqAdd_TMEDIC.SetVariable('kolfinu',     StrToFloat(ExcludeNonFloatChars(OstList[i].ImpFields[IMPFIELD_FAS_KOL]))  );
          oqAdd_TMEDIC.SetVariable('fedizmid',    OstList[i].FK_EDIZM_FAS                             );
          sMes := ' Столбец: "Масса лек. формы"';
          oqAdd_TMEDIC.SetVariable('fn_dozka',    StrToFloat(ExcludeNonFloatChars(OstList[i].ImpFields[IMPFIELD_MAS_LEK_F])));
          oqAdd_TMEDIC.SetVariable('fk_dozkaunit',OstList[i].FK_ED_IZM_LEK_F                          );
          oqAdd_TMEDIC.SetVariable('fc_name_lat', OstList[i].ImpFields[IMPFIELD_MEDIC_LAT_NAME]       );
          sMes := '';
          oqAdd_TMEDIC.Execute;
          OstList[i].FK_MEDICID := oqAdd_TMEDIC.GetVariable('FK_ID');
          aStrList.Add('FK_MEDICID = '+IntToStr(OstList[i].FK_MEDICID));
          OstList[i].IsMedicConvertable := True;
          Inc(AddedMedicsCount);
          odsTMEDIC.Close;  // добавили медикамент - обновляем датасет, чтобы потом locate нашел такой же медикамент
          odsTMEDIC.Open;          
        end;
      except
        Application.MessageBox(PAnsiChar('Ошибка при добавлении в медикаменты "'+OstList[i].ImpFields[IMPFIELD_MEDIC_TORG_NAME]+'" ('+IntToStr(i+1)+'-й строки из списка).'+sMes), 'Ошибка', MB_Ok+MB_ICONWARNING);
      end;
    end;
  end;  //  for i := 0 to OstListCount-1 do
  odsAddedMedics.Open;
  tsAddedMedics.TabVisible := True;
  PageControl1.ActivePage := tsAddedMedics;
  StatusBar1.Panels[0].Text := '';
  StatusBar1.Panels[1].Text := '';  
end;
//------------------------------------------------------------------------------
procedure TForm1.AddParties;
var
  i,n : Integer;
  sMes : string;
begin
  aStrList.Add('[Parties]');
  n := 0;
  for i := 0 to OstListCount-1 do
  begin
    if (OstList[i].FK_MEDICID > 0)and(OstList[i].FK_OTD > 0) then
    begin
      try
        oqAdd_TKART.SetVariable('MEDICID', OstList[i].FK_MEDICID);
        sMes := ' Столбец: "Годен до"';
        if  OstList[i].ImpFields[IMPFIELD_GODENDO] = '' then
          oqAdd_TKART.SetVariable('FD_GODEN', null)
        else
          oqAdd_TKART.SetVariable('FD_GODEN', StrToDate(OstList[i].ImpFields[IMPFIELD_GODENDO]));
        oqAdd_TKART.SetVariable('FC_SERIAL', OstList[i].ImpFields[IMPFIELD_SERIAL]);
        oqAdd_TKART.SetVariable('MOGROUP_ID', OstList[i].FK_OTD);

        sMes := ' Столбец: "Цена"';
        OstList[i].FN_PRICE := StrToFloat( ExcludeNonFloatChars(OstList[i].ImpFields[IMPFIELD_PRICE]) );
        oqAdd_TKART.SetVariable('PRICE', OstList[i].FN_PRICE);

        sMes := ' Столбец:  "Кол-во"';
        OstList[i].FN_KOL := StrToFloat( ExcludeNonFloatChars(OstList[i].ImpFields[IMPFIELD_KOL]) );
        oqAdd_TKART.SetVariable('FN_KOL', OstList[i].FN_KOL);
        if OstList[i].FN_KOL = 0 then Continue; // медикаменты, для которых не указан остаток, не добавляем
        sMes := '';

        oqAdd_TKART.Execute;
        OstList[i].FK_PARTY_ID :=  oqAdd_TKART.GetVariable('FK_ID');
        aStrList.Add('FK_PARTY_ID = '+IntToStr(OstList[i].FK_PARTY_ID));
        Inc(n);
        StatusBar1.Panels[1].Text := 'Добавлено: '+IntToStr(n) + '  ( '+IntToStr(ROUND(((i+1)/OstListCount))*100)+'% )';
        Application.ProcessMessages;
      except
        Application.MessageBox(PAnsiChar('Ошибка при добавлении в партии медикамента "'+OstList[i].ImpFields[IMPFIELD_MEDIC_TORG_NAME]+'" ('+IntToStr(i+1)+'-й строки из списка).'+sMes), 'Ошибка', MB_Ok+MB_ICONWARNING);
      end;
    end;
  end;
  StatusBar1.Panels[0].Text := '';
  StatusBar1.Panels[1].Text := '';  
end;
//------------------------------------------------------------------------------
procedure TForm1.AddDocs;
var
  OTD    : array of integer;
  DocsID : array of integer;
  i,j : Integer;
  S : string;
begin
//  StatusBar1.Panels[0].Text := 'Формирование списка отделений';
  aStrList.Add('[Docs]');
  SetLength(OTD,    0);
  SetLength(DocsID, 0);
  for i := 0 to OstListCount-1 do
  begin
    if (OstList[i].FK_OTD <> -1) then
    begin
      j := 0;
      while (j <= High(OTD))and(OTD[j] <> OstList[i].FK_OTD) do
        Inc(j);
      if j > High(OTD) then
      begin
        SetLength(OTD,    Length(OTD)   +1);
        SetLength(DocsID, Length(DocsID)+1);
        OTD[High(OTD)] := OstList[i].FK_OTD;

        oqAdd_TDOCS.SetVariable('FC_COMMENT', OstList[i].ImpFields[IMPFIELD_OTD]+' (MedicaImporter1)');
        oqAdd_TDOCS.SetVariable('FK_MOGROUPID', OstList[i].FK_OTD);
        oqAdd_TDOCS.Execute;
        DocsID[High(DocsID)] := oqAdd_TDOCS.GetVariable('FK_ID');
        aStrList.Add('DocsID = '+IntToStr(DocsID[High(DocsID)]));
      end;
    end; // if (OstList[i].FK_OTD <> -1) then
    StatusBar1.Panels[1].Text := 'Отделений найдено: '+IntToStr(Length(OTD)) + '  ( '+IntToStr(ROUND(((i+1)/OstListCount)*100))+'% )';
    Application.ProcessMessages;
  end; // for i := 0 to OstListCount-1 do

// распределяем партии по документам
  for i := 0 to High(OTD) do
  begin
    for j := 0 to OstListCount-1 do
    begin
      if OstList[j].FK_OTD = OTD[i] then
      begin
        oqAdd_TDPC.SetVariable('dpid',     DocsID[i]);
        oqAdd_TDPC.SetVariable('kartid',   OstList[j].FK_PARTY_ID);
        oqAdd_TDPC.SetVariable('kol',      OstList[j].FN_KOL);
        oqAdd_TDPC.SetVariable('FN_PRICE', OstList[j].FN_PRICE);
        oqAdd_TDPC.Execute;
      end; // if OstList[j].FK_OTD = OTD[i] then
    end;  // for j := 0 to OstListCount-1 do
    StatusBar1.Panels[1].Text := 'Партий распределено: '+IntToStr(ROUND(((i+1)/OstListCount)*100))+'%';
    Application.ProcessMessages;
    oqUpdateTDOCS_FN_PRICE.SetVariable('dpid', DocsID[i]);
    oqUpdateTDOCS_FN_PRICE.Execute;
  end; // for i := 0 to High(OTD) do

  // делаем список документов, для отображения
  S := '';
  for i := 0 to High(DocsID) do
    S := S + ', '+IntToStr(DocsID[i]);
  Delete(S,1,2);
  if S = '' then S := '-1';
  odsAddedParties.SQL.Text := StringReplace(odsAddedParties.SQL.Text, '%DocsID', S, []);
  odsAddedParties.Open;
  tsAddedParties.TabVisible := True;
  PageControl1.ActivePage := tsAddedParties;
  StatusBar1.Panels[0].Text := '';
  StatusBar1.Panels[1].Text := '';
end;

end.
