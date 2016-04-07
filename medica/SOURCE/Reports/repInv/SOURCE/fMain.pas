unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, DB, OracleData,Oracle,
  cxGraphics, Menus, cxLookAndFeelPainters, cxButtons, cxCheckComboBox,
  cxCheckBox, cxGroupBox, dxSkinsCore, dxSkinsDefaultPainters, ExtCtrls,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    cxGroupBox1: TcxGroupBox;
    dInv: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    ePred: TcxTextEdit;
    e1: TcxTextEdit;
    cxLabel3: TcxLabel;
    e2: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    e3: TcxTextEdit;
    cxLabel6: TcxLabel;
    ePlace: TcxTextEdit;
    gbPrint: TcxGroupBox;
    chbPageTitle: TcxCheckBox;
    chbPagePodpiska: TcxCheckBox;
    odsUchGr: TOracleDataSet;
    cxGroupBox3: TcxGroupBox;
    ccbUchGr: TcxCheckComboBox;
    chbPageOpisList: TcxCheckBox;
    chbPageSlVedom: TcxCheckBox;
    buUchGrSelectAll: TcxButton;
    buUchGrClear: TcxButton;
    oqInitMO: TOracleQuery;
    gbInvOld: TcxGroupBox;
    pButtons: TPanel;
    cxLabel7: TcxLabel;
    eDocNum: TcxTextEdit;
    cxLabel8: TcxLabel;
    lcbMOCheck: TcxLookupComboBox;
    odsMOCheck: TOracleDataSet;
    odsSpecMO: TOracleDataSet;
    dsMOCheck: TDataSource;
    odsTSMINI: TOracleDataSet;
    ccbFinSource: TcxCheckComboBox;
    buFinSourceSelectAll: TcxButton;
    buFinSourceClear: TcxButton;
    odsFinSource: TOracleDataSet;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buUchGrClearClick(Sender: TObject);
    procedure buUchGrSelectAllClick(Sender: TObject);
    procedure odsUchGrAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chbPageOpisListClick(Sender: TObject);
    procedure InvOld(Sender: TObject);
    function GetValueFromTSMINI(const aSection, aKey: string): string;
    procedure buFinSourceSelectAllClick(Sender: TObject);
    procedure buFinSourceClearClick(Sender: TObject);
    procedure odsFinSourceAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    FIniName : string;
    sLOK     : string;
    FL_InvOLD : integer;
  end;

var
  frmMain: TfrmMain;

implementation

uses DateUtils, udm, IniFiles, fCheckedListEdit
  {$IFDEF MIS2}
  {$ELSE}
, SMMainAPI
  {$ENDIF}
;

{$R *.dfm}
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

function TfrmMain.GetValueFromTSMINI(const aSection, aKey: string): string;
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

procedure TfrmMain.FormCreate(Sender: TObject);
var
  FK_APPSOTR_ID : integer;
begin
  try
  {$IFDEF MIS2}
    dm.os.Preferences.ConvertUTF := cuUTF8ToUTF16;
    dm.os.LogonDatabase := 'MIS2';
    dm.os.LogonUsername := 'MIS';
    dm.os.LogonPassword := '1';
    dm.os.LogOn;
  {$ELSE}
    {$IFDEF OLD_AUTH}
      dm.os.LogonUsername := 'ASU';
      dm.os.LogonPassword := 'ASU';
      dm.os.LogOn;
    {$ELSE}
      GetSession(dm.os, 'ASU');
    {$ENDIF}
  {$ENDIF}
    if Application.Terminated then Exit;
