unit fProdCurrentItemEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, Db, OracleData, ComCtrls, ToolWin, dxCntner,
  dxEditor, dxExEdtr, dxEdLib, Oracle;

type
  TfrmProdCurrentItemEdit = class(TForm)
    Label4: TLabel;
    edMedic: TcxButtonEdit;
    laEdIzm: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    laEdIzm2: TLabel;
    deAmount_FOR1: TdxSpinEdit;
    deAmount: TdxSpinEdit;
    oqMedic: TOracleQuery;
    procedure FormShow(Sender: TObject);
    procedure edMedicClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure deAmount_FOR1Change(Sender: TObject);
  private   { Private declarations }
    FKARTID: integer; // KARTID таблицы tkart
    procedure SetPartyID( aKARTID : Integer );

  public     { Public declarations }
    TMEDICOMPLEX_FK_MEDICITEM:integer; //id ингридиента

    TKARTCO_ITEM_FK_ID: integer; // FK_ID таблицы TKARTCO_ITEM
    TKARTCOMPOS_FK_ID : integer;
    bIns:boolean; // true - добавляем запись.  false - редактируем запись.
    ostatok: double;   //сколько фасовочных единиц продукта, т.е. сколько таблеток, а не коробок

    property KARTID : Integer read FKARTID write SetPartyID;
  end;

Procedure DoShowProdCurrentItemEdit(TMEDICOMPLEX_FK_MEDICITEM:integer; TKARTCO_ITEM_FK_ID:integer = -1);

var
	frmProdCurrentItemEdit: TfrmProdCurrentItemEdit;

implementation

uses fdmMain, fMedKardLst, fMedProduceEdit, fKartsLst;

{$R *.DFM}

Procedure DoShowProdCurrentItemEdit(TMEDICOMPLEX_FK_MEDICITEM:integer; TKARTCO_ITEM_FK_ID:integer = -1);
begin
  Application.CreateForm(TfrmProdCurrentItemEdit, frmProdCurrentItemEdit);

  frmProdCurrentItemEdit.TKARTCOMPOS_FK_ID := frmMedProduceEdit.TKARTCOMPOS_FK_ID;
  frmProdCurrentItemEdit.TMEDICOMPLEX_FK_MEDICITEM:=TMEDICOMPLEX_FK_MEDICITEM;
  {if TMEDICOMPLEX_FK_MEDICITEM<>-1 then
          Begin
                  frmProdCurrentItemEdit.deAmount_FOR1.text:=frmMedProduceEdit.odsObazat_Ingridienti.FieldByName('FN_AMOUNT_FOR1').AsString;
                  frmProdCurrentItemEdit.deAmount.text:=frmMedProduceEdit.odsObazat_Ingridienti.FieldByName('FN_AMOUNT').AsString;
          end;}

  frmProdCurrentItemEdit.TKARTCO_ITEM_FK_ID:=TKARTCO_ITEM_FK_ID;

  if frmProdCurrentItemEdit.showmodal = mrOk then
  Begin
    frmMedProduceEdit.odsMedKartItem.Close;
    frmMedProduceEdit.odsMedKartItem.Open;
    frmMedProduceEdit.TB_save.Enabled := True;
  end;

  FreeAndNil(frmProdCurrentItemEdit);
end;

procedure TfrmProdCurrentItemEdit.FormShow(Sender: TObject);
var
// sFilter:string;
 nMedicID:integer;
// bFiltered:boolean;
 OSTpoKART:double;
 sFilter : string;
//	i:integer;
begin
  label1.Caption:='Кол-во на '+FloatToStr(frmMedProduceEdit.ideMainAmount)+' порций';

  if frmProdCurrentItemEdit.TKARTCO_ITEM_FK_ID=-1 then
  begin {Добавляем новую запись}
    frmProdCurrentItemEdit.bIns:=true;

    if TMEDICOMPLEX_FK_MEDICITEM<>-1 then
    begin
      nMedicID:=TMEDICOMPLEX_FK_MEDICITEM;
      sFilter := 'medicid = '+IntToStr(nMedicID);
//      bFiltered:=true;
    end
    else
    begin
      nMedicID:=0;
      sFilter := '';
//      bFiltered:=false;
    end;
    nMedicID:=TMEDICOMPLEX_FK_MEDICITEM;
    kartid := DoShowMedKardLst(nMedicID, 0, 0,False,False,'',False,sFilter,true, True);
    if (kartid < 1) and (edMedic.Text <> '') then Close; //Exit; end;

    // разобраться почему такая ахинея. !!!!
    deAmount_FOR1.MaxValue:=  (round(1000*ostatok / frmMedProduceEdit.ideMainAmount)) /1000;
    frmProdCurrentItemEdit.deAmount.value:=frmProdCurrentItemEdit.deAmount_For1.value * frmMedProduceEdit.ideMainAmount;
  end
  else
  begin  {редактируем выбранную}
    frmProdCurrentItemEdit.bIns:=false;
    frmProdCurrentItemEdit.KARTID:=frmMedProduceEdit.odsMedKartItem.FieldByName('FK_KART_ITEM').AsInteger;
