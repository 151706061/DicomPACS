// Нижневартовск локально Бондырева НА 59049 pacid 6593477 nazid 6593480
library EditTalon;



uses
  OracleMonitor,
  SysUtils,
  Classes,
  Forms,
  Controls,
  Oracle,
  OracleData,
  {$IFDEF USE_NEW_AUTH}
    SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  {$ELSE}
    SMMainAPI in '..\..\..\..\..\Trunk\ASU2\uCommon_Tima\SMMainAPI.pas',
  {$ENDIF}
  Dialogs,
  fMain in 'fMain.pas' {frmMain},
  fSet in 'fSet.pas' {frmSet},
  fSetDoc in 'fSetDoc.pas' {frmSetDoc},
  fCommit in 'fCommit.pas' {frmCommit},
  fSetDs in 'fSetDs.pas' {frmSetDs},
  fEditDs in 'fEditDs.pas' {frmEditDs},
  fSetOpl in 'fSetOpl.pas' {frmSetOpl},
  fSetSotr in 'fSetSotr.pas' {frmSetSotr},
  fSetUch in 'fSetUch.pas' {frmSetUch};

{$R *.res}

procedure InitPlugin(nPacid : Integer; nNazid : Integer; nSotrid : Integer; nAppSotrid : Integer = 0); stdcall;
begin
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowfrmMain(nPacid, nNazid, nSotrid, nAppSotrid);
  frmMain.ShowModal;
end;

function InitPluginRes(nPacid : Integer; nNazid : Integer; nSotrid : Integer; nAppSotrid : Integer = 0):integer; stdcall;
begin
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowfrmMain(nPacid, nNazid, nSotrid, nAppSotrid);
  frmMain.ShowModal;
  if frmMain.ModalResult = mrCancel then
    begin
      Result := frmMain.varRes;
    end else
    begin
      Result := -1;
    end;
end;

function FreePlugin(): LongInt; stdcall;
begin
  Result := 0;
  if not assigned(frmMain) then exit;
  if Assigned(frmMain) then
    FreeAndNil(frmMain);
end;

function CopyPlugin(pNaz1 : Integer; pNaz2 : Integer): LongInt; stdcall;
var ods, odsDiags : TOracleDataSet;
    osCopy : TOracleSession;
    oq : TOracleQuery;
    idDs, idDsPred, idDsZaklMain, idDsZaklSoput : Integer;
    pFK_TALONID, pFK_TALONID2, pFK_SOTRID, pFN_SOS, pFK_SERVPLACE, pFK_REASON, pFK_TRAVMA, PFK_RESULT,
    PFK_SOTRCLOSED, pFK_DOPISHODID : Integer;
    pFD_OPENED, pFD_CLOSED : TDateTime;
begin
  Result := 0;
  idDsPred := 0;
  idDsZaklMain := 0;
  idDsZaklSoput := 0;
  osCopy := TOracleSession.Create(nil);
  ods := TOracleDataSet.Create(nil);
  odsDiags := TOracleDataSet.Create(nil);
  oq := TOracleQuery.Create(nil);
  try
    {$IFDEF USE_NEW_AUTH}
      GetSession(osCopy, 'ASU');
    {$ELSE}
      osCopy.LogonUsername := 'ASU';
      osCopy.LogonPassword := 'ASU';
      osCopy.LogonDatabase := 'ASU';
      osCopy.Connected:=True;
    {$ENDIF}
    oq.Session := osCopy;
    oq.Cursor := crSQLWait;
    odsDiags.Session := osCopy;
    odsDiags.Cursor := crSQLWait;
    ods.Session := osCopy;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select t1.fk_id, t1.fk_sotrid, t1.fd_opened, t1.fd_closed, t1.fn_sos, t1.fk_servplace, t1.fk_reason, '+#13+
                    '        t1.fk_travma, t1.fk_result, t1.fk_sotrclosed, t1.fk_otdelid, t1.fk_dopishodid '+#13+
                    '   from asu.tambtalon t1, asu.tambtalon_naz t2 '+#13+
                    '  where t1.fk_id = t2.fk_talonid '+#13+
                    '    and t2.fk_nazid = :pfk_nazid ';
    ods.DeclareAndSet('pfk_nazid', otInteger, pNaz1);
    ods.Open;
    if ods.RecordCount > 0 then
      begin
        pfk_talonid := ods.FieldByName('fk_id').AsInteger;
        pfk_sotrid := ods.FieldByName('fk_sotrid').AsInteger;
        pfn_sos := ods.FieldByName('fn_sos').AsInteger;
        pfk_servplace := ods.FieldByName('fk_servplace').AsInteger;
        pfk_reason := ods.FieldByName('fk_reason').AsInteger;
        pfk_travma := ods.FieldByName('fk_travma').AsInteger;
        pfk_result := ods.FieldByName('fk_result').AsInteger;
        pfk_sotrclosed := ods.FieldByName('fk_sotrclosed').AsInteger;
        pfd_opened := ods.FieldByName('fd_opened').AsDateTime;
        pfd_closed := ods.FieldByName('fd_closed').AsDateTime;
        pfk_dopishodid := ods.FieldByName('fk_dopishodid').AsInteger;
