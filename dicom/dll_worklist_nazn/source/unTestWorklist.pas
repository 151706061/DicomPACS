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
// ��������� studyinstanceUID �� accessionnumber
f_gt_studyUID : function (p_OracleSession: pointer;p_accessionnumber:string):string;stdcall;
begin  // �������� STUDYINSTANCEUID
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
    MessageDlg('�� ������ ���� '+c_fileDLL, mtWarning, [mbOK], 0);
  p_disconnect;  
end;

procedure TfrmTestWorklist.Button1Click(Sender: TObject);
var
// ����������� ������� �� ��������/������������ (��� �����)
p_ShowSnimki:procedure ( p_OracleSession: pointer;
                         p_patientID:string;
                         p_AccessionNumber:string;
                         p_studyUID:string
                       );stdcall;
begin // ������
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
    MessageDlg('�� ������ ���� '+c_fileDLL, mtWarning, [mbOK], 0);
  p_disconnect;
end;

procedure TfrmTestWorklist.Button2Click(Sender: TObject);
var
// ����������� ������� �� ��������/������������ (��� �����)
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
begin // ������ HTTP
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
    MessageDlg('�� ������ ���� '+c_fileDLL, mtWarning, [mbOK], 0);
end;

procedure TfrmTestWorklist.Button3Click(Sender: TObject);
var
// ��������� ��� �������� ����������� MS SQL ATRIS
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
    MessageDlg('�� ������ ���� '+c_fileDLL, mtWarning, [mbOK], 0);
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
        begin // �������� ��������
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
          for j := 0 to v_amm - 1 do // ���������� ��������
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
    MessageDlg('�� ������ ���� '+c_fileDLL, mtWarning, [mbOK], 0);
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
    MessageDlg('�� ������ ���� '+c_fileDLL, mtWarning, [mbOK], 0);
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
    MessageDlg('�� ������ ���� '+c_fileDLL, mtWarning, [mbOK], 0);
end;

procedure TfrmTestWorklist.Button7Click(Sender: TObject);
var
p_delWorklist : procedure ( p_atris_mssql_conn_str : string;
                            p_AccessionNumber      : string ;
                            p_studyinstanceuid     : string
                         ); stdcall;
