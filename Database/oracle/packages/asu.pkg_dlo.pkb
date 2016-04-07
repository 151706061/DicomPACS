DROP PACKAGE BODY ASU.PKG_DLO
/

--
-- PKG_DLO  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.PKG_DLO
IS
-- Пакет для работы с ДЛО (Дополнительным льготным обслуживаением)
-- Рецепты
-- Author: Voronov

--============================================================================--
-- виды рецептов по льготности
   function GET_cLGOT_RECIPE_NORMAL RETURN NUMBER DETERMINISTIC IS
   begin
     return cLGOT_RECIPE_NORMAL;
   end;

   function GET_cLGOT_RECIPE_LGOT_FED RETURN NUMBER DETERMINISTIC IS
   begin
     return cLGOT_RECIPE_LGOT_FED;
   end;

   function GET_cLGOT_RECIPE_LGOT_REG RETURN NUMBER DETERMINISTIC IS
   begin
     return cLGOT_RECIPE_LGOT_REG;
   end;

--============================================================================--
-- статусы рецептов
   function GET_cSTATUS_NAZ RETURN NUMBER  DETERMINISTIC IS
   begin
     return cSTATUS_NAZ;
   end;

   function GET_cSTATUS_VID RETURN NUMBER DETERMINISTIC IS
   begin
     return cSTATUS_VID;
   end;

   function GET_cSTATUS_VOZVRAT RETURN NUMBER DETERMINISTIC IS
   begin
     return cSTATUS_VOZVRAT;
   end;

   function GET_cSTATUS_UTER RETURN NUMBER DETERMINISTIC IS
   begin
     return cSTATUS_UTER;
   end;

   function GET_cSTATUS_REALIZ RETURN NUMBER DETERMINISTIC IS
   begin
     return cSTATUS_REALIZ;
   end;

   function GET_cSTATUS_NEVOSTREB RETURN NUMBER DETERMINISTIC IS
   begin
     return cSTATUS_NEVOSTREB;
   end;

   function GET_cSTATUS_ZAYAV_VIBRANA RETURN NUMBER DETERMINISTIC IS
   begin
     return cSTATUS_ZAYAV_VIBRANA;
   end;

   function GET_cSTATUS_NA_OTSROCH_OBSLUG RETURN NUMBER DETERMINISTIC IS
   begin
     return cSTATUS_NA_OTSROCH_OBSLUG;
   end;

   function GET_cSTATUS_NE_REALIZ RETURN NUMBER DETERMINISTIC IS
   begin
     return cSTATUS_NE_REALIZ;
   end;


--============================================================================--

   function CHECK_RECIPE_SER_NUM_CAUSE( aCurRECIPE_ID IN NUMBER, aSERIAL IN ASU.TRECIPE.fc_serial%type, aNUM IN ASU.TRECIPE.fn_num%type) RETURN varchar2
   IS
     res Varchar2(255);
     SotrID NUMBER;
     PacID NUMBER;
     cursor C is 
         (SELECT FK_SOTRID, FK_PAC_ID FROM ASU.TRECIPE r
          WHERE r.fk_id <> nvl(aCurRECIPE_ID, -1)
           and r.fn_num = aNUM
           and upper(r.fc_serial) = upper(aSERIAL)
           and r.FL_DEL = 0);
   begin
     res := '';
     open C;
     fetch c into SotrID, PacID;
     close C;
     if SotrID is not null and PacID is not null then 
         res := 'Сотрудником ' || asu.get_sotrname(SotrID) || ' уже создан рецепт с такими серией и номером для пациента ' || asu.pkg_regist_pacfunc.get_pac_fio(PacID);
     end if;
     return res;
   end CHECK_RECIPE_SER_NUM_CAUSE;

   function CHECK_RECIPE_SER_NUM( aCurRECIPE_ID IN NUMBER, aSERIAL IN ASU.TRECIPE.fc_serial%type, aNUM IN ASU.TRECIPE.fn_num%type) RETURN NUMBER
   IS
     res NUMBER;
   begin
     SELECT count(1) into res FROM ASU.TRECIPE r
     WHERE r.fk_id <> nvl(aCurRECIPE_ID, -1)
       and r.fn_num = aNUM
       and upper(r.fc_serial) = upper(aSERIAL)
       and r.FL_DEL = 0;

     return res;
   end CHECK_RECIPE_SER_NUM;
--============================================================================--

   function GET_CHANGE_TYPE_NAME( aCHANGE_TYPE IN NUMBER ) RETURN VARCHAR2 DETERMINISTIC
   IS
   begin
     CASE aCHANGE_TYPE
       WHEN cCHANGE_TYPE_PRINT   THEN return 'Печать';
       WHEN cCHANGE_TYPE_STATUS  THEN return 'Статус';
       WHEN cCHANGE_TYPE_SIGN    THEN return 'Подпись';
       ELSE return '';
     END CASE;
   end GET_CHANGE_TYPE_NAME;

--============================================================================--

   function GET_STATUS_NAME( aFN_STATUS IN NUMBER ) RETURN VARCHAR2 DETERMINISTIC
   IS
   begin
     CASE aFN_STATUS
       WHEN cSTATUS_NAZ               THEN return 'Назначен';
       WHEN cSTATUS_VID               THEN return 'Выдан';
       WHEN cSTATUS_VOZVRAT           THEN return 'Возврат';
       WHEN cSTATUS_UTER              THEN return 'Утерян';
       WHEN cSTATUS_REALIZ            THEN return 'Реализован';
       WHEN cSTATUS_NEVOSTREB         THEN RETURN 'Не востребован';
       WHEN cSTATUS_ZAYAV_VIBRANA     THEN RETURN 'Заявка выбрана';
       WHEN cSTATUS_NA_OTSROCH_OBSLUG THEN RETURN 'На отсроченном обслуживании';
       WHEN cSTATUS_NE_REALIZ         THEN return 'Не реализован';
       ELSE return '';
     END CASE;
   end GET_STATUS_NAME;

