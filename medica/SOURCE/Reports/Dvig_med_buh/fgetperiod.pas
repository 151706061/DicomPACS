unit fgetperiod;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ActnList, ImgList,
  ComCtrls, ToolWin, Db, OracleData, Oracle, //frxDSet,
  frxClass,  fr_Class, frxDBSet,
  DBCtrls, frxDesgn, frOLEExl, frXMLExl, HtmlHlp, JvExMask, JvToolEdit,
  cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCheckComboBox, JvStringHolder, cxCheckBox,
  Menus, cxLookAndFeelPainters, cxButtons, OracleMonitor, JvCombobox,
  Variants, dxSkinsCore, dxSkinsDefaultPainters, frxExportXLS, frxExportXML, frxPreview, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmGetPeriod = class(TForm)
    Panel1: TPanel;
    rbM1: TRadioButton;
    rbM2: TRadioButton;
    rbM3: TRadioButton;
    rbM4: TRadioButton;
    rbM5: TRadioButton;
    rbM6: TRadioButton;
    rbM7: TRadioButton;
    rbM8: TRadioButton;
    rbM9: TRadioButton;
    rbM10: TRadioButton;
    rbM11: TRadioButton;
    rbM12: TRadioButton;
    rbK1: TRadioButton;
    rbK2: TRadioButton;
    rbK3: TRadioButton;
    rbK4: TRadioButton;
    rbG1: TRadioButton;
    rbG2: TRadioButton;
    rbG3: TRadioButton;
    Panel2: TPanel;
    Label1: TLabel;
    dDate1: TJvDateEdit;
    dDate2: TJvDateEdit;
    Label2: TLabel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ilImages: TImageList;
    alActions: TActionList;
    acApply: TAction;
    acCancel: TAction;
    Bevel1: TBevel;
    Bevel2: TBevel;
    frDBdsRep: TfrxDBDataset;
    frPrihDoc: TfrxReport;
    os: TOracleSession;
    odsRep: TOracleDataSet;
    Panel3: TPanel;
    Label3: TLabel;
    frxDesigner1: TfrxDesigner;
    ods: TOracleDataSet;
    Panel4: TPanel;
    lbType: TLabel;
    odsUchGr: TOracleDataSet;
    dsType: TDataSource;
    oq: TOracleQuery;
    frxXMLExport1: TfrxXMLExport;
    frxXLSExport1: TfrxXLSExport;
    lcbMO_GROUP: TDBLookupComboBox;
    odsGroupMo: TOracleDataSet;
    odsGroupMoGROUPID: TFloatField;
    odsGroupMoFC_GROUP: TStringField;
    odsGroupMoFL_DEL: TFloatField;
    dsGroupMo: TDataSource;
    frPrihDoc_Old: TfrxReport;
    ccbUchGr: TcxCheckComboBox;
    JvStrHolder1: TJvStrHolder;
    buUchGrClear: TcxButton;
    buUchGrSelectAll: TcxButton;
    ToolButton3: TToolButton;
    rgrGrouping: TRadioGroup;
    Panel5: TPanel;
    Label4: TLabel;
    buSignClear: TcxButton;
    buSignSelectAll: TcxButton;
    buSignEdit: TcxButton;
    ccbSigns: TJvCheckedComboBox;
    oqInitMO: TOracleQuery;
    frxReport1: TfrxReport;
    oqPKG_SMINI: TOracleQuery;
    frxDBDataset1: TfrxDBDataset;
    Panel6: TPanel;
    Label5: TLabel;
    ccbIstFin: TcxCheckComboBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label6: TLabel;
    odsIstFin: TOracleDataSet;
    procedure rbAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure ToolBar1DblClick(Sender: TObject);
    procedure lcbCloseUp(Sender: TObject);
    procedure lcbCloseUp1(Sender: TObject);
    function MoneyToString(Summa: double; lRub: boolean): string;
    function get_countstr(aNumber: Integer): string;
    procedure frPrihDocGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frPrihDocUserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure odsUchGrAfterOpen(DataSet: TDataSet);
    procedure buUchGrClearClick(Sender: TObject);
    procedure buUchGrSelectAllClick(Sender: TObject);
    procedure ccbMedTypePropertiesEditValueChanged(Sender: TObject);
    procedure frPrihDocMouseOverObject(View: TfrxView; var Cursor: TCursor);
    procedure frPrihDocObjectClick(View: TfrxView);
    procedure buSignEditClick(Sender: TObject);
    procedure buSignSelectAllClick(Sender: TObject);
    procedure buSignClearClick(Sender: TObject);
    procedure ccbSignsChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure odsIstFinAfterOpen(DataSet: TDataSet);

  PRIVATE
    { Private declarations }
    FSelStr : string;
    sDB_NAME: string;
    FDefValue, FSectionName, FIniName : string;
    fSHOW_SERIAL_NO : Boolean;

    FZaklKom, FSpisano,
    FPred, FKom1, FKom2, FKom3, FMO, FDolMO, FUTVERJDAYU_FIO, FUTVERJDAYU_DOLJN,
    FDolPred, FDolKom1, FDolKom2, FDolKom3, FPrikaz  : string; 
    
    procedure LoadIniParams;

    function GetGroupRow(AText: String): String;
    function GetRow(A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11: String; AFcSerial : string = '' ): String;
    procedure MakeExcelReport(aFileName, aGroupFieldName : string; aFN_SUMM : Double);

    function READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;

  PUBLIC
    { Public declarations }
    function GetPayTypes: String;
  end;

var
  frmGetPeriod      : TfrmGetPeriod;

implementation


uses fFIOTreb, IniFiles, fSelectCheckedList, fCheckedListEdit, uReportParams,
  fdmPrintSelect, ComObj, Excel2000, uGlobalConst, SMMainAPI, fReportInputActSpis;
{$R *.DFM}

const
  CSurgutOKB_DB = 'SO';          

function EncodeStringToHex(aStr: string): string;
var
  i, Len : Integer;
begin
  Result := '';
  Len := Length(aStr);
  for i := 1 to Len do
    Result := Result+IntToHex(Ord(aStr[i]), 2);
end;
//------------------------------------------------------------------------------
function EncodeHexToString(aHexStr: string): string;
var
  i, Len : Integer;

  function HexToByte(aHex : string) : Byte;
  var
    res : byte;
  begin
    res := 0;
    case aHex[2] of
      '0'..'9' : res := Ord(aHex[2])-48;
      'A'..'F' : res := Ord(aHex[2])-55;
      'a'..'f' : res := Ord(aHex[2])-87;
    end;

    case aHex[1] of
      '0'..'9' : res := res+ (Ord(aHex[1])-48)*16;
      'A'..'F' : res := res+ (Ord(aHex[1])-55)*16;
      'a'..'f' : res := res+ (Ord(aHex[1])-87)*16;
    end;
    Result := res;
  end;
begin
  Result := '';
  Len := Length(aHexStr) div 2;
  for i := 1 to Len do
    Result := Result+Chr(HexToByte(aHexStr[(i*2)-1]+aHexStr[i*2]));
end;

procedure SaveResToFile(AResName, AType, AFileName: String);
var
  ResHandle: THandle;
  MemHandle: THandle;
  ResPtr   : Pointer;
  ResSize  : Integer;
  Stream   : TMemoryStream;
begin
  ResHandle:=FindResource(hInstance, PChar(AResName), PChar(AType));
  MemHandle:=LoadResource(hInstance, ResHandle);
  ResPtr:=LockResource(MemHandle);
  ResSize:=SizeOfResource(hInstance, ResHandle);
  Stream:=TMemoryStream.Create;
  Stream.SetSize(ResSize);
  Stream.Write(ResPtr^, ResSize);
  Stream.SaveToFile(AFileName);
  FreeResource(MemHandle);
  Stream.Free;
end;

//var
//  sJobTitleCompiler : String;
//  sFamCompiler      : String;
//  sJobTitleChecker  : String;
//  sFamChecker       : String;
//==============================================================================
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

