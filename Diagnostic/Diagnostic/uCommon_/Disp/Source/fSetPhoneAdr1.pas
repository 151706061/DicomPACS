unit fSetPhoneAdr1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinCaramel, dxSkinCoffee, dxSkinOffice2007Green,
  Menus, cxLookAndFeelPainters, cxTextEdit, StdCtrls, cxButtons, cxMaskEdit,
  cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, Oracle, JvComponentBase,
  JvFormPlacement, ActnList, JvDbUtils;

type
  TfrmSetPhoneAdr1 = class(TForm)
    Panel2: TPanel;
    cxLabel2: TcxLabel;
    teAdr1: TcxTextEdit;
    cxLabel4: TcxLabel;
    teAdr2: TcxTextEdit;
    cxLabel3: TcxLabel;
    teDop: TcxTextEdit;
    paHouse: TPanel;
    cxLabel5: TcxLabel;
    teHouse: TcxTextEdit;
    cxLabel6: TcxLabel;
    teHall: TcxTextEdit;
    cxLabel7: TcxLabel;
    teHouseLiter: TcxTextEdit;
    Panel4: TPanel;
    bEnter: TcxButton;
    bCancel: TcxButton;
    al: TActionList;
    aCancel: TAction;
    aOk: TAction;
    aTab: TAction;
    jvFrmStor: TJvFormStorage;
    oqMergeDetail: TOracleQuery;
    oqInsert1: TOracleQuery;
    oqInsert2: TOracleQuery;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    meVvod: TcxMaskEdit;
    cxButton3: TcxButton;
    procedure cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure aCancelExecute(Sender: TObject);
    procedure aTabExecute(Sender: TObject);
    procedure teAdr1Click(Sender: TObject);
    procedure teAdr1Enter(Sender: TObject);
    procedure teAdr1Exit(Sender: TObject);
    procedure teAdr1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure aOkExecute(Sender: TObject);
    procedure teAdr1PropertiesChange(Sender: TObject);
    procedure teAdr2Click(Sender: TObject);
    procedure teAdr2Enter(Sender: TObject);
    procedure teAdr2Exit(Sender: TObject);
    procedure teAdr2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teAdr2PropertiesChange(Sender: TObject);
    procedure teDopClick(Sender: TObject);
    procedure teDopEnter(Sender: TObject);
    procedure teDopExit(Sender: TObject);
    procedure teDopKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teHouseClick(Sender: TObject);
    procedure teHouseEnter(Sender: TObject);
    procedure teHouseExit(Sender: TObject);
    procedure teHouseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure teHouseKeyPress(Sender: TObject; var Key: Char);
    procedure teHallClick(Sender: TObject);
    procedure teHallEnter(Sender: TObject);
    procedure teHallExit(Sender: TObject);
    procedure teHallKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teHouseLiterClick(Sender: TObject);
    procedure teHouseLiterEnter(Sender: TObject);
    procedure teHouseLiterExit(Sender: TObject);
    procedure teHouseLiterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure meVvodKeyPress(Sender: TObject; var Key: Char);
    procedure meVvodKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    pType : Integer; // 1 - улица(перекресток), 2 - организация(место), 3 - стоянка, 4 - межгород
    pCost : Integer; // стоимость платной стоянки
    sAddress : String; // адрес места                                         
    pRaion : Integer; // id района
    sPrefix : String;
    { Public declarations }
  end;

var
  frmSetPhoneAdr1: TfrmSetPhoneAdr1;

implementation
uses fMain, fSetStreet;
{$R *.dfm}

procedure TfrmSetPhoneAdr1.aCancelExecute(Sender: TObject);
begin
  close;
  if Assigned(frmSetStreet) then
    frmSetStreet.Close;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

procedure TfrmSetPhoneAdr1.aOkExecute(Sender: TObject);
var oq : TOracleQuery;
    id : Integer;
    sRes : string;
    sHouse, sHouseFraction : String; // дом, дробь номера дома
begin
//-- 1. Определяем номер дома и дробь
  if Pos('/', teHouse.Text) = 0 then
    begin
      sHouseFraction := '';
      sHouse := teHouse.Text;
    end else
    begin
      sHouseFraction := copy(teHouse.Text, Pos('/', teHouse.Text), Length(teHouse.Text)-Pos('/', teHouse.Text)+1);
      sHouse := copy(teHouse.Text, 1, Pos('/', teHouse.Text)-1);
    end;
