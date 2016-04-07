unit fgetperiod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ActnList, ImgList,
  ComCtrls, ToolWin, Db, OracleData, Oracle, FR_DSet, FR_Class, FR_DBSet,
  DBCtrls, FR_Desgn, frOLEExl, frXMLExl, JvExMask, JvToolEdit,
  JvComponentBase, JvFormPlacement, cxGraphics, Menus,
  cxLookAndFeelPainters, cxButtons, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckComboBox, cxCheckBox,
  dxSkinsCore, dxSkinsDefaultPainters, cxGroupBox, frxClass, frxDBSet;

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
    ods: TOracleDataSet;
    odsM: TStringField;
    odsRep: TOracleDataSet;
    FormStorage: TJvFormStorage;
    odsGroupMo: TOracleDataSet;
    odsGroupMoGROUPID: TFloatField;
    odsGroupMoFC_GROUP: TStringField;
    odsGroupMoFL_DEL: TFloatField;
    dsGroupMo: TDataSource;
    lcbMO_GROUP: TDBLookupComboBox;
    oqInitMO: TOracleQuery;
    oqTSMINI: TOracleQuery;
    frxRep: TfrxReport;
    frxDBds: TfrxDBDataset;
    procedure rbAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure odsMoBeforeOpen(DataSet: TDataSet);
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frxRepGetValue(const VarName: string; var Value: Variant);
    procedure lcbCloseUp(Sender: TObject);

  PRIVATE
    { Private declarations }
    function READSTRING_TSMINI(aFC_SECTION, aFC_KEY,  aFC_DEFAULT_VALUE: string): string;

  PUBLIC
    { Public declarations }
  end;

var
  frmGetPeriod      : TfrmGetPeriod;

implementation

uses inifiles, FR_View, FR_Utils, Fr_Const, 
  fdmPrintSelect,Variants, ComObj, uGlobalConst, SMMainAPI, fCheckedListEdit;
{$R *.DFM}

var
  sJobTitleCompiler : String;
  sFamCompiler      : String;
  sJobTitleChecker  : String;
  sFamChecker       : String;


function Remove1310(const sString: string): string;
begin
  Result := TRIM(StringReplace(sString, #13#10, ' ', [rfReplaceAll]));
end;

function IniReadString(sIniFile: string; Section, Ident: string; Default: string = ''): string;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(sIniFile);
  Result := ini.ReadString(Section, Ident, Default);
  ini.free;
end;

procedure IniWriteString(sIniFile: string; Section, Ident: string; Value: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(sIniFile);
  ini.WriteString(Section, Ident, Value);
  ini.free;
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

function TfrmGetPeriod.READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
begin
  with oqTSMINI do
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

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var d, FK_APPSOTR_ID: integer;
begin
  try
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

  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;

  odsGroupMo.Open;
  lcbMO_GROUP.KeyValue := oqInitMO.GetVariable('nMO_GROUP');
  lcbMO_GROUP.Enabled  := (oqInitMO.GetVariable('PFL_PROVIZOR') = 1);
  lcbCloseUp(nil);

  if UpperCase( READSTRING_TSMINI ( 'CONFIG', 'DB_NAME', '') ) = 'TO'  then // Н. Тагил онкоцентр
    Application.Title := 'Закупленные лекарственные средства';

  Self.Caption := Application.Title;
end;

procedure TfrmGetPeriod.frxRepGetValue(const VarName: string; var Value: Variant);
begin
  if UpperCase(VarName) = 'DATE1' then Value := DateToStr(dDate1.Date);

  if UpperCase(VarName) = 'DATE2' then Value := DateToStr(dDate2.Date);

  if UpperCase(VarName) = 'MO_GROUP' then Value := lcbMO_GROUP.Text;

  if UpperCase(VarName) = 'CLIENTNAME' then Value := oqInitMO.GetVariable('PCLIENTNAME');

  if UpperCase(VarName) = UpperCase('var_receiver')  then Value := READSTRING_TSMINI ( 'MANAGER_DOC', 'CLIENT_NAME', '' ); 
end;

procedure TfrmGetPeriod.lcbCloseUp(Sender: TObject);
begin
  acApply.Enabled := (lcbMO_GROUP.Text <> '');
end;

procedure TfrmGetPeriod.acApplyExecute(Sender: TObject);
var
  P1     : TPoint;
begin
  try
    Self.dDate1.CheckValiddate;
  except
    on EConvertError do begin
      MessageBox(Self.Handle, 'Неверно введена начальная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate1.SetFocus;
      Exit;
    end;
  end;
  try
    Self.dDate2.CheckValiddate;
  except
    on EConvertError do begin
      MessageBox(Self.Handle, 'Неверно введена конечная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate2.SetFocus;
      Exit;
    end;
  end;
  if Self.dDate1.date > Self.dDate2.date then begin
    MessageBox(Self.Handle, 'Неверно задан период', 'Ошибка', MB_OK + MB_ICONERROR);
    Self.dDate1.SetFocus;
    Exit;
  end;
  if dmPrintSelect.PrintFlag = 0 then
  begin
    P1.X := 0;
    P1.Y := ToolButton1.Height;
    P1 := ToolButton1.ClientToScreen(P1);
    dmPrintSelect.pmPrintSelect.Popup(P1.X, P1.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати
  if dmPrintSelect.PrintFlag = 0 then Exit;

  if FileExists('frxRepJurVhodControl.fr3') then
    frxRep.LoadFromFile('frxRepJurVhodControl.fr3');
  try
    odsRep.SetVariable('Date1', dDate1.date);
    odsRep.SetVariable('Date2', dDate2.date);  
    odsRep.SetVariable('MOGROUP_ID', lcbMO_GROUP.KeyValue);
    odsRep.Open;

    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1: begin
           if frxRep.FindObject('PageFooter1') <> nil then
             frxRep.FindObject('PageFooter1').Visible := false;           
           frxRep.PrepareReport;
           ExportFRToExcel(frxRep,  Application.Title+' с '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls' );
         end;
      2: begin
           frxRep.PrepareReport;
           frxRep.ShowPreparedReport;
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

procedure TfrmGetPeriod.odsMoBeforeOpen(DataSet: TDataSet);
begin
  TOracleDataSet(Dataset).SetVariable('moid',IniReadString(ExtractFilePath(ParamStr(0)) +
      'medica.ini','config','nMatOtvID'));
end;

procedure TfrmGetPeriod.odsGroupMoAfterOpen(DataSet: TDataSet);
begin
  lcbMO_GROUP.KeyValue := StrToInt(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastMOGroupID', '-1'));
  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IniWriteString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.KeyValue));

  Action := caFree;
end;

end.

