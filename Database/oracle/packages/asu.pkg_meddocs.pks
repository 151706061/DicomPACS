DROP PACKAGE ASU.PKG_MEDDOCS
/

--
-- PKG_MEDDOCS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_MEDDOCS" 
  IS
-- Purpose: Составление жокументов для отчетов по медикаментозным назначения
--
-- MODIFICATION HISTORY
-- Mikrom      21.04.2002    Create
-- ---------   ------  ------------------------------------------
  --Переменная содержащая пустую строка в THML документе
  null_str VARCHAR2(1000):='<![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p>';
  page_break VARCHAR2(10000):='<span lang=EN-US style=''font-size:12.0pt;font-family:"Times New Roman";'||
                                'mso-fareast-font-family:"Times New Roman";mso-ansi-language:EN-US;mso-fareast-language:'||
                                'RU;mso-bidi-language:AR-SA''><br clear=all style=''mso-special-character:line-break;'||
                                'page-break-before:always''></span>';
  end_page VARCHAR2(10000):='<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p></div></body></html>';
  --Лист назначений врача за период
  FUNCTION rep_Vrach_Naz_List (psotr_id IN NUMBER, pDATE1 IN DATE, pDATE2 IN DATE, pmode IN NUMBER DEFAULT 0) RETURN CLOB;
  FUNCTION replist_Vrach_Naz_List(pDATE1 IN DATE, pDATE2 IN DATE) RETURN CLOB;
  PROCEDURE build;
  FUNCTION rep_proc_done(pkabinet IN NUMBER, pDATE1 IN DATE, pDATE2 IN DATE) RETURN CLOB;
  procedure build_kablist;
  function get_kabispol(pkab in number) return varchar2  ;
END; -- Package spec
/

SHOW ERRORS;