//-->> находим id талона по 2-ому назначению
        ods.DeleteVariables;
        ods.Close;
        ods.DeclareAndSet('pfk_nazid', otInteger, pNaz2);
        ods.Open;
        pfk_talonid2 := ods.FieldByName('fk_id').AsInteger;
//-->> заменяем данные второго талона данными из первого талона
        oq.SQL.Text := ' update asu.tambtalon '+#13+
                       '    set fk_sotrid=:pfk_sotrid, fn_sos=:pfn_sos, fk_servplace=:pfk_servplace, fk_reason=:pfk_reason, '+#13+
                       '        fk_travma=:pfk_travma, fk_result=:pfk_result, fk_dopishodid = :pfk_dopishodid, '+#13+
                       '        fk_sotrclosed=:pfk_sotrclosed, fd_opened=:pfd_opened, fd_closed=:pfd_closed '+#13+
                       '  where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_sotrid', otInteger, pfk_sotrid); // сотрудник, открывшйи талон
        oq.DeclareAndSet('pfn_sos', otInteger, pfn_sos); // статус
        oq.DeclareAndSet('pfk_servplace', otInteger, pfk_servplace); // место обслуживания
        oq.DeclareAndSet('pfk_reason', otInteger, pfk_reason); // Причина обращения
        oq.DeclareAndSet('pfk_travma', otInteger, pfk_travma); // Травма
        oq.DeclareAndSet('pfk_result', otInteger, pfk_result); // Результат обращения
        oq.DeclareAndSet('pfk_sotrclosed', otInteger, pfk_sotrclosed); // Сотрудник, закрывший талон
        oq.DeclareAndSet('pfk_dopishodid', otInteger, pfk_dopishodid); // Дополнительный исход
        oq.DeclareAndSet('pfd_opened', otDate, pfd_opened); // дата открытия талона
        oq.DeclareAndSet('pfd_closed', otDate, pfd_closed); // дата закрытия талона
        oq.DeclareAndSet('pfk_id', otInteger, pfk_talonid2); //
        oq.Execute;
