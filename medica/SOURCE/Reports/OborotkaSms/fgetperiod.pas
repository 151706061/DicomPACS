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
  DBCtrls, frxDesgn, frOLEExl, frXMLExl, JvExMask, JvToolEdit,
  JvComponentBase, JvFormPlacement, cxGraphics, Menus,
  cxLookAndFeelPainters, cxButtons, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckComboBox, cxCheckBox,
  dxSkinsCore, dxSkinsDefaultPainters, cxGroupBox, frxExportXLS, frxExportXML, frxPreview;

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
    frPrihDoc_: TfrxReport;
    os: TOracleSession;
    Panel3: TPanel;
    Label3: TLabel;
    frxDesigner: TfrxDesigner;
    ods: TOracleDataSet;
    odsM: TStringField;
    odsParams: TOracleDataSet;
    frxXMLExport1: TfrxXMLExport;
    frxXLSExport1: TfrxXLSExport;
    odsRep: TOracleDataSet;
    paEdizm: TPanel;
    rbUp: TRadioButton;
    rbFas: TRadioButton;
    FormStorage: TJvFormStorage;
    odsGroupMo: TOracleDataSet;
    odsGroupMoGROUPID: TFloatField;
    odsGroupMoFC_GROUP: TStringField;
    odsGroupMoFL_DEL: TFloatField;
    dsGroupMo: TDataSource;
    lcbMO_GROUP: TDBLookupComboBox;
    frPrihDoc_Old: TfrxReport;
    Panel5: TPanel;
    Label4: TLabel;
    ccbMedType: TcxCheckComboBox;
    buTypeClear: TcxButton;
    buTypeSelectAll: TcxButton;
    odsUchGr: TOracleDataSet;
    dsUchGr: TDataSource;
    frPrihDoc: TfrxReport;
    oqInitMO: TOracleQuery;
    oqTSMINI: TOracleQuery;
    odsRep_FinSource: TOracleDataSet;
    odsMedicType: TOracleDataSet;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxDBodsParams: TfrxDBDataset;
    frxDBodsMedicType: TfrxDBDataset;
    procedure rbAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure ToolBar1DblClick(Sender: TObject);
    procedure lcbCloseUp(Sender: TObject);
    procedure frPrihDoc_GetValue(const ParName: String;
      var ParValue: Variant);
    procedure odsMoBeforeOpen(DataSet: TDataSet);
    procedure frPrihDoc_ObjectClick(View: TfrxView);
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buTypeClearClick(Sender: TObject);
    procedure buTypeSelectAllClick(Sender: TObject);
    procedure odsUchGrAfterOpen(DataSet: TDataSet);
    procedure ccbMedTypePropertiesEditValueChanged(Sender: TObject);
    procedure ccbMedTypePropertiesClickCheck(Sender: TObject;
      ItemIndex: Integer; var AllowToggle: Boolean);
    procedure frPrihDoc_MouseOverObject(Sender: TfrxView);
    function frPrihDoc_UserFunction(const MethodName: string;
      var Params: Variant): Variant;

  PRIVATE
    { Private declarations }
    procedure UploadToExcel(ADataSet: TOracleDataSet; ADate1, ADate2: TDateTime; AGrouping: Boolean; aFileName : string);
    function GetValueFromTSMini ( ASection, AIdent, ADefaultValue : string ) : string;
  PUBLIC
    { Public declarations }
    USE_FIN_SOURCE : boolean;
    USE_ONLY_1_UCHGR : boolean;
  end;

var
  frmGetPeriod      : TfrmGetPeriod;

implementation

