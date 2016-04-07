DROP PACKAGE ASU.PKG_OPERACIONIST
/

--
-- PKG_OPERACIONIST  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_OPERACIONIST" 
  IS

  --возвращает ID место хранения по синониму
  function Get_BloodPackBoxID(pSyn Varchar2) return Number;
  --возвращает ID операции по синониму
  function Get_BloodOper(pSyn Varchar2) return Number;
  --Создать пакеты - спутники для назначения - функция проверяет созданы ли уже пакеты
  procedure CreateSputniks(nNazOwner Number, nPacID Number);
  --результат назначения
  function Get_NazResult(ptype Varchar2, pFnRes Number, pFnRes2 Number, pFcRes Varchar2, pComType Varchar2) return Varchar2;
  --удалить пакет и назначения
  procedure DeleteSputnikAndNaz(nNazOwner Number, pLabSyn in Varchar2,pBloodPackBoxSyn in Varchar2);
  --отмена создания пакета с операцией pBloodOper в фракционисте
  procedure Cancel_Frackcionist_Pack(pFromPack number,pBloodOper Varchar2);
END; -- Package spec
/

SHOW ERRORS;