--============================================================================--

   function GET_LGOT_TYPE_NAME( aFL_LGOT IN NUMBER ) RETURN VARCHAR2 DETERMINISTIC
   IS
   begin
     CASE aFL_LGOT
       WHEN cLGOT_RECIPE_NORMAL THEN return 'Обычный';
       WHEN cLGOT_RECIPE_LGOT_FED THEN return 'Льготный федеральный';
       WHEN cLGOT_RECIPE_LGOT_REG THEN return 'Льготный региональный';
       ELSE return '';
     END CASE;
   end GET_LGOT_TYPE_NAME;

--============================================================================--

   function INS_RECIPE
     ( aFK_TYPE IN NUMBER,
       aFK_PERCENT IN NUMBER,
       aFK_PAYTYPE IN NUMBER,
       aFK_DURATION IN NUMBER,
       aFL_LGOT IN NUMBER,
       aFK_SOTRID IN NUMBER,
       aFK_VRACH_ID IN NUMBER,
       aFN_NUM IN NUMBER,
       aFC_SERIAL IN asu.trecipe.FC_SERIAL%type,
       aFK_PAC_ID IN NUMBER,
       aFK_PAC_LGOT_CAT IN NUMBER,
       aFK_LGOT_DOC_ID IN NUMBER,
       aFC_SNILS in asu.TRECIPE.FC_SNILS%type,
       aFL_USE_DIAG_PARENT in asu.TRECIPE.FL_USE_DIAG_PARENT%type,
       aFK_OSMOTR_ID in asu.TRECIPE.FK_OSMOTR_ID%type,
       aFK_DIAG  IN NUMBER DEFAULT null,
       aFC_COMMENT IN asu.trecipe.FC_COMMENT%type DEFAULT null,
       aFC_DTD in asu.trecipe.FC_DTD%type default null,
       aFD_DATE IN DATE DEFAULT sysdate,
       aFD_START IN DATE DEFAULT sysdate
       )  RETURN  NUMBER
   IS
     pFK_RECIPE_ID NUMBER;

   BEGIN
     pFK_RECIPE_ID := null;
     INSERT INTO ASU.TRECIPE (fk_type, fk_duration, fk_paytype,
                              fk_percent, fn_num, fc_serial, fl_lgot,
                              fk_sotrid, fk_pac_lgot_cat, fk_pac_id, fd_start, fd_date,
                              fk_vrach_id, fk_lgot_doc_id, fn_print_count, fn_status,
                              FK_DIAG, FC_COMMENT, FL_EDIT, FC_SNILS, FL_USE_DIAG_PARENT, FK_OSMOTR_ID, FC_DTD )
     VALUES(afk_type, afk_duration, afk_paytype,
            afk_percent, afn_num, afc_serial, afl_lgot,
            afk_sotrid, afk_pac_lgot_cat, afk_pac_id, afd_start, trunc( afd_date ),
            afk_vrach_id, afk_lgot_doc_id, 0, cSTATUS_NAZ,
            aFK_DIAG, aFC_COMMENT, 1, aFC_SNILS, aFL_USE_DIAG_PARENT, aFK_OSMOTR_ID, aFC_DTD )
     RETURNING fk_id into pFK_RECIPE_ID;
     Return pFK_RECIPE_ID;
   END INS_RECIPE;

--============================================================================--
-- логирование действий с рецептами
   function INS_RECIPE_CHANGE_HISTORY
     ( afk_recipe_id IN NUMBER,
       afk_sotr      IN NUMBER,
       afn_change_type IN NUMBER,
       afc_description IN ASU.TRECIPE_CHANGE_HISTORY.fc_description%type
--       afd_date      IN DATE DEFAULT NULL --чтобы можно было пользоваться дефолтом в делфях из квери
       )  RETURN  NUMBER
   IS
     pFK_RCH_ID NUMBER;
--     pDate DATE;

   BEGIN
     pFK_RCH_ID := -1;/*
     if afd_date is null then
       pDate := sysdate;
     else
       pDate := afd_date;
     end if;  */

     INSERT INTO ASU.TRECIPE_CHANGE_HISTORY (fk_recipe_id, fd_date, fk_sotr,
                                             fn_change_type, fc_description)
     VALUES(afk_recipe_id, sysdate/*pDate*/, afk_sotr,
            afn_change_type, afc_description)
     RETURNING fk_id into pFK_RCH_ID;
     Return pFK_RCH_ID;
   END INS_RECIPE_CHANGE_HISTORY;

--============================================================================--

   function INS_RECIPE_HISTORY_PRINT
     ( afk_recipe_id IN NUMBER,
       afk_sotr      IN NUMBER,
       afc_description IN ASU.TRECIPE_CHANGE_HISTORY.fc_description%type DEFAULT null
       )  RETURN  NUMBER
   IS
   BEGIN
     Return INS_RECIPE_CHANGE_HISTORY(afk_recipe_id, afk_sotr, cCHANGE_TYPE_PRINT, afc_description);
   END INS_RECIPE_HISTORY_PRINT;

--============================================================================--

   function INS_RECIPE_HISTORY_STATUS
     ( afk_recipe_id IN NUMBER,
       afk_sotr      IN NUMBER,
       afc_description IN ASU.TRECIPE_CHANGE_HISTORY.fc_description%type DEFAULT null
       )  RETURN  NUMBER
   IS
   BEGIN
     Return INS_RECIPE_CHANGE_HISTORY(afk_recipe_id, afk_sotr, cCHANGE_TYPE_STATUS, afc_description);
   END INS_RECIPE_HISTORY_STATUS;

