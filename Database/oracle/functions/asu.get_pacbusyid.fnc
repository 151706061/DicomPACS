DROP FUNCTION ASU.GET_PACBUSYID
/

--
-- GET_PACBUSYID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TGRAPH (Table)
--   TPACLST (Table)
--   TRASPIS (Table)
--   TSMID (Table)
--   GET_NEVIP (Function)
--   TNAZVRACH (View)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACBUSYID" (pfk_pacid IN NUMBER, pfk_graphid IN NUMBER)
   RETURN NUMBER
IS
/***************************************************************************************************************************************/
   m_min       NUMBER := 0.0;                                                --Куда хотят
   m_hour      NUMBER := 0.0;                                                --Куда хотят
   d_main      DATE;                                                --На какую дату хотят
   l_min       NUMBER := 0.0;                                              --Где уже есть
   l_hour      NUMBER := 0.0;                                              --Где уже есть
   nsotr       NUMBER := 0.0;                                                 --Сотрудник
   nroom       NUMBER := 0.0;                                                   --Комната
   nlen        NUMBER := 0.0;                   --Продолжительность той, которая уже есть
   ngraph_id   NUMBER := 0.0;

/***************************************************************************************************************************************/
   CURSOR c1 (pgraphid NUMBER)
   IS
      SELECT fd_date, ft_hour, ft_min
        FROM tgraph
       WHERE fk_id = pgraphid;

   CURSOR c2 (ppacid NUMBER, pdate DATE)
   IS
      SELECT tgraph.ft_hour t_hour, tgraph.ft_min t_min, tgraph.fk_id
        FROM tpaclst, tgraph
       WHERE fk_pacid = ppacid
         AND TRUNC (tgraph.fd_date) = TRUNC (pdate)
         AND tpaclst.fk_graphid = tgraph.fk_id;

   CURSOR c3 (pgraphid NUMBER)
   IS
      SELECT fk_sotrid, fk_kabinetid
        FROM tnazvrach
       WHERE fk_id = (SELECT fk_nazvrachid
                        FROM traspis
                       WHERE fk_graphid = (SELECT fk_raspid
                                             FROM tgraph
                                            WHERE fk_id = pgraphid));

   CURSOR c4 (ppacid NUMBER, psotr NUMBER, proom NUMBER)
   IS
      SELECT TO_NUMBER (fc_time)
        FROM tsmid
       WHERE fk_id =
                (SELECT fk_smid
                   FROM vnaz
                  WHERE fk_pacid = ppacid
                    AND fk_roomid = proom
                    AND fk_ispolid = psotr
                    AND fk_nazsosid = get_nevip
                    AND fl_in_raspis = 0);
/***************************************************************************************************************************************/
BEGIN
/***************************************************************************************************************************************/
/*                                            OPEN CURSORS AND ANALIZE ON CONTAING DATA                                                */
/***************************************************************************************************************************************/
   OPEN c1 (pfk_graphid);

   FETCH c1
    INTO d_main, m_hour, m_min;

   IF c1%NOTFOUND
   THEN
      CLOSE c1;

      RETURN -1;
   END IF;

   CLOSE c1;

   OPEN c2 (pfk_pacid, d_main);

   LOOP
      FETCH c2
       INTO l_hour, l_min, ngraph_id;

      IF c2%NOTFOUND
      THEN
         CLOSE c2;

         RETURN -2;
      END IF;

      IF (l_hour = m_hour AND l_min = m_min)
      THEN
         CLOSE c2;

         RETURN 1;
      ELSE
         OPEN c3 (ngraph_id);

         FETCH c3
          INTO nsotr, nroom;

         IF c3%NOTFOUND
         THEN
            CLOSE c3;

            CLOSE c2;

            RETURN -3;
         END IF;

         OPEN c4 (pfk_pacid, nsotr, nroom);

         FETCH c4
          INTO nlen;

         IF c4%NOTFOUND
         THEN
            CLOSE c4;

            CLOSE c3;

            CLOSE c2;

            RETURN -4;
         END IF;

         CLOSE c4;

         CLOSE c3;
      --  asdadASDF ASD FAS ASDF ASF ASDF ASD
      END IF;
   END LOOP;

   CLOSE c2;

   RETURN 0;
END;
/

SHOW ERRORS;


