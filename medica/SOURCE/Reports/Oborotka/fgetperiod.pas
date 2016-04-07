unit fgetperiod;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ActnList, ImgList,
  ComCtrls, ToolWin, Db, OracleData, Oracle, //--frxDSet,
  frxClass, frxDBSet,
  DBCtrls, frxDesgn, frOLEExl, frXMLExl, HtmlHlp, JvExMask, JvToolEdit, OracleMonitor,
  JvStringHolder, cxGraphics, Menus, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCheckComboBox, cxCheckBox, Excel2000, dxSkinsCore, dxSkinsDefaultPainters,
  cxGroupBox, frxExportXLS, frxExportXML, frxPreview,fr_class,
  frxExportCSV, frxExportRTF, frxExportODF, frxADOComponents, cxCustomData,
  cxStyles, cxTL, cxInplaceContainer, cxDBTL, cxTLData;

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
    frOborotka_Main: TfrxReport;
    os: TOracleSession;
    odsRep: TOracleDataSet;
    Panel3: TPanel;
    Label3: TLabel;
    frxDesigner1: TfrxDesigner;
    odsOld: TOracleDataSet;
    Panel4: TPanel;
    lbType: TLabel;
    odsUchGr: TOracleDataSet;
    dsUchGr: TDataSource;
    oq: TOracleQuery;
    odsGroupMo: TOracleDataSet;
    dsGroupMo: TDataSource;
    lcbMO_GROUP: TDBLookupComboBox;
    frPrihDoc_Old: TfrxReport;
    JvStrHolder1: TJvStrHolder;
    ccbMedType: TcxCheckComboBox;
    buTypeClear: TcxButton;
    buTypeSelectAll: TcxButton;
    oqInitMO: TOracleQuery;
    gbIstFinans: TcxGroupBox;
    chbUse: TcxCheckBox;
    chbDetails: TcxCheckBox;
    frOborotka_FinSource_Detail2: TfrxReport;
    odsOborotka_FinSource_Detail2: TOracleDataSet;
    frDBOborotka_FinSource: TfrxDBDataset;
    frOborotka_FinSource: TfrxReport;
    frdbdsOborot: TfrxDBDataset;
    odsOborot: TOracleDataSet;
    frOborotka_FinSource_Detail11: TfrxReport;
    cmbDetailType: TcxComboBox;
    frOborotka_FinSource_Detail0: TfrxReport;
    frOborotka_FinSource_Detail1: TfrxReport;
    odsOborotka_FinSource_Detail0: TOracleDataSet;
    frDBdsOborotka_FinSource_Detail0: TfrxDBDataset;
    odsOborotka_FinSource_Detail1: TOracleDataSet;
    frDBdsOborotka_FinSource_Detail1: TfrxDBDataset;
    frxReport1: TfrxReport;
    grbUSE_PARTIES: TcxGroupBox;
    chbUnionParties: TcxCheckBox;
    ToolButton3: TToolButton;
    gbSignature: TcxGroupBox;
    chbSignature: TcxCheckBox;
    frxReport2: TfrxReport;
    tbtFinsourceReplace: TToolButton;
    frxodsGroupMo: TfrxDBDataset;
    frxRTFExport1: TfrxRTFExport;
    frxCSVExport1: TfrxCSVExport;
    frxADOComponents1: TfrxADOComponents;
    frxODTExport1: TfrxODTExport;
    frxODSExport1: TfrxODSExport;
    paOKDP: TPanel;
    Label4: TLabel;
    peOKDP: TcxPopupEdit;
    tlOKDP: TcxDBTreeList;
    tlOKDPFC_NAME: TcxDBTreeListColumn;
    odsOKDP: TOracleDataSet;
    dsOKDP: TDataSource;
    oqTSMINI: TOracleQuery;
    odsParams: TOracleDataSet;
    odsParams1: TOracleDataSet;
    frxodsParams1: TfrxDBDataset;
    TEST: TfrxReport;
    odsMedicType: TOracleDataSet;
    procedure rbAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure ToolBar1DblClick(Sender: TObject);
    procedure lcbCloseUp(Sender: TObject);
    procedure frOborotka_MainGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frOborotka_MainUserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure odsUchGrAfterOpen(DataSet: TDataSet);
    procedure ccbMedTypePropertiesEditValueChanged(Sender: TObject);
    procedure buTypeClearClick(Sender: TObject);
    procedure buTypeSelectAllClick(Sender: TObject);
    procedure frOborotka_FinSource_Detail2MouseOverObject(View: TfrxView );
    procedure frOborotka_FinSource_Detail2ObjectClick(View: TfrxView);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure ccbMedTypePropertiesClickCheck(Sender: TObject;
      ItemIndex: Integer; var AllowToggle: Boolean);
    procedure chbDetaisPropertiesChange(Sender: TObject);
    procedure chbUnionPartiesPropertiesChange(Sender: TObject);
    procedure cmbDetailTypePropertiesChange(Sender: TObject);
    procedure tbtFinsourceReplaceClick(Sender: TObject);
    procedure tlOKDPDblClick(Sender: TObject);
    procedure tlOKDPKeyPress(Sender: TObject; var Key: Char);

  PRIVATE
    { Private declarations }
    IS_GBISTFINANS_VISIBLE:boolean;
    bUseFinsourceColumn :Boolean;
    procedure Load_IS_GBISTFINANS_VISIBLE;
    procedure Load_IS_FINSOURCE_REPLACE_VISIBLE;
    procedure UploadToExcel(ADataSet: TOracleDataSet; ADate1, ADate2: TDateTime; AGrouping: Boolean);
  PUBLIC
    { Public declarations }
    function GetFinsources(var ods : TOracleDataSet): String;
    function READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
  end;          

var
  frmGetPeriod      : TfrmGetPeriod;

implementation

uses fFIOTreb, Variants, IniFiles, fCheckedListEdit, fdmPrintSelect, Math, DateUtils,
  ComObj, uReportParams, uGlobalConst, fr_view, fr_utils, fr_const
    {$IFDEF MIS2}

    {$ELSE}
      {$IFNDEF OLD_AUTH}
      ,SMMainAPI
      {$ENDIF}
    {$ENDIF}
, uGlobal, fFinSourceReplace;

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
function TfrmGetPeriod.GetFinsources(var ods : TOracleDataSet): String;
var
  CurFinSource : string;
