unit unTestWorklist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Oracle, cxPC, cxControls, ADODB, Grids, DBGrids, DB,
  dxSkinsCore, dxSkinBlack, dxSkinOffice2007Green, dxSkinscxPCPainter, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, cxContainer,
  cxMaskEdit, cxDropDownEdit, cxCalendar, DateUtils, dxSkinOffice2007Black,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Blue, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmTestWorklist = class(TForm)
    Button1: TButton;
    OracleSession1: TOracleSession;
    Button2: TButton;
    Label4: TLabel;
    edwebpage: TEdit;
    Label5: TLabel;
    edmssql_conn_str: TEdit;
    Label6: TLabel;
    edwebuser: TEdit;
    Label7: TLabel;
    edwebpassword: TEdit;
    Label8: TLabel;
    edatris_use: TEdit;
    Label9: TLabel;
    edweb_timeout: TEdit;
    Label10: TLabel;
    edpatientID: TEdit;
    Label11: TLabel;
    edAccessionNumber: TEdit;
    Label12: TLabel;
    edstudyUID: TEdit;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Button3: TButton;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    Label1: TLabel;
    edDB: TEdit;
    Label2: TLabel;
    edUser: TEdit;
    Label3: TLabel;
    edPassword: TEdit;
    Button4: TButton;
    Button5: TButton;
    edAccessionNumberFnd: TEdit;
    edPatientIdFnd: TEdit;
    Panel1: TPanel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1TableView1: TcxGridTableView;
    Label13: TLabel;
    edAmmRecs: TEdit;
    rbFomin: TRadioButton;
    rbATRIS: TRadioButton;
    Label14: TLabel;
    edPatientNumFnd: TEdit;
    Label15: TLabel;
    Button6: TButton;
    Label16: TLabel;
    edmodatity: TEdit;
    Label17: TLabel;
    edstudyinstanceuid: TEdit;
    Label18: TLabel;
    edstationaetitle: TEdit;
    cxTabSheet4: TcxTabSheet;
    Panel2: TPanel;
    Label36e: TLabel;
    edaccessionnumberDLT: TEdit;
    Button7: TButton;
    Button8: TButton;
    Panel3: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    edPatientIDINS: TEdit;
    edpatPrefix: TEdit;
    edPatientFamily: TEdit;
    edSex: TEdit;
    edPatientSurname: TEdit;
    edPatientNAME: TEdit;
    edModality: TEdit;
    edVrachOtch: TEdit;
    edVrachIm: TEdit;
    edVrachFam: TEdit;
    edPodrazdelenie: TEdit;
    edDiagnMKB10: TEdit;
    edRoom: TEdit;
    edAETitle: TEdit;
    ed_Polikl_Statsionar: TEdit;
    edFASTEST: TEdit;
    edStudyName: TEdit;
    edBodyPart: TEdit;
    Button9: TButton;
    Label36: TLabel;
    edstudyunstanceuidDLT: TEdit;
    Label19: TLabel;
    edAccessionNumberINS: TEdit;
    edBirthDate: TcxDateEdit;
    edTimeNapravl: TcxDateEdit;
    Label42: TLabel;
    edStudyInstanceUIDINS: TEdit;
    cxTabSheet5: TcxTabSheet;
    Label20: TLabel;
    edaccessionnumberToStudyUID: TEdit;
    Button10: TButton;
    lbSTUDYINSTANCEUID: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure rbFominClick(Sender: TObject);
    procedure rbATRISClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTestWorklist: TfrmTestWorklist;
  DLL_HANDLE: THandle;

const c_fileDLL = 'dll_worklist_nazn.dll';
      c_fld_razd = '|';

implementation

{$R *.dfm}

procedure p_connect;
begin
  if not frmTestWorklist.OracleSession1.Connected then
  begin
    with frmTestWorklist.OracleSession1 do
    begin
      LogonDatabase := frmTestWorklist.edDB.Text;
      LogonUsername := frmTestWorklist.edUser.Text;
      LogonPassword := frmTestWorklist.edPassword.Text;
      frmTestWorklist.OracleSession1.Connected:=True;
    end;
  end;
end;

procedure p_disconnect;
begin
  if frmTestWorklist.OracleSession1.Connected then
    frmTestWorklist.OracleSession1.Connected:=False;
end;

