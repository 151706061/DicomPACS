unit fSetAdr1;

interface
                     
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  JvComponentBase, JvFormPlacement, ActnList, Oracle, cxGraphics, cxMaskEdit,
  cxDropDownEdit, jvDbUtils, dxSkinCaramel, dxSkinCoffee, dxSkinOffice2007Green;

type
  TfrmSetAdr1 = class(TForm)
    al: TActionList;
    aCancel: TAction;
    aOk: TAction;
    aTab: TAction;
    jvFrmStor: TJvFormStorage;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teAdr1: TcxTextEdit;
    paHouse: TPanel;
    cxLabel3: TcxLabel;
    teHouse: TcxTextEdit;
    Panel4: TPanel;
    bEnter: TcxButton;
    bCancel: TcxButton;
    cxLabel5: TcxLabel;
    teHall: TcxTextEdit;
    cxLabel6: TcxLabel;
    oqMergeDetail: TOracleQuery;
    teHouseLiter: TcxTextEdit;
    cxLabel4: TcxLabel;
    teAdr2: TcxTextEdit;
    cxLabel2: TcxLabel;
    teDop: TcxTextEdit;
    cxButton3: TcxButton;
    oqMergeDetailHome: TOracleQuery;
    procedure teAdr1PropertiesChange(Sender: TObject);
    procedure teAdr1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teAdr1Exit(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aTabExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure teAdr2Exit(Sender: TObject);
    procedure teAdr2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teAdr2PropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure teHouseKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure teAdr1Click(Sender: TObject);
    procedure teAdr1Enter(Sender: TObject);
    procedure teHouseEnter(Sender: TObject);
    procedure teHouseClick(Sender: TObject);
    procedure teHouseExit(Sender: TObject);
    procedure teHallClick(Sender: TObject);
    procedure teHallEnter(Sender: TObject);
    procedure teAdr2Click(Sender: TObject);
    procedure teAdr2Enter(Sender: TObject);
    procedure teDopEnter(Sender: TObject);
    procedure teDopClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure teHallKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teHouseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure teDopKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bEnterKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bCancelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure teHouseLiterClick(Sender: TObject);
    procedure teHouseLiterEnter(Sender: TObject);
    procedure teHouseLiterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure teHallExit(Sender: TObject);
    procedure teHouseLiterExit(Sender: TObject);
    procedure teDopExit(Sender: TObject);
    procedure cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    pJurID, pClientID : Integer;
    { Private declarations }
  public
    pStreet : Integer; // 1 - адрес клиента, 2 - пересечение с 
    pTypeShow : Integer; // 1 - обычный адрес, 2 - домашний адрес
    pType : Integer; // 1 - улица(перекресток), 2 - организация(место), 3 - стоянка, 4 - межгород
    pCost : Integer; // стоимость платной стоянки
    sAddress : String; // адрес места                                         
    pRaion : Integer; // id района
    sPrefix : String;                                                               // !!! при открытии формы если уже есть адрес подставлять
    procedure DoShowForm(idJur, nCost, nRaion, nType : Integer; nClientID : Integer = 0);
    { Public declarations }
  end;

var
  frmSetAdr1: TfrmSetAdr1;

implementation

uses fSetStreet, fMain;

{$R *.dfm}

procedure TfrmSetAdr1.aCancelExecute(Sender: TObject);
begin
  close;
  if Assigned(frmSetStreet) then
    frmSetStreet.Close;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

procedure TfrmSetAdr1.aOkExecute(Sender: TObject);
var sRes : string;
    oq : TOracleQuery;
    sHouse, sHouseFraction : String; // дом, дробь номера дома
begin
  if (teAdr2.Text <> '') and (teAdr1.Text = '') then
    begin
      MessageDlg('Внимание!'+#13+#10+
                 'Вы указали "Перечесение с", но не указали первую улицу!'+#13+#10+
                 'Укажите первую улицу, заполнив поле "Адрес клиента"!', mtWarning, [mbOK], 0);
      teAdr1.SetFocus;
      exit;
    end;
  
//-->> 1. Определяем номер дома и дробь
  if Pos('/', teHouse.Text) = 0 then
    begin
      sHouseFraction := '';
      sHouse := teHouse.Text;
    end else
    begin
      sHouseFraction := copy(teHouse.Text, Pos('/', teHouse.Text), Length(teHouse.Text)-Pos('/', teHouse.Text)+1);
      sHouse := copy(teHouse.Text, 1, Pos('/', teHouse.Text)-1);
    end;
//-->> 2. Собираем адрес
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
//-->> 3. Сохраняем адрес
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    if pTypeShow = 1 then // для обычного адреса
      begin
        if pType = 1 then // улица, перекресток
          begin
            oq.SQL.Text := ' update taxi.tjournal '+#13+
                           '    set fc_adr1 = :pfc_adr1, '+#13+
                           '        fk_adr1id = :pfk_adr1id, '+#13+
                           '        fn_stop = :pfn_stop, '+#13+
                           '        fk_raionid = taxi.pkg_drivergrid.GetStreetDistrict(:pfk_adr1id, :pfk_adr2id, :pfn_num) '+#13+
                           '  where fk_id = :pfk_id ';
            oq.DeclareAndSet('pfc_adr1', otString, sRes+' '+teDop.Text);
            oq.DeclareAndSet('pfk_adr1id', otInteger, teAdr1.Tag);
            oq.DeclareAndSet('pfk_adr2id', otInteger, teAdr2.Tag);
            if sHouse = '' then
              oq.DeclareAndSet('pfn_num', otInteger, -1)
            else
              oq.DeclareAndSet('pfn_num', otInteger, StrToInt(sHouse));
            oq.DeclareAndSet('pfn_stop', otInteger, pCost);
            oq.DeclareAndSet('pfk_id', otInteger, pJurID);
            oq.Execute;
          end else  // место, стоянка, межгород
          begin
            oq.SQL.Text := ' update taxi.tjournal '+#13+
                           '    set fc_adr1 = :pfc_adr1, fk_adr1id = :pfk_adr1id, fn_stop = :pfn_stop, fk_raionid = :pfk_raionid '+#13+
                           '  where fk_id = :pfk_id ';
            oq.DeclareAndSet('pfc_adr1', otString, sRes+' '+teDop.Text);
            oq.DeclareAndSet('pfk_adr1id', otInteger, teAdr1.Tag);
            oq.DeclareAndSet('pfn_stop', otInteger, pCost);
            oq.DeclareAndSet('pfk_raionid', otInteger, pRaion);
            oq.DeclareAndSet('pfk_id', otInteger, pJurID);
            oq.Execute;
          end;
      end;
    if pTypeShow = 2 then // для домашнего адреса
      begin
        oq.SQL.Text := ' update taxi.ts_client '+#13+
                       '    set fc_adr = :pfc_adr, fk_adrid = :pfk_adrid '+#13+
                       ' where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfc_adr', otString, sRes);
        oq.DeclareAndSet('pfk_adrid', otInteger, teAdr1.Tag);
        oq.DeclareAndSet('pfk_id', otInteger, pClientID);
        oq.Execute;
      end;
  finally
    oq.Free;
  end;