begin
  ods.First;
  try
    CurFinSource := '';
    While not ods.Eof do
    begin
      if CurFinSource <> ods.FieldByName('FC_FIN_SOURCE').AsString then
      begin
        Result := Result + ods.FieldByName('FC_FIN_SOURCE').AsString + ',';
        CurFinSource := ods.FieldByName('FC_FIN_SOURCE').AsString;
      end;
      ods.Next;
    end;
    System.Delete(Result,Length(Result),1);
  finally
    ods.First;
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

function TfrmGetPeriod.READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
begin
  with oqTSMINI do
  try
    ClearVariables;
    SetVariable('PSECTION', aFC_SECTION);
    SetVariable('PIDENT',   aFC_KEY);
    SetVariable('PDEFAULT', aFC_DEFAULT_VALUE);
    SetVariable('PVALUE',   null);
    Execute;
    
    Result := nvl( GetVariable('PVALUE'), '');
  except
    Result := aFC_DEFAULT_VALUE;
  end;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var d: integer;
  FK_APPSOTR_ID : Integer;
  UchgridStr : string;
begin
  try
        lcbMO_GROUP.Enabled := True;
    {$IFDEF MIS2}
      os.Preferences.ConvertUTF := cuUTF8ToUTF16;
      os.LogonDatabase := 'MIS2';
      os.LogonUsername := 'MIS';
      os.LogonPassword := '1';
      os.LogOn;
      lcbMO_GROUP.Enabled := True;
    {$ELSE}
      {$IFDEF OLD_AUTH}
        os.LogonDatabase := 'ASU';
        os.LogonUsername := 'ASU';
        os.LogonPassword := 'ASU';
        os.LogOn;
      {$ELSE}
        GetSession(os, 'ASU');
      {$ENDIF}
    {$ENDIF}


    if Application.Terminated then Exit;

//    os.LogOn;
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;
  Load_IS_GBISTFINANS_VISIBLE;
  
  Load_IS_FINSOURCE_REPLACE_VISIBLE;

  bUseFinsourceColumn := ( READSTRING_TSMINI ( 'OBOROTKA.EXE', 'USE_FINSOURCE_COLUMN', '0' )='1' );


  odsOld.SetVariable('SKLAD_NAME', IniReadString(ChangeFileExt(ParamStr(0),'.ini'),'SKLAD','NAME', ''));
  odsOld.open;

  if TryStrToInt(odsOld.FieldByName('M').AsString, d) = False then d := MonthOf(now);
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

  {$IFDEF MIS2}

  {$ELSE}
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;
  {$ENDIF}

  if ( READSTRING_TSMINI ( 'MEDICA.EXE', 'FUNC_USE_OKDP', '0') = '1' )then
  begin
    paOKDP.Visible := true;
    odsOKDP.Open;
  end;

  odsGroupMo.Open;
  lcbMO_GROUP.KeyValue := oqInitMO.GetVariable('nMO_GROUP');
  {$IFDEF MIS2}
  {$ELSE}
  lcbMO_GROUP.Enabled  := (oqInitMO.GetVariable('PFL_PROVIZOR') = 1);
  {$ENDIF}

  odsUchGr.Open;
  Self.Caption := Application.Title;
  ccbMedType.PopupWindow.DoubleBuffered := True;

  chbSignature.Checked := ( READSTRING_TSMINI ( 'CONFIG', 'DB_NAME', 'H' ) = 'NV' );


  // для учета изменения учетных групп FUNC_USE_MEDUCHGRP_CH
  if READSTRING_TSMINI('MEDICA.EXE','FUNC_USE_MEDUCHGRP_CH','0')='1' then

    UchgridStr := 'nvl ( k.UCHGRID, m.UCHGRID )'
  else
    UchgridStr := 'm.UCHGRID';

  with odsOborotka_FinSource_Detail0 do
  begin
    SQL.Text := StringReplace( SQL.Text,'#uchgrid#', UchgridStr, [rfReplaceAll, rfIgnoreCase] );
  end;
  with odsOborotka_FinSource_Detail1 do
  begin
    SQL.Text := StringReplace( SQL.Text,'#uchgrid#', UchgridStr, [rfReplaceAll, rfIgnoreCase] );
  end;
  with odsOborotka_FinSource_Detail2 do
  begin
    SQL.Text := StringReplace( SQL.Text,'#uchgrid#', UchgridStr, [rfReplaceAll, rfIgnoreCase] );
  end;

  JvStrHolder1.CommaText := StringReplace( JvStrHolder1.CommaText,'#uchgrid#', UchgridStr, [rfReplaceAll, rfIgnoreCase] );

end;

procedure TfrmGetPeriod.acApplyExecute(Sender: TObject);
//var frmFIOTreb: TfrmFIOTreb;
var
  i, IDn : Integer;
  IDs, s : string;
  P : TPoint;
  fr:TfrxReport;
  ods:TOracleDataSet;
  frxPreview : TfrxPreview;
  FK_APPSOTR_ID: Integer;
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
    dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати
  if dmPrintSelect.PrintFlag = 0 then Exit;

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
  try
  try
   if (chbUse.Checked and chbDetails.Checked) then
   begin
     case cmbDetailType.ItemIndex of
       1 :  // Кол-во и сумма
       begin
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

         if FileExists('frOborotka_FinSource_Detail1.fr3') then
            frOborotka_FinSource_Detail1.LoadFromFile('frOborotka_FinSource_Detail1.fr3');

         fr:=frOborotka_FinSource_Detail1;
         ods:=odsOborotka_FinSource_Detail1;
       end;
       2 : // Кол-во, цена и сумма
       begin
         if FileExists('frOborotka_FinSource_Detail2.fr3') then
            frOborotka_FinSource_Detail2.LoadFromFile('frOborotka_FinSource_Detail2.fr3');

         fr:=frOborotka_FinSource_Detail2;
         ods:=odsOborotka_FinSource_Detail2;
       end;

       else // Только кол-во
       begin
         if FileExists('frOborotka_FinSource_Detail0.fr3') then
            frOborotka_FinSource_Detail0.LoadFromFile('frOborotka_FinSource_Detail0.fr3');

         fr:=frOborotka_FinSource_Detail0;
         ods:=odsOborotka_FinSource_Detail0;
       end;
     end;

     if IDs <> '' then
       ods.SetVariable('pMedUchGr','  AND ug.uchgrid in('+IDs+')');
