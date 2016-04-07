unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Oracle, SMMainAPI,
  OracleData, dxSkinsdxBarPainter, dxBar, ActnList, ImgList, JvDBUtils,
  frxClass, frxDBSet, uGlobalConst, Menus, cxGridExportLink, ExtCtrls,
  cxSplitter, cxContainer, cxLabel, dxBarExtItems, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxCheckBox, cxBarEditItem, JvStringHolder, Registry, Jpeg,
  word2000, uReportUtils, ShellAPI, cxImageComboBox;

type
  TfrmMain = class(TForm)
    TV: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    os: TOracleSession;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    TVFD_RUN: TcxGridDBColumn;
    VISSLNAME: TcxGridDBColumn;
    VNUMMK: TcxGridDBColumn;
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbRefresh: TdxBarButton;
    al: TActionList;
    aRefresh: TAction;
    IL: TImageList;
    bbProtocol: TdxBarButton;
    bbPrint: TdxBarButton;
    aProtocol: TAction;
    aPrint: TAction;
    frxList: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    sdPopUp: TSaveDialog;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    VVRACHFIO: TcxGridDBColumn;
    VISPOLFIO: TcxGridDBColumn;
    bbParam: TdxBarButton;
    aParam: TAction;
    cciDates: TdxBarControlContainerItem;
    paDates: TPanel;
    cxLabel1: TcxLabel;
    lbBeg: TcxLabel;
    cxLabel3: TcxLabel;
    lbEnd: TcxLabel;
    odsListDates: TOracleDataSet;
    aClearDates: TAction;
    frxListDates: TfrxReport;
    bbClear: TdxBarButton;
    aSnimki: TAction;
    bbSnimki: TdxBarButton;
    VCntSnimki: TcxGridDBColumn;
    ilCntImage: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aProtocolExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frxListGetValue(const VarName: string; var Value: Variant);
    procedure N2Click(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aParamExecute(Sender: TObject);
    procedure aClearDatesExecute(Sender: TObject);
    procedure frxListDatesGetValue(const VarName: string; var Value: Variant);
    procedure aSnimkiExecute(Sender: TObject);
    procedure odsListAfterScroll(DataSet: TDataSet);
    procedure odsListDatesAfterScroll(DataSet: TDataSet);
  private
    sPath : string; // путь к лаунчеру мультивокса
    dicom_show_3d : Boolean;
    get_dicom_port, get_dicom_ip, get_dicom_called, sCallingAET, get_dicom_show : string;
    MedotradeSign : string;
    sSysDate_4Rep, sCompanyName_4Rep, sPacFio_4Rep : string;
    pPACID : Integer;
    dDateBeg, dDateEnd : TDateTime;
    procedure CheckEnabledButtons;
    procedure DoResult(nNazID: Integer);
    procedure BmpToJPEG(pFNAME1,pFNAME2:String);
    function PhysicalResolveFileType(AStream: TStream): Integer;
//    procedure DoWordProcess(path : String; FormatPr: Integer = 0; bLandscape: Boolean = false);
    { Private declarations }
  public
    pSOTRID : Integer;
    PanelHandle : Integer;
    procedure DoShowFrmMain(nPACID : Integer; nSOTRID : Integer);
    procedure UnloadDll;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses uPeriod, fPreview, uPrintDocument;
{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.aClearDatesExecute(Sender: TObject);
begin
  cciDates.Visible := ivNever;
  aClearDates.Visible := False;
  aClearDates.Enabled := False;
  dsList.DataSet := odsList;
  odsList.Close;
  odsList.Open;
  CheckEnabledButtons;
end;

procedure TfrmMain.aParamExecute(Sender: TObject);
begin
  with TfrmParamDate.Create(Self) do
    begin
      if Execute then
        begin
          if ModalResult = MrOK then
            begin
              dDateBeg := Period.First;
              dDateEnd := Period.Last;
              lbBeg.Caption := DateTimeToStr(Period.First);
              lbEnd.Caption := DateTimeToStr(Trunc(Period.Last));
              cciDates.Visible := ivAlways;
              aClearDates.Visible := True;
              aClearDates.Enabled := True;
              dsList.DataSet := odsListDates;
              odsListDates.Close;
              odsListDates.SetVariable('PFK_PACID', pPACID);
              odsListDates.SetVariable('PDATE1', Period.First);
              odsListDates.SetVariable('PDATE2', Period.Last);
              odsListDates.Open;
              CheckEnabledButtons;
            end;
        end;
      Free;
    end;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS FROM DUAL ';
    ods.Open;
    sSysDate_4Rep := ods.FieldByName('DATESYS').AsString;
    id := dsList.DataSet.FieldByName('FK_ID').AsInteger;
    frxDBDataset1.DataSet := dsList.DataSet;
    if dsList.DataSet = odsListDates then
      begin
        frxListDates.ShowReport;
      end else
      begin
        frxList.ShowReport;
      end;
    dsList.DataSet.Locate('FK_ID', id, []);
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aProtocolExecute(Sender: TObject);
begin
  DoResult(dsList.DataSet.FieldByName('FK_ID').AsInteger);
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(dsList.DataSet);
  CheckEnabledButtons;
end;

procedure TfrmMain.aSnimkiExecute(Sender: TObject);
var Reg : TRegistry;
    ods : TOracleDataSet;
    sGuid, sIB : string;
  vDataSet: TOracleDataSet;
  vDicom_port,
  vDicom_ip,
  vType: String;
  vDicom_called: String;
  sPath: String;
  //frmSnimok: TfrmSnimok;
  vNazID: integer;
  sCallingAET: string;
  pfc_guid: String;
  IbNum: String;
  IsRG: boolean;

// Отображение снимков по пациенту/исследованию (для АТРИС)
p_showSnimki : procedure (  p_AppHandl : THandle;
                            p_OracleSession: pointer;
                            p_patientID:string;
                            p_AccessionNumber:string;
                            p_studyUID:string;
                            p_old_form : Boolean ;
                            p_use_c_get : Boolean
                         ); stdcall;
DLL_HANDLE: THandle;
const c_fileDLL = 'DICOM_Viewer.dll';
var v_an, v_pid : string; v_testfile:string;
  function f_gtTSMINI ( p_key : string; p_section : string ) : string;
  var v_OraclePackage : TOraclePackage;
  begin
    v_OraclePackage := TOraclePackage.Create(nil);
    try
      v_OraclePackage.Session := os;
      v_OraclePackage.PackageName:='asu.PKG_SMINI';
      try
        Result:=v_OraclePackage.CallStringFunction('READSTRING',[p_key,p_section,'']);
      except
        on E:Exception do
          MessageDlg('Ошибка '+E.Message, mtError, [mbOK], 0);
      end;
    finally
      v_OraclePackage.Free;
    end;
  end;
var vRunStr, vExeFile : string;
  function Exec(pCommandLine, pCurDir: string): THandle;
  var
    StInfo : TStartupInfo;
    SeAttr : TSecurityAttributes;
    ProcInfo : TProcessInformation;
    ProcHandle : THandle;
  begin
    FillChar(StInfo,SizeOf(StInfo),0);
    StInfo.cb := SizeOf(StInfo);
    stInfo.dwFlags:=STARTF_USESHOWWINDOW;
    StInfo.wShowWindow:=SW_SHOWDEFAULT;

    SeAttr.nLength:=SizeOf(SeAttr);
    SeAttr.bInheritHandle:=true;
    SeAttr.lpSecurityDescriptor:=nil;

    if CreateProcess(nil, PChar(pCommandLine), @SeAttr, @SeAttr, False,
      NORMAL_PRIORITY_CLASS, nil, PChar(pCurDir), StInfo, ProcInfo) then
      Result := ProcInfo.hProcess
    else
      Result:= 0;
  end;  
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    if ((not Reg.OpenKeyReadOnly('\Software\Alda\MultiVox\Installation')) or (f_gtTSMINI('DLL_WORKLIST_NAZN','MYWORKLIST_USE')='1') or fileexists(ExtractFilePath(ParamStr(0))+'\testdicom.dat')) then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select fc_guid from asu.vnaz_guid where fk_nazid = :pfk_nazid ';
        ods.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('fk_id').AsInteger);
        ods.Open;
        sGuid := ods.FieldByName('fc_guid').AsString;
        sIB := dsList.DataSet.FieldByName('numib').AsString;
        //
        if f_gtTSMINI('XRAY',  'RUNVIEWERDLL')='1' then
        begin
          if FileExists(c_fileDLL) then
            begin
              DLL_HANDLE:= LoadLibrary(c_fileDLL);
              Try
                if DLL_HANDLE <> 0 then
                begin
                  @p_showSnimki := GetProcAddress(DLL_HANDLE, 'p_showSnimki');
                  if @p_showSnimki <> nil then
                  begin
                    v_pid := sIB; // номер ИБ с годом, т.е. 123/2012   // merFIOMK.Properties.Editors[1].Value;
                    v_an  := sGuid; // номер протокола vnaz.fc_type для рентгена  // rowNumProt.Properties.Value;
                    try
                      p_showSnimki( Application.Handle,
                                   os.ExternalSVC,
                                   v_pid, // merFIOMK.Properties.Editors[1].Value
                                   v_an,  // erowNumProt.Properties.Value
                                   '',    // p_studyUID
                                   True,   // old_form
                                   True
                                );
                    except
                    on E:Exception do
                      MessageDlg('Внимание! '+#13+#10+
                                 'Ошибка загрузки модуля '+c_fileDLL +#10#13+E.Message
                                 , mtError, [mbOK], 0);
                    end;
                  end;
                end;
              Finally
                FreeLibrary(DLL_HANDLE);
              End;
            end else
              MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
        end else
        begin // SOKB
          vExeFile:=ExtractFilePath( ParamStr(0) )+'\DicomClient.exe';
          if FileExists( vExeFile ) then
          begin
            vRunStr := 'asDicomViewer 1 '+               // check_viewer v_isPostgres
              f_gtTSMINI('XRAY', 'PACS_DATABASE')+' '+   // v_pg_database
              f_gtTSMINI('XRAY', 'PACS_PORT')+' '+       //
              f_gtTSMINI('XRAY', 'PACS_SERVER')+' '+     //
              f_gtTSMINI('XRAY', 'PACS_USERNAME')+' '+   //
              f_gtTSMINI('XRAY', 'PACS_PASSWORD')+' '+   //
              f_gtTSMINI('XRAY', 'PACS_SCHEMA')+' '+     //
              sGuid;               // accessionnumber
              try
                Exec(vExeFile+' '+vRunStr,ExtractFilePath(ParamStr(0)));
              except
                on E:Exception do
                  ShowMessage(E.Message);
              end;
          End else ShowMessage('Файл '+ExtractFilePath( ParamStr(0) )+'\DicomClient.exe'+' не найден.');
        end;
      finally
        ods.Free;
      end;
    end else
    begin
      frmMain.sPath := Reg.ReadString('Path');
      ShellExecute(Application.Handle,
                   pChar('open'),
                   pChar(frmMain.sPath+'MvLauncher.exe'),
                   PChar('-cmd:Load -StudyExternalID:'+IntToStr(odsList.FieldByName('fk_id').AsInteger)),
                   pChar(frmMain.sPath),
                   SW_SHOWNORMAL);
    end;
  finally
    Reg.Free;
  end;
end;

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.BmpToJPEG(pFNAME1, pFNAME2: String);
var
  JPEG: TJPEGImage;
  Bitmap: TBitmap;
  Image1: TImage;
  lStream: TFileStream;
begin
  lStream:=TFileStream.Create(ExtractFilePath(paramstr(0))+'RGIMAGES'+pFNAME2,fmOpenRead);
  try
    if PhysicalResolveFileType(lStream)=1 then
      begin
        lStream.Free;
        JPEG := TJPEGImage.Create;
        Bitmap := TBitmap.Create;
        Image1:=timage.create(nil);
        try
          Bitmap.LoadFromFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+pFNAME2);
          JPEG.Assign(Bitmap);
          Image1.Picture.Assign(JPEG);
          Image1.Picture.SaveToFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+pFNAME1);
        finally
          Image1.free;
          JPEG.Free;
          Bitmap.Free;
        end;
      end
      else
          lStream.Free;
  except
    lStream.Free;
  end;
