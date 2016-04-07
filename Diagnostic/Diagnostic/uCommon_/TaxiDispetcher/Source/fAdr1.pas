unit fAdr1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxLabel, cxTextEdit,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, ExtCtrls, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, OracleData,
  cxPC, cxGroupBox, cxSplitter, cxMaskEdit, Oracle, jvDBUtils;

type
  TfrmAdr1 = class(TForm)
    odsAdr: TOracleDataSet;
    dsAdr: TDataSource;
    Shape1: TShape;
    cxLabel1: TcxLabel;
    teAdr: TcxTextEdit;
    grAdr: TcxGrid;
    TVADR: TcxGridDBTableView;
    VADR_NAME: TcxGridDBColumn;
    VADR_PREFIX: TcxGridDBColumn;
    grAdrLevel1: TcxGridLevel;
    Shape2: TShape;
    cxButton39: TcxButton;
    cxButton40: TcxButton;
    cxButton51: TcxButton;
    cxButton52: TcxButton;
    cxButton53: TcxButton;
    cxButton54: TcxButton;
    cxButton55: TcxButton;
    cxButton56: TcxButton;
    cxButton57: TcxButton;
    cxButton58: TcxButton;
    cxButton33: TcxButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton6: TcxButton;
    cxButton5: TcxButton;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    cxButton10: TcxButton;
    cxButton11: TcxButton;
    cxButton12: TcxButton;
    cxButton13: TcxButton;
    cxButton14: TcxButton;
    cxButton15: TcxButton;
    cxButton16: TcxButton;
    cxButton17: TcxButton;
    cxButton18: TcxButton;
    cxButton19: TcxButton;
    cxButton20: TcxButton;
    cxButton21: TcxButton;
    cxButton22: TcxButton;
    cxButton23: TcxButton;
    cxButton35: TcxButton;
    cxButton24: TcxButton;
    cxButton25: TcxButton;
    cxButton26: TcxButton;
    cxButton27: TcxButton;
    cxButton28: TcxButton;
    cxButton29: TcxButton;
    cxButton32: TcxButton;
    cxButton31: TcxButton;
    cxButton30: TcxButton;
    cxButton37: TcxButton;
    cxButton38: TcxButton;
    cxButton34: TcxButton;
    Shape3: TShape;
    cxButton41: TcxButton;
    cxButton42: TcxButton;
    cxButton43: TcxButton;
    cxButton44: TcxButton;
    cxButton45: TcxButton;
    cxButton46: TcxButton;
    cxButton47: TcxButton;
    cxButton48: TcxButton;
    cxButton49: TcxButton;
    cxButton50: TcxButton;
    cxButton60: TcxButton;
    cxButton36: TcxButton;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    bEnter: TcxButton;
    cxButton71: TcxButton;
    bHome: TcxButton;
    cxButton73: TcxButton;
    odsRaionByStreet: TOracleDataSet;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton50Click(Sender: TObject);
    procedure TVADRCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxButton70Click(Sender: TObject);
    procedure cxButton36Click(Sender: TObject);
    procedure cxButton59Click(Sender: TObject);
    procedure cxButton34Click(Sender: TObject);
    procedure bOKClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure TVADRGetCellHeight(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
    procedure cxButton35Click(Sender: TObject);
    procedure bHomeClick(Sender: TObject);
    procedure cxButton73Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    isDownSlash : Boolean;
    { Private declarations }
  public
    isHome : Boolean; // домашний ли адрес
    isHand : Boolean; // рисовали ли что-нибудь ручкой
    sStreet, sHouse : String; // Улица, дом, подъезд
    sStreet1 : String; // Улица после слэша
    pCost : Integer;
    procedure DoShowForm();
    { Public declarations }
  end;

var
  frmAdr1: TfrmAdr1;

implementation

uses uMain;

{$R *.dfm}

procedure TfrmAdr1.cxButton1Click(Sender: TObject);
begin
  if isDownSlash then
    begin
      sStreet1 := sStreet1 + TcxButton(Sender).Caption;
      odsAdr.Filter := 'fc_name_up = '+ '''*' + sStreet1 + '*''';
      odsAdr.Filtered := True;
      teAdr.Text := sStreet+'/'+sStreet1+' '+sHouse;
    end else
    begin
      sStreet := sStreet + TcxButton(Sender).Caption;
      odsAdr.Filter := 'fc_name_up = '+ '''*' + sStreet + '*''';
      odsAdr.Filtered := True;
      teAdr.Text := sStreet+' '+sHouse;
    end;
end;

procedure TfrmAdr1.cxButton36Click(Sender: TObject);
begin
  sHouse := '';
  if isDownSlash then
    teAdr.Text := sStreet+'/'+sStreet1+' '+sHouse
  else
    teAdr.Text := sStreet+' '+sHouse;
end;

procedure TfrmAdr1.cxButton50Click(Sender: TObject);
begin
  sHouse := sHouse + TcxButton(Sender).Caption;
  if isDownSlash then
    teAdr.Text := sStreet+'/'+sStreet1+' '+sHouse
  else
    teAdr.Text := sStreet+' '+sHouse;
end;

procedure TfrmAdr1.cxButton34Click(Sender: TObject);
begin
  sStreet := '';
  sStreet1 := '';
  teAdr.Text := sStreet+' '+sHouse;
  teAdr.Tag := 0;
  odsAdr.Filtered := False;
  bEnter.Enabled := False;
  cxButton35.Enabled := False;
  isDownSlash := False;
end;

procedure TfrmAdr1.cxButton35Click(Sender: TObject);
begin
  teAdr.Text := sStreet+'/'+' '+sHouse;
  isDownSlash := True;
  odsAdr.Filtered := False;
end;

procedure TfrmAdr1.cxButton70Click(Sender: TObject);
begin
  if isDownSlash then
    teAdr.Text := sStreet+'/'+sStreet1+' '+sHouse
  else
    teAdr.Text := sStreet+' '+sHouse;
end;

procedure TfrmAdr1.bHomeClick(Sender: TObject);
begin
  isHome := True;
end;

procedure TfrmAdr1.cxButton73Click(Sender: TObject);
begin
  if isDownSlash then
    begin
      if teAdr.Text[Length(trim(teAdr.Text))] = '/' then
        begin
          copy(teAdr.Text, 1, Length(teAdr.Text)-1);
          teAdr.Text := sStreet+' '+sHouse;
          isDownSlash := False;
        end else
        begin
          sStreet1 := copy(sStreet1, 1, Length(sStreet1)-1);
          teAdr.Text := sStreet+'/'+sStreet1+' '+sHouse;
          odsAdr.Filter := 'fc_name_up = '+ '''*' + sStreet1 + '*''';
          odsAdr.Filtered := True;
        end;
    end else
    begin
      sStreet := copy(sStreet, 1, Length(sStreet)-1);
      odsAdr.Filter := 'fc_name_up = '+ '''*' + sStreet + '*''';
      odsAdr.Filtered := True;
      teAdr.Text := sStreet+' '+sHouse;
    end;
end;

procedure TfrmAdr1.DoShowForm();
begin

end;

procedure TfrmAdr1.bOKClick(Sender: TObject);
var sRes : string;
    vType:Integer;
    vRaion : Variant;
begin
  if sStreet1 <> '' then
    sRes := sStreet+'/'+sStreet1 //-- строка адреса
  else
    sRes := odsAdr.FieldByName('fc_prefix').AsString+' '+sStreet;
  if sHouse = '' then
    sHouse := '1';
  if sHouse <> '' then
    sRes := sRes + ' д. '+sHouse;
  vType := odsAdr.FieldByName('fl_type').AsInteger;
  if (vType=1) then
  begin
    with odsRaionByStreet do
    begin
      //:PSTREET, :PHOUSE
      SetVariable('PSTREET',odsAdr.FieldByName('fk_id').AsInteger);
      SetVariable('PHOUSE',sHouse);
      Close;
      Open;
      vRaion := FieldByName('fk_raion').AsVariant;
      Close;
    end;
  end
  else begin
    vRaion := odsAdr.FieldByName('fk_raionid').AsVariant;
  end;
  //ShowMessage(VarToStr(vRaion));
  if (vRaion<>null) then
  begin
    frmMain.SelectedRaionTimerCnt := 0;
    frmMain.SelectedRaion := vRaion;
    frmMain.tmrSelectCurrentPanelTimer(self);
    frmMain.tmrSelectCurrentPanel.Enabled := true;
  end;
  close;
end;

procedure TfrmAdr1.bCancelClick(Sender: TObject);
begin
  close;
//  ModalResult := mrCancel;
end;

procedure TfrmAdr1.cxButton59Click(Sender: TObject);
begin
  if isDownSlash then
    teAdr.Text := sStreet+'/'+sStreet1+' '+sHouse
  else
    teAdr.Text := sStreet+' '+sHouse;
end;

procedure TfrmAdr1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmAdr1.FormCreate(Sender: TObject);
begin
  teAdr.Tag := 0;
  pCost := 0;
  bEnter.Enabled := False;
  isHand := False;
  isDownSlash := False;
  isHome := False;
  odsAdr.Close;
  odsAdr.Open;
end;

procedure TfrmAdr1.TVADRCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if isDownSlash then
    begin
      sStreet1 := odsAdr.FieldByName('fc_name_up').AsString;
      teAdr.Text := sStreet+'/'+sStreet1+' '+sHouse;
      teAdr.Tag := odsAdr.FieldByName('fk_id').AsInteger;
      bEnter.Enabled := True;
      odsAdr.Filtered := False;
      cxButton35.Enabled := True;
    end else
    begin
      sStreet := odsAdr.FieldByName('fc_name_up').AsString;
      teAdr.Text := odsAdr.FieldByName('fc_name_up').AsString+' '+sHouse;
      teAdr.Tag := odsAdr.FieldByName('fk_id').AsInteger;
      pCost := odsAdr.FieldByName('fn_cost').AsInteger; // надбавка за стоянку
      if (odsAdr.FieldByName('fl_type').AsInteger = 2) or (odsAdr.FieldByName('fl_type').AsInteger = 3) then
        cxButton35.Enabled := False
      else
        cxButton35.Enabled := True;
      bEnter.Enabled := True;
    end;
end;

procedure TfrmAdr1.TVADRGetCellHeight(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
begin
  AHeight := 25;
end;

end.
