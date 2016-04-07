unit fSearchLab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxGroupBox, cxRadioGroup, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, Buttons, ActnList, ImgList,
  OracleData, Oracle, dxBar, Menus, ShellAPI, cxSplitter, jvDBUtils,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  cxCheckBox, cxBarEditItem, frxClass, frxDBSet, cxLookAndFeelPainters,
  cxButtons, cxGridExportLink, cxImageComboBox, SMMainAPI, Registry,
  dxSkinBlack, IniFiles, cxCalendar, JvStringHolder;

type
  TfrmSearchLab = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    cxLabel1: TcxLabel;
    sFIO: TcxTextEdit;
    TVPAC: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    al: TActionList;
    aClose: TAction;
    dsPac: TDataSource;
    odsPac: TOracleDataSet;
    VFIO: TcxGridDBColumn;
    aSearch: TAction;
    VROJD: TcxGridDBColumn;
    VNUMBER: TcxGridDBColumn;
    VSOS: TcxGridDBColumn;
    VLASTFLU: TcxGridDBColumn;
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    bbHistory: TdxBarButton;
    aHistory: TAction;
    bbInfo: TdxBarButton;
    aInfo: TAction;
    VTYPEDOC: TcxGridDBColumn;
    pmTV: TPopupMenu;
    N2: TMenuItem;
    bbOpenMK: TdxBarButton;
    aOpenMK: TAction;
    bb1: TdxBarButton;
    actCloseNaz: TAction;
    actEditNaz: TAction;
    actRefreshNaz: TAction;
    actLoadNaz: TAction;
    pnlNaz: TPanel;
    cxGrid2: TcxGrid;
    TVISSL: TcxGridDBTableView;
    VDATE: TcxGridDBColumn;
    VNAMEISSL: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dxBarDockControl2: TdxBarDockControl;
    cxSplitter1: TcxSplitter;
    odsNaz: TOracleDataSet;
    dsNaz: TDataSource;
    bbEditNaz: TdxBarButton;
    bbCloseNaz: TdxBarButton;
    bbRefreshNaz: TdxBarButton;
    VDATENAZ: TcxGridDBColumn;
    VSOSID: TcxGridDBColumn;
    cxCheckMK: TcxBarEditItem;
    aClearSearch: TAction;
    aPrintSearch: TAction;
    N1: TMenuItem;
    frxRepSearch: TfrxReport;
    frxDBSearch: TfrxDBDataset;
    bEnter: TcxButton;
    bClear: TcxButton;
    bClose: TcxButton;
    cxLabel2: TcxLabel;
    lbSex: TcxLabel;
    cxLabel3: TcxLabel;
    lbRojd: TcxLabel;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    sdPopUp: TSaveDialog;
    odsTubDates: TOracleDataSet;
    ilCntTub: TImageList;
    pnlTub: TPanel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    lbBegin: TcxLabel;
    lbEnd: TcxLabel;
    VPACCNTTUB: TcxGridDBColumn;
    VDOZA: TcxGridDBColumn;
    bbFillNaz: TdxBarButton;
    aFill: TAction;
    tmrCheckApplication: TTimer;
    aSysInfo: TAction;
    ilRgPlus: TImageList;
    VRGPLUS: TcxGridDBColumn;
    bbSnimki: TdxBarButton;
    aSnimki: TAction;
    odsNazFK_RESULTID: TFloatField;
    odsNazFK_ID: TFloatField;
    odsNazFK_SMID: TFloatField;
    odsNazFC_TYPE: TStringField;
    odsNazOWNER: TFloatField;
    odsNazFD_NAZ: TDateTimeField;
    odsNazFD_NAZ_RUN: TStringField;
    odsNazRUN_DATE: TDateTimeField;
    odsNazFD_RUN: TStringField;
    odsNazFK_PACID: TFloatField;
    odsNazFK_ROOMID: TIntegerField;
    odsNazFK_NAZSOSID: TFloatField;
    odsNazNAMEISSL: TStringField;
    odsNazIS_REANIM: TFloatField;
    odsNazSMIDORDER: TFloatField;
    odsNazIS_AMBULANCE: TFloatField;
    odsNazDOZA: TFloatField;
    odsNazFP_TEK_COC: TFloatField;
    dxBarButton1: TdxBarButton;
    aPrintLuchNagrList: TAction;
    bbPrintLuchNagrList: TdxBarButton;
    odsLuchNagrList: TOracleDataSet;
    frxDBLuchNagrList: TfrxDBDataset;
    frxRepLuchNagrList: TfrxReport;
    odsLPU: TOracleDataSet;
    frxDBLPU: TfrxDBDataset;
    STATE: TcxGridDBColumn;
    odsNazstate: TStringField;
    odsNazFC_accessionnumber: TStringField;
    mshSQL: TJvMultiStringHolder;
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sFIOClick(Sender: TObject);
    procedure sFIOEnter(Sender: TObject);
    procedure aSearchExecute(Sender: TObject);
    procedure odsPacAfterScroll(DataSet: TDataSet);
    procedure aHistoryExecute(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure aOpenMKExecute(Sender: TObject);
    procedure odsPacAfterOpen(DataSet: TDataSet);
    procedure actCloseNazExecute(Sender: TObject);
    procedure actRefreshNazExecute(Sender: TObject);
    procedure actEditNazExecute(Sender: TObject);
    procedure TVPACFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure actLoadNazExecute(Sender: TObject);
    procedure odsNazBeforeOpen(DataSet: TDataSet);
    procedure TVISSLCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure odsNazAfterOpen(DataSet: TDataSet);
    procedure odsNazAfterScroll(DataSet: TDataSet);
    procedure cxCheckMKPropertiesChange(Sender: TObject);
    procedure aClearSearchExecute(Sender: TObject);
    procedure aPrintSearchExecute(Sender: TObject);
    procedure frxRepSearchGetValue(const VarName: string; var Value: Variant);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aFillExecute(Sender: TObject);
    procedure TVISSLCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure aSysInfoExecute(Sender: TObject);
    procedure aSnimkiExecute(Sender: TObject);
    procedure aPrintLuchNagrListExecute(Sender: TObject);
  private
    sDateSys_4Rep : String;
    procedure DoShowTub;
    { Private declarations }
  public
    Russian : HKL;
    procedure DoShowfrmSearch;
    procedure CheckEnabledButtons;
    { Public declarations }
  end;

var
  frmSearchLab: TfrmSearchLab;

implementation

uses fPacInfo, fMain, fWait, fEditNaz, fProtocol, fOtmena,
  fOtmetkiFlu, fAllHistory, fProtocolN, fSysInfo{, uCommonXray};

{$R *.dfm}

procedure TfrmSearchLab.aClearSearchExecute(Sender: TObject);
begin
  sFIO.Clear;
  sFIO.SetFocus;
end;

procedure TfrmSearchLab.aCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmSearchLab.FormCreate(Sender: TObject);
var
  ods: TOracleDataSet;

begin
  russian:=LoadKeyboardLayout('00000419', 0);

  { Показать/Скрыть кнопку "Печать листа лучевой нагрузки" }
  ods := TOracleDataSet.Create(nil);
  try
     ods.Session := frmMain.os;
     ods.SQL.Text := ' SELECT NAZ.FK_SMID FROM ASU.TVRACHKAB KAB, ASU.TVRACHKAB_NAZ NAZ '+#13+
                     '  WHERE KAB.FK_SOTRID = :PFK_SOTRID '+#13+
                     '    AND KAB.FK_ID = NAZ.FK_SOTRKABID '+#13+
                     '    AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = :PFC_SYNONIM) ';

     ods.DeclareAndSet('PFK_SOTRID', otInteger, frmMain.pSOTRID);
     ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_PRINTLUCHNAGRLIST');
     ods.Open;
     aPrintLuchNagrList.Visible := (ods.RecordCount <> 0);// AND (frmMain.GET_DB_NAME = 'T'); // Печать листа лучевой нагрузки (доступна на Сургут-Травме и при данном пользователю праве)
     //убрал привязку к БД для СОКБ
     ods.Close;

     ods.Close;
  finally
     ods.Free;
  end;
  {/ Показать/Скрыть кнопку "Печать листа лучевой нагрузки" }

end;

procedure TfrmSearchLab.frxRepSearchGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'USLOVIE' then Value := sFIO.TExt;
  if VarName = 'SOTRNAME' then Value := frmMain.sSotrFIO;
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;  
end;

procedure TfrmSearchLab.sFIOClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSearchLab.sFIOEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSearchLab.tmrCheckApplicationTimer(Sender: TObject);
var Wnd               : hWnd;
    buff              : array[0..127] of Char;
    i, j, iDel        : Integer;
begin
  Application.ProcessMessages;
  if not(tmrCheckApplication.Enabled) then exit;
  iDel:=0;
  for i:=0 to Length(frmMain.arFIO)-1 do
  begin
    Wnd := GetWindow(Handle, gw_HWndFirst);
    while Wnd <> 0 do
    begin
      if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
        begin
          GetWindowText(Wnd, buff, sizeof(buff));
          if StrPas(buff) = frmMain.arFIO[i-iDel] then
            begin
              if IsWindowVisible(Wnd) then
              begin
                  for j:=i-iDel to Length(frmMain.arFIO)-2 do
                  begin
                    frmMain.arFIO[j]:=frmMain.arFio[j+1];
                  end;
                  SetLength(frmMain.arFIO,Length(frmMain.arFIO)-1);
                  Inc(iDel);
                  if Length(frmMain.arFIO) = 0 then
                  begin
                    tmrCheckApplication.Enabled:=False;
                    Screen.Cursor:=crDefault;
                    aOpenMK.Enabled:=True;
                    Exit;
                  end;
                  Break;
              end;
            end;
        end;
      Wnd := GetWindow(Wnd, gw_hWndNext);
    end;
  end;
end;

procedure TfrmSearchLab.aSearchExecute(Sender: TObject);
var sFam, sIm, sOtch : String;
    strIm : String;
    flag : Integer;
begin
if sFIO.Text <> '' then
  begin
  odsPac.AfterScroll := nil;
  flag := 0;
  if Pos(' ', sFIO.Text) = 0 then
    begin
      sFam := sFIO.Text;
      flag := 1;
    end else
    begin
      sFam := copy(sFIO.Text, 1, Pos(' ', sFIO.Text));
    end;

  if flag = 1 then
    strIm := ''
  else
    strIm := trim(copy(sFIO.Text, Length(sFam), Length(sFIO.Text)+1 - Length(sFam)));

  sIm := trim(copy(strIm, 1, Pos(' ', strIm)));
  if sIm = '' then
    sIm := strIm;

  sOtch := trim(copy(strIm, Length(sIm)+1, Length(strIm)-Length(sIm)+1));  
  odsPac.deletevariables;
  if trim(sFIO.Text) <> '' then
    begin
      odsPac.Close;
      odsPac.declareandset('pfam',otstring,trim(sfam)+'%');
      odsPac.declareandset('pim',otstring,trim(sim)+'%');
      odsPac.declareandset('potch',otstring,trim(sotch)+'%');
      if rgreg_hide_last_fluoro = 1 then
       begin
        odsPac.SQL.Text := mshSQL.StringsByName['un_fluoro'].Text;
       end
      else
       begin
        odsPac.SQL.Text := mshSQL.StringsByName['default'].Text;
       end;
      odsPac.Open;
    end;
  CheckEnabledButtons;
  odsPac.AfterScroll := odsPacAfterScroll;
  DoShowTub;
  end;
end;

procedure TfrmSearchLab.aSnimkiExecute(Sender: TObject);
var Reg : TRegistry;
    // Отображение снимков по пациенту/исследованию (для АТРИС)
    p_showSnimki : procedure (  p_AppHandl : THandle;
                                p_OracleSession: pointer;
                                p_patientID:string;
                                p_AccessionNumber:string;
                                p_studyUID:string;
                                p_old_form : Boolean
                             ); stdcall;
    DLL_HANDLE: THandle;
    v_an, v_pid : string; v_testfile:string;
const c_fileDLL = 'DICOM_Viewer.dll';
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    if not Reg.OpenKeyReadOnly('\Software\Alda\MultiVox\Installation') then
    begin
      if (frmMain.GET_DB_NAME = 'H') or (frmMain.GET_DB_NAME = 'SO') then // если база Ханты ОКБ или Сургут ОКБ - сопряжение с Мультивокс
      begin
        ShowMessage('Не установлен клиент MultiVox ...');
        Exit;
      end;
      if FileExists(c_fileDLL) then
      begin
        DLL_HANDLE:= LoadLibrary(c_fileDLL);
        Try
          if DLL_HANDLE <> 0 then
          begin
            @p_showSnimki := GetProcAddress(DLL_HANDLE, 'p_showSnimki');
            if @p_showSnimki <> nil then
            begin
              v_testfile:= ExtractFilePath(paramstr(0))+'dicomtest.ini';
              if FileExists(v_testfile) then  // !!! для отладки
              begin
                if Application.MessageBox( 'Вы хотите загрузить проверочные снимки'+#13+
                                           ' тестового пациента ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION
                                         ) = MrYes
                then
                  With TIniFile.Create(v_testfile) do
                    try
                      v_pid:=ReadString('TEST','PATIENTID','');
                      v_an :=ReadString('TEST','ACCESSIONNUMBER','');
                      WriteString('TEST','PATIENTID',v_pid);
                      WriteString('TEST','ACCESSIONNUMBER',v_an);
                      WriteString('TEST','FND_PATIENTID',odsPac.FieldByName('nib').AsString);
                      WriteString('TEST','FND_ACCESSIONNUMBER',odsNaz.FieldByName('FC_accessionnumber').AsString);
                    finally
                      Free;
                    end
                else
                  DeleteFile(v_testfile);
              end else
              begin
                v_pid := odsPac.FieldByName('nib').AsString;
                v_an  := odsNaz.FieldByName('FC_accessionnumber').AsString;
              end;
              p_showSnimki(  Application.Handle,
                             frmMain.os.ExternalSVC,
                             v_pid, // merFIOMK.Properties.Editors[1].Value
                             v_an,  // erowNumProt.Properties.Value
                             '',    // p_studyUID
                             False   // old_form
                          );
            end;
          end;
        Finally
          FreeLibrary(DLL_HANDLE);
        End;
      end else
        MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
      { DoShowSnimki(odsPac.FieldByName('nib').AsString,
                   odsNaz.FieldByName('fc_type').AsString,
                   '',
                   frmMain.get_dicom_ip,
                   frmMain.get_dicom_port,
                   frmMain.get_dicom_called,
                   frmMain.sCallingAET,
                   IntToStr(frmMain.pSotrID),
                   frmMain.dicom_show_3d);  }
    end else
    begin
      frmMain.sPath := Reg.ReadString('Path');
      ShellExecute(Application.Handle,
                   pChar('open'),
                   pChar(frmMain.sPath+'MvLauncher.exe'),
                   PChar('-cmd:Load -StudyExternalID:'+IntToStr(odsNaz.FieldByName('fk_id').AsInteger)),
                   pChar(frmMain.sPath),
                   SW_SHOWNORMAL);
    end;
  finally
    Reg.Free;
  end;
end;

procedure TfrmSearchLab.aSysInfoExecute(Sender: TObject);
begin
  if (cxSplitter1.Visible = True) and (cxGrid2.Visible = True) and (odsNaz.FieldByName('fk_id').AsInteger <> 0) then
    begin
      Application.CreateForm(TfrmSysInfo, frmSysInfo);
      try
        frmSysInfo.DoShowForm(odsPac.FieldByName('pacid').AsInteger,
                              odsPac.FieldByName('fk_id').AsInteger,
                              odsNaz.FieldByName('fk_id').AsInteger); // NazID
        frmSysInfo.ShowModal;
      finally
        frmSysInfo.Free;
      end;
    end;
end;

procedure TfrmSearchLab.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVPAC.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSearchLab.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVPAC.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSearchLab.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVPAC.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSearchLab.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVPAC.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSearchLab.odsPacAfterScroll(DataSet: TDataSet);
begin
  lbRojd.Caption := DateTimeToStr(odsPac.FieldByName('FD_ROJD').AsDateTime);
  lbSex.Caption := odsPac.FieldByName('SEX').AsString;
  DoShowTub;
	CheckEnabledButtons;
  if odsPac.RecordCount > 0 then
    begin
      if cxSplitter1.Visible = True then
        begin
			    if cxCheckMK.EditValue = 1 then
            begin
					    cxCheckMK.EditValue := 0;
					    odsNaz.Filtered := False;
					    cxCheckMK.EditValue := 1;
					    odsNaz.Filtered := True;
					    odsNaz.Filter := 'FK_PACID = '+odsPac.FieldByName('PACID').AsString;
				    end;
		    end;
    end;
end;

procedure TfrmSearchLab.aHistoryExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.DoShowForm(odsPac.FieldByName('FK_ID').AsInteger, odsPac.FieldByName('FIO').AsString);
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmSearchLab.DoShowfrmSearch;
begin
  aHistory.Enabled := FALSE;
  aInfo.Enabled := FALSE;
  aOpenMK.Enabled := FALSE;
  actLoadNaz.Enabled := FALSE;
  aPrintSearch.Enabled := False;
  cxSplitter1.CloseSplitter;
  cxSplitter1.Visible := FALSE;
  TVPAC.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVPAC'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVPAC');
  TVPAC.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVPAC'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVPAC');