--============================================================================--
   function GET_COUNT_NOT_FILLED_EXP_FIELD( afk_recipe_id IN NUMBER, aFL_LGOT IN NUMBER, aVidRes in smallint default 0 )  RETURN  VARCHAR2
   IS
      N NUMBER;
      vFields varchar2(300 );
    begin
      N := 0;
      vFields := '';

      if not aFL_LGOT in (cLGOT_RECIPE_LGOT_REG, cLGOT_RECIPE_LGOT_FED) then
         return '';
      end if;

      for c in(SELECT a.fk_id, a.mcod, a.ogrn, a.pcod, a.rseries, a.rnumber, a.rdate,
                       a.snils, a.datebirth, a.idsex, a.okato, a.codecateg, a.onls,
                       a.finsource, a.percent, a.mkbdiag, a.mnntrade, a.mnninteg,
                       a.dosageform, a.dosage, a.qty, a.validity, a.global_id,
                       a.pseries, a.pnumber, a.fk_recipe_id, a.fk_lgot_id, a.fk_sp_tov, a.CATEGORYTYPE
                FROM asu.trecipe_dlo_exp a where a.fk_recipe_id = afk_recipe_id AND ROWNUM < 2) loop

        if (c.MCOD is null) then
          N := N + 1;
          vFields := vFields || 'Код медицинского учреждения (MCOD)' || chr(10);
        end if;

        if (c.OGRN is null) then
          N := N + 1;
          vFields := vFields || 'ОГРН медицинского учреждения (OGRN)' || chr(10);
        end if;

        if (c.PCOD is null) then
          N := N + 1;
          vFields := vFields || 'Идентификационный код врача (PCOD)' || chr(10);
        end if;

        if (c.RSERIES is null) then
          N := N - 1;
          vFields := vFields || 'Серия рецепта (RSERIES)' || chr(10);
        end if;

        if (c.RNUMBER is null) then
          N := N + 1;
          vFields := vFields || 'Номер рецепта (RNUMBER)' || chr(10);
        end if;

        if (c.RDATE is null) then
          N := N + 1;
          vFields := vFields || 'Дата выписки рецепта (RDATE)' || chr(10);
        end if;

        if aFL_LGOT = cLGOT_RECIPE_LGOT_REG then
        --         if c.GLOBAL_ID is not null then N := N + 1; end if; -- необязательное поле
        --         if c.PSERIES is not null   then N := N + 1; end if; -- необязательное поле
          if (c.PNUMBER is null) then
            N := N + 1;
            vFields := vFields || 'Номер полиса (PNUMBER)' || chr(10);
          end if;
        elsif aFL_LGOT = cLGOT_RECIPE_LGOT_FED then
          if (c.SNILS is null) then
            N := N + 1;
            vFields := vFields || 'СНИЛС пациента (SNILS)' || chr(10);
          end if;
        end if;

        if (c.DATEBIRTH is null) then
          N := N + 1;
          vFields := vFields || 'Дата рождения пациента (DATEBIRTH)' || chr(10);
        end if;

        if (c.IDSEX is null) then
          N := N + 1;
          vFields := vFields || 'Пол пациента (IDSEX)' || chr(10);
        end if;

        -- загрузить окатов систему проблема
        --if c.OKATO is not null     then N := N - 1; end if;

        if (c.CATEGORYTYPE is null)then
          N := N + 1;
          vFields := vFields || 'Тип категории льготности (CATEGORYTYPE)' || chr(10);
        end if;

        if (c.CODECATEG is null) then
          N := N + 1;
          vFields := vFields || 'Код категории  льготности (CODECATEG)' || chr(10);
        end if;

        -- оказалось необязательным
        --if :aFL_LGOT = cLGOT_RECIPE_LGOT_FED then
        --  if c.ONLS is not null then N := N - 1; end if;
        --end if;

        if (c.FINSOURCE is null) then
          N := N + 1;
          vFields := vFields || 'Источник финансирования (FINSOURCE)' || chr(10);
        end if;

        if (c.PERCENT is null) then
          N := N + 1;
          vFields := vFields || 'Процент льготы рецепта (PERCENT)' || chr(10);
        end if;

        if (c.MKBDIAG is null) then
          N := N + 1;
          vFields := vFields || 'Диагноз заболевания по МКБ-10 (MKBDIAG)' || chr(10);
        end if;

        if (c.MNNTRADE is null) then
          N := N + 1;
          vFields := vFields || 'Торговое наименование выписанного ЛС (MNNTRADE)' || chr(10);
        end if;

        if (c.MNNINTEG is null) then
          N := N + 1;
          vFields := vFields || 'МНН выписанного ЛС (MNNINTEG)' || chr(10);
        end if;

        if (c.DOSAGEFORM is null) then
          N := N + 1;
          vFields := vFields || 'Лекарственная форма ЛС (DOSAGEFORM)' || chr(10);
        end if;

        if (c.DOSAGE is null) then
          N := N + 1;
          vFields := vFields || 'Дозировка ЛС (DOSAGE)' || chr(10);
        end if;

        if (c.QTY is null) then
          N := N + 1;
          vFields := vFields || 'Выписанное количество единиц лекарственной формы ЛС (QTY)' || chr(10);
        end if;

        if aFL_LGOT = cLGOT_RECIPE_LGOT_FED then
          if (c.validity is null) then
            N := N + 1;
            vFields := vFields || 'Срок действия рецепта, дней (VALIDITY)' || chr(10);
          end if;
        end if;
      end loop;

      if (aVidRes = 0) then
        return to_char ( N );
      elsif (aVidRes = 1) then
        return vFields;
      end if;

   END GET_COUNT_NOT_FILLED_EXP_FIELD;