//-->> 4. Сохраняем детализированные данные по адресу
  if pTypeShow = 1 then // для обычного адреса
    begin
      oqMergeDetail.SetVariable('PFK_JURID', pJurID);
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
      oqMergeDetail.SetVariable('PFC_PREFFIX', sPrefix);
      oqMergeDetail.Execute;
    end;
  if pTypeShow = 2 then // для домашнего адреса
    begin
      oqMergeDetailHome.SetVariable('PFK_CLIENTID', pClientID);
      oqMergeDetailHome.SetVariable('PFC_ADR', sRes);
      oqMergeDetailHome.SetVariable('PFC_DOP', teDop.Text);
      oqMergeDetailHome.SetVariable('PFK_TYPE', pType);
      oqMergeDetailHome.SetVariable('PFC_STREET', teAdr1.Text);
      oqMergeDetailHome.SetVariable('PFC_STREET1', teAdr2.Text);
      if teAdr2.Text <> '' then
        oqMergeDetailHome.SetVariable('PFL_ISDOWNSLASH', 1)
      else
        oqMergeDetailHome.SetVariable('PFL_ISDOWNSLASH', 0);
      oqMergeDetailHome.SetVariable('PFK_IDADR1', teAdr1.Tag);
      if pType = 1 then
        begin
          oqMergeDetailHome.SetVariable('PFK_IDADR2', teAdr2.Tag);
          oqMergeDetailHome.SetVariable('PFC_HOUSEFRACTION', sHouseFraction);
        end else
        begin
          oqMergeDetailHome.SetVariable('PFK_IDADR2', 0);
          oqMergeDetailHome.SetVariable('PFC_HOUSEFRACTION', null);
        end;
      oqMergeDetailHome.SetVariable('PFC_HOUSE', sHouse);
      oqMergeDetailHome.SetVariable('PFC_HOUSELITER', teHouseLiter.Text);
      oqMergeDetailHome.SetVariable('PFC_HALL', teHall.Text);
      oqMergeDetailHome.SetVariable('PFC_ADR_PLACE', sAddress);
      oqMergeDetailHome.SetVariable('PFC_PREFFIX', sPrefix);
      oqMergeDetailHome.Execute;
    end;    
  frmMain.os.Commit;
