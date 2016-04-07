
unit fgetperiod;

interface

uses Windows, frxDBSet, Db, frxClass, fr_Class, frOLEExl, frXMLExl, frxDesgn, OracleData, Oracle, Classes,
  ActnList, ImgList, Controls, DBCtrls, ComCtrls, ToolWin, StdCtrls,
  ExtCtrls, Forms, HtmlHlp, JvExMask, JvToolEdit, Mask, OracleMonitor,
  cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxSkinsCore,
  dxSkinsDefaultPainters, Menus, cxLookAndFeelPainters, cxButtons,
  cxCheckComboBox, fdmPrintSelect, Dialogs, JvBaseDlg, JvProgressDialog, cxProgressBar;

type
  TfrmGetPeriod = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ilImages: TImageList;
    alActions: TActionList;
    aSave: TAction;
    aCancel: TAction;
    os: TOracleSession;
    odsRep1: TOracleDataSet;
    Panel3: TPanel;
    odsMedic: TOracleDataSet;
    dsMedic: TDataSource;
    acExcelExport: TAction;
    frOdsRep1: TfrxDBDataset;
    Panel1: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
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
    Panel4: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    dDate1: TJvDateEdit;
    dDate2: TJvDateEdit;
    Panel2: TPanel;
    Label1: TLabel;
    lcbMO_GROUP: TDBLookupComboBox;
    odsGroupMo: TOracleDataSet;
    dsGroupMo: TDataSource;
    ods: TOracleDataSet;
    lcbMedic: TcxLookupComboBox;
    frRep: TfrxReport;
    oqInitMO: TOracleQuery;
    rbuMedic: TRadioButton;
    rbuUchGr: TRadioButton;
    ccbMedType: TcxCheckComboBox;
    buTypeClear: TcxButton;
    buTypeSelectAll: TcxButton;
    odsUchGr: TOracleDataSet;
    oqPKG_SMINI: TOracleQuery;
    rbuSomeMedics: TRadioButton;
    ccbSomeMedic: TcxCheckComboBox;
    buSomeMedicClear: TcxButton;
    buSomeMedicSelectAll: TcxButton;
    frodsGroupMo: TfrxDBDataset;
    cxProgressBar1: TcxProgressBar;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure ToolBar1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frRepUserFunction(const Name: String; p1, p2, p3: Variant;
      var Val: Variant);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure odsMedicAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbAllClick(Sender: TObject);
    procedure lcbCloseUp(Sender: TObject);
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure frRepGetValue(const ParName: String; var ParValue: Variant);
    procedure rbuMedicClick(Sender: TObject);
    procedure rbuUchGrClick(Sender: TObject);
    procedure odsUchGrAfterOpen(DataSet: TDataSet);
    procedure buTypeClearClick(Sender: TObject);
    procedure buTypeSelectAllClick(Sender: TObject);
    procedure buSomeMedicClearClick(Sender: TObject);
    procedure buSomeMedicSelectAllClick(Sender: TObject);
    procedure rbuSomeMedicsClick(Sender: TObject);
    procedure ccbSomeMedicPropertiesCloseUp(Sender: TObject);

  private
    { Private declarations }
    FLang: array[0..KL_NAMELENGTH] of char; //Раскладка клавиатуры

    function READSTRING_TSMINI(aFC_SECTION, aFC_KEY,
      aFC_DEFAULT_VALUE: string): string;
    function WRITESTRING_TSMINI(aFC_SECTION, aFC_KEY,
      aFC_VALUE: string): string;

  PUBLIC
    iniFileName : string;
    odinraz: boolean;
    { Public declarations }
  end;




var
  frmGetPeriod      : TfrmGetPeriod;

implementation

uses Sysutils, Variants, IniFiles, ComObj, uGlobalConst,
     SMMainAPI, fCheckedListEdit;

{$R *.DFM}
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

function TfrmGetPeriod.READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
begin
  oqPKG_SMINI.ClearVariables;
  oqPKG_SMINI.SetVariable('PSECTION', aFC_SECTION);
  oqPKG_SMINI.SetVariable('PIDENT',   aFC_KEY);
  oqPKG_SMINI.SetVariable('PDEFAULT', aFC_DEFAULT_VALUE);

  oqPKG_SMINI.Execute;
  Result := oqPKG_SMINI.GetVariable('PVALUE');
end;

function TfrmGetPeriod.WRITESTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_VALUE: string): string;
begin
  oqPKG_SMINI.ClearVariables;
  oqPKG_SMINI.SetVariable('PSECTION', aFC_SECTION);
  oqPKG_SMINI.SetVariable('PIDENT',   aFC_KEY);
  oqPKG_SMINI.SetVariable('PVALUE',   aFC_VALUE);

  oqPKG_SMINI.Execute;