//-- 2. Собираем адрес
  if teAdr2.Text <> '' then
    sRes := teAdr1.Text+'/'+teAdr2.Text
  else
    sRes := sPrefix +' '+ teAdr1.Text +' '+ sAddress;
  if sHouse <> '' then
    sRes := sRes + ' д. '+sHouse;
  if sHouseFraction <> '' then
    sRes := sRes+sHouseFraction;
  if teHouseLiter.Text <> '' then
    sRes := sRes + teHouseLiter.Text;
  if teHall.Text <> '' then
    sRes := sRes + ' п. '+teHall.Text;
// -- 3. Добавляем адрес и телефон
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    if pType = 1 then // улица, перекресток
      begin
        oq.SQL.Text := oqInsert1.SQL.Text;
        if meVvod.Text = '' then
          begin
            oq.DeclareAndSet('pfc_phone', otString, 'б/н');
            oq.DeclareAndSet('pfc_phone_full', otString, 'б/н');
          end else
          begin
            oq.DeclareAndSet('pfc_phone', otString, meVvod.Text);
            oq.DeclareAndSet('pfc_phone_full', otString, meVvod.Text);
          end;
        oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
        oq.DeclareAndSet('pfk_taxiid', otInteger, frmMain.pTaxiID);
        oq.DeclareAndSet('pfc_adr1', otString, sRes+' '+teDop.Text);
        oq.DeclareAndSet('pfk_adr1id', otInteger, teAdr1.Tag);
        oq.DeclareAndSet('pfk_adr2id', otInteger, teAdr2.Tag);
        if sHouse = '' then
          oq.DeclareAndSet('pfn_num', otInteger, -1)
        else
          oq.DeclareAndSet('pfn_num', otInteger, StrToInt(sHouse));
        oq.DeclareAndSet('pfn_stop', otInteger, pCost);
        oq.DeclareVariable('pfk_id', otInteger);
        oq.Execute;
      end else
      begin  // место, стоянка, межгород
        oq.SQL.Text := oqInsert2.SQL.Text;
        if meVvod.Text = '' then
          begin
            oq.DeclareAndSet('pfc_phone', otString, 'б/н');
            oq.DeclareAndSet('pfc_phone_full', otString, 'б/н');
          end else
          begin
            oq.DeclareAndSet('pfc_phone', otString, meVvod.Text);
            oq.DeclareAndSet('pfc_phone_full', otString, meVvod.Text);
          end;
        oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
        oq.DeclareAndSet('pfk_taxiid', otInteger, frmMain.pTaxiID);
        oq.DeclareAndSet('pfc_adr1', otString, sRes+' '+teDop.Text);
        oq.DeclareAndSet('pfk_adr1id', otInteger, teAdr1.Tag);
        oq.DeclareAndSet('pfn_stop', otInteger, pCost);
        oq.DeclareAndSet('pfk_raionid', otInteger, pRaion);
        oq.DeclareVariable('pfk_id', otInteger);
        oq.Execute;
      end;
//-- 4. Сохраняем детализированные данные по адресу
    oqMergeDetail.SetVariable('PFK_JURID', oq.GetVariable('pfk_id'));
    oqMergeDetail.SetVariable('PFC_ADR', sRes);
    oqMergeDetail.SetVariable('PFC_DOP', teDop.Text);
    oqMergeDetail.SetVariable('PFK_TYPE', pType);
    oqMergeDetail.SetVariable('PFC_STREET', teAdr1.Text);
    oqMergeDetail.SetVariable('PFC_STREET1', teAdr2.Text);
    if teAdr2.Text <> '' then
      oqMergeDetail.SetVariable('PFL_ISDOWNSLASH', 1)
    else
      oqMergeDetail.SetVariable('PFL_ISDOWNSLASH', 0);
    oqMergeDetail.SetVariable('PFK_IDADR1', teAdr1.Tag);
    if pType = 1 then
      begin
        oqMergeDetail.SetVariable('PFK_IDADR2', teAdr2.Tag);
        oqMergeDetail.SetVariable('PFC_HOUSEFRACTION', sHouseFraction);
      end else
      begin
        oqMergeDetail.SetVariable('PFK_IDADR2', 0);
        oqMergeDetail.SetVariable('PFC_HOUSEFRACTION', null);
      end;
    oqMergeDetail.SetVariable('PFC_HOUSE', sHouse);
    oqMergeDetail.SetVariable('PFC_HOUSELITER', teHouseLiter.Text);
    oqMergeDetail.SetVariable('PFC_HALL', teHall.Text);
    oqMergeDetail.SetVariable('PFC_ADR_PLACE', sAddress);
    oqMergeDetail.Execute;
    frmMain.os.Commit;