function TfrmGetPeriod.GetGroupRow(AText: String): String;
var
  ColSpan : Integer;
begin
  if ( fSHOW_SERIAL_NO ) then
    ColSpan := 11
  else
    ColSpan := 10;

  Result:=
    '<tr height=17 style=''height:12.75pt''>'#13#10+
    '  <td height=17 class=xl3711056 style=''height:12.75pt;border-top:none''>&nbsp;</td>'#13#10+
    '  <td colspan=' + IntToStr(ColSpan) + ' class=xl4311056 width=705 style=''border-right:.5pt solid black; border-left:none;width:531pt''>'+AText+'</td>'#13#10+
    '</tr>'#13#10;
{
 Result:=
  '<tr height=17 style=''height:12.75pt''>'#13#10+
  ' <td height=17 class=xl152001 style=''height:12.75pt''></td>'+
  ' <td class=xl502001 style=''border-top:none''>&nbsp;</td>'+
  ' <td colspan=9 class=xl642001 width=706 style=''border-right:.5pt solid black;border-left:none;width:532pt''>'+AText+'</td>'+
  '</tr>';}
end;

function TfrmGetPeriod.GetRow(A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11: String; AFcSerial : string = ''): String;
begin
  if A1='' then A1:=' ';
  if A2='' then A2:=' ';
  if A3='' then A3:=' ';
  if A4='' then A4:=' ';
  if A5='' then A5:=' ';
  if A6='' then A6:=' ';
  if A7='' then A7:=' ';
  if A8='' then A8:=' ';
  if A9='' then A9:=' ';
  if A10='' then A10:=' ';  
  if A11='' then A11:=' ';

  Result:=
    '<tr height=17 style=''height:12.75pt''>'#13#10+
    '  <td height=17 class=xl2911056 style=''height:12.75pt''>'+A1+'</td>'#13#10+
    '  <td class=xl3011056 width=195 style=''border-left:none;width:150pt''>'+A2+'</td>'#13#10+
    '  <td class=xl3111056 width=45 style=''border-left:none;width:34pt''>'+A3+'</td>'#13#10+
    '  <td class=xl3111056 width=45 style=''border-left:none;width:34pt''>'+A4+'</td>'#13#10;

  if ( fSHOW_SERIAL_NO ) then
    Result := Result +
      '  <td class=xl3111056 width=45 style=''border-left:none;width:34pt''>'+AFcSerial+'</td>'#13#10;

  Result := Result +
    '  <td class=xl3111056 width=45 style=''border-left:none;width:34pt''>'+A5+'</td>'#13#10+
    '  <td class=xl2711056>'+A6+'</td>'#13#10+
    '  <td class=xl2811056 style=''border-left:none''>'+A7+'</td>'#13#10+
    '  <td class=xl2811056 style=''border-left:none''>'+A8+'</td>'#13#10+
    '  <td class=xl2811056 style=''border-left:none''>'+A9+'</td>'#13#10+
    '  <td class=xl3611056 style=''border-left:none''>'+A10+'</td>'#13#10+
    '  <td class=xl3611056 style=''border-left:none''>'+A11+'</td>'#13#10+
    '</tr>'#13#10;
end;

procedure TfrmGetPeriod.MakeExcelReport(aFileName, aGroupFieldName : string; aFN_SUMM : Double);
var
  S, sGroup : String;
  N: Integer;
  sFileName1, sFileName2: String;
  Excel: Variant;
  RowCount : Integer;
begin
  if not odsRep.Active then Exit;
  Screen.Cursor:=crHourGlass;

  S:='';
  sGroup:='';
  N:=0;

  with odsRep do
  begin
