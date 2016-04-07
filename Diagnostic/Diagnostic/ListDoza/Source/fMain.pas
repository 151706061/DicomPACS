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
  StdCtrls, cxButtons, cxCheckBox, cxBarEditItem, dxSkinCaramel,
  dxSkinOffice2007Green, Registry, ShellAPI,  IniFiles, cxImageComboBox,
  RVScroll, RichView, RVEdit, frxExportHTML, RVStyle, cxSpinEdit;

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
    VDOZA: TcxGridDBColumn;
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
    frxRepProsmotr: TfrxReport;
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
    VSOS: TcxGridDBColumn;
    chMrt: TcxBarEditItem;
    frxXrayOperProt: TfrxReport;
    VSNIMOK: TcxGridDBColumn;
    ilCntImage: TImageList;
    bbCD: TdxBarButton;
    aCD: TAction;
    rveText: TRichViewEdit;
    frxHTMLExport1: TfrxHTMLExport;
    rvs: TRVStyle;
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
    procedure frxRepProsmotrGetValue(const VarName: string; var Value: Variant);
    procedure aParamExecute(Sender: TObject);
    procedure aClearDatesExecute(Sender: TObject);
    procedure frxListDatesGetValue(const VarName: string; var Value: Variant);
    procedure aSnimkiExecute(Sender: TObject);
    procedure chMrtPropertiesEditValueChanged(Sender: TObject);
    procedure frxXrayOperProtGetValue(const VarName: string;
      var Value: Variant);
//    procedure DicomServerCore11DicomImage(AClientThread: TDicomClientThread;
//      AAddress: string; ADataset: TDicomDataset);
    procedure odsListAfterScroll(DataSet: TDataSet);
    procedure odsListDatesAfterScroll(DataSet: TDataSet);
    procedure aCDExecute(Sender: TObject);
  private
    dicom_show_3d : Boolean;
    MedotradeSign : string;
    sSysDate_4Rep, sCompanyName_4Rep, sPacFio_4Rep, sOtdelName_4Rep : string;
    sTextIssl_4rep, sNumIssl_4rep : string;
    dDateRojd_4Rep : TDateTime;
    pPACID : Integer;
    dDateBeg, dDateEnd : TDateTime;
    DicomPort, DicomIP, DicomCalledAE, get_dicom_show, get_use_cmove, get_local_port, sCallingAET, get_db_name : string;
    get_xray_mrt : Integer;
    sPath : string; // путь к лаунчеру мультивокса
    procedure CheckEnabledButtons;
    procedure DoRefreshParameters;
    { Private declarations }
  public
    pSOTRID : Integer;
    PanelHandle : Integer;
    procedure DoShowFrmMain(nPACID : Integer; nSOTRID : Integer);
    procedure UnloadDll;
    function f_gtTSMINI ( p_key : string; p_section : string ) : string;
  end;

var
  frmMain: TfrmMain;

implementation
uses uPeriod, uPrintType, frxExportRTF, fPreview, uDBTableUtils, uPrintDocument;
{$R *.dfm}

{ TfrmMain }

function TfrmMain.f_gtTSMINI ( p_key : string; p_section : string ) : string;
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

procedure TfrmMain.aCDExecute(Sender: TObject);
begin
 { Application.CreateForm(TfrmCD, frmCD);
  frmCD.DoShowForm(DicomIP,
                   DicomPort,
                   DicomCalledAE,
                   sCallingAET,
                   sPacFio_4Rep,
                   os,
                   dsList.DataSet.FieldByName('fk_id').AsInteger,
                   dsList.DataSet.FieldByName('date_run').AsDateTime,
                   1,
                   dsList.DataSet.FieldByName('fc_type').AsString);
  try
    frmCD.ShowModal;
  finally
    frmCD.Free;
  end;  }
end;

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
              lbBeg.Caption := DateTimeToStr(trunc(Period.First));
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
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS '+
                    '   FROM DUAL ';
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