// -- 5. Обновляем данные в журнале, закрываем форму
    frmMain.odsJur.AfterScroll := nil;
    id := frmMain.odsJur.FieldByName('fk_id').AsInteger;
    RefreshQuery(frmMain.odsJur);
    frmMain.odsJur.Locate('fk_id', id, []);
    if frmMain.odsJur.RecordCount = 1 then
      begin
        frmMain.DoEnableAdr1;
        frmMain.DoEnableAdr2;
        frmMain.DoEnableNumKod;

        frmMain.DoVisibleCopy;
        frmMain.DoVisibleMakeCall;
        frmMain.DoVisibleSend;
        frmMain.DoVisibleOtmena;
      end;
    frmMain.odsJur.AfterScroll := frmMain.odsJurAfterScroll;
  finally
    oq.Free;
    close;
    if Assigned(frmSetStreet) then
      frmSetStreet.Close;
    frmMain.VJOURNAL_DATEIN.Focused := True;
    frmMain.grJournal.SetFocus;
  end;
end;

procedure TfrmSetPhoneAdr1.aTabExecute(Sender: TObject);
begin
  frmMain.sFormFocus := 'frmSetPhoneAdr1';
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

procedure TfrmSetPhoneAdr1.cxButton3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmSetPhoneAdr1.FormActivate(Sender: TObject);
begin
  frmSetPhoneAdr1.AlphaBlend := False;
end;

procedure TfrmSetPhoneAdr1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmSetPhoneAdr1.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Assigned(frmSetStreet) then
    frmSetStreet.Close;
end;