//    os.LogOn;
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;

  sLOK := GetValueFromTSMINI('CONFIG', 'S_FULLNAME');

  if TryStrToInt(ParamStr(2), FL_InvOLD) = False then
    FL_InvOLD := 0;

  //Настраиваем форму для отображения Инвентаризационной описи старого образца (ещё в старой аптеке)
  if FL_InvOLD = 1 then
  begin
    gbPrint.Visible := False;
    gbInvOld.Visible := True;
    Button1.OnClick := InvOld;
    odsMOCheck.Open;
  end
  else
  // для нового (та, которая была раньше)
  begin
    gbPrint.Visible := True;
    gbInvOld.Visible := False;
  end;

  FIniName := ChangeFileExt(Application.ExeName,'.ini');
  dInv.Date:= Today;
  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;

  {$IFDEF MIS2}
  {$ELSE}
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;
  {$ENDIF}


  odsUchGr.Open;    
  odsFinSource.Open;

  dm.frxInv.AddFunction('function NUMBER_TO_STR(Summa: double): string');
  dm.frxInv.AddFunction('function FLOAT_NUMBER_TO_WORDS(aSource: Double):string');
  dm.frxInv.AddFunction('function INT_NUMBER_TO_WORDS(aSource: Integer; aRod: integer; aWordFor1, aWordFor234, aWordFor567890_1x: string): string');
  dm.frxInv.AddFunction('procedure INSERT_TINV_OPIS_GROUP(pline1 : integer; pline2 : integer; pkol_by_page : double; psumm_by_page : double)');
  dm.frxInv.AddFunction('procedure OPEN_TINV_OPIS_GROUP');    
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  frmMain.Close;
end;

procedure TfrmMain.InvOld(Sender: TObject);
var DateEnd : TDateTime;
    pFK_APPSOTRID : Integer;
    CurMO : Integer;
    q : TOracleQuery;
    ods: TOracleDataSet;
begin
  pFK_APPSOTRID :=StrToInt(paramstr(1));
  q := TOracleQuery.Create(nil);
  try
    q.Session := dm.os;
  {$IFDEF MIS2}
    CurMO:= 1103; //FieldAsInteger(0);
  {$ELSE}
    q.SQL.Text := 'SELECT NVL(MOID,-1) AS MOID FROM'+sLineBreak+
								' (SELECT MOID FROM MED.TMO T WHERE T.FK_SOTRID IN (SELECT login.GET_SOTRID(:p1) FROM DUAL))';
    q.DeclareAndSet('p1', otInteger, pFK_APPSOTRID);
    q.Execute;
    CurMO:= q.FieldAsInteger(0);
  {$ENDIF}
    DateEnd := dInv.Date;
    IF CurMO <> -1 then
    begin
      q.DeleteVariables;
      q.SQL.Text := 'begin'+sLineBreak+
                  '  med.pkg_medses.set_curmo(:MO);'+sLineBreak+
                  '  med.pkg_medses.set_curmo_group(med.pkg_medses.GET_CUR_MOGROUP_BY_MOID(:MO));'+sLineBreak+
                  '  med.pkg_medses.ResetDatePeriod;'+sLineBreak+
                  '  med.pkg_medses.set_data2(:pdate2);'+sLineBreak+
                  'end;';
      q.DeclareAndSet('MO', otInteger,CurMO);
      q.DeclareAndSet('pdate2',otDate,DateEnd);
      q.Execute;
    end;
  finally
    q.Free;
  end;

  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := dm.os;
    ods.SQL.Text := 'SELECT NVL(ASU.GET_SOTRNAME(MO.FK_SOTRID),MO.FC_NAME) FC_MO, G.FC_GROUP FROM MED.TMO MO, MED.TMO_GROUP G WHERE MO.FK_CURMOGROUPID = G.GROUPID AND MO.moid = :p1';
    ods.DeclareAndSet('p1', otInteger, CurMO);
    ods.Open;

    odsSpecMO.SetVariable('moid', CurMO);
    odsSpecMO.Open;          
    dm.frxInvOld.Variables['CREATEMODOL']:='''' +odsSpecMO.FieldByName('fc_spec').AsString + '''';
    odsSpecMO.Close;

    dm.frxInvOld.Variables['CREATEMO']:='''' +ods.FieldByName('FC_MO').AsString + ''''; 
    dm.frxInvOld.Variables['CREATEMOGROUP']:='''' +ods.FieldByName('FC_GROUP').AsString + '''';
  finally
    ods.Free;
  end;

  odsSpecMO.SetVariable('moid', lcbMOCheck.EditValue);
  odsSpecMO.Open;

  dm.frxInvOld.Variables['CHECKMODOL']:='''' +odsSpecMO.FieldByName('fc_spec').AsString + '''';
  dm.frxInvOld.Variables['CHECKMO']:='''' +lcbMOCheck.Text + '''';
  dm.frxInvOld.Variables['DOCNUM']:='''' +eDocNum.Text + '''';    
  dm.frxInvOld.Variables['LOK']:='''' +sLOK + '''';

  dm.frxInvOld.Variables['PK2']:='''' +ePred.Text + '''';
  dm.frxInvOld.Variables['M1']:='''' +e1.Text + '''';
  dm.frxInvOld.Variables['M2']:='''' +e2.Text + '''';
  dm.frxInvOld.Variables['M3']:='''' +e3.Text + '''';
  //dm.frxInvOld.Variables['Place']:='''' +ePlace.Text + '''';
  dm.frxInvOld.Variables['Dat']:='''' +DateToStr(dInv.Date) + '''';

  dm.odsRaznInv.Open;
  dm.odsRaznInv.First;
  
  dm.frxInvOld.Variables['CNTALL']:='''' +IntToStr(dm.odsRaznInv.RecordCount) + '''';

  dm.frxInvOld.ShowReport;

  dm.odsRaznInv.Close;

  dm.os.Rollback;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ePred.SetFocus;