/*
   function GET_COUNT_NOT_FILLED_EXP_FIELD( afk_recipe_id IN NUMBER, aFL_LGOT IN NUMBER )  RETURN  NUMBER
   IS
     N NUMBER;
   BEGIN
     if not aFL_LGOT in (cLGOT_RECIPE_LGOT_REG, cLGOT_RECIPE_LGOT_FED) then
       return null;
     end if;

     if aFL_LGOT = cLGOT_RECIPE_LGOT_REG then
       N := 19; -- 19;
     elsif
       aFL_LGOT = cLGOT_RECIPE_LGOT_FED then
         N := 20;
     end if;

     for c in(SELECT a.fk_id, a.mcod, a.ogrn, a.pcod, a.rseries, a.rnumber, a.rdate,
                     a.snils, a.datebirth, a.idsex, a.okato, a.codecateg, a.onls,
                     a.finsource, a.percent, a.mkbdiag, a.mnntrade, a.mnninteg,
                     a.dosageform, a.dosage, a.qty, a.validity, a.global_id,
                     a.pseries, a.pnumber, a.fk_recipe_id, a.fk_lgot_id, a.fk_sp_tov, a.CATEGORYTYPE
              FROM asu.trecipe_dlo_exp a where a.fk_recipe_id = afk_recipe_id AND ROWNUM < 2) loop

       if c.MCOD is not null    then N := N - 1; end if;
       if c.OGRN is not null    then N := N - 1; end if;
       if c.PCOD is not null    then N := N - 1; end if;
       if c.RSERIES is not null then N := N - 1; end if;
       if c.RNUMBER is not null then N := N - 1; end if;
       if c.RDATE is not null   then N := N - 1; end if;

       if aFL_LGOT = cLGOT_RECIPE_LGOT_REG then
--         if c.GLOBAL_ID is not null then N := N + 1; end if; -- необязательное поле
--         if c.PSERIES is not null   then N := N + 1; end if; -- необязательное поле
         if c.PNUMBER is not null   then N := N - 1; end if;
       elsif
         aFL_LGOT = cLGOT_RECIPE_LGOT_FED then
           if c.SNILS is not null then N := N - 1; end if;
       end if;

       if c.DATEBIRTH is not null then N := N - 1; end if;
       if c.IDSEX is not null     then N := N - 1; end if;
       -- загрузить окатов систему проблема
       --if c.OKATO is not null     then N := N - 1; end if;

       if c.CATEGORYTYPE is not null then N := N - 1; end if;
       if c.CODECATEG is not null then N := N - 1; end if;

       -- оказалось необязательным
       --if aFL_LGOT = cLGOT_RECIPE_LGOT_FED then
       --  if c.ONLS is not null then N := N - 1; end if;
       --end if;

       if c.FINSOURCE is not null  then N := N - 1; end if;
       if c.PERCENT is not null    then N := N - 1; end if;
       if c.MKBDIAG is not null    then N := N - 1; end if;
       if c.MNNTRADE is not null   then N := N - 1; end if;
       if c.MNNINTEG is not null   then N := N - 1; end if;
       if c.DOSAGEFORM is not null then N := N - 1; end if;
       if c.DOSAGE is not null     then N := N - 1; end if;
       if c.QTY is not null        then N := N - 1; end if;

       if aFL_LGOT = cLGOT_RECIPE_LGOT_FED then
         if c.validity is not null then N := N - 1; end if;
       end if;
     end loop;

     return N;
   END GET_COUNT_NOT_FILLED_EXP_FIELD;
*/

--============================================================================--
  function recipe_get_next_number(p_is_lgot NUMBER) return NUMBER
  is
    n integer;
  begin
    if p_is_lgot = cLGOT_RECIPE_NORMAL then
      select to_number(nvl(t.fc_value,'0')) into n
      from tsmini t
      where t.fc_section = 'CONFIG'
        and t.fc_key = 'S_RECIPE_NUMBER_LAST';
    elsif p_is_lgot = cLGOT_RECIPE_LGOT_REG then
      select to_number(nvl(t.fc_value,'0')) into n
      from tsmini t
      where t.fc_section = 'CONFIG'
        and t.fc_key = 'S_RECIPE_NUMBER_LR_LAST';
    elsif p_is_lgot = cLGOT_RECIPE_LGOT_FED then
      select to_number(nvl(t.fc_value,'0')) into n
      from tsmini t
      where t.fc_section = 'CONFIG'
        and t.fc_key = 'S_RECIPE_NUMBER_L_LAST';
    else
      return -1;
    end if;
    return n + 1;
  end;
--============================================================================--
  /*
   * Возвращает серию для рецепта
   *
   * @param p_is_lgot
   *  Признак льготного рецепта.
   * @return
   *  серия рецепта.
   */
