DROP PACKAGE ASU.PKG_TRANSFUSION
/

--
-- PKG_TRANSFUSION  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_TRANSFUSION" IS

 FUNCTION CREATE_PACK(pfd_begin         DATE,
                      pfd_end           DATE,
                      pfk_naz           NUMBER,
                      pfk_mbp           NUMBER,
                      pfc_number        VARCHAR2,
                      pfn_konservamount NUMBER DEFAULT NULL,
                      pfp_autodonor     NUMBER DEFAULT 0) RETURN NUMBER;
 PROCEDURE UPDATE_PACK_INFO(pfk_id        NUMBER,
                            pfd_begin     DATE,
                            pfd_end       DATE,
                            pfk_naz       NUMBER,
                            pfk_mbp       NUMBER,
                            pfc_number    VARCHAR2,
                            pfp_autodonor NUMBER DEFAULT 0);
 PROCEDURE DELETE_PACK(pfk_id NUMBER);
 PROCEDURE USE_PACK(pfk_id NUMBER);
 FUNCTION MOVE_PACK(pfk_pack NUMBER,
                    pfk_from NUMBER,
                    pfk_to   NUMBER,
                    pfd_date DATE DEFAULT SYSDATE) RETURN NUMBER;
 PROCEDURE CANCEL_MOVE_PACK(pfk_id NUMBER);
 FUNCTION CREATE_BOX(pfk_owner NUMBER, pfc_name VARCHAR2, pfn_count NUMBER) RETURN NUMBER;
 PROCEDURE DELETE_BOX(pfk_id NUMBER);
 PROCEDURE UPDATE_BOX(pfk_id NUMBER, pfk_owner NUMBER, pfc_name VARCHAR2, pfn_count NUMBER);
 FUNCTION CREATE_BLOOD(pfk_topack  NUMBER,
                       pfn_tocount NUMBER,
                       pfk_oper    NUMBER,
                       pfd_date    DATE DEFAULT SYSDATE) RETURN NUMBER;
 FUNCTION MOVE_BLOOD(pfk_frompack  NUMBER,
                     pfk_fromcount NUMBER,
                     pfk_topack    NUMBER,
                     pfn_tocount   NUMBER,
                     pfk_oper      NUMBER,
                     pfd_date      DATE DEFAULT SYSDATE) RETURN NUMBER;
 PROCEDURE CANCEL_MOVE_BLOOD(pfk_id NUMBER);
 FUNCTION CREATE_OPER(pfc_name         VARCHAR2,
                      pfk_frommaterial NUMBER,
                      pfk_tomaterial   NUMBER,
                      pfk_group        NUMBER) RETURN NUMBER;
 PROCEDURE DELETE_OPER(pfk_id NUMBER);
 FUNCTION CREATE_OPERGROUP(pfc_name VARCHAR2) RETURN NUMBER;
 PROCEDURE DELETE_OPERGROUP(pfk_id NUMBER);
 FUNCTION GET_PACKMASS(pfk_id NUMBER, pfd_date DATE DEFAULT SYSDATE) RETURN NUMBER;

END PKG_TRANSFUSION;
/

SHOW ERRORS;


