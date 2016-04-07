unit fGetPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, ComCtrls, ToolWin, StdCtrls, DB, OracleData, Oracle, OracleMonitor, dxLayoutControl,
  IniFiles, frxClass, frxDBSet, DateUtils, dxmdaset, Math, Spin, ComObj, cxControls, ExtCtrls, DBCtrls;

type
  TfrmGetPeriod = class(TForm)
    ilImages: TImageList;
    alActions: TActionList;
    aSave: TAction;
    aCancel: TAction;
    acExcelExport: TAction;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnSave: TToolButton;
    btnCancel: TToolButton;
    panPeriod: TPanel;
    panMoGroup: TPanel;
    panMedic: TPanel;
    os: TOracleSession;
    odsGroupMo: TOracleDataSet;
    dsGroupMo: TDataSource;
    lMO_GROUP: TLabel;
    lcbMO_GROUP: TDBLookupComboBox;
    oqInitMO: TOracleQuery;
    odsMedic: TOracleDataSet;
    dsMedic: TDataSource;
    lMedic: TLabel;
    lcbMedic: TDBLookupComboBox;
    lg_Root: TdxLayoutGroup;
    lcMain: TdxLayoutControl;
    rbByMonth: TRadioButton;
    lcirbByMonth: TdxLayoutItem;
    rbPeriod: TRadioButton;
    lcirbPeriod: TdxLayoutItem;
    lcgMonth: TdxLayoutGroup;
    lcgPeriod: TdxLayoutGroup;
    lcgPeriodEdit: TdxLayoutGroup;
    lcgMonthEdit: TdxLayoutGroup;
    aCheck: TAction;
    frxRep: TfrxReport;
    mdMain: TdxMemData;
    mdMainMonth: TStringField;
    mdMainRemainOn1DayOfMonth: TFloatField;
    odsRep1: TOracleDataSet;
    frxdsMain: TfrxDBDataset;
    mdMainPrihFrom: TStringField;
    mdMainPrihDoc: TStringField;
    mdMainPrihWithRemain: TFloatField;
    mdMainPrihCnt: TFloatField;
    mdMainRashDate: TDateField;
    mdMainRashDoc: TStringField;
    mdMainRashCnt: TFloatField;
    mdMainRemainByRepOnEnd: TFloatField;
    odsRep2: TOracleDataSet;
    odsRep3: TOracleDataSet;
    odsRep5: TOracleDataSet;
    mdMainRashSum: TStringField;
    oqPKG_SMINI: TOracleQuery;
    cbMonth: TComboBox;
    lcicbMonth: TdxLayoutItem;
    edtYear: TSpinEdit;
    lciedtYear: TdxLayoutItem;
    lcicbPeriodFromM: TdxLayoutItem;
    cbPeriodFromM: TComboBox;
    lciedtPeriodFromY: TdxLayoutItem;
    edtPeriodFromY: TSpinEdit;
    lcicbPeriodToM: TdxLayoutItem;
    cbPeriodToM: TComboBox;
    lciedtPeriodToY: TdxLayoutItem;
    edtPeriodToY: TSpinEdit;
    lcMainGroup2: TdxLayoutGroup;
    lcMainGroup3: TdxLayoutGroup;
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure alActionsUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aSaveExecute(Sender: TObject);

    procedure lcbCloseUp(Sender: TObject);
    procedure aCheckExecute(Sender: TObject);
    procedure frxRepGetValue(const VarName: string; var Value: Variant);
    function GetDateByComponents ( AComboBox : TComboBox; ASpinEdit : TSpinEdit ): TDateTime;
  private
    iniFileName : string;
    FLang: array[0..KL_NAMELENGTH] of char; //��������� ����������
    function IniReadString(sIniFile: string; Section, Ident: string; Default: string = ''): string;
    procedure IniWriteString(sIniFile: string; Section, Ident: string; val: string = '');
    function READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;

    procedure RepExportFRToExcel( var aReport : TfrxReport; const aFileName : string );
  public
    { Public declarations }

  end;

var
  frmGetPeriod: TfrmGetPeriod;

const
  CAPTION_ERROR = '������';
  NullDate = -700000;

implementation

uses SMMainAPI, fdmPrintSelect, uGlobalConst;


{$R *.dfm}
function TfrmGetPeriod.IniReadString(sIniFile: string; Section, Ident: string; Default: string = ''): string;
var
	ini: TIniFile;
