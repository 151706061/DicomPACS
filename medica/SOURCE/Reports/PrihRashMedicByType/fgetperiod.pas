
unit fgetperiod;

interface

uses Windows,
// frxDSet,
 frxDBSet, Db,
  frxClass, frxDesgn, OracleData, Oracle, Classes,
  ActnList, ImgList, Controls, DBCtrls, ComCtrls, ToolWin, StdCtrls,
  ExtCtrls, Forms, HtmlHlp, JvExMask, JvToolEdit, Mask, OracleMonitor,
  cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Menus,
  cxLookAndFeelPainters, cxButtons, cxCheckComboBox, cxCheckBox, cxSpinEdit,
  dmMain, dxSkinsCore, dxSkinsDefaultPainters, cxCalendar, fr_Class, frxPreview;

const NullDate = -700000;

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
    frxDesigner: TfrxDesigner;
    acExcelExport: TAction;
    Panel4: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    lcbMO_GROUP: TDBLookupComboBox;
    frxReport1: TfrxReport;
    laMonthYear: TLabel;
    cmbMonth1: TcxComboBox;
    sedYear1: TcxSpinEdit;
    frxReport2: TfrxReport;
    Label3: TLabel;
    deS: TcxDateEdit;
    dePo: TcxDateEdit;
    Label5: TLabel;
    Label6: TLabel;
    frxReport3: TfrxReport;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frRepUserFunction(const Name: String; p1, p2, p3: Variant;
      var Val: Variant);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcbCloseUp(Sender: TObject);
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure frRepGetValue(const ParName: String; var ParValue: Variant);
    procedure frxReport1GetValue(const ParName: String; var ParValue: Variant);
    procedure frxReport1ObjectClick(View: TfrxView);
    procedure cmbMonth1PropertiesChange(Sender: TObject);
    procedure deSPropertiesChange(Sender: TObject);
    procedure frxReport3GetValue(const VarName: string; var Value: Variant);
    procedure frxReport1MouseOverObject(Sender: TfrxView);

  private
    { Private declarations }
    FLang: array[0..KL_NAMELENGTH] of char; //Раскладка клавиатуры
    FDate1, FDate2 : TDate;
    isMonth1PropertiesChangeEnable : Boolean;
    IS_REPORT_TYPE_LAST:integer;
    procedure LOAD_IS_REPORT_TYPE_LAST;
  PUBLIC
    { Public declarations }
    procedure SetMonth( aDate : TDate ); overload;
    procedure SetMonth( aYear, aMonth : Word ); overload;
    function GetValueFromTSMINI( const aSection, aKey : string ) : string;    
  end;

var
  frmGetPeriod      : TfrmGetPeriod;

implementation

uses Sysutils, Variants, IniFiles, DateUtils,
     FR_Utils, FR_Const, FR_View, frxRich, Graphics, Dialogs,
  fdmPrintSelect, uGlobalConst {$IFNDEF OLD_AUTH}, SmmainAPI {$ENDIF};

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
//==============================================================================
procedure TfrmGetPeriod.aSaveExecute(Sender: TObject);
var {p : TfrxPreview;
    s : string;}
    P1 : TPoint;
    fr:TfrxReport; 
    frx:TfrxReport;
begin
//  lcbMedic.PostEditValue; //  lcbMedic.CloseUp(True);
//  ccbUchGr.PostEditValue;
  case IS_REPORT_TYPE_LAST of
    0: fr:=frxReport2;
    1: fr:=frxReport1;
    2: frx:=frxReport3;
  else
    fr:=frxReport2;
  end;

  lcbMO_GROUP.CloseUp(True);
//  if FileExists('PrihRashMedicByType.frf') then            // если найден файл
//    fr.LoadFromFile('PrihRashMedicByType.frf');  // загружаем его
//  if FileExists('PrihRashMedicByType.fr3') then            // если найден файл
//    frx.LoadFromFile('PrihRashMedicByType.fr3');  // загружаем его