procedure TfrmTestWorklist.Button10Click(Sender: TObject);
var
// получение studyinstanceUID по accessionnumber
f_gt_studyUID : function (p_OracleSession: pointer;p_accessionnumber:string):string;stdcall;
begin  // Получить STUDYINSTANCEUID
  p_connect;
  if FileExists(c_fileDLL) then
  begin
    DLL_HANDLE:= LoadLibrary(c_fileDLL);
    Try
      if DLL_HANDLE <> 0 then
      begin
        @f_gt_studyUID := GetProcAddress(DLL_HANDLE, 'f_gt_studyUID');
        if @f_gt_studyUID <> nil then
         lbSTUDYINSTANCEUID.Caption := f_gt_studyUID( frmTestWorklist.OracleSession1.ExternalSVC , edaccessionnumberToStudyUID.Text );
      end;
    Finally
      FreeLibrary(DLL_HANDLE);
    End;
  end else
    MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
  p_disconnect;  
end;

procedure TfrmTestWorklist.Button1Click(Sender: TObject);
var
// Отображение снимков по пациенту/исследованию (для АТРИС)
p_ShowSnimki:procedure ( p_OracleSession: pointer;
                         p_patientID:string;
                         p_AccessionNumber:string;
                         p_studyUID:string
                       );stdcall;
begin // снимки
  p_connect;
  if FileExists(c_fileDLL) then
  begin
    DLL_HANDLE:= LoadLibrary(c_fileDLL);
    Try
      if DLL_HANDLE <> 0 then
      begin
        @p_ShowSnimki := GetProcAddress(DLL_HANDLE, 'p_ShowSnimki');
        if @p_ShowSnimki <> nil then
         p_ShowSnimki( frmTestWorklist.OracleSession1.ExternalSVC , '1', '2', '3' );
      end;
    Finally
      FreeLibrary(DLL_HANDLE);
    End;
  end else
    MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
  p_disconnect;
end;

procedure TfrmTestWorklist.Button2Click(Sender: TObject);
var
// Отображение снимков по пациенту/исследованию (для АТРИС)
p_showHTTPSnimki:procedure (  p_atris_webpage ,
                              p_atris_mssql_conn_str,
                              p_atris_webuser,
                              p_atris_webpassword,
                              p_atris_use : string;
                              p_atris_web_timeout : Integer;
                              p_patientID:string;
                              p_AccessionNumber:string;
                              p_studyUID:string
                           );stdcall;
begin // снимки HTTP
  if FileExists(c_fileDLL) then
  begin
    DLL_HANDLE:= LoadLibrary(c_fileDLL);
    Try
      if DLL_HANDLE <> 0 then
      begin
        @p_showHTTPSnimki := GetProcAddress(DLL_HANDLE, 'p_showHTTPSnimki');
        if @p_showHTTPSnimki <> nil then
         p_showHTTPSnimki( edwebpage.Text ,
                           edmssql_conn_str.Text,
                           edwebuser.Text,
                           edwebpassword.Text,
                           edatris_use.Text,
                           StrToInt(edweb_timeout.Text),
                           edpatientID.Text,
                           edAccessionNumber.Text,
                           edstudyUID.Text
                         );
      end;
    Finally
      FreeLibrary(DLL_HANDLE);
    End;
  end else
    MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
end;

procedure TfrmTestWorklist.Button3Click(Sender: TObject);
var
// процедура для проверки доступности MS SQL ATRIS
f_chk_mssql_atris : function  (  p_atris_mssql_conn_str1 : string
                               ):boolean;stdcall;
v_constr:string;
begin  // connect to ms sql
  v_constr := edmssql_conn_str.Text;
  if FileExists(c_fileDLL) then
  begin
    DLL_HANDLE:= LoadLibrary(c_fileDLL);
    Try
      if DLL_HANDLE <> 0 then
      begin
        @f_chk_mssql_atris := GetProcAddress(DLL_HANDLE, 'f_chk_mssql_atris');
        if @f_chk_mssql_atris <> nil then
         if f_chk_mssql_atris( v_constr )
         then
         begin
           MessageDlg('CONNECTION SUCCESS ...', mtInformation, [mbOK], 0);
         end else
         begin
           MessageDlg('CONNECTION FAILED ...', mtError, [mbOK], 0);
         end;                    
      end;
    Finally
      FreeLibrary(DLL_HANDLE);
    End;
  end else
    MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
end;