uses fFIOTreb, inifiles, fDateInput, FR_View, FR_Utils, Fr_Const, 
  fdmPrintSelect, fCheckedListEdit, Math, Excel2000,
  Variants, ComObj, uGlobalConst, SMMainAPI;
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

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var d, FK_APPSOTR_ID: integer;
begin
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

  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;

  USE_FIN_SOURCE :=  ( GetValueFromTSMini ( 'OBOROTKASMS.EXE', 'USE_FIN_SOURCE', '0' )  ='1');

  if USE_FIN_SOURCE then
  begin
    odsRep.SQL.Text := odsRep_FinSource.SQL.Text;
  end;

  USE_ONLY_1_UCHGR := ( GetValueFromTSMini ( 'OBOROTKASMS.EXE', 'USE_ONLY_1_UCHGR', '0' ) ='1');

  odsGroupMo.Open;
  lcbMO_GROUP.KeyValue := oqInitMO.GetVariable('nMO_GROUP');
//  lcbMO_GROUP.Enabled  := (oqInitMO.GetVariable('PFL_PROVIZOR') = 1);

//  lcb.KeyValue := odsMo.FieldByName('moid').AsInteger;
  odsUchGr.Open;
//  odsType.Open;
  Self.Caption := Application.Title;
end;

procedure TfrmGetPeriod.acApplyExecute(Sender: TObject);
//var frmFIOTreb: TfrmFIOTreb;
var p : TfrxPreview;
    s : String;
    P1 : TPoint;
  i, IDn : Integer;
  IDs : string;
  UchgridStr : string;
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

  if GetValueFromTSMini ('MEDICA.EXE','FUNC_USE_MEDUCHGRP_CH','0') = '1' then
    UchgridStr :=  'nvl ( k.UCHGRID, m.UCHGRID)'
  else
    UchgridStr := 'm.UCHGRID';

  odsRep.SQL.Text := StringReplace(odsRep.SQL.Text,'#uchgrid#', UchgridStr, [rfReplaceAll, rfIgnoreCase] );


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

    if IDn > 0 then // если выбрали типы медикаментов, показываем только их и сортируем по именам типов
    begin
//      JvStrHolder1.MacroByName('MedTypes').Value := ' AND M.UCHGRID in ('+IDs+') ';
      odsRep.SetVariable('UchGroups', ' AND ' + UchgridStr + ' in ('+IDs+') ');
//      odsRep.SQL.Text := StringReplace(odsRep.SQL.Text, '--%UchGroups', ' AND m.UCHGRID in ('+IDs+') ', [rfReplaceAll, rfIgnoreCase]);
    end;

  try
  //ввод данных об Отделении
//    if ((GetKeyState(VK_SHIFT) and $8000) <> 0) or //зажата клавиша шифт
//     (IniReadString(ChangeFileExt(ParamStr(0),'.ini'),'Otdel','bShow','1') = '1') then
//    begin
//      frmFIOTreb := TfrmFIOTreb.Create(Self);
//      try
//        frmFIOTreb.Caption := 'Ввод данных об отделении';
//        frmFIOTreb.lbFam.Caption := 'Отделение';
//        frmFIOTreb.edFam.Text := IniReadString(ChangeFileExt(ParamStr(0),'.ini'),'Otdel','Otdelenie');
//        frmFIOTreb.edJobTitle.Visible := False;
//        frmFIOTreb.lbJobTitle.Visible := frmFIOTreb.edJobTitle.Visible;
//        frmFIOTreb.cbDontShow.Top := frmFIOTreb.lbJobTitle.Top;
//        frmFIOTreb.Height := 140;
//        if frmFIOTreb.ShowModal = mrCancel then Exit;
//        if frmFIOTreb.cbDontShow.Checked and (Application.MessageBox('Вы уверены что не хотите больше выводить это окно?',
//          'Внимание', mb_yesno + mb_iconquestion + mb_defbutton2) = idyes) then
//          IniWriteString(ChangeFileExt(ParamStr(0),'.ini'),'Otdel','bShow','0');
//        odsParams.SetVariable('Otdelenie',frmFIOTreb.edFam.Text);
//        IniWriteString(ChangeFileExt(ParamStr(0),'.ini'),'Otdel','Otdelenie',frmFIOTreb.edFam.Text);
//      finally
//        frmFIOTreb.Free;
//      end;
//    end
//    else
//      odsParams.SetVariable('Otdelenie',IniReadString(ChangeFileExt(ParamStr(0),'.ini'),'Otdel','Otdelenie'));

    odsRep.SetVariable('Date1', dDate1.date);
    odsRep.SetVariable('Date2', dDate2.date);
    odsRep.SetVariable('MOGROUP_ID', lcbMO_GROUP.KeyValue);
