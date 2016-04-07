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
  dxSkinsCore, dxSkinsDefaultPainters, cxGroupBox, frxClass, frxDBSet,
  cxSpinEdit, JvStringHolder, StrUtils;

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
    pnlMOGroup: TPanel;
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
    Panel5: TPanel;
    Label4: TLabel;
    ccbMedType: TcxCheckComboBox;
    buTypeClear: TcxButton;
    buTypeSelectAll: TcxButton;
    odsUchGr: TOracleDataSet;
    dsUchGr: TDataSource;
    oqInitMO: TOracleQuery;
    odsMedicType: TOracleDataSet;
    frxRep: TfrxReport;
    frxDBds: TfrxDBDataset;
    Label5: TLabel;
    Label6: TLabel;
    seRndVal: TcxSpinEdit;
    odsTSMINI: TOracleDataSet;
    Panel4: TPanel;
    gbMode: TGroupBox;
    rbDefaultMode: TRadioButton;
    rb2ndStage: TRadioButton;
    mshRepQuery: TJvMultiStringHolder;
    ccbMO_GROUP: TcxCheckComboBox;
    btnMoGroupClear: TcxButton;
    btnMoGroupSelectAll: TcxButton;
    procedure rbAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure odsMoBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buTypeClearClick(Sender: TObject);
    procedure buTypeSelectAllClick(Sender: TObject);
    procedure odsUchGrAfterOpen(DataSet: TDataSet);
    procedure frxRepGetValue(const VarName: string; var Value: Variant);
    procedure btnMoGroupClearClick(Sender: TObject);
    procedure btnMoGroupSelectAllClick(Sender: TObject);
    procedure alActionsUpdate(Action: TBasicAction; var Handled: Boolean);

  PRIVATE
    DBName: string;

    function GetValueFromTSMINI(const aSection, aKey, aDefaultValue: string ): string;
    procedure MakeExcelReport ( ADataSet : TDataSet; AFileName : string);
  PUBLIC
  end;

var
  frmGetPeriod      : TfrmGetPeriod;

const
  cGroupA = 80;
  cGroupB = 15;
  cGroupC = 5;

implementation

uses fFIOTreb, inifiles, fDateInput, FR_View, FR_Utils, Fr_Const,
  fdmPrintSelect, fCheckedListEdit, Math, Excel2000, OleServer, ShellAPI,
  Variants, ComObj, SMMainAPI, frxVariables;
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
  cName := uppercase(tcomponent(Sender).getnamepath);
  dDate := 0;
  decodedate(date, nYear, nMon, nMon);

  if cName = 'RBM1'
  then begin
    dDate:=encodedate(nYear, 1, 1);
    nMon:=1
  end
  else if cName = 'RBM2'
       then begin
         dDate := encodedate(nYear, 2, 1);
         nMon := 1
       end
       else if cName = 'RBM3'
            then begin
              dDate := encodedate(nYear, 3, 1);
              nMon := 1
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
  Self.dDate1.date := dDate;
  Self.dDate2.date := incmonth(dDate, nMon) - 1;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var
  d,i, FK_APPSOTR_ID: integer;
  StrList : TStrings;
