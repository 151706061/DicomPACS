unit fEditNaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxTimeEdit, StdCtrls, ExtCtrls, dxBar, cxGraphics,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DB,
  Oracle, OracleData, ActnList, ImgList, cxCalendar, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, jvDBUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter, cxLabel;

type
  TfrmEditNaz = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    bbOK: TdxBarButton;
    bbCancel: TdxBarButton;
    Panel1: TPanel;
    cxteTime: TcxTimeEdit;
    cxlcKabinet: TcxLookupComboBox;
    odsKabinet: TOracleDataSet;
    dsKabinet: TDataSource;
    IL: TImageList;
    al: TActionList;
    aOK: TAction;
    aCancel: TAction;
    Panel2: TPanel;
    TVTIME: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    VTIMENAZ: TcxGridDBColumn;
    VTIMEISSL: TcxGridDBColumn;
    dsTime: TDataSource;
    odsTime: TOracleDataSet;
    VFIO: TcxGridDBColumn;
    VNAMEISSL: TcxGridDBColumn;
    Panel3: TPanel;
    p1: TPanel;
    p2: TPanel;
    p3: TPanel;
    p4: TPanel;
    p5: TPanel;
    p6: TPanel;
    p7: TPanel;
    blWeeks: TButton;
    blMon: TButton;
    brWeeks: TButton;
    brMon: TButton;
    pMonth: TPanel;
    cxdeDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    odsLimits: TOracleDataSet;
    odsGetLimit: TOracleDataSet;
    odsNazInfo: TOracleDataSet;
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure odsKabinetBeforeOpen(DataSet: TDataSet);
    procedure cxlcKabinetPropertiesChange(Sender: TObject);
    procedure cxdeDatePropertiesChange(Sender: TObject);
    procedure blMonClick(Sender: TObject);
    procedure blWeeksClick(Sender: TObject);
    procedure brWeeksClick(Sender: TObject);
    procedure brMonClick(Sender: TObject);
    procedure p1Click(Sender: TObject);
    procedure p2Click(Sender: TObject);
    procedure p3Click(Sender: TObject);
    procedure p4Click(Sender: TObject);
    procedure p5Click(Sender: TObject);
    procedure p6Click(Sender: TObject);
    procedure p7Click(Sender: TObject);
  private           
    FLimit : integer;//лимит распределений в день  #29257 пункт 3
    FNeedLimit : boolean;
    procedure DateChange;
    function CheckLimit: boolean;
    { Private declarations }
  public
    pPACID : Integer;
    pSOTRID : Integer;
    pPEPLID : Integer;
    pVRACHFIO : String;
    pFD_RUN : TDate;
    pROOMID : Integer;
    procedure DoShowEditNaz(nPACID : Integer; nSOTRID: Integer; nPEPLID: Integer; sVRACHFIO: String; nFD_RUN: TDate; nROOMID : Integer; nSmid : integer = 0; nazid : integer = 0);
    { Public declarations }
  end;

var
  frmEditNaz: TfrmEditNaz;

implementation

uses fMain;

{$R *.dfm}

{ TfrmEditNaz }

procedure TfrmEditNaz.DateChange;
var
 yy,mm,dd:word;
 wd:integer;
begin
	pMonth.Caption:=FormatDateTime('mmmm',cxdeDate.Date)+', '+(FormatDateTime('dddd',cxdeDate.Date));

	wd:=dayofweek(cxdeDate.Date);
	if wd=1 then wd:=8;

	decodeDate(cxdeDate.Date-wd+2,yy,mm,dd);
	p1.Caption:=inttostr(dd);

	decodeDate(cxdeDate.Date-wd+3,yy,mm,dd);
	p2.Caption:=inttostr(dd);

	decodeDate(cxdeDate.Date-wd+4,yy,mm,dd);
	p3.Caption:=inttostr(dd);

	decodeDate(cxdeDate.Date-wd+5,yy,mm,dd);
	p4.Caption:=inttostr(dd);

	decodeDate(cxdeDate.Date-wd+6,yy,mm,dd);
	p5.Caption:=inttostr(dd);

	decodeDate(cxdeDate.Date-wd+7,yy,mm,dd);
	p6.Caption:=inttostr(dd);

  decodeDate(cxdeDate.Date-wd+8,yy,mm,dd);
  p7.Caption:=inttostr(dd);

  p1.Color:=clCream;
  p2.Color:=clCream;
  p3.Color:=clCream;
  p4.Color:=clCream;
  p5.Color:=clCream;
  p6.Color:=clCream;
  p7.Color:=clCream;
  case wd-1 of
    1:p1.Color:=clSkyBlue;
    2:p2.Color:=clSkyBlue;
    3:p3.Color:=clSkyBlue;
    4:p4.Color:=clSkyBlue;
    5:p5.Color:=clSkyBlue;
    6:p6.Color:=clSkyBlue;
    7:p7.Color:=clSkyBlue;
  end;