//    odsRep.SetVariable('TMEDICTYPE', lcbType.KeyValue);
    if rbFas.Checked then odsRep.SetVariable('ED_IZM',1)
    else                  odsRep.SetVariable('ED_IZM',0);
    odsRep.Open;

//    if not VarisNull(lcbType.KeyValue) then
    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1:
      begin
        if USE_FIN_SOURCE then
        begin
//          if FileExists('frOborotkaSMS_Main.frf') then          // если найден файл
//             frPrihDoc.LoadFromFile('frOborotkaSMS_Main.frf');  // загружаем его

//          frPrihDoc.Title := 'Оборотная ведомость СМС';// (' + odsType.FieldByName('FC_NAME').AsString + ')'; // Added by Voronov 26.03.2008 12:17:39
          frPrihDoc.FindObject('PageFooter1').Visible := FAlse;
          tfrBandView(frPrihDoc.FindObject('MasterHeader1')).Prop['REPEATHEADER']:= FAlse;
          dmPrintSelect.frxXLSExport1.PageBreaks:=false;
          frPrihDoc.PrepareReport;
          ExportFRToExcel(frPrihDoc, 'Оборотная ведомость СМС с '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls');
        end
        else
          UploadToExcel( odsRep, dDate1.Date, dDate2.Date, True, 'Оборотная ведомость СМС с '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls'); //ExportFRToExcel( frPrihDoc,  frPrihDoc.Title+' с '+DateToStr(dDate1.Date)+' по '+DateToStr(dDate2.Date)+'.xls' );
      end;
      2:
      begin
      //ввод данных о Составителе
        frmFIOTreb := TfrmFIOTreb.Create(Self);
        try
      //    frmFIOTreb.edFam.Text := odsMo.FieldByName('fc_name').AsString;
          frmFIOTreb.edJobTitle.Text := 'Старшая медсестра';
          frmFIOTreb.cbDontShow.Visible := False;
          if frmFIOTreb.ShowModal = mrCancel then Exit;
          odsParams.SetVariable('JobTitleCompiler',frmFIOTreb.edJobTitle.Text);
          odsParams.SetVariable('FamCompiler',frmFIOTreb.edFam.Text);
      //    sJobTitleCompiler := frmFIOTreb.edJobTitle.Text;
      //    sFamCompiler := frmFIOTreb.edFam.Text;
        finally
          frmFIOTreb.Free;
        end;

        frmFIOTreb := TfrmFIOTreb.Create(Self);
        try
          frmFIOTreb.Caption := 'Ввод данных о проверяющем';
          frmFIOTreb.cbDontShow.Visible := False;
    //      if odsType.FieldByName('fk_id').AsInteger = 1 then //если тип медикамента - ПКУ
    //        frmFIOTreb.edJobTitle.Text := 'Бухгалтер материального отдела'
    //      else
    //        frmFIOTreb.edJobTitle.Text := IniReadString(ChangeFileExt(ParamStr(0),'.ini'),'Checker','JobTitleChecker');
          frmFIOTreb.edFam.Text := IniReadString(ChangeFileExt(ParamStr(0),'.ini'),'Checker','FamChecker');
          if frmFIOTreb.ShowModal = mrCancel then Exit;
          odsParams.SetVariable('JobTitleChecker',frmFIOTreb.edJobTitle.Text);
          IniWriteString(ChangeFileExt(ParamStr(0),'.ini'),'Checker','JobTitleChecker',frmFIOTreb.edJobTitle.Text);
          odsParams.SetVariable('FamChecker',frmFIOTreb.edFam.Text);
          IniWriteString(ChangeFileExt(ParamStr(0),'.ini'),'Checker','FamChecker',frmFIOTreb.edFam.Text);
      //    sJobTitleChecker := frmFIOTreb.edJobTitle.Text;
      //    sFamChecker := frmFIOTreb.edFam.Text;
        finally
          frmFIOTreb.Free;
        end;

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
          odsParams.SetVariable('UTVERJDAU_FIO',frmFIOTreb.edFam.Text);
          odsParams.SetVariable('UTVERJDAU_DOLJNOST',frmFIOTreb.edJobTitle.Text);
          IniWriteString(ChangeFileExt(ParamStr(0),'.ini'),'UTVERJDAU','FIO',frmFIOTreb.edFam.Text);
          IniWriteString(ChangeFileExt(ParamStr(0),'.ini'),'UTVERJDAU','DOLJNOST',frmFIOTreb.edJobTitle.Text);
        finally
          frmFIOTreb.Free;
        end;

        odsParams.SetVariable('Date1',dDate1.date);
        odsParams.SetVariable('Date2',dDate2.date);
        odsParams.SetVariable('FK_TMO_GROUP',lcbMO_GROUP.KeyValue);
        odsParams.SetVariable('MOID', oqInitMO.GetVariable('NMOID'));

        odsParams.Open;

//        if FileExists('frOborotkaSMS_Main.frf') then          // если найден файл
//           frPrihDoc.LoadFromFile('frOborotkaSMS_Main.frf');  // загружаем его

//        frPrihDoc.Title := 'Оборотная ведомость СМС';// (' + odsType.FieldByName('FC_NAME').AsString + ')'; // Added by Voronov 26.03.2008 12:17:39
        // из сорцов взято ... дабы работал "Live Report"
        frPrihDoc.PrepareReport;
        frPrihDoc.ShowReport;
//        frPrihDoc.PrepareReport;
//
//        p := TfrxPreview.Create(frPrihDoc);
//       TfrxReport(CurReport) := frPrihDoc;
//       TfrxReport( MasterReport) := frPrihDoc;
//        DocMode := dmPrinting;
//        CurBand := nil;
////        if frPrihDoc.EMFPages.Count = 0 then Exit;
//        s := frLoadStr(SPreview);
////        if frPrihDoc.Title <> '' then s := s + ' - ' + frPrihDoc.Title;
////        p.Window.Caption := s;
//        frPrihDoc.Preview := p;
//
//        frPrihDoc.Preview.Show ;//Window.Show_Modal(frPrihDoc);
//        Application.ProcessMessages;
////        frPrihDoc.Preview.Window := nil;
      end;
    end;
//  frPrihDoc.ShowReport;

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
  frPrihDoc.DesignReport;
end;

procedure TfrmGetPeriod.lcbCloseUp(Sender: TObject);
begin
  acApply.Enabled := (lcbMO_GROUP.Text <> '') and (ccbMedType.Text <> ccbMedType.Properties.EmptySelectionText);
end;

procedure TfrmGetPeriod.frPrihDoc_GetValue(const ParName: String; var ParValue: Variant);
var
  i : integer;

begin
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

  if ParName = 'zav_fio' then
  begin
    ParValue := IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'zav_fio', odsParams.FieldByName('zav_fio').AsString);
  end;

  if ParName = 'OTDELENIE' then
  begin
    ParValue := IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'OTDELENIE', odsParams.FieldByName('OTDELENIE').AsString);
  end;

  if ParName = 'VAR_DATE1' then ParValue := DateToStr(dDate1.Date);
  if ParName = 'VAR_DATE2' then ParValue := DateToStr(dDate2.Date);
  //заполнение переменных о составителе и о проверяющем
  if ParName = 'VAR_JOBTITLECOMPILER' then ParValue := sJobTitleCompiler;
  if ParName = 'VAR_FAMCOMPILER' then ParValue := sFamCompiler;
  if ParName = 'VAR_JOBTITLECHECKER' then ParValue := sJobTitleChecker;
  if ParName = 'VAR_FAMCHECKER' then ParValue := sFamChecker;

  if ParName = 'var_receiver' then
  begin
    with TOracleQuery.Create(nil) do
    try
      Session := Os;
      Sql.Text := 'SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''MANAGER_DOC'' AND FC_KEY = ''CLIENT_NAME_SMS''';
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

  if ParName = 'var_zam_gl_vra4' then
  begin
    with TOracleQuery.Create(nil) do
    try
      Session := Os;
      Sql.Text := 'SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''MANAGER_DOC'' AND FC_KEY = ''ZAM_GL_VRA4''';
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

  if UpperCase(ParName) = 'VAR_UCHGR' then
  begin
    ParValue := ccbMedType.Text;
  end;          

  if ParName = 'FC_MO' then
  begin
    ParValue := oqInitMO.GetVariable('PFC_MO');
  end;

  if ParName = 'SKLAD_NAME' then
  begin
    ParValue := GetValueFromTSMini( 'MANAGER_DOC', 'CLIENT_NAME_APTEKA', '' );
  end;

  if ParName = 'MEDOTRADE_SIGN' then ParValue := ReadMedotradeSign;