end;

procedure TfrmMain.buUchGrClearClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
    ccbUchGr.States[i] := cbsUnChecked;
end;

procedure TfrmMain.buUchGrSelectAllClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
    ccbUchGr.States[i] := cbsChecked;
end;

procedure TfrmMain.odsFinSourceAfterOpen(DataSet: TDataSet);
var
  ChBox : TcxCheckComboBoxItem;
  StrList : TStrings;
  i : Integer;
  sID : string;
begin
//  lcbType.KeyValue := StrToInt(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastTypeID', '-1'));
  StrList := TStringList.Create;
  StrList.Text := StringToListStr(IniReadString(FIniName,'Params', 'LastFinsource', '-1'));
  odsFinSource.First;  // записываем все типы медикаментов в чеклист
  ccbFinSource.Properties.Items.Clear;
  while not odsFinSource.Eof do
  begin
    ChBox := ccbFinSource.Properties.Items.Add;
    ChBox.Description := odsFinSource.FieldByName('FC_NAME').AsString;
    ChBox.Tag := odsFinSource.FieldByName('FK_ID').AsInteger; // в теге храним ID типа

    // проставляем галочку на текущем чекбоксе
    sID := IntToStr( ChBox.Tag );
    i := 0;
    while (i < StrList.Count)and(sID <> StrList.Strings[i]) do
      Inc( i );
    if (i < StrList.Count) then ccbFinSource.States[ ChBox.Index ] := cbsChecked else ccbFinSource.States[ ChBox.Index ] := cbsUnchecked;
    odsFinSource.Next;
  end;
  odsFinSource.First;
  StrList.Free;

//  lcbCloseUp(nil);
end;

procedure TfrmMain.odsUchGrAfterOpen(DataSet: TDataSet);
var
  ChBox : TcxCheckComboBoxItem;
  StrList : TStrings;
  i : Integer;
  sID : string;
begin
//  lcbType.KeyValue := StrToInt(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastTypeID', '-1'));
  StrList := TStringList.Create;
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
  StrList.Free;

//  lcbCloseUp(nil);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  IDs : string;
  i : Integer;
begin
  IDs := '';
  for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
  begin
    if ccbUchGr.States[i] = cbsChecked then
      IDs := IDs + '|'+IntToStr(ccbUchGr.Properties.Items[i].Tag);
  end;
  Delete(IDs, 1, 1);
  IniWriteString(FIniName,'Params', 'LastUchGr', IDs);
  
  IDs := '';
  for i := 0 to ccbFinSource.Properties.Items.Count - 1 do
  begin
    if ccbFinSource.States[i] = cbsChecked then
      IDs := IDs + '|'+IntToStr(ccbFinSource.Properties.Items[i].Tag);
  end;
  Delete(IDs, 1, 1);
  IniWriteString(FIniName,'Params', 'LastFinSource', IDs);
  
  Action := caFree;
end;

procedure TfrmMain.chbPageOpisListClick(Sender: TObject);
begin
  ccbUchGr.Enabled := chbPageOpisList.Checked or chbPageSlVedom.Checked;
  buUchGrSelectAll.Enabled := ccbUchGr.Enabled;
  buUchGrClear.Enabled     := ccbUchGr.Enabled;
  ccbFinSource.Enabled := chbPageOpisList.Checked or chbPageSlVedom.Checked;
  buFinSourceSelectAll.Enabled := ccbFinSource.Enabled;
  buFinSourceClear.Enabled     := ccbFinSource.Enabled;
end;

procedure TfrmMain.buFinSourceClearClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbFinSource.Properties.Items.Count - 1 do
    ccbFinSource.States[i] := cbsUnChecked;