end;

procedure TfrmEditNaz.DoShowEditNaz(nPACID, nSOTRID, nPEPLID: Integer; sVRACHFIO: String; nFD_RUN: TDate; nROOMID : Integer; nSmid : integer = 0; nazid : integer = 0);
var ods : TOracleDataSet;
sLimit : string;
begin
  if nazid > 0 then
   begin
    odsNazInfo.Close;
    odsNazInfo.SetVariable('ppacid',nPacid);
    odsNazInfo.SetVariable('pnazid',nazid);
    odsNazInfo.SetVariable('psotrid',nsotrid);
    odsNazInfo.open;
    FNeedLimit :=  (odsNazInfo.FieldByName('IS_EXTRENNO').asinteger = 0)
     and (odsNazInfo.FieldByName('IS_ENDO').asinteger = 0)
     and (odsNazInfo.FieldByName('IS_STAC').asinteger = 1);
    odsNazInfo.close;
   end
  else
   begin
     FNeedLimit := false;
   end;
  if nsmid > 0 then  //Melnikov 2014.02.10 begin #29257
   begin
    odsgetlimit.SetVariable('psmid',nsmid);
    odsLimits.close;
    odslimits.SetVariable('psmid',nsmid);
    odsLimits.open;
    if odsLimits.RecordCount = 0 then
     FLimit := -1
    else
     begin
      sLimit := odsLimits.FieldByName('fc_value').AsString;
      if not TryStrToInt(sLimit, FLimit) then
       FLimit := -1;
     end;
    odsLimits.close;
   end
  else
   begin
     FLimit := -1;
   end; //Melnikov 2014.02.10 end #29257  pPACID := nPACID;
  pSOTRID := nSOTRID;
  pPEPLID := nPEPLID;
  pVRACHFIO := sVRACHFIO;
  pFD_RUN := nFD_RUN;
  pROOMID := nROOMID;
  if nsmid > 0 then
   begin
    odsKabinet.SetVariable('psmid',nsmid);
   end;
  if odsKabinet.Active = FALSE
    then odsKabinet.Open;
  cxlcKabinet.Properties.OnChange := nil;
  cxdeDate.Properties.OnChange := nil;
  cxlcKabinet.EditValue := pROOMID;
  odsKabinet.Locate('FK_ID', pROOMID, []);
  cxlcKabinet.Text := odsKabinet.FieldByName('FC_NAME').AsString;
  cxdeDate.Date := Trunc(pFD_RUN);
  cxlcKabinet.Properties.OnChange := cxlcKabinetPropertiesChange;
  cxdeDate.Properties.OnChange := cxdeDatePropertiesChange;
//-->>
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''HH24:MI'') AS TIMESYS FROM DUAL ';
    ods.Open;
    cxteTime.Text := ods.FieldByName('TIMESYS').AsString;
  finally
    ods.Free;
  end;
//<<--
  odsTime.SetVariable('PFK_ROOMID', cxlcKabinet.EditValue);
  odsTime.SetVariable('PFD_DATE', cxdeDate.Date);

  if odsTime.Active = FALSE
    then odsTime.Open;
  DateChange;
end;

