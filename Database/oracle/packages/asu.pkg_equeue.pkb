DROP PACKAGE BODY ASU.PKG_EQUEUE
/

--
-- PKG_EQUEUE  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.pkg_equeue is

  -- справочник типов очереди
  function QueueTypeList return sys_refcursor is
    result sys_refcursor;
  begin
    open result for
      select t.fk_id,
             t.fc_name,
             t.fc_letter,
             t.fn_process,
             t.fn_absence,
             to_char(t.ft_begin, 'hh24:mi') as fbegin,
             to_char(t.ft_end, 'hh24:mi') as fend,
             t.fl_enabled,
             decode(t.fl_enabled, 0, 'нет', 1, 'да') as enabled
        from ts_queuetype t
       order by t.fc_letter;
    return result;
  end;

  -- добавление типа очереди
  procedure AddQueueType(pName    in varchar2,
                         pLetter  in char,
                         pProcess in number,
                         pAbsence in number,
                         pBegin   in date,
                         pEnd     in date) is
    pragma autonomous_transaction;
  begin
    insert into ts_queuetype
      (fc_name, fc_letter, fn_process, fn_absence, ft_begin, ft_end)
    values
      (pName, pLetter, pProcess, pAbsence, pBegin, pEnd);
    commit;
  end;

  -- редактирование типа очереди
  procedure EditQueueType(pID      in number,
                          pName    in varchar2,
                          pLetter  in char,
                          pProcess in number,
                          pAbsence in number,
                          pBegin   in date,
                          pEnd     in date,
                          pEnabled in number default null) is
    pragma autonomous_transaction;
  begin
    if pEnabled is not null then
      update ts_queuetype t set t.fl_enabled = pEnabled;
    else
      update ts_queuetype t
         set t.fc_name    = pName,
             t.fc_letter  = pLetter,
             t.fn_process = pProcess,
             t.fn_absence = pAbsence,
             t.ft_begin   = pBegin,
             t.ft_end     = pEnd
       where t.fk_id = pID;
    end if;
    commit;
  end;

  -- удаление типа очереди
  procedure DelQueueType(pID in number) is
    pragma autonomous_transaction;
  begin
    delete from ts_queuetype where fk_id = pID;
    commit;
  end;

  -- список букв для типов очереди
  function LettersList(pid in number default -1) return sys_refcursor is
    result sys_refcursor;
  begin
    open result for
      select rownum, letter
        from (select chr(191 + level) as letter
                from dual
               where level not in (7, 8, 10)
              connect by level < 19
              minus (select fc_letter from ts_queuetype where fk_id <> pid));
    return result;
  end;

  -- включение/выключение очереди
  procedure ActivateQueue(pid in number, penabled in number) is
    pragma autonomous_transaction;
  begin
    update ts_queuetype set fl_enabled = penabled where fk_id = pid;
    commit;
  end;

  -- добавить окно регистратуры
  procedure AddQueueWindow(pname in varchar2) is
    pragma autonomous_transaction;
  begin
    insert into ts_queuewindows (fc_name) values (pname);
    commit;
  end;

  -- редактировать окно регистратуры
  procedure EditQueueWindow(pid in number, pname in varchar2) is
    pragma autonomous_transaction;
  begin
    update ts_queuewindows set fc_name = pname where fk_id = pid;
    commit;
  end;

  -- список номеров окон
  function GetWindowList(pid in number default -1) return sys_refcursor is
    res sys_refcursor;
  begin
    open res for
      select rownum, winnum
        from (select to_char(rownum) as winnum
                from dual
              connect by level < 31
              minus
              select t.fc_name from ts_queuewindows t where t.fk_id <> pid)
       order by to_number(winnum);
    return res;
  end;

  -- удалить окно регистратуры
  procedure DelQueueWindow(pid in number) is
    pragma autonomous_transaction;
  begin
    delete ts_queuewindows where fk_id = pid;
    commit;
  end;

  -- включить/выключить окно регистратуры
  procedure ActivateWindow(pid in number, penabled in number) is
    pragma autonomous_transaction;
  begin
    update ts_queuewindows set fl_enabled = penabled where fk_id = pid;
    commit;
  end;

  -- буква очереди по id
  function GetLetterByType(pqueuetype in number) return char is
    res char(1);
  begin
    select t.fc_letter
      into res
      from ts_queuetype t
     where t.fk_id = pqueuetype;
    return(res);
  end;

  -- список окон регистратуры для справочника
  function QueueWindowsList return sys_refcursor is
    result sys_refcursor;
  begin
    open result for
      select t.*, decode(t.fl_enabled, 1, 'да', 0, 'нет') as fenabled
        from ts_queuewindows t
       order by t.fc_name;
    return result;
  end;

  -- список включенных окон регистратуры
  function QueueWindowsList(pAct in number) return sys_refcursor is
    result sys_refcursor;
  begin
    open result for
      select t.fk_id, t.fc_name, t.fl_paused
        from ts_queuewindows t
       where t.fl_enabled = pAct
       order by t.fc_name;
    return result;
  end;

  -- выдача талона
  function AddTalon(pqueuetype   in number,
                    pPacID       in number,
                    ptalon       out varchar2,
                    ptimewait    out varchar2,
                    ptimeprocess out varchar2,
                    ptimeprint   out varchar2) return varchar2 is
    cursor cNTalon is
      select pkg_equeue.GetLetterByType(pqueuetype) ||
             to_char(decode(t.ntalon, null, 1, t.ntalon + 1)) as talon
        from (select max(to_number(substr(q.fc_talon, 2, length(q.fc_talon)))) as ntalon
                from tequeue q, ts_queuetype qt
               where q.fk_equeuetype = qt.fk_id
                 and qt.fk_id = pqueuetype
                 and trunc(q.fd_date) = trunc(sysdate)) t;

    cursor cTime is
      select decode(trunc(t.chel / nvl(w.wind, 1)) * tm.fn_process,
                    0,
                    tm.fn_process,
                    trunc(t.chel / nvl(w.wind, 1)) * tm.fn_process) as ftime,
             tm.ft_begin,
             tm.ft_end
        from (select count(1) as chel
                from tequeue q
               where q.fk_equeuetype = pqueuetype
                 and fl_process is null
                 and trunc(q.fd_date) = trunc(sysdate)) t,

             (select t.fn_process, t.ft_begin, t.ft_end
                from ts_queuetype t
               where t.fk_id = pqueuetype) tm,

             (select sum(1) as wind
                from ts_queuewindows qw, tqueuewtype qwt
               where qw.fk_id = qwt.fk_window
                 and qwt.fk_queuetype = pqueuetype
                 and qw.fl_enabled = 1
                 and qw.fl_paused = 0) w;
    ntime   number;
    ddate   date;
    nhour   number;
    nminute number;
    dbegin  date;
    dend    date;
    pragma autonomous_transaction;
  begin
    ddate := sysdate;

    open cTime;
    fetch cTime
      into ntime, dbegin, dend;
    close cTime;

    nhour   := trunc(ntime / (60 * 60));
    nminute := trunc((ntime - nhour * (60 * 60)) / 60);
    /* if (ceil(nminute) > 59) then
      nminute := trunc(nminute);
    else
      nminute := ceil(nminute);
    end if;*/

    ptimewait := to_char(nhour) || 'ч ' || to_char(nminute) || 'мин';

    ptimeprocess := to_char(ddate + (ntime / (24 * 60 * 60)),
                            'dd.mm.rrrr hh24:mi');
    ptimeprint := ' ' || to_char(ddate, 'dd.mm.rrrr hh24:mi:ss');

    if dbegin is not null then
      if ddate < to_date(to_char(ddate, 'dd.mm.rrrr') ||
                         to_char(dbegin, ' hh24:mi'),
                         'dd.mm.rrrr hh24:mi') then
        return('Прием начинается с ' || to_char(dbegin, 'hh24:mi'));
      end if;
    end if;

    if dend is not null then
      if to_char(sysdate, 'dd.mm.rrrr hh24:mi') > to_char(ddate, 'dd.mm.rrrr') || to_char(dend, ' hh24:mi') then
        return('Прием закончился в ' || to_char(dend, 'hh24:mi'));
      elsif ptimeprocess >
            to_char(ddate, 'dd.mm.rrrr') || to_char(dend, ' hh24:mi') then
        return('К сожалению на данный момент очередь заполнена!');
      end if;
    end if;

    open cNTalon;
    fetch cNTalon
      into ptalon;
    close cNTalon;

    insert into tequeue
      (fd_date, fc_talon, fk_equeuetype, ft_plan, fk_pacid)
    values
      (ddate,
       ptalon,
       pqueuetype,
       to_date(ptimeprocess, 'dd.mm.yyyy hh24:mi'),
       pPacID);
    commit;
    return 1; -- если все прошло очень даже неплохо, то возвращаем 1
  end;

  -- активна ли очередь
  function GetQueueEnabled(pqueuetype in number) return number is
    res number;
  begin
    select t.fl_enabled
      into res
      from ts_queuetype t
     where t.fk_id = pqueuetype;
    return res;
  end;

  -- очередь
  function GetQueueList(pWindow in number) return sys_refcursor is
    result sys_refcursor;
  begin
    open result for
      select t.*,
             qt.fc_name,
             to_char(t.ft_plan, 'hh24:mi') as plantime,
             qt.fn_absence,
             qt.fn_process,
             asu.pkg_regist_pacfunc.GET_PAC_FULLFIO(t.fk_pacid) as fio
        from tequeue t, ts_queuetype qt, tqueuewtype qwt
       where t.fk_equeuetype = qt.fk_id
         and trunc(t.fd_date) = trunc(sysdate)
         and t.fk_window is null
         and qwt.fk_queuetype = qt.fk_id
         and qwt.fk_window = pWindow
       order by t.fd_date;
    return result;
  end;

  -- обработаны
  function GetProcessedList(pWindow in number) return sys_refcursor is
    result sys_refcursor;
  begin
    open result for
      select t.*,
             qt.fc_name,
             to_char(t.fd_calldate, 'hh24:mi') as calltime,
             qt.fn_absence,
             qt.fn_process,
             decode(t.fl_process, 0, 'Обработан', 1, 'Не явился', 'В обработке') as fprocresult,
             asu.pkg_regist_pacfunc.GET_PAC_FULLFIO(t.fk_pacid) as fio
        from tequeue t, ts_queuetype qt, tqueuewtype qwt
       where t.fk_equeuetype = qt.fk_id
         and trunc(t.fd_date) = trunc(sysdate)
         --and t.fk_window is null
         and qwt.fk_queuetype = qt.fk_id
         and qwt.fk_window = pWindow
         and t.fd_calldate is not null
       order by t.fd_calldate desc;
    return result;
  end;

  -- типы очереди, выбраннные для окна
  function GetTypewWindow(pWindow in number) return sys_refcursor is
    result sys_refcursor;
  begin
    open result for
      with qt as
       (select * from ts_queuetype where fl_enabled = 1)
      select fc_name,
             decode(fk_window, null, 0, 1) as checked,
             qt.fk_id as queuetype
        from qt
        left join tqueuewtype qwt
          on qwt.fk_queuetype = qt.fk_id
         and fk_window = pWindow
       order by fc_name;
    return result;
  end;

  -- редактирование списка очередей для окна
  procedure EditTypewWindow(pQueueType in number,
                            pWindow    in number,
                            pAct       in number) is
    pragma autonomous_transaction;
  begin
    if pAct = 0 then
      insert into tqueuewtype
        (fk_queuetype, fk_window)
      values
        (pQueueType, pWindow);
    end if;
    if pAct = 1 then
      delete from tqueuewtype t
       where t.fk_queuetype = pQueueType
         and t.fk_window = pWindow;
    end if;
    commit;
  end;

  -- обработка очереди
  function ProcessQueue(pid          in number,
                        pWindow      in number,
                        pPause       in number,
                        pProcessType in number,
                        pSotrID      in number) return number is
    /*
        pProcessType
        0 - вызван следующий номер или поставлена пауза(то есть окончание обработки текущего);
        1 - поставлена неявка.
    */
    cursor cCriticalSection is
      select t.fk_window from tequeue t where t.fk_id = pid for update;

    cursor cDoubleWindow is
      select t.fk_window
        from tequeue t
       where t.fk_window = pWindow
         and t.fk_sotrid <> pSotrID
         and t.fl_process is null
         and trunc(t.fd_date) = trunc(sysdate);

    cursor cNextNum is
      select min(t.ft_plan), min(t.fk_id) as fk_id
        from tequeue t, ts_queuetype qt, tqueuewtype qwt
       where t.fk_equeuetype = qt.fk_id
         and trunc(t.fd_date) = trunc(sysdate)
         and t.fk_window is null
         and qwt.fk_queuetype = qt.fk_id
         and qwt.fk_window = pWindow;

    cursor cSay is
      select t.fk_window from tqueueview t where t.fk_window = pWindow;

    lwinid   number;
    lptalon  tequeue.fc_talon%type;
    lpwindow ts_queuewindows.fc_name%type;
    lpid     number;
    lpdate   date;
    res      number := -1;
    /*
        (-1) - все ОК
        0 - очередь пуста
        id - если текущего забрало другое окно и на обработку взяли следующего пацика
    */
    pragma autonomous_transaction;
  begin
    open cCriticalSection; -- накладываем Lock на таблицу
    fetch cCriticalSection
      into lwinid;

    open cDoubleWindow;
    fetch cDoubleWindow
      into lpid;
    if cDoubleWindow%notfound then

      update tequeue t -- закрываем все необработанные позиции за сегодня
         set t.fl_process = pProcessType, t.fd_processdate = sysdate
       where t.fk_window = pWindow
         and t.fl_process is null
         and trunc(t.fd_date) = trunc(sysdate);
      if pPause = 1 then
        -- ставим окно на паузу
        update ts_queuewindows t
           set t.fl_paused = 1
         where t.fk_id = pWindow;
      else
        update ts_queuewindows t
           set t.fl_paused = 0
         where t.fk_id = pWindow;
        if (lwinid is null and pid <> 0) then
          -- берем в обработку
          update tequeue t
             set t.fd_calldate = sysdate,
                 t.fk_window   = pWindow,
                 t.fk_sotrid   = pSotrID
           where t.fk_id = pid;

          select t.fc_talon, qw.fc_name
            into lptalon, lpwindow
            from tequeue t, ts_queuewindows qw
           where t.fk_window = qw.fk_id
             and t.fk_id = pid;

          open cSay; -- записываем инфу для болталки/отображалки
          fetch cSay
            into lpid;
          if cSay%notfound then
            insert into tqueueview
              (fc_talon, fk_window, fc_window, fl_say, fd_date)
            values
              (lptalon, pWindow, lpwindow, 1, sysdate);
          else
            update tqueueview t
               set t.fc_talon  = lptalon,
                   t.fc_window = lpwindow,
                   t.fl_say    = 1,
                   t.fd_date   = sysdate
             where t.fk_window = pWindow;
          end if;
          close cSay;
        else
          -- если его забрало другое окно -> ищем следующего
          open cNextNum;
          fetch cNextNum
            into lpdate, lpid;
          close cNextNum;
          if lpid is null then
            -- если следующего нет, то сообщаем об этом
            begin
              res := 0;
            end;
          else
            -- если следующий найден, то сообщаем его ID - будет рекурсия
            res := lpid;
          end if;
        end if;
      end if;
    else
      res := -2;
    end if;
    close cDoubleWindow;
    close cCriticalSection; -- снимаем Lock с таблицы
    commit;
    return res;
  end;

  -- список для панели
  function GetPanelList return sys_refcursor is
    res sys_refcursor;
  begin
    -- спец для хант, для процедурного кабинета
    /*open res for
      select tt.*, rownum as fc_window
        from (select t.fc_talon
                from tequeue t
               where trunc(t.fd_calldate) = trunc(sysdate)
               order by t.fd_calldate desc, t.fk_id desc) tt
       where rownum < 4;*/
    open res for
    select tt.fc_window, t.fc_talon
      from tqueueview tt,
           (select t.fc_talon, t.fk_window
              from tqueueview t
             where trunc(t.fd_date) = trunc(sysdate)) t
     where t.fk_window(+) = tt.fk_window
     order by tt.fc_window;
    return res;
  end;

  -- че сказать-то?
  function GetWhatSay(pTal out varchar2, pWin out varchar2) return number is
    cursor cWhatSay is
      select t.fc_talon, t.fc_window, t.fk_window
        from tqueueview t
       where t.fl_say = 1
       order by t.fd_date;

    res number;
    pragma autonomous_transaction;
  begin
    open cWhatSay;
    fetch cWhatSay
      into pTal, pWin, res;
    if cWhatSay%notfound then
      res := 0;
    else
      update tqueueview t set t.fl_say = 0 where t.fk_window = res;
    end if;
    close cWhatSay;
    commit;
    return res;
  end;

  -- записать че сказать
  procedure Repeat(pWindow in number) is
    pragma autonomous_transaction;
  begin
    update tqueueview t set t.fl_say = 1 where t.fk_window = pWindow;
    commit;
  end;
end pkg_equeue;
/

SHOW ERRORS;


