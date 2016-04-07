DROP FUNCTION ASU.SEND_MAIL
/

--
-- SEND_MAIL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   UTL_SMTP (Synonym)
--   UTL_TCP (Synonym)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION ASU."SEND_MAIL" ( Recipient IN varchar) RETURN  NUMBER IS
  c utl_smtp.connection;

  PROCEDURE send_header(name IN VARCHAR2, header IN VARCHAR2) AS
  BEGIN
    utl_smtp.write_data(c, name || ': ' || header || utl_tcp.CRLF);
   END;

BEGIN
   c := utl_smtp.open_connection('anapa.com.ru');
   utl_smtp.helo(c, 'foo.com');
   utl_smtp.mail(c, 'asu@anapa.com.ru');
   utl_smtp.rcpt(c, Recipient);
   utl_smtp.open_data(c);
   send_header('From',    '"Sender" <asu@anapa.com.ru>');
   send_header('To',      '"Recipient" <mikita@diagnostic.ru>');
   send_header('Subject', 'Hello');
   utl_smtp.write_data(c, utl_tcp.CRLF || 'Hello, world!');
   utl_smtp.close_data(c);
   utl_smtp.quit(c);
   EXCEPTION
    WHEN utl_smtp.transient_error OR utl_smtp.permanent_error THEN
     utl_smtp.quit(c);
     raise_application_error(-20000, 'Failed to send mail due to the following error: ' || sqlerrm);
   return 0;
END;
/

SHOW ERRORS;


