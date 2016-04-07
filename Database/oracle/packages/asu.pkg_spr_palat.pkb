DROP PACKAGE BODY ASU.PKG_SPR_PALAT
/

--
-- PKG_SPR_PALAT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_SPR_PALAT" IS
  PROCEDURE DO_WRITE_TIPROOM(
    pFK_ID        IN  OUT NUMBER
   ,pFK_PALATAID  IN  NUMBER
   ,pFN_MESTA     IN  NUMBER
   ,pFK_VIDID     IN  NUMBER
   ,pFD_DATA1     IN  DATE) IS
    CURSOR cTemp(pID NUMBER, pPalataID NUMBER) IS
      SELECT FD_DATA1, FK_MAXID
        FROM TSRTIPROOM
            ,(SELECT/*+ rule*/
                 MAX(FK_ID) FK_MAXID
                FROM TSRTIPROOM
               WHERE FK_PALATAID = pPalataID
                 AND (   (    FK_ID < pID
                          AND pID IS NOT NULL)
                      OR pID IS NULL
                      OR pID = 0))
       WHERE FK_ID = FK_MAXID;
    CURSOR cCheck(pID NUMBER) IS
      SELECT FK_ID
        FROM TSRTIPROOM
       WHERE FK_ID = pID;
    d        DATE;
    nPrevID  NUMBER;
  BEGIN
    OPEN cTemp(pFK_ID, pFK_PALATAID);
    FETCH cTemp INTO d, nPrevID;
    CLOSE cTemp;
    IF d IS NOT NULL THEN
      IF d >= pFD_DATA1 THEN
        raise_application_error(-20028, 'Новая дата изменения данных не может быть меньше предыдущей!');
      ELSE
        UPDATE TSRTIPROOM
           SET FD_DATA2 = pFD_DATA1 - 1
         WHERE FK_ID = nPrevID;
      END IF;
    END IF;
    OPEN cCheck(pFK_ID);
    FETCH cCheck INTO nPrevID;
    IF cCheck%NOTFOUND THEN
      INSERT INTO TSRTIPROOM
                  (FK_ID, FN_MESTA, FD_DATA1, FK_PALATAID, FK_VIDID)
           VALUES(-1, pFN_MESTA, pFD_DATA1, pFK_PALATAID, pFK_VIDID) RETURNING FK_ID INTO pFK_ID;
    ELSE
      UPDATE TSRTIPROOM
         SET FN_MESTA = pFN_MESTA
            ,FK_VIDID = pFK_VIDID
            ,FD_DATA1 = pFD_DATA1
            ,FD_DATA2 = NULL
       WHERE FK_ID = pFK_ID;
    END IF;
    CLOSE cCheck;
  END;-- Procedure
  PROCEDURE DO_DELETE_TIPROOM(pFK_ID IN NUMBER) IS
    CURSOR c(pID NUMBER) IS
      SELECT FK_PALATAID
        FROM TSRTIPROOM
       WHERE FK_ID = pID;
    nROOM  NUMBER;
  BEGIN
    OPEN c(pFK_ID);
    FETCH c INTO nRoom;
    CLOSE c;
    DELETE
      FROM TSRTIPROOM
     WHERE FK_ID = pFK_ID;
    UPDATE TSRTIPROOM
       SET FD_DATA2 = NULL
     WHERE FK_ID =(SELECT MAX(FK_ID)
                     FROM TSRTIPROOM
                    WHERE FK_PALATAID = nRoom);
  END;
  PROCEDURE DO_WRITE_PALATA(
    pFK_ID       IN  NUMBER
   ,pFK_KORPID       IN  NUMBER
   ,pFC_PALATA   IN  VARCHAR2
   ,pFN_FLOOR    IN  NUMBER
   ,pFC_OPIS     IN  VARCHAR2
   ,pFK_VRACHID  IN  NUMBER) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    IF pFC_PALATA IS NULL THEN
      raise_application_error(-20030, 'Не введено название палаты!');
    END IF;
    IF pFN_FLOOR <= 0 THEN
      raise_application_error(-20031, 'Не введен номер этажа!');
    END IF;