//  try
//    Self.dDate1.CheckValiddate;
//  StrToDate( dDate1.Text );
//  except
//    on EConvertError do begin
//      Application.MessageBox('Неверно введена начальная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
//      Self.dDate1.SetFocus;
//      Exit;
//    end;
//  end;
  if dmPrintSelect.PrintFlag = 0 then
  begin
    P1.X := 0;
    P1.Y := ToolButton1.Height;
    P1 := ToolButton1.ClientToScreen(P1);
    dmPrintSelect.pmPrintSelect.Popup(P1.X, P1.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати
  if dmPrintSelect.PrintFlag = 0 then Exit;
  try
//    dDate1.Date := trunc(dDate1.Date);
    case IS_REPORT_TYPE_LAST of
    0:begin
        fdmMain.odsPrihDocs_GR_LF.SetVariable('DATE1', FDate1);
        fdmMain.odsPrihDocs_GR_LF.SetVariable('DATE2', FDate2  );
        fdmMain.odsPrihDocs_GR_LF.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
        fdmMain.odsPrihDocs_GR_LF.open;

        fdmMain.odsOstByMonth_GR_LF.SetVariable('DATE1', FDate1);
        fdmMain.odsOstByMonth_GR_LF.SetVariable('DATE2', FDate2  );
        fdmMain.odsOstByMonth_GR_LF.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
        fdmMain.odsOstByMonth_GR_LF.open;

        fdmMain.odsRashDocs_GR_LF.SetVariable('DATE1', FDate1);
        fdmMain.odsRashDocs_GR_LF.SetVariable('DATE2', FDate2  );
        fdmMain.odsRashDocs_GR_LF.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
        fdmMain.odsRashDocs_GR_LF.open;
      end;
     1:begin
        fdmMain.odsOstByMonth.SetVariable('DATE1',FDate1);
        fdmMain.odsOstByMonth.SetVariable('DATE2', FDate2  );
        fdmMain.odsOstByMonth.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
        fdmMain.odsOstByMonth.Open;

        fdmMain.odsPrihDocs.SetVariable('DATE1', FDate1);
        fdmMain.odsPrihDocs.SetVariable('DATE2', FDate2  );
        fdmMain.odsPrihDocs.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
        fdmMain.odsPrihDocs.Open;

        fdmMain.odsNacenkaUcenka.SetVariable('DATE1', FDate1);
        fdmMain.odsNacenkaUcenka.SetVariable('DATE2', FDate2  );
        fdmMain.odsNacenkaUcenka.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
        fdmMain.odsNacenkaUcenka.Open;

        fdmMain.odsRashDocs.SetVariable('DATE1', FDate1);
        fdmMain.odsRashDocs.SetVariable('DATE2', FDate2  );
        fdmMain.odsRashDocs.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
        fdmMain.odsRashDocs.Open;

        fdmMain.odsRashTreb.SetVariable('DATE1', FDate1);
        fdmMain.odsRashTreb.SetVariable('DATE2', FDate2  );
        fdmMain.odsRashTreb.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
        fdmMain.odsRashTreb.Open;
       end;
     2:begin
        fdmMain.odsOstByMonth_TM.SetVariable('DATE1',FDate1);
        fdmMain.odsOstByMonth_TM.SetVariable('DATE2', FDate2  );
        fdmMain.odsOstByMonth_TM.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
        fdmMain.odsOstByMonth_TM.Open;

        fdmMain.odsPrihDocs_TM.SetVariable('DATE1', FDate1);
        fdmMain.odsPrihDocs_TM.SetVariable('DATE2', FDate2  );
        fdmMain.odsPrihDocs_TM.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
        fdmMain.odsPrihDocs_TM.Open;

        fdmMain.odsRashDocs_TM.SetVariable('DATE1', FDate1);
        fdmMain.odsRashDocs_TM.SetVariable('DATE2', FDate2  );
        fdmMain.odsRashDocs_TM.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
        fdmMain.odsRashDocs_TM.Open;
       end;
    else
      begin
        fdmMain.odsPrihDocs_GR_LF.SetVariable('DATE1', FDate1);
        fdmMain.odsPrihDocs_GR_LF.SetVariable('DATE2', FDate2  );
        fdmMain.odsPrihDocs_GR_LF.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
        fdmMain.odsPrihDocs_GR_LF.open;

        fdmMain.odsOstByMonth_GR_LF.SetVariable('DATE1', FDate1);
        fdmMain.odsOstByMonth_GR_LF.SetVariable('DATE2', FDate2  );
        fdmMain.odsOstByMonth_GR_LF.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
        fdmMain.odsOstByMonth_GR_LF.open;

        fdmMain.odsRashDocs_GR_LF.SetVariable('DATE1', FDate1);
        fdmMain.odsRashDocs_GR_LF.SetVariable('DATE2', FDate2  );
        fdmMain.odsRashDocs_GR_LF.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
        fdmMain.odsRashDocs_GR_LF.open;
      end;
    end;
//    dmPrintSelect.odsTSMINI.Session := os;

    Self.Hide;

    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1:
      begin
        case IS_REPORT_TYPE_LAST of
          0,1:begin
              fr.FindObject('Band1').Visible := False;
              fr.FindObject('PageFooter1').Visible := False;
              fr.PrepareReport;
              ExportFRToExcel( fr, 'ОТЧЕТ Аптеки о приходе, расходе за '+laMonthYear.Caption+'.xls' );
            end;
          2:begin
              frx.FindObject('PageFooter1').Visible := False;
              frx.PrepareReport;
              ExportFRToExcel( frx, 'ОТЧЕТ Аптеки о приходе, расходе за '+laMonthYear.Caption+'.xls' );
            end
          else
            begin
              fr.FindObject('Band1').Visible := False;
              fr.FindObject('PageFooter1').Visible := False;
              fr.PrepareReport;
              ExportFRToExcel( fr, 'ОТЧЕТ Аптеки о приходе, расходе за '+laMonthYear.Caption+'.xls' );
            end;
        end;
      end;

      2:
      begin  
        case IS_REPORT_TYPE_LAST of
          0,1:begin
                fr.PrepareReport;
                fr.ShowReport;
//                p := TfrxPreview.Create(fr);
//               tfrxreport( CurReport) := fr;
//                 tfrxreport( MasterReport) := fr;
//                DocMode := dmPrinting;
//                CurBand := nil;
////                if fr.EMFPages.Count = 0 then Exit;
//                s := frLoadStr(SPreview);
//                if fr.Title <> '' then s := s + ' - ' + fr.Title;
//                p.Window.Caption := s;
//                fr.Preview := p;
//
//                fr.Preview.Window.Show_Modal(fr);
//                Application.ProcessMessages;
//                fr.Preview.Window := nil;
            end;
          2:begin
              frx.PrepareReport;
              frx.ShowPreparedReport;
            end;
          else
            begin
              fr.PrepareReport;
                fr.ShowReport;
//              p := TfrxPreview.Create(fr);
//              CurReport := fr;
//              MasterReport := fr;
//              DocMode := dmPrinting;
//              CurBand := nil;
//              if fr.EMFPages.Count = 0 then Exit;
//              s := frLoadStr(SPreview);
//              if fr.Title <> '' then s := s + ' - ' + fr.Title;
//              p.Window.Caption := s;
//              fr.Preview := p;
//
//              fr.Preview.Window.Show_Modal(fr);
//              Application.ProcessMessages;
//              fr.Preview.Window := nil;
            end;
        end;
      end;
    end;
  finally
    dmPrintSelect.PrintFlag := 0;
    Close;    
  end;
//  frxReport1.Title := Application.Title;
//  frxReport1.ShowReport;

end;

procedure TfrmGetPeriod.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var
  i : Integer;
  UchgridStr : string;
begin
  try
    {$IFDEF OLD_AUTH}
      fdmMain.os.LogonUsername := 'ASU';
      fdmMain.os.LogonPassword := 'ASU';
      fdmMain.os.LogOn;
      if fdmMain.os.Connected = False then RaiseException(0,0,0, nil);
                 
    {$ELSE}
      GetSession(fdmMain.os, 'ASU');
    {$ENDIF}
      if Application.Terminated then Exit;

//    fdmMain.os.LogOn;
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;

//  odsMedic.Open;
  fdmMain.odsGroupMo.Open;

  //Запоминаем текущюю раскладку
  GetKeyboardLayoutName(FLang);
  //Загружаем русскую раскладку клавиатуры
  LoadKeyboardLayout(PChar('00000419'), KLF_ACTIVATE);
  Self.Caption := Application.Title;
  isMonth1PropertiesChangeEnable := False;
  for i := Low(LongMonthNames) to High(LongMonthNames) do
    cmbMonth1.Properties.Items.Add(LongMonthNames[i]);
  isMonth1PropertiesChangeEnable := True;
  LOAD_IS_REPORT_TYPE_LAST;
  try
  lcbMO_GROUP.KeyValue:=strtoint(IniReadString(ChangeFileExt(ParamStr(0),'.ini'),'Params','lcbMO_GROUP','-1'));
  except end;

  fdmMain.odsServerDate.Close;
  fdmMain.odsServerDate.Open;
  SetMonth( fdmMain.odsServerDate.FieldByName('sysdate').AsDateTime );

  if GetValueFromTSMINI( 'MEDICA.EXE','FUNC_USE_MEDUCHGRP_CH' ) = '1' then
    UchgridStr := 'nvl ( K.UCHGRID, M.UCHGRID )'
  else
    UchgridStr := 'M.UCHGRID';


  with fdmMain.odsOstByMonth do
  begin
    SQL.Text := StringReplace( SQL.Text,'#uchgrid#', UchgridStr , [rfReplaceAll, rfIgnoreCase] );
  end;
  with fdmMain.odsPrihDocs do
  begin
    SQL.Text := StringReplace( SQL.Text,'#uchgrid#', UchgridStr , [rfReplaceAll, rfIgnoreCase] );
  end;
  with fdmMain.odsRashDocs do
  begin
    SQL.Text := StringReplace( SQL.Text,'#uchgrid#', UchgridStr , [rfReplaceAll, rfIgnoreCase] );
  end;
  with fdmMain.odsRashTreb do
  begin
    SQL.Text := StringReplace( SQL.Text,'#uchgrid#', UchgridStr , [rfReplaceAll, rfIgnoreCase] );
  end;


  with fdmMain.odsOstByMonth_TM do
  begin
    SQL.Text := StringReplace( SQL.Text,'#uchgrid#', UchgridStr , [rfReplaceAll, rfIgnoreCase] );
  end;

  with fdmMain.odsPrihDocs_TM do
  begin
    SQL.Text := StringReplace( SQL.Text,'#uchgrid#', UchgridStr , [rfReplaceAll, rfIgnoreCase] );
  end;

  with fdmMain.odsRashDocs_TM do
  begin
    SQL.Text := StringReplace( SQL.Text,'#uchgrid#', UchgridStr , [rfReplaceAll, rfIgnoreCase] );
  end;

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

procedure TfrmGetPeriod.frxReport3GetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'MONTHYEAR' then Value := laMonthYear.Caption
  else if VarName = 'ZAV_APTEKA' then Value := GetValueFromTSMINI( 'MANAGER_DOC', 'ZAV_APTEKA' );

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

procedure TfrmGetPeriod.odsGroupMoAfterOpen(DataSet: TDataSet);
begin
  lcbMO_GROUP.KeyValue := StrToInt(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'lcbMO_GROUP', '-1'));
  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