//    if Active then Close;
//    Open;
    First;
    RowCount := odsRep.RecordCount;
    while not Eof do
    begin
      if FieldByName(aGroupFieldName).AsString<>sGroup then
      begin
        sGroup:=FieldByName(aGroupFieldName).AsString;
        Inc(RowCount);
        S:=S+#13#10+GetGroupRow(sGroup);
        N:=0;
      end;

      Inc(N);
      if UpperCase( sDB_NAME ) = UpperCase( CSurgutOKB_DB ) then
      begin
        S:=S+#13#10+GetRow(IntToStr(N),
                        FieldByName('fc_longname').AsString,
                        FieldByName('medicid').AsString,
                        FieldByName('fc_edizm').AsString,
                        FieldByName('fc_finsource').AsString,
                        FieldByName('fc_kolostbegin5').AsString,
                        FieldByName('fc_kolprih5').AsString,
                        FieldByName('fc_kolrash5').AsString,
                        FieldByName('fc_kolostend5').AsString,
                        FloatToStrF(FieldByName('fn_price').AsFloat,     ffNumber, 15, 3),
                        FloatToStrF(FieldByName('fn_sumostend').AsFloat, ffNumber, 15, 3),
                        FieldByName('FC_SERIAL').AsString);
      end
      else begin
        S:=S+#13#10+GetRow(IntToStr(N),
                        FieldByName('fc_longname').AsString,
                        FieldByName('medicid').AsString,
                        FieldByName('fc_edizm').AsString,
                        FieldByName('fc_finsource').AsString,
                        FieldByName('fc_kolostbegin').AsString,
                        FieldByName('fc_kolprih').AsString,
                        FieldByName('fc_kolrash').AsString,
                        FieldByName('fc_kolostend').AsString,
                        FloatToStrF(FieldByName('fn_price').AsFloat,     ffNumber, 15, 2),
                        FloatToStrF(FieldByName('fn_sumostend').AsFloat, ffNumber, 15, 2),
                        FieldByName('FC_SERIAL').AsString);
      end;
        Next;
    end; // while not Eof do
    Close;
  end; // with odsRep do


  if FileExists('Dvig_med_buh_shablon.htm') then
  begin               
    sFileName1 := ChangeFileExt(fdmPrintSelect.PrepareFilePath(aFileName), 'htm');
    CopyFile(PAnsiChar('Dvig_med_buh_shablon.htm'), PAnsiChar(sFileName1), false);
    sFileName2 := ChangeFileExt(sFileName1,'.xls');
  end
  else
  begin
    sFileName1 := ChangeFileExt(fdmPrintSelect.PrepareFilePath(aFileName), 'htm');
    sFileName2 := ChangeFileExt(sFileName1,'.xls');
    SaveResToFile( 'HTMLShablon', 'htm', sFileName1);
  end;

  with TStringList.Create do
  begin
    LoadFromFile(sFileName1);
    Text:=StringReplace(Text, '::REPLACEHERE::', S,                                                  [rfIgnoreCase]);
    if UpperCase( sDB_NAME ) = UpperCase( CSurgutOKB_DB ) then
    begin
      Text:=StringReplace(Text, '::FN_SUMM::',     FloatToStrF(aFN_SUMM, ffCurrency, 15, 3),         [rfIgnoreCase]);
      Text:=StringReplace(Text, '::GLAV_VRACH::',  GetTSMINIValue( os, 'MANAGER_DOC', 'ZAM_GL_VRA4' ),  [rfIgnoreCase]);
    end
    else
    begin
      Text:=StringReplace(Text, '::FN_SUMM::',     FloatToStrF(aFN_SUMM, ffCurrency, 15, 2),         [rfIgnoreCase]);
      Text:=StringReplace(Text, '::GLAV_VRACH::',  GetTSMINIValue( os, 'MANAGER_DOC', 'GLAV_VRACH' ),  [rfIgnoreCase]);
    end;

    Text:=StringReplace(Text, '::CHIEF_SIGN_TEXT::',  GetTSMINIValue( os, 'MANAGER_DOC', 'CHIEF_SIGN_TEXT' ),  [rfIgnoreCase]);

    Text:=StringReplace(Text, '::Otdelenie::',   odsGroupMo.FieldByName('FC_GROUP').AsString,        [rfIgnoreCase]);
    Text:=StringReplace(Text, '::UCHREJDENIE::', GetTSMINIValue( os, 'MANAGER_DOC', 'CLIENT_NAME' ), [rfIgnoreCase]);

    Text:=StringReplace(Text, '::DATE1::',       DateTimeToStr(dDate1.Date),                         [rfIgnoreCase]);
    Text:=StringReplace(Text, '::DATE2::',       DateTimeToStr(dDate2.Date),                         [rfIgnoreCase]);

    try
      SaveToFile(sFileName2);
    except
      ;
    end;
    Free;
  end;

  Excel:=CreateOleObject('Excel.Application');
  Excel.Workbooks.Open(sFileName2);
  try
    Excel.ActiveSheet.PageSetup.LeftMargin := 57;
    Excel.ActiveSheet.PageSetup.RightMargin := 27;
    Excel.ActiveSheet.PageSetup.TopMargin := 27;
    Excel.ActiveSheet.PageSetup.BottomMargin := 27;

    Excel.ActiveSheet.PageSetup.PrintTitleRows:='$19:$20';
    Excel.ActiveSheet.PageSetup.LeftFooter := '&"Arial,обычный"&7' + ReadMedotradeSign;
  //  Excel.ActiveSheet.PageSetup.RightFooter:= '&P из &N';
    if ( fSHOW_SERIAL_NO ) then
      Excel.ActiveSheet.PageSetup.Zoom := 74
    else
      Excel.ActiveSheet.PageSetup.Zoom := 78;

    Excel.Rows['22:'+IntToStr(RowCount+22)].EntireRow.AutoFit;
  except
    on E : Exception do
    begin
      Application.MessageBox( PAnsiChar ( 'Ошибка при установке параметров страницы отчета!'#13#10 + E.message ),
        PAnsiChar ( 'Ошибка' ), MB_OK + MB_ICONWARNING );
    end;                                                     
  end;
  Excel.Visible:=True;
  DeleteFile(sFileName1);

  Screen.Cursor:=crDefault;
end;

//==============================================================================
function TfrmGetPeriod.GetPayTypes: String;
var odsPayType : TOracleDataSet;
begin
  odsPayType := TOracleDataset.Create(nil);
  try
    odsPayType.Session := os;
    odsPayType.Sql.Text := 'SELECT * FROM MED.TPAYTYPE P ORDER BY P.FC_NAME';
    odsPayType.Open;
    While not odsPayType.Eof do
    begin
      Result := Result + odsPayType.FieldByName('FC_NAME').AsString + ',';
      odsPayType.Next;
    end;
    System.Delete(Result,Length(Result),1);
  finally
    odsPayType.Free;
  end;
end;

procedure TfrmGetPeriod.rbAllClick(Sender: TObject);
var
  cName             : string;
  dDate             : tdate;
  nMon              : word;
  nYear             : word;
begin
  cName:=uppercase(tcomponent(Sender).getnamepath);
  dDate:=0;
  decodedate(date, nYear, nMon, nMon);
  if cName = 'RBM1' then begin
    dDate:=encodedate(nYear, 1, 1);
    nMon:=1
  end
  else
    if cName = 'RBM2' then begin
      dDate:=encodedate(nYear, 2, 1);
      nMon:=1
    end
    else
      if cName = 'RBM3' then begin
        dDate:=encodedate(nYear, 3, 1);
        nMon:=1
      end
      else
        if cName = 'RBM4' then begin
          dDate:=encodedate(nYear, 4, 1);
          nMon:=1
        end
        else
          if cName = 'RBM5' then begin
            dDate:=encodedate(nYear, 5, 1);
            nMon:=1
          end
          else
            if cName = 'RBM6' then begin
              dDate:=encodedate(nYear, 6, 1);
              nMon:=1
            end
            else
              if cName = 'RBM7' then begin
                dDate:=encodedate(nYear, 7, 1);
                nMon:=1
              end
              else
                if cName = 'RBM8' then begin
                  dDate:=encodedate(nYear, 8, 1);
                  nMon:=1
                end
                else
                  if cName = 'RBM9' then begin
                    dDate:=encodedate(nYear, 9, 1);
                    nMon:=1
                  end
                  else
                    if cName = 'RBM10' then begin
                      dDate:=encodedate(nYear, 10, 1);
                      nMon:=1
                    end
                    else
                      if cName = 'RBM11' then begin
                        dDate:=encodedate(nYear, 11, 1);
                        nMon:=1
                      end
                      else
                        if cName = 'RBM12' then begin
                          dDate:=encodedate(nYear, 12, 1);
                          nMon:=1
                        end
                        else
                          if cName = 'RBK1' then begin
                            dDate:=encodedate(nYear, 1, 1);
                            nMon:=3
                          end
                          else
                            if cName = 'RBK2' then begin
                              dDate:=encodedate(nYear, 4, 1);
                              nMon:=3
                            end
                            else
                              if cName = 'RBK3' then begin
                                dDate:=encodedate(nYear, 7, 1);
                                nMon:=3
                              end
                              else
                                if cName = 'RBK4' then begin
                                  dDate:=encodedate(nYear, 10, 1);
                                  nMon:=3
                                end
                                else
                                  if cName = 'RBG1' then begin
                                    dDate:=encodedate(nYear, 1, 1);
                                    nMon:=6
                                  end
                                  else
                                    if cName = 'RBG2' then begin
                                      dDate:=encodedate(nYear, 7, 1);
                                      nMon:=6
                                    end
                                    else
                                      if cName = 'RBG3' then begin
                                        dDate:=encodedate(nYear, 1, 1);
                                        nMon:=12
                                      end;
  Self.dDate1.date:=dDate;
  Self.dDate2.date:=incmonth(dDate, nMon) - 1;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var d: integer;
    FK_APPSOTR_ID : Integer;
    UchgridStr : string;
begin
  try
//    os.LogOn;
    GetSession(os, 'ASU');
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;
  ods.open;
  d:=strtoint(ods.FieldByName('M').AsString);
  case d of
    1: rbm1.Checked:=true;
    2: rbm2.Checked:=true;
    3: rbm3.Checked:=true;
    4: rbm4.Checked:=true;
    5: rbm5.Checked:=true;
    6: rbm6.Checked:=true;
    7: rbm7.Checked:=true;
    8: rbm8.Checked:=true;
    9: rbm9.Checked:=true;
    10: rbm10.Checked:=true;
    11: rbm11.Checked:=true;
    12: rbm12.Checked:=true;
  else
     rbm1.Checked:=true;
  end;

  FIniName := ChangeFileExt(Application.ExeName,'.ini'); // дефолтовое имя ини-файла
  FSectionName := ccbSigns.Name;
  FDefValue := 'Старшая медсестра'#13#10'Зав. отделением'#13#10'Зам. гл. врача по мед. части'#13#10'Главная медсестра'#13#10'Клинический фармаколог'#13#10'Зав. ОМС'#13#10'Гл. бухгалтер'#13#10'Бухгалтер';
  LoadIniParams;
  ccbSigns.SetCheckedAll();

  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;

  with TOracleQuery.Create(Self) do
  begin
    SQL.Text := 'ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '', ''';
    Session := os;
    Execute;
    Free;
  end;
  odsGroupMo.Close;
  odsGroupMo.Open;
//  // Для получения Dvig_med_buh.exe
//  // Закомментить lcbMO_GROUP.KeyValue и lcbMO_GROUP.Enabled (след. 2 строки)
//  // и в odsUchGr заменить med.V$TUchGr на med.TUchGr
//  lcbMO_GROUP.keyValue := oqInitMO.GetVariable('NMO_GROUP');
////  lcbMO_GROUP.Enabled  := (oqInitMO.GetVariable('PFL_PROVIZOR') = 1);

  odsUchGr.Open;
  odsIstFin.Open;
  Self.Caption := Application.Title;

  sDB_NAME := READSTRING_TSMINI ( 'CONFIG', 'DB_NAME', '' );

  fSHOW_SERIAL_NO := ( READSTRING_TSMINI( 'DVIG_MED_BUH.EXE', 'SHOW_SERIAL_NO', '0' ) = '1' ) ;

  if READSTRING_TSMINI('MEDICA.EXE','FUNC_USE_MEDUCHGRP_CH','0') = '1' then
    UchgridStr := 'nvl(k.UCHGRID, m.UCHGRID)'
  else
    UchgridStr := 'm.UCHGRID';
  odsRep.SQL.Text := StringReplace( odsRep.SQL.Text, '#uchgrid#', UchgridStr, [rfReplaceAll, rfIgnoreCase] );

  JvStrHolder1.CommaText := StringReplace( JvStrHolder1.CommaText, '#uchgrid#', UchgridStr, [rfReplaceAll, rfIgnoreCase] );

end;

procedure TfrmGetPeriod.acApplyExecute(Sender: TObject);
var
//  IDn,
  i  : Integer;
  IDs, IDs1 : string;
  P : TPoint;
  FN_SUMM : Double;
//  p : TfrxPreview;
  Params : TArrayOfParams;
  i2 : integer;
begin
  try
//    Self.dDate1.CheckValiddate;
  StrToDate( dDate1.Text );
  except
    on EConvertError do begin
      Application.MessageBox('Неверно введена начальная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate1.SetFocus;
      Exit;
    end;
  end;
  try
//    Self.dDate2.CheckValiddate;
  StrToDate( dDate2.Text );
  except
    on EConvertError do begin
      Application.MessageBox('Неверно введена конечная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate2.SetFocus;
      Exit;
    end;
  end;
  if Self.dDate1.date > Self.dDate2.date then begin
     Application.MessageBox('Неверно задан период', 'Ошибка', MB_OK + MB_ICONERROR);
    Self.dDate1.SetFocus;
    Exit;
  end;
  if ccbUchGr.Text = ccbUchGr.Properties.EmptySelectionText then
  begin
    Application.MessageBox('Не выбрана группа учетности медикаментов', 'Ошибка', MB_OK + MB_ICONERROR);
    ccbUchGr.SetFocus;
    Exit;
  end;
  if ccbIstFin.Text = ccbIstFin.Properties.EmptySelectionText then
  begin
    Application.MessageBox('Не выбраны источники финансирования', 'Ошибка', MB_OK + MB_ICONERROR);
    ccbIstFin.SetFocus;
    Exit;
  end;
  if dmPrintSelect.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := ToolButton1.Height;
    P := ToolButton1.ClientToScreen(P);
    dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати
  if dmPrintSelect.PrintFlag = 0 then Exit;
  try
    if READSTRING_TSMINI( 'DVIG_MED.EXE', 'USE_INPUT_FIO', '0' ) = '1' then
    begin
      i2 := 0;
      SetLength( Params, 1);
      Params[i2].Name := 'Председатель';
      Params[i2].Value := IniReadString(FIniName,'DVIG_MED', 'Predsed', '');
      Params[i2].ParamType := 1;
      inc( i2 );

      i := 3; //dmMain.ConfigParams.GetParamValue('FUNC_COUNT_SPIS_CHLEN_KOM', 3);
      SetLength( Params, Length(Params)+i);
      for i := 0 to 2 do
      begin
        Params[i2].Name := 'Член ком.'+IntToStr(i+1);
        Params[i2].Value := IniReadString(FIniName, 'DVIG_MED', 'ChlenKom'+IntToStr(i+1), '');
        Params[i2].ParamType := 1;
        inc( i2 );
      end;

      SetLength( Params, Length(Params)+1);
      Params[i2].Name := 'Мат. отв. лицо';
      Params[i2].Value := IniReadString(FIniName,'DVIG_MED', 'MO', '');
      Params[i2].ParamType := 1;
      inc( i2 );

      SetLength( Params, Length(Params)+1);
      Params[i2].Name := 'Утверждаю (ФИО)';
      Params[i2].Value := IniReadString(FIniName,'DVIG_MED', 'UTVERJDAYU_FIO', '');
      Params[i2].ParamType := 1;
      inc( i2 );

      SetLength( Params, Length(Params)+1);
      Params[i2].Name := 'Должн. председателя';
      Params[i2].Value := IniReadString(FIniName,'DVIG_MED', 'DoljnChlenPredsed', '');
      Params[i2].ParamType := 0;
      inc( i2 );
      i := 3; //dmMain.ConfigParams.GetParamValue('FUNC_COUNT_SPIS_CHLEN_KOM', 3);
      SetLength( Params, Length(Params)+i);
      for i := 0 to 2 do
      begin
        Params[i2].Name := 'Должн. члена ком.'+IntToStr(i+1);
        Params[i2].Value := IniReadString(FIniName,'DVIG_MED', 'DoljnChlenKom'+IntToStr(i+1), '');
        Params[i2].ParamType := 0;
        inc( i2 );
      end;

      SetLength( Params, Length(Params)+1);
      Params[i2].Name := 'Должность МО';
      Params[i2].Value := IniReadString(FIniName,'DVIG_MED', 'DoljnMO', '');
      Params[i2].ParamType := 0;
      inc( i2 );

      SetLength( Params, Length(Params)+1);
      Params[i2].Name := 'Утверждаю (Должн.)';
      Params[i2].Value := IniReadString(FIniName,'DVIG_MED', 'UTVERJDAYU_DOLJN', '');
      Params[i2].ParamType := 0;
      inc( i2 );

      FZaklKom := EncodeHexToString(IniReadString(FIniName, 'DVIG_MED', 'ZaklKom', ''));

      FSpisano := EncodeHexToString(IniReadString(FIniName, 'DVIG_MED', 'Spisano', ''));
      FPrikaz := IniReadString(FIniName, 'DVIG_MED', 'PrikazOt', 'от "___"  ____________  20___ г  № ___');

      if DoShowReportInputActSpis(os, Params, FZaklKom, FSpisano, FPrikaz) <> mrOk then
      begin
        FZaklKom := '';
        FSpisano := '';
        Exit;
      end;

    //      IniWriteString(iniFileName, 'KOMISSIYA', 'TEXT', EncodeStringToHex(StrList.Text));
      for i := 0 to Length(Params) - 1 do
      begin
        if Params[i].Name = 'Председатель' then FPred := Params[i].Value;

        if Params[i].Name = 'Член ком.1' then FKom1 := Params[i].Value;
        if Params[i].Name = 'Член ком.2' then FKom2 := Params[i].Value;
        if Params[i].Name = 'Член ком.3' then FKom3 := Params[i].Value;

        if Params[i].Name = 'Мат. отв. лицо' then FMO := Params[i].Value;
        if Params[i].Name = 'Утверждаю (ФИО)' then FUTVERJDAYU_FIO := Params[i].Value;

        if Params[i].Name = 'Должн. председателя' then FDolPred := Params[i].Value;

        if Params[i].Name = 'Должн. члена ком.1' then FDolKom1 := Params[i].Value;
        if Params[i].Name = 'Должн. члена ком.2' then FDolKom2 := Params[i].Value;
        if Params[i].Name = 'Должн. члена ком.3' then FDolKom3 := Params[i].Value; 

        if Params[i].Name = 'Должность МО' then FDolMO := Params[i].Value;
        if Params[i].Name = 'Утверждаю (Должн.)' then FUTVERJDAYU_DOLJN := Params[i].Value;
      end;

      IniWriteString(FIniName, 'DVIG_MED', 'Predsed',          FPred   );

      IniWriteString(FIniName, 'DVIG_MED', 'ChlenKom1',         FKom1);
      IniWriteString(FIniName, 'DVIG_MED', 'ChlenKom2',         FKom2);
      IniWriteString(FIniName, 'DVIG_MED', 'ChlenKom3',         FKom3);

      IniWriteString(FIniName, 'DVIG_MED', 'MO',                FMO   );

      IniWriteString(FIniName, 'DVIG_MED', 'DoljnChlenPredsed', FDolPred);
      IniWriteString(FIniName, 'DVIG_MED', 'DoljnChlenKom1',   FDolKom1);
      IniWriteString(FIniName, 'DVIG_MED', 'DoljnChlenKom2',   FDolKom2);
      IniWriteString(FIniName, 'DVIG_MED', 'DoljnChlenKom3',   FDolKom3);

      IniWriteString(FIniName, 'DVIG_MED', 'DoljnMO',          FDolMO   );

      IniWriteString(FIniName, 'DVIG_MED', 'UTVERJDAYU_FIO',          FUTVERJDAYU_FIO   );
      IniWriteString(FIniName, 'DVIG_MED', 'UTVERJDAYU_DOLJN',          FUTVERJDAYU_DOLJN   );

      IniWriteString(FIniName, 'DVIG_MED', 'ZaklKom', EncodeStringToHex(FZaklKom));
      IniWriteString(FIniName, 'DVIG_MED', 'Spisano', EncodeStringToHex(FSpisano));
      IniWriteString(FIniName, 'DVIG_MED', 'PrikazOt', FPrikaz);
    end;

  // проверка на выбор типа медикамента
  //  IDn := 0;
    IDs := '';
    for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
    begin
      if ccbUchGr.States[i] = cbsChecked then
      begin
//        Inc(IDn);
        IDs := IDs + ', '+IntToStr(ccbUchGr.Properties.Items[i].Tag);
      end;
    end;
    Delete(IDs, 1, 2); // удаляем первую запятую и пробел - они лишние
    // источники финансирования
    IDs1 := '';
    for i := 0 to ccbIstFin.Properties.Items.Count - 1 do
    begin
      if ccbIstFin.States[i] = cbsChecked then
      begin
//        Inc(IDn);
        IDs1 := IDs1 + ', '+IntToStr(ccbIstFin.Properties.Items[i].Tag);
      end;
    end;
    Delete(IDs1, 1, 2); // удаляем первую запятую и пробел - они лишние
//    if IDs = '' then
//    begin
//      Application.MessageBox('Не выбрана группа учетности медикаментов', 'Ошибка', MB_OK + MB_ICONERROR);
//      ccbUchGr.SetFocus;
//      Exit;
//    end;
  //------------------------------------------------------------------------------


  //ввод данных о Составителе
  //  frmFIOTreb := TfrmFIOTreb.Create(Self);
  //  try
  //    if frmFIOTreb.ShowModal = mrCancel then Exit;
  //    sJobTitleCompiler := frmFIOTreb.edJobTitle.Text;
  //    sFamCompiler := frmFIOTreb.edFam.Text;
  //  finally
  //    frmFIOTreb.Free;
  //  end;
  //
  //  frmFIOTreb := TfrmFIOTreb.Create(Self);
  //  try
  //    frmFIOTreb.Caption := 'Ввод данных о проверяющем';
  //    if frmFIOTreb.ShowModal = mrCancel then Exit;
  //    sJobTitleChecker := frmFIOTreb.edJobTitle.Text;
  //    sFamChecker := frmFIOTreb.edFam.Text;
  //  finally
  //    frmFIOTreb.Free;
  //  end;

  //  DoShowSelectCheckedList(FSelStr, 'Старшая медсестра'#13#10'Зав. отделением'#13#10'Зам. гл. врача по мед. части'#13#10'Главная медсестра'#13#10'Клинический фармаколог'#13#10'Зав. ОМС'#13#10'Гл. бухгалтер'#13#10'Бухгалтер' );
    // формируем список выбранных строк
    FSelStr := '';
    for i := 0 to ccbSigns.Items.Count - 1 do
      if ccbSigns.Checked[i] then FSelStr := FSelStr +ccbSigns.Items[i] +#13#10;

    FSelStr := StringReplace(FSelStr, #13#10, '  ________________________'#13#10, [rfReplaceAll]); // добавляем место для росписи

    if IDs = '' then
      JvStrHolder1.MacroByName('UchGr').Value := '-1'
    else
    begin
      odsRep.SetVariable('UchGrFiltered',1);
      JvStrHolder1.MacroByName('UchGr').Value := IDs;
    end;

    if IDs1 = '' then
    begin
       odsRep.SetVariable('ISTFINFILTERED', 0);    
      JvStrHolder1.MacroByName('IstFin').Value := '-1'
    end
    else
    begin
      odsRep.SetVariable('ISTFINFILTERED',1);
      JvStrHolder1.MacroByName('IstFin').Value := IDs1;
    end;

    odsRep.SetVariable('FN_GROUP', rgrGrouping.ItemIndex);
    odsRep.SQL.Text := JvStrHolder1.ExpandMacros;

    if ( fSHOW_SERIAL_NO ) then
      odsRep.SetVariable( 'SHOW_SERIAL_NO', 1 )
    else
      odsRep.SetVariable( 'SHOW_SERIAL_NO', 0 );

    if READSTRING_TSMINI( 'DVIG_MED.EXE', 'USE_KART', '0' ) = '1' then
    begin
      odsRep.SQL.Text := StringReplace(odsRep.SQL.Text, '--USE_KART', '', [rfReplaceAll]);
    end;

    odsRep.SetVariable('Date1', dDate1.date);
  //    SetVariable('Date2', trunc(dDate2.date) + 1 - 1/(24*60*60));
    odsRep.SetVariable('Date2', dDate2.date);
    odsRep.SetVariable('MOGROUP_ID', lcbMO_GROUP.keyValue);
  //    SetVariable('TMEDICTYPE', lcbType.KeyValue);
    odsRep.Close;
    odsRep.Open;
    FN_SUMM := 0;
    while not odsRep.Eof do
    begin
      FN_SUMM := FN_SUMM + odsRep.FieldByName('FN_KOLOSTEND').AsFloat*odsRep.FieldByName('FN_PRICE').AsFloat;
      odsRep.Next;
    end;
    odsRep.First;

  //  if not VarisNull(lcbType.KeyValue) then

    Self.Hide;

    if FileExists('Dvig_Med_Buh_frPrihDoc.fr3') then            // если найден файл
      frPrihDoc.LoadFromFile('Dvig_Med_Buh_frPrihDoc.fr3');  // загружаем его

    case rgrGrouping.ItemIndex of
      0 :
      begin
        case dmPrintSelect.PrintFlag of // флаг куда печатать
//          1: ExportFRToExcel( frPrihDoc, 'ОТЧЕТ О ДВИЖЕНИИ ЛЕКАРСТВЕННЫХ СРЕДСТВ c '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls' );
          1:
          begin
            if READSTRING_TSMINI( 'DVIG_MED.EXE', 'USE_INPUT_FIO', '0' ) = '1' then            
            begin
              tfrBandView(frPrihDoc.FindObject('MasterHeader1')).Prop['REPEATHEADER']:= False;
              frPrihDoc.FindObject('PageFooter1').Visible := False;
              frPrihDoc.PrepareReport;
              ExportFRToExcel(frPrihDoc, 'ОТЧЕТ О ДВИЖЕНИИ ЛЕКАРСТВЕННЫХ СРЕДСТВ c '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls');
            end
            else
              MakeExcelReport('ОТЧЕТ О ДВИЖЕНИИ ЛЕКАРСТВЕННЫХ СРЕДСТВ c '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls', 'fc_uchgr', FN_SUMM);
          end;
          2:
          begin
//            frPrihDoc.FindObject('GroupHeader1').Visible := True;
//            frPrihDoc.FindObject('MasterData1').Visible  := True;
//            frPrihDoc.FindObject('GroupFooter1').Visible := True;
//            frPrihDoc.FindObject('GroupHeader2').Visible := False;
//            frPrihDoc.FindObject('MasterData2').Visible  := False;
//            frPrihDoc.FindObject('GroupFooter2').Visible := False;
            frPrihDoc.ShowReport;
          end;

        end;
      end;

      1 :
      begin
        case dmPrintSelect.PrintFlag of // флаг куда печатать
//          1: ExportFRToExcel( frPrihDoc2, 'ОТЧЕТ О ДВИЖЕНИИ ЛЕКАРСТВЕННЫХ СРЕДСТВ c '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls' );
          1: 
          begin
            if READSTRING_TSMINI( 'DVIG_MED.EXE', 'USE_INPUT_FIO', '0' ) = '1' then
            begin
              tfrBandView(frPrihDoc.FindObject('MasterHeader1')).Prop['REPEATHEADER']:= False;
              frPrihDoc.FindObject('PageFooter1').Visible := False;
              frPrihDoc.PrepareReport;
              ExportFRToExcel(frPrihDoc, 'ОТЧЕТ О ДВИЖЕНИИ ЛЕКАРСТВЕННЫХ СРЕДСТВ c '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls');
            end
            else
              MakeExcelReport('ОТЧЕТ О ДВИЖЕНИИ ЛЕКАРСТВЕННЫХ СРЕДСТВ c '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls', 'FC_FIRST_CHAR', FN_SUMM);
          end;
          2:
          begin
//            frPrihDoc.FindObject('GroupHeader1').Visible := False;
//            frPrihDoc.FindObject('MasterData1').Visible  := False;
//            frPrihDoc.FindObject('GroupFooter1').Visible := False;
//            frPrihDoc.FindObject('GroupHeader2').Visible := True;
//            frPrihDoc.FindObject('MasterData2').Visible  := True;
//            frPrihDoc.FindObject('GroupFooter2').Visible := True;
            frPrihDoc.ShowReport;
          end;
        end;
      end;

      2 :
      begin
        case dmPrintSelect.PrintFlag of // флаг куда печатать
//          1: ExportFRToExcel( frPrihDoc, 'ОТЧЕТ О ДВИЖЕНИИ ЛЕКАРСТВЕННЫХ СРЕДСТВ c '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls' );
          1: 
          begin
            if READSTRING_TSMINI( 'DVIG_MED.EXE', 'USE_INPUT_FIO', '0' ) = '1' then
            begin
              tfrBandView(frPrihDoc.FindObject('MasterHeader1')).Prop['REPEATHEADER']:= False;
              frPrihDoc.FindObject('PageFooter1').Visible := False;
              frPrihDoc.PrepareReport;
              ExportFRToExcel(frPrihDoc, 'ОТЧЕТ О ДВИЖЕНИИ ЛЕКАРСТВЕННЫХ СРЕДСТВ c '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls');
            end
            else
              MakeExcelReport('ОТЧЕТ О ДВИЖЕНИИ ЛЕКАРСТВЕННЫХ СРЕДСТВ c '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls', 'fc_finsource', FN_SUMM);
          end;
          2:
          begin
//            frPrihDoc.FindObject('GroupHeader1').Visible := True;
//            frPrihDoc.FindObject('MasterData1').Visible  := True;
//            frPrihDoc.FindObject('GroupFooter1').Visible := True;
//            frPrihDoc.FindObject('GroupHeader2').Visible := False;
//            frPrihDoc.FindObject('MasterData2').Visible  := False;
//            frPrihDoc.FindObject('GroupFooter2').Visible := False;
            frPrihDoc.ShowReport;
          end;

        end;
      end;
    end;

  finally
    dmPrintSelect.PrintFlag := 0;
    Close;    
  end;
end;

procedure TfrmGetPeriod.acCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetPeriod.ToolBar1DblClick(Sender: TObject);
begin
  frPrihDoc.DesignReport;
end;

procedure TfrmGetPeriod.lcbCloseUp(Sender: TObject);
begin
  acApply.Enabled := (lcbMO_GROUP.Text <> '');// and (ccbUchGr.Text <> 'Не выбрано');//(lcbType.Text <> '');
  lcbMO_GROUP.Hint := lcbMO_GROUP.Text;
end;

procedure TfrmGetPeriod.lcbCloseUp1(Sender: TObject);
begin
  acApply.Enabled := (lcbMO_GROUP.Text <> '');// and (ccbUchGr.Text <> 'Не выбрано');//(lcbType.Text <> '');
  lcbMO_GROUP.Hint := lcbMO_GROUP.Text;
end;

procedure TfrmGetPeriod.frPrihDocGetValue(const ParName: String; var ParValue: Variant);
var
  S : string;
begin

  if ParName = 'Date1' then ParValue := DateTimeToStr(dDate1.Date)
  else if ParName = 'Date2' then ParValue := DateTimeToStr(dDate2.Date)
  //заполнение переменных о составителе и о проверяющем
//  else if ParName = 'JobTitleCompiler' then ParValue := sJobTitleCompiler
//  else if ParName = 'FamCompiler' then ParValue := sFamCompiler
//  else if ParName = 'JobTitleChecker' then ParValue := sJobTitleChecker
//  else if ParName = 'FamChecker' then ParValue := sFamChecker
  else if ParName = 'var_paytypes' then
  begin
    ParValue := GetPayTypes;
  end
  else if ParName = 'var_receiver' then
  begin
    S := GetReportValue(os, Self.Name, frPrihDoc.Name, 'meNameUchr');
    if S = '' then S := GetTSMINIValue( os, 'MANAGER_DOC', 'CLIENT_NAME' );
    ParValue := S;
//    with TOracleQuery.Create(nil) do
//    try
//      Session := Os;
//      Sql.Text := 'SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''MANAGER_DOC'' AND FC_KEY = ''CLIENT_NAME''';
//      try
//        Execute;
//        ParValue := Field(0);
//      except
//        ParValue := '';
//      end;
//    finally
//      Free;
//    end;
  end
  else if ParName = 'var_podpisano' then
    ParValue := FSelStr
  else if ParName = 'var_mo' then
    ParValue := oqInitMO.GetVariable('nMO')
  else
  if ParName = 'var_glav_vrach' then
  begin
    // для Сургут ОКБ выводится зам.глав. врача
    if UpperCase( sDB_NAME ) = UpperCase( CSurgutOKB_DB )  then
      ParValue := GetTSMINIValue( os, 'MANAGER_DOC', 'ZAM_GL_VRA4' )
    else
      ParValue := GetTSMINIValue( os, 'MANAGER_DOC', 'GLAV_VRACH' );
  end
  else
  if ParName = 'v_chief_sign_text' then
  begin
    ParValue := GetTSMINIValue( os, 'MANAGER_DOC', 'CHIEF_SIGN_TEXT' );
  end
  else
    if ParName = 'MEDOTRADE_SIGN' then ParValue := ReadMedotradeSign;

  if UpperCase(ParName) = 'PRED' then ParValue := FPred;
  if UpperCase(ParName) = 'KOM1' then ParValue := FKom1;
  if UpperCase(ParName) = 'KOM2' then ParValue := FKom2;
  if UpperCase(ParName) = 'KOM3' then ParValue := FKom3;
  if UpperCase(ParName) = 'MO'   then ParValue := FMO;
  if UpperCase(ParName) = 'DOLPRED' then ParValue := FDolPred;
  if UpperCase(ParName) = 'DOLKOM1' then ParValue := FDolKom1;
  if UpperCase(ParName) = 'DOLKOM2' then ParValue := FDolKom2;
  if UpperCase(ParName) = 'DOLKOM3' then ParValue := FDolKom3;
  if UpperCase(ParName) = 'DOLMO'   then ParValue := FDolMO;
  if UpperCase(ParName) = 'PRIKAZ' then ParValue  := FPrikaz;
  if UpperCase(ParName) = 'UTVERJDAYU_FIO' then ParValue  := FUTVERJDAYU_FIO;
  if UpperCase(ParName) = 'UTVERJDAYU_DOLJN' then ParValue  := FUTVERJDAYU_DOLJN;
  if UpperCase(ParName) = 'GETZAKLKOM' then ParValue := FZaklKom;
  if ParName = 'SMS' then ParValue    := oqInitMO.GetVariable('nSMS');
  if ParName = 'ZavOtd' then ParValue := oqInitMO.GetVariable('nZavOtd');
end;  

function TfrmGetPeriod.MoneyToString(Summa: double; lRub: boolean): string;
const
    TysStr: array[1..4] of string = ('', 'две', 'три', 'четыре');
    Ed2_4Str: array[2..4] of string = ('два', 'три', 'четыре');
    Ed5_19Str: array[5..19] of string = ('пять', 'шесть', 'семь', 'восемь', 'девять',
        'десять', 'одиннадцать', 'двенадцать', 'тpинадцать',
        'четыpнадцать', 'пятнадцать', 'шестнадцать', 'семнадцать',
        'восемнадцать', 'девятнадцать');
    DesStr: array[2..9] of string = ('двадцать', 'тpидцать', 'соpок', 'пятьдесят', 'шестьдесят',
        'семьдесят', 'восемьдесят', 'девяносто');
    SotStr: array[1..9] of string = ('сто', 'двести', 'тpиста', 'четыpеста', 'пятьсот', 'шестьсот',
        'семьсот', 'восемьсот', 'девятьсот');

    function MakeStr(C: Char; N: Integer): string;
    begin
      if N < 1 then Result := ''
      else begin
    {$IFNDEF WIN32}
				if N > 255 then N := 255;
    {$ENDIF WIN32}
        SetLength(Result, N);
        FillChar(Result[1], Length(Result), C);
      end;
    end;

    function AddChar(C: Char; const S: string; N: Integer): string;
    begin
      if Length(S) < N then
        Result := MakeStr(C, N - Length(S)) + S
      else Result := S;
    end;

    function KopToStr(Kop: integer): string;
    var
        sRet: string;
    begin
        sRet := '';
        sRet := AddChar('0', IntToStr(Kop), 2);
        case Kop of
            1, 21, 31, 41, 51, 61, 71, 81, 91: sRet := sRet + ' копейка';
            0, 5..20, 25..30, 35..40, 45..50, 55..60, 65..70, 75..80, 85..90, 95..99: sRet := sRet + ' копеек';
            2..4, 22..24, 32..34, 42..44, 52..54, 62..64, 72..74, 82..84, 92..94: sRet := sRet + ' копейки';
        end;
        KopToStr := sRet;
    end;

var
    ResStr, ST: string;
    Rub: integer;
		Kop: integer;
    Desed, Des: integer;
    Mil, Tys, Sot: integer;
begin
    ResStr := '';
    if Summa > 999999999.99 then
        exit;

    Rub := Trunc(Summa);
    Mil := Trunc(Rub / 1000000);
    Tys := Trunc(Rub / 1000) - Mil * 1000;
    Kop := round((Summa - Rub) * 100);

   // миллионы
    if Mil > 0 then begin
        Sot := trunc(Mil / 100);
        if Sot > 0 then
            ResStr := ResStr + SotStr[Sot] + ' ';
        Desed := Mil - 100 * Sot;
//        Des := 0; - убрал вылазит хинт Воронов О.А.
        while true do
            case DESED of
                0: begin
                        ResStr := ResStr + 'миллионов ';
                        Break;
                    end;
                1: begin
                        ResStr := ResStr + 'один миллион ';
                        Break;
                    end;
                2..4: begin
												ResStr := ResStr + ED2_4STR[DESED] + ' миллиона ';
                        Break;
                    end;
                5..19: begin
                        ResStr := ResStr + ED5_19STR[DESED] + ' миллионов ';
                        Break;
                    end;
            else begin
                    Des := Trunc(DESED / 10);
                    ResStr := ResStr + DESSTR[DES] + ' ';
                    DESED := DESED - 10 * DES;
                end;
            end;
    end;
   //тысячи
    if Tys > 0 then begin
        Rub := Rub - Tys * 1000 - Mil * 1000000;
        SOT := Trunc(Tys / 100);
        if SOT > 0 then
            ResStr := ResStr + SOTSTR[SOT] + ' ';
        DESED := TYS - 100 * SOT;
//        Des := 0; - убрал вылазит хинт Воронов О.А.
        while true do
            case DESED of
                0: begin
                        ResStr := ResStr + 'тысяч ';
                        Break;
                    end;
                1: begin
                        ResStr := ResStr + 'одна тысяча ';
                        Break;
										end;
                2..4: begin
                        ResStr := ResStr + TYSSTR[DESED] + ' тысячи ';
                        Break;
                    end;
                5..19: begin
                        ResStr := ResStr + ED5_19STR[DESED] + ' тысяч ';
                        Break;
                    end;
            else begin
                    Des := Trunc(DESED / 10);
                    ResStr := ResStr + DESSTR[DES] + ' ';
                    DESED := DESED - 10 * DES;
                end;
            end;
    end;
   //сотни
    SOT := Trunc(RUB / 100);
    if SOT > 0 then
        ResStr := ResStr + SOTSTR[SOT] + ' ';
    DESED := RUB - 100 * SOT;
//    Des := 0; - убрал вылазит хинт Воронов О.А.
    if Summa < 1 then
        ResStr := 'ноль';
    while true do
        case DESED of
            0: Break;
            1: begin
                    ResStr := ResStr + 'один';
                    Break;
                end;
						2..4: begin
                    ResStr := ResStr + ED2_4STR[DESED];
                    Break;
                end;
            5..19: begin
                    ResStr := ResStr + ED5_19STR[DESED];
                    Break;
                end;
        else begin
                Des := Trunc(DESED / 10);
                ResStr := ResStr + DESSTR[DES] + ' ';
                DESED := DESED - 10 * DES;
            end;
        end;
    case DESED of
        0, 5..19: ST := ' pублей ';
        1: ST := ' pубль ';
        2..4: ST := ' pубля ';
    end;
    if lRub then begin
        ResStr := ResStr + ST;
        ResStr := ResStr + KopToStr(Kop);
    end;
    ResStr := AnsiUpperCase(ResStr[1]) + copy(ResStr, 2, Length(ResStr) - 1);
    Result := ResStr;
end;

function TfrmGetPeriod.get_countstr(aNumber: Integer): string;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := Os;
    oq.DeclareVariable('Number', otInteger);
    oq.DeclareVariable('ResStr', otString);
    oq.SetVariable('Number', aNumber);
    oq.Sql.Text := 'begin SELECT ASU.get_countstr( :Number ) into :ResStr FROM DUAL; end;';
    try
      oq.Execute;
      Result := oq.GetVariable('ResStr');
    except
      Result := '';
    end;
  finally
    oq.Free;
  end;
// AS FС_KOL,
end;

procedure TfrmGetPeriod.frPrihDocUserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
var
	d : string;
  IntNumber : Integer;
begin
	if name = 'MYSTRTOFLOAT' then
	begin
		d := frParser.Calc(p1);
		val:=StringReplace(d,',', '.',[rfReplaceAll]);
	end;   
  if UpperCase(name) = 'GETZAKLKOM' then
  begin
//    Val := GetMemoText('', self,False, 'Введите заключение комиссии', True);
    Val := FZaklKom;
  end;
  if UpperCase(name) = 'GETSPISANO' then
  begin
//    Val := GetMemoText('', self,False, 'Введите описание списанных единиц', True);
    Val := FSpisano;
  end;
	if UpperCase(name) = 'MONEYSTR' then
	begin
    d := frParser.Calc(p1);
		val := MoneyToString(StrToFloat(d), TRUE);
  end;
	if name = 'GET_NAIM_KOL' then
	begin
    IntNumber := frParser.Calc(p1);
		val := StringReplace(get_countstr(IntNumber), 'один', 'одно', [rfReplaceAll]);
  end;
end;

function TfrmGetPeriod.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
Result := False;
  try
    // TODo Подумать насчет праметра  Command
		if Data = -1 then
			HtmlHelp(0, 'StMedsestra.chm', HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, 'StMedsestra.chm', HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;
end;

procedure TfrmGetPeriod.odsGroupMoAfterOpen(DataSet: TDataSet);
begin
  lcbMO_GROUP.KeyValue := StrToInt(IniReadString(FIniName,'Params', 'LastMOGroupID', '-1'));
  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.odsIstFinAfterOpen(DataSet: TDataSet);
var
  ChBox : TcxCheckComboBoxItem;
  StrList : TStrings;
  i : Integer;
  sID : string;
begin
//  lcbType.KeyValue := StrToInt(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastTypeID', '-1'));
  StrList := TStringList.Create;
  try
    StrList.Text := StringToListStr(IniReadString(FIniName,'Params', 'LastIstFin', '-1'));
    odsIstFin.First;  // записываем все типы медикаментов в чеклист
    ccbIstFin.Properties.Items.Clear;
    while not odsIstFin.Eof do
    begin
      ChBox := ccbIstFin.Properties.Items.Add;
      ChBox.Description := odsIstFin.FieldByName('FC_NAME').AsString;
      ChBox.Tag := odsIstFin.FieldByName('FK_ID').AsInteger; // в теге храним ID типа
      // проставляем галочку на текущем чекбоксе
      sID := IntToStr( ChBox.Tag );
      i := 0;
      while (i < StrList.Count)and(sID <> StrList.Strings[i]) do
        Inc( i );
      if (i < StrList.Count) then
        ccbIstFin.States[ ChBox.Index ] := cbsChecked
      else
        ccbIstFin.States[ ChBox.Index ] := cbsUnchecked;
      odsIstFin.Next;
    end;
    odsIstFin.First;
  finally
    StrList.Free;
  end;


  lcbCloseUp1(nil);
end;

procedure TfrmGetPeriod.odsUchGrAfterOpen(DataSet: TDataSet);
var
  ChBox : TcxCheckComboBoxItem;
  StrList : TStrings;
  i : Integer;
  sID : string;
begin
//  lcbType.KeyValue := StrToInt(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastTypeID', '-1'));
  StrList := TStringList.Create;
  try
    StrList.Text := StringToListStr(IniReadString(FIniName,'Params', 'LastUchGr', '-1'));
    odsUchGr.First;  // записываем все типы медикаментов в чеклист
    ccbUchGr.Properties.Items.Clear;
    while not odsUchGr.Eof do
    begin
      ChBox := ccbUchGr.Properties.Items.Add;
      ChBox.Description := odsUchGr.FieldByName('FC_UCHGR').AsString;
      ChBox.Tag := odsUchGr.FieldByName('UCHGRID').AsInteger; // в теге храним ID типа
      // проставляем галочку на текущем чекбоксе
      sID := IntToStr( ChBox.Tag );
      i := 0;
      while (i < StrList.Count)and(sID <> StrList.Strings[i]) do
        Inc( i );
      if (i < StrList.Count) then ccbUchGr.States[ ChBox.Index ] := cbsChecked else ccbUchGr.States[ ChBox.Index ] := cbsUnchecked;
      odsUchGr.Next;
    end;
    odsUchGr.First;
  finally
    StrList.Free;
  end;


  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  IDs,IDs1 : string;
  i : Integer;
begin
  IniWriteString(FIniName,'Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.KeyValue));

  IDs := '';
  for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
  begin
    if ccbUchGr.States[i] = cbsChecked then
      IDs := IDs + '|'+IntToStr(ccbUchGr.Properties.Items[i].Tag);
  end;
  Delete(IDs, 1, 1);
  IniWriteString(FIniName,'Params', 'LastUchGr', IDs);
  //  IniWriteString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastTypeID',    IntToStr(lcbType.KeyValue));

  IDs1 := '';
  for i := 0 to ccbIstFin.Properties.Items.Count - 1 do
  begin
    if ccbIstFin.States[i] = cbsChecked then
      IDs1 := IDs1 + '|'+IntToStr(ccbIstFin.Properties.Items[i].Tag);
  end;
  Delete(IDs1, 1, 1);
  IniWriteString(FIniName,'Params', 'LastIstFin', IDs1);

  Action := caFree;
end;

procedure TfrmGetPeriod.buUchGrClearClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
    ccbUchGr.States[i] := cbsUnChecked;
end;

procedure TfrmGetPeriod.buUchGrSelectAllClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
    ccbUchGr.States[i] := cbsChecked;
end;

procedure TfrmGetPeriod.ccbMedTypePropertiesEditValueChanged( Sender: TObject );
begin
  lcbCloseUp( nil );
end;

procedure TfrmGetPeriod.frPrihDocMouseOverObject(View: TfrxView;
  var Cursor: TCursor);
begin
//  if View.Name = 'meNameUchr' then
//    Cursor := crHandPoint;
end;

procedure TfrmGetPeriod.frPrihDocObjectClick(View: TfrxView);
begin
{  if View.Name = 'meNameUchr' then
  begin
    View.FrameTyp := 15;
    View.FrameColor := clRed;
//    vPos := frxReport1.Preview.Window.VScrollBar.Position;
//    frxReport1.Preview.Zoom := frxReport1.Preview.Zoom; //дабы перерисовался отчет
//    frxReport1.Preview.Window.VScrollBar.Position := vPos;
    frPrihDoc.Preview.Repaint;


    View.Memo.Text := InputBox('Введите наименование учереждения','', StringReplace(View.Memo.Text, #13#10, '',[rfReplaceAll]));

    View.FrameTyp := 2;
    View.FrameColor := clBlack;
//    vPos := frxReport1.Preview.Window.VScrollBar.Position;
//    frxReport1.Preview.Zoom := frxReport1.Preview.Zoom; //дабы перерисовался отчет
//    frxReport1.Preview.Window.VScrollBar.Position := vPos;
    frPrihDoc.Preview.Repaint;
  end;}  
end;

procedure TfrmGetPeriod.buSignEditClick(Sender: TObject);
begin
  DoShowCheckedListEdit( FDefValue, FSectionName, FIniName );
  LoadIniParams;
end;

procedure TfrmGetPeriod.LoadIniParams;
var
	ini: TIniFile;
begin
  ini := TIniFile.Create( FIniName );
  ccbSigns.Items.Text := StringToListStr( ini.ReadString(FSectionName, 'CheckedList', FDefValue) );
//  CheckListBox1.Items.Text := StringReplace( ini.ReadString(FSectionName, 'CheckedList', FDefValue), '|', #13#10, [rfReplaceAll] );
  ini.free;
end;

procedure TfrmGetPeriod.buSignSelectAllClick(Sender: TObject);
begin
  ccbSigns.SetCheckedAll();
end;

procedure TfrmGetPeriod.buSignClearClick(Sender: TObject);
begin
  ccbSigns.SetUnCheckedAll();
end;

procedure TfrmGetPeriod.ccbSignsChange(Sender: TObject);
begin
// добавляем фичу как у cxCheckComboBox - пишем слово Нет, когда ни один из вариантов не выбран
  if ccbSigns.CheckedCount = 0 then
    ccbSigns.Text := 'Нет'
  else // когда выбран какой-то вариант, нет удаляем сами - косяк джеди  
    ccbSigns.Text := StringReplace(ccbSigns.Text, 'Нет'+ccbSigns.Delimiter, '', [rfIgnoreCase]);
end;

procedure TfrmGetPeriod.cxButton1Click(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbIstFin.Properties.Items.Count - 1 do
    ccbIstFin.States[i] := cbsUnChecked;
end;

procedure TfrmGetPeriod.cxButton2Click(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbIstFin.Properties.Items.Count - 1 do
    ccbIstFin.States[i] := cbsChecked;
end;

function TfrmGetPeriod.READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
begin
  with oqPKG_SMINI do
  try
    ClearVariables;
    SetVariable('PSECTION', aFC_SECTION);
    SetVariable('PIDENT',   aFC_KEY);
    SetVariable('PDEFAULT', aFC_DEFAULT_VALUE);

    Execute;
    Result := GetVariable('PVALUE');
  except
    Result := aFC_DEFAULT_VALUE;
  end;

end;

end.