function GetTempDirectory: AnsiString;
var Buf: array[0..MAX_PATH - 1] of AnsiChar;
begin
  GetTempPath(SizeOf(Buf), @Buf);
  Result := IncludeTrailingBackslash(PChar(@Buf));
end;

procedure CmnHeadPartRep( pFrxReport : TFrxReport;
                          frxHTMLExport1: TfrxHTMLExport;
                          frxRTFExport1: TfrxRTFExport;
                          rveText: TRichViewEdit;
                         // pBeforePrintCallBack : TBeforePrintCallBack;
                          pFrxObjName:string = 'Memo8';
                          pIsUsePreviewForm : Boolean = False
                        );
var vFileName, vFileName1, vFileName2, vDir, vDirMn : ansistring;
    vGetTickCount, vText8Tmp, vStr1, vStr2 : string;
    vStrMain, vStrText, vStrRes : TStringList;
    aBeforePrintCallBack: TBeforePrintCallBack;
    vPos,i,j:integer;
   // frmPreview : TfrmPreview;
    Preview, pShowTopMargin : boolean;
const cTmpStrRepl = '##########';
begin
  vDirMn:=GetCurrentDir;
  vDir:= GetTempDirectory;
  SetCurrentDir(vDir);
  vGetTickCount := inttostr(GetTickCount);
  If not DirectoryExists(vGetTickCount) then CreateDir(vGetTickCount);
  vDir:=vDir+vGetTickCount+'\';
  vFileName := vDir+vGetTickCount+'.html';  // ExtractFilePath(paramstr(0))
  vFileName2 := vDir+vGetTickCount+'1.html';
  vFileName1 := vDir+vGetTickCount+'2.html';
  frxHTMLExport1.FileName:=vFileName;

  try // для восстановления
    vText8Tmp:=(pFrxReport.FindObject(pFrxObjName) as TfrxMemoView).Memo.Text;
  except
  on E:Exception do
    begin
      ShowMessage('ERROR (It''s necessary to change object name in report) : '+E.Message+' seek '+pFrxObjName+' in '+pFrxReport.Name);
      Exit;
    end;
  end;
  (pFrxReport.FindObject(pFrxObjName) as TfrxMemoView).Memo.Text := cTmpStrRepl;
  try
    pFrxReport.PrepareReport(True);
  except
  on E:Exception do
    begin
      ShowMessage('ERROR : '+E.Message+' in report : '+pFrxObjName);
      Exit;
    end;
  end;  

  pFrxReport.Export( frxHTMLExport1 );
  (pFrxReport.FindObject(pFrxObjName) as TfrxMemoView).Memo.Text := vText8Tmp;  // для восстановления
  rveText.SaveHTMLEx(vFileName2, '', 'img', '', '', '', [rvsoOverrideImages, rvsoUTF8, rvsoMiddleOnly, rvsoInlineCSS]);

    vStrMain := TStringList.Create;
    vStrText := TStringList.Create;
    vStrRes  := TStringList.Create;
    try
      vStrMain.LoadFromFile(vFileName);
      vStrText.LoadFromFile(vFileName2);
      for I := 0 to vStrMain.Count - 1 do
      begin
        vPos:=Pos(cTmpStrRepl,vStrMain[i]);
        if vPos>0 then
        begin
          vStr1:=Copy(vStrMain[i],0,vPos-1);
          vStr2:=Copy(vStrMain[i],vPos+Length(cTmpStrRepl));
          vStrRes.Append(vStr1);
          for j := 0 to vStrText.Count - 1 do
            vStrRes.Append(vStrText[j]);
          vStrRes.Append(vStr2);
        end else
          vStrRes.Append(vStrMain[i]);
      end;
    finally
      vStrRes.SaveToFile(vFileName1);
      vStrMain.Free;
      vStrText.Free;
      vStrRes.Free;
    end;     

    uPrintType.vLeftMargin:=20;
    uPrintType.vRightMargin:=10;
    uPrintType.vGutter := 0;
    uPrintType.vTopMargin:=0;
    uPrintType.vBottomMargin:=0;
    uPrintType.vSetGutter := True;
    if pIsUsePreviewForm then
    begin
     { ShowMessage( 'vFileName='+vFileName+#10+#13+
                   'vFileName2=' + vFileName2 ); }

      Application.CreateForm(TfrmPreview, frmPreview);
      try
        frmPreview.bbFormat.ItemIndex := 0;
        frmPreview.vDocFileName := vFileName1;
        frmPreview.wb.Navigate(vFileName1);
        frmPreview.ShowModal;
        if frmPreview.ModalResult = MrOk then
        begin
          Preview := frmPreview.Tag = 1;
          pShowTopMargin := TDBUtils.GetFunctionDef('GET_TOP_MARGIN_PRIEM_VIEW', frmMain.OS,0) = 1;
          DoPrintDocument( vFileName1,
                           frmPreview.bbFormat.ItemIndex,
                           FALSE,
                           Preview,
                           aBeforePrintCallBack,
                           frmPreview.cxKolvoCopy.Value,
                           false,
                           true,
                           pShowTopMargin);
        end;
      finally
        FreeAndNil(frmPreview);
        if FileExists(vFileName) then DeleteFile(vFileName);
        if FileExists(vFileName1) then DeleteFile(vFileName1);
        if FileExists(vFileName2) then DeleteFile(vFileName2);
      end;
    end else
    begin
      DoPrintDocument( vFileName1,                      // sCurFile: string;
                       -1,                              // FormatPr: Integer = 0;
                       False,                          // bLandscape: Boolean = false;
                       False,                          // pPreview: boolean = false;
                       TBeforePrintCallBack(nil),      //
                       1,                              // KolvoCopy: Integer = 1;
                       True,                           // AShowWord: boolean = false; //показывать ворд без предпросмотра, по просьбе Ковалевой 28.05.2012 Melnikov
                       false,                          // SetPassWord : boolean = TRUE; //Устанавливать пароль или нет
                       false                           // SetMarginTop: boolean = FALSE;
                                                       // APaperSize : integer = 7
                     );    //  pBeforePrintCallBack
    end;
    uPrintType.vLeftMargin:=0;
    uPrintType.vRightMargin:=0;
    uPrintType.vGutter := 0;
    uPrintType.vTopMargin:=0;
    uPrintType.vBottomMargin:=0;
    uPrintType.vSetGutter := False;

    try
      if DirectoryExists(ExtractFilePath(vFileName))
      then
        RemoveDir(ExtractFilePath(vFileName));
      if DirectoryExists(ExtractFilePath(vFileName2))
      then
        RemoveDir(ExtractFilePath(vFileName2));
      if DirectoryExists(ExtractFilePath(vFileName1))
      then
        RemoveDir(ExtractFilePath(vFileName1));
    except end;