end;

procedure TfrmGetPeriod.odsMoBeforeOpen(DataSet: TDataSet);
begin
//  try
    TOracleDataSet(Dataset).SetVariable('moid',IniReadString(ExtractFilePath(ParamStr(0)) +
      'medica.ini','config','nMatOtvID'));
//  except
//    TOracleDataSet(Dataset).SetVariable('moid',68);
//  end;
end;

procedure TfrmGetPeriod.frPrihDoc_MouseOverObject(Sender: TfrxView);
begin
  if StrToInt(Copy((Sender as TfrxView).Name,5,2)) in [19,42, 46, 64, 52] then
  begin
    Cursor := crHandPoint;
  end;
end;

procedure TfrmGetPeriod.frPrihDoc_ObjectClick(View: TfrxView);
var //frmDateInput : TfrmDateInput;
    vPos         : Integer;
    aPrompt      : String;
begin
{  if StrToInt(Copy(View.Name,5,2)) in [62] then
//  if View.Name = 'Memo56' then
  begin
    View.FrameTyp := 15;
    View.FrameColor := clRed;
    vPos := frPrihDoc.Preview.Window.VScrollBar.Position;
    frPrihDoc.Preview.Zoom := frPrihDoc.Preview.Zoom; //дабы перерисовался отчет
    frPrihDoc.Preview.Window.VScrollBar.Position := vPos;
    try
//      frmDateInput := TfrmDateInput.Create(frPrihDoc.Preview.Window);
      frmDateInput := TfrmDateInput.Create(nil);
      try
        if frmDateInput.ShowModal = mrOk then
        begin
          if frmDateInput.deDate.Date = -700000 then
            View.Memo.Text := '"     "                 200  г.'
          else
            View.Memo.Text := FormatDateTime('''"''dd''"'' mmmm yyyy ''г.''',frmDateInput.deDate.Date);
        end;
      finally
        frmDateInput.Free;
      end;
    finally
      View.FrameTyp := 2;
      View.FrameColor := clBlack;
      vPos := frPrihDoc.Preview.Window.VScrollBar.Position;
      frPrihDoc.Preview.Zoom := frPrihDoc.Preview.Zoom; //дабы перерисовался отчет
      frPrihDoc.Preview.Window.VScrollBar.Position := vPos;
    end;
  end
  else} if StrToInt(Copy(View.Name,5,2)) in [19,42, 46, 64,52] then
  begin

    Case StrToInt(Copy(View.Name,5,2)) of
      64  : aPrompt := 'Заместитель главного врача по мед. части';
      19  : aPrompt := 'Заведующий отделением';