begin
  try
    GetSession(os, 'ASU');
  except
    Application.MessageBox('Нет соединения с базой данных!', 'Ошибка', mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;

  ods.open;
  d:=strtoint(ods.FieldByName('M').AsString);

  case d of
    1: rbm1.Checked := true;
    2: rbm2.Checked := true;
    3: rbm3.Checked := true;
    4: rbm4.Checked := true;
    5: rbm5.Checked := true;
    6: rbm6.Checked := true;
    7: rbm7.Checked := true;
    8: rbm8.Checked := true;
    9: rbm9.Checked := true;
    10: rbm10.Checked := true;
    11: rbm11.Checked := true;
    12: rbm12.Checked := true;
  else
    rbm1.Checked := true;
  end;

  DBName := GetValueFromTSMINI( 'CONFIG', 'DB_NAME', 'H' );

  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False
  then FK_APPSOTR_ID := -1;

  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;

  ccbMO_GROUP.Enabled := (oqInitMO.GetVariable('PFL_PROVIZOR') = 1);
  btnMoGroupClear.Enabled := ccbMO_GROUP.Enabled;
  btnMoGroupSelectAll.Enabled := ccbMO_GROUP.Enabled;

  try
    odsGroupMo.Close;
    odsGroupMo.Open;

    ccbMO_GROUP.Properties.Items.Clear;
    StrList := TStringList.Create;
    try
      StrList.Text := StringToListStr(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastMOGroupID', '-1'));
      odsGroupMo.First;
      while not odsGroupMo.Eof do
      begin
        with ccbMO_GROUP.Properties.Items.Add do
        begin
          Description := odsGroupMo.FieldByName('FC_GROUP').AsString;
          Tag := odsGroupMo.FieldByName('GROUPID').AsInteger; // в теге храним ID
          ccbMO_GROUP.States[ Index ] :=cbsUnchecked;

          if ccbMO_GROUP.Enabled  then // провизор - группы МО из файла
          for i := 0 to StrList.Count - 1 do
          begin
            if Trim(StrList.Strings[i]) = odsGroupMo.FieldByName('GROUPID').AsString then
              ccbMO_GROUP.States[ Index ] := cbsChecked;
          end
          else // не провизор - только текущая группа МО
          if ( not VarIsNull(oqInitMO.GetVariable('nMO_GROUP'))) and (Tag = oqInitMO.GetVariable('nMO_GROUP')) then
            ccbMO_GROUP.States[ Index ] := cbsChecked;
        end;                                                                           
        odsGroupMo.Next;
      end;
    finally
      StrList.Free;
    end;
  except
    on e : Exception do
    begin
      Application.MessageBox( PAnsiChar('Ошибка при получении списка групп МО!'+ #13#10 + e.Message ), 'Ошибка', MB_OK + MB_ICONERROR );
      Exit;
    end;
  end;

  odsUchGr.Open;
  Self.Caption := Application.Title;
end;

procedure TfrmGetPeriod.frxRepGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'DATE1'
  then Value := DateToStr(dDate1.Date);

  if VarName = 'DATE2'
  then Value := DateToStr(dDate2.Date);

  if VarName = 'MO_GROUP'
    then Value := ccbMO_GROUP.Text;
end;

procedure TfrmGetPeriod.acApplyExecute(Sender: TObject);
var
  P1     : TPoint;
  i, IDn : Integer;
  IDs, MoGroups : string;
begin
  try
    seRndVal.PostEditValue;
  except
    on e: Exception do
    begin
      MessageBox(Self.Handle, PAnsiCHar('Неверно указано поле: ' + Label5.Caption), 'Ошибка', MB_OK + MB_ICONERROR);
      seRndVal.SetFocus;
      Exit;
    end;
  end;

  try
    Self.dDate1.CheckValiddate;
  except
    on EConvertError
    do begin
      MessageBox(Self.Handle, 'Неверно введена начальная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate1.SetFocus;
      Exit;
    end;
  end;

  try
    Self.dDate2.CheckValiddate;
  except
    on EConvertError
    do begin
      MessageBox(Self.Handle, 'Неверно введена конечная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate2.SetFocus;
      Exit;
    end;
  end;

  if Self.dDate1.date > Self.dDate2.date
  then begin
    MessageBox(Self.Handle, 'Неверно задан период', 'Ошибка', MB_OK + MB_ICONERROR);
    Self.dDate1.SetFocus;
    Exit;
  end;

  MoGroups := EmptyStr;
  for i := 0 to ccbMO_GROUP.Properties.Items.Count - 1 do
  begin
    if ccbMO_GROUP.States[i] = cbsChecked then
    begin
      if MoGroups <> EmptyStr then
        MoGroups := MoGroups + ',';

      MoGroups := MoGroups + IntToStr( ccbMO_GROUP.Properties.Items[i].Tag );
    end;
  end;

  if (MoGroups = EmptyStr) then
  begin
    MessageBox(Self.Handle, 'Не выбрана группа МО!', 'Ошибка', MB_OK + MB_ICONERROR);
    Exit;
  end;                                                                                                      

  if not rb2ndStage.Checked then
  begin
    if dmPrintSelect.PrintFlag = 0
    then begin
      P1.X := 0;
      P1.Y := ToolButton1.Height;
      P1 := ToolButton1.ClientToScreen(P1);
      dmPrintSelect.pmPrintSelect.Popup(P1.X, P1.Y);
      Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
    end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати

    if dmPrintSelect.PrintFlag = 0
    then Exit;
  end;

  // проверка на выбор типа медикамента
  IDn := 0;

  for i := 0 to ccbMedType.Properties.Items.Count - 1
  do begin
    if ccbMedType.States[i] = cbsChecked
    then begin
      Inc(IDn);
      IDs := IDs + ', ' + IntToStr(ccbMedType.Properties.Items[i].Tag);
    end;
  end;

  Delete(IDs, 1, 2); // удаляем первую запятую и пробел - они лишние

  try
  try
    if (rb2ndStage.Checked) then
      odsRep.SQL.Text := mshRepQuery.StringsByName['str2ndStageQuery'].Text
    else
      odsRep.SQL.Text := mshRepQuery.StringsByName['strDefaultQuery'].Text;

    odsRep.DeclareVariable( 'UchGroups', otSubst );
    if IDn > 0 then // если выбрали типы медикаментов, показываем только их и сортируем по именам типов
    begin
      if GetValueFromTSMINI ( 'MEDICA.EXE', 'FUNC_USE_MEDUCHGRP_CH', '0' ) = '1' then
        odsRep.SetVariable ('UchGroups', ' AND nvl (k.UCHGRID, m.UCHGRID) in ('+IDs+') ')
      else
        odsRep.SetVariable('UchGroups', ' AND m.UCHGRID in ('+IDs+') ');
    end;

    odsRep.DeclareVariable( 'pMOGroups', otSubst );
    odsRep.SetVariable( 'pMOGroups', ' start with g.GROUPID in ('+ MoGroups +') ' );

    odsRep.DeclareAndSet ('Date1', otDate, dDate1.date);
    odsRep.DeclareAndSet('Date2', otDate, dDate2.date);
    odsRep.DeclareAndSet( 'PFN_RND', otInteger, seRndVal.Value );

    if DBName = 'H' then
      odsRep.DeclareAndSet ( 'pDvigCondition', otSubst, ' < 0 /* Только расход */' )
    else
      odsRep.DeclareAndSet ( 'pDvigCondition', otSubst, ' > 0 /* Только приход */' );
    odsRep.Open;

    if rb2ndStage.Checked then // только в эксель
    begin
      // эскпорт ручками в эксель
      MakeExcelReport( odsRep, Application.Title+' с '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls' );
    end
    else
    begin
      case dmPrintSelect.PrintFlag of // флаг куда печатать
        1: begin
             if frxRep.FindObject('PageFooter1') <> nil
             then frxRep.FindObject('PageFooter1').Visible := false;

             frxRep.PrepareReport;
             ExportFRToExcel(frxRep,  Application.Title+' с '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls' );
           end;
        2: begin
             frxRep.PrepareReport;
             frxRep.ShowPreparedReport;
           end;
      end;
    end;
  except
    on e : Exception do
    begin
      Application.MessageBox( PAnsiChar( 'Ошибка при формировании отчета!'+#13#10 + e.Message ), 'Ошибка', MB_OK + MB_ICONERROR );
      Exit;
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

procedure TfrmGetPeriod.alActionsUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  acApply.Enabled := (ccbMO_GROUP.Text <> ccbMO_GROUP.Properties.EmptySelectionText ) and (ccbMedType.Text <> ccbMedType.Properties.EmptySelectionText);
end;

procedure TfrmGetPeriod.MakeExcelReport(ADataSet: TDataSet; AFileName : string);
type
  TGroupParams = packed record
    GroupDescr : string;
    RowCnt : integer;
    Percent : Double;
    //Summ : Double;
    LastRowNo : integer;
    RecCnt : integer; // кол-во строк с учетом объединения по медикаменту
  end;
  // выводит группу эксель и возвращает запись о группе с параметрами ( кол-во строк в группе с итоговой строкой и заголовком )
  function AddGroup ( ADataSet : TDataSet; AWorkSheet : _Worksheet; AStartRow : Integer; AGroupName : string; AMaxPercent : Double = 100 ): TGroupParams;
  var
    RowCnt, RowsInMedicgroup : integer;
    GroupParams :TGroupParams;
  begin
    // инициализируем переменную результата
    RowCnt := 0;
    GroupParams.GroupDescr := AGroupName;
    GroupParams.RowCnt := RowCnt;
    GroupParams.Percent := 0;
    GroupParams.LastRowNo := 0;
    GroupParams.RecCnt := 0;

    try
    with AWorkSheet.Range[ AWorkSheet.Cells.Item[AStartRow,1], AWorkSheet.Cells.Item[AStartRow,8] ] do
    begin
      MergeCells := True;
      Value := AGroupName;
      Font.Bold := True;
      Font.Italic := True;
    end;

    while not ADataSet.Eof do
    begin
      // добавлям группами по медикаменту
      RowsInMedicgroup := ADataSet.FieldByName ( 'FN_ROWS_CNT_IN_GROUP' ).AsInteger;
      Inc( GroupParams.RecCnt );
      while RowsInMedicgroup > 0 do
      begin
        Inc(RowCnt);
        AWorkSheet.Cells.Item[ AStartRow + RowCnt, 2 ] := ADataSet.FieldByName ( 'FN_NO' ).AsVariant; // №
        AWorkSheet.Cells.Item[ AStartRow + RowCnt, 3 ] := ADataSet.FieldByName ( 'FC_NAME' ).AsVariant;  //Наименование ЛС
        AWorkSheet.Cells.Item[ AStartRow + RowCnt, 4 ] := ADataSet.FieldByName ( 'FC_EI' ).AsVariant; // Ед. изм.
        AWorkSheet.Cells.Item[ AStartRow + RowCnt, 5 ] := ADataSet.FieldByName ( 'FN_KOL' ).AsVariant; // Кол-во
        AWorkSheet.Cells.Item[ AStartRow + RowCnt, 6 ] := ADataSet.FieldByName ( 'FN_PRICE' ).AsVariant; // Цена
        AWorkSheet.Cells.Item[ AStartRow + RowCnt, 7 ] := ADataSet.FieldByName ( 'FN_SUM_BY_MEDIC' ).AsVariant;// Сумма
        AWorkSheet.Cells.Item[ AStartRow + RowCnt, 8 ] := ADataSet.FieldByName ( 'FN_PERCENT' ).AsVariant; // Процент от общей суммы

        Dec(RowsInMedicgroup);
        if RowsInMedicgroup > 0 then
          ADataSet.Next;
      end;

      GroupParams.RowCnt := RowCnt;
      GroupParams.Percent :=  ADataSet.FieldByName ( 'FN_RANGE_PERCENT' ).AsFloat;
      GroupParams.LastRowNo := ADataSet.FieldByName ( 'FN_NO' ).AsInteger;

      if ADataSet.FieldByName ( 'FN_ROWS_CNT_IN_GROUP' ).AsInteger > 1 then
      begin
        AWorkSheet.Range [ AWorkSheet.Cells.Item[ AStartRow + RowCnt - (ADataSet.FieldByName ( 'FN_ROWS_CNT_IN_GROUP' ).AsInteger-1), 1 ],
                          AWorkSheet.Cells.Item[ AStartRow + RowCnt, 1 ] ].MergeCells := True;

        AWorkSheet.Range [ AWorkSheet.Cells.Item[ AStartRow + RowCnt - (ADataSet.FieldByName ( 'FN_ROWS_CNT_IN_GROUP' ).AsInteger-1), 2 ],
                          AWorkSheet.Cells.Item[ AStartRow + RowCnt, 2 ] ].MergeCells := True;

        AWorkSheet.Range [ AWorkSheet.Cells.Item[ AStartRow + RowCnt - (ADataSet.FieldByName ( 'FN_ROWS_CNT_IN_GROUP' ).AsInteger-1), 7 ],
                          AWorkSheet.Cells.Item[ AStartRow + RowCnt, 7 ] ].MergeCells := True;

        AWorkSheet.Range [ AWorkSheet.Cells.Item[ AStartRow + RowCnt - (ADataSet.FieldByName ( 'FN_ROWS_CNT_IN_GROUP' ).AsInteger-1), 8 ],
                          AWorkSheet.Cells.Item[ AStartRow + RowCnt, 8 ] ].MergeCells := True;
      end;

      //Хантам нужно, если группа А точно не попадает в AMaxPercent%, то брать в бОльшую сторону, то есть добавлять еще и следующую позицию
      if (ADataSet.FieldByName ( 'FN_RANGE_PERCENT' ).AsFloat >= AMaxPercent) and ( AMaxPercent <> 100 )  then
      begin
        ADataSet.Next;
        // Как только добавили позицию более или равно AMaxPercent % то выходим
        Break;
      end;
      ADataSet.Next;
    end;

      // Итоговая строка по группе
      Inc(RowCnt);
      // строка итого
      with AWorkSheet.Range[ AWorkSheet.Cells.Item[AStartRow + RowCnt,1], AWorkSheet.Cells.Item[AStartRow + RowCnt,6] ] do
      begin
        MergeCells := True;
        Value := 'Итого по группе:' + AGroupName;
        Font.Bold := True;
        HorizontalAlignment := xlRight;
        VerticalAlignment := xlTop;        
      end;

      // сумма по столбцу "Сумма"
      with AWorkSheet.Range[ AWorkSheet.Cells.Item[AStartRow + RowCnt,7], AWorkSheet.Cells.Item[ AStartRow + RowCnt,7] ] do
      begin
        if RowCnt > 1 then
          FormulaR1C1 := '=SUM(R[-' + IntToStr (RowCnt-1)  + ']C:R[-1]C)'
        else
          Value := 0;
        Font.Bold := True;
      end;

      // сумма по столбцу "Процент от общей суммы"
      with AWorkSheet.Range[ AWorkSheet.Cells.Item[AStartRow + RowCnt,8], AWorkSheet.Cells.Item[ AStartRow + RowCnt,8] ] do
      begin
        if RowCnt > 1 then
          FormulaR1C1 := '=SUM(R[-' + IntToStr (RowCnt-1)  + ']C:R[-1]C)'
        else
          Value := 0;
        Font.Bold := True;
      end;
      //   стили
      if (RowCnt > 1) then
      begin

        with AWorkSheet.Range[ AWorkSheet.Cells.Item[AStartRow+1,1],
                              AWorkSheet.Cells.Item[AStartRow + RowCnt-1,2] ] do
        begin
          HorizontalAlignment := xlCenter;
          VerticalAlignment := xlTop;
        end;

        with AWorkSheet.Range[ AWorkSheet.Cells.Item[AStartRow+1,3],
                              AWorkSheet.Cells.Item[AStartRow + RowCnt-1,3] ] do
        begin
          HorizontalAlignment := xlLeft;
          VerticalAlignment := xlTop;
        end;

        with AWorkSheet.Range[ AWorkSheet.Cells.Item[AStartRow+1,4],
                              AWorkSheet.Cells.Item[AStartRow + RowCnt-1,5] ] do
        begin
          HorizontalAlignment := xlCenter;
          VerticalAlignment := xlTop;
        end;

        with AWorkSheet.Range[ AWorkSheet.Cells.Item[AStartRow+1,6],
                              AWorkSheet.Cells.Item[AStartRow + RowCnt-1,6] ] do
        begin
          HorizontalAlignment := xlRight;
          VerticalAlignment := xlTop;
          NumberFormat := '0,00';
        end;
      end;

      with AWorkSheet.Range[ AWorkSheet.Cells.Item[AStartRow+1,7],
                            AWorkSheet.Cells.Item[AStartRow + RowCnt,7] ] do
      begin
        HorizontalAlignment := xlRight;
        VerticalAlignment := xlTop;
        NumberFormat := '0,00';
      end;

      with AWorkSheet.Range[ AWorkSheet.Cells.Item[AStartRow+1,8],
                            AWorkSheet.Cells.Item[AStartRow + RowCnt,8] ] do
      begin
        HorizontalAlignment := xlRight;
        VerticalAlignment := xlTop;
        NumberFormat := '0,' + DupeString ( '0', seRndVal.Value );
      end;

    finally
      RowCnt := RowCnt + 1; // + строка заголовка
      GroupParams.RowCnt := RowCnt;
      Result := GroupParams;
    end;
  end;
var
  Excel : TExcelApplication;// Variant;
  WorkBk: _WorkBook; //  определяем WorkBook
  WorkSheet: _WorkSheet; //  определяем WorkSheet
  RepFileName, SummaryFormula : string;
  ColStart, ColEnd, RowStart, RowStartDopTbl : integer;
  FRColor : Variant;
  GroupACnt, GroupBCnt, GroupCCnt : integer;
  GroupARecCnt, GroupBRecCnt, GroupCRecCnt : integer;  
  GroupAParams, GroupBParams, GroupCParams :TGroupParams;
  GroupASumPercent : Double;
begin
  if (not Assigned (ADataSet)) or (not ADataSet.Active) then
    Exit;
  RepFileName := ExtractFilePath(Application.ExeName) + 'Reports\' +  AFileName;

  if FileExists (RepFileName)  then
   if not DeleteFile( RepFileName ) then
   begin
     Application.MessageBox( PAnsiChar ('Файл отчета c именем #13#10"' + RepFileName + '"#13#10 уже отрыт! Закройте этот файл и постройте отчет заново.' ),
      'Внимание', MB_OK + MB_ICONWARNING );
     Exit;
   end;

  try
    //Excel := CreateOleObject( 'Excel.Application' );
    Excel := TExcelApplication.Create( Self );
  except
    MessageBox(Handle, 'MS Excel не установлен на компьютере', 'Внимание', MB_ICONERROR or MB_OK);
    Exit;
  end;
  ColStart := 1;
  ColEnd := 8;
  RowStart := 7;
  RowStartDopTbl := 0;
  FRColor := $00CCFFCC;
  GroupACnt := 0;
  GroupBCnt := 0;
  GroupCCnt := 0;
  SummaryFormula := EmptyStr;
  GroupASumPercent := cGroupA;

  try
  try
    Screen.Cursor := crHourGlass;
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;
    Excel.Visible[0] := False;
    Excel.Workbooks.Add ( xlWBATWorksheet, 0 ) ;
    Excel.DisplayAlerts[0] := False;
    WorkBk := (Excel.Workbooks[1] as _WorkBook);
    WorkSheet := WorkBk.Worksheets.Item[1] as _Worksheet;

    WorkSheet.Activate(0);
    WorkSheet.Name := 'ABC-анализ';
    WorkSheet.PageSetup.Orientation := xlPortrait;

    with WorkSheet.Range[ WorkSheet.Cells.Item[1,ColStart+1], WorkSheet.Cells.Item[1,ColEnd-2] ] do
    begin
      Value := ccbMO_GROUP.Text ;
      Rows.AutoFit;
      MergeCells := True;
      WrapText := True;
      Interior.Color := FRColor;
      Font.Name := 'Times New Roman';
      Font.Size := 10 ;
      HorizontalAlignment := xlCenter;
      Borders.Item [xlEdgeBottom].LineStyle := xlContinuous;
    end;

    with WorkSheet.Range[ WorkSheet.Cells.Item[2,ColStart+1], WorkSheet.Cells.Item[2,ColEnd-2] ] do
    begin
      MergeCells := True;
      Value := 'название подразделения';
      Font.Name := 'Times New Roman';
      Font.Size := 8 ;
      HorizontalAlignment := xlCenter;
      VerticalAlignment := xlTop;
      RowHeight := 10;
    end;

    with WorkSheet.Range[ WorkSheet.Cells.Item[4,ColStart], WorkSheet.Cells.Item[4,ColEnd] ] do
    begin
      MergeCells := True;
      Value := 'Годовой отчет для анализа ABC';
      Font.Name := 'Times New Roman';
      Font.Size := 12;
      Font.Bold := True;
      HorizontalAlignment := xlCenter;
      Rows.AutoFit;
    end;

    with WorkSheet.Range[ WorkSheet.Cells.Item[ 5,ColStart], WorkSheet.Cells.Item[ 5,ColEnd] ] do
    begin
      MergeCells := True;
      Value := 'за период с ' + dDate1.Text + ' по ' + dDate2.Text;
      Font.Name := 'Times New Roman';
      Font.Size := 10 ;
      Font.FontStyle := fsBold;
      HorizontalAlignment := xlCenter;
      Rows.AutoFit;
    end;

    // шапка
    with WorkSheet.Range[ WorkSheet.Cells.Item[6,1], WorkSheet.Cells.Item[ 6,1] ] do
    begin
      Value := 'Ст-нь необх-ти мед-тов';
      ColumnWidth := 7;
    end;
    with WorkSheet.Range[ WorkSheet.Cells.Item[6,2], WorkSheet.Cells.Item[ 6,2] ] do
    begin
      Value := '№';
      ColumnWidth := 5;
    end;
    with WorkSheet.Range[ WorkSheet.Cells.Item[6,3], WorkSheet.Cells.Item[ 6,3] ] do
    begin
      Value := 'Наименование ЛС';
      ColumnWidth := 35;
    end;
    with WorkSheet.Range[ WorkSheet.Cells.Item[6,4], WorkSheet.Cells.Item[ 6,4] ] do
    begin
      Value := 'Ед. изм.';
      ColumnWidth := 7;
    end;
    with WorkSheet.Range[ WorkSheet.Cells.Item[6,5], WorkSheet.Cells.Item[ 6,5] ] do
    begin
      Value := 'Кол-во';
      ColumnWidth := 7;
    end;
    with WorkSheet.Range[ WorkSheet.Cells.Item[6,6], WorkSheet.Cells.Item[ 6,6] ] do
    begin
      Value := 'Цена';
      ColumnWidth := 10;
    end;
    with WorkSheet.Range[ WorkSheet.Cells.Item[6,7], WorkSheet.Cells.Item[ 6,7] ] do
    begin
      Value := 'Сумма';
      ColumnWidth := 12;
    end;
    with WorkSheet.Range[ WorkSheet.Cells.Item[6,8], WorkSheet.Cells.Item[ 6,8] ] do
    begin
      Value := 'Процент от общей суммы';
      ColumnWidth := 8;
    end;
    ADataSet.First;
    //   Группа А
    GroupAParams := AddGroup( ADataSet, WorkSheet, RowStart, 'Группа А ( 80% от итоговой суммы по отчету)', cGroupA );
    GroupACnt := GroupAParams.RowCnt;
    GroupARecCnt := GroupAParams.RecCnt;
    //if GroupACnt > 2 then
    GroupASumPercent := GroupAParams.Percent;

//       Группа B
    GroupBParams := AddGroup( ADataSet, WorkSheet, RowStart + GroupACnt, 'Группа B ( 15% от итоговой суммы по отчету)', GroupASumPercent + cGroupB );
    GroupBCnt := GroupBParams.RowCnt;
    GroupBRecCnt := GroupBParams.RecCnt;

    //   Группа C
    GroupCParams := AddGroup( ADataSet, WorkSheet, RowStart + GroupACnt + GroupBCnt, 'Группа C ( 5% от итоговой суммы по отчету)' );
    GroupCCnt := GroupCParams.RowCnt;
    GroupCRecCnt := GroupCParams.RecCnt;

    // Итого по отчету
    with WorkSheet.Range[ WorkSheet.Cells.Item[RowStart + GroupACnt + GroupBCnt+ GroupCCnt ,1],
      WorkSheet.Cells.Item[RowStart + GroupACnt + GroupBCnt+ GroupCCnt,6] ] do
    begin
      MergeCells := True;
      Value := 'ИТОГО ПО ОТЧЕТУ:';
      Font.Name := 'Times New Roman';
      Font.Size := 10;
      Font.Bold := True;
      HorizontalAlignment := xlRight;
      VerticalAlignment := xlTop;
    end;

    if GroupCCnt > 2 then
    begin
      if SummaryFormula <> EmptyStr then
        SummaryFormula := SummaryFormula + ', ';

      SummaryFormula := SummaryFormula + 'R[-2]C:R[-' + IntToStr(GroupCCnt-1) +']C';
    end;

    if GroupBCnt > 2 then
    begin
      if SummaryFormula <> EmptyStr then
        SummaryFormula := SummaryFormula + ', ';

      SummaryFormula := SummaryFormula + 'R[-' + IntToStr(GroupCCnt + 2) + ']C:R[-' + IntToStr( GroupBCnt + GroupCCnt-1) +']C';
    end;

    if GroupACnt > 2 then
    begin
      if SummaryFormula <> EmptyStr then
        SummaryFormula := SummaryFormula + ', ';

      SummaryFormula := SummaryFormula + 'R[-' + IntToStr( GroupBCnt + GroupCCnt + 2) + ']C:R[-' + IntToStr( GroupACnt + GroupBCnt + GroupCCnt-1) +']C';
    end;

    if SummaryFormula <> EmptyStr then
      SummaryFormula := '=SUM(' + SummaryFormula + ')';

    // итоговая сумма по столбцу "Сумма"
    with WorkSheet.Range[ WorkSheet.Cells.Item[RowStart + GroupACnt + GroupBCnt+ GroupCCnt,7], WorkSheet.Cells.Item[RowStart + GroupACnt + GroupBCnt+ GroupCCnt,7] ] do
    begin
      Font.Name := 'Times New Roman';
      Font.Size := 9;
      if SummaryFormula <> EmptyStr then
        FormulaR1C1 := SummaryFormula
      else
        value := 0;
      Font.Bold := True;
      NumberFormat := '0,00';
      VerticalAlignment := xlTop;
      HorizontalAlignment := xlCenter;
    end;

    // шрифты, стили, границы и т.д. к таблице
    with WorkSheet.Range[ WorkSheet.Cells.Item[RowStart-1,1],
                          WorkSheet.Cells.Item[RowStart + GroupACnt + GroupBCnt+ GroupCCnt-1,8] ] do
    begin
      Font.Name := 'Times New Roman';
      Font.Size := 9;
      WrapText := True;
      Borders.Item[xlEdgeTop].LineStyle := xlContinuous;
      Borders.Item[xlEdgeTop].Weight := xlThick;
      Borders.Item[xlEdgeBottom].LineStyle := xlContinuous;
      Borders.Item[xlEdgeBottom].Weight := xlThick;
      Borders.Item[xlEdgeLeft].LineStyle := xlContinuous;
      Borders.Item[xlEdgeLeft].Weight := xlThick;
      Borders.Item[xlEdgeRight].LineStyle := xlContinuous;
      Borders.Item[xlEdgeRight].Weight := xlThick;
      Borders.Item[xlInsideHorizontal].LineStyle := xlContinuous;
      Borders.Item[xlInsideHorizontal].Weight := xlThin;
      Borders.Item[xlInsideVertical].LineStyle := xlContinuous;
      Borders.Item[xlInsideVertical].Weight := xlThin;

      Rows.AutoFit;
    end;
    // шапка
    with WorkSheet.Range[ WorkSheet.Cells.Item[RowStart-1,1], WorkSheet.Cells.Item[RowStart-1,8] ] do
    begin
      Font.Size := 10;
      Font.Bold := True;
      Interior.Color := FRColor;
      VerticalAlignment := xlCenter;
      HorizontalAlignment := xlCenter;
      Rows.AutoFit;
    end;
    // закремпляем шапку таблицы
    WorkSheet.Range[ WorkSheet.Cells.Item[RowStart,1], WorkSheet.Cells.Item[RowStart,8] ].Select;
    Excel.ActiveWindow.FreezePanes := True;

/////////// Итоговая таблица с распеределнием по V, E, N
    RowStartDopTbl := RowStart + GroupACnt + GroupBCnt + GroupCCnt + 2  ; // отступаем 2 строки
    // шапка
    with WorkSheet.Range[ WorkSheet.Cells.Item[RowStartDopTbl, 3], WorkSheet.Cells.Item[RowStartDopTbl,5] ] do
    begin
      MergeCells := True;
      Value := 'Объем финансовых затрат по группам медикаментов';
      Font.Bold := True;
      Font.Size := 10;
    end;
    WorkSheet.Cells.Item[RowStartDopTbl+1, 3] := 'Группа';
    WorkSheet.Cells.Item[RowStartDopTbl+1, 4] := '%';
    WorkSheet.Cells.Item[RowStartDopTbl+1, 5] := 'Сумма';
    with WorkSheet.Range[ WorkSheet.Cells.Item[RowStartDopTbl, 6], WorkSheet.Cells.Item[RowStartDopTbl,8] ] do
    begin
      MergeCells := True;
      Value := 'Распределение медикаментов по степени их необходимости';
      Font.Bold := True;
      Font.Size := 10;
      RowHeight := 25;
    end;
    WorkSheet.Cells.Item[RowStartDopTbl + 1, 6] := 'V,%';
    WorkSheet.Cells.Item[RowStartDopTbl + 1, 7] := 'E,%';
    WorkSheet.Cells.Item[RowStartDopTbl + 1, 8] := 'N,%';


    WorkSheet.Cells.Item[RowStartDopTbl + 2, 3] := 'A';
    WorkSheet.Cells.Item[RowStartDopTbl + 2, 4].FormulaR1C1 := '=R' + IntToStr ( RowStart + GroupACnt -1 )  + 'C8';
    WorkSheet.Cells.Item[RowStartDopTbl + 2, 5].FormulaR1C1 := '=R' + IntToStr ( RowStart + GroupACnt -1 )  + 'C7';

    if GroupARecCnt > 0 then
    begin
      WorkSheet.Range[ WorkSheet.Cells.Item[RowStartDopTbl + 2, 6], WorkSheet.Cells.Item[RowStartDopTbl + 2, 6] ].FormulaR1C1Local :=
      '=СЧЕТЕСЛИ(R'+IntToStr(RowStart+1)+'C1:R'+IntToStr(RowStart+GroupACnt-2)+'C1;"V")*100/'+ IntToStr(GroupARecCnt) ;
      WorkSheet.Range[ WorkSheet.Cells.Item[RowStartDopTbl + 2, 7], WorkSheet.Cells.Item[RowStartDopTbl + 2, 7] ].FormulaR1C1Local :=
      '=СЧЕТЕСЛИ(R'+IntToStr(RowStart+1)+'C1:R'+IntToStr(RowStart+GroupACnt-2)+'C1;"E")*100/'+ IntToStr(GroupARecCnt) ;
      WorkSheet.Range[ WorkSheet.Cells.Item[RowStartDopTbl + 2, 8], WorkSheet.Cells.Item[RowStartDopTbl + 2, 8] ].FormulaR1C1Local :=
      '=СЧЕТЕСЛИ(R'+IntToStr(RowStart+1)+'C1:R'+IntToStr(RowStart+GroupACnt-2)+'C1;"N")*100/'+ IntToStr(GroupARecCnt) ;
    end
    else
    begin
      WorkSheet.Cells.Item[RowStartDopTbl + 2, 6] := 0;
      WorkSheet.Cells.Item[RowStartDopTbl + 2, 7] := 0;
      WorkSheet.Cells.Item[RowStartDopTbl + 2, 8] := 0;
    end;

    WorkSheet.Cells.Item[RowStartDopTbl + 3, 3] := 'B';
    WorkSheet.Cells.Item[RowStartDopTbl + 3, 4].FormulaR1C1 := '=R' + IntToStr ( RowStart + GroupACnt + GroupBCnt -1 )  + 'C8';
    WorkSheet.Cells.Item[RowStartDopTbl + 3, 5].FormulaR1C1 := '=R' + IntToStr ( RowStart + GroupACnt + GroupBCnt-1 )  + 'C7';

    if GroupBRecCnt > 0 then
    begin
      WorkSheet.Range[ WorkSheet.Cells.Item[RowStartDopTbl + 3, 6], WorkSheet.Cells.Item[RowStartDopTbl + 3, 6] ].FormulaR1C1Local :=
      '=СЧЕТЕСЛИ(R'+IntToStr(RowStart+GroupACnt+1)+'C1:R'+IntToStr(RowStart+GroupACnt+GroupBCnt-2)+'C1;"V")*100/'+ IntToStr(GroupBRecCnt) ;
      WorkSheet.Range[ WorkSheet.Cells.Item[RowStartDopTbl + 3, 7], WorkSheet.Cells.Item[RowStartDopTbl + 3, 7] ].FormulaR1C1Local :=
      '=СЧЕТЕСЛИ(R'+IntToStr(RowStart+GroupACnt+1)+'C1:R'+IntToStr(RowStart+GroupACnt+GroupBCnt-2)+'C1;"E")*100/'+ IntToStr(GroupBRecCnt) ;
      WorkSheet.Range[ WorkSheet.Cells.Item[RowStartDopTbl + 3, 8], WorkSheet.Cells.Item[RowStartDopTbl + 3, 8] ].FormulaR1C1Local :=
      '=СЧЕТЕСЛИ(R'+IntToStr(RowStart+GroupACnt+1)+'C1:R'+IntToStr(RowStart+GroupACnt+GroupBCnt-2)+'C1;"N")*100/'+ IntToStr(GroupBRecCnt) ;
    end
    else
    begin
      WorkSheet.Cells.Item[RowStartDopTbl + 3, 6] := 0;
      WorkSheet.Cells.Item[RowStartDopTbl + 3, 7] := 0;
      WorkSheet.Cells.Item[RowStartDopTbl + 3, 8] := 0;
    end;

    WorkSheet.Cells.Item[RowStartDopTbl + 4, 3] := 'C';
    WorkSheet.Cells.Item[RowStartDopTbl + 4, 4].FormulaR1C1 := '=R' + IntToStr ( RowStart + GroupACnt + GroupBCnt + GroupCCnt -1 )  + 'C8';
    WorkSheet.Cells.Item[RowStartDopTbl + 4, 5].FormulaR1C1 := '=R' + IntToStr ( RowStart + GroupACnt + GroupBCnt + GroupCCnt -1 )  + 'C7';

    if GroupCRecCnt > 0 then
    begin
      WorkSheet.Range[ WorkSheet.Cells.Item[RowStartDopTbl + 4, 6], WorkSheet.Cells.Item[RowStartDopTbl + 4, 6] ].FormulaR1C1Local :=
      '=СЧЕТЕСЛИ(R'+IntToStr(RowStart+GroupACnt+GroupBCnt+1)+'C1:R'+IntToStr(RowStart+GroupACnt+GroupBCnt+GroupCCnt-2)+'C1;"V")*100/'+ IntToStr(GroupCRecCnt) ;
      WorkSheet.Range[ WorkSheet.Cells.Item[RowStartDopTbl + 4, 7], WorkSheet.Cells.Item[RowStartDopTbl + 4, 7] ].FormulaR1C1Local :=
      '=СЧЕТЕСЛИ(R'+IntToStr(RowStart+GroupACnt+GroupBCnt+1)+'C1:R'+IntToStr(RowStart+GroupACnt+GroupBCnt+GroupCCnt-2)+'C1;"E")*100/'+ IntToStr(GroupCRecCnt) ;
      WorkSheet.Range[ WorkSheet.Cells.Item[RowStartDopTbl + 4, 8], WorkSheet.Cells.Item[RowStartDopTbl + 4, 8] ].FormulaR1C1Local :=
      '=СЧЕТЕСЛИ(R'+IntToStr(RowStart+GroupACnt+GroupBCnt+1)+'C1:R'+IntToStr(RowStart+GroupACnt+GroupBCnt+GroupCCnt-2)+'C1;"N")*100/'+ IntToStr(GroupCRecCnt) ;
    end
    else
    begin
      WorkSheet.Cells.Item[RowStartDopTbl + 4, 6] := 0;
      WorkSheet.Cells.Item[RowStartDopTbl + 4, 7] := 0;
      WorkSheet.Cells.Item[RowStartDopTbl + 4, 8] := 0;
    end;

    WorkSheet.Cells.Item[RowStartDopTbl + 5, 3] := 'Итого:';
    with WorkSheet.Range[ WorkSheet.Cells.Item[RowStartDopTbl + 5, 4], WorkSheet.Cells.Item[RowStartDopTbl + 5, 8] ] do
    begin
      FormulaR1C1 := '=SUM(R[-3]C:R[-1]C)';
    end;

    // стили к итоговой таблице
    with WorkSheet.Range[ WorkSheet.Cells.Item[RowStartDopTbl, 3], WorkSheet.Cells.Item[RowStartDopTbl+5, 8]] do
    begin
      Font.Name := 'Times New Roman';
      Font.Size := 9;
      WrapText := True;
      HorizontalAlignment := xlCenter;
      VerticalAlignment := xlCenter;
      Borders.Item[xlEdgeTop].LineStyle := xlContinuous;
      Borders.Item[xlEdgeTop].Weight := xlThick;
      Borders.Item[xlEdgeBottom].LineStyle := xlContinuous;
      Borders.Item[xlEdgeBottom].Weight := xlThick;
      Borders.Item[xlEdgeLeft].LineStyle := xlContinuous;
      Borders.Item[xlEdgeLeft].Weight := xlThick;
      Borders.Item[xlEdgeRight].LineStyle := xlContinuous;
      Borders.Item[xlEdgeRight].Weight := xlThick;
      Borders.Item[xlInsideHorizontal].LineStyle := xlContinuous;
      Borders.Item[xlInsideHorizontal].Weight := xlThin;
      Borders.Item[xlInsideVertical].LineStyle := xlContinuous;
      Borders.Item[xlInsideVertical].Weight := xlThin;
    end;
    WorkSheet.Range[ WorkSheet.Cells.Item[RowStartDopTbl, 3], WorkSheet.Cells.Item[RowStartDopTbl+1, 8]].Interior.Color := FRColor;
    with WorkSheet.Range[ WorkSheet.Cells.Item[RowStartDopTbl+2, 4], WorkSheet.Cells.Item[RowStartDopTbl+5, 8]] do
    begin
      NumberFormatLocal := '0,00';
      HorizontalAlignment := xlRight;
    end;
/////////// Итоговая таблица с распеределнием по V, E, N (конец)
          
    try
      WorkSheet.PageSetup.Zoom := 90; // масштаб, чтобы по ширине был на 1 страницу
    except
      Application.MessageBox( 'Не удалось установить масштаб документа!', 'Внимание', MB_OK + MB_ICONWARNING );
    end;
    
    // сохраняем отчет
    WorkBk.SaveAs( RepFileName,
        xlWorkbook ,EmptyParam,EmptyParam,EmptyParam,
        EmptyParam, xlNoChange,EmptyParam,EmptyParam,
        EmptyParam,EmptyParam,  0  );     
  except
    on e : Exception do
    begin
      Screen.Cursor := crDefault;
      Application.ShowException( e );
      Exit;
    end;
  end;
  finally
    Screen.Cursor := crDefault;
    Excel.Workbooks.Close(0);  
    Excel.Quit;
    Excel.Disconnect;
    Excel.Free;
  end;
  // открываем отчет
  ShellExecute( 0, PChar('open'), PChar(RepFileName), nil, nil, SW_SHOWMAXIMIZED )  
end;

procedure TfrmGetPeriod.odsMoBeforeOpen(DataSet: TDataSet);
begin
  TOracleDataSet(Dataset).SetVariable('moid',IniReadString(ExtractFilePath(ParamStr(0)) +
      'medica.ini','config','nMatOtvID'));
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  IDs : string;
  i : Integer;
begin

  // учетные группы
  IDs := '';
  for i := 0 to ccbMedType.Properties.Items.Count - 1 do
  begin
    if ccbMedType.States[i] = cbsChecked then
      IDs := IDs + '|'+IntToStr(ccbMedType.Properties.Items[i].Tag);
  end;
  Delete(IDs, 1, 1);
  IniWriteString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastTypeID', IDs);
  // группы МО
  IDs := '';
  for i := 0 to ccbMO_GROUP.Properties.Items.Count - 1 do
  begin
    if ccbMO_GROUP.States[i] = cbsChecked then
      IDs := IDs + '|'+IntToStr(ccbMO_GROUP.Properties.Items[i].Tag);
  end;
  Delete(IDs, 1, 1);
  IniWriteString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastMOGroupID', IDs);

  Action := caFree;
end;

procedure TfrmGetPeriod.btnMoGroupClearClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbMO_GROUP.Properties.Items.Count - 1 do
    ccbMO_GROUP.States[i] := cbsUnChecked;
end;

procedure TfrmGetPeriod.btnMoGroupSelectAllClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ccbMO_GROUP.Properties.Items.Count - 1 do
    ccbMO_GROUP.States[i] := cbsChecked;
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

procedure TfrmGetPeriod.odsUchGrAfterOpen(DataSet: TDataSet);
var
  ChBox : TcxCheckComboBoxItem;
  StrList : TStrings;
  i : Integer;
  sID : string;
begin
  StrList := TStringList.Create;
  StrList.Text := StringToListStr(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastTypeID', '-1'));
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
end;

function TfrmGetPeriod.GetValueFromTSMINI(const aSection, aKey, aDefaultValue: string): string;
begin
  odsTSMINI.Close;
  odsTSMINI.SetVariable('ASECTION', aSection);
  odsTSMINI.SetVariable('AKEY', aKey);
  try
    odsTSMINI.Open;

    if odsTSMINI.RecordCount > 0 then
      Result := odsTSMINI.FieldByName('FC_VALUE').AsString
    else
      Result := aDefaultValue;
    odsTSMINI.Close;
  except
    Result := aDefaultValue;
  end;
end;


end.

