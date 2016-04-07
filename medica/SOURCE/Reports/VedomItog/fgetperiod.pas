{ ДЛЯ ХАНТ ЭТОТ ОТЧЕТ НЕ НУЖЕН }
unit fgetperiod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ActnList, ImgList,
  ComCtrls, ToolWin, Db, OracleData, Oracle,
  //frxDSet,
   frxClass,
   fr_Class,
   frxDBSet,
  DBCtrls, frxDesgn, frOLEExl, frXMLExl, HtmlHlp, JvExMask, JvToolEdit,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxLookAndFeelPainters,
  cxGraphics, Menus, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCheckComboBox, frxExportXLS, frxExportXML, frxPreview
 , dateutils
  ;

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
    frxDesigner1: TfrxDesigner;
    Panel4: TPanel;
    Label4: TLabel;
    frxXMLExport1: TfrxXMLExport;
    frxXLSExport1: TfrxXLSExport;
    odsSumm: TOracleDataSet;
    frDBdsSumm: TfrxDBDataset;
    odsGroupMo: TOracleDataSet;
    dsGroupMo: TDataSource;
    lcbMO_GROUP: TDBLookupComboBox;
    lbType: TLabel;
    ccbMedType: TcxCheckComboBox;
    buTypeClear: TcxButton;
    buTypeSelectAll: TcxButton;
    ToolButton3: TToolButton;
    GroupBox1: TGroupBox;
    chbSignature: TCheckBox;
    dsUchGr: TDataSource;
    oqInitMO: TOracleQuery;
    odsOld: TOracleDataSet;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    odsUchGr: TOracleDataSet;
    oqPKG_SMINI: TOracleQuery;
    procedure rbAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure ToolBar1DblClick(Sender: TObject);
    procedure lcbCloseUp(Sender: TObject);
    procedure frPrihDocGetValue(const ParName: String;
      var ParValue: Variant);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buTypeClearClick(Sender: TObject);
    procedure buTypeSelectAllClick(Sender: TObject);
    procedure odsUchGr1AfterOpen(DataSet: TDataSet);
    function frPrihDocUserFunction(const MethodName: string;
      var Params: Variant): Variant;

  PRIVATE
    function GetReportHeader: String;
    { Private declarations }
  PUBLIC
    function READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
  end;

var
  frmGetPeriod      : TfrmGetPeriod;

implementation

uses fFIOTreb, Variants, IniFiles, fCheckedListEdit, SMMainAPI, fdmPrintSelect,
     FR_View, FR_Utils, FR_Const, uGlobal;
{$R *.DFM}

var
  sJobTitleCompiler : String;
  sFamCompiler      : String;
  sJobTitleChecker  : String;
  sFamChecker       : String;

function TfrmGetPeriod.READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
begin
  try
  oqPKG_SMINI.ClearVariables;
  oqPKG_SMINI.SetVariable('PSECTION', aFC_SECTION);
  oqPKG_SMINI.SetVariable('PIDENT',   aFC_KEY);
  oqPKG_SMINI.SetVariable('PDEFAULT', aFC_DEFAULT_VALUE);

  oqPKG_SMINI.Execute;
  Result := nvl(oqPKG_SMINI.GetVariable('PVALUE'), '');
  except
    Result := aFC_DEFAULT_VALUE;
  end;
end;

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
//==============================================================================
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
begin
  try
    GetSession(os, 'ASU');
    if Application.Terminated then Exit;
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;

  odsGroupMo.OPen;
  odsOld.SetVariable('SKLAD_NAME', IniReadString(ChangeFileExt(ParamStr(0),'.ini'),'SKLAD','NAME', ''));
  odsOld.open;

//  d:=strtoint(odsOld.FieldByName('M').AsString);
  d:=  dateutils.MonthOf(Now);
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
//  odsGroupMo.Open;
//  lcbMO_GROUP.KeyValue := odsGroupMoGROUPID.AsInteger;

  odsUchGr.Open;
  Self.Caption := Application.Title;
  ccbMedType.PopupWindow.DoubleBuffered := True;

  acApply.Enabled := lcbMO_GROUP.Text <> '';