end;

procedure TfrmMain.CheckEnabledButtons;
begin
  aProtocol.Enabled := dsList.DataSet.RecordCount <> 0;
  aPrint.Enabled := dsList.DataSet.RecordCount <> 0;
end;

procedure TfrmMain.DoResult(nNazID: Integer);
var q : TOracleDataSet;
    ods : TOracleDataSet;
    LOB : TLOBLocator;
    IDRes : Integer;
    RegSave, RegLoad : TRegIniFile;
begin
  Application.CreateForm(TfrmPreview, frmPreview);
  RegLoad := TRegIniFile.Create;
  try
    RegLoad.RootKey := HKEY_CURRENT_USER;
    RegLoad.OpenKey('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSotrID), True);
    frmPreview.bbFormat.ItemIndex := RegLoad.ReadInteger('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSOTRID), 'RazmerList', 0);
  finally
    RegLoad.Free;
  end;
  if not DirectoryExists(ExtractFilePath(paramstr(0))+'RGIMAGES') then
    CreateDir(ExtractFilePath(paramstr(0))+'RGIMAGES');
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID FROM asu.VRES WHERE FK_NAZID = :pfk_nazid ';
    ods.DeclareAndSet('pfk_nazid', otInteger, nNazID);
    ods.Open;
    IDRes := ods.FieldByName('FK_ID').AsInteger;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT THTMLIMAGES.FC_NAME||''.JPG'' SFILENAME, THTMLIMAGES.FB_BLOB '+#13+
                    '   FROM ASU.TRICHVIEWDATA, ASU.THTMLIMAGES '+#13+
                    '  WHERE TRICHVIEWDATA.FK_PACID = :pfk_pacid '+#13+
                    '    AND THTMLIMAGES.FK_RICHVIEW=TRICHVIEWDATA.FK_ID ';
    ods.DeclareAndSet('pfk_pacid', otInteger, nNazID);
    ods.Open;
    if ods.RecordCount > 0 then
      begin
        while not ods.Eof do
          begin
            TBlobField(ods.FieldByName('FB_BLOB')).SaveToFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+ods.FieldByName('SFILENAME').AsString);
            BmpToJPEG(ods.FieldByName('SFILENAME').AsString, ods.FieldByName('SFILENAME').AsString);
            ods.Next;
          end;
      end;
  finally
    ods.Free;
  end;
  q:=TOracleDataSet.Create(nil);
  q.Session:=os;
  q.Cursor := crSQLWait;
  LOB:=TLOBLocator.Create(os, otCLOB);
  q.DeclareVariable('html', otCLOB);
  q.SetComplexVariable('html', LOB);
  q.SQL.Add(' BEGIN ');
  q.SQL.Add('  dbms_lob.createtemporary(:html, TRUE, dbms_lob.SESSION);');
  q.SQL.Add('  dbms_lob.WRITE(:html,1,1,'' '');');
  q.SQL.Add('  :html:='+'STAT.PKG_IBXML.GET_HTM_OSM('+IntToStr(IDRes)+');');
  q.SQL.Add(' END; ');
  q.Open;

  LOB:=TLOBLocator(q.GetComplexVariable('html'));
  LOB.SaveToFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(dsList.DataSet.FieldByName('FK_PACID').AsInteger) +'print.htm');
  q.Free;
  LOB.Free;
  frmPreview.wb.Navigate(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(dsList.DataSet.FieldByName('FK_PACID').AsInteger) +'print.htm');
  frmPreview.ShowModal;
  if frmPreview.ModalResult = MrOk then
    begin
      RegSave := TRegIniFile.Create;
      RegSave.RootKey:=HKEY_CURRENT_USER;
      if not RegSave.OpenKey('\Software\Softmaster\Print\', FALSE) then
        begin
          RegSave.CreateKey('\Software\Softmaster\Print');
        end;
      try
        RegSave.WriteInteger('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSotrID), 'RazmerList', frmPreview.bbFormat.ItemIndex);
      except
      end;
      RegSave.Free;
      DoPrintDocument(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(dsList.DataSet.FieldByName('FK_PACID').AsInteger) +'print.htm',
                      frmPreview.bbFormat.ItemIndex);
      try
        DeleteFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(dsList.DataSet.FieldByName('FK_PACID').AsInteger) +'print.htm');
      except
      end;
      frmPreview.Free;
    end else
    begin
      try
        DeleteFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(dsList.DataSet.FieldByName('FK_PACID').AsInteger) +'print.htm');
      except
      end;
      frmPreview.Free;
    end;
