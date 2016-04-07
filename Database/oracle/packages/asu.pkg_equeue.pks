DROP PACKAGE ASU.PKG_EQUEUE
/

--
-- PKG_EQUEUE  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.pkg_equeue is

  -- Author  : Serjant
  -- Created : 02.03.2012 13:35:57
  -- Purpose : все необходимое для работы с электронной очередью

  pPanelListState number; -- 0 - если все неизменно,
  -- 1 - если список для панели изменился;

  -- справочник типов очереди
  function QueueTypeList return sys_refcursor;

  -- добавление типа очереди
  procedure AddQueueType(pName    in varchar2,
                         pLetter  in char,
                         pProcess in number,
                         pAbsence in number,
                         pBegin   in date,
                         pEnd     in date);

  -- редактирование типа очереди
  procedure EditQueueType(pID      in number,
                          pName    in varchar2,
                          pLetter  in char,
                          pProcess in number,
                          pAbsence in number,
                          pBegin   in date,
                          pEnd     in date,
                          pEnabled in number default null);

  -- удаление типа очереди
  procedure DelQueueType(pID in number);

  -- список букв для типов очереди
  function LettersList(pid in number default -1) return sys_refcursor;

  -- автивация/деактивация очереди
  procedure ActivateQueue(pid in number, penabled in number);

  -- добавить окно регистратуры
  procedure AddQueueWindow(pname in varchar2);

  -- редактировать окно регистратуры
  procedure EditQueueWindow(pid in number, pname in varchar2);

  -- список номеров окон
  function GetWindowList(pid in number default -1) return sys_refcursor;

  -- удалить окно регистратуры
  procedure DelQueueWindow(pid in number);

  -- включить/выключить окно регистратуры
  procedure ActivateWindow(pid in number, penabled in number);

  -- список окон регистратуры
  function QueueWindowsList return sys_refcursor;

  -- список активных окон регистратуры
  function QueueWindowsList(pAct in number) return sys_refcursor;

  -- выдача талона
  function AddTalon(pqueuetype   in number,
                    pPacID       in number,
                    ptalon       out varchar2,
                    ptimewait    out varchar2,
                    ptimeprocess out varchar2,
                    ptimeprint   out varchar2) return varchar2;

  -- буква очереди по id
  function GetLetterByType(pqueuetype in number) return char;

  -- активна ли очередь
  function GetQueueEnabled(pqueuetype in number) return number;

  -- очередь
  function GetQueueList(pWindow in number) return sys_refcursor;

  -- обработаны
  function GetProcessedList(pWindow in number) return sys_refcursor;

  -- типы очереди, выбраннные для окна
  function GetTypewWindow(pWindow in number) return sys_refcursor;

  -- редактирование списка очередей для окна
  procedure EditTypewWindow(pQueueType in number,
                            pWindow    in number,
                            pAct       in number);

  -- обработка очереди
  function ProcessQueue(pid          in number,
                        pWindow      in number,
                        pPause       in number,
                        pProcessType in number,
                        pSotrID      in number) return number;

  -- список для панели
  function GetPanelList return sys_refcursor;

  -- че сказать-то?
  function GetWhatSay(pTal out varchar2, pWin out varchar2) return number;

  -- записать че сказать
  procedure Repeat(pWindow in number);

end pkg_equeue;
/

SHOW ERRORS;