function GetTempDirectory: AnsiString;
var
  Buf: array[0..MAX_PATH - 1] of AnsiChar;
begin
  GetTempPath(SizeOf(Buf), @Buf);
  Result := IncludeTrailingBackslash(PChar(@Buf));
end;

function GetTmpUserDir : AnsiString;
begin
  Result:=Trim(GetTempDirectory);
  if Copy(Result,Length(Result),1)='\' then
    Result:=Copy(Result,1,Length(Result)-1);
end;

function ArrayToStr2(str: tstrings; R: char): string;
begin
  str.Delimiter:=r;
  result:=str.DelimitedText;
end;

procedure StrToArrays2(str:AnsiString; r:char;  Temp: tstrings);
begin
  temp.Delimiter:=r;
  temp.DelimitedText:=str;
end;

procedure pFillGrid ( p_Grid : TcxGridTableView;
                      p_filename : ansistring
                    );
var v_str, s1 : TStringList;
    v_strRec : AnsiString;
    i,j,v_amm : Integer;
    v_s : string;
    aCol: TcxGridColumn;
begin
  //
  while p_Grid.ColumnCount > 0  do
    p_Grid.Columns[0].Free;
  //
  v_str := TStringList.Create;
  try
    v_str.LoadFromFile(p_filename);
    If v_str.Count>0 then
    begin
      v_strRec := v_str[0];
      //
      s1 := TStringList.Create;
      try
        StrToArrays2(v_strRec,c_fld_razd,s1);
        v_amm:=s1.Count;
        for I := 0 to v_amm - 1 do
        begin // создание столбцов
          aCol := p_Grid.CreateColumn;
          aCol.Name := 'f_'+inttostr(i);
          aCol.Caption := s1[i];
          aCol.Width:=70;
        end;
        //
        while p_Grid.DataController.RecordCount>0 do
          p_Grid.DataController.DeleteRecord(0);
       { if v_str.Count=1 then
        begin
          p_Grid.DataController.AppendRecord;
          p_Grid.DataController.AppendRecord;
          p_Grid.DataController.AppendRecord;
          p_Grid.DataController.AppendRecord;
          p_Grid.DataController.AppendRecord;
        end;}
        for I := 1 to v_str.Count - 1 do
        begin
          s1.Clear;
          v_strRec := v_str[i];
          StrToArrays2(v_strRec,c_fld_razd,s1);
          p_Grid.DataController.BeginUpdate;
          p_Grid.DataController.AppendRecord;
          for j := 0 to v_amm - 1 do // заполнение столбцов
            try
              if s1[j]='' then s1[j]:=' ';
              p_Grid.DataController.Values[i-1,j]:= s1[j];
            except
              p_Grid.DataController.Values[i-1,j]:=' ';
              ShowMessage('j='+inttostr(j)+' i='+IntToStr(i)+' : '+v_str[i]);
            end;
          p_Grid.DataController.EndUpdate;
        end;
      finally
        s1.Free;
      end;
    end;
  finally
    v_str.Free;
  end;
end;

function gt_tmp_mydir : AnsiString;
begin
  Result:=GetTmpUserDir+'\TestWorklist'+IntToStr(GetTickCount)+'.tmp';
end;

function gt_ammrecs : Integer;
begin
  try
    Result:= StrToInt(frmTestWorklist.edAmmRecs.Text);
  except
    Result:=10;
  end;
end;

procedure TfrmTestWorklist.Button4Click(Sender: TObject);
var v_filename : string; i, v_AmmRecs:Integer;
  p_gtPatientStudies : procedure (  p_atris_mssql_conn_str : string;
                                    p_patientid : string ;
                                    p_fld_razd : string ;
                                    p_filename : string ;
                                    p_AmmRecs : integer
                                 ); stdcall;
begin // Patient Studies
  if FileExists(c_fileDLL) then
  begin
    DLL_HANDLE:= LoadLibrary(c_fileDLL);
    Try
      if DLL_HANDLE <> 0 then
      begin
        @p_gtPatientStudies := GetProcAddress(DLL_HANDLE, 'p_gtPatientStudies');
        if @p_gtPatientStudies <> nil then
        begin
          v_filename:=gt_tmp_mydir;
          v_AmmRecs:= gt_ammrecs;
          p_gtPatientStudies( edmssql_conn_str.Text,
                              edPatientIdFnd.Text,
                              c_fld_razd,
                              v_filename,
                              v_AmmRecs );
        end;
      end;
    Finally
      FreeLibrary(DLL_HANDLE);
    End;
    if FileExists(v_filename) then
    begin
      pFillGrid(cxGrid1TableView1,v_filename);
      DeleteFile(v_filename);
    end;
  end else
    MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