//-->> добавляем данные в таблицы TAMBTALON_DIAGS, TDIAG; изменяем данные в таблице TAMBTALON
        ods.DeleteVariables;
        odsDiags.SQL.Text := ' select tdiag.*, (select fc_synonim from asu.tsmid where fk_id = tdiag.fp_type) as syn, '+#13+
                             '        (select fc_synonim from asu.tsmid where fk_id = tdiag.fl_main) as syn_main '+#13+
                             '   from asu.tdiag where fk_id = :pfk_id ';
        odsDiags.DeclareVariable('pfk_id', otInteger);
        ods.Close;
        ods.SQL.Text := ' select * from asu.tambtalon_diags where fk_talonid = :pfk_talonid ';
        ods.DeclareAndSet('pfk_talonid', otInteger, pfk_talonid);
        ods.Open;
        ods.First;
        while not ods.Eof do
          begin
            odsDiags.Close;
            odsDiags.SetVariable('pfk_id', ods.FieldByName('fk_diagid').AsInteger);
            odsDiags.Open;
            oq.DeleteVariables;
            oq.SQL.Text := ' insert into asu.tdiag '+#13+
                           '   (fk_pacid, fk_smdiagid, fp_type, fl_first, fc_write, fd_date, fk_vrachid, fl_main, fk_nazid, fk_mkb_10) '+#13+
                           ' values '+#13+
                           '   (:pfk_pacid, :pfk_smdiagid, :pfp_type, :pfl_first, :pfc_write, :pfd_date, :pfk_vrachid, :pfl_main, :pfk_nazid, :pfk_mkb_10) '+#13+
                           ' returning fk_id into :pfk_id ';
            oq.DeclareAndSet('pfk_pacid', otInteger, odsDiags.FieldByName('fk_pacid').AsInteger);
            oq.DeclareAndSet('pfk_smdiagid', otInteger, odsDiags.FieldByName('fk_smdiagid').AsInteger);
            oq.DeclareAndSet('pfp_type', otInteger, odsDiags.FieldByName('fp_type').AsInteger);
            oq.DeclareAndSet('pfl_first', otInteger, odsDiags.FieldByName('fl_first').AsInteger);
            oq.DeclareAndSet('pfc_write', otString, odsDiags.FieldByName('fc_write').AsString);
            oq.DeclareAndSet('pfd_date', otDate, odsDiags.FieldByName('fd_date').AsDateTime);
            oq.DeclareAndSet('pfk_vrachid', otInteger, odsDiags.FieldByName('fk_vrachid').AsInteger);
            oq.DeclareAndSet('pfl_main', otInteger, odsDiags.FieldByName('fl_main').AsInteger);
            oq.DeclareAndSet('pfk_nazid', otInteger, pNaz2);
            oq.DeclareAndSet('pfk_mkb_10', otInteger, odsDiags.FieldByName('fk_mkb_10').AsInteger);
            oq.DeclareVariable('pfk_id', otInteger);
            oq.Execute;
            if odsDiags.FieldByName('syn').AsString = 'NA_OSMOTRE' then
              idDsPred := oq.GetVariable('pfk_id');
            if (odsDiags.FieldByName('syn').AsString = 'PRI_VYPISKE') and (odsDiags.FieldByName('syn_main').AsString = 'MAIN') then
              idDsZaklMain := oq.GetVariable('pfk_id');
            if (odsDiags.FieldByName('syn').AsString = 'PRI_VYPISKE') and (odsDiags.FieldByName('syn_main').AsString = 'SOPUT') then
              idDsZaklSoput := oq.GetVariable('pfk_id');
            idDs := oq.GetVariable('pfk_id');
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into asu.tambtalon_diags using dual on (fk_talonid = :pfk_talonid and fk_diagid = :pfk_diagid) '+#13+
                           '   when not matched then insert(fk_diagid, fk_talonid) values(:pfk_diagid, :pfk_talonid) ';
            oq.DeclareAndSet('pfk_diagid', otInteger, idDs);
            oq.DeclareAndSet('pfk_talonid', otInteger, pfk_talonid2);
            oq.Execute;
            ods.Next;
          end;
        oq.DeleteVariables;
        oq.SQL.Text := ' update asu.tambtalon '+#13+
                       '    set fk_diagmain =:pfk_diagmain, fk_diagsub =:pfk_diagsub, fk_diagmainpred = :pfk_diagmainpred '+#13+
                       ' where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_diagmain', otInteger, idDsZaklMain);
        oq.DeclareAndSet('pfk_diagsub', otInteger, idDsZaklSoput);
        oq.DeclareAndSet('pfk_diagmainpred', otInteger, idDsPred);
        oq.DeclareAndSet('pfk_id', otInteger, pFK_TALONID2);
        oq.Execute;
        osCopy.Commit;
        end;
    Result := 1;
  finally
    oq.Free;
    ods.Free;
    osCopy.Free;
  end;
end;

exports
  InitPlugin, InitPluginRes, FreePlugin, CopyPlugin;

begin
end.