begin
	ini := TIniFile.Create(sIniFile);
	Result := ini.ReadString(Section, Ident, Default);
	ini.free;
end;

procedure TfrmGetPeriod.IniWriteString(sIniFile: string; Section, Ident: string; val: string = '');
var
	ini: TIniFile;
begin
	ini := TIniFile.Create(sIniFile);
	ini.WriteString(Section, Ident, val);
	ini.free;
end;

function TfrmGetPeriod.READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
begin
  with oqPKG_SMINI do
  try
    oqPKG_SMINI.ClearVariables;
    oqPKG_SMINI.SetVariable('PSECTION', aFC_SECTION);
    oqPKG_SMINI.SetVariable('PIDENT',   aFC_KEY);
    oqPKG_SMINI.SetVariable('PDEFAULT', aFC_DEFAULT_VALUE);

    oqPKG_SMINI.Execute;
    Result := oqPKG_SMINI.GetVariable('PVALUE');
  except
    Result := aFC_DEFAULT_VALUE;
  end;
end;
// ����� �� ��� � dmPrintSelect.ExportFRToExcel, ������ �� ����� ��������������� excel-�����
procedure TfrmGetPeriod.RepExportFRToExcel(var aReport: TfrxReport; const aFileName: string);
var
  Excel : Variant;
begin
  //���� ����� ������ � Open Office
  if ((ReadMedotradePrintDocLocal() = '0') or ((ReadMedotradePrintDocLocal() = '') and (ReadMedotradePrintDocGlobal() = '0'))) then
  begin
    dmPrintSelect.frxODSExport1.FileName := PrepareFilePath(aFileName);
    dmPrintSelect.frxODSExport1.OpenAfterExport := False;
    aReport.Export( dmPrintSelect.frxODSExport1 );
    dmPrintSelect.frxODSExport1.OpenAfterExport := True;
  end
  else
  begin
    dmPrintSelect.frxXLSExport1.FileName := PrepareFilePath(aFileName);
    dmPrintSelect.frxXLSExport1.OpenExcelAfterExport := False;
    aReport.Export( dmPrintSelect.frxXLSExport1 );
    dmPrintSelect.frxXLSExport1.OpenExcelAfterExport := True;

    try
      Excel:=CreateOleObject('Excel.Application');
    except
      MessageDlg('MS Excel �� ���������� �� ���������� !', mtWarning, [mbOK], 0);
      exit;
    end;

    try
      Excel.Workbooks.Open(dmPrintSelect.frxXLSExport1.FileName);
      Excel.ActiveSheet.PageSetup.Zoom := 95;
      Excel.ActiveSheet.PageSetup.FooterMargin := Excel.ActiveSheet.PageSetup.BottomMargin - 7;
      Excel.ActiveSheet.PageSetup.LeftFooter := '&"Arial,�������"&7' + ReadMedotradeSign();
      Excel.Visible:=True;
    except
      on E: Exception do
        Application.MessageBox( PAnsiChar ( e.Message), CAPTION_ERROR, MB_OK + MB_ICONERROR );
    end;                                                                                      
  end;
end;

procedure TfrmGetPeriod.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetPeriod.aCheckExecute(Sender: TObject);
begin
  lcgMonthEdit.Enabled := rbByMonth.Checked;
  lcgPeriodEdit.Enabled := rbPeriod.Checked;
end;

procedure TfrmGetPeriod.alActionsUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  aSave.Enabled := (lcbMO_GROUP.KeyValue > 0) and (lcbMedic.KeyValue > 0);
end;

procedure TfrmGetPeriod.aSaveExecute(Sender: TObject);
var
  P : TPoint;
  DateFrom, DateTo, pDateFrom, pDateTo : TDateTime;
  i, j, MonthCount : Integer;
  RemainSum, PrihSum, RashSum : Double;