//     --                       AND m.uchgrid = ug.UchGrID(+)
//                      :pMedUchGr
   end
   else if chbUse.Checked and (not chbDetails.Checked) then
   begin
     if FileExists('frOborotka_FinSource.fr3') then
       frOborotka_FinSource.LoadFromFile('frOborotka_FinSource.fr3');

     fr:=frOborotka_FinSource;
     ods:=odsOborot;
   end
   else
    begin

     // Добавил Неронов А.С. 10.03.2011
     if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
        FK_APPSOTR_ID := -1;
     // Добавил Неронов А.С. 10.03.2011
     // Если есть права на просмотр нового внешнего вида оборотки, то
     // подгружаем новые шаблоны
     if DO_CHECK_OBJECT_ACCESS(os, FK_APPSOTR_ID,'OBOROTKA_VIEW_MNN') > 0 then begin
       if chbUnionParties.Checked then
       begin
         if FileExists('frOborotka_Main_MNN.fr3') then            // если найден файл
           frOborotka_Main.LoadFromFile('frOborotka_Main_MNN.fr3');  // загружаем его
       end
       else
       begin // с разбиением на партии
         if FileExists('frOborotka_Main_Parties_MNN.fr3') then            // если найден файл
           frOborotka_Main.LoadFromFile('frOborotka_Main_Parties_MNN.fr3');  // загружаем его
       end;
     end
     // Нет прав на новый вид
     else begin
       if chbUnionParties.Checked then
       begin
         if FileExists('frOborotka_Main.fr3') then            // если найден файл
           frOborotka_Main.LoadFromFile('frOborotka_Main.fr3');  // загружаем его
       end
       else
       begin // с разбиением на партии
         if FileExists('frOborotka_Main_Parties.fr3') then               // если найден файл
           frOborotka_Main.LoadFromFile('frOborotka_Main_Parties.fr3');  // загружаем его
       end;
     end;

     fr:=frOborotka_Main;
     ods:=odsRep;
    end;

    if IDn > 0 then // если выбрали типы медикаментов, показываем только их и сортируем по именам типов
    begin
      JvStrHolder1.MacroByName('MedTypes').Value := ' AND ug.UchGrID in (select uchgrid from med.tuchgr connect by prior uchgrid = parentid start with uchgrid in ('+
           IDs +')) ';

      JvStrHolder1.MacroByName('TYPENAME_SORT').Value := ' UPPER (UchGrName), ';

//      odsOborotka_FinSource.SetVariable('pMedTypes',' AND M.UchGrID in (M.UchGrID) ');

//      odsOborotka_FinSource_Detail2.SetVariable('pTYPENAME_SORT',' upper(fc_fin_source), ');

//      odsOborot.SetVariable('pMedTypes',' AND M.UchGrID in (M.UchGrID) ');

//      odsOborot.SetVariable('pTYPENAME_SORT',' upper(fc_fin_source) ');
    end;
    if (paOKDP.Visible) and (peOKDP.Text <> '') then
      ods.SetVariable('OKDP',' AND M.FK_OKDP in (select FK_ID from MED.TSPRAV_OKDP start with FK_ID = '+IntToStr(peOKDP.Tag)+' connect by prior FK_ID = FK_PARENTID) ')
    else
      ods.SetVariable('OKDP', '');

    odsRep.SQL.Text := JvStrHolder1.ExpandMacros;
    // Добавил Неронов А.С. 10.03.2011
    odsRep.DeclareVariable('pMNN_1',otSubst);
    odsRep.DeclareVariable('pMNN_2',otSubst);
    odsRep.DeclareVariable('pMNN_3',otSubst);
    odsRep.DeclareVariable('pMNN_4',otSubst);
    odsRep.DeclareVariable('pMNN_5',otSubst);
    odsRep.DeclareVariable('pMNN_6',otSubst);  
    odsRep.DeclareVariable('pMNN_7',otSubst);
    // Добавил Неронов А.С. 10.03.2011
    // Если есть права на просмотр нового внешнего вида оборотки, то
    // редактируем ODS
    if DO_CHECK_OBJECT_ACCESS(os, FK_APPSOTR_ID,'OBOROTKA_VIEW_MNN') > 0 then begin
      if chbUnionParties.Checked = False then
        odsRep.SetVariable('pMNN_1','b.fc_international_name ||''('' || ''п. ''||b.fn_party_num||'')'' as fc_international_name, b.fc_fedizm, b.fc_dozirovka, b.fc_group_lf, b.fn_fpackinupack, ROUND(MAX(b.fn_priceLAST),2) AS fn_PriceLast,')
      else
        odsRep.SetVariable('pMNN_1','b.fc_international_name, b.fc_fedizm, b.fc_dozirovka, b.fc_group_lf, b.fn_fpackinupack, ROUND(MAX(b.fn_priceLAST),2) AS fn_PriceLast,');

      odsRep.SetVariable('pMNN_2','a.fc_international_name, a.fc_fedizm, a.fc_dozirovka, a.fc_group_lf, a.fn_fpackinupack, max(decode(a.fd_data, a.fd_maxdata, a.fn_price, 0)) as fn_priceLAST,');
      odsRep.SetVariable('pMNN_3','m.fc_international_name, ei.fc_name AS fc_fedizm, m.fc_dozirovka, glf.fc_group_lf, m.fn_fpackinupack, d.FD_DATA, MAX(d.FD_DATA) over(partition by k.medicid) as FD_MAXDATA,');
      odsRep.SetVariable('pMNN_4','med.tei ei, med.tgroup_lf glf,');
      odsRep.SetVariable('pMNN_5','AND m.fk_fpackid = ei.eiid(+) AND m.fk_group_lf = glf.fk_group_lf_id(+) AND m.fc_international_name IS NOT NULL');
      odsRep.SetVariable('pMNN_6','fc_international_name, fc_fedizm, fc_dozirovka, fc_group_lf, fn_fpackinupack,');
      odsRep.SetVariable('pMNN_7','b.fc_international_name, b.fc_fedizm, b.fc_dozirovka, b.fc_group_lf, b.fn_fpackinupack,');
    end;

    if chbUnionParties.Checked = False then
      odsRep.SQL.Text := StringReplace(odsRep.SQL.Text, '-- USE_PARTIES', '', [rfReplaceAll]);

    if bUseFinsourceColumn then
      odsRep.SQL.Text := StringReplace(odsRep.SQL.Text, '--USE_FINSOURCE', '', [rfReplaceAll]);

    if lcbMO_GROUP.KeyValue = -1 then
    begin
      ods.SQL.Text := StringReplace(ods.SQL.Text, '--ALL_MO_GROUP', '', [rfReplaceAll]);
    end
    else
      if Assigned(fr.FindObject('GroupHeaderMoGroup')) then
      begin
        TfrxGroupHeader(fr.FindObject('GroupHeaderMoGroup')).Condition := '1=1';
      end;
    if Assigned(fr.FindObject('GroupHeaderMoGroup')) then
        fr.FindObject('GroupHeaderMoGroup').Visible := lcbMO_GROUP.KeyValue = -1;
    if Assigned(fr.FindObject('GroupFooterMOGroup')) then
        fr.FindObject('GroupFooterMOGroup').Visible := lcbMO_GROUP.KeyValue = -1;

    ods.SetVariable('Date1', dDate1.date);
  //    SetVariable('Date2', trunc(dDate2.date) + 1 - 1/(24*60*60));
    ods.SetVariable('Date2', dDate2.date);
    ods.SetVariable('MOGROUP_ID', lcbMO_GROUP.KeyValue);
  //    odsRep.SetVariable('TMEDICTYPE', lcbType.KeyValue);
    ods.Close;

    ods.Open;
  //  if not VarisNull(lcbType.KeyValue) then
  //  frPrihDoc.Title := 'Оборотная ведомость (' + odsType.FieldByName('FC_NAME').AsString + ')';
    if chbUse.Checked = False then
    begin
      if Assigned(fr.FindObject('GroupHeader1')) then
        fr.FindObject('GroupHeader1').Visible := (IDn > 0);
      if Assigned(fr.FindObject('GroupFooter1')) then
        fr.FindObject('GroupFooter1').Visible := (IDn > 0);
    end;

    Self.Hide;

    odsParams.SetVariable('FK_TMO_GROUP',lcbMO_GROUP.KeyValue);
    odsParams.Open;

    // составитель печатается также и в шапке
    sFamCompiler := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamCompiler', '');
    sJobTitleCompiler := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleCompiler', '');
    DoShowFIOTreb(sFamCompiler, sJobTitleCompiler, 'Ввод данных о составителе');
    IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamCompiler',sFamCompiler);
    IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleCompiler',sJobTitleCompiler);

    odsParams1.SetVariable('JobTitleCompiler',sJobTitleCompiler);
    odsParams1.SetVariable('FamCompiler',sFamCompiler);