end;

procedure TfrmGetPeriod.acApplyExecute(Sender: TObject);
//var frmFIOTreb: TfrmFIOTreb;
var
  i, IDn : Integer;
  IDs, s : string;
  P : TPoint;
  frxPreview : TfrxPreview;
  UchGrIdStr : string;
begin
  lcbMO_GROUP.CloseUp(True);
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
    dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати
  if dmPrintSelect.PrintFlag = 0 then Exit;

  if ((GetKeyState(VK_SHIFT) and $8000) <> 0) then//зажата клавиша шифт
  begin
    frmFIOTreb := TfrmFIOTreb.Create(Self);
    try
      frmFIOTreb.Caption := 'Изменение названия склада мат. ценностей';
      frmFIOTreb.lbFam.Left := 5;
      frmFIOTreb.lbFam.Caption := 'Название склада';
      frmFIOTreb.edFam.Left := frmFIOTreb.edFam.Left + 20;
      frmFIOTreb.edFam.Width := frmFIOTreb.edFam.Width - 20;
      frmFIOTreb.edFam.Text := IniReadString(ChangeFileExt(ParamStr(0),'.ini'),'SKLAD','NAME', '');
      frmFIOTreb.edJobTitle.Visible := False;
      frmFIOTreb.lbJobTitle.Visible := frmFIOTreb.edJobTitle.Visible;
      if frmFIOTreb.ShowModal = mrCancel then Exit;

      odsOld.Close;
      odsOld.SetVariable('SKLAD_NAME',frmFIOTreb.edFam.Text);
      odsOld.Open;
      IniWriteString(ChangeFileExt(ParamStr(0),'.ini'),'SKLAD','NAME',frmFIOTreb.edFam.Text);
    finally
      frmFIOTreb.Free;
    end;
  end;

  // проверка на выбор типа медикамента
  IDn := 0;
  for i := 0 to ccbMedType.Properties.Items.Count - 1 do
  begin
    if ccbMedType.States[i] = cbsChecked then
    begin
      Inc(IDn);
      IDs := IDs + ', '+IntToStr(ccbMedType.Properties.Items[i].Tag);
    end;
  end;
  Delete(IDs, 1, 2); // удаляем первую запятую и пробел - они лишние

    //если выбрали тип уч. группы то отсекаем медикаменты по типу
//    if not VarIsNull(lcbUchgrtype.KeyValue) then
//    begin
//      SetVariable('FK_TUCHGRTYPE', lcbUchgrtype.KeyValue);
//    end;
    odsRep.SetVariable('Date1', dDate1.date);
    odsRep.SetVariable('Date2', dDate2.date);
    odsRep.SetVariable('MOGROUP_ID', lcbMO_GROUP.KeyValue);

    if READSTRING_TSMINI('MEDICA.EXE','FUNC_USE_MEDUCHGRP_CH','0')='1' then
      UchGrIdStr :=  'nvl ( k.UCHGRID, M.UCHGRID)'
    else
      UchGrIdStr := 'M.UCHGRID';

    if IDs <> '' then
       odsRep.SetVariable('UCHGR',' AND ' + UchGrIdStr + ' in ('+IDs+')');

    odsRep.SQL.Text := StringReplace(odsRep.SQL.Text, '#uchgrid#',
        UchGrIdStr, [rfReplaceAll, rfIgnoreCase] );

    odsRep.Open;

    //если выбрали тип уч. группы то отсекаем медикаменты по типу