begin // delete from worklist
  if MessageDlg('�� ������� ������� ��� ������ � ��������� ����������� :'+#13+#10+
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
      MessageDlg('�� ������ ���� '+c_fileDLL, mtWarning, [mbOK], 0);
end;

procedure TfrmTestWorklist.Button8Click(Sender: TObject);
var
  p_INSWorklist : procedure ( p_AppHandl : THandle;
                              p_atris_mssql_conn_str : string;
                              p_PatientIDINS : string;      // ����� ����� -> PatientID
                              p_patPrefix : string;         // patPrefix (�� ���)
                              p_PatientFamily : string;     // �������
                              p_PatientNAME : string;       // ���
                              p_PatientSurname : string;    // ��������
                              p_BirthDate : TDateTime;         // ���� �������� -> PatientBirthDate
                              p_Sex : string;               // ���
                              p_AETitle : string;           // AETitle ��������
                              p_Room : string;              // ������� (�� ���)
                              p_DiagnMKB10 : string;        // ��� ����. �������� �� ���-10 -> �� ���
                              p_Podrazdelenie : string;     // ����������� �������������
                              p_VrachFam : string;          // ������� ������������ �����
                              p_VrachIm : string;           // ��� ������������ �����
                              p_VrachOtch : string;         // �������� ������������ �����
                              p_Modality : string;          // Modality
                              p_BodyPart : string;          // �������� ����������� ����� ����
                              p_StudyName : string;         // �������� ������������
                              p_FASTEST : string;           // ���������� (1/0)-> �� ��� (integer)
                              p_DateTimeNapravl : TDateTime;       // ���� / ����� �����������
                              p_Polikl_Statsionar : string; // 0 - �����������, 1 - ���������
                              p_AccessionNumber : string;    // AccessionNumber
                              p_studyinstanceuid : string  // studyinstanceuid
                           ); stdcall;
begin  // �������� � WORKLIST
  if MessageDlg('�� ������� �������� ������ � WORKLIST ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
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
                           edPatientIDINS.Text,      // ����� ����� -> PatientID
                           edpatPrefix.Text,         // patPrefix (�� ���)
                           edPatientFamily.Text,     // �������
                           edPatientNAME.Text,       // ���
                           edPatientSurname.Text,    // ��������
                           edBirthDate.Date,         // ���� �������� -> PatientBirthDate
                           edSex.Text,               // ���
                           edAETitle.Text,           // AETitle ��������
                           edRoom.Text,              // ������� (�� ���)
                           edDiagnMKB10.Text,        // ��� ����. �������� �� ���-10 -> �� ���
                           edPodrazdelenie.Text,     // ����������� �������������
                           edVrachFam.Text,          // ������� ������������ �����
                           edVrachIm.Text,           // ��� ������������ �����
                           edVrachOtch.Text,         // �������� ������������ �����
                           edModality.Text,          // Modality
                           edBodyPart.Text,          // �������� ����������� ����� ����
                           edStudyName.Text,         // �������� ������������
                           edFASTEST.Text,           // ���������� (1/0)-> �� ��� (integer)
                           edTimeNapravl.Date,       // ���� / ����� �����������
                           ed_Polikl_Statsionar.Text, // 0 - �����������, 1 - ���������
                           edAccessionNumberINS.Text,    // AccessionNumber
                           edStudyInstanceUIDINS.Text  // StudyInstanceUID


                         );
          end;
        end;
      Finally
        FreeLibrary(DLL_HANDLE);
      End;
    end else
      MessageDlg('�� ������ ���� '+c_fileDLL, mtWarning, [mbOK], 0);
end;

procedure TfrmTestWorklist.Button9Click(Sender: TObject);
var v_uniq_ID : String;
begin // ��������� ��-���������
  v_uniq_ID:= '3013468829';    //   IntToStr(GetTickCount); //
  // ����� ����� -> PatientID
  edPatientIDINS.Text := 'TMP-'+v_uniq_ID;
  // patPrefix (�� ���)
  edpatPrefix.Text := '';
  // �������
  edPatientFamily.Text := '��������_�������';
  // ���
  edPatientNAME.Text := '����';
  // ��������
  edPatientSurname.Text := '����';
  // ���� �������� -> PatientBirthDate
  edBirthDate.Text := '31.12.1960';
  // ���
  edSex.Text := 'M';
  // ---------------------------------------------------------------
  // AETitle ��������
  edAETitle.Text := 'Aquilion';
  // Modality
  edModality.Text := 'KT';
  // ---------------------------------------------------------------
  // ������� (�� ���)
  edRoom.Text := '';
  // ��� ����. �������� �� ���-10 -> �� ���
  edDiagnMKB10.Text := 'M13.8';
  // ����������� �������������
  edPodrazdelenie.Text := '������������� (��������)';
  // ������� ������������ �����
  edVrachFam.Text := '������� �����';
  // ��� ������������ �����
  edVrachIm.Text := '��� �����';
  // �������� ������������ �����
  edVrachOtch.Text := '�������� �����';
  // �������� ����������� ����� ����
  edBodyPart.Text := 'HEAD';
  // �������� ������������
  edStudyName.Text := '�������� ������������';
  // ���������� (1/0)-> �� ��� (integer)
  edFASTEST.Text := '0';
  // ����� �����������
  edTimeNapravl.Text := '09:00';
  // 0 - �����������, 1 - ���������
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
      @patUniqueID int, -- External UniqueID, �.� _���_ ID -> PatNr
      @patCardCode varchar(80), -- ����� ����� -> PatientID
      @patPrefix char(1)= null, -- � ��������� �� ������������! ���� �� ������������
      @patLastName varchar(35)='', -- ������� -> PatientName
      @patFirstName varchar(35)='', -- ��� -> PatientName
      @patMiddleName varchar(35)='', -- �������� -> PatientName
      @patBirthDate char(8)=null,  -- ���� �������� -> PatientBirthDate
      @patSex char(1)='',  -- 'M' || 'F' -> PatientSex
      @HIPAXAETitle varchar(16), -- -> AE
      @patRoom varchar(60)='', -- ������� ���� �� ������������
      @patDiagnCode varchar(10)='', -- ��� ��������������� �������� �� ���-10 -> ���� �� ������������
      @patReqDepartment varchar(60)='', -- ����������� �������������
      @patReqPhLastName varchar (35)='', -- ������� ������������ �����  -> Phys1
      @patReqPhFirstName varchar (35)='', -- ��� ������������ �����  -> Phys2
      @patReqPhMiddleName varchar (35)='', -- �������� ������������ ����� -> Phys3
      @patModalityName varchar(30),  -- �������� ����������� ('�������') -> Modality
      @patBodyPart varchar(80)='', -- �������� ����������� ����� ���� -> ���� �� ������������
      @patStudyName varchar(60)='', -- �������� ������������
      @patUrgent smallint=null, -- ���������� (1/0)-> ���� �� ������������
      @patTimeDate varchar(14)=null, -- ����� ����������� -> StudyDate, StudyTime
	@site int=0 	-- 0 - �����������, 1 - ���������
}


end.