//    frPrihDoc.PrepareReport;
    if chbSignature.Checked then // вводим данные в подписи
    begin

      sFamChecker := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamChecker', '');
      sJobTitleChecker := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleChecker', '');
      DoShowFIOTreb(sFamChecker, sJobTitleChecker, 'Ввод данных о проверяющем');
      IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamChecker',sFamChecker);
      IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleChecker',sJobTitleChecker);

      odsParams1.SetVariable('JobTitleChecker',sJobTitleChecker);
      odsParams1.SetVariable('FamChecker',sFamChecker);

      //
      frmFIOTreb := TfrmFIOTreb.Create(Self);
        try
          frmFIOTreb.Caption := 'Ввод данных об утверждающем';
          frmFIOTreb.lbFam.Caption := 'ФИО';
          frmFIOTreb.edFam.Text := IniReadString(ChangeFileExt(ParamStr(0),'.ini'),'UTVERJDAU','FIO','');
          frmFIOTreb.lbJobTitle.Caption := 'Должность';
          frmFIOTreb.edJobTitle.Text := IniReadString(ChangeFileExt(ParamStr(0),'.ini'),'UTVERJDAU','DOLJNOST','');

          if frmFIOTreb.ShowModal = mrCancel then Exit;
    //      if frmFIOTreb.cbDontShow.Checked and (Application.MessageBox('Вы уверены что не хотите больше выводить это окно?',
    //        'Внимание', mb_yesno + mb_iconquestion + mb_defbutton2) = idyes) then
    //        IniWriteString(ChangeFileExt(ParamStr(0),'.ini'),'Otdel','bShow','0');
          odsParams1.SetVariable('UTVERJDAU_FIO',frmFIOTreb.edFam.Text);
          odsParams1.SetVariable('UTVERJDAU_DOLJNOST',frmFIOTreb.edJobTitle.Text);
          IniWriteString(ChangeFileExt(ParamStr(0),'.ini'),'UTVERJDAU','FIO',frmFIOTreb.edFam.Text);
          IniWriteString(ChangeFileExt(ParamStr(0),'.ini'),'UTVERJDAU','DOLJNOST',frmFIOTreb.edJobTitle.Text);
        finally
          frmFIOTreb.Free;
        end;
    end;

    if chbSignature.Checked AND (fr.FindObject('mSignatures') <> nil) then begin
       if fr.FindObject('mOLDSignatures') <> nil then
         fr.FindObject('mOLDSignatures').Visible := false;
       if fr.FindObject('mSignatures') <> nil then
         fr.FindObject('mSignatures').Visible := true;
       if fr.FindObject('mSignaturesRes') <> nil then
         fr.FindObject('mSignaturesRes').Visible := true;
    end;

    odsParams1.SetVariable('Date1',dDate1.date);
    odsParams1.SetVariable('Date2',dDate2.date);
    odsParams1.SetVariable('FK_TMO_GROUP',lcbMO_GROUP.KeyValue);
    odsParams1.SetVariable('MOID', oqInitMO.GetVariable('NMOID'));

    odsParams1.Open;


    case dmPrintSelect.PrintFlag of // флаг куда печатать
