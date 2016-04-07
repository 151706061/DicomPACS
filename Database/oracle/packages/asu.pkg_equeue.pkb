DROP PACKAGE BODY ASU.PKG_EQUEUE
/

--
-- PKG_EQUEUE  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.pkg_equeue is

  -- ���������� ����� �������
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
             decode(t.fl_enabled, 0, '���', 1, '��') as enabled
        from ts_queuetype t
       order by t.fc_letter;
    return result;
  end;

  -- ���������� ���� �������
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

  -- �������������� ���� �������
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

  -- �������� ���� �������
  procedure DelQueueType(pID in number) is
    pragma autonomous_transaction;
  begin
    delete from ts_queuetype where fk_id = pID;
    commit;
  end;

  -- ������ ���� ��� ����� �������
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

  -- ���������/���������� �������
  procedure ActivateQueue(pid in number, penabled in number) is
    pragma autonomous_transaction;
  begin
    update ts_queuetype set fl_enabled = penabled where fk_id = pid;
    commit;
  end;

  -- �������� ���� ������������
  procedure AddQueueWindow(pname in varchar2) is
    pragma autonomous_transaction;
  begin
    insert into ts_queuewindows (fc_name) values (pname);
    commit;
  end;

  -- ������������� ���� ������������
  procedure EditQueueWindow(pid in number, pname in varchar2) is
    pragma autonomous_transaction;
  begin
    update ts_queuewindows set fc_name = pname where fk_id = pid;
    commit;
  end;

  -- ������ ������� ����
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

  -- ������� ���� ������������
  procedure DelQueueWindow(pid in number) is
    pragma autonomous_transaction;
  begin
    delete ts_queuewindows where fk_id = pid;
    commit;
  end;

  -- ��������/��������� ���� ������������
  procedure ActivateWindow(pid in number, penabled in number) is
    pragma autonomous_transaction;
  begin
    update ts_queuewindows set fl_enabled = penabled where fk_id = pid;
    commit;
  end;

  -- ����� ������� �� id
  function GetLetterByType(pqueuetype in number) return char is
    res char(1);
  begin
    select t.fc_letter
      into res
      from ts_queuetype t
     where t.fk_id = pqueuetype;
    return(res);
  end;

  -- ������ ���� ������������ ��� �����������
  function QueueWindowsList return sys_refcursor is
    result sys_refcursor;
  begin
    open result for
      select t.*, decode(t.fl_enabled, 1, '��', 0, '���') as fenabled
        from ts_queuewindows t
       order by t.fc_name;
    return result;
  end;

  -- ������ ���������� ���� ������������
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

  -- ������ ������
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

    ptimewait := to_char(nhour) || '� ' || to_char(nminute) || '���';

    ptimeprocess := to_char(ddate + (ntime / (24 * 60 * 60)),
                            'dd.mm.rrrr hh24:mi');
    ptimeprint := ' ' || to_char(ddate, 'dd.mm.rrrr hh24:mi:ss');

    if dbegin is not null then
      if ddate < to_date(to_char(ddate, 'dd.mm.rrrr') ||
                         to_char(dbegin, ' hh24:mi'),
                         'dd.mm.rrrr hh24:mi') then
        return('����� ���������� � ' || to_char(dbegin, 'hh24:mi'));
      end if;
    end if;

    if dend is not null then
      if to_char(sysdate, 'dd.mm.rrrr hh24:mi') > to_char(ddate, 'dd.mm.rrrr') || to_char(dend, ' hh24:mi') then
        return('����� ���������� � ' || to_char(dend, 'hh24:mi'));
      elsif ptimeprocess >
            to_char(ddate, 'dd.mm.rrrr') || to_char(dend, ' hh24:mi') then
        return('� ��������� �� ������ ������ ������� ���������!');
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
    return 1; -- ���� ��� ������ ����� ���� �������, �� ���������� 1
  end;

  -- ������� �� �������
  function GetQueueEnabled(pqueuetype in number) return number is
    res number;
  begin
    select t.fl_enabled
      into res
      from ts_queuetype t
     where t.fk_id = pqueuetype;
    return res;
  end;

  -- �������
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

  -- ����������
  function GetProcessedList(pWindow in number) return sys_refcursor is
    result sys_refcursor;
  begin
    open result for
      select t.*,
             qt.fc_name,
             to_char(t.fd_calldate, 'hh24:mi') as calltime,
             qt.fn_absence,
             qt.fn_process,
             decode(t.fl_process, 0, '���������', 1, '�� ������', '� ���������') as fprocresult,
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

  -- ���� �������, ���������� ��� ����
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

  -- �������������� ������ �������� ��� ����
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

  -- ��������� �������
  function ProcessQueue(pid          in number,
                        pWindow      in number,
                        pPause       in number,
                        pProcessType in number,
                        pSotrID      in number) return number is
    /*
        pProcessType
        0 - ������ ��������� ����� ��� ���������� �����(�� ���� ��������� ��������� ��������);
        1 - ���������� ������.
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
        (-1) - ��� ��
        0 - ������� �����
        id - ���� �������� ������� ������ ���� � �� ��������� ����� ���������� ������
    */
    pragma autonomous_transaction;
  begin
    open cCriticalSection; -- ����������� Lock �� �������
    fetch cCriticalSection
      into lwinid;

    open cDoubleWindow;
    fetch cDoubleWindow
      into lpid;
    if cDoubleWindow%notfound then

      update tequeue t -- ��������� ��� �������������� ������� �� �������
         set t.fl_process = pProcessType, t.fd_processdate = sysdate
       where t.fk_window = pWindow
         and t.fl_process is null
         and trunc(t.fd_date) = trunc(sysdate);
      if pPause = 1 then
        -- ������ ���� �� �����
        update ts_queuewindows t
           set t.fl_paused = 1
         where t.fk_id = pWindow;
      else
        update ts_queuewindows t
           set t.fl_paused = 0
         where t.fk_id = pWindow;
        if (lwinid is null and pid <> 0) then
          -- ����� � ���������
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

          open cSay; -- ���������� ���� ��� ��������/�����������
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
          -- ���� ��� ������� ������ ���� -> ���� ����������
          open cNextNum;
          fetch cNextNum
            into lpdate, lpid;
          close cNextNum;
          if lpid is null then
            -- ���� ���������� ���, �� �������� �� ����
            begin
              res := 0;
            end;
          else
            -- ���� ��������� ������, �� �������� ��� ID - ����� ��������
            res := lpid;
          end if;
        end if;
      end if;
    else
      res := -2;
    end if;
    close cDoubleWindow;
    close cCriticalSection; -- ������� Lock � �������
    commit;
    return res;
  end;

  -- ������ ��� ������
  function GetPanelList return sys_refcursor is
    res sys_refcursor;
  begin
    -- ���� ��� ����, ��� ������������ ��������
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

  -- �� �������-��?
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

  -- �������� �� �������
  procedure Repeat(pWindow in number) is
    pragma autonomous_transaction;
  begin
    update tqueueview t set t.fl_say = 1 where t.fk_window = pWindow;
    commit;
  end;
end pkg_equeue;
/

SHOW ERRORS;