end;

//==============================================================================
procedure TfrmGetPeriod.aSaveExecute(Sender: TObject);
var
  P : TPoint;
  IDn, i : integer;
  IDs : string;
begin
  lcbMedic.PostEditValue;
  lcbMO_GROUP.CloseUp(True);
  try
  StrToDate( dDate1.Text );
  except
    on EConvertError do begin
      Application.MessageBox('Неверно введена начальная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate1.SetFocus;
      Exit;
    end;
  end;
  try
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

  if rbuSomeMedics.Checked and (ccbSomeMedic.Text = ccbSomeMedic.Properties.EmptySelectionText) then begin
    Application.MessageBox('Не выбран ни один медикамент', 'Ошибка', MB_OK + MB_ICONERROR);
    Self.ccbSomeMedic.SetFocus;
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
    dDate1.Date := trunc(dDate1.Date);
    dDate2.Date := trunc(dDate2.Date);

    if FileExists('frSpisMedicOnPac.fr3') then     // если найден файл
      frRep.LoadFromFile('frSpisMedicOnPac.fr3');  // загружаем его

    if rbuMedic.Checked then // по одному медикаменту
    begin
      odsRep1.SetVariable('MEDICID',lcbMedic.EditValue);
    end
    else if rbuSomeMedics.Checked then // по нескольким медикаментам
    begin
      // проверка на выбор медикаментов
      IDn := 0;
      for i := 0 to ccbSomeMedic.Properties.Items.Count - 1 do
      begin
        if ccbSomeMedic.States[i] = cbsChecked then
        begin
          Inc(IDn);
          IDs := IDs + ', '+IntToStr(ccbSomeMedic.Properties.Items[i].Tag);
        end;
      end;
      Delete(IDs, 1, 2); // удаляем первую запятую и пробел - они лишние

      odsRep1.SetVariable('MEDICID',IDs);
    end;

    odsRep1.SetVariable('DATE1',dDate1.Date);
    odsRep1.SetVariable('DATE2',dDate2.Date);
    odsRep1.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
    odsRep1.Open;

    Self.Hide;
    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1: begin
          frRep.FindObject('PageFooter1').Visible := FAlse;
          dmPrintSelect.frxXLSExport1.PageBreaks:=false;
          frRep.PrepareReport;
          ExportFRToExcel(frRep, 'МАТЕРИАЛЬНЫЙ ОТЧЁТ '+' c '+dDate1.Text+ ' по '+dDate2.Text+'.xls' );
         end;
      2: frRep.ShowReport;
    end;    
  finally
    dmPrintSelect.PrintFlag := 0;
    Close;    
  end;

end;

procedure TfrmGetPeriod.buSomeMedicClearClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbSomeMedic.Properties.Items.Count - 1 do
    ccbSomeMedic.States[i] := cbsUnChecked;
end;

procedure TfrmGetPeriod.buSomeMedicSelectAllClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbSomeMedic.Properties.Items.Count - 1 do
    ccbSomeMedic.States[i] := cbsChecked;
end;

procedure TfrmGetPeriod.buTypeClearClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbMedType.Properties.Items.Count - 1 do
    ccbMedType.States[i] := cbsUnChecked;
end;

procedure TfrmGetPeriod.buTypeSelectAllClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbMedType.Properties.Items.Count - 1 do
    ccbMedType.States[i] := cbsChecked;
end;

procedure TfrmGetPeriod.ccbSomeMedicPropertiesCloseUp(Sender: TObject);
var
  i : Integer;
begin
  aSave.Enabled := False;
  for i := 0 to ccbSomeMedic.Properties.Items.Count - 1 do
    if ccbSomeMedic.States[i] = cbsChecked then aSave.Enabled := True;
end;

procedure TfrmGetPeriod.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetPeriod.ToolBar1DblClick(Sender: TObject);
begin
  frRep.DesignReport;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var
  d : Integer;
  FK_APPSOTR_ID : Integer;
begin
odinraz:=false;
  try
    GetSession(os, 'ASU');
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;
  iniFileName := Application.ExeName+'.ini';
  ods.Open;
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
  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;
  odsGroupMo.Open;
  lcbMO_GROUP.KeyValue := oqInitMO.GetVariable('nMO_GROUP');
  lcbMO_GROUP.Enabled :=  (oqInitMO.GetVariable('PFL_PROVIZOR') = 1);

  {if READSTRING_TSMINI('CONFIG', 'DB_NAME', 'N/A') = 'T' then
  begin
    odsMedic.SetVariable('pShowID',1);
  end
  else
  begin }
    odsMedic.SetVariable('pShowID',0);
  //end;

  odsMedic.Open;
  //Запоминаем текущюю раскладку
  GetKeyboardLayoutName(FLang);
  //Загружаем русскую раскладку клавиатуры
  LoadKeyboardLayout(PChar('00000419'), KLF_ACTIVATE);
  Self.Caption := Application.Title;

  ccbMedType.PopupWindow.DoubleBuffered := True;
  ccbSomeMedic.PopupWindow.DoubleBuffered := True;
  odsUchGr.Open;

  lcbMedic.Top := ccbSomeMedic.Top;
  ccbMedType.Top := ccbSomeMedic.Top;
  buTypeClear.Top := buSomeMedicClear.Top;
  buTypeSelectAll.Top := buSomeMedicSelectAll.Top;
end;

procedure TfrmGetPeriod.frRepUserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
var
	d : string;
begin
	if name = 'MYSTRTOFLOAT' then
	begin
		d := frParser.Calc(p1);
		val:=StringReplace(d,',', '.',[rfReplaceAll]);
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
  end;
end;

procedure TfrmGetPeriod.odsMedicAfterOpen(DataSet: TDataSet);
var
  ChBox : TcxCheckComboBoxItem;
  StrList : TStrings;
  i : Integer;
  sID : string;
begin
end;

procedure TfrmGetPeriod.odsUchGrAfterOpen(DataSet: TDataSet);
var
  ChBox : TcxCheckComboBoxItem;
  StrList : TStrings;
  i : Integer;
  sID : string;
begin
  StrList := TStringList.Create;
  StrList.Text := StringToListStr(IniReadString(iniFileName,'Params', 'LastTypeID', '-1'));
  odsUchGr.First;  // запоминаем все типы медикаментов
  ccbMedType.Properties.Items.Clear;
  while not odsUchGr.Eof do
  begin
    ChBox := ccbMedType.Properties.Items.Add;
    ChBox.Description := odsUchGr.FieldByName('FC_UCHGR').AsString;
    ChBox.Tag := odsUchGr.FieldByName('UCHGRID').AsInteger; // в теге храним ID типа
    // проставляем галочку на текущем чекбоксе
    sID := IntToStr( ChBox.Tag );
    i := 0;
    while (i < StrList.Count)and(sID <> StrList.Strings[i]) do
      Inc( i );
    if (i < StrList.Count) then ccbMedType.States[ ChBox.Index ] := cbsChecked else ccbMedType.States[ ChBox.Index ] := cbsUnchecked;
    odsUchGr.Next;
  end;
  odsUchGr.First;
  StrList.Free;

  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.odsGroupMoAfterOpen( DataSet: TDataSet );
begin
  lcbMO_GROUP.KeyValue := StrToInt(IniReadString(iniFileName,'Params', 'lcbMO_GROUP', '-1'));
  lcbCloseUp(nil);  
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject; var Action: TCloseAction);
var
  IDs : string;
  i : Integer;