--============================================================================--
  function recipe_get_serial(p_is_lgot NUMBER) return varchar2
  is
  begin
    if p_is_lgot = cLGOT_RECIPE_NORMAL then
      return pkg_smini.READSTRING('CONFIG', 'S_RECIPE_SERIAL', 'N/A');
    elsif p_is_lgot = cLGOT_RECIPE_LGOT_REG then
      return pkg_smini.READSTRING('CONFIG', 'S_RECIPE_SERIAL_LR', 'N/A');
    elsif p_is_lgot = cLGOT_RECIPE_LGOT_FED then
      return pkg_smini.READSTRING('CONFIG', 'S_RECIPE_SERIAL_L', 'N/A');
    end if;
    return 'N/A';
  end;
  /*
    Процедура добавлет и обновляет льготы(привелегии) пациентов. Если надо то добавляет паца в TPEOPLES
    pFK_PACTYPEID - 1-федеральный, 2-региональный
  */
  PROCEDURE DO_SET_PEOPLE_LGOT( pFK_PACID IN NUMBER, pFK_PACTYPEID IN number ) is

    vFC_FAM asu.tpeoples.FC_FAM%type;
    vFC_IM asu.tpeoples.FC_IM%type;
    vFC_OTCH asu.TPEOPLES.FC_OTCH%type;
    vFD_ROJD asu.tpeoples.FD_ROJD%type;
    vFC_SNILS asu.tpeoples.FC_SNILS%type;
    vFK_PEOPLEID asu.TPEOPLES.FK_ID%type;
    vFP_SEX asu.TPEOPLES.FP_SEX%type;
    vFK_DOCVID asu.TPEOPLES.FK_DOCVID%type;
    vFC_DOCSER asu.TPEOPLES.FC_DOCSER%type;
    vFC_DOCNUM asu.TPEOPLES.FC_DOCNUM%type;
    vFD_DOCDATE asu.TPEOPLES.FD_DOCDATE%type;
    vFC_UNRZ asu.TPEOPLES.FC_UNRZ%type;
    vFK_OWNERID integer;
    vFED_SMIDID integer;
    vREG_SMIDID integer;
  begin
    vFK_PEOPLEID := -1;
    vFK_OWNERID := -1;
    vFED_SMIDID := asu.GET_SYNID ( 'LD_KATEGOR_LGOT' );
    vREG_SMIDID := asu.GET_SYNID ( 'LD_REGION_LGOTA' ) ;

    if pFK_PACTYPEID = 1 then
      vFK_OWNERID := vFED_SMIDID;
    else
      if pFK_PACTYPEID = 2 then
        vFK_OWNERID := vREG_SMIDID ;
      end if;
    end if;

    begin
      if pFK_PACTYPEID = 1 then
        select p.FAM, p.IM, p.OT, p.DR, p.W, (select EXCH43.PKG_EXCHANGE.GET_OUR_ID('TVIDDOC', 'TVIDDOC', p.C_DOC , (select min(FK_ID)
                                                                                 from EXCH43.TEXCHANGE_COMPANY
                                                                                where UPPER(FC_NAME) =
                                                                                      'ДЛО')) from DUAL),
               null, p.SN_DOC, null, asu.GET_SNILS_3332 (p.SNILS), p.UNRZ
          into vFC_FAM, vFC_IM, vFC_OTCH, vFD_ROJD, vFP_SEX, vFK_DOCVID, vFC_DOCSER, vFC_DOCNUM, vFD_DOCDATE, vFC_SNILS, vFC_UNRZ
          from asu.TRECIPE_DLO_FED_PAC p
        where p.FK_ID = pFK_PACID;
      else
        select t.FAM, t.IMA, t.OTC, t.DR, t.SEX-1,
               (select EXCH43.PKG_EXCHANGE.GET_OUR_ID('TVIDDOC', 'TVIDDOC', t.TIPDOC, (select min(FK_ID)
                                                                                 from EXCH43.TEXCHANGE_COMPANY
                                                                                where UPPER(FC_NAME) =
                                                                                      'ДЛО')) from DUAL),
               t.SERDOC,
               t.NOMDOC,
               t.DATADOC,
               asu.GET_SNILS_3332(t.SNILS)
          into vFC_FAM, vFC_IM, vFC_OTCH, vFD_ROJD, vFP_SEX, vFK_DOCVID, vFC_DOCSER, vFC_DOCNUM, vFD_DOCDATE, vFC_SNILS
          from asu.TRECIPE_DLO_REG_PAC_INFO t
         where t.FK_REGPACID = pFK_PACID and
               t.DATE_B = ( select max(DATE_B) from asu.TRECIPE_DLO_REG_PAC_INFO where FK_REGPACID = pFK_PACID ); -- может быть несколько PAC_INFO
      end if;

    exception
      when NO_DATA_FOUND then
        raise NO_DATA_FOUND;
        return;
    end;

    -- по СНИЛС или ФИО и ДР
    select coalesce (max(p.FK_ID), -1)
      into vFK_PEOPLEID
      from asu.TPEOPLES p
     where ( asu.GET_SNILS_3332 (p.FC_SNILS) = vFC_SNILS ) or
           ( upper (p.fc_fam) = upper (vFC_FAM) and
             upper (p.fc_im) = upper (vFC_IM) and
             upper (nvl( p.fc_otch, 'N/A') ) = upper ( nvl(vFC_OTCH, 'N/A') ) and
             p.FD_ROJD = vFD_ROJD );

    if not ( vFK_PEOPLEID > 0 ) then
     insert into asu.TPEOPLES (FC_FAM, FC_IM, FC_OTCH, FD_ROJD, FP_SEX, FK_DOCVID, FC_DOCSER, FC_DOCNUM, FD_DOCDATE, FC_SNILS, FC_UNRZ)
     values ( vFC_FAM, vFC_IM, vFC_OTCH, vFD_ROJD, vFP_SEX, vFK_DOCVID, vFC_DOCSER, vFC_DOCNUM, vFD_DOCDATE, vFC_SNILS, vFC_UNRZ  )
             returning fk_id into vFK_PEOPLEID;
    else
      update asu.TPEOPLES
         set --FC_SNILS = asu.GET_SNILS_3332(coalesce (vFC_SNILS, FC_SNILS ) ),
             FC_UNRZ = coalesce ( vFC_UNRZ, FC_UNRZ )
       where FK_ID = vFK_PEOPLEID
