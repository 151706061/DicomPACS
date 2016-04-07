CREATE OR REPLACE FUNCTION ISMEDNAZ_CONTAIN_SPECIALMEDIC(pnazid IN NUMBER) RETURN NUMBER IS
 -- Created 19122007 by A.Nakorjakov 
 -- Функция определяет есть ли среди назначенных в рамках назначения медикаментов специальный медикамент (наркотик, яд)
 -- возвращает 1 - среди назначенных в рамках назначения медикаментов есть специальный медикамент
 --            0 - среди назначенных в рамках назначения медикаментов нет специальных медикаментов
 cursor cISSPEC(ppnazid Number) is
        SELECT SUM(DECODE(NVL(MS.MEDICID, 0), 0, 0, 1)) AS FL_SPEC
        FROM TNAZMED     N,
             TNAZMEDLECH L,
             MED.TMEDIC_TSPECIALMEDIC MS
        WHERE N.FK_ID = L.FK_NAZMEDID
             AND L.FK_MEDICID = MS.MEDICID(+)
             AND N.FK_ID = ppnazid; 
 
 pRes NUMBER;
 pSum NUMBER;
BEGIN
 open cISSPEC(pnazid);
   fetch cISSPEC into pSum;
 close cISSPEC;
 
 if pSum > 0 then
    pRes := 1; --в назначении есть специальные препараты
 else
    pRes := 0; --в назначении нет специальных препаратов
 end if;
 RETURN pRes;
END;
/
EXIT
/