end;

procedure TfrmMain.buFinSourceSelectAllClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbFinSource.Properties.Items.Count - 1 do
    ccbFinSource.States[i] := cbsChecked;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var DateEnd : TDateTime;
    pFK_APPSOTRID : Integer;
    CurMO : Integer;
    IDs : string;     
    FSIDs : string;
    i : Integer;
    q : TOracleQuery;
    UchgridStr : string;
begin
  if (chbPageTitle.Checked or chbPagePodpiska.Checked or chbPageOpisList.Checked or chbPageSlVedom.Checked) = False then
  begin
    Application.MessageBox('Ни одна из отчетных форм для печати не выбрана', 'ВНИМАНИЕ', MB_OK+MB_ICONWARNING);
    Exit;
  end;   

  if FileExists('frxInv.fr3') then
    dm.frxInv.LoadFromFile('frxInv.fr3');

  pFK_APPSOTRID :=StrToInt(paramstr(1));
  q := TOracleQuery.Create(nil);
  try
    q.Session := dm.os;
  {$IFDEF MIS2}
    CurMO:= 1103; //FieldAsInteger(0);
  {$ELSE}
    q.SQL.Text := 'SELECT NVL(MOID,-1) AS MOID FROM'+sLineBreak+
								' (SELECT MOID FROM MED.TMO T WHERE T.FK_SOTRID IN (SELECT login.GET_SOTRID(:p1) FROM DUAL))';
    q.DeclareAndSet('p1', otInteger, pFK_APPSOTRID);
    q.Execute;
    CurMO:= q.FieldAsInteger(0);
  {$ENDIF}
    DateEnd := dInv.Date;
    IF CurMO <> -1 then
    begin
      q.DeleteVariables;
      q.SQL.Text := 'begin'+sLineBreak+
                  '  med.pkg_medses.set_curmo(:MO);'+sLineBreak+
                  '  med.pkg_medses.set_curmo_group(med.pkg_medses.GET_CUR_MOGROUP_BY_MOID(:MO));'+sLineBreak+
                  '  med.pkg_medses.ResetDatePeriod;'+sLineBreak+
                  '  med.pkg_medses.set_data2(:pdate2);'+sLineBreak+
                  'end;';
      q.DeclareAndSet('MO', otInteger,CurMO);
      q.DeclareAndSet('pdate2',otDate,DateEnd);
      q.Execute;
    end;
  finally
    q.Free;
  end;

  IDs := '';
  for i := 0 to ccbUchGr.Properties.Items.Count - 1 do
  begin
    if ccbUchGr.States[i] = cbsChecked then
    begin
      IDs := IDs + ', '+IntToStr(ccbUchGr.Properties.Items[i].Tag);
    end;
  end;
  Delete(IDs, 1, 2); // удаляем первую запятую и пробел - они лишние

  if IDs = '' then
    IDs := '-1';   

  FSIDs := '';
  for i := 0 to ccbFinSource.Properties.Items.Count - 1 do
  begin
    if ccbFinSource.States[i] = cbsChecked then
    begin
      FSIDs := FSIDs + ', '+IntToStr(ccbFinSource.Properties.Items[i].Tag);
    end;
  end;
  Delete(FSIDs, 1, 2); // удаляем первую запятую и пробел - они лишние

  if FSIDs = '' then
    FSIDs := '-1';
//  if IDs = '' then    
//    odsRep.SQL.Text := StringReplace(odsRep.SQL.Text, '%UCHGR_NUMS', '-1', [rfReplaceAll, rfIgnoreCase])
//  else
//  begin
//    odsRep.SQL.Text := StringReplace(odsRep.SQL.Text, '%UCHGR_NUMS', IDs, [rfReplaceAll, rfIgnoreCase]);
//    odsRep.SetVariable('FILTERED', 1);
//  end;


//  dm.odsSlVedTar.Close;
//  dm.odsOpisFR.Close;
//  dm.odsOLToxic.Close;
//  dm.odsOLSpirt.Close;
//
//  dm.odsSlVedTar.Open;
//  dm.odsOpisFR.Open;
//  dm.odsOLToxic.Open;
//  dm.odsOLSpirt.Open;

