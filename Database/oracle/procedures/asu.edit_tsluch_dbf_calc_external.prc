DROP PROCEDURE ASU.EDIT_TSLUCH_DBF_CALC_EXTERNAL
/

--
-- EDIT_TSLUCH_DBF_CALC_EXTERNAL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE PROCEDURE ASU.EDIT_TSLUCH_DBF_CALC_EXTERNAL(pBeg DATE, pEnd DATE, pAddUnExSluch NUMBER, pAddSluchByYear NUMBER default 1,
                                                         pSluchType NUMBER default 0,
                                                         pUseStorage integer default 0,
                                                         pUseTDBFEXCH_TYPE_V_MU integer default 1) IS
-- Efimov V.A. ������� ��������� ��� ������� ������� �������� ����� ������ ������� ��������� ������ ����������� �������
-- ������� ������� � ����� � ������� http://192.168.1.9/redmine/issues/25135
-- ����� ��������� ���������:
-- "�������� � �������� ������ �� ���.���������������, ������� ������ �� ����������. E:\MEDOTRADE\Efimov\25062\���������������� �� ����������.html
--  ���������������� ������.html, �������� ������ ������, � ������� � ������� FC_ERR ������� ������ ��� ������ ���������� �� RSA, USA ��� UGE."
-- ���������� ������ �������� ���������� ������ ����� ������� �������, ��� ���� ����������� ��� ������ ������ �� ����� ������� � ������ � ������� 2013��.
-- � ����� �� ��������� ����, � ��� �� �������� ��, ��� ��� �� ������ ������� ������ ����, ������ ������� ������� �������,
-- ������� �������� ��� ������� ������� �������� ���� ������� ������������ tsluch_dbf_calc �� ������ ������������ ������ ������ ASU.PKG_FOMS_UPLOAD
  vEmptyProc Number;
begin
  select 1 into vEmptyProc from dual;
/* ���� ��������� ��� ���� � ������ ������ https://srvotrs2.loc/redmine/issues/25135, �������������� ������ ��� �������� �� �������� 2013
    insert into asu.TSLUCH_DBF_CALC (id_ill, p_id_ill, fl_fromstor, fd_date1, fd_date2, fc_icd, fk_pacid, fl_poly,
                                     PR_OWN, FC_CODE, FN_COST, FK_KOYKAVIDID, FK_PALATAID, FK_REGIONID, FC_TYPEDOC_SYN, FK_USLVIDID,
                                     fc_ser, fc_num, fk_companyid, fc_ogrn,
                                     fk_peplid, FK_INSURDOCID, fk_typeoms, fl_under18, fl_isds, fl_first, fk_otdelid, fk_smid)
    select t.fk_id id_ill, max(t.p_id_ill) p_id_ill, 0 fl_fromstor, max(t.fd_opened) fd_date1, max(t.fd_closed) fd_date2, null fc_icd, t.fk_id fk_pacid, 1 fl_poly,
           null PR_OWN, null FC_CODE, null FN_COST, null FK_KOYKAVIDID, null FK_PALATAID, null FK_REGIONID, null FC_TYPEDOC_SYN, null FK_USLVIDID,
           null fc_ser, null fc_num, null fk_companyid, null fc_ogrn,
           null fk_peplid, null FK_INSURDOCID, null fk_typeoms, null fl_under18, null fl_isds, null fl_first, null fk_otdelid, null fk_smid
      from (SELECT t.FK_ID, t.fd_opened, t.fd_closed, NULL p_id_ill
              FROM asu.TAMBTALON t
             INNER JOIN asu_tmp.tdisp_exch e ON e.id_ill = t.fk_id
              left join asu.TSLUCH_DBF_CALC c on c.id_ill = t.fk_id
             WHERE T.FN_SOS = 1
               and c.id_ill is null
               AND ( e.ar_id_ill IS NULL OR (e.ar_id_ill IS NOT NULL AND (e.fc_err LIKE '%RSA%' OR e.fc_err LIKE '%USA%' OR e.fc_err LIKE '%UGE%')) )
           ) t group by t.fk_id;
*/
end;
/

SHOW ERRORS;