//    if not VarIsNull(lcbUchgrtype.KeyValue) then
//    begin
//      SetVariable('FK_TUCHGRTYPE', lcbUchgrtype.KeyValue);
//    end;
    odsSumm.SetVariable('Date1', dDate1.date);
    odsSumm.SetVariable('Date2', dDate2.date);
    odsSumm.SetVariable('MOGROUP_ID', lcbMO_GROUP.KeyValue);
    if IDs <> '' then
      odsSumm.SetVariable('UCHGR',' AND ' + UchGrIdStr + ' in ('+IDs+')');

    odsSumm.Open;

    if chbSignature.Checked then // вводим данные в подписи
    begin
      sFamCompiler := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamCompiler', '');
      sJobTitleCompiler := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleCompiler', '');
      DoShowFIOTreb(sFamCompiler, sJobTitleCompiler, 'Ввод данных о составителе');
      IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamCompiler',sFamCompiler);
      IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleCompiler',sJobTitleCompiler);

      sFamChecker := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamChecker', '');
      sJobTitleChecker := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleChecker', '');
      DoShowFIOTreb(sFamChecker, sJobTitleChecker, 'Ввод данных о проверяющем');
      IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamChecker',sFamChecker);
      IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleChecker',sJobTitleChecker);
    end;


//  if not VarisNull(lcbUchgrtype.KeyValue) then
//    frPrihDoc.Title := 'Итоговая ведомость (' + odsUchGrType.FieldByName('FC_NAME').AsString + ')';
//  frPrihDoc.ShowReport;
//  if frPrihDoc.PrepareReport then frPrihDoc.ShowPreparedReport;

    case dmPrintSelect.PrintFlag of // флаг куда печатать
//      1: ExportFRToExcel( frPrihDoc, 'Оборотная ведомость по подотчетному лицу с '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls' );
      1:
      begin
         frPrihDoc.FindObject('PageFooter1').Visible := FAlse;
      //   tfrBandView(frPrihDoc.FindObject('MasterHeader1')).Prop['REPEATHEADER']:= FAlse;
         dmPrintSelect.frxXLSExport1.PageBreaks:=false;
         frPrihDoc.PrepareReport;
         ExportFRToExcel(frPrihDoc, 'Итоговая оборотная ведомость (c '+dDate1.Text+ ' по '+dDate2.Text+').xls' );
      end;
      2:
      begin


        frPrihDoc.PrepareReport;
frPrihDoc.ShowPreparedReport;
//          frxPreview := TfrxPreview.Create(frPrihDoc);
//          CurReport := frPrihDoc;
//          MasterReport := frPrihDoc;
//          DocMode := dmPrinting;
//          CurBand := nil;
//          if frPrihDoc.EMFPages.Count = 0 then Exit;
//          s := frLoadStr(SPreview);
//          if frPrihDoc.Title <> '' then s := s + ' - ' + frPrihDoc.Title;
//          frxPreview.Window.Caption := s;
//          frPrihDoc.Preview := frxPreview;
//
//          frPrihDoc.Preview.Window.Show_Modal(frPrihDoc);
//          Application.ProcessMessages;
//          frPrihDoc.Preview.Window := nil;
      end;
    end;

  Close;
end;

procedure TfrmGetPeriod.acCancelExecute(Sender: TObject);
begin
  Close;
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

procedure TfrmGetPeriod.ToolBar1DblClick(Sender: TObject);
begin
  frPrihDoc.DesignReport;
end;

procedure TfrmGetPeriod.lcbCloseUp(Sender: TObject);
begin
  acApply.Enabled := (lcbMO_GROUP.Text <> '');// and (ccbMedType.Text <> 'Не выбрано');//(lcbType.Text <> ''); // если без типа, то группировку скрываем
end;

procedure TfrmGetPeriod.frPrihDocGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName = 'Date1' then ParValue := DateTimeToStr(dDate1.Date);

  if ParName = 'Date2' then ParValue := DateTimeToStr(dDate2.Date);
  //заполнение переменных о составителе и о проверяющем
  if ParName = 'FamCompiler' then
    ParValue := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamCompiler', '');

  if ParName = 'JobTitleCompiler' then
    ParValue := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleCompiler', '');

  if ParName = 'FamChecker' then
    ParValue := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamChecker', '');

  if ParName = 'JobTitleChecker' then
    ParValue := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleChecker', '');

  if ParName = 'RepHeader' then ParValue := GetReportHeader;

  if ParName = 'Storage' then
  begin