--         and vFC_SNILS is not null
       --  and asu.GET_SNILS_3332 (FC_SNILS) <> asu.GET_SNILS_3332(vFC_SNILS)
             returning fk_id into vFK_PEOPLEID ;

      update asu.TPEOPLES
         set FC_SNILS = asu.GET_SNILS_3332( vFC_SNILS )
       where FK_ID = vFK_PEOPLEID
         and vFC_SNILS is not null
             returning fk_id into vFK_PEOPLEID ;
    end if;

    -- добавляем льготы пациента
    merge into Asu.TPEOPLE_LGOT pl
    using (  -- загруженные списки
            select k.C_KAT KAT,
                   kl.FK_SMIDID,
                   null as FK_TIPDOCKAT,
                   k.SN_DL as DOCKAT,
                   k.DATE_BL as DATABEG,
                   k.DATE_EL as DATAEND,
                   k.DATE_EL as DATADOCEND,
                   k.MKB,
                   k.NAME_DL as FC_DOC_TYPE
              from asu.TRECIPE_DLO_FED_PAC_CATEG  k
             inner join ( select s.FK_LOINC_CODE,
                                 max( s.FK_ID ) FK_SMIDID
                            from asu.TSMID s
                           where s.FK_LOINC_CODE is not null
                           start with s.FK_OWNER = vFK_OWNERID --asu.GET_SYNID ( 'LD_KATEGOR_LGOT' ) -- 7 нозологий в этой же ветке
                         connect by prior s.FK_ID = s.FK_OWNER
                           group by s.FK_LOINC_CODE ) kl
                on k.C_KAT = kl.FK_LOINC_CODE
             where k.FK_FEDPACID = pFK_PACID
               and vFK_OWNERID = vFED_SMIDID -- фед

            union

            select k.KAT,
                   kl.FK_SMIDID,
                   (select EXCH43.PKG_EXCHANGE.GET_OUR_ID('TVIDDOC', 'TVIDDOC', k.TIPDOCKAT, (select min(FK_ID)
                                                                                       from EXCH43.TEXCHANGE_COMPANY
                                                                                      where UPPER(FC_NAME) =
                                                                                            'ДЛО'))  from DUAL ) FK_TIPDOCKAT,
                   k.DOCKAT,
                   k.DATABEG,
                   k.DATAEND,
                   k.DATADOCEND,
                   k.MKB,
                   null as FC_DOC_TYPE
              from asu.TRECIPE_DLO_PAC_KAT k
             inner join ( select s.FK_LOINC_CODE,
                                 max( s.FK_ID ) FK_SMIDID
                            from asu.TSMID s
                           where s.FK_LOINC_CODE is not null
                           start with s.FK_OWNER = vFK_OWNERID -- asu.GET_SYNID ( 'LD_REGION_LGOTA' ) -- орфаны в этой же ветке
                         connect by prior s.FK_ID = s.FK_OWNER
                           group by s.FK_LOINC_CODE ) kl
                on k.KAT = kl.FK_LOINC_CODE
             where k.FK_REGPACID = pFK_PACID
               and vFK_OWNERID = vREG_SMIDID  -- региональный
    ) kat
    on ( pl.FK_PEOPLEID = vFK_PEOPLEID and pl.FK_SMID = kat.FK_SMIDID)

    when matched then
      update set pl.FC_DOCNAME = coalesce ( asu.GET_SMIDNAME (kat.FK_TIPDOCKAT), kat.FC_DOC_TYPE ) ,
                 pl.FC_SERNUM = kat.DOCKAT,
                 pl.FD_BEGIN = trunc( kat.DATABEG ),
                 pl.FD_END = trunc(kat.DATAEND),
                 pl.FC_ICD10 = kat.MKB,
                 pl.FD_DOC_END = kat.DATADOCEND,
                 pl.FK_DOCKAT = kat.FK_TIPDOCKAT

    when not matched then
      insert ( fk_peopleid, fk_smid, fc_docname, fc_sernum, fd_begin, fd_end, FC_ICD10, fd_doc_end, fk_dockat )
      values ( vFK_PEOPLEID, kat.FK_SMIDID, coalesce ( asu.GET_SMIDNAME (kat.FK_TIPDOCKAT), kat.FC_DOC_TYPE ), kat.DOCKAT,
               trunc( kat.DATABEG ), trunc(kat.DATAEND), kat.MKB, kat.DATADOCEND, kat.FK_TIPDOCKAT ) ;

    insert into ASU.TIB ( fk_pacid, fk_smid, fk_smeditid  )
    select vFK_PEOPLEID,
           kl.FK_SMIDID,
           vFK_OWNERID
      from ( select k.KAT
               from asu.TRECIPE_DLO_PAC_KAT k
              where k.FK_REGPACID = pFK_PACID
                and vFK_OWNERID = vREG_SMIDID
             union all
             select c.C_KAT
               from asu.TRECIPE_DLO_FED_PAC_CATEG c
              where c.FK_FEDPACID = pFK_PACID
                and vFK_OWNERID = vFED_SMIDID ) kat
     inner join ( select s.FK_LOINC_CODE,
                         max( s.FK_ID ) FK_SMIDID
                    from asu.TSMID s
                   where s.FK_OWNER = vFK_OWNERID
                     and s.FK_LOINC_CODE is not null
                   group by s.FK_LOINC_CODE ) kl
        on kat.KAT = kl.FK_LOINC_CODE
      left join ( select tib.FK_SMEDITID
                    from asu.TIB tib
                   where tib.FK_PACID = vFK_PEOPLEID
                     and tib.FK_SMEDITID = vFK_OWNERID
                   group by tib.FK_SMEDITID ) t
        on kl.FK_SMIDID = t.FK_SMEDITID
     where t.FK_SMEDITID is null
     group by kl.FK_SMIDID;
  end;