//  dm.repInvMat.Variables['PK2']:='''' +ePred.Text + '''';
//  dm.repInvMat.Variables['M1']:='''' +e1.Text + '''';
//  dm.repInvMat.Variables['M2']:='''' +e2.Text + '''';
//  dm.repInvMat.Variables['M3']:='''' +e3.Text + '''';
//  dm.repInvMat.Variables['Place']:='''' +ePlace.Text + '''';
//  dm.repInvMat.Variables['Dat']:='''' +DateToStr(dInv.Date) + '''';

  dm.frxInv.Variables['PK2']:='''' +ePred.Text + '''';
  dm.frxInv.Variables['M1']:='''' +e1.Text + '''';
  dm.frxInv.Variables['M2']:='''' +e2.Text + '''';
  dm.frxInv.Variables['M3']:='''' +e3.Text + '''';
  dm.frxInv.Variables['Place']:='''' +ePlace.Text + '''';
  dm.frxInv.Variables['Dat']:='''' +DateToStr(dInv.Date) + '''';

  dm.frxInv.Pages[1].Visible := chbPageTitle.Checked;
  dm.frxInv.Pages[2].Visible := chbPagePodpiska.Checked;
  dm.frxInv.Pages[3].Visible := chbPageSlVedom.Checked;
  dm.frxInv.Pages[4].Visible := chbPageOpisList.Checked;
  dm.frxInv.Pages[5].Visible := chbPageOpisList.Checked;  

//  dm.frxInv.AddFunction('function NUMBER_TO_STR(Summa: double): string');
//  dm.frxInv.AddFunction('function FLOAT_NUMBER_TO_WORDS(aSource: Double):string');
//  dm.frxInv.AddFunction('function INT_NUMBER_TO_WORDS(aSource: Integer; aRod: integer; aWordFor1, aWordFor234, aWordFor567890_1x: string): string');
//  dm.frxInv.AddFunction('procedure INSERT_TINV_OPIS_GROUP(pline1 : integer; pline2 : integer; pkol_by_page : double; psumm_by_page : double)');
//  dm.frxInv.AddFunction('procedure OPEN_TINV_OPIS_GROUP');

  if GetValueFromTSMINI ( 'MEDICA.EXE','FUNC_USE_MEDUCHGRP_CH' ) = '1'  then
    UchgridStr := 'nvl (k.UCHGRID, m.UCHGRID)'
  else
    UchgridStr := 'm.UCHGRID';

  if chbPageOpisList.Checked then
  with dm.odsOstByParties do
  begin
    Close;
    SQL.Text := StringReplace( SQL.Text, '%UCHGR_NUMS', IDs, [rfReplaceAll, rfIgnoreCase]);
    SQL.Text := StringReplace( SQL.Text, '%FINSOURCE_NUMS', FSIDs, [rfReplaceAll, rfIgnoreCase]);
    SQL.Text := StringReplace( SQL.Text, '#uchgrid#', UchgridStr, [rfReplaceAll, rfIgnoreCase]);
    Open;
    First;
  end;

  if chbPageSlVedom.Checked then
  begin
    with dm.odsOstByMedGroups do
    begin
      Close;
      SQL.Text := StringReplace( SQL.Text, '%UCHGR_NUMS', IDs, [rfReplaceAll, rfIgnoreCase]);
      SQL.Text := StringReplace( SQL.Text, '%FINSOURCE_NUMS', FSIDs, [rfReplaceAll, rfIgnoreCase]);
      SQL.Text := StringReplace( SQL.Text, '#uchgrid#', UchgridStr, [rfReplaceAll, rfIgnoreCase]);
      Open;
      First;
    end;

    with dm.odsOstByMed do
    begin
      Close;
      SQL.Text := StringReplace( SQL.Text, '%UCHGR_NUMS', IDs, [rfReplaceAll, rfIgnoreCase]);
      SQL.Text := StringReplace( SQL.Text, '%FINSOURCE_NUMS', FSIDs, [rfReplaceAll, rfIgnoreCase]);
      SQL.Text := StringReplace( SQL.Text, '#uchgrid#', UchgridStr, [rfReplaceAll, rfIgnoreCase]);
      Open;
      First;
    end;
  end;

  dm.frxInv.ShowReport;

  dm.odsOstByParties.Close;
  dm.odsOstByMedGroups.Close;
  dm.odsOstByMed.Close;
  dm.odsTinv_opis_group.Close;
  dm.os.Rollback;
end;

end.
