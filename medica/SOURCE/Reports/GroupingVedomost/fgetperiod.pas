{ Для ХАНТ этот отчет НЕ НУЖЕН }
unit fgetperiod;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ActnList, ImgList,
  ComCtrls, ToolWin, Db, OracleData, Oracle,
  // frxDSet,
  frxClass,
  fr_Class,

   frxDBSet,
  DBCtrls, frxDesgn, frOLEExl, frXMLExl, HtmlHlp, JvToolEdit, JvExMask, OracleMonitor,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxLookAndFeelPainters, frxExportXLS, frxExportXML;

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
    odsM: TStringField;
    Panel4: TPanel;
    lbType: TLabel;
    lcbUchgrtype: TDBLookupComboBox;
    odsUchGrType: TOracleDataSet;
    dsUchGrType: TDataSource;
    oq: TOracleQuery;
    frxXMLExport1: TfrxXMLExport;
    frxXLSExport1: TfrxXLSExport;
    RadioGroup1: TRadioGroup;
    lbType2: TLabel;
    lcbUchGr: TDBLookupComboBox;
    odsUchGr: TOracleDataSet;
    dsUchGr: TDataSource;
    odsRepMed: TOracleDataSet;
    frDBodsRepMed: TfrxDBDataset;
    frPrihDocMed: TfrxReport;
    odsGroupMo: TOracleDataSet;
    odsGroupMoGROUPID: TFloatField;
    odsGroupMoFC_GROUP: TStringField;
    odsGroupMoFL_DEL: TFloatField;
    dsGroupMo: TDataSource;
    lcbMO_GROUP: TDBLookupComboBox;
    cxGroupBox1: TcxGroupBox;
    lbJobTitle: TLabel;
    lbFam: TLabel;
    edJobTitleCompiler: TEdit;
    edFamCompiler: TEdit;
    cxGroupBox2: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edJobTitleChecker: TEdit;
    edFamChecker: TEdit;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    oqTSMini: TOracleQuery;
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
    procedure RadioGroup1Click(Sender: TObject);
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure odsUchGrAfterOpen(DataSet: TDataSet);
    procedure odsUchGrTypeAfterOpen(DataSet: TDataSet);
    function frPrihDocMedUserFunction(const MethodName: string; var Params: Variant): Variant;

  PRIVATE
    { Private declarations }
    FiniName : string;
    function GetValueFromTSMini ( aSection, aIdent, aDefaultValue : string ) : string;
  PUBLIC
    { Public declarations }
    function GetPayTypes: String;
  end;

var
  frmGetPeriod      : TfrmGetPeriod;

implementation

uses fFIOTreb, Variants, IniFiles, SMMainAPI;
{$R *.DFM}

var
  sJobTitleCompiler : String;
  sFamCompiler      : String;
  sJobTitleChecker  : String;
  sFamChecker       : String;

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
    UchgridStr : string;
begin
  FiniName := ChangeFileExt(Application.ExeName,'.ini');
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
  odsGroupMo.Open;
	odsUchGrType.Open;
	odsUchGr.Open;

  if GetValueFromTSMini( 'MEDICA.EXE','FUNC_USE_MEDUCHGRP_CH','0' ) = '1' then
    UchgridStr := 'nvl(k.UCHGRID, m.UCHGRID)'
  else
    UchgridStr := 'm.UCHGRID';

  with odsRepMed do
  begin
    SQL.Text := StringReplace( SQL.Text,'#uchgrid#', UchgridStr, [rfReplaceAll, rfIgnoreCase] );
  end;

end;

procedure TfrmGetPeriod.acApplyExecute(Sender: TObject);
//var frmFIOTreb: TfrmFIOTreb;
begin
  try
    //Self.dDate1.CheckValiddate;
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

// в хантах не хотят вводить данные для одного отчета на разных формах. Хотят все на одной форме Воронов О.А. 14.11.2007
  sJobTitleCompiler := edJobTitleCompiler.Text;
  sFamCompiler      := edFamCompiler.Text;
  sJobTitleChecker  := edJobTitleChecker.Text;
  sFamChecker       := edFamChecker.Text;
  
	case RadioGroup1.ItemIndex of
		0:Begin   //Тип медикаментов
				if not VarIsNull(lcbUchGr.KeyValue) then odsRepMed.SetVariable('UCHGROUPID', lcbUchGr.KeyValue);
				odsRepMed.SetVariable('Date1', dDate1.date);
				odsRepMed.SetVariable('Date2', dDate2.date);
				odsRepMed.SetVariable('MOGROUP_ID', lcbMO_GROUP.KeyValue);
				odsRepMed.Close;
				odsRepMed.Open;