--============================================================================--
  function DO_INIT_EXP_RECIPE ( pFK_RECIPE_ID in number)  RETURN  number
  is
    vFK_EXP_RECIPE_ID integer;
    vMCOD asu.TRECIPE_DLO_EXP.MCOD%type;
    vOGRN asu.TRECIPE_DLO_EXP.OGRN%type;
    vPCOD asu.TRECIPE_DLO_EXP.PCOD%type;
    vRSERIES asu.TRECIPE_DLO_EXP.RSERIES%type;
    vRNUMBER asu.TRECIPE_DLO_EXP.RNUMBER%type;
    vRDATE asu.TRECIPE_DLO_EXP.RDATE%type;
    vSNILS asu.TRECIPE_DLO_EXP.SNILS%type;
    vDateBirth asu.TRECIPE_DLO_EXP.DATEBIRTH%type;
    vIDSEX asu.TRECIPE_DLO_EXP.IDSEX%type;
    vOKATO asu.TRECIPE_DLO_EXP.OKATO%type;
    vCODECATEG asu.TRECIPE_DLO_EXP.CODECATEG%type;
    vFINSOURCE asu.TRECIPE_DLO_EXP.FINSOURCE%type;
    vPERCENT asu.TRECIPE_DLO_EXP.PERCENT%type;
    vMKBDIAG asu.TRECIPE_DLO_EXP.MKBDIAG%type;
    vMNNTRADE asu.TRECIPE_DLO_EXP.MNNTRADE%type;
    vMNNINTEG asu.TRECIPE_DLO_EXP.MNNINTEG%type;
    vDOSAGEFORM asu.TRECIPE_DLO_EXP.DOSAGEFORM%type;
    vDOSAGE asu.TRECIPE_DLO_EXP.DOSAGE%type;
    vQTY asu.TRECIPE_DLO_EXP.QTY%type;
    vVALIDITY asu.TRECIPE_DLO_EXP.VALIDITY%type;
    vPSERIES asu.TRECIPE_DLO_EXP.PSERIES%type;
    vPNUMBER asu.TRECIPE_DLO_EXP.PNUMBER%type;
    vFK_LGOT_ID asu.TRECIPE_DLO_EXP.FK_LGOT_ID%type;
    vFK_SP_TOV asu.TRECIPE_DLO_EXP.FK_SP_TOV%type;
    vCATEGORYTYPE asu.TRECIPE_DLO_EXP.CATEGORYTYPE%type;
    vONLS asu.TRECIPE_DLO_EXP.ONLS%type;
  begin
    vFK_EXP_RECIPE_ID := -1;
    begin
      select asu.PKG_SMINI.READSTRING ( 'DLO_EXCHANGE', 'LPU_CODE_MIS', '' ),
             asu.pkg_smini.readstring('CONFIG', 'S_OGRN', ''),
             ( select  max( d.PCOD )
                 from asu.TRECIPE_DLO_EXP_DOCTOR d
                where d.FK_SOTR_ID = r.FK_VRACH_ID
                  and d.PCOD is not null ),
             r.fc_serial,
             r.fn_num,
             r.FD_DATE,
             nvl(r.fc_snils, ASU.PKG_BIRTH_CERTIFICATION.GET_CERT_SNILS(ASU.PKG_REGIST_PACFUNC.GET_PEPL_ID(r.fk_pac_id))) as snils,
             amb.fd_rojd,
             DECODE(amb.fp_sex, 1,'М', 0,'Ж', ''),
             (SELECT substr ( k.FC_OKATO, 1, 5 )
                FROM asu.tadress a
               inner join asu.tkladr k
                  on a.fk_kladr = k.fk_id(+)
               where a.fk_pacid = amb.FK_PEPLID
                 and ROWNUM < 2 ),
             categ.FK_LOINC_CODE,
             r.fk_paytype,
             rp.fn_percent,
             diag.FK_MKB10,
             em.c_trn,
             coalesce(rm.FK_LAT_NAME_ID, em.c_mnn), -- vMNNINTEG
             em.c_lf,   -- vDOSAGEFORM
             rm.FC_DOZA||' '||coalesce(ed.name_dls, ed2.name_dls), -- vDOSAGE
             decode(rm.FN_KOL, 0,null, rm.FN_KOL), -- vQTY
             rd.FN_KOL_DLIT,    -- vVALIDITY
             asu.pkg_dlo.GET_POLIS ( amb.FK_PEPLID, 1 ) , -- vPSERIES
             asu.pkg_dlo.GET_POLIS ( amb.FK_PEPLID, 2 ), -- vPNUMBER
             r.FK_PAC_LGOT_CAT, -- vFK_LGOT_ID
             rm.fk_rus_name_id, -- vFK_SP_TOV
             decode (  categ.FK_OWNER, asu.GET_SYNID ('LD_KATEGOR_LGOT'), 1,
                                       asu.GET_SYNID ('LD_REGION_LGOTA'), 2,
                                       asu.GET_SYNID ('LD_7NOZOLOGY_LGOT'), 3,
                                       asu.GET_SYNID ('LD_ORPHAN_LGOT'), 4,
                                       null ), -- vCATEGORYTYPE
             decode (  categ.FK_OWNER, asu.GET_SYNID ('LD_KATEGOR_LGOT'), 0, -- ДЛО+Субъект
                                       asu.GET_SYNID ('LD_REGION_LGOTA'), 0, -- ВЗН
                                       asu.GET_SYNID ('LD_7NOZOLOGY_LGOT'), 1, -- РЛО
                                       asu.GET_SYNID ('LD_ORPHAN_LGOT'), 2, -- Орфанные
                                       null ) -- vONLS
        into vMCOD,
             vOGRN,
             vPCOD,
             vRSERIES,
             vRNUMBER,
             vRDATE,
             vSNILS,
             vDateBirth,
             vIDSEX,
             vOKATO,
             vCODECATEG,
             vFINSOURCE,
             vPERCENT,
             vMKBDIAG,
             vMNNTRADE,
             vMNNINTEG,
             vDOSAGEFORM,
             vDOSAGE,
             vQTY,
             vVALIDITY,
             vPSERIES,
             vPNUMBER,
             vFK_LGOT_ID,
             vFK_SP_TOV,
             vCATEGORYTYPE,
             vONLS

        from asu.TRECIPE r
       inner join ASU.TAMBULANCE amb
          on r.fk_pac_id = amb.fk_id
        left join asu.TSMID categ
          on r.FK_PAC_LGOT_CAT = categ.FK_ID
        left join ASU.TRECIPEPERCENT RP
          on r.fk_percent = rp.fk_id
        left join asu.TSMID diag
          on r.FK_DIAG = diag.FK_ID
        left join asu.TRECIPE_MEDIC rm
          on r.FK_ID = rm.FK_RECIPE_ID
        left join  asu.trecipe_dlo_exp_medics em
          on rm.fk_rus_name_id = em.nomk_ls
         and r.FK_PAYTYPE = em.C_FINL
         and r.FL_LGOT in ( asu.PKG_DLO.GET_cLGOT_RECIPE_LGOT_REG, asu.PKG_DLO.GET_cLGOT_RECIPE_LGOT_FED )
        left join asu.trecipe_dlo_exp_doza ed
          on rm.FK_DOZA_EI_ID = ed.c_dls
         and r.FK_PAYTYPE = ed.C_FINL
         and r.FL_LGOT in ( asu.PKG_DLO.GET_cLGOT_RECIPE_LGOT_REG, asu.PKG_DLO.GET_cLGOT_RECIPE_LGOT_FED )
        left join asu.trecipe_dlo_exp_doza ed2
          on em.C_DLS = ed2.c_dls
         and em.C_FINL = ed2.C_FINL
         and r.FL_LGOT in ( asu.PKG_DLO.GET_cLGOT_RECIPE_LGOT_REG, asu.PKG_DLO.GET_cLGOT_RECIPE_LGOT_FED )
        left join asu.trecipeduration rd
          on r.FK_DURATION = rd.FK_ID
        left join ( SELECT pi.FK_PACID, id.FC_SER as FC_OMS_SER, id.FC_NUM AS FC_OMS_NUM
                      FROM ASU.TPAC_INSURANCE pi
                     inner join ASU.TINSURDOCS id
                        on id.FK_ID = pi.FK_INSURDOCID ) POLIS1
          on r.fk_pac_id = polis1.FK_PACID
        left join ( select i.fk_peplid, i.FC_SER as FC_OMS_SER, i.FC_NUM AS FC_OMS_NUM
                      FROM asu.tinsurance i  ) POLIS2
          on amb.FK_PEPLID    = polis2.fk_peplid
       where r.FK_ID = pFK_RECIPE_ID;
    exception
      when NO_DATA_FOUND then
        return -1;
    end; --  рецепт не найден

    begin
      select re.FK_ID
        into vFK_EXP_RECIPE_ID
        from asu.TRECIPE_DLO_EXP re
       where re.FK_RECIPE_ID = pFK_RECIPE_ID;
    exception
      when NO_DATA_FOUND then
        vFK_EXP_RECIPE_ID := -1;
    end;

    if (vFK_EXP_RECIPE_ID > 0 ) then
      update asu.TRECIPE_DLO_EXP
         set MCOD = vMCOD, OGRN = vOGRN, PCOD = vPCOD, RSERIES = vRSERIES, RNUMBER = vRNUMBER, RDATE = vRDATE,
             SNILS = vSNILS, DATEBIRTH = vDATEBIRTH, IDSEX = vIDSEX, OKATO = vOKATO, CODECATEG = vCODECATEG,
             FINSOURCE = vFINSOURCE, PERCENT = vPERCENT, MKBDIAG = vMKBDIAG, MNNTRADE = vMNNTRADE,
             MNNINTEG = vMNNINTEG, DOSAGEFORM = vDOSAGEFORM, DOSAGE = vDOSAGE, QTY = vQTY,
             VALIDITY = vVALIDITY, PSERIES = vPSERIES, PNUMBER = vPNUMBER, FK_LGOT_ID = vFK_LGOT_ID,
             FK_SP_TOV = vFK_SP_TOV, CATEGORYTYPE = vCATEGORYTYPE,
             ONLS = coalesce ( ONLS, vONLS ) -- заполняем значением по умолчанию, если пустое
       where FK_ID = vFK_EXP_RECIPE_ID
      returning FK_ID into vFK_EXP_RECIPE_ID;
    else
      insert into asu.TRECIPE_DLO_EXP ( MCOD, OGRN, PCOD, RSERIES, RNUMBER, RDATE, SNILS, DATEBIRTH, IDSEX, OKATO,
        CODECATEG, FINSOURCE, PERCENT, MKBDIAG, MNNTRADE, MNNINTEG, DOSAGEFORM, DOSAGE, QTY, VALIDITY, PSERIES, PNUMBER, FK_LGOT_ID,
        FK_SP_TOV, CATEGORYTYPE, ONLS, FK_RECIPE_ID )
      values ( vMCOD, vOGRN, vPCOD, vRSERIES, vRNUMBER, vRDATE, vSNILS, vDATEBIRTH, vIDSEX, vOKATO,
        vCODECATEG, vFINSOURCE, vPERCENT, vMKBDIAG, vMNNTRADE, vMNNINTEG, vDOSAGEFORM, vDOSAGE, vQTY, vVALIDITY,  vPSERIES, vPNUMBER, vFK_LGOT_ID,
        vFK_SP_TOV, vCATEGORYTYPE, vONLS, pFK_RECIPE_ID )
      returning FK_ID into vFK_EXP_RECIPE_ID;
    end if;

    return vFK_EXP_RECIPE_ID;
  end;

  function GET_POLIS ( pFK_PEOPLEID in number, pVid in integer default 0 ) return varchar2
  /* pVid =
    0 - серия + номер
    1 - серия
    2 - номер
  */
  is
    vFC_SER varchar2 (100);
    vFC_NUM varchar2 (100);
    vFC_ENP varchar2 (100);
    vRes varchar2 (200) := ' ';
  begin
    select t.FC_SER,
           t.FC_NUM,
           t.FC_ENP
      into vFC_SER,
           vFC_NUM,
           vFC_ENP
      from ( select coalesce ( t.FC_SER, ' ') as  FC_SER,
                    coalesce ( t.FC_NUM , ' ' ) as FC_NUM,
                    t.FC_ENP
               from TINSURDOCS t
              inner join asu.TTYPEDOC td
                 on t.FK_TYPEDOCID = td.FK_ID
              where t.FK_PEPLID = pFK_PEOPLEID
    --           and ( select r.FD_DATE from asu.TRECIPE r where r.FK_ID = :pFK_RECIPEID ) between trunc (t.FD_BEGIN) and trunc ( coalesce( t.FD_END, SYSDATE ) )
                and upper ( td.FC_SYNONIM ) = 'OMS'
              order by coalesce( t.FD_END, SYSDATE ) desc, t.FD_BEGIN desc ) t
     where Rownum = 1;

    if (pVid = 0) then
      vRes := coalesce (vFC_ENP, coalesce( vFC_SER, ' ') || ' ' || coalesce ( vFC_NUM , ' ' )) ;
    elsif (pVid = 1) then
      vRes := vFC_SER;
    elsif (pVid = 2) then
      vRes := vFC_NUM;
    end if;

    vRes := trim ( vRes );
    return vRes;
  end;

  procedure DO_INC_PRINT_COUNT ( pFK_RECIPE_ID in number, pFK_SOTR_ID in number ) is
  pragma autonomous_transaction;
   vFN_PRINT_COUNT asu.trecipe.FN_PRINT_COUNT%type;
   vId number;
  begin
    select coalesce ( r.FN_PRINT_COUNT, 0 )
      into vFN_PRINT_COUNT
      from asu.TRECIPE r
     where r.FK_ID = pFK_RECIPE_ID;

    update asu.TRECIPE
       set FN_PRINT_COUNT = vFN_PRINT_COUNT + 1
     where FK_ID = pFK_RECIPE_ID;

    vId := asu.PKG_DLO.INS_RECIPE_HISTORY_PRINT ( pFK_RECIPE_ID, pFK_SOTR_ID, 'Кол-во распечатано: '||to_char(vFN_PRINT_COUNT)||' => '||to_char(vFN_PRINT_COUNT+1) ) ;
    commit;
  end;

  procedure DO_MERGE_LATINNAM_EXPMEDICS
  is
  begin
    merge into med.TLATIN_NAMES ln
    using ( select m.NOMK_LS,
                       max( m.NAME_MED ) NAME_MED
                  from ASU.TRECIPE_DLO_EXP_MEDICS m
                group by m.NOMK_LS ) m
       on ( ln.FK_DLO_EXP_MEDIC = m.NOMK_LS )
    when matched then
      update set ln.FL_DEL = 0
    when not matched then
      insert ( FC_NAME, FL_DEL, FK_MEDICID, FK_DLO_EXP_MEDIC  )
      values ( m.NAME_MED, 0, -1, m.NOMK_LS );
  end;


END;
/

SHOW ERRORS;


