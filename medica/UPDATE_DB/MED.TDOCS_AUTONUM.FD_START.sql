-- Add/modify columns 
alter table MED.TDOCS_AUTONUM modify FD_START default trunc(SYSDATE);