//    frmProdCurrentItemEdit.edMedic.text := frmMedProduceEdit.odsMedKartItem.FieldByName('TKART_NAME').AsString;
//    frmProdCurrentItemEdit.laEdIzm.caption:=frmMedProduceEdit.odsMedKartItem.FieldByName('FC_UEDIZM').AsString;
//    laEdIzm2.caption:=laEdIzm.caption;
    OSTpoKART:=dmMain.PKGTKARTCOITEM.GETOSTATOKBYKARTID(frmProdCurrentItemEdit.KARTID);
    deAmount_FOR1.MaxValue := (round(1000*OSTpoKART / frmMedProduceEdit.ideMainAmount)) /1000;
    frmProdCurrentItemEdit.deAmount_FOR1.value:=frmMedProduceEdit.odsMedKartItem.FieldByName('FN_AMOUNT_FOR1').AsFloat;
    frmProdCurrentItemEdit.deAmount.value:=frmMedProduceEdit.odsMedKartItem.FieldByName('FN_AMOUNT').AsFloat;
  end;
end;

procedure TfrmProdCurrentItemEdit.edMedicClick(Sender: TObject);
var
  sFilter:string;
  nMedicID:integer;
//  bFiltered:boolean;
begin
  if TMEDICOMPLEX_FK_MEDICITEM<>-1 then
  begin
    nMedicID:=TMEDICOMPLEX_FK_MEDICITEM;
    sFilter := 'medicid = '+IntToStr(nMedicID);
//    bFiltered:=true;
  end
  else
  begin
    nMedicID:=0;
    sFilter := '';
//    bFiltered:=false;
  end;
  nMedicID:=TMEDICOMPLEX_FK_MEDICITEM;
  KARTID := DoShowMedKardLst(nMedicID, 0, 0,False,False,'',False,sFilter,true, True);


  if (kartid < 1) and (edMedic.Text <> '') then begin exit; end;
  deAmount_FOR1.MaxValue:= (round(1000*ostatok / frmMedProduceEdit.ideMainAmount)) /1000;
end;

procedure TfrmProdCurrentItemEdit.ToolButton1Click(Sender: TObject);
begin
  ModalResult := mrcancel;
end;

procedure TfrmProdCurrentItemEdit.ToolButton2Click(Sender: TObject);
var
 res:integer;
 OSTpoKART:DOUBLE;
begin
  if edMedic.Text = '' then
  begin
    MessageBox(Self.Handle, PChar('Необходимо выбрать карточку медикамента!'), 'Ошибка', MB_OK + mb_iconerror);
    edMedic.SetFocus;
    exit;
  end;
  if laEdIzm.caption = '' then
  begin
    MessageBox(Self.Handle, PChar('Необходимо заполнить поля единиц измерений у объекта учета данного препарата!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;
  if deAmount.Value <= 0 then
  begin
    MessageBox(Self.Handle, PChar('Необходимо ввести кол-во ингридиента!'), 'Ошибка', MB_OK + mb_iconerror);
    deAmount.SetFocus;
    exit;
  end;

  OSTpoKART:=dmMain.PKGTKARTCOITEM.GETOSTATOKBYKARTID(frmProdCurrentItemEdit.KARTID);
  if (deAmount.VALUE>OSTpoKART) then
  Begin // на остатке данной карточки(ингридиента) нет нужного нам кол-ва для frmMedProduceEdit.deMainAmount.value
    MessageBox(Self.Handle, PChar('Ингридиента на остатке '+ floattostr(OSTpoKART) + ', а вам для необходимо ' +floattostr(deAmount.VALUE) + ' Совет: уменьшите кол-во на 1 порцию этого ингридиента и добавьте другую карточку этого же объекта учета, у которой укажите недостающее кол-во!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;

  if frmProdCurrentItemEdit.bIns then
  Begin
    res:=round( dmMain.PKGTKARTCOITEM.ADDTKARTCOITEM( frmProdCurrentItemEdit.TKARTCOMPOS_FK_ID,
                                                      deAmount.value,
                                                      deAmount_for1.value,
                                                      frmProdCurrentItemEdit.KARTID) );
    if res=-1 then
    Begin
      MessageBox(Self.Handle, PChar('Выбранная карточка медикамента уже есть в списке "Текущие ингридиенты". Вы можете редактировать или удалить данную карточку медикаментов в этом списке!'), 'Ошибка', MB_OK + mb_iconerror);
      exit;
    end;
  end
  else
    dmMain.PKGTKARTCOITEM.EDITTKARTCOITEM( TKARTCO_ITEM_FK_ID,
					   frmProdCurrentItemEdit.KARTID,
					   deAmount.value,
					   deAmount_for1.value);
ModalResult := mrok;
end;

procedure TfrmProdCurrentItemEdit.deAmount_FOR1Change(Sender: TObject);
begin
//frmProdCurrentItemEdit.deAmount.value:=frmProdCurrentItemEdit.deAmount_For1.value * frmMedProduceEdit.ideMainAmount;
frmProdCurrentItemEdit.deAmount.value:=frmProdCurrentItemEdit.deAmount_For1.value * frmMedProduceEdit.ideMainAmount;
end;

procedure TfrmProdCurrentItemEdit.SetPartyID( aKARTID : Integer );
begin
  FKARTID := aKARTID;
  oqMedic.SetVariable('PARTYID', aKARTID);
  oqMedic.Execute;

  if oqMedic.Eof then
  begin
    edMedic.Text     := '';
    laEdIzm.Caption  := '';
    laEdIzm2.Caption := '';
  end
  else
  begin
    edMedic.Text     := oqMedic.FieldAsString('FC_MED_NAME');
    laEdIzm.Caption  := oqMedic.FieldAsString('FC_EI_NAME');
    laEdIzm2.Caption := laEdIzm.caption;
  end;
end;

end.


