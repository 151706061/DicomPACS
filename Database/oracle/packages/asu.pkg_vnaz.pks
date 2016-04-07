DROP PACKAGE ASU.PKG_VNAZ
/

--
-- PKG_VNAZ  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_VNAZ" IS
--
   PROCEDURE DO_INSERT_VNAZ
   (
       PSMID       IN       NUMBER,
      PDRUN        IN       DATE,
      PKABINETID   IN       NUMBER,
      PVRACHID     IN       NUMBER,
      PISPOLID     IN       NUMBER,
      PPACID       IN       NUMBER,
      PPLAT        IN       NUMBER,
      pFK_ID       IN OUT   NUMBER,
      PREMARK      IN       VARCHAR2
   );
   PROCEDURE DO_DELETE_VNAZ( PID IN NUMBER );
   PROCEDURE DO_INSERT_TNAZPARAM
   (
       pFK_ID    IN OUT   NUMBER,
      PNAZID     IN       NUMBER,
      PPARAMID   IN       NUMBER,
      PKVALUE    IN       NUMBER,
      PNVALUE    IN       NUMBER,
      PCVALUE    IN       VARCHAR2
   );
   PROCEDURE DO_WRITE_TLECHSHABLON
   (
       pFK_ID    IN OUT   NUMBER,
      PPARAMID   IN       NUMBER,
      PVRACHID   IN       NUMBER,
      PNAME      IN       VARCHAR2,
      PCVALUE    IN       VARCHAR2,
      PDEFAULT   IN       NUMBER
   );
   FUNCTION GET_PROC_PARAM_VALUE( PNAZID IN NUMBER )
      RETURN VARCHAR2;
   FUNCTION GET_TARGET( pREMARK IN VARCHAR2 )
      RETURN VARCHAR2;

   FUNCTION GET_PROC_PARAM_NAME( PID IN NUMBER )
      RETURN VARCHAR2;
   PROCEDURE DO_INSERT_SHABLON
   (
       PKNAMEID  IN   NUMBER,
      PPARAMID   IN   NUMBER,
      PKVALUE    IN   NUMBER,
      PNVALUE    IN   NUMBER,
      PCVALUE    IN   VARCHAR2
   );
   PROCEDURE DO_INSERT_SHABLONNAME
   (
       PID       IN OUT   NUMBER,
      PSMID      IN       NUMBER,
      PCNAME     IN       VARCHAR2,
      PVRACHID   IN       NUMBER
   );
   FUNCTION GET_PROC_VIP_COUNT( PID IN NUMBER )
      RETURN NUMBER;
   FUNCTION GET_PROC_FULL_COUNT( PID IN NUMBER )
      RETURN NUMBER;
END;                                                                        --
/

SHOW ERRORS;


