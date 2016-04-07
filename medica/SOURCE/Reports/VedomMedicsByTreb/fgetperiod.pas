unit fgetperiod;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ActnList, ImgList,
  ComCtrls, ToolWin, Db, OracleData, Oracle, FR_DSet, FR_Class, FR_DBSet,
  DBCtrls, FR_Desgn, JvExMask, JvToolEdit,
  cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCheckComboBox, JvStringHolder, cxCheckBox,
  Menus, cxLookAndFeelPainters, cxButtons, OracleMonitor, frxClass,
  frxDBSet, frxCross, FR_Cross;

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
    odsRep: TOracleDataSet;
    Panel3: TPanel;
    Label3: TLabel;
    ods: TOracleDataSet;
    lcbMO_GROUP: TDBLookupComboBox;
    odsGroupMo: TOracleDataSet;
    odsGroupMoGROUPID: TFloatField;
    odsGroupMoFC_GROUP: TStringField;
    odsGroupMoFL_DEL: TFloatField;
    dsGroupMo: TDataSource;
    ToolButton3: TToolButton;
    frxDBdsRep: TfrxDBDataset;
    odsTSMINI: TOracleDataSet;
    oqInitMO: TOracleQuery;
    frxRep: TfrxReport;
    procedure rbAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure acApplyUpdate(Sender: TObject);
    procedure frxRepGetValue(const VarName: string; var Value: Variant);

  PRIVATE
    { Private declarations }
    FSelStr : string;
    function GetValueFromTSMINI(const aSection, aKey: string): string;
  PUBLIC
    { Public declarations }
  end;

var
  frmGetPeriod      : TfrmGetPeriod;
  iniFileName : string;

implementation

uses Variants, IniFiles, uGlobalConst, SMMainAPI,
  fdmPrintSelect;
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
function TfrmGetPeriod.GetValueFromTSMINI(const aSection, aKey: string): string;
begin
  odsTSMINI.Close;
  odsTSMINI.SetVariable('ASECTION', aSection);
  odsTSMINI.SetVariable('AKEY', aKey);
  try
    odsTSMINI.Open;

    if odsTSMINI.RecordCount > 0 then
      Result := odsTSMINI.FieldByName('FC_VALUE').AsString
    else
      Result := '';
    odsTSMINI.Close;
  except
    Result := '';
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
var d, FK_APPSOTR_ID: integer;
  UchgrIdStr : string;
begin
  try
//    os.LogOn;
    GetSession(os, 'ASU');
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;

  iniFileName := ChangeFileExt(Application.ExeName,'.ini');
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

  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;

  odsGroupMo.Open;
  if lcbMO_GROUP.Text = EmptyStr then
    lcbMO_GROUP.KeyValue := oqInitMO.GetVariable('nMO_GROUP');

  Self.Caption := Application.Title;
end;

procedure TfrmGetPeriod.acApplyExecute(Sender: TObject);
var
  P : TPoint;
  i  : Integer;
  IDs : string;
begin
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
  if dDate1.date > dDate2.date then begin
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

  try
    dDate1.Date := trunc(dDate1.Date);
    dDate2.Date := trunc(dDate2.Date);

    odsRep.Close;
    odsRep.SetVariable('Date1', dDate1.date);
    odsRep.SetVariable('Date2', dDate2.date);
    odsRep.SetVariable('MO_GROUP_ID', lcbMO_GROUP.KeyValue);

    if FileExists('VedomMedicsByTreb.fr3') then
      frxRep.LoadFromFile('VedomMedicsByTreb.fr3');

    Self.Hide;
    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1: begin
           frxRep.PrepareReport;
           ExportFRToExcel( frxRep, Self.Caption + ' с '+ DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls' );
         end;
      2: begin
           frxRep.PrepareReport;
           frxRep.ShowReport;
         end;
    end;

  finally
    dmPrintSelect.PrintFlag := 0;
    Close;
  end;
end;

procedure TfrmGetPeriod.acApplyUpdate(Sender: TObject);
begin
  acApply.Enabled := (lcbMO_GROUP.Text <> '');
  lcbMO_GROUP.Hint := lcbMO_GROUP.Text;
end;

procedure TfrmGetPeriod.acCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetPeriod.odsGroupMoAfterOpen(DataSet: TDataSet);
begin
  lcbMO_GROUP.KeyValue := StrToInt(IniReadString(iniFileName,'Params', 'LastMOGroupID', '-1'));
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IniWriteString(iniFileName,'Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.KeyValue));
  
  Action := caFree;
end;

procedure TfrmGetPeriod.frxRepGetValue(const VarName: String; var Value: Variant);
var
  UpperCaseVarName : string;

begin
  UpperCaseVarName := UpperCase(VarName);

  if UpperCaseVarName = 'DATE_FROM' then
    Value := DateTimeToStr(dDate1.Date);

  if UpperCaseVarName = 'DATE_TO' then
    Value := DateTimeToStr(dDate2.Date);

  if UpperCaseVarName= 'VAR_RECEIVER' then
    Value := GetValueFromTSMINI( 'MANAGER_DOC', 'CLIENT_NAME' );

  if UpperCaseVarName = 'FC_OTD_NAME' then Value := lcbMO_GROUP.Text;
end;


end.