end;

procedure TfrmMain.DoShowFrmMain(nPACID : Integer; nSOTRID : Integer);
var ods : TOracleDataSet;
begin
  pPACID := nPACID;
  pSOTRID := nSOTRID;
  MedotradeSign := ReadMedotradeSign;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select asu.pkg_smini.readstring(''CONFIG'', ''S_FULLNAME'', '''') as companyname, '+#13+
                    '        asu.pkg_regist_pacfunc.get_pac_fio(:pfk_pacid) as pacfio '+#13+
                    '   FROM DUAL ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.Open;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
    sPacFio_4Rep := ods.FieldByName('PACFIO').AsString;
    dicom_show_3d := True; // по умолчанию не включаем 3D
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fc_value, fc_key from asu.tsmini where fc_section = ''XRAY'' order by fk_id ';
    ods.Open;
    ods.First;
    while not ods.Eof do
      begin
        if ods.FieldByName('fc_key').AsString = 'SHOW_DICOM' then
          begin
            if ods.FieldByName('fc_value').AsString = '' then
              get_dicom_show := '0'
            else
              get_dicom_show := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_PORT' then
          begin
            get_dicom_port := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_IP' then
          begin
            get_dicom_ip := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_CALLED_AE' then
          begin
            get_dicom_called := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_SHOW_3D' then // Показывать кнопку "Включить 3D"
          begin
            if ods.FieldByName('fc_value').AsString = '-1' then // обратная логика если True, то не показываем 3D
              dicom_show_3d := False
            else
              dicom_show_3d := True;
          end;
        ods.Next;
      end;

    odsList.Close;
    odsList.SetVariable('PFK_PACID', nPACID);
    odsList.Open;
    TV.StoreToRegistry('\SoftWare\SoftMaster\ListLab\tvSotr_' + IntToStr(pSOTRID)+'Default', True, [], 'TV');
    TV.RestoreFromRegistry('\SoftWare\SoftMaster\ListLab\tvSotr_' + IntToStr(pSOTRID), False, False, [], 'TV');
    VCntSnimki.Visible := get_dicom_show = '-1';
  finally
    ods.Free;
  end;
end;

//procedure TfrmMain.DoWordProcess(path: String; FormatPr: Integer; bLandscape: Boolean);
//var
//  WordApp : TWordApplication;
//  WordDoc : TWordDocument;
//  Template, NewTemplate, FileName,
//  ConfirmConversions, ReadOnly, AddToRecentFiles,
//  PasswordDocument, PasswordTemplate, Revert,
//  WritePasswordDocument, WritePasswordTemplate,
//  Format, Encoding, EmPar, Visible,
//  Background, time,SaveCHanges,OriginalFormat,
//  RouteDocument : OleVariant;
//begin
//  Screen.Cursor := crHourGlass;
//  EmPar:='';
//  WordApp:=TWordApplication.Create(nil);
//  WordDoc:=TWordDocument.Create(nil);
//  try
//    Template:='';
//    NewTemplate:=True;
//    try
//      WordApp.Connect;
//    except
//      WordDoc.Close;
//      WordDoc.Free;
//      Wordapp.Quit;
//      WordApp.Free;
//      Application.Terminate; //???
//    end;
//    Wordapp.Visible:=false;
//    WordApp.Options.CheckSpellingAsYouType:=False;
//    WordApp.Options.CheckGrammarAsYouType:=False;
//    FileName:=path;
//    ConfirmConversions:=FALSE;
//    ReadOnly:=FALSE;
//    AddToRecentFiles:=FALSE;
//    PasswordDocument:= '';
//    PasswordTemplate:= '';
//    Revert:=FALSE;
//    WritePasswordDocument:= '';
//    WritePasswordTemplate:= '';
//    Format:=wdOpenFormatAuto;
//    Visible:=TRUE;
//    WordDoc.ConnectTo(WordApp.Documents.Open(FileName, ConfirmConversions, ReadOnly, AddToRecentFiles, PasswordDocument, PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate, Format, Encoding, visible));
//    BackGround:=False;
//    Time:=WordApp.Documents.Count;
//
//    if FormatPr = 1 then
//      begin
//        WordDoc.PageSetup.LineNumbering.Active := 0;
//        WordDoc.PageSetup.Orientation := wdOrientLandscape;
//        WordDoc.PageSetup.TopMargin := 22.5;
//        WordDoc.PageSetup.BottomMargin := 22.5;
//        WordDoc.PageSetup.LeftMargin := 56.7;
//        WordDoc.PageSetup.RightMargin := 56.7;
//        WordDoc.PageSetup.Gutter := 0;
//        WordDoc.PageSetup.HeaderDistance := 35.4;
//        WordDoc.PageSetup.FooterDistance := 35.4;
//        WordDoc.PageSetup.PageWidth := 595.35;
//        WordDoc.PageSetup.PageHeight := 419.55;
//        WordDoc.PageSetup.FirstPageTray := wdPrinterDefaultBin;
//        WordDoc.PageSetup.OtherPagesTray := wdPrinterDefaultBin;
//        WordDoc.PageSetup.SectionStart := wdSectionNewPage;
//        WordDoc.PageSetup.OddAndEvenPagesHeaderFooter := 0;
//        WordDoc.PageSetup.DifferentFirstPageHeaderFooter := 0;
//        WordDoc.PageSetup.VerticalAlignment := wdAlignVerticalTop;
//        WordDoc.PageSetup.SuppressEndnotes := 0;
//        WordDoc.PageSetup.MirrorMargins := 0;
//        WordDoc.PageSetup.TwoPagesOnOne := FALSE;
//        WordDoc.PageSetup.GutterPos := wdGutterPosLeft;
//      end else
//      begin
//        WordDoc.PageSetup.Orientation:= wdOrientPortrait;
//        WordDoc.PageSetup.TextColumns.SetCount(1);
//      end;
//
//    WordApp.ActiveWindow.View.Type_:=wdPageView;
//    TReportUtils.AddMedotradeSign(WordApp);
//    WordApp.PrintOut(BackGround);
//    SaveChanges := WdDoNotSaveChanges;
//    WordApp.Quit(SaveChanges,OriginalFormat,RouteDocument) ;
//    try
//      WordApp.Disconnect;
//    except
//      on E: Exception do
//        begin
//          Showmessage(E.Message);
//          WordApp.Disconnect;
//        end;
//    end;
//  except
//    on E: Exception do
//      begin
//        ShowMessage(E.Message);
//        WordApp.Disconnect;
//      end;
//  end;
//  try
//    WordDoc.free;
//    WordApp.free;
//  finally
//    Screen.Cursor := crArrow;
//  end;
//end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
  aClearDates.Visible := False;
  aClearDates.Enabled := False;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  PostMessage(Handle, WM_ACTIVATE, WA_ACTIVE, 0);
end;

procedure TfrmMain.frxListDatesGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'DATESYS' then Value := sSysDate_4Rep;
  if VarName = 'PACFIO' then Value := sPacFio_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if VarName = 'PDATE1' then Value := dDateBeg;
  if VarName = 'PDATE2' then Value := lbEnd.Caption;
end;

procedure TfrmMain.frxListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'DATESYS' then Value := sSysDate_4Rep;
  if VarName = 'PACFIO' then Value := sPacFio_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\ListLab\tvSotr_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TV');
end;

procedure TfrmMain.odsListAfterScroll(DataSet: TDataSet);
begin
  aSnimki.Visible := (odsList.FieldByName('fk_resultid').AsInteger = 1) and (get_dicom_show = '-1');
end;

procedure TfrmMain.odsListDatesAfterScroll(DataSet: TDataSet);
begin
  aSnimki.Visible := (odsListDates.FieldByName('fk_resultid').AsInteger = 1) and (get_dicom_show = '-1');
end;

function TfrmMain.PhysicalResolveFileType(AStream: TStream): Integer;
var p: PChar;
begin
  Result := 0;
  if not Assigned(AStream) then
    Exit;
  GetMem(p, 10);
  try
    AStream.Position := 0;
    AStream.Read(p[0], 10);
    {bitmap format}
    if (p[0] = #66) and (p[1] = #77) then
      Result := 1;
    {tiff format}
    if ((p[0] = #73) and (p[1] = #73) and (p[2] = #42) and (p[3] = #0)) or
      ((p[0] = #77) and (p[1] = #77) and (p[2] = #42) and (p[3] = #0)) then
      Result := 2;
    {jpg format}
    if (p[6] = #74) and (p[7] = #70) and (p[8] = #73) and (p[9] = #70) then
      Result := 3;
    {png format}
    if (p[0] = #137) and (p[1] = #80) and (p[2] = #78) and (p[3] = #71) and
      (p[4] = #13) and (p[5] = #10) and (p[6] = #26) and (p[7] = #10) then
      Result := 4;
    {dcx format}
    if (p[0] = #177) and (p[1] = #104) and (p[2] = #222) and (p[3] = #58) then
      Result := 5;
    {pcx format}
    if p[0] = #10 then
      Result := 6;
    {emf format}
    if (p[0] = #215) and (p[1] = #205) and (p[2] = #198) and (p[3] = #154) then
      Result := 7;
    {emf format}
    if (p[0] = #1) and (p[1] = #0) and (p[2] = #0) and (p[3] = #0) then
      Result := 7;
  finally
    Freemem(p);
  end;
end;

procedure TfrmMain.UnloadDll;
begin
  TV.StoreToRegistry('\SoftWare\SoftMaster\ListLab\tvSotr_' + IntToStr(pSOTRID), TRUE, [], 'TV');
end;

end.