function TfrmEditNaz.CheckLimit: boolean;
begin
  if FLimit < 1 then
   result :=  true
  else
   begin
    odsGetLimit.close;
    odsGetLimit.setvariable('pfk_roomid',cxlcKabinet.EditValue);
    odsGetLimit.setvariable('pfd_date',cxdeDate.Date);
    odsGetLimit.open;
    result := odsGetLimit.fieldbyname('cnt').asinteger < FLimit;
    odsGetLimit.close;
   end;
end;

procedure TfrmEditNaz.aOKExecute(Sender: TObject);
begin
  if CheckLimit then
   ModalResult := MrOk
  else
   begin
     application.MessageBox(pchar('Достигнут лимит ('+inttostr(FLimit)+') распределения в день, по данному назначению'),'Внимание',mb_iconwarning);
   end;
end;

procedure TfrmEditNaz.blMonClick(Sender: TObject);
var mm,yy,dd:word;
begin
  decodeDate(cxdeDate.Date,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=3) and (dd>28)) then dd:=28;
  if mm>1 then mm:=mm-1
   else
     begin
       mm:=12;
       yy:=yy-1;
     end;

  cxdeDate.Date:=encodeDate(yy,mm,dd);
end;

procedure TfrmEditNaz.blWeeksClick(Sender: TObject);
begin
  cxdeDate.Date:=cxdeDate.Date-1;
end;

procedure TfrmEditNaz.brMonClick(Sender: TObject);
var yy,mm,dd:word;
begin
  decodeDate(cxdeDate.Date,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=1) and (dd>28)) then dd:=28;
  if mm<12 then mm:=mm+1
   else
     begin
       mm:=1;
       yy:=yy+1;
     end;
  cxdeDate.Date:=encodeDate(yy,mm,dd);
end;

procedure TfrmEditNaz.brWeeksClick(Sender: TObject);
begin
  cxdeDate.Date:=cxdeDate.Date+1;
end;

procedure TfrmEditNaz.aCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmEditNaz.odsKabinetBeforeOpen(DataSet: TDataSet);
begin
  odsKabinet.SetVariable('pSOTR', pSOTRID);
end;

procedure TfrmEditNaz.p1Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(cxdeDate.Date);
  if wd=1 then wd:=8;
  cxdeDate.Date:=cxdeDate.Date-wd+2;
end;

procedure TfrmEditNaz.p2Click(Sender: TObject);
var
 wd:integer;
begin
  wd:=dayofweek(cxdeDate.Date);
  if wd=1 then wd:=8;
  cxdeDate.Date:=cxdeDate.Date-wd+3;
end;

procedure TfrmEditNaz.p3Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(cxdeDate.Date);
  if wd=1 then wd:=8;
  cxdeDate.Date:=cxdeDate.Date-wd+4;
end;

procedure TfrmEditNaz.p4Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(cxdeDate.Date);
  if wd=1 then wd:=8;
  cxdeDate.Date:=cxdeDate.Date-wd+5;
end;

procedure TfrmEditNaz.p5Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(cxdeDate.Date);
  if wd=1 then wd:=8;
  cxdeDate.Date:=cxdeDate.Date-wd+6;
end;

procedure TfrmEditNaz.p6Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(cxdeDate.Date);
  if wd=1 then wd:=8;
  cxdeDate.Date:=cxdeDate.Date-wd+7;
end;

procedure TfrmEditNaz.p7Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(cxdeDate.Date);
  if wd=1 then wd:=8;
  cxdeDate.Date:=cxdeDate.Date-wd+8;
end;

procedure TfrmEditNaz.cxdeDatePropertiesChange(Sender: TObject);
begin
  DateChange;
  odsTime.Close;
  odsTime.SetVariable('PFK_ROOMID', cxlcKabinet.EditValue);
  odsTime.SetVariable('PFD_DATE', cxdeDate.Date);
  odsTime.Open;
end;

procedure TfrmEditNaz.cxlcKabinetPropertiesChange(Sender: TObject);
begin
  odsTime.Close;
  odsTime.SetVariable('PFK_ROOMID', cxlcKabinet.EditValue);
  odsTime.SetVariable('PFD_DATE', cxdeDate.Date);
  odsTime.Open;
end;

end.
