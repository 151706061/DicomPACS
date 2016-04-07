DROP PACKAGE ASU.PKGASKREPLY
/

--
-- PKGASKREPLY  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.PkgAskReply IS
  -- Efimov V.A. 20110812 Пакет для работы с универсальными соответствиями

  -- Добавить значение в лог ненайденных ответов, pOWNER и pOWNERFIELD - таблица, при фотмироваии которой ведётся поиск ответа, и поле в ней, это не обязательные поля
  FUNCTION AddToAskReplyElseLog(pREPLY      IN VARCHAR2,
                                pREPLYFIELD IN VARCHAR2,
                                pASK        IN VARCHAR2,
                                pASKFIELD   IN VARCHAR2,
                                pASKID      IN VARCHAR2,
                                pOWNER      IN VARCHAR2 default null,
                                pOWNERFIELD IN VARCHAR2 default null,
                                pOWNERID    IN VARCHAR2 default null,
                                pOWNERFILL  IN VARCHAR2 default null) RETURN VARCHAR2;

  -- получить значение таблицы-ответа по таблице-вопросу (всегда одно)
  FUNCTION GetReply(pREPLY      IN VARCHAR2,
                    pREPLYFIELD IN VARCHAR2,
                    pASK        IN VARCHAR2,
                    pASKFIELD   IN VARCHAR2,
                    pASKID      IN VARCHAR2) RETURN VARCHAR2;

  -- получить значение таблицы-ответа по таблице-вопросу (всегда одно)
  FUNCTION GetReply_ElseLog(pREPLY      IN VARCHAR2,
                            pREPLYFIELD IN VARCHAR2,
                            pASK        IN VARCHAR2,
                            pASKFIELD   IN VARCHAR2,
                            pASKID      IN VARCHAR2,
                            pOWNER      IN VARCHAR2 default null,
                            pOWNERFIELD IN VARCHAR2 default null,
                            pOWNERID    IN VARCHAR2 default null,
                            pOWNERFILL  IN VARCHAR2 default null) RETURN VARCHAR2;

  -- получить последнее сопоставленное значение таблице-вопроса по таблице-ответу (может быть больше одного)
  FUNCTION GetLastAsk(pASK        IN VARCHAR2,
                      pASKFIELD   IN VARCHAR2,
                      pREPLY      IN VARCHAR2,
                      pREPLYFIELD IN VARCHAR2,
                      pREPLYID    IN VARCHAR2) RETURN VARCHAR2;
END PkgAskReply;
/

SHOW ERRORS;