end;

procedure TfrmSearchLab.DoShowTub;
begin
  if odsPac.FieldByName('CNTTUB_ALL').AsInteger <> 0 then
    begin
      pnlTub.Visible := True;
      odsTubDates.Close;
      odsTubDates.SetVariable('PFK_PEPLID', odsPac.FieldByName('FK_ID').AsInteger);
      odsTubDates.Open;
      odsTubDates.Last;
      lbBegin.Caption := odsTubDates.FieldByName('FD_NAZSTR').AsString;
      lbEnd.Caption := odsTubDates.FieldByName('FD_RUNSTR').AsString;
      if odsTubDates.FieldByName('FD_RUNSTR').AsString = '' then
        begin
          cxLabel4.Style.Font.Color := clRed;
          cxLabel4.Style.TextStyle := [fsBold];
        end else
        begin
          cxLabel4.Style.Font.Color := clBlack;
          cxLabel4.Style.TextStyle := cxLabel4.Style.TextStyle - [fsBold];
        end;
    end else
    begin
      pnlTub.Visible := False;
    end;
end;

procedure TfrmSearchLab.CheckEnabledButtons;
begin
  if odsPac.Active then
    begin
      aHistory.Enabled := odsPac.RecordCount <> 0;
      aInfo.Enabled := odsPac.RecordCount <> 0;
      aOpenMK.Enabled := odsPac.RecordCount <> 0;
      actLoadNaz.Enabled := odsPac.RecordCount <> 0;
      aPrintLuchNagrList.Enabled := odsPac.RecordCount <> 0;
    end;
  if odsNaz.Active then
    begin
      actEditNaz.Enabled := (odsNaz.RecordCount <> 0) and ((odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP)
                                                           or (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
      aFill.Enabled := (odsNaz.RecordCount <> 0) and (odsNaz.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL);
      aSnimki.Enabled := (odsNaz.RecordCount <> 0) and ((odsNaz.FieldByName('FK_NAZSOSID').AsInteger=1) or (odsNaz.FieldByName('FK_NAZSOSID').AsInteger=-11) );

    //  ShowMessage('FK_NAZSOSID='+inttostr(odsNaz.FieldByName('FK_NAZSOSID').AsInteger));

    end;
end;

procedure TfrmSearchLab.cxCheckMKPropertiesChange(Sender: TObject);
begin
  if odsPac.RecordCount > 0 then
    begin
	    if cxCheckMK.EditValue = 1 then
        begin
			    odsNaz.Filtered := True;
			    odsNaz.Filter := 'FK_PACID = '+odsPac.FieldByName('PACID').AsString;
		    end else
		    begin
          odsNaz.Filtered := False;
		    end;
    end;
end;

procedure TfrmSearchLab.aInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmPacInfo, frmPacInfo);
  try
    frmPacInfo.DoShowPacInfo(odsPac.FieldByName('PACID').AsInteger,
                             odsPac.FieldByName('FK_ID').AsInteger,
                             '');
    frmPacInfo.ShowModal;
  finally
    frmPacInfo.Free;
  end;
end;

procedure TfrmSearchLab.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVPAC.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVPAC'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVPAC');
end;

