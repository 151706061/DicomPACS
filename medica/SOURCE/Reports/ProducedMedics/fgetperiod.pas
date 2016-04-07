unit fgetperiod;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ActnList,  ImgList,
  ComCtrls, ToolWin, Db, OracleData, Oracle,
   //frxDSet,
   frxClass,
   fr_Class,
    frxDBSet,
  DBCtrls, frxDesgn, frOLEExl, frXMLExl, HtmlHlp, JvExMask, JvToolEdit, OracleMonitor,
  fdmPrintSelect, frxExportXLS, frxExportXML;

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
    os: TOracleSession;
    Panel3: TPanel;
    Label3: TLabel;
    frxDesigner1: TfrxDesigner;
    frxXMLExport1: TfrxXMLExport;
    frxXLSExport1: TfrxXLSExport;
    frKart: TfrxReport;
    ods: TOracleDataSet;
    odsM: TStringField;
    odsGroupMo: TOracleDataSet;
    odsGroupMoGROUPID: TFloatField;
    odsGroupMoFC_GROUP: TStringField;
    odsGroupMoFL_DEL: TFloatField;
    dsGroupMo: TDataSource;
    lcbMO_GROUP: TDBLookupComboBox;
    odsProducedMedics: TOracleDataSet;
    frDBProducedMedics: TfrxDBDataset;
    odsChild: TOracleDataSet;
    frxDBDataset1: TfrxDBDataset;
    procedure rbAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure ToolBar1DblClick(Sender: TObject);
    procedure lcbCloseUp(Sender: TObject);
    procedure frPrihDocGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frKartGetValue(const ParName: String; var ParValue: Variant);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function frKartUserFunction(const MethodName: string;
      var Params: Variant): Variant;

  PRIVATE
    { Private declarations }
    FProduceType : integer;
  PUBLIC
    { Public declarations }
    sDB_NAME : string;
    function GetPayTypes: String;
  end;

  procedure UploadToExcel(AMaster, AChild: TOracleDataSet);

var
  frmGetPeriod      : TfrmGetPeriod;

implementation

uses fFIOTreb, IniFiles, Math, ComObj, Excel2000, SMMainAPI;
{$R *.DFM}

var
  sJobTitleCompiler : String;
  sFamCompiler      : String;
  sJobTitleChecker  : String;
  sFamChecker       : String;

//==============================================================================
// Возвращает имя файла (в нашем случае дллки)
function ParamStr_0: string;
var
	TheFileName : array[0..MAX_PATH] of Char;