//      1: ExportFRToExcel( frPrihDoc, 'Оборотная ведомость по подотчетному лицу с '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls' );
      1:
      begin
      if (IS_GBISTFINANS_VISIBLE)and(chbUse.Checked) then
      begin
        fr.FindObject('PageFooter1').Visible := FAlse;
        if Assigned(fr.FindObject('PageHeader1')) then
           fr.FindObject('PageHeader1').Visible := FAlse;

        if chbUse.Checked and chbDetails.Checked then
        begin
          if Assigned ( fr.FindObject('Band1') ) and
            ( fr.FindObject('Band1') is TfrxGroupHeader ) then
            ( fr.FindObject('Band1') as TfrxGroupHeader ).ReprintOnNewPage := false;

          if Assigned (fr.FindObject('MasterHeader1')) and
            ( fr.FindObject('MasterHeader1') is TfrxHeader ) then
            (fr.FindObject('MasterHeader1') as TfrxHeader).ReprintOnNewPage := False;
        end;

        dmPrintSelect.frxXLSExport1.PageBreaks:=false;

        fr.PrepareReport;
        ExportFRToExcel(fr, 'Оборотка по ист. фин. '+' (c '+dDate1.Text+ ' по '+dDate2.Text+').xls' );
      end
      else
      begin
        fr.FindObject('PageFooter1').Visible := FAlse;
        if Assigned (fr.FindObject('MasterHeader1')) and
          ( fr.FindObject('MasterHeader1') is TfrxHeader ) then
        begin
          (fr.FindObject('MasterHeader1') as TfrxHeader).ReprintOnNewPage := False;
        end;
        dmPrintSelect.frxXLSExport1.PageBreaks:=false;
        fr.PrepareReport;
        ExportFRToExcel(fr, 'Оборотка '+' (c '+dDate1.Text+ ' по '+dDate2.Text+').xls' );
      end;
      end;
      2:
      begin
        
        fr.PrepareReport;
        {if (IS_GBISTFINANS_VISIBLE)and(chbUse.Checked) then
        begin
          frxPreview := TfrxPreview.Create(fr);

//          CurReport := fr;
//          MasterReport := fr;


          DocMode := dmPrinting;
          CurBand := nil;
//          if fr.EMFPages.Count = 0 then Exit;
          //s := frLoadStr(SPreview);
//          if fr.Title <> '' then s := s + ' - ' + fr.Title;


//          frxPreview.Caption := s;
          fr.Preview := frxPreview;

//          fr.ShowModal;
          Application.ProcessMessages;
//          fr.Preview.Window := nil;
        end    
        else }
          fr.ShowPreparedReport;
      end;
    end;
  except
    on e : Exception do
    begin
      Application.MessageBox ( PAnsiChar('Ошибка при формировании отчета!' + #13#10 + e.Message ), 'Ошибка', MB_OK + MB_ICONERROR ) ;
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

procedure TfrmGetPeriod.ToolBar1DblClick(Sender: TObject);
begin
//  frPrihDoc.DesignReport;
end;

procedure TfrmGetPeriod.tbtFinsourceReplaceClick(Sender: TObject);
begin
  Application.CreateForm(TfrmFinSourceReplace, frmFinSourceReplace);
  frmFinSourceReplace.ShowModal;
  frmFinSourceReplace.Free;
end;

procedure TfrmGetPeriod.tlOKDPDblClick(Sender: TObject);
begin
  peOKDP.Text := odsOKDP.FieldByName('FC_NAME').AsString;
  peOKDP.Tag := odsOKDP.FieldByName('FK_ID').AsInteger;
  peOKDP.PopupWindow.CloseUp;
end;

procedure TfrmGetPeriod.tlOKDPKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = CHR(VK_RETURN) then
  begin
    peOKDP.Text := odsOKDP.FieldByName('FC_NAME').AsString;
    peOKDP.Tag := odsOKDP.FieldByName('FK_ID').AsInteger;
    peOKDP.PopupWindow.CloseUp;
  end;
end;

procedure TfrmGetPeriod.lcbCloseUp(Sender: TObject);
begin
  acApply.Enabled := (lcbMO_GROUP.Text <> '');// and (ccbMedType.Text <> 'Не выбрано');//(lcbType.Text <> ''); // если без типа, то группировку скрываем
end;

procedure TfrmGetPeriod.frOborotka_FinSource_Detail2MouseOverObject( View: TfrxView );
begin
  if (View.Name = 'mMol') or (View.Name = 'mOtchChecked') then
    Cursor := crHandPoint;
end;

procedure TfrmGetPeriod.frOborotka_FinSource_Detail2ObjectClick(
  View: TfrxView);
var
s:string;
vPos:integer;
begin
  if (View.Name = 'mMol') or (View.Name = 'mOtchChecked') then
  begin
//    View.Frame.Typ := 15;
    View.Frame.Color := clRed;


//    vPos := frOborotka_FinSource_Detail2.Preview.Window.VScrollBar.Position;
//    frOborotka_FinSource_Detail2.Preview.Zoom := frOborotka_FinSource_Detail2.Preview.Zoom; //дабы перерисовался отчет
//    frOborotka_FinSource_Detail2.Preview.Window.VScrollBar.Position := vPos;

    frOborotka_FinSource_Detail2.Preview.Repaint;

    if View.Name = 'mMol' then
     s:='Введите наименование МОЛ'
    else if View.Name = 'mOtchChecked' then
     s:='Введите фамилию проверившего отчет';

    TfrxMemoView(View).Memo.Text := InputBox(s,'', StringReplace(TfrxMemoView(View).Memo.Text, #13#10, '',[rfReplaceAll]));
    IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'frOborotka_FinSource_Detail',View.Name,TfrxMemoView(View).Memo.Text);
//    View.Frame.Typ := 2;
    View.Frame.Color := clBlack;
//    vPos := frOborotka_FinSource_Detail2.Preview.Window.VScrollBar.Position;
//    frOborotka_FinSource_Detail2.Preview.Zoom := frOborotka_FinSource_Detail2.Preview.Zoom; //дабы перерисовался отчет
//    frOborotka_FinSource_Detail2.Preview.Window.VScrollBar.Position := vPos;
    frOborotka_FinSource_Detail2.Preview.Repaint;
  end;
end;

procedure TfrmGetPeriod.frOborotka_MainGetValue(const ParName: String;
  var ParValue: Variant);
var i:Integer;
begin
  if ParName = 'Date1' then ParValue := DateTimeToStr(dDate1.Date);
  if ParName = 'Date2' then ParValue := DateTimeToStr(dDate2.Date);
  //заполнение переменных о составителе и о проверяющем

  if ParName = 'FamCompiler' then
  begin
//    sFamCompiler := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamCompiler', '');
//    sJobTitleCompiler := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleCompiler', '');
//    if chbSignature.Checked AND (sFamCompiler = '') then begin
//      DoShowFIOTreb(sFamCompiler, sJobTitleCompiler, 'Ввод данных о составителе');
//      IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamCompiler',sFamCompiler);
//      IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleCompiler',sJobTitleCompiler);
//    end;
//    ParValue := sFamCompiler;
    ParValue := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamCompiler', '');
  end;

  if ParName = 'JobTitleCompiler' then
  begin
//    sFamCompiler := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamCompiler', '');
//    sJobTitleCompiler := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleCompiler', '');
//    if chbSignature.Checked AND (sJobTitleCompiler = '') then begin
//      DoShowFIOTreb(sFamCompiler, sJobTitleCompiler, 'Ввод данных о составителе');
//      IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamCompiler',sFamCompiler);
//      IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleCompiler',sJobTitleCompiler);
//    end;
//    ParValue := sJobTitleCompiler;
    ParValue := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleCompiler', '');
  end;

  if ParName = 'FamChecker' then
  begin
//    sFamChecker := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamChecker', '');
//    sJobTitleChecker := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleChecker', '');
//    if chbSignature.Checked AND (sFamChecker = '') then begin
//      DoShowFIOTreb(sFamChecker, sJobTitleChecker, 'Ввод данных о проверяющем');
//      IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamChecker',sFamChecker);
//      IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleChecker',sJobTitleChecker);
//    end;
//    ParValue := sFamChecker;
    ParValue := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamChecker', '');
  end;

  if ParName = 'JobTitleChecker' then
  begin
//    sFamChecker := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamChecker', '');
//    sJobTitleChecker := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleChecker', '');
//    if chbSignature.Checked AND (sJobTitleChecker = '') then begin
//      DoShowFIOTreb(sFamChecker, sJobTitleChecker, 'Ввод данных о проверяющем');
//      IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'signature','sFamChecker',sFamChecker);
//      IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleChecker',sJobTitleChecker);
//    end;
//    ParValue := sJobTitleChecker;
    ParValue := IniReadString(ChangeFileExt(paramstr(0),'.ini'),'signature','sJobTitleChecker', '');
  end;

  if ParName = 'var_finsources' then
  begin
    if (chbUse.Checked and chbDetails.Checked) then
    begin
      case cmbDetailType.ItemIndex of
         1 :
         begin
           ParValue := GetFinsources( odsOborotka_FinSource_Detail1 );
         end;
         2 :
         begin
           ParValue := GetFinsources( odsOborotka_FinSource_Detail2 );
         end;
         else
         begin
           ParValue := GetFinsources( odsOborotka_FinSource_Detail0 );
         end;
      end;

    end
    else 
    begin
      ParValue := '';
    end;
  end;

  if ParName = 'var_uchgr' then
  begin
    ParValue := ccbMedType.Text;
  end;

  if ParName = 'FC_MO' then
  begin
    ParValue := oqInitMO.GetVariable('PFC_MO');
  end;                                                                 

  if ParName = 'var_receiver' then
  begin
    ParValue := READSTRING_TSMINI ( 'MANAGER_DOC', 'CLIENT_NAME', '' );
  end;

  if parname='mMol' then parvalue:= InireadString(ChangeFileExt(paramstr(0),'.ini'),'frOborotka_FinSource_Detail','mMol','0');
  if parname='mOtchChecked' then parvalue:= InireadString(ChangeFileExt(paramstr(0),'.ini'),'frOborotka_FinSource_Detail','mOtchChecked','0');
  if ParName = 'MEDOTRADE_SIGN' then ParValue := ReadMedotradeSign;

  if ParName = 'SKLAD_NAME' then
  begin
    ParValue := READSTRING_TSMINI ( 'MANAGER_DOC', 'CLIENT_NAME_APTEKA', '' );
  end;

  if ParName = 'zav_fio' then
  begin
    ParValue := IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'zav_fio', odsParams.FieldByName('zav_fio').AsString);
  end;

  if ParName = 'FC_SMSTITLE' then // для грёбаной нягани, погрязщей в старом дерьме
  begin
    i := 0;
    while (i < ccbMedType.Properties.Items.count)and(ccbMedType.States[i] <> cbsChecked) do
      inc( i );

    odsMedicType.Close;
    odsMedicType.Open;
    if (i < ccbMedType.Properties.Items.count)and(odsMedicType.Locate('fk_id', ccbMedType.Properties.Items[i].Tag, [])) then
      ParValue := odsMedicType.FieldByName('FC_SMSTITLE').AsString
    else
      ParValue := '';
    odsMedicType.Close;
  end;

  if ParName = 'OTDELENIE' then
  begin
    ParValue := IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'OTDELENIE', odsParams1.FieldByName('OTDELENIE').AsString);
  end;

end;

procedure TfrmGetPeriod.frOborotka_MainUserFunction(const Name: String; p1, p2,
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
  lcbMO_GROUP.KeyValue := StrToInt(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastMOGroupID', '-1'));
  lcbCloseUp(nil);
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

  lcbCloseUp(nil);
//  lcbType.KeyValue := StrToInt(IniReadString(Application.ExeName+'.ini','Params', 'lcbType', '-1'));
//  lcbCloseUp(nil);
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;  var Action: TCloseAction);
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
  Action := caFree;
end;

procedure TfrmGetPeriod.ccbMedTypePropertiesClickCheck(Sender: TObject;
  ItemIndex: Integer; var AllowToggle: Boolean);
var
i:integer;
begin
if not chbUse.Checked then
 exit;

for i := 0 to ccbMedType.Properties.Items.count-1 do
 begin
  if ccbMedType.States[i] = cbsChecked then
   begin
    if i<>ItemIndex then
     BEGIN
      ccbMedType.States[i] := cbsUnChecked;
     END
    else
     ccbMedType.States[i] := cbsChecked;
   end;
 end;

 ccbMedType.PopupWindow.hide;
 ccbMedType.PopupWindow.show;
//sendMessage(ccbMedType.PopupWindow.Handle,WM_SETREDRAW,-1,0);
//application.processmessages;
end;

procedure TfrmGetPeriod.ccbMedTypePropertiesEditValueChanged(
  Sender: TObject);
begin
  lcbCloseUp( nil );
end;

procedure TfrmGetPeriod.chbDetaisPropertiesChange(Sender: TObject);
begin
  IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'gbIstFinans','chbDetails',BoolToStr(chbDetails.Checked));
end;

procedure TfrmGetPeriod.chbUnionPartiesPropertiesChange(Sender: TObject);
begin
  IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'grbUSE_PARTIES','chbUnionParties', BoolToStr(chbUnionParties.Checked));