//      49  : aPrompt := 'Материально-ответственное лицо';
      52  : aPrompt := 'Отделение';
      42  : aPrompt := 'Составил';
      46  : aPrompt := 'Проверил';
    end;

//    View.Frame.Typ := tfrxframetypes(15);
    View.Frame.Color := clRed;
//    vPos := frPrihDoc.Preview.Window.VScrollBar.Position;
//    frPrihDoc.Preview.Zoom := frPrihDoc.Preview.Zoom; //дабы перерисовался отчет
//    frPrihDoc.Preview.Window.VScrollBar.Position := vPos;
    try
      //View.Text :=
       InputBox('Ввод данных',aPrompt,
        Remove1310('View.Memo.Text'));

      Case StrToInt(Copy(View.Name,5,2)) of
        64  : ;
        19  : IniWriteString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'zav_fio', Remove1310('View.Memo.Text') );
        52  : IniWriteString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'OTDELENIE', Remove1310('View.Memo.Text') );
        42  : ;
        46  : ;
      end;
    finally
//      View.Frame.Typ := 2;
      View.Frame.Color := clBlack;
//      vPos := frPrihDoc.Preview.Window.VScrollBar.Position;
//      frPrihDoc.Preview.Zoom := frPrihDoc.Preview.Zoom; //дабы перерисовался отчет
//      frPrihDoc.Preview.Window.VScrollBar.Position := vPos;
    end;

  end;