//				if not VarisNull(lcbUchGr.KeyValue) then  frPrihDocMed.Title := 'Группировочная ведомость по медикаментам (' + odsUchGr.FieldByName('FC_UCHGR').AsString + ')';
				frPrihDocMed.ShowReport;
			end;
		1:Begin   //Тип учетных групп
				if not VarIsNull(lcbUchgrtype.KeyValue) then odsRep.SetVariable('FK_TUCHGRTYPE', lcbUchgrtype.KeyValue);
				odsRep.SetVariable('Date1', dDate1.date);
				odsRep.SetVariable('Date2', dDate2.date);
				odsRep.SetVariable('MOGROUP_ID', lcbMO_GROUP.KeyValue);
				odsRep.Close;
				odsRep.Open;
//				if not VarisNull(lcbUchgrtype.KeyValue) then  frPrihDoc.Title := 'Группировочная ведомость по медикаментам (' + odsUchGrType.FieldByName('FC_NAME').AsString + ')';
				frPrihDoc.ShowReport;
			end;
	end;
	
	Close;
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
  acApply.Enabled := (lcbMO_GROUP.Text <> '') and ((lcbUchgrtype.Text <> '') or (lcbUchGr.Text <> ''));
end;

procedure TfrmGetPeriod.frPrihDocGetValue(const ParName: String;  var ParValue: Variant);
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
    ParValue := GetValueFromTSMini ( 'MANAGER_DOC', 'CLIENT_NAME', '' );
  end;
end;

function TfrmGetPeriod.frPrihDocMedUserFunction(const MethodName: string; var Params: Variant): Variant;
var
	d : string;
begin
	if UpperCase(MethodName) = 'MYSTRTOFLOAT' then
	begin
		d := frParser.Calc(Params[0]);
		result:=StringReplace(d,',', '.',[rfReplaceAll]);
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

procedure TfrmGetPeriod.RadioGroup1Click(Sender: TObject);
begin
case RadioGroup1.ItemIndex of
	0:Begin
			lbType2.enabled:=true;
			lcbUchGr.enabled:=true;
			lbType.Enabled:=false;
			lcbUchgrtype.Enabled:=false;
		end;
	1:Begin
			lbType2.enabled:=false;
			lcbUchGr.enabled:=false;
			lbType.Enabled:=true;
			lcbUchgrtype.Enabled:=true;
		end;
end;

end;

procedure TfrmGetPeriod.odsGroupMoAfterOpen(DataSet: TDataSet);
begin
  lcbMO_GROUP.KeyValue := StrToInt(IniReadString( FiniName,'Params', 'LastMOGroupID', '-1'));
  lcbCloseUp(nil);  
end;

procedure TfrmGetPeriod.odsUchGrAfterOpen(DataSet: TDataSet);
begin
  lcbUchGr.KeyValue := StrToInt(IniReadString( FiniName,'Params', 'lcbUchGr', '-1'));
  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.odsUchGrTypeAfterOpen(DataSet: TDataSet);
begin
  lcbUchgrtype.KeyValue := StrToInt(IniReadString(FiniName,'Params', 'lcbUchgrtype', '-1'));
  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IniWriteString(FiniName,'Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.KeyValue) );
  IniWriteString(FiniName,'Params', 'lcbUchGr',      IntToStr(lcbUchGr.KeyValue)    );
  IniWriteString(FiniName,'Params', 'lcbUchgrtype',  IntToStr(lcbUchgrtype.KeyValue));
  Action := caFree;
end;

function TfrmGetPeriod.GetValueFromTSMini(aSection, aIdent, aDefaultValue: string): string;
begin
  with oqTSMini do
  try
    ClearVariables;
    SetVariable('PSECTION', aSection);
    SetVariable('PIDENT',   aIdent);
    SetVariable('PDEFAULT', aDefaultValue);
    SetVariable('PVALUE', null );
    Execute;
    Result := GetVariable('PVALUE');
  except
    Result := aDefaultValue;
  end;
end;

end.