end;

procedure TfrmGetPeriod.cmbDetailTypePropertiesChange(Sender: TObject);
begin
  IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'gbIstFinans','cmbDetailType', IntToStr(cmbDetailType.ItemIndex));
end;

procedure TfrmGetPeriod.cxCheckBox1PropertiesChange(Sender: TObject);
var
i:integer;
begin
//  if IS_GBISTFINANS_VISIBLE then
//    ccbMedType.Enabled := (not chbUse.Checked);

  chbDetails.Enabled    := chbUse.Checked;
  cmbDetailType.Enabled := chbUse.Checked;

  {gbSignature.Visible := not chbUse.Checked;
  if chbUse.Checked then begin
    chbSignature.Checked := false;
    Self.Width := Self.Width - gbSignature.Width;
  end
  else begin
    Self.Width := Self.Width + gbSignature.Width;
  end;  }

  IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'gbIstFinans','chbUse',BoolToStr(chbUse.Checked));
  IniWriteString(ChangeFileExt(paramstr(0),'.ini'),'gbIstFinans','chbDetails',BoolToStr(chbDetails.Checked));

//  if not chbUse.Checked then
//   for i := 0 to ccbMedType.Properties.Items.count-1 do
//    ccbMedType.States[i]:=cbsUnchecked;
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

