unit fMain;

interface

uses
  Windows, Forms, Oracle, Dialogs, ImgList, Controls, Db,
  OracleData, Classes, ActnList, ComCtrls, ToolWin, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGrid, ExtCtrls,
  cxStyles, StdCtrls, cxGridCustomPopupMenu, cxGridPopupMenu, cxCustomData,
  cxGraphics, Graphics, dxStatusBar, HtmlHlp, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxSpinEdit, cxCurrencyEdit, cxTextEdit,
  JvComponentBase, JvFormPlacement, JvStringHolder, OracleMonitor, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxStatusBarPainter,
  cxConstantsRus, dxBarCustomize_Rus;

Const NullDate = -700000;

type

  TfrmMain = class(TForm)
    Panel1: TPanel;
    al: TActionList;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    acFilter: TAction;
    ToolButton1: TToolButton;
    os: TOracleSession;
    odsOborot: TOracleDataSet;
    dsOborot: TDataSource;
    ilMain: TImageList;
    acExit: TAction;
    acExpExcel: TAction;
    acRefresh: TAction;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    FormStorage: TJvFormStorage;
    sd: TSaveDialog;
    cxGrLevel: TcxGridLevel;
    cxGr: TcxGrid;
    cxGrDBBandedTableView: TcxGridDBBandedTableView;
    cxGrDBBandedTableViewColumn1: TcxGridDBBandedColumn;
    cxGrDBBandedTableViewColumn2: TcxGridDBBandedColumn;
    cxGrDBBandedTableViewColumn3: TcxGridDBBandedColumn;
    cxGrDBBandedTableViewColumn4: TcxGridDBBandedColumn;
    cxGrDBBandedTableViewColumn5: TcxGridDBBandedColumn;
    cxGrDBBandedTableViewColumn6: TcxGridDBBandedColumn;
    cxGrDBBandedTableViewColumn7: TcxGridDBBandedColumn;
    cxGrDBBandedTableViewColumn8: TcxGridDBBandedColumn;
    cxGrDBBandedTableViewColumn9: TcxGridDBBandedColumn;
    cxGrDBBandedTableViewColumn10: TcxGridDBBandedColumn;
    cxGrDBBandedTableViewColumn11: TcxGridDBBandedColumn;
    cxStyleRepository: TcxStyleRepository;
    cxBoldStyle: TcxStyle;
    cxGridPopupMenu: TcxGridPopupMenu;
    cxGrDBBandedTableViewColumn12: TcxGridDBBandedColumn;
    cxGrDBBandedTableViewColumn13: TcxGridDBBandedColumn;
    sb: TdxStatusBar;
    cxBold12: TcxStyle;
    StrHolder1: TJvStrHolder;
    odsGroupMo: TOracleDataSet;
    odsGroupMoGROUPID: TFloatField;
    odsGroupMoFC_GROUP: TStringField;
    odsGroupMoFL_DEL: TFloatField;
    cxGrDBBandedTableViewColumn14: TcxGridDBBandedColumn;
    cxGrDBBandedTableViewColumn15: TcxGridDBBandedColumn;
    cxGrDBBandedTableViewColumn16: TcxGridDBBandedColumn;
    StrHolder2: TJvStrHolder;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxGrDBBandedTableViewColumn17: TcxGridDBBandedColumn;
    cxGrDBBandedTableViewColumn18: TcxGridDBBandedColumn;
    oqPKG_SMINI: TOracleQuery;
    procedure FormCreate(Sender: TObject);
    procedure acFilterExecute(Sender: TObject);
    procedure acExpExcelExecute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure odsOborotAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure cxGrDBBandedTableViewDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure cxGrDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
  private
    FDate1: TDateTime;
    FDate2: TDateTime;
    FCurMO_GROUP : string;
    FHTML_Cols, FHTML_HEADER_COLS, FHTML_OTD_NUM, FHTML_OTD_NAMES,
    FHTML_KOL_SUM_HEADER, FHTML_MisalignedColumns, FHTML_MAINDATA, FHTML_SUM_OTD : string;
    FN_SUM_OST_BEGIN, FN_SUM_PRIH, FN_SUM_SPIS, FN_SUM_RASH, FN_SUM_OST_END : Double;
    FN_SUM_RASH_OTD : array of Double;


    FKolAndSummFieldsName : array of string;
    function PrepareSqlText: String;
    procedure CreateColumns;
    procedure SetDate1(const Value: TDateTime);
    procedure SetDate2(const Value: TDateTime);
    procedure SetAlarm(bAlarm: Boolean);
    function GetAlarm(ods: TOracleDataSet): Boolean;

    { Private declarations }
  public
    bAlarm: Boolean;
    bShowFinsource, bShowFarmGroup: Boolean;
    property Date1: TDateTime read FDate1 write SetDate1;
    property Date2: TDateTime read FDate2 write SetDate2;
    function READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
  end;

var
  frmMain: TfrmMain;

implementation