begin
	FillChar(TheFileName, sizeof(TheFileName), #0);
	GetModuleFileName(hInstance, TheFileName, sizeof(TheFileName));
	Result := TheFileName;
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
//==============================================================================
function TfrmGetPeriod.GetPayTypes: String;
var odsPayType : TOracleDataSet;
begin
  odsPayType := TOracleDataset.Create(nil);
  try
    odsPayType.Session := os;
    odsPayType.Sql.Text := 'SELECT * FROM TPAYTYPE P ORDER BY P.FC_NAME';
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
    odsDB: TOracleDataSet;
begin
  try
//    os.LogOn;
    GetSession(os, 'ASU');
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;

  odsDB := TOracleDataSet.Create(Self);
  odsDB.Session := os;
  odsDB.SQL.Text := 'select ASU.PKG_SMINI.READSTRING(''CONFIG'',''DB_NAME'','''') FC_DB_NAME from dual';
  odsDB.Open;
  sDB_NAME := odsDB.FieldByName('FC_DB_NAME').AsString;
  odsDB.Close;
  odsDB.Free;
  
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
  odsGroupMo.Open;
  Self.Caption := Application.Title;
  if ParamCount > 0 then // для ввода параметров через другие приложения Воронов О.А. 18.09.2007
  begin                  // каждый параметр лучше всего передавать в двойных кавычках
    try
//      Application.MessageBox(CmdLine,'' );
      dDate1.Date := StrToDate( ParamStr( 1 ) );
      dDate2.Date := StrToDate( ParamStr( 2 ) );
      lcbMO_GROUP.KeyValue := StrToInt( ParamStr( 3 ) );
      dmPrintSelect.PrintFlag := StrToInt( ParamStr( 4 ) );  // теперь сюда передается сразу номер печати отчета (FR = 2, Excel = 1)
      if TryStrToInt( ParamStr( 5 ), FProduceType) = False then FProduceType := 0;

      if FProduceType = 0 then
        odsProducedMedics.SetVariable('FK_PRODUCE_TYPE', '')
      else
        odsProducedMedics.SetVariable('FK_PRODUCE_TYPE', 'AND KS.FK_PRODUCE_TYPE='+IntToStr(FProduceType));

//      lcbCloseUp(nil);
//      acApply.Execute;
      acApplyExecute(nil);
//      Application.MessageBox('Application.Terminate;','',MB_OK);
      Application.Terminate; // обязательно прерывать работу приложения, поскольку главная форма останется висеть невидимой
    except

    end;
  end; // if ParamCount > 0 then
end;

procedure TfrmGetPeriod.acApplyExecute(Sender: TObject);
//var frmFIOTreb: TfrmFIOTreb;
var
  P : TPoint;
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

  if dmPrintSelect.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := ToolButton1.Height;
    P := ToolButton1.ClientToScreen(P);

    if ParamCount > 3 then
    begin
      try
        P.X := StrToInt(ParamStr(4));
        P.Y := StrToInt(ParamStr(5));
      except
        dmPrintSelect.PrintFlag := 2; // если передали фигню, считаем что надо печатать в фаст репорте
      end;
    end;

    if dmPrintSelect.PrintFlag = 0 then
      dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати

  if dmPrintSelect.PrintFlag = 0 then Exit;
  try
// разобраться что оставлять - эти 2 датасаета
//    with odsKARTCOMPOS do begin
//      SetVariable('Date1', dDate1.date);
//      SetVariable('Date2', dDate2.date);
//      SetVariable('MOGROUP_ID', lcbMO_GROUP.KeyValue);
//      Close;
//      Open;
//    end;
//
//    with odsIngridients do begin
//      SetVariable('MOGROUP_ID', lcbMO_GROUP.KeyValue);
//      Close;
//      Open;
//    end;
// разобраться что оставлять - или этот

//    if FileExists('frLFJ.frf') then
//    begin
//      frKart.LoadFromFile('frLFJ.frf');
//    end;

    with odsProducedMedics do begin
      SetVariable('Date1', dDate1.date);
      SetVariable('Date2', dDate2.date);
//      SetVariable('MOGROUP_ID', lcbMO_GROUP.KeyValue);
      Close;
      Open;
    end;

    if odsProducedMedics.RecordCount > 0 then
    begin
      Self.Hide;
//      frKart.PrepareReport;
      case dmPrintSelect.PrintFlag of // флаг куда печатать
//        1: ExportFRToExcel( frKart, 'Журнал лабораторно-фасовочных работ за период с '+DateToStr(dDate1.date)+' по '+DateToStr(dDate2.date)+'.xls' );
//        1: UploadToExcel(odsKARTCOMPOS, odsIngridients);
        1: UploadToExcel(odsProducedMedics, odsChild);
        2: frKart.ShowReport;
      end;
    end
    else
      Application.MessageBox('В заданном периоде не было производственных операций','Информация', MB_OK+MB_ICONINFORMATION);
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
	frKart.DesignReport;
end;

procedure TfrmGetPeriod.lcbCloseUp(Sender: TObject);
begin
	acApply.Enabled := (lcbMO_GROUP.Text <> '');
end;

procedure TfrmGetPeriod.frPrihDocGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName = 'Date1' then ParValue := DateTimeToStr(dDate1.Date)
  else if ParName = 'Date2' then ParValue := DateTimeToStr(dDate2.Date)
  //заполнение переменных о составителе и о проверяющем
  else if ParName = 'JobTitleCompiler' then ParValue := sJobTitleCompiler
  else if ParName = 'FamCompiler' then ParValue := sFamCompiler
  else if ParName = 'JobTitleChecker' then ParValue := sJobTitleChecker
  else if ParName = 'FamChecker' then ParValue := sFamChecker
  else if ParName = 'var_paytypes' then
  begin
    ParValue := GetPayTypes;
  end
  else if ParName = 'var_receiver' then
  begin
    with TOracleQuery.Create(nil) do
    try
      Session := Os;
      Sql.Text := 'SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''MANAGER_DOC'' AND FC_KEY = ''CLIENT_NAME''';
      try
        Execute;
        ParValue := Field(0);
      except
        ParValue := '';
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmGetPeriod.frKartGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName = 'Date1' then ParValue := DateTimeToStr(dDate1.Date)
  else if ParName = 'Date2' then ParValue := DateTimeToStr(dDate2.Date);
end;

function TfrmGetPeriod.frKartUserFunction(const MethodName: string;
  var Params: Variant): Variant;
var
	d : string;
begin
  if UpperCase(MethodName) = 'MYSTRTOFLOAT' then
	begin
		d := frParser.Calc(Params[0]);
		Result:=StringReplace(d,',', '.',[rfReplaceAll]);
	end;

end;

function TfrmGetPeriod.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
Result := False;
  try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, PChar('StMedsestra.chm'), HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, PChar('StMedsestra.chm'), HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;
end;

procedure TfrmGetPeriod.odsGroupMoAfterOpen(DataSet: TDataSet);
begin
  lcbMO_GROUP.KeyValue := StrToInt(IniReadString(Application.ExeName+'.ini','Params', 'LastMOGroupID', '-1'));
  lcbCloseUp(nil);  
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IniWriteString(Application.ExeName+'.ini','Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.KeyValue));
  Action := caFree;
end;

procedure UploadToExcel(AMaster, AChild: TOracleDataSet);

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

 function GetSum(A1, A2, A3, A4: String): String;
 begin
  if A1='' then A1:=' ';
  if A2='' then A2:=' ';
  if A3='' then A3:=' ';
  if A4='' then A4:=' ';

  if frmGetPeriod.sDB_NAME = 'T' then
  begin
    Result:=
     '<tr class=xl357334 height=16 style=''height:12.0pt''>' +
     ' <td height=16 class=xl317334 style=''height:12.0pt''></td>' +
     ' <td class=xl327334 style=''border-top:none;width:25pt''>&nbsp;</td>' +
     ' <td class=xl327334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl327334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl327334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl327334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl337334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl337334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl337334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl347334 style=''border-top:none;border-left:none ''>'+A1+'</td>' + #13#10 +

      '   <td style=''border-right:none;  border-left:.5pt solid black; border-top:none; border-bottom:none''>'+
      '   <td style=''border-right:.5pt solid black;  border-left:none; border-top:none; border-bottom:none''>'+

     ' <td class=xl327334 style=''border-top:none;width:25pt''>&nbsp;</td>' + #13#10 +
     ' <td class=xl327334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl327334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl337334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl337334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl337334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl347334 style=''border-top:none;border-left:none ''>'+A2+'</td>' + #13#10 +
     ' <td class=xl347334 style=''border-top:none;border-left:none ''>'+A3+'</td>' + #13#10 +
     ' <td class=xl347334 style=''border-top:none;border-left:none ''>'+A4+'</td>' + #13#10 +

     ' <td class=xl347334 style=''border-top:none;border-left:none ''> </td>' + #13#10 +
     ' <td class=xl347334 style=''border-top:none;border-left:none ''> </td>' + #13#10 +
     ' <td class=xl347334 style=''border-top:none;border-left:none ''> </td>' + #13#10 +
     //   ' <td class=xl357334 width=64 style=''width:48pt''></td>' +
     '</tr>';
  end
  else
  begin
    Result:=
     '<tr class=xl357334 height=16 style=''height:12.0pt''>' +
     ' <td height=16 class=xl317334 style=''height:12.0pt''></td>' +
     ' <td class=xl327334 style=''border-top:none;width:25pt''>&nbsp;</td>' +
     ' <td class=xl327334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl327334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl327334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl337334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl337334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl347334 style=''border-top:none;border-left:none ''>'+A1+'</td>' + #13#10 +
     ' <td class=xl337334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +

      '   <td style=''border-right:none;  border-left:.5pt solid black; border-top:none; border-bottom:none''>'+
      '   <td style=''border-right:.5pt solid black;  border-left:none; border-top:none; border-bottom:none''>'+

     ' <td class=xl327334 style=''border-top:none;width:25pt''>&nbsp;</td>' + #13#10 +
     ' <td class=xl327334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl327334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl337334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +
     ' <td class=xl347334 style=''border-top:none;border-left:none ''>'+A2+'</td>' + #13#10 +
     ' <td class=xl347334 style=''border-top:none;border-left:none ''>'+A3+'</td>' + #13#10 +
     ' <td class=xl347334 style=''border-top:none;border-left:none ''>'+A4+'</td>' + #13#10 +
     ' <td class=xl337334 style=''border-top:none;border-left:none ''>&nbsp;</td>' + #13#10 +

     ' <td class=xl347334 style=''border-top:none;border-left:none ''> </td>' + #13#10 +
     ' <td class=xl347334 style=''border-top:none;border-left:none ''> </td>' + #13#10 +
     ' <td class=xl347334 style=''border-top:none;border-left:none ''> </td>' + #13#10 +
     //   ' <td class=xl357334 width=64 style=''width:48pt''></td>' +
     '</tr>';
  end;
 end;

 function TrimRigthZeros(aFloatStr : string) : string;
 var
   iPos, k : Integer;
 begin
   iPos := Pos(',', aFloatStr);
   if iPos = 0 then iPos := Pos('.', aFloatStr);
   if iPos > 0 then
   begin
     k := Length(aFloatStr);
     while (k >= iPos) and (aFloatStr[k] = '0') do
       Dec(k);
     if (k = iPos) then
      Result := Copy(aFloatStr, 1, k-1);
     if (k > iPos) then
      Result := Copy(aFloatStr, 1, k);
   end
   else
     Result := aFloatStr;
 end;

var
 S: String;
 nCount, ChildRowNum, FK_ID_MASTER: Integer;
 sFileName1, sFileName2: String;
 Excel: Variant;
 nS1, nS2, nS3, nS4: Double;
 nI1, nI2, nI3, nI4, nI5: Double;
begin
 Screen.Cursor:=crHourGlass;

 S:='';
 nS1:=0; nS2:=0; nS3:=0; nS4:=0;
 nI1:=0; nI2:=0; nI3:=0; nI4:=0; nI5:=0;
 nCount:=0;

// with AMaster do begin
  if not AMaster.Active then AMaster.Open;
  AMaster.First;
  while not AMaster.Eof do begin
   if S<>'' then begin
//    S:=S+#13#10+GetSum(CurrToStrF(nS1, ffNumber, 2), CurrToStrF(nS2, ffNumber, 2), CurrToStrF(nS3, ffNumber, 2), CurrToStrF(nS4, ffNumber, 2));
    Inc(nCount);
    nS1:=0; nS2:=0; nS3:=0; nS4:=0;
   end;

// Added by Voronov 03.03.2008 17:14:59
   nI1:=nI1+AMaster.FieldByName('fn_summa_for_ingridients').AsFloat;
   nI2:=nI2+AMaster.FieldByName('fn_summa').AsFloat;
//   nI3:=RecordCount;
   nI4:=nI4+AMaster.FieldByName('fn_nachenka').AsFloat;
   nI5:=nI5+AMaster.FieldByName('fn_uchenka').AsFloat;

   nS2:=nS2+AMaster.FieldByName('fn_summa').AsFloat;
   nS3:=nS3+AMaster.FieldByName('fn_nachenka').AsFloat;
   nS4:=nS4+AMaster.FieldByName('fn_uchenka').AsFloat;
   FK_ID_MASTER := AMaster.FieldByName('fk_id_master').AsInteger;
   ChildRowNum := 1;
   if AChild.Active then AChild.Close;
   AChild.SetVariable('FK_ID_MASTER', AMaster.FieldByName('fk_id_master').AsInteger);
   AChild.Open; AChild.First;
//   while not AChild.Eof do begin
   while (not AMaster.Eof)and(ChildRowNum <= AChild.RecordCount)and(AMaster.FieldByName('fk_id_master').AsInteger = FK_ID_MASTER) do begin
    S:=S+#13#10+
    '<tr class=xl317334 height=29 style=''height:21.75pt''>'+
    ' <td height=29 class=xl317334 width=0 style=''height:21.75pt''> </td>';

//    if AChild.RecNo=1 then
    if frmGetPeriod.sDB_NAME = 'T' then
    begin
      if ChildRowNum = 1 then
      S:=S+
      ' <td class=xl237334 rowspan='+IntToStr(AChild.RecordCount)+' width=33 style=''width:25pt''>'+AMaster.FieldByName('FN_NUMBER').AsString+'</td>' +
      ' <td class=xl247334 rowspan='+IntToStr(AChild.RecordCount)+' width=69 style=''border-left:none;width:52pt''>'+AMaster.FieldByName('fd_data').AsString+'</td>';

      S:=S+
      ' <td class=xl237334 style=''border-left:none''>'+{AChild.}AMaster.FieldByName('fc_serial_2').AsString+' </td>' +
      ' <td class=xl257334 style=''border-left:none''>'+{AChild.}AMaster.FieldByName('tkart_name_2').AsString+'</td>' +
      ' <td class=xl257334 style=''border-left:none''>'+{AChild.}AMaster.FieldByName('FK_MEDICID_2').AsString+'</td>' +
      ' <td class=xl267334 style=''border-left:none''>'+{AChild.}AMaster.FieldByName('fc_uedizm_2').AsString+'</td>' +
      ' <td class=xl277334 style=''border-left:none''>'+{AChild.}TrimRigthZeros(FloatToStrF(AMaster.FieldByName('fn_amount_2').AsFloat,ffNumber, 15, 10))+'</td>' +
      ' <td class=xl277334 style=''border-left:none''>'+{AChild.}FloatToStr(RoundTo(AMaster.FieldByName('fn_price_2').AsFloat,-2))+'</td>' +
      ' <td class=xl277334 style=''border-left:none''>'+{AChild.}FloatToStr(RoundTo(AMaster.FieldByName('fn_summa_2').AsFloat,-2))+'</td>' +
      '   <td style=''border-right:none;  border-left:.5pt solid black; border-top:none; border-bottom:none''>'+
      '   <td style=''border-right:.5pt solid black;  border-left:none; border-top:none; border-bottom:none''>';
  ;

  //    if AChild.RecNo=1 then
      if ChildRowNum = 1 then
      S:=S+
      ' <td class=xl237334 rowspan='+IntToStr(AChild.RecordCount)+' style=''width:25pt''>'+AMaster.FieldByName('FN_NUMBER').AsString+'</td>' +
      ' <td class=xl287334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''>'+AMaster.FieldByName('fc_name').AsString+'</td>' +
      ' <td class=xl287334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''>'+AMaster.FieldByName('FK_MEDICID').AsString+'</td>' +
      ' <td class=xl297334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''>'+AMaster.FieldByName('fc_uedizm').AsString+'</td>' +
      ' <td class=xl307334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''>'+AMaster.FieldByName('fn_amount').AsString+'</td>' +
      ' <td class=xl307334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''>'+AMaster.FieldByName('fn_price_for_1').AsString+'</td>' +
      ' <td class=xl307334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''>'+FloatToStr(RoundTo(AMaster.FieldByName('fn_summa').AsFloat,-2))+'</td>' +
      ' <td class=xl307334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''>'+AMaster.FieldByName('fn_nachenka').AsString+'</td>' +
      ' <td class=xl307334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''>'+AMaster.FieldByName('fn_uchenka').AsString+'</td>'+

      ' <td class=xl307334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''> </td>' +
      ' <td class=xl307334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''> </td>' +
      ' <td class=xl307334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''> </td>';
      S:=S+
      ' <td class=xl317334 width=64 style=''width:48pt''></td>' + #13#10 +
      '</tr>';
    end
    else
    begin
      if ChildRowNum = 1 then
      S:=S+
      ' <td class=xl237334 rowspan='+IntToStr(AChild.RecordCount)+' width=33 style=''width:25pt''>'+AMaster.FieldByName('FN_NUMBER').AsString+'</td>' +
      ' <td class=xl247334 rowspan='+IntToStr(AChild.RecordCount)+' width=69 style=''border-left:none;width:52pt''>'+AMaster.FieldByName('fd_data').AsString+'</td>';

      S:=S+
      ' <td class=xl237334 style=''border-left:none''>'+{AChild.}AMaster.FieldByName('fc_serial_2').AsString+' </td>' +
      ' <td class=xl257334 style=''border-left:none''>'+{AChild.}AMaster.FieldByName('tkart_name_2').AsString+'</td>' +  
      ' <td class=xl267334 style=''border-left:none''>'+{AChild.}AMaster.FieldByName('fc_uedizm_2').AsString+'</td>' +
      ' <td class=xl277334 style=''border-left:none''>'+{AChild.}TrimRigthZeros(FloatToStrF(AMaster.FieldByName('fn_amount_2').AsFloat,ffNumber, 15, 10))+'</td>' +
      ' <td class=xl277334 style=''border-left:none''>'+{AChild.}FloatToStr(RoundTo(AMaster.FieldByName('fn_price_2').AsFloat,-2))+'</td>' +
      ' <td class=xl277334 style=''border-left:none''>'+{AChild.}AMaster.FieldByName('fn_summa_2').AsString+'</td>' +
      '   <td style=''border-right:none;  border-left:.5pt solid black; border-top:none; border-bottom:none''>'+
      '   <td style=''border-right:.5pt solid black;  border-left:none; border-top:none; border-bottom:none''>';
  ;

  //    if AChild.RecNo=1 then
      if ChildRowNum = 1 then
      S:=S+
      ' <td class=xl237334 rowspan='+IntToStr(AChild.RecordCount)+' style=''width:25pt''>'+AMaster.FieldByName('FN_NUMBER').AsString+'</td>' +
      ' <td class=xl287334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''>'+AMaster.FieldByName('fc_name').AsString+'</td>' +
      ' <td class=xl297334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''>'+AMaster.FieldByName('fc_uedizm').AsString+'</td>' +
      ' <td class=xl307334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''>'+AMaster.FieldByName('fn_amount').AsString+'</td>' +
      ' <td class=xl307334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''>'+AMaster.FieldByName('fn_price_for_1').AsString+'</td>' +
      ' <td class=xl307334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''>'+AMaster.FieldByName('fn_summa').AsString+'</td>' +
      ' <td class=xl307334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''>'+AMaster.FieldByName('fn_nachenka').AsString+'</td>' +
      ' <td class=xl307334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''>'+AMaster.FieldByName('fn_uchenka').AsString+'</td>'+

      ' <td class=xl307334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''> </td>' +
      ' <td class=xl307334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''> </td>' +
      ' <td class=xl307334 rowspan='+IntToStr(AChild.RecordCount)+' style=''border-top:none;border-left:none''> </td>';
      S:=S+
      ' <td class=xl317334 width=64 style=''width:48pt''></td>' + #13#10 +
      '</tr>';
    end;
    Inc(nCount);

//    nS1:=nS1+AChild.FieldByName('fn_summa').AsCurrency;
   nS1:=nS1+{AChild.}AMaster.FieldByName('fn_summa_2').AsFloat;
//    AChild.Next;
    Inc(ChildRowNum);
    AMaster.Next;
   end;
   AChild.Close;
   nI3 := nI3 + 1;
   if S<>'' then
    S:=S+#13#10+GetSum(CurrToStrF(nS1, ffNumber, 2), CurrToStrF(nS2, ffNumber, 2), CurrToStrF(nS3, ffNumber, 2), CurrToStrF(nS4, ffNumber, 2));
//   nI1:=nI1+FieldByName('fn_summa_for_ingridients').AsCurrency;
//   nI2:=nI2+FieldByName('fn_summa').AsCurrency;
//   nI3:=RecordCount;
//   nI4:=nI4+FieldByName('fn_nachenka').AsCurrency;
//   nI5:=nI5+FieldByName('fn_uchenka').AsCurrency;
//
//   nS2:=nS2+FieldByName('fn_summa').AsCurrency;
//   nS3:=nS3+FieldByName('fn_nachenka').AsCurrency;
//   nS4:=nS4+FieldByName('fn_uchenka').AsCurrency;
//   Next;
  end;
  AMaster.Close;
// end;

 if FileExists(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'LFJ_shablon.htm') then
 begin
   CopyFile(PAnsiChar(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'LFJ_shablon.htm'), PAnsiChar(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'done.htm'), false);
   sFileName2:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'done.htm';
 end
 else
 begin
   sFileName1:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'shablon.htm';
   sFileName2:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'done.htm';
   SaveResToFile('shablon', 'HTML', sFileName2);
 end;

 with TStringList.Create do begin
  LoadFromFile(sFileName2);
  Text:=StringReplace(Text, '::REPLACEHERE::', S, [rfIgnoreCase]);
  {Text:=StringReplace(Text, '::IT1::', CurrToStrF(nI1, ffNumber, 2), [rfIgnoreCase]);
  Text:=StringReplace(Text, '::IT2::', CurrToStrF(nI2, ffNumber, 2), [rfIgnoreCase]);
  Text:=StringReplace(Text, '::IT3::', IntToStr(Trunc(nI3)), [rfIgnoreCase]);
  Text:=StringReplace(Text, '::IT4::', CurrToStrF(nI4, ffNumber, 2), [rfIgnoreCase]);
  Text:=StringReplace(Text, '::IT5::', CurrToStrF(nI5, ffNumber, 2), [rfIgnoreCase]);}
  Text:=StringReplace(Text, '::IT1::', FloatToStr(RoundTo(nI1,-2)), [rfIgnoreCase]);
  Text:=StringReplace(Text, '::IT2::', FloatToStr(RoundTo(nI2,-2)), [rfIgnoreCase]);
  Text:=StringReplace(Text, '::IT3::', IntToStr(Trunc(nI3)), [rfIgnoreCase]);
  Text:=StringReplace(Text, '::IT4::', FloatToStr(RoundTo(nI4,-2)), [rfIgnoreCase]);
  Text:=StringReplace(Text, '::IT5::', FloatToStr(RoundTo(nI5,-2)), [rfIgnoreCase]);
  SaveToFile(sFileName2);
  Free;
 end;

 Excel:=CreateOleObject('Excel.Application');
 Excel.Workbooks.Open(sFileName2);
 Excel.Rows['3:'+IntToStr(nCount)].EntireRow.AutoFit;
 Excel.ActiveSheet.PageSetup.PrintTitleRows:='$2:$2';
 Excel.ActiveSheet.PageSetup.LeftMargin := 27;
 Excel.ActiveSheet.PageSetup.RightMargin := 27;
 Excel.ActiveSheet.PageSetup.TopMargin := 27;
 Excel.ActiveSheet.PageSetup.BottomMargin := 27;
 Excel.ActiveSheet.PageSetup.Orientation := xlLandScape;
 Excel.ActiveSheet.PageSetup.Order := xlOverThenDown;
 // выставляем ширину столбцов вручную - через html не получается
 if frmGetPeriod.sDB_NAME = 'T' then
 begin
   Excel.ActiveSheet.Columns['D:D'].ColumnWidth := 10.57;
   Excel.ActiveSheet.Columns['E:E'].ColumnWidth := 58.57;
   Excel.ActiveSheet.Columns['F:F'].ColumnWidth := 8.86;
   Excel.ActiveSheet.Columns['G:G'].ColumnWidth := 8.86;

   Excel.ActiveSheet.Columns['N:N'].ColumnWidth := 25.57;
   Excel.ActiveSheet.Columns['O:O'].ColumnWidth := 8.86;

   Excel.ActiveSheet.Columns['S:S'].ColumnWidth := 7.14;
   Excel.ActiveSheet.Columns['T:T'].ColumnWidth := 6.43;
   Excel.ActiveSheet.Columns['U:U'].ColumnWidth := 6.43;

   Excel.ActiveSheet.Columns['V:V'].ColumnWidth := 14.57;
   Excel.ActiveSheet.Columns['W:W'].ColumnWidth := 14.57;
   Excel.ActiveSheet.Columns['X:X'].ColumnWidth := 14.57;
 end
 else
 begin
   Excel.ActiveSheet.Columns['D:D'].ColumnWidth := 14.43;
   Excel.ActiveSheet.Columns['E:E'].ColumnWidth := 67.43;
   Excel.ActiveSheet.Columns['F:F'].ColumnWidth := 8.86;

   Excel.ActiveSheet.Columns['O:O'].ColumnWidth := 7.14;
   Excel.ActiveSheet.Columns['R:R'].ColumnWidth := 6.43;
   Excel.ActiveSheet.Columns['S:S'].ColumnWidth := 6.43;

   Excel.ActiveSheet.Columns['T:T'].ColumnWidth := 15.71;
   Excel.ActiveSheet.Columns['U:U'].ColumnWidth := 15.71;
   Excel.ActiveSheet.Columns['V:V'].ColumnWidth := 15.71;
 end;

 Excel.Visible:=True;

 Screen.Cursor:=crDefault;
end;

end.