end;

procedure TfrmTestWorklist.Button5Click(Sender: TObject);
var v_filename : string; i, v_AmmRecs:Integer;
  p_gtStudies : procedure ( p_atris_mssql_conn_str : string;
                            p_patientid : string ;
                            p_AccessionNumber : string ;
                            p_fld_razd : string ;
                            p_filename : string ;
                            p_AmmRecs : integer
                         ); stdcall;
begin // get studies
  if FileExists(c_fileDLL) then
  begin
    DLL_HANDLE:= LoadLibrary(c_fileDLL);
    Try
      if DLL_HANDLE <> 0 then
      begin
        @p_gtStudies := GetProcAddress(DLL_HANDLE, 'p_gtStudies');
        if @p_gtStudies <> nil then
        begin
          v_filename:=gt_tmp_mydir;
          v_AmmRecs:= gt_ammrecs;
          p_gtStudies( edmssql_conn_str.Text,
                       edPatientNumFnd.Text,
                       edAccessionNumberFnd.Text,
                       c_fld_razd,
                       v_filename,
                       v_AmmRecs );
        end;
      end;
    Finally
      FreeLibrary(DLL_HANDLE);
    End;
    if FileExists(v_filename) then
    begin
      pFillGrid(cxGrid1TableView1,v_filename);
      DeleteFile(v_filename);
    end;
  end else
    MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
end;

procedure TfrmTestWorklist.Button6Click(Sender: TObject);
var v_filename : string; i, v_AmmRecs:Integer;    
  p_gtWorklist : procedure ( p_atris_mssql_conn_str : string;
                            p_patientid : string ;
                            p_AccessionNumber : string ;
                            p_studyinstanceuid : string ;
                            p_modatity : string ;
                            p_stationaetitle : string ;
                            p_fld_razd : string ;
                            p_filename : string ;
                            p_AmmRecs : integer
                         ); stdcall;
begin  // worklist
  if FileExists(c_fileDLL) then
  begin
    DLL_HANDLE:= LoadLibrary(c_fileDLL);
    Try
      if DLL_HANDLE <> 0 then
      begin
        @p_gtWorklist := GetProcAddress(DLL_HANDLE, 'p_gtWorklist');
        if @p_gtWorklist <> nil then
        begin
          v_filename:=gt_tmp_mydir;
          v_AmmRecs:= gt_ammrecs;
          p_gtWorklist( edmssql_conn_str.Text,
                       edPatientNumFnd.Text,
                       edAccessionNumberFnd.Text,
                       edstudyinstanceuid.Text,
                       edmodatity.Text,
                       edstationaetitle.Text,
                       c_fld_razd,
                       v_filename,
                       v_AmmRecs );
        end;
      end;
    Finally
      FreeLibrary(DLL_HANDLE);
    End;
    if FileExists(v_filename) then
    begin
      pFillGrid(cxGrid1TableView1,v_filename);
      DeleteFile(v_filename);
    end;
  end else
    MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
end;

procedure TfrmTestWorklist.Button7Click(Sender: TObject);
var
p_delWorklist : procedure ( p_atris_mssql_conn_str : string;
                            p_AccessionNumber      : string ;
                            p_studyinstanceuid     : string
                         ); stdcall;