//  IDs : string;
//  i : Integer;
  MO_GR : integer;

begin
//  IDs := '';
//  for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
//  begin
//    if ccbUchGr.States[i] = cbsChecked then
//      IDs := IDs + '|'+IntToStr(ccbUchGr.Properties.Items[i].Tag);
//  end;
//  Delete(IDs, 1, 1);
//  IniWriteString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'ccbUchGr', IDs);

  if TryStrToInt(VarToStr(lcbMO_GROUP.KeyValue), MO_GR) then
    IniWriteString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'lcbMO_GROUP', IntToStr(MO_GR));
  LoadKeyboardLayout(FLang, KLF_ACTIVATE);
  Action := caFree;
end;

procedure TfrmGetPeriod.lcbCloseUp(Sender: TObject);
begin
  aSave.Enabled := (lcbMO_GROUP.KeyValue >= 0);//and(lcbMedic.EditValue >= 0)
  lcbMO_GROUP.Hint := lcbMO_GROUP.Text;
end;

procedure TfrmGetPeriod.frRepGetValue(const ParName: String; var ParValue: Variant);
begin
//  if ParName = 'Date1' then ParValue := DateTimeToStr(dDate1.Date);
end;

procedure TfrmGetPeriod.frxReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName = 'MonthYear' then ParValue := laMonthYear.Caption
  else
  if ParName = 'var_zam_gl_vracha_po_lech' then ParValue := GetValueFromTSMINI( 'MANAGER_DOC', 'ZAM_GL_VRA4' )
  else if parName = 'MEDOTRADE_SIGN' then ParValue := ReadMedotradeSign;