end;

procedure TfrmMain.aProtocolExecute(Sender: TObject);
var ods : TOracleDataSet; memStream : TMemoryStream;
    ItemNo, i : Integer;
    vStream : TMemoryStream;
const cBR = 9;
begin
  if dsList.DataSet.FieldByName('fk_type').AsInteger = -1 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select fb_text from asu.trichviewdata where fk_pacid = :pfk_id ';
        ods.DeclareAndSet('PFK_ID', otInteger, dsList.DataSet.FieldByName('FK_ID').AsInteger);
        ods.Open;
        sTextIssl_4REP := ods.FieldByName('fb_text').AsString;
      finally
        ods.Free;
      end;
      frxXrayOperProt.ShowReport; // рентгенхирургические протоколы, операции
    end else
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FK_ID, '+#13+
                        '        (SELECT FB_TEXT FROM ASU.TRICHVIEWDATA WHERE FK_PACID = TNAZIS.FK_ID) AS TEXTISSL, '+#13+
                        '        (SELECT FB_BLOB FROM asu.TRICHVIEWDATA WHERE FK_PACID = TNAZIS.FK_ID) AS BLOBISSL, '+#13+
                        '        DECODE(ASU.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID), '+#13+
                        '               ASU.GET_XRAY_FLU, '+#13+
                        '               (SELECT MAX(FC_CHAR) '+#13+
                        '                  FROM ASU.TIB '+#13+
                        '                 WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                        '                   AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER'')), '+#13+
                        '               (SELECT MAX(FC_CHAR) '+#13+
                        '                  FROM ASU.TIB '+#13+
                        '                 WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                        '                   AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL''))) AS NUMBER_ISSL, '+#13+
                        '        ASU.PKG_REGIST_PACFUNC.GET_PAC_BITH(TNAZIS.FK_PACID) AS DATE_ROJD '+#13+
                        '   FROM ASU.TNAZIS '+#13+
                        '  WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, dsList.DataSet.FieldByName('FK_ID').AsInteger);
        ods.Open;
        sTextIssl_4rep := ods.FieldByName('TEXTISSL').AsString;
        sNumIssl_4rep := ods.FieldByName('NUMBER_ISSL').AsString;
        //
        rveText.Visible:=false;
        if frmMain.get_db_name = 'SO' then
        begin
          memStream := TMemoryStream.Create;
          try
            TBlobField(ods.FieldByName('BLOBISSL')).SaveToStream(memStream);
            memStream.Position := 0;
            rveText.Clear;
            rveText.LoadRVFFromStream(memStream);
            rveText.Format;
          finally
            memStream.Free;
          end;
        end;
        //
        frxRepProsmotr.FindObject('memo9').Visible := dsList.DataSet.FieldByName('smowner').AsInteger <> get_xray_mrt;
      finally
        ods.Free;
      end;
      if frmMain.get_db_name = 'SO' then
      begin
        vStream := TMemoryStream.Create;
        rveText.SaveRTFToStream(vStream, False);
        vStream.Position:=0;
        try

         // ShowMessage('rveText.LineCount='+inttostr(rveText.LineCount));

          ItemNo := 47;
          if ((rveText.LineCount>ItemNo) and (rveText.LineCount<ItemNo+cBR)) then
          begin
            rveText.SetSelectionBounds(ItemNo, rveText.GetOffsBeforeItem(ItemNo),
              ItemNo, rveText.GetOffsBeforeItem(ItemNo));
            for I := 1 to cBR do
              rveText.InsertText(#10);
            rveText.Invalidate;
          end;
          rveText.SelectAll;
          CmnHeadPartRep( frxRepProsmotr, frxHTMLExport1, nil, rveText, 'Memo8', True );
          rveText.Visible:=false;
        finally
          rveText.Clear;
          rveText.LoadRTFFromStream(vStream);
          rveText.Format;
          vStream.Free;
        end;
      end else
        frxRepProsmotr.ShowReport;
    end;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
//  RefreshQuery(dsList.DataSet);
  dsList.DataSet.Close;
  dsList.DataSet.Open;
  dsList.DataSet.First;
  CheckEnabledButtons;
end;

procedure TfrmMain.aSnimkiExecute(Sender: TObject);
var
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
  procedure MyShowShimok;
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
                v_pid := dsList.DataSet.FieldByName('numib').AsString;   // merFIOMK.Properties.Editors[1].Value;
                v_an  := dsList.DataSet.FieldByName('fc_type').AsString; // rowNumProt.Properties.Value;
                p_showSnimki(  Application.Handle,
                         frmMain.os.ExternalSVC,
                         v_pid, // merFIOMK.Properties.Editors[1].Value
                         v_an,  // erowNumProt.Properties.Value
                         '',    // p_studyUID
                         False ,  // old_form
                         True   //  p_use_c_get
                      );
              end;
            end;
          Finally
            FreeLibrary(DLL_HANDLE);
          End;
        end else
          MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
  end;
var Reg : TRegistry;
    vRunStr, vExeFile : string;
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
  if (f_gtTSMINI('DLL_WORKLIST_NAZN','MYWORKLIST_USE')='1') or fileexists(ExtractFilePath(ParamStr(0))+'\testdicom.dat') then
  begin
    if f_gtTSMINI('XRAY',  'RUNVIEWERDLL')='1' then
    begin
      MyShowShimok;
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
          dsList.DataSet.FieldByName('fc_type').AsString;               // accessionnumber
          try
            Exec(vExeFile+' '+vRunStr,ExtractFilePath(ParamStr(0)));
          except
            on E:Exception do
              ShowMessage(E.Message);
          end;
      End else ShowMessage('Файл '+ExtractFilePath( ParamStr(0) )+'\DicomClient.exe'+' не найден.');
    end;
    Exit;
  end;
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
        MyShowShimok;
    end
    else
    begin
        frmMain.sPath := Reg.ReadString('Path');
        ShellExecute(Application.Handle,
                     pChar('open'),
                     pChar(frmMain.sPath+'MvLauncher.exe'),
                     PChar('-cmd:Load -StudyExternalID:'+IntToStr(dsList.DataSet.FieldByName('fk_id').AsInteger)),
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

procedure TfrmMain.CheckEnabledButtons;
begin
  aProtocol.Enabled := dsList.DataSet.RecordCount <> 0;
  aPrint.Enabled := dsList.DataSet.RecordCount <> 0;
  if (get_db_name = 'H') or (get_db_name = 'SO') then
    begin
      aSnimki.Visible := (dsList.DataSet.RecordCount <> 0) ; // and (dsList.DataSet.FieldByName('fk_resultid').AsInteger = 1);
//      aCD.Visible := False;
    end else
    begin
      aSnimki.Visible := dsList.DataSet.RecordCount <> 0;
//      aCD.Visible := aSnimki.Visible;
    end;
end;

procedure TfrmMain.chMrtPropertiesEditValueChanged(Sender: TObject);
begin
  if chMrt.EditValue = 1 then
    begin
      dsList.DataSet.Filter := ' smowner <> '+IntToStr(get_xray_mrt);
      dsList.DataSet.Filtered := True;
    end else
    begin
      dsList.DataSet.Filter := '';
      dsList.DataSet.Filtered := False;
    end;
end;

//procedure TfrmMain.DicomServerCore11DicomImage(AClientThread: TDicomClientThread; AAddress: string; ADataset: TDicomDataset);
//begin
 { // проверяем признак принудительного выхода - устанавливается
  // в форме ползунка
  if CmnUnit.v_exit_progressbar=1 then // остановить прием
  begin
    DicomServerCore1.Stop;
  end else begin  // прием очередного изображения
    MnLg_ev('DicomServerDicomImage MoveImageCount '+inttostr(MoveImageCount)+
             ' / curr_count='+inttostr(v_amm_img_loaded),
             ExtractFilePath(paramstr(0))+'dcmevents.log',
             False );
    // пока принятых снимков меньше общего
    // количества которое ожидается принять
    if v_amm_img_loaded<=MoveImageCount then begin
      // добавили снимок в датасет
      frmSnimok.CnsDMTable1.Add(ADataset);
      inc(v_amm_img_loaded);
      // послали сообщение что снимок принят нормально - 0
      AClientThread.Association.SendStatus(0);
      FrmProgressBar.MyIncPos; // прогрессбар нарастили
      // если снимок последний - остановим прием
      if v_amm_img_loaded>=MoveImageCount then
      begin
        CmnUnit.v_exit_progressbar:=2;  // остановим ползунок
        DicomServerCore1.Stop;
      end;
    end;
  end;  }
//end;

procedure TfrmMain.DoRefreshParameters;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select asu.get_xray_mrt, '+#13+
                    '        (select fc_value from asu.tsmini where fc_section = ''XRAY'' and FC_KEY = ''SHOW_DICOM'') as show_dicom, '+#13+
                    '        (select fc_value from asu.tsmini where fc_section = ''XRAY'' and FC_KEY = ''DICOM_PORT'') as dicom_port, '+#13+
                    '        (select fc_value from asu.tsmini where fc_section = ''XRAY'' and FC_KEY = ''DICOM_IP'') as dicom_ip, '+#13+
                    '        (select fc_value from asu.tsmini where fc_section = ''XRAY'' and FC_KEY = ''DICOM_CALLED_AE'') as dicom_called_ae, '+#13+
                    '        (select fc_value from asu.tsmini where fc_section = ''XRAY'' and FC_KEY = ''USE_C_MOVE'') as use_c_move, '+#13+
                    '        (select fc_value from asu.tsmini where fc_section = ''XRAY'' and FC_KEY = ''DICOM_LOCAL_PORT'') as dicom_local_port, '+#13+
                    '        (select fc_value from asu.tsmini where fc_section = ''XRAY'' and FC_KEY = ''DICOM_SHOW_3D'') as dicom_show_3D, '+#13+
                    '        asu.pkg_smini.readstring(''CONFIG'', ''DB_NAME'', ''H'') as db_name '+#13+
                    '   from dual ';
    ods.Open;
    if ods.FieldByName('SHOW_DICOM').AsString = '' then
      get_dicom_show := '0'
    else
      get_dicom_show := ods.FieldByName('SHOW_DICOM').AsString;
    if ods.FieldByName('dicom_show_3d').AsString <> '-1' then
      dicom_show_3d := False
    else
      dicom_show_3d := True;
    DicomPort := ods.FieldByName('DICOM_PORT').AsString;
    DicomIP := ods.FieldByName('DICOM_IP').AsString;
    DicomCalledAE := ods.FieldByName('DICOM_CALLED_AE').AsString;
    get_use_cmove := ods.FieldByName('use_c_move').AsString;
    get_local_port := ods.FieldByName('dicom_local_port').AsString;
    get_xray_mrt := ods.FieldByName('get_xray_mrt').AsInteger;
    get_db_name := ods.FieldByName('db_name').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoShowFrmMain(nPACID : Integer; nSOTRID : Integer);
var ods : TOracleDataSet;
begin
  pPACID := nPACID;
  pSOTRID := nSOTRID;
  MedotradeSign := ReadMedotradeSign;
  DoRefreshParameters;
  odsList.Close;
  odsList.SetVariable('PFK_PACID', nPACID);

//Showmessage('nPACID='+inttostr(nPACID));

  odsList.Open;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT ASU.PKG_SMINI.READSTRING(''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        ASU.PKG_REGIST_PACFUNC.GET_PAC_FIO(:PFK_PACID) AS PACFIO, '+#13+
                    '        ASU.PKG_REGIST_PACFUNC.GET_PAC_BITH(:PFK_PACID) AS DATE_ROJD '+#13+
                    '   FROM DUAL ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.Open;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
    sPacFio_4Rep := ods.FieldByName('PACFIO').AsString;
    dDateRojd_4Rep := ods.FieldByName('DATE_ROJD').AsDateTime;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fc_name from asu.totdel where fk_id = (select fk_otdid from asu.tsotr where fk_id = :pfk_id) ';
    ods.DeclareAndSet('pfk_id', otInteger, pSOTRID);
    ods.Open;
    sOtdelName_4Rep := ods.FieldByName('fc_name').AsString;
  finally
    ods.Free;
  end;
  TV.StoreToRegistry('\SoftWare\SoftMaster\ListDoza\TVVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TV');
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\ListDoza\TVVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TV');
// -- кнопки "Снимки" и "Снимки по C-MOVE"
//  aCD.Visible := False;
  if (get_db_name = 'H') or (get_db_name = 'SO') then // если база Ханты ОКБ или Сургут ОКБ - сопряжение с Мультивокс
    begin
      if ((frmMain.get_dicom_show = '-1') or (f_gtTSMINI('DLL_WORKLIST_NAZN','MYWORKLIST_USE')='1') or fileexists(ExtractFilePath(ParamStr(0))+'\testdicom.dat')) then
        begin
          VSNIMOK.Visible := True;
          VSNIMOK.VisibleForCustomization := True;
          aSnimki.Visible := True; // dsList.DataSet.FieldByName('fk_resultid').AsInteger = 1; // если поле fk_resultid = 1
        //  aCD.Visible := False;
        end else
        begin
          VSNIMOK.Visible := False;
          VSNIMOK.VisibleForCustomization := False;
          aSnimki.Visible := False;
        //  aCD.Visible := aSnimki.Visible;
        end;
    end else
    begin
      aSnimki.Visible := frmMain.get_dicom_show = '-1';
    //  aCD.Visible := aSnimki.Visible;
    end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var Ini : TIniFile;
begin
//  DCM_Connection.PDUTempPath:=GetTempDirectory;
  Ini := TIniFile.Create(ExtractFilePath(paramstr(0))+'DicomSettings.ini');
  try
    sCallingAET := Ini.ReadString('MAIN', 'CALLING_AET', 'MEDOTRADE');
  finally
    Ini.Free;
  end;
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
  if VarName = 'DOZA' then Value := TV.DataController.Summary.FooterSummaryValues[0];
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if VarName = 'PDATE1' then Value := lbBeg.Caption;
  if VarName = 'PDATE2' then Value := lbEnd.Caption;
end;

procedure TfrmMain.frxListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'DATESYS' then Value := sSysDate_4Rep;
  if VarName = 'PACFIO' then Value := sPacFio_4Rep;
  if VarName = 'DOZA' then Value := TV.DataController.Summary.FooterSummaryValues[0];
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.frxRepProsmotrGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4REP;
  if VarName = 'PACFIO' then Value := sPacFio_4Rep;
  if VarName = 'DATE_ROJD' then Value := dDateRojd_4Rep;  
  if VarName = 'NUMIB' then Value := dsList.DataSet.FieldByName('NUMIB').AsString;
  if VarName = 'NAMEISSL' then Value := dsList.DataSet.FieldByName('FC_NAME').AsString;
  if VarName = 'DOZA' then Value := dsList.DataSet.FieldByName('DOZA').AsString;
  if VarName = 'DATEISSL' then Value := dsList.DataSet.FieldByName('FD_RUN').AsString;
  if VarName = 'TEXTISSL' then Value := sTextIssl_4rep;
  if VarName = 'NUMISSL' then Value := sNumIssl_4rep;
  if VarName = 'SOTR' then Value := dsList.DataSet.FieldByName('IFIO').AsString;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.frxXrayOperProtGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4REP;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4REP;
  if VarName = 'PACFIO' then Value := sPacFio_4Rep;
  if VarName = 'DATE_ROJD' then Value := dDateRojd_4Rep;
  if VarName = 'NUMIB' then Value := dsList.DataSet.FieldByName('NUMIB').AsString;
  if VarName = 'NAMEISSL' then Value := dsList.DataSet.FieldByName('FC_NAME').AsString;
  if VarName = 'DOZA' then Value := dsList.DataSet.FieldByName('DOZA').AsString;
  if VarName = 'DATEISSL' then Value := dsList.DataSet.FieldByName('FD_RUN').AsString;
  if VarName = 'TEXTISSL' then Value := sTextIssl_4REP;
  if VarName = 'SOTR' then Value := dsList.DataSet.FieldByName('IFIO').AsString;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\ListDoza\TVVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TV');
end;

procedure TfrmMain.odsListAfterScroll(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

procedure TfrmMain.odsListDatesAfterScroll(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

procedure TfrmMain.UnloadDll;
begin
  TV.StoreToRegistry('\SoftWare\SoftMaster\ListDoza\TVVrach_' + IntToStr(pSOTRID), TRUE, [], 'TV');
end;

end.