procedure TfrmGetPeriod.UploadToExcel(ADataSet: TOracleDataSet; ADate1, ADate2: TDateTime; AGrouping: Boolean);

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

 function GetGroupRow(AText: String): String;
 begin
  Result:=
  '<tr height=17 style=''mso-height-source:userset;height:12.75pt''>'+
  ' <td height=17 class=xl2625220 width=1 style=''height:12.75pt;width:1pt''> </td>'+
  ' <td class=xl4725220 width=29 style=''width:22pt''> </td>'+
  ' <td colspan=10 class=xl5125220 width=893 style=''border-right:.5pt solid black;'+
  ' border-left:none;width:670pt''>'+AText+'</td>'+
  '</tr>';
 end;

 function GetRow(A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11: String): String;
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
  '<tr height=17 style=''mso-height-source:userset;height:12.75pt''>'+
  ' <td height=17 class=xl3225220 style=''height:12.75pt''></td>'+
  ' <td class=xl4825220>'+A1+'</td>'+
  ' <td class=xl4325220 width=264 style=''border-left:none;width:198pt''>'+A2+'</td>'+
  ' <td class=xl4425220 style=''border-left:none''>'+A3+'</td>'+
  ' <td class=xl4525220 width=68 style=''border-left:none;width:51pt''>'+A4+'</td>'+
  ' <td class=xl4625220 style=''border-left:none''>'+A5+'</td>'+
  ' <td class=xl4625220 style=''border-left:none''>'+A6+'</td>'+
  ' <td class=xl4625220 style=''border-left:none''>'+A7+'</td>'+
  ' <td class=xl4625220 style=''border-left:none''>'+A8+'</td>'+
  ' <td class=xl4625220 style=''border-left:none''>'+A9+'</td>'+
  ' <td class=xl4625220 style=''border-left:none''>'+A10+'</td>'+
  ' <td class=xl4625220 style=''border-left:none''>'+A11+'</td>'+
  '</tr>';
 end;

 function GetSum(A1, A2, A3, A4: String): String;
 begin
  if A1='' then A1:=' ';
  if A2='' then A2:=' ';
  if A3='' then A3:=' ';
  if A4='' then A4:=' ';

  Result:=
  '<tr height=17 style=''mso-height-source:userset;height:12.75pt''>'+
  ' <td height=17 class=xl3425220 style=''height:12.75pt''></td>'+
  ' <td class=xl3525220 style=''border-top:none''> </td>'+
  ' <td class=xl3725220 style=''border-top:none''> </td>'+
  ' <td class=xl3625220 style=''border-top:none''> </td>'+
  ' <td class=xl3625220 style=''border-top:none''> </td>'+
  ' <td class=xl3725220 style=''border-top:none''>'+A1+'</td>'+
  ' <td class=xl3625220 style=''border-top:none''> </td>'+
  ' <td class=xl3725220 style=''border-top:none''>'+A2+'</td>'+
  ' <td class=xl3825220 style=''border-top:none''> </td>'+
  ' <td class=xl3725220 style=''border-top:none''>'+A3+'</td>'+
  ' <td class=xl3625220 style=''border-top:none''> </td>'+
  ' <td class=xl3925220 style=''border-top:none''>'+A4+'</td>'+
  '</tr>';
 end;

 function GetItogo(A1, A2, A3, A4: String): String;
 begin
  if A1='' then A1:=' ';
  if A2='' then A2:=' ';
  if A3='' then A3:=' ';
  if A4='' then A4:=' ';

  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td height=17 class=xl1525220 style=''height:12.75pt''></td>'+
  ' <td class=xl1525220></td>'+
  ' <td class=xl4925220>Итого :</td>'+
  ' <td class=xl2525220></td>'+
  ' <td colspan=2 class=xl4025220>'+A1+'</td>'+
  ' <td colspan=2 class=xl4025220>'+A2+'</td>'+
  ' <td colspan=2 class=xl4025220>'+A3+'</td>'+
  ' <td colspan=2 class=xl4025220>'+A4+'</td>'+
  '</tr>'
 end;

var
 S, sGroup: String;
 N, nCount: Integer;
 sFileName1, sFileName2: String;
 Excel: Variant;
 nS1, nS2, nS3, nS4: Currency;
 nI1, nI2, nI3, nI4: Currency;
