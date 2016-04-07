unit fSysParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxButtonEdit, dxSkinsCore, cxVGrid,
  cxControls, cxInplaceContainer, cxTextEdit, Oracle, OracleData, Menus,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ExtCtrls,
  dxSkinsdxBarPainter, dxBar, cxClasses, cxCurrencyEdit, cxSpinEdit, cxCheckBox,
  dxSkinCaramel, dxSkinOffice2007Green;

type
  TfrmSysParams = class(TForm)
    vgParams: TcxVerticalGrid;
    catParam: TcxCategoryRow;
    rowObl: TcxEditorRow;
    rowTown: TcxEditorRow;
    al: TActionList;
    aClose: TAction;
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    rowTarif: TcxCategoryRow;
    rowStopClientPercent: TcxEditorRow;
    bbSave: TdxBarButton;
    aSave: TAction;
    rowPercentObratno: TcxEditorRow;
    catIdent: TcxCategoryRow;
    rowIdentMG: TcxEditorRow;
    catAll: TcxCategoryRow;
    rowSavePass: TcxEditorRow;
    rowBagage: TcxEditorRow;
    rowPeregon: TcxEditorRow;
    rowBonusMin: TcxEditorRow;
    rowPredMin: TcxEditorRow;
    rowAutoAdres: TcxEditorRow;
    rowShowSecHelp: TcxEditorRow;
    rowMin: TcxEditorRow;
    rowPers: TcxEditorRow;
    rowAutoRef: TcxEditorRow;
    rowTimeAutoRef: TcxEditorRow;
    procedure rowOblEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowTownEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure rowStopClientPercentEditPropertiesChange(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure rowPercentObratnoEditPropertiesChange(Sender: TObject);
    procedure rowIdentMGEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure rowSavePassEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowBagageEditPropertiesChange(Sender: TObject);
    procedure rowPeregonEditPropertiesChange(Sender: TObject);
    procedure rowBonusMinEditPropertiesChange(Sender: TObject);
    procedure rowPredEditPropertiesChange(Sender: TObject);
    procedure rowAutoAdresEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowShowSecHelpEditPropertiesChange(Sender: TObject);
    procedure rowMinEditPropertiesChange(Sender: TObject);
    procedure rowPersEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowSetAvtoRefEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowTimeAutoRefEditPropertiesChange(Sender: TObject);
  private
    isStopClientPercent, isPercentObratno, isSavePass, isAutoShowAdr, isBagage,
    isPeregon, isBonusMin, isPredMin, isEditMG, isSecShow, isMin, isEditPers,
    isAutoRefreshTaxi, isTimeRef : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSysParams: TfrmSysParams;

implementation

uses fSetAdrParam, fMain, fSetIdentMG, fSetPers;

{$R *.dfm}

procedure TfrmSysParams.aCloseExecute(Sender: TObject);
begin
  if aSave.Enabled then
    begin
      if MessageDlg('Внимание!'+#13+#10+'Имеются несохраненные настройки!'+#13+#10+'Сохранить их?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
        aSaveExecute(nil);
    end;
  close;
end;

procedure TfrmSysParams.aSaveExecute(Sender: TObject);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  Screen.Cursor := crSQLWait;
  vgParams.SetFocus;
  ods := TOracleDataSet.Create(nil);
  ods.Session := frmMain.os;
  try
// Остановка по требованию клиента, процент
    if isStopClientPercent then
      begin
        ods.Close;
        ods.SQL.Text := ' merge into taxi.tparams using dual on (fc_section = ''TARIF'' and fc_key = ''STOP_CLIENT_PERCENT'') '+#13+
                        ' when not matched then '+#13+
                        '   insert(fc_section, fc_key, fc_value) values(''TARIF'', ''STOP_CLIENT_PERCENT'', :pfc_value) '+#13+
                        ' when matched then '+#13+
                        '   update set fc_value = :pfc_value where fc_section = ''TARIF'' and fc_key = ''STOP_CLIENT_PERCENT'' ';
        ods.DeclareAndSet('pfc_value', otString, FloatToStr(rowStopClientPercent.Properties.Value));
        ods.Open;
        frmMain.os.Commit;
      end;
// Процент обратно по м/г
    if isPercentObratno then
      begin
        ods.Close;
        ods.SQL.Text := ' merge into taxi.tparams using dual on (fc_section = ''TARIF'' and fc_key = ''PERCENT_OBRATNO_MG'') '+#13+
                        ' when not matched then '+#13+
                        '   insert(fc_section, fc_key, fc_value) values(''TARIF'', ''PERCENT_OBRATNO_MG'', :pfc_value) '+#13+
                        ' when matched then '+#13+
                        '   update set fc_value = :pfc_value where fc_section = ''TARIF'' and fc_key = ''PERCENT_OBRATNO_MG'' ';
        ods.DeclareAndSet('pfc_value', otString, FloatToStr(rowPercentObratno.Properties.Value));
        ods.Open;
        frmMain.os.Commit;
      end;
// Автоматически сохранять пароль
    if isSavePass then
      begin
        ods.Close;
        ods.SQL.Text := ' merge into taxi.tparams using dual on (fc_section = ''ALL'' and fc_key = ''AUTO_SAVE_PASS'') '+#13+
                        ' when not matched then '+#13+
                        '   insert(fc_section, fc_key, fc_value) values(''ALL'', ''AUTO_SAVE_PASS'', :pfc_value) '+#13+
                        ' when matched then '+#13+
                        '   update set fc_value = :pfc_value where fc_section = ''ALL'' and fc_key = ''AUTO_SAVE_PASS'' ';
        ods.DeclareAndSet('pfc_value', otString, IntToStr(rowSavePass.Properties.Value));
        ods.Open;
        frmMain.os.Commit;
      end;
// Автоматически выводить окно Адреса
    if isAutoShowAdr then
      begin
        ods.Close;
        ods.SQL.Text := ' merge into taxi.tparams using dual on (fc_section = ''ALL'' and fc_key = ''AUTO_SHOW_ADR'') '+#13+
                        ' when not matched then '+#13+
                        '   insert(fc_section, fc_key, fc_value) values(''ALL'', ''AUTO_SHOW_ADR'', :pfc_value) '+#13+
                        ' when matched then '+#13+
                        '   update set fc_value = :pfc_value where fc_section = ''ALL'' and fc_key = ''AUTO_SHOW_ADR'' ';
        ods.DeclareAndSet('pfc_value', otString, IntToStr(rowAutoAdres.Properties.Value));
        ods.Open;
        frmMain.os.Commit;
      end;
// Автоматически обновлять сетку таксистов
    if isAutoRefreshTaxi then
      begin
        ods.Close;
        ods.SQL.Text := ' merge into taxi.tparams using dual on (fc_section = ''ALL'' and fc_key = ''AUTO_REF_TAXI'') '+#13+
                        ' when not matched then '+#13+
                        '   insert(fc_section, fc_key, fc_value) values(''ALL'', ''AUTO_REF_TAXI'', :pfc_value) '+#13+
                        ' when matched then '+#13+
                        '   update set fc_value = :pfc_value where fc_section = ''ALL'' and fc_key = ''AUTO_REF_TAXI'' ';
        ods.DeclareAndSet('pfc_value', otString, IntToStr(rowAutoRef.Properties.Value));
        ods.Open;
        frmMain.os.Commit;
      end;
// Время автоматического обновления сетки таксистов
    if isTimeRef then
      begin
        if rowTimeAutoRef.Visible = True then
          begin
            ods.Close;
            ods.SQL.Text := ' merge into taxi.tparams using dual on (fc_section = ''ALL'' and fc_key = ''TIME_AUTO_REF'') '+#13+
                            ' when not matched then '+#13+
                            '   insert(fc_section, fc_key, fc_value) values(''ALL'', ''TIME_AUTO_REF'', :pfc_value) '+#13+
                            ' when matched then '+#13+
                            '   update set fc_value = :pfc_value where fc_section = ''ALL'' and fc_key = ''TIME_AUTO_REF'' ';
            ods.DeclareAndSet('pfc_value', otString, IntToStr(rowTimeAutoRef.Properties.Value));
            ods.Open;
            frmMain.os.Commit;
          end else
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := frmMain.os;
              oq.SQL.Text := ' delete from taxi.tparams where fc_key = ''TIME_AUTO_REF'' ';
              oq.Execute;
              frmMain.os.Commit;
            finally
              oq.Free;
            end;
          end;
      end;
// Процент за перегруз, багаж
    if isBagage then
      begin
        ods.Close;
        ods.SQL.Text := ' merge into taxi.tparams using dual on (fc_section = ''TARIF'' and fc_key = ''PERCENT_BAGAGE'') '+#13+
                        ' when not matched then '+#13+
                        '   insert(fc_section, fc_key, fc_value) values(''TARIF'', ''PERCENT_BAGAGE'', :pfc_value) '+#13+
                        ' when matched then '+#13+
                        '   update set fc_value = :pfc_value where fc_section = ''TARIF'' and fc_key = ''PERCENT_BAGAGE'' ';
        ods.DeclareAndSet('pfc_value', otString, FloatToStr(rowBagage.Properties.Value));
        ods.Open;
        frmMain.os.Commit;
      end;
// Перегон
    if isPeregon then
      begin
        ods.Close;
        ods.SQL.Text := ' merge into taxi.tparams using dual on (fc_section = ''TARIF'' and fc_key = ''KOF_PEREGON'') '+#13+
                        ' when not matched then '+#13+
                        '   insert(fc_section, fc_key, fc_value) values(''TARIF'', ''KOF_PEREGON'', :pfc_value) '+#13+
                        ' when matched then '+#13+
                        '   update set fc_value = :pfc_value where fc_section = ''TARIF'' and fc_key = ''KOF_PEREGON'' ';
        ods.DeclareAndSet('pfc_value', otString, IntToStr(rowPeregon.Properties.Value));
        ods.Open;
        frmMain.os.Commit;
      end;
// Кол-во бесплатных минут
    if isBonusMin then
      begin
        ods.Close;
        ods.SQL.Text := ' merge into taxi.tparams using dual on (fc_section = ''TARIF'' and fc_key = ''KOLVO_BONUS_MIN'') '+#13+
                        ' when not matched then '+#13+
                        '   insert(fc_section, fc_key, fc_value) values(''TARIF'', ''KOLVO_BONUS_MIN'', :pfc_value) '+#13+
                        ' when matched then '+#13+
                        '   update set fc_value = :pfc_value where fc_section = ''TARIF'' and fc_key = ''KOLVO_BONUS_MIN'' ';
        ods.DeclareAndSet('pfc_value', otString, IntToStr(rowBonusMin.Properties.Value));
        ods.Open;
        frmMain.os.Commit;
      end;
// Кол-во минут до предварительного заказа
    if isPredMin then
      begin
        ods.Close;
        ods.SQL.Text := ' merge into taxi.tparams using dual on (fc_section = ''TARIF'' and fc_key = ''KOLVO_PRED_MIN'') '+#13+
                        ' when not matched then '+#13+
                        '   insert(fc_section, fc_key, fc_value) values(''TARIF'', ''KOLVO_PRED_MIN'', :pfc_value) '+#13+
                        ' when matched then '+#13+
                        '   update set fc_value = :pfc_value where fc_section = ''TARIF'' and fc_key = ''KOLVO_PRED_MIN'' ';
        ods.DeclareAndSet('pfc_value', otString, IntToStr(rowPredMin.Properties.Value));
        ods.Open;
        frmMain.os.Commit;
      end;
// Оплата "Минималка"
    if isMin then
      begin
        ods.Close;
        ods.SQL.Text := ' merge into taxi.tparams using dual on (fc_section = ''TARIF'' and fc_key = ''KOLVO_RUB_MIN'') '+#13+
                        ' when not matched then '+#13+
                        '   insert(fc_section, fc_key, fc_value) values(''TARIF'', ''KOLVO_RUB_MIN'', :pfc_value) '+#13+
                        ' when matched then '+#13+
                        '   update set fc_value = :pfc_value where fc_section = ''TARIF'' and fc_key = ''KOLVO_RUB_MIN'' ';
        ods.DeclareAndSet('pfc_value', otString, IntToStr(rowMin.Properties.Value));
        ods.Open;
        frmMain.os.Commit;
      end;
// Кол-во секунд отображения подсказки
    if isSecShow then
      begin
        ods.Close;
        ods.SQL.Text := ' merge into taxi.tparams using dual on (fc_section = ''ALL'' and fc_key = ''SEC_SHOW_HELP'') '+#13+
                        ' when not matched then '+#13+
                        '   insert(fc_section, fc_key, fc_value) values(''ALL'', ''SEC_SHOW_HELP'', :pfc_value) '+#13+
                        ' when matched then '+#13+
                        '   update set fc_value = :pfc_value where fc_section = ''ALL'' and fc_key = ''SEC_SHOW_HELP'' ';
        ods.DeclareAndSet('pfc_value', otString, IntToStr(rowShowSecHelp.Properties.Value));
        ods.Open;
        frmMain.os.Commit;
      end;
// Идентификатор "Межгород"
    if isEditMG then
      begin
        if rowIdentMG.Tag = -1 then // удаляем
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := frmMain.os;
              oq.SQL.Text := ' delete from taxi.tparams where fc_key = ''IDENT_MG'' ';
              oq.Execute;
              frmMain.os.Commit; // !!! не должно быть после каждого комит, комит должен быть один в самом конце
            finally
              oq.Free;
            end;
          end else
          begin // изменяем/добавляем
            ods.Close;
            ods.SQL.Text := ' merge into taxi.tparams using dual on (fc_key = ''IDENT_MG'') '+#13+
                            ' when matched then update set fc_value = :pfc_value where fc_key = ''IDENT_MG'' '+#13+
                            ' when not matched then insert(fc_section, fc_key, fc_value) values(''IDENT'', ''IDENT_MG'', :pfc_value) ';
            ods.DeclareAndSet('pfc_value', otString, IntToStr(rowIdentMG.Tag)+';'+rowIdentMG.Properties.Value);
            ods.Open;
            frmMain.os.Commit;
          end;
      end;
// Идентификатор "Персоналка"
    if isEditPers then
      begin
        ods.Close;
        ods.SQL.Text := ' merge into taxi.tparams using dual on (fc_key = ''IDENT_PERS'') '+#13+
                        ' when matched then update set fc_value = :pfc_value where fc_key = ''IDENT_PERS'' '+#13+
                        ' when not matched then insert(fc_section, fc_key, fc_value) values(''IDENT'', ''IDENT_PERS'', :pfc_value) ';
        ods.DeclareAndSet('pfc_value', otString, IntToStr(rowPers.Tag)+';'+rowPers.Properties.Value);
        ods.Open;
        frmMain.os.Commit;
      end;

    aSave.Enabled := False;
    isStopClientPercent := False;
    isPercentObratno := False;
    isBagage := False;
    isPeregon := False;
    isBonusMin := False;
    isPredMin := False;
    isEditMG := False;
    isEditPers := False;
  finally
    Screen.Cursor := crDefault;
    ods.Free;
  end;
end;

procedure TfrmSysParams.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSysParams.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := 'select * from taxi.tparams ';
    ods.Open;
    ods.First;
    while not ods.Eof do
      begin
//-- область
        if ods.FieldByName('fc_key').AsString = 'OBL' then
          begin
            rowObl.Tag := StrToInt(copy(ods.FieldByName('fc_value').AsString, 1, Pos(';', ods.FieldByName('fc_value').AsString)-1));
            rowObl.Properties.Value := copy(ods.FieldByName('fc_value').AsString, Length(IntToStr(rowObl.Tag))+2, Length(ods.FieldByName('fc_value').AsString) - Length(IntToStr(rowObl.Tag)));
          end;
//-- город
        if ods.FieldByName('fc_key').AsString = 'TOWN' then
          begin
            rowTown.Tag := StrToInt(copy(ods.FieldByName('fc_value').AsString, 1, Pos(';', ods.FieldByName('fc_value').AsString)-1));
            rowTown.Properties.Value := copy(ods.FieldByName('fc_value').AsString, Length(IntToStr(rowTown.Tag))+2, Length(ods.FieldByName('fc_value').AsString) - Length(IntToStr(rowTown.Tag)));
          end;
//-- Остановка по просьбе клиента, процент
        if ods.FieldByName('fc_key').AsString = 'STOP_CLIENT_PERCENT' then
          begin
            rowStopClientPercent.Properties.Value := StrToFloat(ods.FieldByName('fc_value').AsString);
          end;
//-- Процент обратно по межгороду
        if ods.FieldByName('fc_key').AsString = 'PERCENT_OBRATNO_MG' then
          begin
            rowPercentObratno.Properties.Value := StrToFloat(ods.FieldByName('fc_value').AsString);
          end;
//-- Автоматически сохранять пароль
        if ods.FieldByName('fc_key').AsString = 'AUTO_SAVE_PASS' then
          begin
            rowSavePass.Properties.Value := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
//-- Автоматически выводить окно Адреса
        if ods.FieldByName('fc_key').AsString = 'AUTO_SHOW_ADR' then
          begin
            rowAutoAdres.Properties.Value := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
//-- Атоматически обновлять сетку таксистов
        if ods.FieldByName('fc_key').AsString = 'AUTO_REF_TAXI' then
          begin
            rowAutoRef.Properties.Value := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
// -- Время автоматического обновления
        if ods.FieldByName('fc_key').AsString = 'TIME_AUTO_REF' then
          begin
            rowTimeAutoRef.Properties.Value := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
//-- Процент за перегруз, багаж
        if ods.FieldByName('fc_key').AsString = 'PERCENT_BAGAGE' then
          begin
            rowBagage.Properties.Value := StrToFloat(ods.FieldByName('fc_value').AsString);
          end;
//-- Коэффициент перегона
        if ods.FieldByName('fc_key').AsString = 'KOF_PEREGON' then
          begin
            rowPeregon.Properties.Value := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
//-- Оплата за минималку
        if ods.FieldByName('fc_key').AsString = 'KOLVO_RUB_MIN' then
          begin
            rowMin.Properties.Value := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
//-- Количество бесплатных минут
        if ods.FieldByName('fc_key').AsString = 'KOLVO_BONUS_MIN' then
          begin
            rowBonusMin.Properties.Value := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
//-- Количество минут до предварительного заказа
        if ods.FieldByName('fc_key').AsString = 'KOLVO_PRED_MIN' then
          begin
            rowPredMin.Properties.Value := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
//-- Кол-во секунд отображения подсказки
        if ods.FieldByName('fc_key').AsString = 'SEC_SHOW_HELP' then
          begin
            rowShowSecHelp.Properties.Value := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
//-- Идентификатор "Межгород"
        if ods.FieldByName('fc_key').AsString = 'IDENT_MG' then
          begin
            rowIdentMG.Tag := StrToInt(copy(ods.FieldByName('fc_value').AsString, 1, Pos(';', ods.FieldByName('fc_value').AsString)-1));
            rowIdentMG.Properties.Value := copy(ods.FieldByName('fc_value').AsString, Length(IntToStr(rowIdentMG.Tag))+2, Length(ods.FieldByName('fc_value').AsString) - Length(IntToStr(rowIdentMG.Tag)));
          end;
//-- Идентификатор "Персоналка"
        if ods.FieldByName('fc_key').AsString = 'IDENT_PERS' then
          begin
            rowPers.Tag := StrToInt(copy(ods.FieldByName('fc_value').AsString, 1, Pos(';', ods.FieldByName('fc_value').AsString)-1));
            rowPers.Properties.Value := copy(ods.FieldByName('fc_value').AsString, Length(IntToStr(rowPers.Tag))+2, Length(ods.FieldByName('fc_value').AsString) - Length(IntToStr(rowPers.Tag)));
          end;
        ods.Next;
    end;
    aSave.Enabled := False;
    isStopClientPercent := False;
    isPercentObratno := False;
    isSavePass := False;
    isBagage := False;
    isPeregon := False;
    isBonusMin := False;
    isPredMin := False;
    isTimeRef := False;

    rowTimeAutoRef.Visible := rowAutoRef.Properties.Value = 1;    
  finally
    ods.Free;
  end;
end;

procedure TfrmSysParams.FormDestroy(Sender: TObject);
begin
  frmSysParams := nil;
end;

procedure TfrmSysParams.rowAutoAdresEditPropertiesEditValueChanged(Sender: TObject);
begin
  isAutoShowAdr := True;
  aSave.Enabled := True;
end;

procedure TfrmSysParams.rowBagageEditPropertiesChange(Sender: TObject);
begin
  isBagage := True;
  aSave.Enabled := True;
end;

procedure TfrmSysParams.rowBonusMinEditPropertiesChange(Sender: TObject);
begin
  isBonusMin := True;
  aSave.Enabled := True;
end;

procedure TfrmSysParams.rowIdentMGEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
//var oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetIdentMG, frmSetIdentMG);
      try
        frmSetIdentMG.ShowModal;
        if frmSetIdentMG.ModalResult = mrOk then
          begin
//            oq := TOracleQuery.Create(nil);
//            try
//              oq.Session := frmMain.os;
//              oq.Cursor := crSQLWait;
//              oq.SQL.Text := ' merge into taxi.tparams using dual on (fc_key = ''IDENT_MG'') '+#13+
//                             ' when matched then update set fc_value = :pfc_value where fc_key = ''IDENT_MG'' '+#13+
//                             ' when not matched then insert(fc_section, fc_key, fc_value) values(''IDENT'', ''IDENT_MG'', :pfc_value) ';
//              oq.DeclareAndSet('pfc_value', otString, IntToStr(frmSetIdentMG.odsList.FieldByName('fk_id').AsInteger)+';'+frmSetIdentMG.odsList.FieldByName('fc_name').AsString);
//              oq.Execute;
//              frmMain.os.Commit;
              TcxButtonEdit(vgParams.InplaceEditor).Properties.ViewStyle := vsNormal;
              TcxButtonEdit(vgParams.InplaceEditor).EditingText := frmSetIdentMG.odsList.FieldByName('fc_name').AsString;
              TcxButtonEdit(vgParams.InplaceEditor).Properties.ViewStyle := vsHideCursor;
              rowIdentMG.Tag := frmSetIdentMG.odsList.FieldByName('fk_id').AsInteger;

              isEditMG := True;
              aSave.Enabled := True;
//            finally
//              oq.Free;
//            end;
          end;
      finally
        frmSetIdentMG.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      if MessageDlg('Внимание!'+#13+#10+
                    'Удаление идентификаторов может привести к некорректной работе программы!'+#13+#10+
                    'Продолжить удаление?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
        begin
//          oq := TOracleQuery.Create(nil);
//          try
//            oq.Session := frmMain.os;
//            oq.Cursor := crSQLWait;
//            oq.SQL.Text := ' delete from taxi.tparams where fc_key = ''IDENT_MG'' ';
//            oq.Execute;
//            frmMain.os.Commit;
            rowIdentMG.Tag := -1;
            TcxButtonEdit(vgParams.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vgParams.InplaceEditor).EditingText := ' ';
            TcxButtonEdit(vgParams.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            isEditMG := True;
            aSave.Enabled := True;
//          finally
//            oq.Free;
//          end;
        end;
    end;
end;

procedure TfrmSysParams.rowMinEditPropertiesChange(Sender: TObject);
begin
  isMin := True;
  aSave.Enabled := True;
end;

procedure TfrmSysParams.rowOblEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmSetAdrParam, frmSetAdrParam);
  try
    frmSetAdrParam.Caption := 'Выбор области(региона)';
    frmSetAdrParam.dsList.DataSet := frmSetAdrParam.odsList;
    frmSetAdrParam.odsList.Close;
    frmSetAdrParam.odsList.SetVariable('pfn_level', 1);
    frmSetAdrParam.odsList.Open;
    if rowObl.Tag <> 0 then
      frmSetAdrParam.odsList.Locate('fk_id', rowObl.Tag, []);
    frmSetAdrParam.ShowModal;
    if frmSetAdrParam.ModalResult = mrOk then
      begin
        rowObl.Tag := frmSetAdrParam.odsList.FieldByName('fk_id').AsInteger;
        TcxButtonEdit(vgParams.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(vgParams.InplaceEditor).EditingText := frmSetAdrParam.odsList.FieldByName('fc_name').AsString;
        TcxButtonEdit(vgParams.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' merge into taxi.tparams using dual on (fc_section = ''ADR'' and fc_key = ''OBL'')'+#13+
                         ' when not matched then insert(fc_section, fc_key, fc_value) values(''ADR'', ''OBL'', :pfc_value) '+#13+
                         ' when matched then update set fc_value = :pfc_value where fc_section = ''ADR'' and fc_key = ''OBL'' ';
          oq.DeclareAndSet('pfc_value', otString, IntToStr(frmSetAdrParam.odsList.FieldByName('fk_id').AsInteger)+';'+frmSetAdrParam.odsList.FieldByName('fc_name').AsString);
          oq.Execute;
          frmMain.os.Commit;
        finally
          oq.Free;
        end;
      end;
  finally
    frmSetAdrParam.Free;
  end;
end;

procedure TfrmSysParams.rowPercentObratnoEditPropertiesChange(Sender: TObject);
begin
  isPercentObratno := True;
  aSave.Enabled := True;
end;

procedure TfrmSysParams.rowPeregonEditPropertiesChange(Sender: TObject);
begin
  isPeregon := True;
  aSave.Enabled := True;
end;

procedure TfrmSysParams.rowPersEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSetPers, frmSetPers);
  try
    frmSetPers.ShowModal;
    if frmSetPers.ModalResult = mrOk then
      begin
        TcxButtonEdit(vgParams.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(vgParams.InplaceEditor).EditingText := frmSetPers.odsList.FieldByName('fc_name').AsString;
        TcxButtonEdit(vgParams.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        rowPers.Tag := frmSetPers.odsList.FieldByName('fk_id').AsInteger;

        isEditPers := True;
        aSave.Enabled := True;
      end;
  finally
    frmSetPers.Free;
  end;
end;

procedure TfrmSysParams.rowPredEditPropertiesChange(Sender: TObject);
begin
  isPredMin := True;
  aSave.Enabled := True;
end;

procedure TfrmSysParams.rowSavePassEditPropertiesEditValueChanged(Sender: TObject);
begin
  isSavePass := True;
  aSave.Enabled := True;
end;

procedure TfrmSysParams.rowSetAvtoRefEditPropertiesEditValueChanged(Sender: TObject);
begin
  isAutoRefreshTaxi := True;
  aSave.Enabled := True;
  rowTimeAutoRef.Visible := rowAutoRef.Properties.Value = 1;
  if rowAutoRef.Properties.Value = 0 then
    isTimeRef := True;  
end;

procedure TfrmSysParams.rowShowSecHelpEditPropertiesChange(Sender: TObject);
begin
  isSecShow := True;
  aSave.Enabled := True;
end;

procedure TfrmSysParams.rowStopClientPercentEditPropertiesChange(Sender: TObject);
begin
  isStopClientPercent := True;
  aSave.Enabled := True; 
end;

procedure TfrmSysParams.rowTimeAutoRefEditPropertiesChange(Sender: TObject);
begin
  isTimeRef := True;
  aSave.Enabled := True;
end;

procedure TfrmSysParams.rowTownEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  if rowObl.Tag = 0 then
    begin
      MessageDlg('Внимание!'+#13+#10+'Сначала выберите область(регион)!', mtWarning, [mbOK], 0);
      rowObl.Focused := True;
      exit;
    end;
  Application.CreateForm(TfrmSetAdrParam, frmSetAdrParam);
  try
    frmSetAdrParam.Caption := 'Выбор города';
    frmSetAdrParam.dsList.DataSet := frmSetAdrParam.odsTown;
    frmSetAdrParam.odsTown.Close;
    frmSetAdrParam.odsTown.SetVariable('pfk_id', rowObl.Tag);
    frmSetAdrParam.odsTown.Open;
    if rowTown.Tag <> 0 then
      frmSetAdrParam.odsTown.Locate('fk_id', rowTown.Tag, []);
    frmSetAdrParam.ShowModal;
    if frmSetAdrParam.ModalResult = mrOk then
      begin
        rowTown.Tag := frmSetAdrParam.odsTown.FieldByName('fk_id').AsInteger;
        TcxButtonEdit(vgParams.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(vgParams.InplaceEditor).EditingText := frmSetAdrParam.odsTown.FieldByName('fc_name').AsString;
        TcxButtonEdit(vgParams.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' merge into taxi.tparams using dual on (fc_section = ''ADR'' and fc_key = ''TOWN'')'+#13+
                         ' when not matched then insert(fc_section, fc_key, fc_value) values(''ADR'', ''TOWN'', :pfc_value) '+#13+
                         ' when matched then update set fc_value = :pfc_value where fc_section = ''ADR'' and fc_key = ''TOWN'' ';
          oq.DeclareAndSet('pfc_value', otString, IntToStr(frmSetAdrParam.odsTown.FieldByName('fk_id').AsInteger)+';'+frmSetAdrParam.odsTown.FieldByName('fc_name').AsString);
          oq.Execute;
          frmMain.os.Commit;
        finally
          oq.Free;
        end;
      end;
  finally
    frmSetAdrParam.Free;
  end;
end;

end.