end;

function TfrmGetPeriod.frPrihDoc_UserFunction(const MethodName: string;
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

procedure TfrmGetPeriod.odsGroupMoAfterOpen(DataSet: TDataSet);
begin
  lcbMO_GROUP.KeyValue := StrToInt(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastMOGroupID', '-1'));
  lcbCloseUp(nil);
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
  Action := caFree;
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
end;

procedure TfrmGetPeriod.ccbMedTypePropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
var
i:integer;
begin
  if USE_ONLY_1_UCHGR = False then
   exit;

  for i := 0 to ccbMedType.Properties.Items.count-1 do
  begin
    if ccbMedType.States[i] = cbsChecked then
    begin
      if i<>ItemIndex then
        ccbMedType.States[i] := cbsUnChecked
      else
       ccbMedType.States[i] := cbsChecked;
    end;
  end;

   ccbMedType.PopupWindow.hide;
   ccbMedType.PopupWindow.show;
end;

procedure TfrmGetPeriod.ccbMedTypePropertiesEditValueChanged(
  Sender: TObject);
begin
  lcbCloseUp(nil);
end;


procedure TfrmGetPeriod.UploadToExcel(ADataSet: TOracleDataSet; ADate1, ADate2: TDateTime; AGrouping: Boolean; aFileName : string);

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
   if (FieldByName('FC_UCHGR').AsString<>sGroup) and AGrouping then begin
    if S<>'' then begin
     S:=S+#13#10+GetSum(CurrToStrF(nS1, ffNumber, 2), CurrToStrF(nS2, ffNumber, 2), CurrToStrF(nS3, ffNumber, 2), CurrToStrF(nS4, ffNumber, 2));
     nS1:=0; nS2:=0; nS3:=0; nS4:=0;
     Inc(nCount);
    end;

    sGroup:=FieldByName('FC_UCHGR').AsString;
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

// шоб былО по уму - пишем в указанный файл в папку Reports
 sFileName1 := ChangeFileExt(fdmPrintSelect.PrepareFilePath(aFileName), '.htm');
 sFileName2 := ChangeFileExt(sFileName1,'.xls');
// sFileName1:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'shablon.htm';
 SaveResToFile('shablon', 'HTML', sFileName1);
// sFileName2:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'done.htm';

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
 DeleteFile(sFileName1);

 Screen.Cursor:=crDefault;
end;

function TfrmGetPeriod.GetValueFromTSMini(ASection, AIdent, ADefaultValue : string ): string;
begin
  with oqTSMINI do
  try
    ClearVariables;
    SetVariable('PSECTION', ASection);
    SetVariable('PIDENT',  AIdent );
    SetVariable('PDEFAULT', ADefaultValue );
    SetVariable('PVALUE',  null );
    Execute;
    Result := GetVariable('PVALUE');
  except
    Result := ADefaultValue;
  end;                      
end;


end.