begin
 Screen.Cursor:=crHourGlass;

 S:='';
 sGroup:='';
 N:=0;
 nS1:=0; nS2:=0; nS3:=0; nS4:=0;
 nI1:=0; nI2:=0; nI3:=0; nI4:=0;
 nCount:=0;

 with ADataSet do begin
  if Active then Close;
  Open; First;
  while not Eof do begin
   if (FieldByName('UCHGRNAME').AsString<>sGroup) and AGrouping then begin
    if S<>'' then begin
     S:=S+#13#10+GetSum(CurrToStrF(nS1, ffNumber, 2), CurrToStrF(nS2, ffNumber, 2), CurrToStrF(nS3, ffNumber, 2), CurrToStrF(nS4, ffNumber, 2));
     nS1:=0; nS2:=0; nS3:=0; nS4:=0;
     Inc(nCount);
    end;

    sGroup:=FieldByName('UCHGRNAME').AsString;
    S:=S+#13#10+GetGroupRow(sGroup);
    Inc(nCount);

    N:=0;
   end;

   Inc(N);
   S:=S+#13#10+GetRow(IntToStr(N),
                      FieldByName('fc_longname').AsString,
                      FieldByName('fc_edizm').AsString,
                      FieldByName('fc_kolostbegin').AsString,
                      CurrToStrF(FieldByName('fn_sumostbegin').AsCurrency, ffNumber, 2),
                      FieldByName('fc_kolprih').AsString,
                      CurrToStrF(FieldByName('fn_sumprih').AsCurrency, ffNumber, 2),
                      FieldByName('fc_kolrash').AsString,
                      CurrToStrF(FieldByName('fn_sumrash').AsCurrency, ffNumber, 2),
                      FieldByName('fc_kolostend').AsString,
                      CurrToStrF(FieldByName('fn_sumostend').AsCurrency, ffNumber, 2));
   Inc(nCount);

   nS1:=nS1+FieldByName('fn_sumostbegin').AsCurrency;
   nS2:=nS2+FieldByName('fn_sumprih').AsCurrency;
   nS3:=nS3+FieldByName('fn_sumrash').AsCurrency;
   nS4:=nS4+FieldByName('fn_sumostend').AsCurrency;
   nI1:=nI1+FieldByName('fn_sumostbegin').AsCurrency;
   nI2:=nI2+FieldByName('fn_sumprih').AsCurrency;
   nI3:=nI3+FieldByName('fn_sumrash').AsCurrency;
   nI4:=nI4+FieldByName('fn_sumostend').AsCurrency;

   Next;
  end;
  Close;

  S:=S+#13#10+GetItogo(CurrToStrF(nI1, ffNumber, 2), CurrToStrF(nI2, ffNumber, 2), CurrToStrF(nI3, ffNumber, 2), CurrToStrF(nI4, ffNumber, 2));
  Inc(nCount);
 end;

 sFileName1:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'shablon.htm';
 SaveResToFile('shablon', 'HTML', sFileName1);
 sFileName2:= PrepareFilePath('Оборотка (c '+dDate1.Text+ ' по '+dDate2.Text+').htm');
// IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'done.htm';

 with TStringList.Create do begin
  LoadFromFile(sFileName1);
  Text:=StringReplace(Text, '::REPLACEHERE::', S, [rfIgnoreCase]);
  Text:=StringReplace(Text, '::Otdelenie::',   odsGroupMo.FieldByName('FC_GROUP').AsString,        [rfIgnoreCase]);
  Text:=StringReplace(Text, ':PDATE1', DateToStr(ADate1), [rfIgnoreCase]);
  Text:=StringReplace(Text, ':PDATE2', DateToStr(ADate2), [rfIgnoreCase]);
  try
    SaveToFile(sFileName2);
  except
    ;
  end;
  Free;
 end;

 Excel:=CreateOleObject('Excel.Application');
 Excel.Workbooks.Open(sFileName2);
 Excel.Rows['11:'+IntToStr(nCount)].EntireRow.AutoFit;
 Excel.ActiveSheet.PageSetup.PrintTitleRows:='$8:$9';
 Excel.ActiveSheet.PageSetup.Orientation:=xlLandscape;
 Excel.ActiveSheet.PageSetup.LeftMargin := 57;
 Excel.ActiveSheet.PageSetup.RightMargin := 27;
 Excel.ActiveSheet.PageSetup.TopMargin := 27;
 Excel.ActiveSheet.PageSetup.BottomMargin := 27;
 Excel.ActiveSheet.PageSetup.FooterMargin := Excel.ActiveSheet.PageSetup.BottomMargin - 7;
 Excel.ActiveSheet.PageSetup.LeftFooter := '&"Arial,обычный"&7' + ReadMedotradeSign;
 Excel.Visible:=True;

 Screen.Cursor:=crDefault;
end;

procedure TfrmGetPeriod.Load_IS_FINSOURCE_REPLACE_VISIBLE;
begin                                                     
  tbtFinsourceReplace.visible := ( READSTRING_TSMINI ( 'OBOROTKA.EXE', 'IS_FINSOURCE_REPLACE_VISIBLE', '0' )  ='1');

  if not tbtFinsourceReplace.visible then
    Self.Width := Self.Width - tbtFinsourceReplace.Width;

  ToolBar1.Invalidate;
  ToolBar1.Repaint;

  oq.free;
end;

procedure TfrmGetPeriod.Load_IS_GBISTFINANS_VISIBLE;
begin
  IS_GBISTFINANS_VISIBLE := ( READSTRING_TSMINI ( 'OBOROTKA.EXE', 'IS_GBISTFINANS_VISIBLE', '0' ) ='1');

  gbIstFinans.Visible:=IS_GBISTFINANS_VISIBLE;
  grbUSE_PARTIES.Visible := not gbIstFinans.Visible;

//  if gbIstFinans.Visible = False then
//    Self.Width := Self.Width - gbIstFinans.Width;

  Self.Width := Self.Width - grbUSE_PARTIES.Width;

  ToolBar1.Invalidate;
  ToolBar1.Repaint;

  if IS_GBISTFINANS_VISIBLE then
  begin
    chbDetails.Checked:=strtobool(IniReadString(ChangeFileExt(paramstr(0),'.ini'),'gbIstFinans','chbDetails','0'));
    chbUse.Checked:=strtobool(IniReadString(ChangeFileExt(paramstr(0),'.ini'),'gbIstFinans','chbUse','0'));
    cmbDetailType.ItemIndex := StrToInt(IniReadString(ChangeFileExt(paramstr(0),'.ini'),'gbIstFinans','cmbDetailType','0'));
  end
  else
  begin
    chbUse.Checked:=IS_GBISTFINANS_VISIBLE;
    chbDetails.Checked:=IS_GBISTFINANS_VISIBLE;
  end;

  chbUnionParties.Checked:=strtobool(IniReadString(ChangeFileExt(paramstr(0),'.ini'),'grbUSE_PARTIES','chbUnionParties','1'));   
  oq.free;
end;

end.

