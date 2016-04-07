unit fNazParamRegist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxBar, ImgList, ActnList, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  Oracle, OracleData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxSpinEdit, cxTimeEdit, cxDropDownEdit, cxCalendar, cxContainer,
  cxTextEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  StdCtrls, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  dxSkinsdxBarPainter, cxMaskEdit, cxCheckBox, dxSkinOffice2007Green,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmNazParamRegist = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    alOkCancel: TActionList;
    acOk: TAction;
    acCancel: TAction;
    bbSave: TdxBarButton;
    bbCancel: TdxBarButton;
    Panel2: TPanel;
    dsKab: TDataSource;
    odsKab: TOracleDataSet;
    Label3: TLabel;
    cxteTime: TcxTimeEdit;
    Label4: TLabel;
    cxlcRoom: TcxLookupComboBox;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    TVTIME: TcxGridDBTableView;
    VTIMENAZ: TcxGridDBColumn;
    VTIMEISSL: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    odsTime: TOracleDataSet;
    dsTime: TDataSource;
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
    Label1: TLabel;
    cbKonsult: TcxCheckBox;
    procedure odsKabBeforeOpen(DataSet: TDataSet);
    procedure acOkExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure cxlcRoomPropertiesChange(Sender: TObject);
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
    procedure FormCreate(Sender: TObject);
  private
    procedure DateChange;
    { Private declarations }
  public
    pSMID : Integer;
    pSOTR : Integer;
    procedure DoShowFormParam(nSMID, nSOTR, nKABID, nISPOLID : Integer);
    { Public declarations }
  end;

var
  frmNazParamRegist: TfrmNazParamRegist;

implementation
uses fMain, fNazRgOne1;
{$R *.dfm}

procedure TfrmNazParamRegist.DateChange;
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

procedure TfrmNazParamRegist.DoShowFormParam(nSMID, nSOTR, nKABID, nISPOLID: Integer);
var ods : TOracleDataSet;
begin
  pSMID := nSMID;
  pSOTR := nSOTR;
//------------------------------------------------------------------------------
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT SYSDATE, TRUNC(SYSDATE) AS DATESYS, GET_XRAY_RGKABINET1 FROM DUAL ';
    ods.Open;
    cxlcRoom.EditValue := ods.FieldByName('GET_XRAY_RGKABINET1').AsInteger;
    cxdeDate.Date := ods.FieldByName('DATESYS').AsDateTime;
    cxteTime.Time := ods.FieldByName('SYSDATE').AsDateTime; 
  finally
    ods.Free;
  end;
//------------------------------------------------------------------------------
  if odsKab.Active = FALSE then
    odsKab.Open;
//  cxlcRoom.EditValue := nKABID;
    
  odsTime.SetVariable('PFK_ROOMID', cxlcRoom.EditValue);
  odsTime.SetVariable('PFD_DATE', cxdeDate.Date);

  if odsTime.Active = FALSE
    then odsTime.Open;
end;

procedure TfrmNazParamRegist.FormCreate(Sender: TObject);
begin
//  if frmMain.get_def_konsult  = StrToInt('-1') then
//    begin
//
//    end;
end;

procedure TfrmNazParamRegist.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('PSOTR', pSOTR);
end;

procedure TfrmNazParamRegist.p1Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(cxdeDate.Date);
  if wd=1 then wd:=8;
  cxdeDate.Date:=cxdeDate.Date-wd+2;
end;

procedure TfrmNazParamRegist.p2Click(Sender: TObject);
var
 wd:integer;
begin
  wd:=dayofweek(cxdeDate.Date);
  if wd=1 then wd:=8;
  cxdeDate.Date:=cxdeDate.Date-wd+3;
end;

procedure TfrmNazParamRegist.p3Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(cxdeDate.Date);
  if wd=1 then wd:=8;
  cxdeDate.Date:=cxdeDate.Date-wd+4;
end;

procedure TfrmNazParamRegist.p4Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(cxdeDate.Date);
  if wd=1 then wd:=8;
  cxdeDate.Date:=cxdeDate.Date-wd+5;
end;

procedure TfrmNazParamRegist.p5Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(cxdeDate.Date);
  if wd=1 then wd:=8;
  cxdeDate.Date:=cxdeDate.Date-wd+6;
end;

procedure TfrmNazParamRegist.p6Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(cxdeDate.Date);
  if wd=1 then wd:=8;
  cxdeDate.Date:=cxdeDate.Date-wd+7;
end;

procedure TfrmNazParamRegist.p7Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(cxdeDate.Date);
  if wd=1 then wd:=8;
  cxdeDate.Date:=cxdeDate.Date-wd+8;
end;

procedure TfrmNazParamRegist.acOkExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  if (frmNazRg1.isNotKonsult = False) and (cbKonsult.Checked = True) then
    begin
      Application.MessageBox('В направлении присутствуют неконсультативные услуги! Нельзя добавить консультативную услугу в это направление!',
                             'Предупреждение', mb_iconwarning+mb_ok);
      exit;
    end;
// -- проверяем на дату распределения
  if frmMain.get_kolvo_raspred <> 0 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select sysdate + :pkolvo as farday from dual ';
        ods.DeclareAndSet('pkolvo', otInteger, frmMain.get_kolvo_raspred);
        ods.Open;
        if cxdeDate.Date > ods.FieldByName('farday').AsDateTime then
          begin
            MessageDlg('Внимание!'+#13+#10+
                       'Вы не можете распределить исследование на эту дату!'+#13+#10+
                       'Выберите дату меньше '+DateTimeToStr(ods.FieldByName('farday').AsDateTime)+'!', mtInformation, [mbOK], 0);
            exit;
          end;
      finally
        ods.Free;
      end;
    end;
  ModalResult := MrOK;
end;

procedure TfrmNazParamRegist.blMonClick(Sender: TObject);
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

procedure TfrmNazParamRegist.blWeeksClick(Sender: TObject);
begin
  cxdeDate.Date:=cxdeDate.Date-1;
end;

procedure TfrmNazParamRegist.brMonClick(Sender: TObject);
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

procedure TfrmNazParamRegist.brWeeksClick(Sender: TObject);
begin
  cxdeDate.Date:=cxdeDate.Date+1;
end;

procedure TfrmNazParamRegist.acCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;
                                                               
procedure TfrmNazParamRegist.cxdeDatePropertiesChange(Sender: TObject);
begin
  DateChange;
  odsTime.Close;
  odsTime.SetVariable('PFK_ROOMID', cxlcRoom.EditValue);
  odsTime.SetVariable('PFD_DATE', cxdeDate.Date);
  odsTime.Open;
end;

procedure TfrmNazParamRegist.cxlcRoomPropertiesChange(Sender: TObject);
begin
  odsTime.Close;
  odsTime.SetVariable('PFK_ROOMID', cxlcRoom.EditValue);
  odsTime.SetVariable('PFD_DATE', cxdeDate.Date);
  odsTime.Open;
end;

end.