//    if not VarIsNull(lcbUchgrtype.KeyValue) and (odsUchGrType.FieldByName('fk_id').AsInteger = 0) then //Лекарственные препараты
//      ParValue := 'Места хранения склад'
//    else
    ParValue := '';
  end;

  if ParName = 'var_receiver' then
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

function TfrmGetPeriod.frPrihDocUserFunction(const MethodName: string;
  var Params: Variant): Variant;
var
	d : string;
begin
	if MethodName = 'MYSTRTOFLOAT' then
	begin
		d := frParser.Calc(Params[0]);
		Result := StringReplace(d,',', '.',[rfReplaceAll]);
	end;
end;

function TfrmGetPeriod.GetReportHeader: String;
var
  CurUchGr : string;
begin
  odsRep.First;
  try
    CurUchGr := '';
    While not odsRep.Eof do
    begin
      if CurUchGr <> odsRep.FieldByName('UchGrName').AsString then
      begin
        Result := Result + odsRep.FieldByName('UchGrName').AsString + #13#13;
        CurUchGr := odsRep.FieldByName('UchGrName').AsString;
      end;
      odsRep.Next;
    end;
    System.Delete(Result,Length(Result),2);
  finally
    odsRep.First;
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
  lcbMO_GROUP.KeyValue := StrToInt(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastMOGroupID', '-1'));
  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.odsUchGr1AfterOpen(DataSet: TDataSet);
var
  ChBox : TcxCheckComboBoxItem;
  StrList : TStrings;
  i : Integer;
  sID : string;
begin
//  lcbType.KeyValue := StrToInt(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastTypeID', '-1'));
  StrList := TStringList.Create;
  StrList.Text := StringToListStr(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastTypeID', '-1'));
  odsUchGr.First;  // запоминаем все типы медикаментов
  ccbMedType.Properties.Items.Clear;
  while not odsUchGr.Eof do
  begin

  //  if odsUchGr.FieldByName('UCHGRID').AsInteger=284 then   // max than 64 - error 
  //    MessageDlg('123', mtWarning, [mbOK], 0);

    ChBox := ccbMedType.Properties.Items.Add;
    ChBox.Description := odsUchGr.FieldByName('FC_UCHGR').AsString;
    ChBox.Tag := odsUchGr.FieldByName('UCHGRID').AsInteger; // в теге храним ID типа

    // проставляем галочку на текущем чекбоксе
    sID := IntToStr( ChBox.Tag );
    i := 0;
    while (i < StrList.Count)and(sID <> StrList.Strings[i]) do
      Inc( i );
    if (i < StrList.Count) then
      ccbMedType.States[ ChBox.Index ] := cbsChecked
    else
      ccbMedType.States[ ChBox.Index ] := cbsUnchecked;
    odsUchGr.Next;

  end;
  odsUchGr.First;
  StrList.Free;

  lcbCloseUp(nil);
//  lcbType.KeyValue := StrToInt(IniReadString(Application.ExeName+'.ini','Params', 'lcbType', '-1'));
//  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  IDs : string;
  i : Integer;
begin
  IniWriteString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.KeyValue));

  IDs := '';
  for i := 0 to ccbMedType.Properties.Items.Count - 1 do
  begin
    if ccbMedType.States[i] = cbsChecked then
      IDs := IDs + '|'+IntToStr(ccbMedType.Properties.Items[i].Tag);
  end;
  Delete(IDs, 1, 1);
  IniWriteString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastTypeID', IDs);
//  IniWriteString(Application.ExeName+'.ini','Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.KeyValue));
//  IniWriteString(Application.ExeName+'.ini','Params', 'lcbType', IntToStr(lcbType.KeyValue));

//  IniWriteString(Application.ExeName+'.ini','Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.KeyValue));
//  IniWriteString(Application.ExeName+'.ini','Params', 'lcbUchgrtype', IntToStr(lcbUchgrtype.KeyValue));
  Action := caFree;
end;

end.