//-->> 5. Обновляем данные в журнале, закрываем форму адреса
  frmMain.odsJur.AfterScroll := nil;
  RefreshQuery(frmMain.odsJur);
  frmMain.odsJur.AfterScroll := frmMain.odsJurAfterScroll;
  frmMain.bHomeAdr.Caption := sRes;
  close;
  if Assigned(frmSetStreet) then
    frmSetStreet.Close;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

procedure TfrmSetAdr1.aTabExecute(Sender: TObject);
begin
  frmMain.sFormFocus := 'frmSetAdr1';
  if Assigned(frmSetStreet) and (frmSetStreet.Visible = True) then
    begin
      frmSetStreet.Hide;
    end;
  frmSetAdr1.AlphaBlend := True;
  frmSetAdr1.AlphaBlendValue := 150;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

procedure TfrmSetAdr1.bCancelKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 40 then // вниз
    begin
      teAdr1.SetFocus;
    end;
end;

procedure TfrmSetAdr1.bEnterKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 40 then // вниз
    begin
      bCancel.SetFocus;
    end;
end;

procedure TfrmSetAdr1.cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmSetAdr1.DoShowForm(idJur, nCost, nRaion, nType : Integer; nClientID : Integer = 0);
begin
  pJurID := idJur;
  pCost := nCost;
  pRaion := nRaion;
  pType := nType;
  pClientID := nClientID;
end;

procedure TfrmSetAdr1.FormActivate(Sender: TObject);
begin
  frmSetAdr1.AlphaBlend := False;
end;

procedure TfrmSetAdr1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmSetAdr1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Assigned(frmSetStreet) then
    frmSetStreet.Close;
end;