begin
  IDs := '';
  for i := 0 to ccbMedType.Properties.Items.Count - 1 do
  begin
    if ccbMedType.States[i] = cbsChecked then
      IDs := IDs + '|'+IntToStr(ccbMedType.Properties.Items[i].Tag);
  end;
  Delete(IDs, 1, 1);
  IniWriteString(iniFileName,'Params', 'LastTypeID', IDs);

  IDs := '';
  for i := 0 to ccbSomeMedic.Properties.Items.Count - 1 do
  begin
    if ccbSomeMedic.States[i] = cbsChecked then
      IDs := IDs + '|'+IntToStr(ccbSomeMedic.Properties.Items[i].Tag);
  end;
  Delete(IDs, 1, 1);
  IniWriteString(iniFileName,'Params', 'LastSomeMedicID', IDs);

  try
    IniWriteString(iniFileName,'Params', 'lcbMedic', IntToStr(lcbMedic.EditValue));
    IniWriteString(iniFileName,'Params', 'lcbMO_GROUP', IntToStr(lcbMO_GROUP.KeyValue));
  except
  end;
  LoadKeyboardLayout(FLang, KLF_ACTIVATE);
  Action := caFree;
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

procedure TfrmGetPeriod.rbuMedicClick(Sender: TObject);
begin
  ccbMedType.Hide;
  buTypeClear.Hide;
  buTypeSelectAll.Hide;

  lcbMedic.Show;
  
  ccbSomeMedic.Hide;
  buSomeMedicClear.Hide;
  buSomeMedicSelectAll.Hide;
end;

procedure TfrmGetPeriod.rbuSomeMedicsClick(Sender: TObject);
var
  ChBox : TcxCheckComboBoxItem;
  StrList : TStrings;
  i : Integer;
  sID : string;