end;

procedure TfrmGetPeriod.frxReport1MouseOverObject(Sender: TfrxView);
begin
  if ((Sender as TfrxView).Name = 'mePrilojenie') or
     ((Sender as TfrxView).Name = 'meZavAptekoy') or
     ((Sender as TfrxView).Name = 'mePravSost') then
    Cursor := crHandPoint;

end;

procedure TfrmGetPeriod.frxReport1ObjectClick(View: TfrxView);
var
  //vPos : Integer;
  ObjName : string;
begin
	if (View.Name = 'mePrilojenie') or
     (View.Name = 'meZavAptekoy') or
     (View.Name = 'mePravSost') then
  begin
    ObjName := View.Name;
//    View.Frame.Typ := 15;
    View.Frame.Color := clRed;
//    vPos := frxReport1.Preview.Window.VScrollBar.Position;
//    frxReport1.Preview.Zoom := frxReport1.Preview.Zoom; //дабы перерисовался отчет
//    frxReport1.Preview.Window.VScrollBar.Position := vPos;

    if (ObjName = 'mePrilojenie') then TfrxmemoView( View).Memo.Text := InputBox('Введите количество приложений','', StringReplace('View.Memo.Text', #13#10, '',[rfReplaceAll]));
    if (ObjName = 'meZavAptekoy') then TfrxmemoView( View).Memo.Text := InputBox('Введите ФИО зав. аптекой','', StringReplace('View.Memo.Text', #13#10, '',[rfReplaceAll]));
    if (ObjName = 'mePravSost')   then TfrxmemoView( View).Memo.Text := InputBox('Введите ФИО проверяющего отчет','', StringReplace('View.Memo.Text', #13#10, '',[rfReplaceAll]));

//    View.Frame.Typ := 2;
    View.Frame.Color := clBlack;
//    vPos := frxReport1.Preview.Window.VScrollBar.Position;
//    frxReport1.Preview.Zoom := frxReport1.Preview.Zoom; //дабы перерисовался отчет
//    frxReport1.Preview.Window.VScrollBar.Position := vPos;
    end;
end;

procedure TfrmGetPeriod.SetMonth(aDate: TDate);
var
  Day, Month, Year : Word;
begin
  DecodeDate(aDate, Year, Month, Day);
  isMonth1PropertiesChangeEnable := False; // чтобы обработчик cmbMonth1PropertiesChange(Sender: TObject);
  cmbMonth1.ItemIndex := (Month-1);        // не вызывался
  sedYear1.Value := Year;
  isMonth1PropertiesChangeEnable := True;

  SetMonth(Year, Month);
end;

procedure TfrmGetPeriod.SetMonth(aYear, aMonth: Word);
begin
  FDate1 := EncodeDate(aYear, aMonth, 1);
  FDate2 := EncodeDate(aYear, aMonth, DaysInAMonth(aYear, aMonth));
  laMonthYear.Caption :=  cmbMonth1.Text + ' ' + IntToStr(sedYear1.Value)+' г.';

  deS.Properties.OnChange := nil;
  dePo.Properties.OnChange := nil;
  deS.Date := FDate1;
  dePo.Date := FDate2;            
  deS.Properties.OnChange := deSPropertiesChange;
  dePo.Properties.OnChange := deSPropertiesChange;
end;

procedure TfrmGetPeriod.cmbMonth1PropertiesChange(Sender: TObject);
begin
  if not isMonth1PropertiesChangeEnable then Exit;  // чтобы из SetMonth(aDate: TDate); не вызывалось это событие 

  SetMonth(sedYear1.Value, cmbMonth1.ItemIndex+1);
end;

procedure TfrmGetPeriod.deSPropertiesChange(Sender: TObject);
begin
  FDate1 := deS.Date;
  FDate2 := dePo.Date;
  laMonthYear.Caption :=  'период с ' + DateToStr(deS.Date)+' по ' + DateToStr(dePo.Date);
end;

function TfrmGetPeriod.GetValueFromTSMINI(const aSection,
  aKey: string): string;
begin
  fdmMain.odsTSMINI.Close;
  fdmMain.odsTSMINI.SetVariable('ASECTION', aSection);
  fdmMain.odsTSMINI.SetVariable('AKEY', aKey);
  try
    fdmMain.odsTSMINI.Open;

    if fdmMain.odsTSMINI.RecordCount > 0 then
      Result := fdmMain.odsTSMINI.FieldByName('FC_VALUE').AsString
    else
      Result := '';
    fdmMain.odsTSMINI.Close;
  except
    Result := '';
  end;  
end;

procedure TfrmGetPeriod.LOAD_IS_REPORT_TYPE_LAST;
var
oq:TOracleQuery;
n : integer;
begin
oq:=TOracleQuery.Create(nil);
oq.Session:=fdmMain.os;
oq.SQL.text:='begin'+
      '  if :pValue is null then'+
      '    if :pdefault is null then :pdefault := ''''; end if;'+

        '    :pValue := asu.PKG_SMINI.readstring(:psection,:pident,:pdefault);'+
      '  else'+
      '    asu.PKG_SMINI.WRITESTRING( :psection, :pident, :pvalue);'+
      '  end if;'+
      'end;';
oq.DeclareAndSet('PSECTION', otstring, ExtractFileName(ParamStr(0)));
oq.DeclareAndSet('PIDENT', otstring, 'IS_REPORT_TYPE');
oq.DeclareAndSet('PVALUE', otstring, null);
oq.DeclareAndSet('PDEFAULT', otstring, '1');
oq.DeclareVariable('pValue', otstring);
oq.Execute;

IS_REPORT_TYPE_LAST := 0;

if TryStrToInt(oq.GetVariable('PVALUE'), n) then
  IS_REPORT_TYPE_LAST := n;

oq.free;
end;

end.