begin // delete from worklist
  if MessageDlg('Вы желаете удалить все записи с заданными параметрами :'+#13+#10+
                'StudyInstanceUID='''+edstudyunstanceuidDLT.Text+''''+#13+#10+
                'AccessionNumber='''+edaccessionnumberDLT.Text+''' ?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
    if FileExists(c_fileDLL) then
    begin
      DLL_HANDLE:= LoadLibrary(c_fileDLL);
      Try
        if DLL_HANDLE <> 0 then
        begin
          @p_delWorklist := GetProcAddress(DLL_HANDLE, 'p_delWorklist');
          if @p_delWorklist <> nil then
          begin
            p_delWorklist( edmssql_conn_str.Text,
                         edaccessionnumberDLT.Text,
                         edstudyunstanceuidDLT.Text );
          end;
        end;
      Finally
        FreeLibrary(DLL_HANDLE);
      End;
    end else
      MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
end;

procedure TfrmTestWorklist.Button8Click(Sender: TObject);
var
  p_INSWorklist : procedure ( p_AppHandl : THandle;
                              p_atris_mssql_conn_str : string;
                              p_PatientIDINS : string;      // Номер Карты -> PatientID
                              p_patPrefix : string;         // patPrefix (не исп)
                              p_PatientFamily : string;     // Фамилия
                              p_PatientNAME : string;       // Имя
                              p_PatientSurname : string;    // Отчество
                              p_BirthDate : TDateTime;         // Дата рождения -> PatientBirthDate
                              p_Sex : string;               // Пол
                              p_AETitle : string;           // AETitle аппарата
                              p_Room : string;              // Комната (не исп)
                              p_DiagnMKB10 : string;        // Код напр. диагноза по МКБ-10 -> не исп
                              p_Podrazdelenie : string;     // Направившее подразделение
                              p_VrachFam : string;          // Фамилия направившего врача
                              p_VrachIm : string;           // Имя направившего врача
                              p_VrachOtch : string;         // Отчество направившего врача
                              p_Modality : string;          // Modality
                              p_BodyPart : string;          // Название исследуемой части тела
                              p_StudyName : string;         // Название исследования
                              p_FASTEST : string;           // Экстренный (1/0)-> не исп (integer)
                              p_DateTimeNapravl : TDateTime;       // Дата / Время направления
                              p_Polikl_Statsionar : string; // 0 - Поликлиника, 1 - Стационар
                              p_AccessionNumber : string;    // AccessionNumber
                              p_studyinstanceuid : string  // studyinstanceuid
                           ); stdcall;
begin  // ДОБАВИТЬ В WORKLIST
  if MessageDlg('Вы желаете добавить запись в WORKLIST ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
    if FileExists(c_fileDLL) then
    begin
      DLL_HANDLE:= LoadLibrary(c_fileDLL);
      Try
        if DLL_HANDLE <> 0 then
        begin
          @p_INSWorklist := GetProcAddress(DLL_HANDLE, 'p_INSWorklist');
          if @p_INSWorklist <> nil then
          begin
            p_INSWorklist( Application.Handle,
                           edmssql_conn_str.Text,
                           edPatientIDINS.Text,      // Номер Карты -> PatientID
                           edpatPrefix.Text,         // patPrefix (не исп)
                           edPatientFamily.Text,     // Фамилия
                           edPatientNAME.Text,       // Имя
                           edPatientSurname.Text,    // Отчество
                           edBirthDate.Date,         // Дата рождения -> PatientBirthDate
                           edSex.Text,               // Пол
                           edAETitle.Text,           // AETitle аппарата
                           edRoom.Text,              // Комната (не исп)
                           edDiagnMKB10.Text,        // Код напр. диагноза по МКБ-10 -> не исп
                           edPodrazdelenie.Text,     // Направившее подразделение
                           edVrachFam.Text,          // Фамилия направившего врача
                           edVrachIm.Text,           // Имя направившего врача
                           edVrachOtch.Text,         // Отчество направившего врача
                           edModality.Text,          // Modality
                           edBodyPart.Text,          // Название исследуемой части тела
                           edStudyName.Text,         // Название исследования
                           edFASTEST.Text,           // Экстренный (1/0)-> не исп (integer)
                           edTimeNapravl.Date,       // Дата / Время направления
                           ed_Polikl_Statsionar.Text, // 0 - Поликлиника, 1 - Стационар
                           edAccessionNumberINS.Text,    // AccessionNumber
                           edStudyInstanceUIDINS.Text  // StudyInstanceUID


                         );
          end;
        end;
      Finally
        FreeLibrary(DLL_HANDLE);
      End;
    end else
      MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
end;

procedure TfrmTestWorklist.Button9Click(Sender: TObject);
var v_uniq_ID : String;
begin // ЗАПОЛНИТЬ по-умолчанию
  v_uniq_ID:= '3013468829';    //   IntToStr(GetTickCount); //
  // Номер Карты -> PatientID
  edPatientIDINS.Text := 'TMP-'+v_uniq_ID;
  // patPrefix (не исп)
  edpatPrefix.Text := '';
  // Фамилия
  edPatientFamily.Text := 'Тестовый_пациент';
  // Имя
  edPatientNAME.Text := 'Тест';
  // Отчество
  edPatientSurname.Text := 'Тест';
  // Дата рождения -> PatientBirthDate
  edBirthDate.Text := '31.12.1960';
  // Пол
  edSex.Text := 'M';
  // ---------------------------------------------------------------
  // AETitle аппарата
  edAETitle.Text := 'Aquilion';
  // Modality
  edModality.Text := 'KT';
  // ---------------------------------------------------------------
  // Комната (не исп)
  edRoom.Text := '';
  // Код напр. диагноза по МКБ-10 -> не исп
  edDiagnMKB10.Text := 'M13.8';
  // Направившее подразделение
  edPodrazdelenie.Text := 'подразделение (проверка)';
  // Фамилия направившего врача
  edVrachFam.Text := 'Фамилия врача';
  // Имя направившего врача
  edVrachIm.Text := 'Имя врача';
  // Отчество направившего врача
  edVrachOtch.Text := 'Отчество врача';
  // Название исследуемой части тела
  edBodyPart.Text := 'HEAD';
  // Название исследования
  edStudyName.Text := 'Название исследования';
  // Экстренный (1/0)-> не исп (integer)
  edFASTEST.Text := '0';
  // Время направления
  edTimeNapravl.Text := '09:00';
  // 0 - Поликлиника, 1 - Стационар
  ed_Polikl_Statsionar.Text := '1';
  /// AccessionNumber
  edAccessionNumberINS.Text := 'AN'+v_uniq_ID;
  // StudyInstanceUID
  edStudyInstanceUIDINS.Text := '1.2.276.0.54.'+DateToStr(Date)+inttostr(Hourof(Now))+inttostr(MinuteOf(Now))+'.'+ v_uniq_ID ;

end;

procedure TfrmTestWorklist.FormDestroy(Sender: TObject);
begin
  p_disconnect;
end;

procedure setAddr;
begin
  if frmTestWorklist.rbFomin.checked then
  begin
    frmTestWorklist.edmssql_conn_str.Text:=
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;User ID=sa;Initial Catalog=ClusterPacsServer;Data Source=AFOMIN\MSSQL2012';
  end else if frmTestWorklist.rbATRIS.checked then
  begin
    frmTestWorklist.edmssql_conn_str.Text:=
      'Provider=SQLOLEDB.1;Password=Password2013;Persist Security Info=True;User ID=sa;Initial Catalog=ClusterPacsServer;Data Source=10.1.1.18';
  end;
end;

procedure TfrmTestWorklist.rbFominClick(Sender: TObject);
begin //
  setAddr;
end;

procedure TfrmTestWorklist.rbATRISClick(Sender: TObject);
begin
  setAddr;
end;

{
      @patUniqueID int, -- External UniqueID, т.е _Ваш_ ID -> PatNr
      @patCardCode varchar(80), -- Номер Карты -> PatientID
      @patPrefix char(1)= null, -- В программе не отображается! Пока не используется
      @patLastName varchar(35)='', -- Фамилия -> PatientName
      @patFirstName varchar(35)='', -- Имя -> PatientName
      @patMiddleName varchar(35)='', -- Отчество -> PatientName
      @patBirthDate char(8)=null,  -- Дата рождения -> PatientBirthDate
      @patSex char(1)='',  -- 'M' || 'F' -> PatientSex
      @HIPAXAETitle varchar(16), -- -> AE
      @patRoom varchar(60)='', -- Комната Пока не используется
      @patDiagnCode varchar(10)='', -- Код направительного диагноза по МКБ-10 -> Пока не используется
      @patReqDepartment varchar(60)='', -- Направившее подразделение
      @patReqPhLastName varchar (35)='', -- Фамилия направившего врача  -> Phys1
      @patReqPhFirstName varchar (35)='', -- Имя направившего врача  -> Phys2
      @patReqPhMiddleName varchar (35)='', -- Отчество направившего врача -> Phys3
      @patModalityName varchar(30),  -- Название модальности ('Рентген') -> Modality
      @patBodyPart varchar(80)='', -- Название исследуемой части тела -> Пока не используется
      @patStudyName varchar(60)='', -- Название исследования
      @patUrgent smallint=null, -- Экстренный (1/0)-> Пока не используется
      @patTimeDate varchar(14)=null, -- Время направления -> StudyDate, StudyTime
	@site int=0 	-- 0 - Поликлиника, 1 - Стационар
}


end.
