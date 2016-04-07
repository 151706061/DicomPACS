// $Id: fKartsLst.pas,v 1.4 2007/06/04 06:43:05 delphi5 Exp $
//
unit fKartsLst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Oracle, JvFormPlacement, ActnList, Grids,
  Db, OracleData, PKGMEDKART, JvDBUtils, ExtCtrls,
  Menus, StdCtrls, DBGrids, FR_DSet, FR_DBSet, FR_Class, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxTextEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxControls, cxGridCustomView, cxClasses, cxGridLevel, cxGrid;

type
  TfrmKartsLst = class(TForm)
    al: TActionList;
    acClose: TAction;
    acRefresh: TAction;
    CoolBar1: TCoolBar;
		ToolBar1: TToolBar;
    ToolButton7: TToolButton;
    ToolButton6: TToolButton;
    ToolButton3: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    acSelect: TAction;
    Splitter1: TSplitter;
    paMedKart: TPanel;
    paOst: TPanel;
    StaticText1: TStaticText;
    cbShowNulls: TCheckBox;
    odsMedKart: TOracleDataSet;
    dsMedKart: TDataSource;
    odsMedKartKARTID: TFloatField;
    odsMedKartFC_SERIAL: TStringField;
    odsMedKartFD_GODEN: TDateTimeField;
    odsMedKartFC_UEDIZM: TStringField;
    odsMedKartFN_KOL: TFloatField;
    odsMedKartM: TFloatField;
    odsMedKartD: TDateTimeField;
    odsMedKartFC_MEDIC: TStringField;
    odsMedKartFC_NAME: TStringField;
    odsMedKartMEDICID: TFloatField;
    odsMedKartFC_MONAME: TStringField;
    odsMedKartFC_EANCODE: TStringField;
    odsMedKartFK_MEDICTYPENAME: TFloatField;
    odsMedKartFC_MEDICTYPENAME: TStringField;
    odsMedKartFK_PAYTYPE: TFloatField;
    odsMedKartFC_PAYTYPE: TStringField;
    odsMedKartFN_FPACKINUPACK: TFloatField;
    odsMedKartFK_FPACKID: TFloatField;
    odsMedKartFC_FEDIZM: TStringField;
    odsMedKartFN_KOLOST: TFloatField;
		odsMedKartFN_PRICE: TFloatField;
    dbg: TcxGrid;
    dbgLevel1: TcxGridLevel;
    dbgDBTableView1: TcxGridDBTableView;
    dbgDBTableView1FC_NAME1: TcxGridDBColumn;
    dbgDBTableView1FC_EANCODE1: TcxGridDBColumn;
    dbgDBTableView1FC_SERIAL1: TcxGridDBColumn;
    dbgDBTableView1FD_GODEN1: TcxGridDBColumn;
    dbgDBTableView1FC_UEDIZM1: TcxGridDBColumn;
    dbgDBTableView1FC_MEDICTYPENAME1: TcxGridDBColumn;
    dbgDBTableView1FC_PAYTYPE1: TcxGridDBColumn;
    dbgDBTableView1FC_MEDIC1: TcxGridDBColumn;
    dbgDBTableView1FC_MONAME1: TcxGridDBColumn;
    dbgDBTableView1FN_FPACKINUPACK1: TcxGridDBColumn;
    dbgDBTableView1FC_FEDIZM1: TcxGridDBColumn;
    dbgDBTableView1KARTID1: TcxGridDBColumn;
    procedure acCloseExecute(Sender: TObject);
    procedure acSelectExecute(Sender: TObject);
    procedure odsMedKartAfterOpen(DataSet: TDataSet);
		procedure FormCreate(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure odsMedKartAfterScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
//    procedure dbgCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
//      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
//			ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
//      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
//      var ADone: Boolean);
    procedure dbgDblClick(Sender: TObject);
//    procedure dbgFilterChanged(Sender: TObject; ADataSet: TDataSet;
//      const AFilterText: String);
    procedure frKartGetValue(const ParName: String; var ParValue: Variant);
    procedure cbShowNullsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cxGrid1DBTableView1DataControllerFilterChanged(
      Sender: TObject);
  private
    FbReturn : Boolean;
		FWhereAddition: String;

    FGROUPRestriction: string;
    FSelectRestriction: string;
//    FWhereAddition: string;
    FWhereConstraint: string;
    FWHERErestriction: string;
    FFromRestriction: string;
		FHintRestriction: string;
		FQBERestriction: string;
    FOrderRestriction: string;
		{ Private declarations }
		procedure SetOstatok;

    procedure SetbReturn(const Value: Boolean);

  public
		{ Public declarations }
    nID: integer;
		nMOID: Integer;
		ostatok: double;   //сколько упаковочных единиц продукта, т.е. сколько не таблеток, а коробок

		bEditKardOper: Boolean;
    nMedicId: Integer;

    property bReturn: Boolean read FbReturn write SetbReturn;

    { Список атрибутов запроса}
    property HintRestriction: string read FHintRestriction write FHintRestriction;
    property SELECTrestriction: string read FSelectRestriction write FSelectRestriction;
    { Список таблиц запроса }
    property FROMrestriction: string read FFromRestriction write FFromRestriction;
		{ Условия отбора записей}
    property WHERErestriction: string read FWHERErestriction write FWHERErestriction;
    { Дополнительное условие отбора записей}
//    property WHEREaddition: string read FWhereAddition write FWhereAddition;
    { Альтернативное условие отбора записей}
    property WHEREconstraint: string read FWhereConstraint write FWhereConstraint;
    { Условия отбора записей по образцу}
    property QBErestriction: string read FQBERestriction write FQBERestriction;
		{ Условие обединения}
    property GROUPrestriction: string read FGROUPRestriction write FGROUPRestriction;
    { Условие сортировки}
		property ORDERrestriction: string read FOrderRestriction write FOrderRestriction;

    function RefreshSQLText(pAddComments: Boolean = False): string;

  end;

function DoShowKartsLst(var nMedicID: Integer; pID: integer = -1; pMOID: integer = 0;
  bFiltered: Boolean = FALSE; PbReturn: Boolean = False; pWhereAdition: String = '';
  bEditKardOper: Boolean = False; pFilter: String = ''): integer;


var
	frmKartsLst: TfrmKartsLst;

implementation

uses fmainform, fMedKardEdit, fdmMain, fPrihEdit, fMoveEdit, fgetperiod,
  fMedProduceEdit{, fProdCurrentItemEdit};


{$R *.DFM}

function DoShowKartsLst(var nMedicID: Integer; pID: integer = -1; pMOID: integer = 0;
	bFiltered: Boolean = FALSE; PbReturn: Boolean = False; pWhereAdition: String = '';
	bEditKardOper: Boolean = False; pFilter: String = ''): integer;
var frmMedKard : TfrmKartsLst; //заводится отдельная переменная для модального режима дабы не было AccessViolation
begin
  if pMOID = 0 then pMOID := Round(dmMain.pkgMedSes.GETCURMO);
  if pID = -1 then
  begin
    frmMain.CreateChild(TfrmKartsLst, frmKartsLst);
    frmKartsLst.bEditKardOper := bEditKardOper;

    frmKartsLst.nID := pID;
    frmKartsLst.nMOID := pMOID;
    frmKartsLst.bReturn := PbReturn;
    frmKartsLst.FWhereAddition := PWHEREADITION;

    frmKartsLst.acRefreshExecute(nil);
    nMedicID := frmKartsLst.odsMedKart.FieldByName('MEDICID').AsInteger;
    result := pID;
  end
  else
  begin
    frmMedKard := TfrmKartsLst.Create(Application);
    try
      frmMedKard.nMedicId := nMedicId;
      frmMedKard.bEditKardOper := bEditKardOper;

      frmMedKard.nID := pID;
      frmMedKard.nMOID := pMOID;
      frmMedKard.bReturn := PbReturn;
      frmMedKard.FWhereAddition := PWHEREADITION;

      frmMedKard.acRefresh.Execute;

      if pFilter <> '' then  frmMedKard.dbgDBTableView1.DataController.Filter.Root.AddItem(frmMedKard.dbgDBTableView1FC_MEDIC1, foEqual, pFilter, pFilter  );

      if pID <> 0 then
      begin
        frmKartsLst.odsMedKart.AfterScroll := nil;
        frmKartsLst.odsMedKart.locate('KARTID', pID, []);
        frmKartsLst.odsMedKart.AfterScroll := frmMedKard.odsMedKartAfterScroll;
      end
      else
      begin
        frmKartsLst.odsMedKart.AfterScroll := nil;
        frmKartsLst.odsMedKart.locate('MEDICID', nMedicID, []);
        frmKartsLst.odsMedKart.AfterScroll := frmMedKard.odsMedKartAfterScroll;
      end;
      if bFiltered then
      begin
        frmKartsLst.odsMedKart.Filter := 'MEDICID=' + IntToStr(nMedicID);
        frmKartsLst.odsMedKart.Filtered := True;
      end;
      frmMedKard.dbgDBTableView1.ApplyBestFit(nil);
      if frmMedKard.ShowModal = mrOK then
      begin
        nMedicID := frmKartsLst.odsMedKart.FieldByName('MEDICID').AsInteger;
        result := frmMedKard.nID
      end
      else begin
        nMedicID := -1;
        result := -1;
      end;
    finally
      FreeAndNil(frmMedKard);
    end;
  end;
end;
{********************************************************************************************************}
{        TfrmKartsLst.acCloseExecute
{********************************************************************************************************}

procedure TfrmKartsLst.acCloseExecute(Sender: TObject);
begin
  nID := -1;
  ModalResult := mrCancel;
  close;
end;

{********************************************************************************************************}
{        TfrmKartsLst.acSelectExecute
{********************************************************************************************************}

procedure TfrmKartsLst.acSelectExecute(Sender: TObject);
var ost : Double;
begin
	ost := frmKartsLst.odsMedKart.FieldByName('FN_KOLOST').AsFloat;
{	if not frmKartsLst.odsMedKart.FieldByName('FN_FPACKINUPACK').IsNull then
		ostatok:=ost * frmKartsLst.odsMedKart.FieldByName('FN_FPACKINUPACK').AsFloat
	else ostatok:=ost;}
	ostatok:=ost;

	nID := frmKartsLst.odsMedKart.FieldByName('KARTID').AsInteger;
	ModalResult := mrOk;
end;

{********************************************************************************************************}
{        TfrmKartsLst.odsListAfterOpen
{********************************************************************************************************}

procedure TfrmKartsLst.odsMedKartAfterOpen(DataSet: TDataSet);
begin
	acSelect.Enabled := (frmKartsLst.odsMedKart.RecordCount <> 0) and (FormStyle = fsNormal);
end;

{********************************************************************************************************}
{        TfrmKartsLst.FormCreate
{********************************************************************************************************}

procedure TfrmKartsLst.FormCreate(Sender: TObject);
begin

	FSelectRestriction := 'KARTID, FC_SERIAL, TRUNC(FD_GODEN) AS FD_GODEN, ' +
		'FC_UEDIZM, 1 AS FN_KOL, MOID AS M, TRUNC(SYSDATE + 1) AS D, ' +
		'FC_MEDIC, FC_NAME, MEDICID, FC_MONAME, FC_EANCODE, FK_MEDICTYPENAME, ' +
		'FC_MEDICTYPENAME, FK_PAYTYPE, FC_PAYTYPE, FN_FPACKINUPACK, FK_FPACKID, ' +
		'FC_FEDIZM, FN_KOLOST, FN_PRICE, FN_SUMM';
	FFromRestriction := 'VMEDKART_VS_OST';
	FWhereRestriction := FWhereRestriction + '1=1 AND FN_KOLOST > 0'; // 1=1 в секции where что то участвует

	if FWhereAddition <> '' then
		FWHERErestriction := FWHERErestriction + FWhereAddition;
	FOrderRestriction := 'FC_NAME';

	frmKartsLst.odsMedKart.DeleteVariables;
	frmKartsLst.odsMedKart.Sql.Text := RefreshSQLText;

	frmKartsLst.odsMedKart.AfterScroll := odsMedKartAfterScroll;
	frmKartsLst.odsMedKart.AfterOpen := odsMedKartAfterOpen;
end;

{********************************************************************************************************}
{        TfrmKartsLst.acEditExecute
{********************************************************************************************************}

procedure TfrmKartsLst.acRefreshExecute(Sender: TObject);

begin
	frmKartsLst.odsMedKart.AfterScroll := nil;
	frmKartsLst.odsMedKart.Close;
	frmKartsLst.odsMedKart.Open;  
	frmKartsLst.odsMedKart.AfterScroll := odsMedKartAfterScroll;
	odsMedKartAfterScroll(frmKartsLst.odsMedKart);
//	dbgDBTableView1.ApplyBestFit(nil);
end;

{********************************************************************************************************}
{        TfrmKartsLst.FormClose
{********************************************************************************************************}

procedure TfrmKartsLst.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then begin
    Action := caFree;
	end;
  frmMain.tbOst.ImageIndex := 51;
end;

{********************************************************************************************************}
{        TfrmKartsLst.odsListAfterScroll
{********************************************************************************************************}

procedure TfrmKartsLst.odsMedKartAfterScroll(DataSet: TDataSet);
begin
	SetOstatok;
end;

{****************************************************************************************}
{                                 TfrmKartsLst.FormDestroy
{****************************************************************************************}

procedure TfrmKartsLst.FormDestroy(Sender: TObject);
begin
{  if true or bEditKardOper then //#todo2 Переделать на олкальные датасеты, чтобы не мерцало
	begin
		frmKartsLst.odsMedKart.AfterScroll := nil;
		frmKartsLst.odsMedKart.AfterOpen := nil;
  end;}
end;

{****************************************************************************************}
{                                 TfrmKartsLst.odsMedKartBeforeOpen
{****************************************************************************************}

procedure TfrmKartsLst.SetOstatok;
var ost, lastNewPrice : Double;
begin
	ost := frmKartsLst.odsMedKart.FieldByName('FN_KOLOST').AsFloat;
	lastNewPrice := frmKartsLst.odsMedKart.FieldByName('FN_PRICE').AsFloat;
	if not frmKartsLst.odsMedKart.FieldByName('FN_FPACKINUPACK').IsNull then
		StaticText1.Caption := Format(' Остаток медикамента: %g (%g), цена: %.2fр.', [ost,
			ost * frmKartsLst.odsMedKart.FieldByName('FN_FPACKINUPACK').AsFloat,lastNewPrice])
	else
		StaticText1.Caption := Format(' Остаток медикамента: %g, цена: %.2fр.', [ost,lastNewPrice]);
{  if not frmKartsLst.odsMedKart.FieldByName('FN_FPACKINUPACK').IsNull then
    StaticText1.Caption := Format(' Остаток медикамента: %.0f (%.0f), цена: %.2fр.', [ost,
      ost * frmKartsLst.odsMedKart.FieldByName('FN_FPACKINUPACK').AsFloat,lastNewPrice])
  else
    StaticText1.Caption := Format(' Остаток медикамента: %.f, цена: %.2fр.', [ost,lastNewPrice]);}
end;

//procedure TfrmKartsLst.dbgCustomDrawCell(Sender: TObject;
//  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
//  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
//  var AText: String; var AColor: TColor; AFont: TFont;
//  var AAlignment: TAlignment; var ADone: Boolean);
//begin
//  if (ANode.Index mod 2 = 0) then AColor := $00ACE1F0
//  else AColor := $00E4E4E4;
//end;

procedure TfrmKartsLst.dbgDblClick(Sender: TObject);
begin
	if acSelect.Enabled then acSelect.Execute;
end;

//procedure TfrmKartsLst.dbgFilterChanged(Sender: TObject;
//	ADataSet: TDataSet; const AFilterText: String);
//begin
//	acSelect.Enabled := TdxdbGrid(Sender).Count <> 0;
//end;

procedure TfrmKartsLst.frKartGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName = 'var_ost' then
		ParValue := dmMain.pkgMedKart.GetOst(frmKartsLst.odsMedKart.FieldByName('KARTID').AsInteger,ServerDate(dmMain.Os){,
      dmMain.pkgMedSes.GetCurmo})
  else if ParName = 'var_price' then
    ParValue := dmMain.pkgMedKart.GETPRICE(frmKartsLst.odsMedKart.FieldByName('KARTID').AsInteger);
//     ParValue := frmKartsLst.odsMedKart.FieldByName('FN_PRICE').AsFloat * frmKartsLst.odsMedKart.FieldByName('KOLOST').AsFloat;
end;

function TfrmKartsLst.RefreshSQLText(pAddComments: Boolean = False): string;
begin
  Result := '';
  //
  if SelectRestriction <> '' then
    begin
      Result := Result + 'SELECT ';
      if FHintRestriction <> '' then Result := Result + FHintRestriction + ' ';
      Result := Result + SelectRestriction;
    end;
  //
  if FromRestriction <> '' then Result := Result+' FROM '+FromRestriction;
  //
  if WhereConstraint <> '' then
    begin
			Result := Result + ' WHERE ';
      if pAddComments then Result := Result + '/* WhereConstraint */ ';
      Result := Result + WhereConstraint;
    end
  else
    begin
      if WhereRestriction <> '' then begin
        Result := Result + ' WHERE ';
        if pAddComments then Result := Result + '/* WhereRestriction */ ';
        Result := Result + WhereRestriction;
//        if WhereAddition <> '' then
//          begin
//            Result := Result + ' AND ';
//            if pAddComments then Result := Result + '/* WhereAddition */ ';
//            Result := Result + WhereAddition;
//          end;
      end;
    end;
  //
  if QBERestriction <> '' then begin
    if Pos(' WHERE ', Result) > 0 then
      begin
				Result := Result + ' AND ';
        if pAddComments then Result := Result + '/* QBERestriction */ ';
        Result := Result + QBERestriction;
      end
    else
      begin
        Result := Result + ' WHERE ';
        if pAddComments then Result := Result + '/* QBERestriction */ ';
        Result := Result + QBERestriction;
      end;
  end;
  //
  if GROUPRestriction <> '' then Result := Result+' GROUP BY '+GROUPRestriction;
  //
  if OrderRestriction <> '' then Result := Result+' ORDER BY '+OrderRestriction;
end;

procedure TfrmKartsLst.SetbReturn(const Value: Boolean);
begin
  FbReturn := Value;
  if Value then
  begin
		frmKartsLst.odsMedKart.DeleteVariables;
//1 AS FN_PRICE, убрал из запроса
    FSelectRestriction := 'DISTINCT V.KARTID, FC_SERIAL, TRUNC(FD_GODEN) AS FD_GODEN, ' +
      'FC_UEDIZM, 1 AS FN_KOL, MOID AS M, TRUNC(SYSDATE + 1) AS D, ' +
      'FC_MEDIC, FC_NAME, MEDICID, FC_MONAME, FC_EANCODE, FK_MEDICTYPENAME, ' +
      'FC_MEDICTYPENAME, FK_PAYTYPE, FC_PAYTYPE, FN_FPACKINUPACK, FK_FPACKID, ' +
      'FC_FEDIZM, V.FN_KOLOST, V.FN_PRICE, V.FN_SUMM';

    FFromRestriction := 'MED.VMEDKART_VS_OST V, MED.TDOCS, MED.TDPC';
    FWhereRestriction :=
      'V.KARTID = TDPC.KARTID AND TDOCS.DPID = TDPC.DPID ' +
      'AND TDOCS.FP_VID = 3 AND TDOCS.FP_VIDMOVE IN (5,7) AND TDOCS.MOTOID = :MOID ' +
//      'AND TDOCS.FD_DATA BETWEEN PKG_MEDSES.GET_DATA1 AND PKG_MEDSES.GET_DATA2 ' +
			'AND FN_KOLOST > 0 ' + FWhereAddition;
{    FFromRestriction := 'VMEDKART_VS_OST V, TDOCS, TDPC';
		FWhereRestriction :=
			'V.KARTID = TDPC.KARTID AND TDOCS.DPID = TDPC.DPID ' +
			'AND TDOCS.FP_VID = 3 AND TDOCS.FP_VIDMOVE = 5 AND TDOCS.MOTOID = :MOID ' +
//      'AND TDOCS.FD_DATA BETWEEN PKG_MEDSES.GET_DATA1 AND PKG_MEDSES.GET_DATA2 ' +
			'AND FN_KOLOST > 0 ' + FWhereAddition;}
		FOrderRestriction := 'FC_NAME';

    frmKartsLst.odsMedKart.Sql.Text := RefreshSQLText;

    frmKartsLst.odsMedKart.DeclareVariable('MOID', otInteger);
    frmKartsLst.odsMedKart.SetVariable('MOID', nMOID);
  end;
end;

procedure TfrmKartsLst.cbShowNullsClick(Sender: TObject);
begin
  if TCheckBox(Sender).Checked then
  begin
    FWhereRestriction := StringReplace(FWhereRestriction,' AND FN_KOLOST > 0','',[]);
    frmKartsLst.odsMedKart.Sql.Text := RefreshSQLText;
    acRefreshExecute(nil);
  end
  else
  begin
    if FWhereRestriction = '' then FWhereRestriction := '1=1';
    FWhereRestriction := FWhereRestriction + ' AND FN_KOLOST > 0';
    frmKartsLst.odsMedKart.Sql.Text := RefreshSQLText;
    acRefreshExecute(nil);
  end;
  dbg.SetFocus;
end;

procedure TfrmKartsLst.FormActivate(Sender: TObject);
//var
// i:integer;
begin
{i:=round( dmMain.PKGTKARTCOMPOS.GETRESTCOUNTOFITEM(frmMedProduceEdit.TKARTCOMPOS_FK_ID,
																									 frmMedProduceEdit.TMEDIC_MEDICID,
																									 frmProdCurrentItemEdit.TMEDICOMPLEX_FK_MEDICITEM,
																									 frmProdCurrentItemEdit.KARTID,
																									 frmMedProduceEdit.deMainAmount.value,
																									 frmProdCurrentItemEdit.deAmount_FOR1.value));
if i<>-987654 then laNugnoe_Kolvo.caption:='Необходимо выбрать данного медикамента '+inttostr(i)+ ' единиц(ы)'
else               laNugnoe_Kolvo.caption:='Вы выбрали всё необходимое кол-во данного ингридиента.';}
end;

procedure TfrmKartsLst.cxGrid1DBTableView1DataControllerFilterChanged(
  Sender: TObject);
begin
	acSelect.Enabled := dbgDBTableView1.DataController.RecordCount <> 0;
end;

end.