uses fgetperiod, JvDBUtils, {cxGridExportLink,} Sysutils, Variants, ComObj,
     fdmPrintSelect, fProgressBar, uGlobalConst, SMMainAPI, uGlobal;
{$R *.DFM}
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

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  try
//    os.LogOn;
    GetSession(os, 'ASU');
  except
    Application.MessageBox('��� ���������� � ����� ������!','������',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;

  Date1 := NullDate;
  Date2 := NullDate;
  cxGrDBBandedTableView.Bands[11].Caption := READSTRING_TSMINI('MANAGER_DOC', 'CLIENT_NAME', '');
  cxGrDBBandedTableView.ClearItems;
end;

function TfrmMain.READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
begin
  oqPKG_SMINI.ClearVariables;
  oqPKG_SMINI.SetVariable('PSECTION', aFC_SECTION);
  oqPKG_SMINI.SetVariable('PIDENT',   aFC_KEY);
  oqPKG_SMINI.SetVariable('PDEFAULT', aFC_DEFAULT_VALUE);

  oqPKG_SMINI.Execute;
  Result := nvl(oqPKG_SMINI.GetVariable('PVALUE'), '');
end;

procedure TfrmMain.acFilterExecute(Sender: TObject);
var frmGetperiod : TfrmGetPeriod;
  i, n, RecCount : integer;
  FN_TEMP : double;
  frmProgrBar : TfrmProgressBar;
  UchgridStr : string;
begin
  frmGetperiod := TfrmGetPeriod.Create(nil);
  frmProgrBar := TfrmProgressBar.Create(Self, '����������� �������� ������');

  if READSTRING_TSMINI('MEDICA.EXE','FUNC_USE_MEDUCHGRP_CH','0')='1' then
    UchgridStr := 'nvl( k.UCHGRID, m.UCHGRID )'
  else
    UchgridStr := 'm.UCHGRID';

  StrHolder1.CommaText := StringReplace(StrHolder1.CommaText,'#uchgrid#', UchgridStr,  [rfReplaceAll, rfIgnoreCase] );    
  StrHolder2.CommaText := StringReplace(StrHolder2.CommaText,'#uchgrid#', UchgridStr,  [rfReplaceAll, rfIgnoreCase] );

  try
//    frmGetperiod.lcb.KeyValue := 90;
//    frmGetperiod.lcbType.KeyValue := 0;
    Screen.Cursor := crSQLWait;
    frmGetperiod.lcbCloseUp(frmGetperiod.lcbMO_GROUP);
    if frmGetperiod.ShowModal = mrOk then
    begin
      bShowFinsource := frmGetperiod.chbShowFinsource.Checked;
      bShowFarmGroup := frmGetperiod.chbShowFarmgr.Checked;
			cxGrDBBandedTableView.Bands[13].Caption := '������ �����������-������������� ���: ' + frmGetperiod.lcbMO_GROUP.Text;
      cxGrDBBandedTableView.Bands[14].Caption := '������� ������: ' + frmGetperiod.ccbMedType.Text; //frmGetperiod.lcbType.Text;
			cxGrDBBandedTableView.Bands[15].Caption := Format('�� ������ � %s �� %s',
        [DateTimeToStr(frmGetperiod.dDate1.date),DateTimeToStr(frmGetperiod.dDate2.date)]);

      Self.Caption := '�������� � ��������� �������';// - (' + frmGetperiod.odsType.FieldByName('FC_NAME').AsString + ')'; ���������� ������� �.�.
      Date1 := frmGetperiod.dDate1.date;
      Date2 := frmGetperiod.dDate2.date;
      FCurMO_GROUP := frmGetperiod.lcbMO_GROUP.Text;

      odsGroupMo.SetVariable('Date1', Date1);
      odsGroupMo.SetVariable('Date2', Date2);
      odsGroupMo.SetVariable('MOGROUP_ID', frmGetperiod.lcbMO_GROUP.KeyValue);
//      odsGroupMo.SetVariable('TMEDICTYPE', frmGetperiod.lcbType.KeyValue);
      odsGroupMo.Close;
      if frmGetperiod.IDn > 0 then
      begin
          StrHolder2.MacroByName('sMedicsTypes').Value := '  AND ug.uchgrid in (select uchgrid from med.tuchgr connect by prior uchgrid = parentid start with uchgrid in ( '+frmGetperiod.IDs+' )) '; // ���������� ���� ������������
          StrHolder1.MacroByName('sMedicsTypes').Value:= '  AND ug.uchgrid in (select uchgrid from med.tuchgr connect by prior uchgrid = parentid start with uchgrid in ( '+frmGetperiod.IDs+' )) '; // ���������� ���� ������������
      end;

      if frmGetperiod.FarmgrIDn > 0 then
        StrHolder2.MacroByName('sMedicsFarmgr').Value := '  AND M.FARMGRID in ( '+frmGetperiod.FarmgrIDs+' ) ' // ���������� ���� ������
      else
        StrHolder2.MacroByName('sMedicsFarmgr').Value := ''; // �����
      odsGroupMo.SQL.Text := StrHolder2.ExpandMacros;
      odsGroupMo.Open;

      if frmGetperiod.FarmgrIDn > 0 then
        StrHolder1.MacroByName('sMedicsFarmgr').Value := '  AND M.FARMGRID in ( '+frmGetperiod.FarmgrIDs+' ) ' // ���������� ���� ������
      else
        StrHolder1.MacroByName('sMedicsFarmgr').Value := ''; // �����
      odsOborot.Sql.Text := PrepareSqlText;
      odsOborot.SetVariable('Date1', Date1);
      odsOborot.SetVariable('Date2', Date2);
      odsOborot.SetVariable('MOGROUP_ID', frmGetperiod.lcbMO_GROUP.KeyValue);
//      odsOborot.SetVariable('TMEDICTYPE', frmGetperiod.lcbType.KeyValue);

      if bShowFinsource then
        odsOborot.SQL.Text := StringReplace(odsOborot.SQL.Text, '--FS', '', [rfReplaceAll]);  

      if bShowFarmGroup then
      begin
        odsOborot.SQL.Text := StringReplace(odsOborot.SQL.Text, '--FG', '', [rfReplaceAll]);
      end;

      odsOborot.Close;
      odsOborot.Open;

      odsOborot.DisableControls;
      odsOborot.First;
      FHTML_MAINDATA := '';
      FN_SUM_OST_BEGIN := 0;
      FN_SUM_PRIH := 0;
      FN_SUM_SPIS := 0;
      FN_SUM_RASH := 0;
      FN_SUM_OST_END := 0;

      n := odsGroupMo.RecordCount-1;
      SetLength(FN_SUM_RASH_OTD, odsGroupMo.RecordCount);
      RecCount := odsOborot.RecordCount;
      frmProgrBar.Visible := True;
      while not odsOborot.Eof do  // ::MAINDATA::
      begin
        FHTML_MAINDATA := FHTML_MAINDATA + ' <tr height=17 style=''height:12.75pt''>'#13#10;
        FHTML_MAINDATA := FHTML_MAINDATA + '    <td height=17 class=xl2813794 tyle=''height:12.75pt;border-top:none''>'+IntToStr(odsOborot.FieldByName('VFN_ROWNUM').AsInteger)+'</td>'#13#10;
        FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl2913794 style=''border-top:none;border-left:none''>'+odsOborot.FieldByName('VFC_LONGNAME').AsString+'</td>'#13#10;
        FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl2813794 style=''border-top:none;border-left:none''>'+odsOborot.FieldByName('VFC_EDIZM').AsString+'</td>'#13#10;

        if bShowFinsource then
          FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl2813794 style=''border-top:none;border-left:none''>'+odsOborot.FieldByName('VFC_FINSOURCE').AsString+'</td>'#13#10;
               
        if bShowFarmGroup then
          FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl2813794 style=''border-top:none;border-left:none''>'+odsOborot.FieldByName('VFC_FARMGR').AsString+'</td>'#13#10;

        FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl2813794 style=''border-top:none;border-left:none''>'+FloatToStr(odsOborot.FieldByName('VFN_KOLOSTBEGIN').AsFloat)+'</td>'#13#10;
        FN_TEMP := odsOborot.FieldByName('VFN_SUMOSTBEGIN').AsFloat;
        FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl3013794 style=''border-top:none;border-left:none''>'+FloatToStrF(FN_TEMP, ffNumber, 18,2)+'</td>'#13#10;
        FN_SUM_OST_BEGIN := FN_SUM_OST_BEGIN + FN_TEMP;
        FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl2813794 style=''border-top:none;border-left:none''>'+FloatToStr(odsOborot.FieldByName('VFN_KOLPRIH').AsFloat)+'</td>'#13#10;
        FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl3013794 style=''border-top:none;border-left:none''>'+FloatToStrF(odsOborot.FieldByName('VFN_SUMPRIH').AsFloat, ffNumber, 18,2)+'</td>'#13#10;
        FN_SUM_PRIH := FN_SUM_PRIH + odsOborot.FieldByName('VFN_SUMPRIH').AsFloat;

        for i := 0 to n do
        begin
          FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl3013794 style=''border-top:none;border-left:none''>'+FloatToStr(odsOborot.FieldByName( FKolAndSummFieldsName[i*2  ] ).AsFloat)+'</td>'#13#10; // ���-��
          FN_TEMP := odsOborot.FieldByName( FKolAndSummFieldsName[i*2+1] ).AsFloat;
          FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl3013794 style=''border-top:none;border-left:none''>'+FloatToStrF(FN_TEMP, ffNumber, 18,2)+'</td>'#13#10; // �����
          FN_SUM_RASH_OTD[i] := FN_SUM_RASH_OTD[i] + FN_TEMP;
        end;

        // ��������
        FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl2813794 style=''border-top:none;border-left:none''>'+FloatToStr(odsOborot.FieldByName('VFN_KOLSPIS').AsFloat)+'</td>'#13#10;
        FN_TEMP := odsOborot.FieldByName('VFN_SUMSPIS').AsFloat;
        FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl3013794 style=''border-top:none;border-left:none''>'+FloatToStrF(FN_TEMP, ffNumber, 18,2)+'</td>'#13#10;
        FN_SUM_SPIS := FN_SUM_SPIS + FN_TEMP;
        // ������
        FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl2813794 style=''border-top:none;border-left:none''>'+FloatToStr(odsOborot.FieldByName('VFN_KOLRASH').AsFloat)+'</td>'#13#10;
        FN_TEMP := odsOborot.FieldByName('VFN_SUMRASH').AsFloat;
        FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl3013794 style=''border-top:none;border-left:none''>'+FloatToStrF(FN_TEMP, ffNumber, 18,2)+'</td>'#13#10;
        FN_SUM_RASH := FN_SUM_RASH + FN_TEMP;
        FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl3013794 style=''border-top:none;border-left:none''>'+FloatToStrF(odsOborot.FieldByName('VFN_PRICE').AsFloat, ffNumber, 18,2)+'</td>'#13#10;
        // ������� �� ����� �������
        FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl2813794 style=''border-top:none;border-left:none''>'+FloatToStr(odsOborot.FieldByName('VFN_KOLOSTEND').AsFloat)+'</td>'#13#10;
        FN_TEMP := odsOborot.FieldByName('VFN_SUMOSTEND').AsFloat;
        FHTML_MAINDATA := FHTML_MAINDATA + '    <td class=xl3013794 style=''border-top:none;border-left:none''>'+FloatToStrF(FN_TEMP, ffNumber, 18,2)+'</td>'#13#10;
        FN_SUM_OST_END := FN_SUM_OST_END + FN_TEMP;
        FHTML_MAINDATA := FHTML_MAINDATA + ' </tr>'#13#10;

        frmProgrBar.CurValue := (frmProgrBar.MaxValue/RecCount)*odsOborot.RecNo;
        Application.ProcessMessages;
        odsOborot.Next;
      end;

      FHTML_SUM_OTD := '';
      for i := 0 to n do
      begin
        FHTML_SUM_OTD := FHTML_SUM_OTD +
                         '  <td class=xl3113794></td>'#13#10+
                         '  <td class=xl3113794>'+FloatToStrF(FN_SUM_RASH_OTD[i], ffNumber, 18,2)+'</td>'#13#10;
      end;
      odsOborot.EnableControls;
      CreateColumns;

      cxGrDBBandedTableView.Bands[3].Visible := bShowFinsource;
      cxGrDBBandedTableView.Bands[3].VisibleForCustomization := bShowFinsource;  

      cxGrDBBandedTableView.Bands[4].Visible := bShowFarmGroup;
      cxGrDBBandedTableView.Bands[4].VisibleForCustomization := bShowFarmGroup;

//        cxGrDBBandedTableView.ApplyBestFit(nil);

      sb.Panels[0].Text := Format(' ��������� ������: � %s �� %s',
        [DateToStr(frmGetperiod.dDate1.Date),DateToStr(frmGetperiod.dDate2.Date)]);

      SetAlarm(GetAlarm(odsOborot));
    end;
  finally
    frmGetperiod.Free;
    frmProgrBar.Free;
    Screen.Cursor := crDefault;
    if cxGrDBBandedTableView.Bands[6].ColumnCount = 0 then cxGrDBBandedTableView.Bands[6].Visible := False;
  end;
end;

procedure TfrmMain.acExpExcelExecute(Sender: TObject);
var
  sFileName1, sFileName2: String;
  Excel: Variant;
  StrL,StrL1 : TStringList;
  i:Integer;
begin
//  if sd.Execute then
//  begin
//    ExportGrid4ToExcel(sd.FileName,cxGr,true,true,False);
//  end;
  // �������� ����������� ����������� HTML-����

  if bShowFinsource and FileExists('aOborotkaRazv_shablon.htm') then
  begin
    CopyFile(PAnsiChar('aOborotkaRazv_shablon.htm'), PAnsiChar(fdmPrintSelect.PrepareFilePath('��������� ��������� ('+DateToStr(Date1)+'-'+DateToStr(Date2)+', '+FCurMO_GROUP+')'+'.htm')), false);
    sFileName1 := ChangeFileExt(fdmPrintSelect.PrepareFilePath(ExtractFileName('��������� ��������� ('+DateToStr(Date1)+'-'+DateToStr(Date2)+', '+FCurMO_GROUP+')'+'.xls')), '.htm');
    sFileName2:= ChangeFileExt(sFileName1,'.xls');
  end
  else
  if bShowFarmGroup and FileExists('aOborotkaRazv_shablon.htm') then
  begin
    CopyFile(PAnsiChar('aOborotkaRazv_shablon.htm'), PAnsiChar(fdmPrintSelect.PrepareFilePath('��������� ��������� ('+DateToStr(Date1)+'-'+DateToStr(Date2)+', '+FCurMO_GROUP+')'+'.htm')), false);
    sFileName1 := ChangeFileExt(fdmPrintSelect.PrepareFilePath(ExtractFileName('��������� ��������� ('+DateToStr(Date1)+'-'+DateToStr(Date2)+', '+FCurMO_GROUP+')'+'.xls')), '.htm');
    sFileName2:= ChangeFileExt(sFileName1,'.xls');
  end
  else
  begin
    sFileName1 := ChangeFileExt(fdmPrintSelect.PrepareFilePath(ExtractFileName('��������� ��������� ('+DateToStr(Date1)+'-'+DateToStr(Date2)+', '+FCurMO_GROUP+')'+'.xls')), '.htm');
    sFileName2 := ChangeFileExt(sFileName1,'.xls');
    SaveResToFile( 'HTMLShablon', 'htm', sFileName1);
  end;

  StrL := TStringList.Create;
  StrL1 := TStringList.Create;

  StrL.Clear;
  StrL1.Clear;
  StrL1.LoadFromFile(sFileName1);

  for I := 0 to StrL1.Count - 1 do
  begin
    if (bShowFinsource or (Pos('::ISTFIN::',StrL1[I])<=0))
    and (bShowFarmGroup or (Pos('::FARMGRP::',StrL1[I])<=0))
    then
      StrL.Append(StrL1[i]);
  end;

 { if bShowFarmGroup then
  begin
    StrL.Text := StringReplace(StrL.Text, '���. ���-��', '����. ������', []);
  end; }

  if bShowFinsource then
  begin
    StrL.Text:=StringReplace(StrL.Text, '::ISTFIN::', '', [rfReplaceAll, rfIgnoreCase]);
  end else
  begin
    StrL.Text:=StringReplace(StrL.Text, '::ISTFIN::', 'display:none', [rfReplaceAll, rfIgnoreCase]);
  end;
  if bShowFarmGroup then
  begin
    StrL.Text:=StringReplace(StrL.Text, '::FARMGRP::', '', [rfReplaceAll, rfIgnoreCase]);
  end else
  begin
    StrL.Text:=StringReplace(StrL.Text, '::FARMGRP::', 'display:none', [rfReplaceAll, rfIgnoreCase]);
  end;

  StrL.Text := StringReplace(StrL.Text, '::COLS::', FHTML_Cols, []);
  StrL.Text:=StringReplace(StrL.Text, '::HEADER_COLS::', FHTML_HEADER_COLS, [rfReplaceAll]);
  StrL.Text:=StringReplace(StrL.Text, '::OTD_NUM::', FHTML_OTD_NUM, []);
  StrL.Text:=StringReplace(StrL.Text, '::OTD_NAMES::', FHTML_OTD_NAMES, []);
  StrL.Text:=StringReplace(StrL.Text, '::KOL_SUM_HEADER::', FHTML_KOL_SUM_HEADER, []);
  StrL.Text:=StringReplace(StrL.Text, '::MisalignedColumns::', FHTML_MisalignedColumns, []);

  StrL.Text:=StringReplace(StrL.Text, '::SUM_OST_BEGIN::', FloatToStrF(FN_SUM_OST_BEGIN, ffNumber, 18,2), []);
  StrL.Text:=StringReplace(StrL.Text, '::SUM_PRIH::',      FloatToStrF(FN_SUM_PRIH, ffNumber, 18,2),      []);
  StrL.Text:=StringReplace(StrL.Text, '::SUM_SPIS::',      FloatToStrF(FN_SUM_SPIS, ffNumber, 18,2),      []);
  StrL.Text:=StringReplace(StrL.Text, '::SUM_RASH::',      FloatToStrF(FN_SUM_RASH, ffNumber, 18,2),      []);
  StrL.Text:=StringReplace(StrL.Text, '::SUM_OST_END::',   FloatToStrF(FN_SUM_OST_END, ffNumber, 18,2),   []);

  StrL.Text:=StringReplace(StrL.Text, '::SUM_OTD::', FHTML_SUM_OTD, []);
  StrL.Text:=StringReplace(StrL.Text, '::MAINDATA::', FHTML_MAINDATA, []);

  StrL.Text:=StringReplace(StrL.Text, '::OTDELENIE::',   FCurMO_GROUP,         []);
  StrL.Text:=StringReplace(StrL.Text, '::DATE1::',       DateTimeToStr(Date1), []);
  StrL.Text:=StringReplace(StrL.Text, '::DATE2::',       DateTimeToStr(Date2), []);

  try
    StrL.SaveToFile(sFileName2);
  except
    ;
  end;
  StrL.Free;
  StrL1.Free;

  Excel:=CreateOleObject('Excel.Application');
  Excel.Workbooks.Open(sFileName2);
  Excel.ActiveSheet.PageSetup.LeftMargin := 57;
  Excel.ActiveSheet.PageSetup.RightMargin := 27;
  Excel.ActiveSheet.PageSetup.TopMargin := 27;
  Excel.ActiveSheet.PageSetup.BottomMargin := 27;
  Excel.ActiveSheet.PageSetup.LeftFooter := '&"Arial,�������"&7' + ReadMedotradeSign;

//      Excel.ActiveSheet.PageSetup.PrintTitleRows:='$19:$20';
//      Excel.ActiveSheet.PageSetup.Zoom := 87;
//      Excel.Rows['22:'+IntToStr(RowCount+22)].EntireRow.AutoFit;
  Excel.Visible:=True;
  DeleteFile(sFileName1);

end;

procedure TfrmMain.acExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.acRefreshExecute(Sender: TObject);
begin

  RefreshQuery(odsOborot);
end;

function TfrmMain.PrepareSqlText: String;
var sSumm, sCase, sCaseAndSum : String;
 i : Integer;
begin
  // ������������ ������ SQL ��� ��������, �.�. ���-�� �� ����� �������, ����-��
  // ���������� ��������� - ������� ����� ������� ������� �� �� (���-��, �����)
  //#VK<MOID> - � �������� �����������   --|||--    V - visible
  //#VS<MOID> - � �������� �����
  sCase := ''; sSumm := '';  sCaseAndSum := '';
  FHTML_Cols := ''; FHTML_HEADER_COLS := '';  FHTML_OTD_NUM := ''; FHTML_OTD_NAMES := '';
  FHTML_KOL_SUM_HEADER := ''; FHTML_MisalignedColumns := '';

//  if not odsMo.Active then odsMo.Open;
  if odsGroupMo.Active then
  begin
    i := 0;
    if odsGroupMo.RecordCount > 0 then // ::OTD_NUM::
    begin
      SetLength(FKolAndSummFieldsName, odsGroupMo.RecordCount*2);
      FHTML_OTD_NUM := '<td colspan='+IntToStr(odsGroupMo.RecordCount*2)+' class=xl2513794 style=''border-left:none''>������/������������ ���������</td>'#13#10;
      FHTML_OTD_NAMES := '<tr height=29 style=''mso-height-source:userset;height:21.75pt''>'#13#10;
    end;

    odsGroupMo.First;
    while not odsGroupMo.Eof do  // ������� �������� �� ���������� ����� ��, ������� ����������� � �������
    begin
      FKolAndSummFieldsName[i]   := 'V#FN_K' + IntToStr(odsGroupMoGROUPID.AsInteger);
      FKolAndSummFieldsName[i+1] := 'V#FN_S' + IntToStr(odsGroupMoGROUPID.AsInteger);
      Inc(i, 2);
{      sCase := sCase + 'CASE WHEN MOFROMID = :MOID AND MOTOID = ' + IntToStr(odsMo.FieldByName('MOID').AsInteger) +
        ' AND FP_VID = 3 AND FP_VIDMOVE IN (4,5,6,7) AND FD_DATA BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) + 1 - 1/(24*60*60)' +
        ' THEN C.FN_KOL ELSE 0 END AS "V#FN_K' + IntToStr(odsMo.FieldByName('MOID').AsInteger) + '", ' +
        'CASE WHEN MOFROMID = :MOID AND MOTOID = ' + IntToStr(odsMo.FieldByName('MOID').AsInteger) +
        ' AND FP_VID = 3 AND FP_VIDMOVE IN (4,5,6,7) AND FD_DATA BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) + 1 - 1/(24*60*60)' +
        ' THEN C.FN_SUMM ELSE 0 END AS "V#FN_S' + IntToStr(odsMo.FieldByName('MOID').AsInteger) + '", ';}
      sCase := sCase+'CASE WHEN D.fk_mogroupid_from = :MOGROUP_ID AND D.fk_mogroupid_to = '+IntToStr(odsGroupMo.FieldByName('groupid').AsInteger)+' AND D.mnoj<0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL ELSE 0 END AS "V#FN_K' + IntToStr(odsGroupMoGROUPID.AsInteger) + '", ' +
                     'CASE WHEN D.fk_mogroupid_from = :MOGROUP_ID AND D.fk_mogroupid_to = '+IntToStr(odsGroupMo.FieldByName('groupid').AsInteger)+' AND D.mnoj<0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL*K.FN_PRICE ELSE 0 END AS "V#FN_S' + IntToStr(odsGroupMoGROUPID.AsInteger) + '", ';


      sSumm := sSumm + 'SUM(A."V#FN_K' + IntToStr(odsGroupMoGROUPID.AsInteger)+'") AS "V#FN_K' + IntToStr(odsGroupMoGROUPID.AsInteger) + '", '+
                       'SUM(A."V#FN_S' + IntToStr(odsGroupMoGROUPID.AsInteger)+'") AS "V#FN_S' + IntToStr(odsGroupMoGROUPID.AsInteger) + '", ';

      sCaseAndSum := sCaseAndSum+#13#10'SUM(CASE WHEN D.fk_mogroupid_from = :MOGROUP_ID AND D.fk_mogroupid_to = '+IntToStr(odsGroupMo.FieldByName('groupid').AsInteger)+' AND D.mnoj<0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL  ELSE 0 END) AS "V#FN_K' + IntToStr(odsGroupMoGROUPID.AsInteger) + '", '+
                                 #13#10'SUM(CASE WHEN D.fk_mogroupid_from = :MOGROUP_ID AND D.fk_mogroupid_to = '+IntToStr(odsGroupMo.FieldByName('groupid').AsInteger)+' AND D.mnoj<0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL*K.FN_PRICE ELSE 0 END) AS "V#FN_S' + IntToStr(odsGroupMoGROUPID.AsInteger) + '", ';

      FHTML_Cols := FHTML_Cols +   // ::COLS::
                    '  <col width=45 style=''mso-width-source:userset;mso-width-alt:1645;width:34pt''>'#13#10+
                    '  <col width=90 style=''mso-width-source:userset;mso-width-alt:3291;width:68pt''>'#13#10;
      FHTML_HEADER_COLS := FHTML_HEADER_COLS + // ::HEADER_COLS::
                           '  <td class=xl1513794></td>'#13#10+
                           '  <td class=xl1513794></td>'#13#10;
      // OTD_NAMES
      FHTML_OTD_NAMES := FHTML_OTD_NAMES + '<td colspan=2 class=xl2613794 width=135 style=''border-left:none;width:102pt''>'+odsGroupMoFC_GROUP.AsString+'</td>'#13#10;
      FHTML_KOL_SUM_HEADER := FHTML_KOL_SUM_HEADER + // ::KOL_SUM_HEADER::
                             '  <td class=xl2613794 style=''border-top:none;border-left:none''>���-��:</td>'#13#10+
                             '  <td class=xl2613794 style=''border-top:none;border-left:none''>�����:</td>'#13#10;

       FHTML_MisalignedColumns := FHTML_MisalignedColumns + // ::MisalignedColumns::
                                  '  <td width=45 style=''width:34pt''></td>'#13#10+
                                  '  <td width=90 style=''width:68pt''></td>'#13#10;
      odsGroupMo.Next;
    end;
    if FHTML_OTD_NAMES <> '' then  FHTML_OTD_NAMES := FHTML_OTD_NAMES + '</tr>'#13#10;
  end;
  if FHTML_OTD_NAMES = '' then  FHTML_OTD_NAMES := '<tr height=29 style=''mso-height-source:userset;height:21.75pt''>'#13#10 + '</tr>'#13#10; //Added by Neronov A.S. 07.04.2011
  //��� �� ������ ��� � � �������� + ������ �� ������� ��
  StrHolder1.MacroByName('sCase').Value:= sCase;
  StrHolder1.MacroByName('sSumm').Value:= sSumm;
  StrHolder1.MacroByName('sCaseAndSum').Value:= sCaseAndSum;

  Result := StrHolder1.ExpandMacros;
// ���� ���� ����� ������� � StrHolder1
//SELECT USED_MEDICS.*, OST_BY_MEDICS.*
//FROM
//(SELECT DISTINCT M.medicid, M.fc_name as FC_MEDICNAME, E.fc_name as FC_EDIZM
// FROM
//     MED.tdocs D, MED.TDPC C, MED.TKART K, MED.TMEDIC M, MED.TEI E
//    WHERE 
//      D.DPID = C.DPID 
//      AND C.KARTID = K.KARTID 
//      AND K.MEDICID = M.MEDICID 
//      AND K.FL_DEL = 0 
//      AND M.EIID = E.EIID(+)       
//      AND M.FK_TYPE = :TMEDICTYPE ) USED_MEDICS,
//
//(
//SELECT
//	K.MEDICID,
//
//    SUM(CASE WHEN TRUNC(D.FD_DATA) < TRUNC(:DATE1) THEN C.FN_KOL*D.mnoj ELSE 0 END) AS VFN_KOLOSTBEGIN,
//    SUM(CASE WHEN TRUNC(D.FD_DATA) < TRUNC(:DATE1) THEN C.FN_KOL*K.FN_PRICE *D.Mnoj ELSE 0 END) AS VFN_SUMOSTBEGIN,
//
//    SUM(CASE WHEN D.mnoj>0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL ELSE 0 END) AS VFN_KOLPRIH,
//    SUM(CASE WHEN D.mnoj>0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL*K.FN_PRICE ELSE 0 END) AS VFN_SUMPRIH,
//    %sCaseAndSum
//    SUM(CASE WHEN D.mnoj<0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL ELSE 0 END) AS VFN_KOLRASH,
//    SUM(CASE WHEN D.mnoj<0 AND TRUNC(D.FD_DATA) BETWEEN TRUNC(:DATE1) AND TRUNC(:DATE2) THEN C.FN_KOL*K.FN_PRICE ELSE 0 END) AS VFN_SUMRASH
//    FROM (SELECT TDOCS.*, 
//             MED.PKG_PRIHRASH.Get_PrihRashPriznak( TDOCS.FP_VID, TDOCS.FP_VIDMOVE,
//                                                   TDOCS.fk_mogroupid_from,
//                                                   TDOCS.fk_mogroupid_to,
//                                                   :MOGROUP_ID ) as mnoj             
//      FROM MED.TDOCS 
//      WHERE TDOCS.FL_EDIT = 0
//        AND TRUNC(TDOCS.FD_DATA) BETWEEN TO_DATE('01.01.2000', 'DD.MM.YYYY') AND TRUNC(:DATE2)
//        AND :MOGROUP_ID in (TDOCS.FK_MOGROUPID_TO, TDOCS.FK_MOGROUPID_FROM)
//      ) D,
//    
//     MED.TDPC C, MED.TKART K
//    WHERE D.DPID = C.DPID 
//      AND C.KARTID = K.KARTID 
//    GROUP BY K.MEDICID
//) OST_BY_MEDICS
//
//WHERE
//  USED_MEDICS.medicid = OST_BY_MEDICS.medicid
//ORDER BY LOWER(USED_MEDICS.FC_MEDICNAME)
end;

procedure TfrmMain.CreateColumns;
var I : Integer;
    Column : TcxGridDBBandedColumn;

  function CanAddColumn(pFieldName: String; ods: TOracleDataset): Boolean;
  var Sum: Double;
  begin
    // ���� ����� �� ������� ���������� �� ���� �� True
    Result := False;
    Sum := 0;
    if not (Ods.Active or (ods.FieldByName(pFieldName) is TIntegerField) or
      (ods.FieldByName(pFieldName) is TFloatField)) then exit;
    ods.First;
    While not ods.Eof do
    begin
      Sum := Sum + ods.FieldByName(pFieldName).AsFloat;
      ods.Next;
    end;
    Result := Sum <> 0;
  end;
begin
  cxGr.BeginUpdate;
  cxGrDBBandedTableView.DataController.Summary.OnAfterSummary := nil;
// ����� ��� ���������� �������� ����� ��������� ChildBand ��� Band[5] - ������ ��. � ���� �� ������� �� ���������� :(  !!! ������� �.�. 16.07.2007
  cxGrDBBandedTableView.ClearItems; //�������� �������

  cxGrDBBandedTableView.DataController.Summary.FooterSummaryItems.Clear; //�������� �������
{ NSV 22.12.2006 ��-�� ���� ����� ��������� ������ ��������� � ��������������� 14-�� �������� � ������ 126 : cxGrDBBandedTableView.Bands[14].Caption := Format('�� ������ � %s �� %s',
	For I := cxGrDBBandedTableView.Bands.Items[5].ChildBandCount -1 downto 0 do // �������� ��������� ��������� ������
		cxGrDBBandedTableView.Bands.Items[5].ChildBands[I].Destroy;	}
  // ������� ������ ��� ������
  For I := 0 to odsOborot.FieldCount -1 do
  begin
//    if odsOborot.Fields[I] is TFloatField then
//      TFloatField(odsOborot.Fields[I]).Precision := 2;
//    if odsOborot.Fields[I] is TFloatField then
//      TFloatField(odsOborot.Fields[I]).currency := true;

    if (Copy(odsOborot.Fields[I].FieldName,1,1) = 'V') then
    begin
      if Pos('#FN_S',odsOborot.Fields[I].FieldName) > 0 then //��� ��������� ������ � V#FN_K123 ����.
        Continue;  // ���� ������� ��������� ������, ����� ���� - ������� � ����� ��� ����� ���� 

      Column := cxGrDBBandedTableView.CreateColumn;
      Column.DataBinding.FieldName := odsOborot.Fields[I].FieldName;
      Column.Caption := '';
      Column.HeaderAlignmentHorz := taCenter;

      if (Pos('FN_K',odsOborot.Fields[I].FieldName) > 0)  then //���-�� �������� � float ��� ������� � ������ � ������������ �� ������ (PropertiesClass)
      begin
        Column.Caption := '���-��:';
        Column.PropertiesClass := TcxSpinEditProperties;
        TcxSpinEditProperties(Column.Properties).Alignment.Horz := taCenter;
        Column.Options.Filtering := False;
        Column.Options.Sorting := False;        
        Column.MinWidth := 45;
        Column.Options.HorzSizing := True;
      end
      else if Pos('FN_S',odsOborot.Fields[I].FieldName) > 0 then //����� ��������� � SpinEdit (DisplayFormat)
      begin
        Column.Caption := '�����:';
        Column.PropertiesClass := TcxSpinEditProperties;
        TcxSpinEditProperties(Column.Properties).DisplayFormat := ',0.00;-,0.00';
        TcxSpinEditProperties(Column.Properties).Alignment.Horz := taRightJustify;
        Column.Summary.FooterKind := skSum;
        Column.Summary.FooterFormat := ',0.## �''.'';-,0.## �''.''';
        Column.Summary.GroupFooterKind := skSum;
        Column.Summary.GroupFooterFormat := ',0.## �''.''';
        Column.Styles.Footer := cxStyle1;
        Column.Options.Filtering := False;
        Column.Options.Sorting := False;
        Column.MinWidth := 65;
        Column.Options.HorzSizing := True;
      end;

      if odsOborot.Fields[I].FieldName = 'VFN_ROWNUM' then
      begin
        Column.Position.BandIndex := 0;
        Column.Caption := '';
        Column.PropertiesClass := TcxSpinEditProperties;
        TcxSpinEditProperties(Column.Properties).Alignment.Horz := taCenter;        
      end
      else if odsOborot.Fields[I].FieldName = 'VFC_LONGNAME' then
      begin
        Column.Position.BandIndex := 1;
        Column.Options.Filtering := True;
      end
      else if odsOborot.Fields[I].FieldName = 'VFC_EDIZM' then
      begin
        Column.Position.BandIndex := 2;
        Column.Options.Filtering := True;
        Column.PropertiesClass := TcxTextEditProperties;
        TcxTextEditProperties(Column.Properties).Alignment.Horz := taCenter;
      end  
      else if odsOborot.Fields[I].FieldName = 'VFC_FINSOURCE' then
      begin
        Column.Position.BandIndex := 3;
        Column.Options.Filtering := True;
        Column.PropertiesClass := TcxTextEditProperties;
        TcxTextEditProperties(Column.Properties).Alignment.Horz := taCenter;
      end            
      else if odsOborot.Fields[I].FieldName = 'VFC_FARMGR' then
      begin
        Column.Position.BandIndex := 4;
        Column.Options.Filtering := True;
        Column.PropertiesClass := TcxTextEditProperties;
      end
      else if odsOborot.Fields[I].FieldName = 'VFN_KOLOSTBEGIN' then
        Column.Position.BandIndex := 5
      else if odsOborot.Fields[I].FieldName = 'VFN_SUMOSTBEGIN' then
        Column.Position.BandIndex := 5
      else if odsOborot.Fields[I].FieldName = 'VFN_KOLPRIH' then
        Column.Position.BandIndex := 6
      else if odsOborot.Fields[I].FieldName = 'VFN_SUMPRIH' then
        Column.Position.BandIndex := 6
//------------------------------------------------------------------------------
      //������� ���� ��������� �� ��
      else if Pos('#FN_K',odsOborot.Fields[I].FieldName) > 0 then
      begin
//        if CanAddColumn(odsOborot.Fields[I].FieldName,odsOborot) or
//          CanAddColumn(StringReplace(odsOborot.Fields[I].FieldName,'K','S',[]),odsOborot)
//        then
        begin
          with cxGrDBBandedTableView.Bands.Add do //��������� �����
          begin
            Position.BandIndex := 7;
            // V#FN_K123 - for instance
            odsGroupMo.Locate('groupid',StrToInt(Copy(odsOborot.Fields[I].FieldName,7,length(odsOborot.Fields[I].FieldName))),[]);
            Caption := odsGroupMo.FieldByName('FC_GROUP').AsString; //��� ��
//            Options.HoldOwnColumnsOnly := True;
            Column.Position.BandIndex := Index;

            Column := cxGrDBBandedTableView.CreateColumn; // ����� ��� ��������� ������� � ������. ������� � ����������� ��������� ������� ��� �������� - ��. ��� ������� ���.
            Column.HeaderAlignmentHorz := taCenter;
            Column.MinWidth := 65;
            Column.Caption := '�����:';
            Column.DataBinding.FieldName := StringReplace(odsOborot.Fields[I].FieldName,'K','S',[]);
//            Column.DataBinding.ValueTypeClass := TcxCurrencyValueType;
            Column.Position.BandIndex := Index;


            Column.Options.Filtering := False;
            Column.Options.Sorting := False;
            Column.Options.HorzSizing := True;

            Column.PropertiesClass := TcxCurrencyEditProperties;
            TcxCurrencyEditProperties(Column.Properties).DisplayFormat := ',0.00;-,0.00';
            TcxCurrencyEditProperties(Column.Properties).Alignment.Horz := taRightJustify;
            Column.Summary.FooterKind := skSum;
            Column.Summary.FooterFormat := ',0.## �''.'';-,0.## �''.''';
            Column.Summary.GroupFooterKind := skSum;
            Column.Summary.GroupFooterFormat := '0.00 �.';
            Column.Styles.Footer := cxStyle1;            
          end;
        end
//        else
//          Column.Free;  
      end
//------------------------------------------------------------------------------
      else if odsOborot.Fields[I].FieldName = 'VFN_KOLSPIS' then
        Column.Position.BandIndex := 8
      else if odsOborot.Fields[I].FieldName = 'VFN_SUMSPIS' then
        Column.Position.BandIndex := 8
      else if odsOborot.Fields[I].FieldName = 'VFN_KOLOSTEND' then
        Column.Position.BandIndex := 9
      else if odsOborot.Fields[I].FieldName = 'VFN_SUMOSTEND' then
        Column.Position.BandIndex := 9
      else if odsOborot.Fields[I].FieldName = 'VFC_PAYTYPE' then
      begin
        Column.Position.BandIndex := 10;
        Column.Hidden := True;
//        cxGrDBBandedTableView.ApplyBestFit(Column);
      end
      else if odsOborot.Fields[I].FieldName = 'VFN_KOLRASH' then
        Column.Position.BandIndex := 16
      else if odsOborot.Fields[I].FieldName = 'VFN_PRICE' then
      begin
        Column.Position.BandIndex := 16;
        Column.Caption := '��. ����:';
        Column.PropertiesClass := TcxCurrencyEditProperties;
        TcxCurrencyEditProperties(Column.Properties).DisplayFormat := ',0.00;-,0.00';
        TcxCurrencyEditProperties(Column.Properties).Alignment.Horz := taRightJustify;
        Column.Options.Filtering := False;
        Column.Options.Sorting := False;
        Column.MinWidth := 65;
        Column.Options.HorzSizing := True;
      end
      else if odsOborot.Fields[I].FieldName = 'VFN_SUMRASH' then
        Column.Position.BandIndex := 16;
    end;
  end;
  cxGrDBBandedTableView.DataController.Summary.OnAfterSummary := cxGrDBBandedTableViewDataControllerSummaryAfterSummary;
  cxGr.EndUpdate;
  cxGrDBBandedTableView.Bands[1].ApplyBestFit; //��� ����� �� ����� � ������� ������ "������������"
end;

procedure TfrmMain.SetDate1(const Value: TDateTime);
begin
  FDate1 := Value;
  if (Value > NullDate) and (cxGrDBBandedTableView.Bands.Count > 0) then
    cxGrDBBandedTableView.Bands[5].Caption := '������� �� ������ ������� ';// + FormatDateTime('dd.mm.yyyy',FDate1);
end;

procedure TfrmMain.SetDate2(const Value: TDateTime);
begin
  FDate2 := Value;
  if (Value > NullDate) and (cxGrDBBandedTableView.Bands.Count > 0) then
    cxGrDBBandedTableView.Bands[9].Caption := '������� �� ����� ������� ';// + FormatDateTime('dd.mm.yyyy',FDate2);
end;

procedure TfrmMain.odsOborotAfterScroll(DataSet: TDataSet);
begin
  acExpExcel.Enabled := not DataSet.IsEmpty;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  acFilterExecute(nil);
end;

procedure TfrmMain.cxGrDBBandedTableViewDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
var I: Integer;
begin
  For I := 0 to ASender.FooterSummaryItems.Count -1 do
    Case ASender.FooterSummaryItems.Items[I].Kind of
      skSum     : ASender.FooterSummaryItems.Items[I].Format := ',0.## �''.'';-,0.## �''.''';
      skMin     : ASender.FooterSummaryItems.Items[I].Format := '���: ,0.## �''.'';-,0.## �''.''';
      skMax     : ASender.FooterSummaryItems.Items[I].Format := '����: ,0.## �''.'';-,0.## �''.''';
      skCount   : ASender.FooterSummaryItems.Items[I].Format := '���-��: ,0.#;-,0.#';
      skAverage : ASender.FooterSummaryItems.Items[I].Format := '�����.: ,0.#;-,0.#';
      skNone    : ASender.FooterSummaryItems.Items[I].Destroy;
    end;
end;

procedure TfrmMain.cxGrDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if ((AViewInfo.Properties is TcxSpinEditProperties) or (AViewInfo.Properties is TcxCurrencyEditProperties))
  and (AViewInfo.Value < 0) then
  begin
    ACanvas.Brush.Color := clRed;
    bAlarm := True;
  end
  else if not AViewInfo.Selected then ACanvas.Brush.Color := clWindow;
end;

procedure TfrmMain.SetAlarm(bAlarm: Boolean);
begin
  if bAlarm then
  begin
    sb.Panels[1].Text := '��������. ������ ������ �������� ������������� ���������� ���� �����!';
    TdxStatusBarTextPanelStyle(sb.Panels[1].PanelStyle).ImageIndex := 5;
  end
  else
  begin
    sb.Panels[1].Text := '';
    TdxStatusBarTextPanelStyle(sb.Panels[1].PanelStyle).ImageIndex := -1;
  end;
end;

function TfrmMain.GetAlarm(ods: TOracleDataSet): Boolean;
var I : Integer;
    BMark : TBookMark;
begin
  //���� ������������� ����� �� �������� �����, ���-�� 
  Result := False;
  cxGr.BeginUpdate;
  BMark := ods.GetBookmark;
  try
  ods.First;
  While not ods.Eof do
  begin
    For I := 0 to ods.FieldCount -1 do
    begin
      if Copy(ods.Fields[I].FieldName,1,1) = 'V' then
      begin
        if (Pos('FN_K',ods.Fields[I].FieldName) > 0) or
          (Pos('FN_S',ods.Fields[I].FieldName) > 0)
        then
          if ods.Fields[I].AsFloat < 0 then
          begin
            Result := True;
            Exit;
          end;
      end;
    end;
    ods.Next;
  end;
  finally
    ods.GotoBookmark(BMark);
    cxGr.EndUpdate;
  end;
end;

function TfrmMain.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
Result := False;
  try
    // TODo �������� ������ ��������  Command
    if Data = -1 then
      HtmlHelp(0, PChar('StMedsestra.chm'), HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, PChar('StMedsestra.chm'), HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('������� �� �������');
  end;
end;

end.