procedure TfrmSetPhoneAdr1.FormCreate(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetPhoneAdr1.FormDestroy(Sender: TObject);
begin
  frmSetPhoneAdr1 := nil;
end;

procedure TfrmSetPhoneAdr1.FormShow(Sender: TObject);
begin
  meVvod.SetFocus;
end;

procedure TfrmSetPhoneAdr1.meVvodKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then  // или сохраняем
    begin
      if aOk.Enabled = True then
        aOkExecute(nil);
    end;
  if key = vk_up then // вверх
    begin
      teDop.SetFocus;
    end;
  if key = vk_down then // вниз
    begin
      teAdr1.SetFocus;
    end;
end;

procedure TfrmSetPhoneAdr1.meVvodKeyPress(Sender: TObject; var Key: Char);
begin
  if (Length(meVvod.Text) = 11) and (key <> #8) then
    begin
      key := #0;
      exit;
    end;
end;

procedure TfrmSetPhoneAdr1.teAdr1Click(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetPhoneAdr1.teAdr1Enter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
  teAdr1.Style.BorderColor := clMaroon;
end;

procedure TfrmSetPhoneAdr1.teAdr1Exit(Sender: TObject);
begin
  if Assigned(frmSetStreet) and (frmSetStreet.Visible = True) then
    begin
      frmSetStreet.Hide;
    end;
  teAdr1.Style.BorderColor := clTeal; 
end;

procedure TfrmSetPhoneAdr1.teAdr1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Assigned(frmSetStreet) and (frmSetStreet.Visible = True) then
    begin
      if key = 38 then // вверх
        begin
          frmSetStreet.tvList.DataController.GotoPrev;
        end;
      if key = 40 then // вниз
        begin
          frmSetStreet.tvList.DataController.GotoNext;
        end;
      if Key = vk_return then // enter
        begin
          teAdr1.Tag := frmSetStreet.odsAdr.FieldByName('fk_id').AsInteger;
          sPrefix := frmSetStreet.odsAdr.FieldByName('fc_preffix').AsString;
          pRaion := frmSetStreet.odsAdr.FieldByName('fk_raionid').AsInteger;
          pType := frmSetStreet.odsAdr.FieldByName('fl_type').AsInteger; // (1-Улица, 2-Организация, 3-Стоянка)
          pCost := frmSetStreet.odsAdr.FieldByName('fn_cost').AsInteger;
          teAdr1.Text := frmSetStreet.odsAdr.FieldByName('fc_name').AsString;
          sAddress := frmSetStreet.odsAdr.FieldByName('fc_adr').AsString;
          frmSetStreet.Close;
          aOk.Enabled := True;
        end;
    end else // если формочка выбора улиц не видна то уходим на следующий контрол
    begin
      if key = vk_up then // вверх
        begin
          meVvod.SetFocus;
        end;
      if key = vk_down then // вниз
        begin
          teAdr2.SetFocus;
        end;
      if key = vk_right then // вправо
        begin
          teHouse.SetFocus;
        end; 
      if Key = vk_return then  // или сохраняем
        begin
          if aOk.Enabled = True then
            aOkExecute(nil);
        end;
    end;
end;

procedure TfrmSetPhoneAdr1.teAdr1PropertiesChange(Sender: TObject);
begin
  if Assigned(frmSetStreet) then
    begin
      frmSetStreet.Show;
    end else
    begin
      Application.CreateForm(TfrmSetStreet, frmSetStreet);
      frmSetStreet.Show;
    end;
  frmSetStreet.Top := frmSetPhoneAdr1.Top+78;
  frmSetStreet.Left := frmSetPhoneAdr1.Left+124;
  frmSetStreet.odsAdr.SQL.Text := frmSetStreet.odsAll.SQL.Text;
  frmSetStreet.odsAdr.Close;
  frmSetStreet.odsAdr.SetVariable('p', teAdr1.Text);
  frmSetStreet.odsAdr.Open;
  teAdr1.SetFocus;
  teAdr1.SelLength := 0;
  teAdr1.SelStart := Length(teAdr1.Text);
  if teAdr1.Text = '' then
    begin
      teAdr1.Tag := 0;
      aOk.Enabled := False;
    end;
end;

procedure TfrmSetPhoneAdr1.teAdr2Click(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetPhoneAdr1.teAdr2Enter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
  teAdr2.Style.BorderColor := clMaroon;
end;

procedure TfrmSetPhoneAdr1.teAdr2Exit(Sender: TObject);
begin
  if Assigned(frmSetStreet) and (frmSetStreet.Visible = True) then
    begin
      frmSetStreet.Hide;
    end;
  teAdr2.Style.BorderColor := clTeal;
end;

procedure TfrmSetPhoneAdr1.teAdr2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Assigned(frmSetStreet) and (frmSetStreet.Visible = True) then
    begin
      if key = 38 then // вверх
        begin
          frmSetStreet.tvList.DataController.GotoPrev;
        end;
      if key = 40 then // вниз
        begin
          frmSetStreet.tvList.DataController.GotoNext;
        end;
      if Key = 13 then // enter
        begin
          teAdr2.Text := frmSetStreet.odsAdr.FieldByName('fc_name').AsString;
          teAdr2.Tag := frmSetStreet.odsAdr.FieldByName('fk_id').AsInteger;
          pType := frmSetStreet.odsAdr.FieldByName('fl_type').AsInteger; // (1-Улица, 2-Организация, 3-Стоянка)
          frmSetStreet.Close;
          aOk.Enabled := True;
        end;
    end else
    begin
      if key = vk_up then // вверх
        begin
          teAdr1.SetFocus;
        end;
      if key = vk_down then // вниз
        begin
          teDop.SetFocus;
        end;
      if key = vk_right then // вправо
        begin
          teHouse.SetFocus;
        end;
      if Key = vk_return then  // или сохраняем
        begin
          if aOk.Enabled = True then
            aOkExecute(nil);
        end;
    end;
end;

procedure TfrmSetPhoneAdr1.teAdr2PropertiesChange(Sender: TObject);
begin
  if Assigned(frmSetStreet) then
    begin
      frmSetStreet.Show;
    end else
    begin
      Application.CreateForm(TfrmSetStreet, frmSetStreet);
      frmSetStreet.Show;
    end;
  frmSetStreet.Top := frmSetPhoneAdr1.Top+125;
  frmSetStreet.Left := frmSetPhoneAdr1.Left+150;
  frmSetStreet.odsAdr.SQL.Text := frmSetStreet.odsStreet.SQL.Text;
  frmSetStreet.odsAdr.Close;
  frmSetStreet.odsAdr.SetVariable('p', teAdr2.Text);
  frmSetStreet.odsAdr.Open;
  teAdr2.SetFocus;
  teAdr2.SelLength := 0;
  teAdr2.SelStart := Length(teAdr1.Text);
  if teAdr2.Text = '' then
    teAdr2.Tag := 0;
end;

procedure TfrmSetPhoneAdr1.teDopClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetPhoneAdr1.teDopEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
  teDop.Style.BorderColor := clMaroon;
end;

procedure TfrmSetPhoneAdr1.teDopExit(Sender: TObject);
begin
  teDop.Style.BorderColor := clTeal;
end;

procedure TfrmSetPhoneAdr1.teDopKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_down then // вниз
    begin
      meVvod.SetFocus;
    end;
  if key = vk_up then // вверх
    begin
      teAdr2.SetFocus
    end;
  if key = vk_right then // вправо
    begin
      teHouse.SetFocus;
    end;
  if key = vk_return then // или сохраняем
    begin
      aOkExecute(nil);
    end;     
end;

procedure TfrmSetPhoneAdr1.teHallClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetPhoneAdr1.teHallEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
  teHall.Style.BorderColor := clMaroon;
end;

procedure TfrmSetPhoneAdr1.teHallExit(Sender: TObject);
begin
  teHall.Style.BorderColor := clTeal;
end;

procedure TfrmSetPhoneAdr1.teHallKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_down then // вниз
    begin
      teHouseLiter.SetFocus;
    end;
  if key = vk_up then
    begin
      teHouse.SetFocus;
    end;
  if key = vk_left then // влево
    begin
      if teAdr1.Text = '' then
        teAdr1.SetFocus
      else
        teDop.SetFocus;
    end;
  if key = vk_return then
    begin
      aOkExecute(nil);
    end;   
end;

procedure TfrmSetPhoneAdr1.teHouseClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.latin, KLF_REORDER);
end;

procedure TfrmSetPhoneAdr1.teHouseEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.latin, KLF_REORDER);
  teHouse.Style.BorderColor := clMaroon;
end;

procedure TfrmSetPhoneAdr1.teHouseExit(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
  teHouse.Style.BorderColor := clTeal;
end;

procedure TfrmSetPhoneAdr1.teHouseKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_down then // вниз
    begin
      teHall.SetFocus;
    end;
  if key = vk_up then // вверх
    begin
      teHouseLiter.SetFocus;
    end;
  if key = vk_left then // влево
    begin
      if teAdr1.Text = '' then
        teAdr1.SetFocus
      else
        teDop.SetFocus;
    end;
  if key = vk_return then // или сохраняем
    begin
      aOkExecute(nil);
    end; 
end;

procedure TfrmSetPhoneAdr1.teHouseKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) and not (Key = '/') and not (Key = '\') and not (Key = #8) then
    Key := #0;
  if Key = '\' then
    begin
    if Pos('/', teHouse.Text) = 0 then
      Key := '/'
    else
      Key := #0; // !!! выводить надпись "Нельзя поставить 2 знака "/" "
    end;
  if Key = '/' then
    begin
    if Pos('/', teHouse.Text) = 0 then
      Key := '/'
    else
      Key := #0; // !!! выводить надпись "Нельзя поставить 2 знака "/" "
    end;
end;

procedure TfrmSetPhoneAdr1.teHouseLiterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetPhoneAdr1.teHouseLiterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
  teHouseLiter.Style.BorderColor := clMaroon;
end;

procedure TfrmSetPhoneAdr1.teHouseLiterExit(Sender: TObject);
begin
  teHouseLiter.Style.BorderColor := clTeal;
end;

procedure TfrmSetPhoneAdr1.teHouseLiterKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_down then // вниз
    begin
      teHouse.SetFocus;
    end;
  if key = vk_up then // вверх
    begin
      teHall.SetFocus;
    end;
  if key = vk_left then // влево
    begin
      if teAdr1.Text = '' then
        teAdr1.SetFocus
      else
        teDop.SetFocus;
    end;
  if key = vk_return then
    begin
      aOkExecute(nil);
    end;  
end;

end.