begin
  DateFrom := NullDate;
  DateTo := NullDate;
  RemainSum := 0;
  PrihSum := 0;
  RashSum := 0;

  if rbByMonth.Checked then
  begin
     DateFrom := StartOfTheMonth( Trunc ( GetDateByComponents( cbMonth, edtYear ) ) );
     DateTo := EndOfTheMonth( Trunc ( GetDateByComponents( cbMonth, edtYear ) ) );
  end
  else
  if rbPeriod.Checked then
  begin
     DateFrom := StartOfTheMonth( Trunc ( GetDateByComponents( cbPeriodFromM, edtPeriodFromY )   ) );
     DateTo := EndOfTheMonth( Trunc ( GetDateByComponents( cbPeriodToM, edtPeriodToY ) ) );
  end;

  if ( not ( DateTo > 0 ) ) or ( not ( DateFrom > 0 ) ) then
  begin
    Application.MessageBox('�� ��������� ������!', PAnsiChar (CAPTION_ERROR) , MB_OK + MB_ICONERROR);
    Exit;
  end;

  if ( DateFrom > DateTo ) then
  begin
    Application.MessageBox('������� ������ ������!', PAnsiChar (CAPTION_ERROR) , MB_OK + MB_ICONERROR);
    Exit;
  end;

  // ��������� ��������� ���������
  IniWriteString(iniFileName,'Params', 'lcbMedic', IntToStr(lcbMedic.KeyValue));
  IniWriteString(iniFileName,'Params', 'lcbMO_GROUP', IntToStr(lcbMO_GROUP.KeyValue));

  if dmPrintSelect.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := btnSave.Height;
    P := btnSave.ClientToScreen(P);
    dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // ������ ����� ����� ����������� ������� TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // � ������������� ���� - ����� �������� �� ����� ����� ������ ���� ������ ������ ������� ������

  if dmPrintSelect.PrintFlag = 0 then
    Exit;

  if FileExists('frxDvig_OneMedicByMonths.fr3') then            // ���� ������ ����
    frxRep.LoadFromFile('frxDvig_OneMedicByMonths.fr3');  // ��������� ���

  // ������������ ������
  try
    mdMain.Open;

    Screen.Cursor := crSQLWait;
    for j := 0 to  ( (YearOf(DateTo)-1)*MonthsPerYear + MonthOf(DateTo) - ((YearOf(DateFrom)-1)*MonthsPerYear + MonthOf(DateFrom)))  do
    begin
      RemainSum := 0;
      PrihSum := 0;
      RashSum := 0;

      pDateFrom := SysUtils.IncMonth( DateFrom, j );
      pDateTo := EndOfTheMonth(pDateFrom);

      odsRep1.Close;
      odsRep1.SetVariable('DATE1', pDateFrom );
      odsRep1.SetVariable('DATE2', pDateTo );
      odsRep1.SetVariable('MEDICID',lcbMedic.KeyValue );
      odsRep1.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue );
      odsRep1.Open;
      odsRep1.First;

      while not odsRep1.Eof  do
      begin
        with mdMain do
        begin
          Append;
          FieldByName( 'Month' ).AsString := FormatDateTime( 'MMMM YYYY', pDateFrom ) ;
          FieldByName( 'RemainOn1Day' ).AsVariant := odsRep1.FieldByName( 'FN_KOLOSTBEGIN' ).AsVariant;

          RemainSum := RemainSum + FieldByName( 'RemainOn1Day' ).AsFloat;
        end;

        odsRep1.Next;
      end;
      // �������
      odsRep2.Close;
      odsRep2.SetVariable('DATE1', pDateFrom);
      odsRep2.SetVariable('DATE2', pDateTo);
      odsRep2.SetVariable('MEDICID',lcbMedic.KeyValue);
      odsRep2.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
      odsRep2.Open;
      odsRep2.First;

      // ������
      odsRep3.Close;
      odsRep3.SetVariable('DATE1', pDateFrom);
      odsRep3.SetVariable('DATE2', pDateTo);
      odsRep3.SetVariable('MEDICID',lcbMedic.KeyValue);
      odsRep3.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
      odsRep3.Open;
      odsRep3.First;

      // ������� � ������
      odsRep5.Close;
      odsRep5.SetVariable('DATE1', pDateFrom);
      odsRep5.SetVariable('DATE2', pDateTo);
      odsRep5.SetVariable('MEDICID',lcbMedic.KeyValue);
      odsRep5.SetVariable('MOGROUPID',lcbMO_GROUP.KeyValue);
      odsRep5.Open;
      odsRep5.First;

      for i := 1 to Max( odsRep2.RecordCount + odsRep5.RecordCount, odsRep3.RecordCount ) do
      begin

        with mdMain do
        begin
          Append;

          if (not odsRep2.Eof ) then
          begin
            FieldByName( 'PrihFrom' ).AsString := odsRep2.FieldByName( 'fc_name' ).AsString;
            FieldByName( 'PrihDoc' ).AsString := odsRep2.FieldByName( 'fc_doc' ).AsString + ' �� ' +  FormatDateTime ( 'dd.mm.yyyy', odsRep2.FieldByName( 'fd_data' ).AsDateTime ) ;
            FieldByName( 'PrihCnt' ).AsVariant := odsRep2.FieldByName( 'fn_kol' ).AsVariant;

            PrihSum := PrihSum + FieldByName( 'PrihCnt' ).AsFloat;
            odsRep2.Next;
          end
          else
          if (not odsRep5.Eof ) then
          begin
            FieldByName( 'PrihFrom' ).AsString := '';
            FieldByName( 'PrihDoc' ).AsString := odsRep5.FieldByName( 'fc_doc' ).AsString + ' �� ' +  FormatDateTime ( 'dd.mm.yyyy', odsRep2.FieldByName( 'FD_DATE_OTP' ).AsDateTime ) ;
            FieldByName( 'PrihCnt' ).AsVariant := odsRep5.FieldByName( 'fn_kol' ).AsVariant;

            PrihSum := PrihSum + FieldByName( 'PrihCnt' ).AsFloat;
            odsRep5.Next;
          end;

          if not odsRep3.Eof then
          begin
            FieldByName( 'RashDate' ).AsString := FormatDateTime ( 'dd.mm.yyyy', odsRep3.FieldByName( 'FD_DATE_OTP' ).AsDateTime ) ;
            FieldByName( 'RashDoc' ).AsString := odsRep3.FieldByName( 'fc_doc' ).AsString;
            FieldByName( 'RashCnt' ).AsVariant := odsRep3.FieldByName( 'fn_kol' ).AsVariant;

            RashSum := RashSum + FieldByName( 'RashCnt' ).AsFloat;
            odsRep3.Next;
          end;

        end;
      end;

      // ������� �������� �������� �� ������ �����
      with mdMain do
      begin                                                                           
        Append;
        FieldByName( 'PrihWithRemain').AsFloat := RemainSum + PrihSum; // ������� + ������
        FieldByName( 'RashSum' ).AsFloat := RashSum; // ����� �������
        FieldByName( 'RemainByRepOnEnd' ).AsFloat := FieldByName( 'PrihWithRemain').AsFloat - FieldByName( 'RashSum' ).AsFloat; // ������� �� �������
      end;
    end;

    Screen.Cursor := crDefault;
    frxRep.PrepareReport;
    case dmPrintSelect.PrintFlag of // ���� ���� ��������
      1: RepExportFRToExcel( frxRep, Application.Title + ' � '+DateToStr( DateFrom )+' �� '+DateToStr( DateTo )+'.xls' );
      2: frxRep.ShowPreparedReport;
    end;

  finally
    Screen.Cursor := crDefault;  
    dmPrintSelect.PrintFlag := 0;
    mdMain.Close;
    Close;
  end;