begin
  ccbMedType.Hide;
  buTypeClear.Hide;
  buTypeSelectAll.Hide;

  lcbMedic.Hide;

  ccbSomeMedic.Show;
  buSomeMedicClear.Show;
  buSomeMedicSelectAll.Show;

  if odinraz = false then
  begin
    odinraz:=true;
    cxProgressBar1.Visible:=true;
    cxProgressBar1.Properties.Min:=0;
    cxProgressBar1.Properties.Max:=odsMedic.RecordCount;
    cxProgressBar1.Position:=1;

    StrList := TStringList.Create;
    StrList.Text := StringToListStr(IniReadString(iniFileName,'Params', 'LastSomeMedicID', '-1'));
    odsMedic.First;  // запоминаем все медикаменты
    ccbSomeMedic.Properties.Items.Clear;
    odsMedic.DisableControls;
    while not odsMedic.Eof do
    begin
      Application.ProcessMessages;

      cxProgressBar1.Position:=cxProgressBar1.Position+1;
      ChBox := ccbSomeMedic.Properties.Items.Add;
      ChBox.Description := odsMedic.FieldByName('FC_MEDIC').AsString;
      ChBox.Tag := odsMedic.FieldByName('MEDICID').AsInteger; // в теге храним ID медикамента
      // проставляем галочку на текущем чекбоксе
      sID := IntToStr( ChBox.Tag );
      i := 0;
      while (i < StrList.Count)and(sID <> StrList.Strings[i]) do
        Inc( i );
      if (i < StrList.Count) then ccbSomeMedic.States[ ChBox.Index ] := cbsChecked else ccbSomeMedic.States[ ChBox.Index ] := cbsUnchecked;
      odsMedic.Next;

    end;
    odsMedic.First;
    odsMedic.EnableControls;
    StrList.Free;

    try
      lcbMedic.EditValue := StrToInt(IniReadString(iniFileName,'Params', 'lcbMedic', '-1'));
    except
    end;
    lcbCloseUp(nil);
  end;
end;

procedure TfrmGetPeriod.rbuUchGrClick(Sender: TObject);
begin
  ccbMedType.Show;
  buTypeClear.Show;
  buTypeSelectAll.Show;

  lcbMedic.Hide;

  ccbSomeMedic.Hide;
  buSomeMedicClear.Hide;
  buSomeMedicSelectAll.Hide;
end;

procedure TfrmGetPeriod.lcbCloseUp(Sender: TObject);
begin
  aSave.Enabled := (lcbMO_GROUP.KeyValue >= 0)and(lcbMedic.EditValue >= 0);
  lcbMO_GROUP.Hint := lcbMO_GROUP.Text;
end;

procedure TfrmGetPeriod.frRepGetValue(const ParName: String; var ParValue: Variant);
var
  sTemp : string;
begin
  if ParName = 'Date1' then ParValue := DateTimeToStr(dDate1.Date);
  if ParName = 'Date2' then ParValue := DateTimeToStr(dDate2.Date);
  if ParName = 'MEDOTRADE_SIGN' then ParValue := ReadMedotradeSign;

  sTemp:=  oqInitMO.GetVariable('PFC_NAME');
  if length(sTemp) < 1 then sTemp:='_';

  if ParName = 'VAR_MO' then ParValue := sTemp;

  if ParName = 'VAR_ZAV_OTDEL' then ParValue := oqInitMO.GetVariable('PZAVOTDEL');

  if ParName = 'VAR_OTDELID' then ParValue := oqInitMO.GetVariable('POTDELID');

  if ParName = 'VAR_SMS' then ParValue := oqInitMO.GetVariable('PSMS');

  if ParName = 'VAR_GLAV_BUH' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'GLAV_BUH', '');
    if sTemp = '' then
      ParValue := READSTRING_TSMINI('MANAGER_DOC', 'GLAV_BUH', '')
    else
      ParValue := sTemp;
  end;

  if ParName = 'VAR_BUHGALTER' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'BUHGALTER', '');
    if sTemp = '' then
      ParValue := READSTRING_TSMINI('MANAGER_DOC', 'BUHGALTER', '')
    else
      ParValue := sTemp;
  end;

  if ParName = 'VAR_GLAV_VRACH' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'GLAV_VRACH', '');
    if sTemp = '' then
      ParValue := READSTRING_TSMINI('MANAGER_DOC', 'GLAV_VRACH', '')
    else
      ParValue := sTemp;
  end;

  if ParName = 'VAR_ZAV_APTEKA' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_ZAV_APTEKA', '');
    if sTemp = '' then
      ParValue := READSTRING_TSMINI('MANAGER_DOC', 'ZAV_APTEKA', '')
    else
      ParValue := sTemp;
  end;
end;

end.


