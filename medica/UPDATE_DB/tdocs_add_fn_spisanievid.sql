alter table med.tdocs add fn_spisanievid NUMBER(10) default 0;
COMMENT ON COLUMN Med.Tdocs.FN_spisanievid is 'Вид списания: 1 - обычное (истек срок годности, недостача), 2 - списание на отделение (ASU.TOTDEL), 3 - списание на пациента (). По этому полю определеяем на какую таблицу ссылается поле motoid';