procedure TfrmSearchLab.N2Click(Sender: TObject);
begin
  TVPAC.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVPAC'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVPAC');
end;

procedure TfrmSearchLab.aOpenMKExecute(Sender: TObject);
var ods : TOracleDataSet;
    AppProcID : Integer;
begin
{$IFDEF USE_NEW_AUTH}
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_FIO(:FK_PEPLID) FIOPAC FROM DUAL ';
    ods.DeclareAndSet('FK_PEPLID', otInteger, odsPac.FieldByName('FK_ID').AsInteger);
    ods.Open;

    if frmMain.RestoreApplication(ods.FieldByName('FIOPAC').AsString + ' - ' + frmMain.Get_Pac_NUMIB(odsPac.FieldByName('PACID').AsInteger))
    then Exit;

    SetLength(frmMain.arFIO,Length(frmMain.arFIO)+1);
    frmMain.arFIO[Length(frmMain.arFIO)-1]:=ods.FieldByName('FIOPAC').AsString;
    aOpenMK.Enabled:=False;
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    tmrCheckApplication.Enabled:=True;

    AppProcID := AppStart(ExtractFilePath(paramstr(0))+'IBRazdel.exe', IntToStr(odsPac.FieldByName('PACID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
    ShowWait(odsPac.FieldByName('PACID').AsInteger,False);
  finally
    Screen.Cursor := crDefault;
    ods.Free;
  end;
{$ELSE}
  AppProcID := 0;
  if ShellExecute(Application.Handle,
                  pChar('open'),
                  PChar(ExtractFilePath(paramstr(0)) + 'IBRazdel.exe'),
                  PChar(IntToStr(frmMain.pAPPSOTRID) + ' ' +
                  IntToStr(odsPac.FieldByName('PACID').AsInteger) + ' ' +
                  IntToStr(-1) + ' ' +
                  IntToStr(-1)), PChar(ExtractFilePath(paramstr(0))), SW_SHOWNORMAL) < 32 then
    Application.MessageBox('Запуск внешнего модуля не удался.', 'Ошибка', MB_OK + MB_ICONERROR);
  ShowWait(odsPac.FieldByName('PACID').AsInteger,False);  
{$ENDIF}
end;

procedure TfrmSearchLab.aPrintLuchNagrListExecute(Sender: TObject);
begin
  odsLuchNagrList.Close;
  odsLuchNagrList.SetVariable('PFK_PACID', odsPac.FieldByName('PACID').AsInteger);
  odsLuchNagrList.Open;

  odsLPU.Close;
  odsLPU.SetVariable('PFK_PACID', odsPac.FieldByName('PACID').AsInteger);
  odsLPU.Open;

  frxRepLuchNagrList.PrepareReport;
  frxRepLuchNagrList.PrintOptions.ShowDialog := False;
  frxRepLuchNagrList.Print;

end;

procedure TfrmSearchLab.aPrintSearchExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  odsPac.AfterScroll := nil;
  TVPAC.OnFocusedRecordChanged := nil;
  id := odsPac.FieldByName('PACID').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS FROM DUAL ';
    ods.Open;
    sDateSys_4Rep := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;
  frxRepSearch.ShowReport;
  odsPac.Locate('PACID', id, []);
  TVPAC.OnFocusedRecordChanged := TVPACFocusedRecordChanged;
  odsPac.AfterScroll := odsPacAfterScroll;
end;

procedure TfrmSearchLab.odsPacAfterOpen(DataSet: TDataSet);
begin
  if odsPac.RecordCount = 0 then
    begin
      lbSex.Caption := '--';
      lbRojd.Caption := '--';
    end;
  aPrintSearch.Enabled := odsPac.RecordCount <> 0;    
end;

procedure TfrmSearchLab.actCloseNazExecute(Sender: TObject);
begin
  cxSplitter1.CloseSplitter;
  cxSplitter1.Visible := False;
	TVISSL.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVISSLSEARCH'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVISSLSEARCH');
end;

procedure TfrmSearchLab.actRefreshNazExecute(Sender: TObject);
begin
  RefreshQuery(odsNaz);
end;

procedure TfrmSearchLab.aFillExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  if (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL) or (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NEYAV) then
    begin
      Application.CreateForm(TfrmOtmena, frmOtmena);
      frmOtmena.acOk.Visible := FALSE;
      frmOtmena.GroupBox1.Visible := FALSE;
      frmOtmena.cxOtmena.Align := alClient;
      frmOtmena.acCancel.Caption := 'Закрыть';
      frmOtmena.acCancel.ImageIndex := 2;
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FC_RES, '+
                        '        NVL(TO_CHAR(FD_INS, ''DD.MM.YYYY HH24:MI''), 0) FD_INS, '+
                        '        FK_VRACHID, ASU.DO_VRACHFIO(FK_VRACHID) AS SOTRFIO '+
                        '   FROM ASU.VRES '+
                        '  WHERE FK_NAZID = :pFK_NAZID AND FK_SOS = :PFK_SOS ';
        ods.DeclareAndSet('pFK_NAZID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
        ods.DeclareAndSet('PFK_SOS', otInteger, odsNaz.FieldByName('FK_NAZSOSID').AsInteger);
        ods.Open;
        if ods.RecordCount > 0 then
          begin
            frmOtmena.cxOtmena.Text := 'Сотрудник:'+' '+ods.FieldByName('SOTRFIO').AsString+','+' '+
                                       'Дата:'+' '+DateTimeToStr(ods.FieldByName('FD_INS').AsDateTime)+#13#10+
                                       'Обоснование отмены:'+' '+ods.FieldByName('FC_RES').AsString;
          end else
          begin
            frmOtmena.cxOtmena.Text := 'Нет данных';
          end;
      finally
        ods.Free;
      end;
      frmOtmena.ShowModal;
      frmOtmena.Free;
    end else
    begin
      if frmMain.get_new_style = '-1' then
        begin
          Application.CreateForm(TfrmProtocolN, frmProtocolN);
          frmProtocolN.isResult := True; // odsNaz.FieldByName('FK_RESULTID').AsInteger = 1;
          frmProtocolN.pOWNERID := odsNaz.FieldByName('OWNER').AsInteger;
          try
            frmProtocolN.DoShowForm(odsNaz.FieldByName('IS_AMBULANCE').AsInteger,
                                    odsNaz.FieldByName('FK_PACID').AsInteger,
                                    odsPac.FieldByName('FK_ID').AsInteger,
                                    odsNaz.FieldByName('FK_SMID').AsInteger,
                                    odsNaz.FieldByName('FK_ID').AsInteger,
                                    odsNaz.FieldByName('IS_REANIM').AsInteger,
                                    odsNaz.FieldByName('NAMEISSL').AsString);
            frmProtocolN.aSave.Enabled := odsNaz.FieldByName('FP_TEK_COC').AsInteger <> 3;
            frmProtocolN.aPodpis.Enabled := odsNaz.FieldByName('FP_TEK_COC').AsInteger <> 3;
            frmProtocolN.ShowModal;
          if frmProtocolN.ModalResult = mrOk then
            begin
              RefreshQuery(odsNaz);
            end;
          finally
            frmProtocolN.Free;
          end;
        end else
        begin
          Application.CreateForm(TfrmProtocol, frmProtocol);
          if frmMain.pOtdelID = frmMain.get_radio_otdel then
            begin
              frmProtocol.lbSpec.Caption := 'Врач-радиолог:';
            end else
            begin
              frmProtocol.lbSpec.Caption := 'Врач-рентгенолог:';
            end;
          frmProtocol.isResult := True; // odsNaz.FieldByName('FK_RESULTID').AsInteger = 1;
          frmProtocol.pOWNERID := odsNaz.FieldByName('OWNER').AsInteger;
          try
            frmProtocol.DoShowfrmProtocol(odsNaz.FieldByName('IS_AMBULANCE').AsInteger,
                                          odsNaz.FieldByName('FK_PACID').AsInteger,
                                          odsPac.FieldByName('FK_ID').AsInteger,
                                          odsNaz.FieldByName('NAMEISSL').AsString,
                                          odsNaz.FieldByName('FK_SMID').AsInteger,
                                          odsNaz.FieldByName('FK_ID').AsInteger,
                                          odsNaz.FieldByName('IS_REANIM').AsInteger);
            if odsNaz.FieldByName('FP_TEK_COC').AsInteger = 3 then
              frmProtocol.aSave.Enabled := odsNaz.FieldByName('FK_NAZSOSID').AsInteger = frmMain.GET_LABVIP
            else
              frmProtocol.aSave.Enabled := True;
            if odsNaz.FieldByName('FP_TEK_COC').AsInteger = 3 then
              frmProtocol.aPodpis.Enabled := odsNaz.FieldByName('FK_NAZSOSID').AsInteger = frmMain.GET_LABVIP
            else
              frmProtocol.aPodpis.Enabled := True;
            frmProtocol.ShowModal;
            if frmProtocol.ModalResult = MrOk then
              begin
                RefreshQuery(odsNaz);
              end;
          finally
            frmProtocol.Free;
          end;
        end;
    end;
end;

procedure TfrmSearchLab.actEditNazExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmEditNaz, frmEditNaz);
  frmEditNaz.pDateNaz := odsNaz.FieldByName('fd_naz').AsDateTime;
  frmEditNaz.DoShowEditNaz(odsNaz.FieldByName('FK_PACID').AsInteger,
                           frmMain.pSOTRID,
                           -1,
                           '',
                           Trunc(odsNaz.FieldByName('RUN_DATE').AsDateTime),
                           odsNaz.FieldByName('FK_ROOMID').AsInteger,
                           odsNaz.FieldByName('FK_SMID').AsInteger,
                           odsNaz.FieldByName('FK_ID').AsInteger);
  frmEditNaz.ShowModal;
  if frmEditNaz.ModalResult = MrOK then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' UPDATE asu.TNAZIS SET FD_RUN = :PFD_RUN, FK_ROOMID = :PFK_ROOMID, fl_in_raspis = 1 WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(frmEditNaz.cxdeDate.Date)+' '+FormatDateTime('hh:nn:ss', frmEditNaz.cxteTime.Time)));
        oq.DeclareAndSet('PFK_ROOMID', otInteger, frmEditNaz.cxlcKabinet.EditValue);
        oq.DeclareAndSet('PFK_ID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
      finally
        oq.Free;
      end;
    end;
  frmEditNaz.Free;
  RefreshQuery(odsNaz);
end;

procedure TfrmSearchLab.TVPACFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if cxSplitter1.Visible then
    begin
      odsNaz.Close;
      odsNaz.Open;
    end;
end;

procedure TfrmSearchLab.actLoadNazExecute(Sender: TObject);
begin
	if cxSplitter1.Visible <> True then
    begin
      cxSplitter1.Visible := True;
      cxSplitter1.OpenSplitter;
			TVISSL.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVISSLSEARCH'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVISSLSEARCH');
    end;
  odsNaz.Close;
  odsNaz.Open;
  if frmMain.get_def_thismk = '-1' then
    begin
      cxCheckMK.EditValue := 1;
      cxCheckMKPropertiesChange(nil);
    end;
  VSOSID.Visible:=False;
  VNAMEISSL.Visible:=True;
end;

procedure TfrmSearchLab.odsNazBeforeOpen(DataSet: TDataSet);
begin
	odsNaz.SetVariable('pfk_pacid', odsPac.FieldByName('fk_id').AsInteger);
  odsNaz.SetVariable('psotrid', frmMain.pSotrID);
end;

procedure TfrmSearchLab.TVISSLCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aFillExecute(nil);
end;

procedure TfrmSearchLab.TVISSLCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[VSOSID.Index] = GET_NAZCANCEL then
    ACanvas.Brush.Color:=RGB(251, 172, 182);
  if AViewInfo.GridRecord.Values[VSOSID.Index] = GET_NEYAV then
    ACanvas.Brush.Color:=RGB(251, 172, 182);
  if AViewInfo.GridRecord.Values[VSOSID.Index] = GET_VIPNAZ then
    ACanvas.Brush.Color:=RGB(118, 245, 188);
end;

procedure TfrmSearchLab.odsNazAfterOpen(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

procedure TfrmSearchLab.odsNazAfterScroll(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

end.