/*    IF pFK_VRACHID <= 0 THEN
      raise_application_error(-20032, 'Не введен закрепленный врач!');
    END IF;*/
    UPDATE TROOM
       SET FC_PALATA = pFC_PALATA
          ,FN_FLOOR = pFN_FLOOR
          ,FC_OPIS = pFC_OPIS
          ,FK_VRACHID = pFK_VRACHID
          ,FK_KORPID=pFK_KORPID
     WHERE FK_ID = pFK_ID;
    COMMIT;
  END;-- Procedure
  PROCEDURE GET_PALATA_INFO(
    pFK_ID       IN OUT  NUMBER
   ,pFC_PALATA   OUT     VARCHAR2
   ,pFN_FLOOR    OUT     NUMBER
   ,pFC_OPIS     OUT     VARCHAR2
   ,pFK_VRACHID  OUT     NUMBER) IS
    CURSOR c(pID NUMBER) IS
      SELECT FC_PALATA, FN_FLOOR, FC_OPIS, FK_VRACHID
        FROM TROOM
       WHERE FK_ID = pID;
  BEGIN
    OPEN c(pFK_ID);
    FETCH c INTO pFC_PALATA, pFN_FLOOR, pFC_OPIS, pFK_VRACHID;
    IF c%NOTFOUND THEN
      INSERT INTO TROOM
                  (FK_ID)
           VALUES(-1)
        RETURNING FK_ID, FC_PALATA, FN_FLOOR, FC_OPIS, FK_VRACHID INTO pFK_ID, pFC_PALATA, pFN_FLOOR, pFC_OPIS, pFK_VRACHID;
    END IF;
    CLOSE c;
  END;
  PROCEDURE DO_DELETE(pFC_FIELD IN VARCHAR2, pFC_TABLE IN VARCHAR2, pFK_VALUE IN NUMBER) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
    str  VARCHAR2(255);
  BEGIN
    str := 'DELETE FROM ' || pFC_TABLE || ' WHERE ' || pFC_FIELD || '=:pFK_ID';
    EXECUTE IMMEDIATE str USING pFK_VALUE;
    COMMIT;
  END;
  PROCEDURE DO_UPDATE(
    pFC_TABLE  IN  VARCHAR2
   ,pFC_FIELD  IN  VARCHAR2
   ,pFC_VALUE  IN  VARCHAR2
   ,pFK_ID     IN  VARCHAR2
   ,pFK_VALUE  IN  NUMBER) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
    str  VARCHAR2(255);
  BEGIN
    str := 'UPDATE ' || pFC_TABLE || ' SET ' || pFC_FIELD || ' = :pFC_VALUE WHERE ' || pFK_ID || ' =:pFK_VALUE ';
    EXECUTE IMMEDIATE str USING pFC_VALUE, pFK_VALUE;
    COMMIT;
  END;
  PROCEDURE DO_INSERT(
    pFC_TABLE  IN  VARCHAR2
   ,pFC_FIELD  IN  VARCHAR2
   ,pFC_VALUE  IN  VARCHAR2
   ,pFK_ID     IN  VARCHAR2
   ,pFK_VALUE  IN  NUMBER) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
    str  VARCHAR2(255);
  BEGIN
    str := 'INSERT INTO ' || pFC_TABLE;
    IF pFK_ID IS NOT NULL THEN
      str := str || '(' || pFK_ID || ',' || pFC_FIELD || ') VALUES (:pFK_VALUE,:pFC_VALUE)';
      EXECUTE IMMEDIATE str USING pFK_VALUE, pFC_VALUE;
    ELSE
      str := str || '(' || pFC_FIELD || ') VALUES (:pFC_VALUE)';
      EXECUTE IMMEDIATE str USING pFC_VALUE;
    END IF;
    COMMIT;
  END;
  PROCEDURE DO_WRITE_KORP(pFK_ID IN OUT NUMBER, pFC_NAME IN VARCHAR2, pFN_FLOOR IN NUMBER) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
    CURSOR c(pID NUMBER) IS
      SELECT FK_ID
        FROM TKORP
       WHERE FK_ID = pID;
  BEGIN
    OPEN c(pFK_ID);
    FETCH c INTO pFK_ID;
    IF c%NOTFOUND THEN
      INSERT INTO TKORP
                  (FK_ID, FC_NAME, FN_FLOOR)
           VALUES(pFK_ID, pFC_NAME, pFN_FLOOR)
        RETURNING FK_ID
        INTO pFK_ID;
    ELSE
      UPDATE TKORP
         SET FC_NAME = pFC_NAME
            ,FN_FLOOR = pFN_FLOOR
       WHERE FK_ID = pFK_ID;
    END IF;
    CLOSE c;
    COMMIT;
  END;
END;-- Package Body PKG_SPR_PALAT
/

SHOW ERRORS;