end;

procedure TfrmGetPeriod.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  LoadKeyboardLayout(FLang, KLF_ACTIVATE);
  Action := caFree;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var
  FK_APPSOTR_ID : Integer;
  LongMonthNames : array[1..12] of string;
  i : Integer;
begin
  lcbMO_GROUP.KeyValue := -1;
  lcbMO_GROUP.Enabled :=  False;
  iniFileName := Application.ExeName+'.ini';

  LongMonthNames[1] := '������';
  LongMonthNames[2] := '�������';
  LongMonthNames[3] := '����';
  LongMonthNames[4] := '������';
  LongMonthNames[5] := '���';
  LongMonthNames[6] := '����';
  LongMonthNames[7] := '����';
  LongMonthNames[8] := '������';
  LongMonthNames[9] := '��������';
  LongMonthNames[10] := '�������';
  LongMonthNames[11] := '������';
  LongMonthNames[12] := '�������';

  for i := 1 to Length (LongMonthNames)  do
  begin
    cbMonth.Items.Add( LongMonthNames[i] );
    cbPeriodFromM.Items.Add( LongMonthNames[i] );
    cbPeriodToM.Items.Add( LongMonthNames[i] );
  end;

  // �� �����
  cbMonth.ItemIndex := MonthOfTheYear( Date )-1;
  edtYear.Value := YearOf( Date );

  // �� ���������
  cbPeriodFromM.ItemIndex := MonthOfTheYear( Date )-1;
  edtPeriodFromY.Value := YearOf( Date );
  cbPeriodToM.ItemIndex := MonthOfTheYear( IncMonth ( Date, 1 ) )-1;
  edtPeriodToY.Value := YearOf( IncMonth ( Date, 1 ) );

  rbByMonth.Checked := True;
  
  try
    GetSession(os, 'ASU');
  except
    Application.MessageBox('��� ���������� � ����� ������!',PAnsiChar (CAPTION_ERROR),mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;

  try
    if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
      FK_APPSOTR_ID := -1;
    oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
    oqInitMO.Execute;
  except
    Application.MessageBox('������ ��� ������������� ����������!',PAnsiChar (CAPTION_ERROR),mb_ok + mb_iconerror);
    Application.Terminate;
  end;

  // ������ ��
  try
    odsGroupMo.Close;
    odsGroupMo.Open;

    if VarIsNull( oqInitMO.GetVariable('nMO_GROUP') ) or not ( oqInitMO.GetVariable('nMO_GROUP') > 0 )  then
    begin
      Application.MessageBox('������ �� �� ����������!', PAnsiChar (CAPTION_ERROR),mb_ok + mb_iconerror);
    end
    else
    begin
      lcbMO_GROUP.KeyValue := oqInitMO.GetVariable('nMO_GROUP');
      lcbMO_GROUP.Enabled :=  (oqInitMO.GetVariable('PFL_PROVIZOR') = 1);
      lcbCloseUp ( lcbMO_GROUP );
    end;
  except
    Application.MessageBox('������ ��� ��������� ������ ����� ��!', PAnsiChar (CAPTION_ERROR),mb_ok + mb_iconerror);
    Application.Terminate;
  end;

  // �����������
  try
    odsMedic.Close;
    odsMedic.Open;

    if ( StrToInt(IniReadString(iniFileName,'Params', 'lcbMedic', '-1')) > 0 ) and
       ( odsMedic.Locate( 'MEDICID', StrToInt(IniReadString(iniFileName,'Params', 'lcbMedic', '-1')), [] ) ) then
    begin
      lcbMedic.KeyValue := StrToInt(IniReadString(iniFileName,'Params', 'lcbMedic', '-1'));
      lcbCloseUp ( lcbMedic );
    end;
  except
    Application.MessageBox('������ ��� ��������� ������ ������������!', PAnsiChar (CAPTION_ERROR),mb_ok + mb_iconerror);
    Application.Terminate;
  end;

  //���������� ������� ���������
  GetKeyboardLayoutName(FLang);
  //��������� ������� ��������� ����������
  LoadKeyboardLayout(PChar('00000419'), KLF_ACTIVATE);

  Self.Caption := Application.Title;
end;

procedure TfrmGetPeriod.frxRepGetValue(const VarName: string; var Value: Variant);
var
  fVarName : string;
begin
  fVarName := UpperCase( VarName );

  if fVarName = 'S_NAME' then
    Value := READSTRING_TSMINI( 'CONFIG', 'S_FULLNAME', '' );

  if fVarName = 'MOGROUP_NAME' then
    Value := lcbMO_GROUP.Text;

  if fVarName = 'MEDIC_NAME' then
    Value := odsMedic.FieldByName( 'FC_MEDIC' ).AsString;

  if fVarName = 'DOZ' then
    Value := '';

  if fVarName = 'LF' then
    Value := odsMedic.FieldByName( 'fn_mass' ).AsString + odsMedic.FieldByName( 'FC_MASS_EDIZM' ).AsString;

  if fVarName = 'UNIT' then
    Value := odsMedic.FieldByName( 'FC_EDIZM' ).AsString;
end;

function TfrmGetPeriod.GetDateByComponents(AComboBox: TComboBox; ASpinEdit: TSpinEdit): TDateTime;
begin
  Result := Date;

  if ( AComboBox.ItemIndex < 0 ) or ( ASpinEdit.Value < 1900 ) then
    Exit;
  try
    Result := EncodeDate( ASpinEdit.Value, AComboBox.ItemIndex+1, 1 );
  except
    Result := Date;                                                 
  end;

end;

procedure TfrmGetPeriod.lcbCloseUp(Sender: TObject);
begin
  if ( Sender is TDBLookupComboBox ) and ( ( Sender as TDBLookupComboBox ).KeyValue > 0 ) then
    (Sender as TDBLookupComboBox).Hint := (Sender as TDBLookupComboBox).Text;
end;

end.