procedure TfrmSetAdr1.FormCreate(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetAdr1.FormDestroy(Sender: TObject);
begin
  frmSetAdr1 := nil;
end;

procedure TfrmSetAdr1.FormShow(Sender: TObject);
begin
  teAdr1.SetFocus;
end;

procedure TfrmSetAdr1.teAdr1Click(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetAdr1.teAdr1Enter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
  teAdr1.Style.BorderColor := clMaroon;
end;

procedure TfrmSetAdr1.teAdr1Exit(Sender: TObject);
begin
  if Assigned(frmSetStreet) and (frmSetStreet.Visible = True) then
    begin
      frmSetStreet.Hide;
    end;
  teAdr1.Style.BorderColor := clTeal;  
end;

procedure TfrmSetAdr1.teAdr1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  pStreet := 1;
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
          teDop.SetFocus;
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

procedure TfrmSetAdr1.teAdr1PropertiesChange(Sender: TObject);
begin
  if Assigned(frmSetStreet) then
    begin
      frmSetStreet.Show;
    end else
    begin
      Application.CreateForm(TfrmSetStreet, frmSetStreet);
      frmSetStreet.Show;
    end;
  frmSetStreet.Top := frmSetAdr1.Top+37;
  frmSetStreet.Left := frmSetAdr1.Left+123;
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

procedure TfrmSetAdr1.teAdr2Click(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetAdr1.teAdr2Enter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
  teAdr2.Style.BorderColor := clMaroon;
end;

procedure TfrmSetAdr1.teAdr2Exit(Sender: TObject);
begin
  if Assigned(frmSetStreet) and (frmSetStreet.Visible = True) then
    begin
      frmSetStreet.Hide;
    end;
  teAdr2.Style.BorderColor := clTeal;  
end;

procedure TfrmSetAdr1.teAdr2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  pStreet := 2;
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

procedure TfrmSetAdr1.teAdr2PropertiesChange(Sender: TObject);
begin
  if Assigned(frmSetStreet) then
    begin
      frmSetStreet.Show;
    end else
    begin
      Application.CreateForm(TfrmSetStreet, frmSetStreet);
      frmSetStreet.Show;
    end;
  frmSetStreet.Top := frmSetAdr1.Top+125;
  frmSetStreet.Left := frmSetAdr1.Left+150;
  frmSetStreet.odsAdr.SQL.Text := frmSetStreet.odsStreet.SQL.Text;
  frmSetStreet.odsAdr.Close;
  frmSetStreet.odsAdr.SetVariable('p', teAdr2.Text);
  frmSetStreet.odsAdr.Open;
  teAdr2.SetFocus;
  teAdr2.SelLength := 0;
  teAdr2.SelStart := Length(teAdr2.Text);
  if teAdr2.Text = '' then
    teAdr2.Tag := 0;
end;

procedure TfrmSetAdr1.teDopClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetAdr1.teDopEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
  teDop.Style.BorderColor := clMaroon;
end;

procedure TfrmSetAdr1.teDopExit(Sender: TObject);
begin
  teDop.Style.BorderColor := clTeal;
end;

procedure TfrmSetAdr1.teDopKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_down then // вниз
    begin
      teAdr1.SetFocus;
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

procedure TfrmSetAdr1.teHallClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetAdr1.teHallEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
  teHall.Style.BorderColor := clMaroon;
end;

procedure TfrmSetAdr1.teHallExit(Sender: TObject);
begin
  teHall.Style.BorderColor := clTeal;
end;

procedure TfrmSetAdr1.teHallKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TfrmSetAdr1.teHouseClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.latin, KLF_REORDER);
end;

procedure TfrmSetAdr1.teHouseEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.latin, KLF_REORDER);
  teHouse.Style.BorderColor := clMaroon;
end;

procedure TfrmSetAdr1.teHouseExit(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
  teHouse.Style.BorderColor := clTeal;
end;

procedure TfrmSetAdr1.teHouseKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TfrmSetAdr1.teHouseKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmSetAdr1.teHouseLiterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetAdr1.teHouseLiterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
  teHouseLiter.Style.BorderColor := clMaroon;
end;

procedure TfrmSetAdr1.teHouseLiterExit(Sender: TObject);
begin
  teHouseLiter.Style.BorderColor := clTeal;
end;

procedure TfrmSetAdr1.teHouseLiterKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
