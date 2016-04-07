DROP PACKAGE ASU.PLSQL_ARCHIVER
/

--
-- PLSQL_ARCHIVER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   STRING_TABLE (Type)
--
CREATE OR REPLACE PACKAGE ASU."PLSQL_ARCHIVER" 
as
/*
   PL/SQL Source Code Control inside the database Ц After Compile trigger for automatic archiving
   вз€то отсюда и немного модифицировано http://technology.amis.nl/blog/846/plsql-source-code-control-inside-the-database-after-compile-trigger-for-automatic-archiving
   %Author Zhukov
   %Version  1.2
*/
procedure archive_version
( p_object_name   in  varchar2
, p_object_type   in  varchar2
, p_object_owner  in varchar2
, p_creation_time in date
);
procedure revert_to_previous_version -- undo last change; can be called repeatedly
( p_object_name   in varchar2
, p_object_type   in varchar2
, p_object_owner  in varchar2
, p_purge_latest  in varchar2 default 'Y'
);

procedure revert_to_version
( p_object_name   in varchar2
, p_object_type   in varchar2
, p_object_owner  in varchar2
, p_version_label in varchar2
, p_branch        in varchar2
, p_seq           in number
, p_purge_later   in varchar2 default 'N'
);


function version_graph
( p_object_name   in varchar2
, p_object_type   in varchar2
, p_object_owner  in varchar2
, p_show_version_label in  varchar2 default 'Y' -- show the version label
, p_show_seq           in  varchar2 default 'N' -- show the seq value for each version (appended to the version label if that is requested too)
, p_show_datetime      in  varchar2 default 'N' -- display the timestamp of the creation of each version
, p_show_author        in  varchar2 default 'N' -- display the author of each version
, p_show_labels        in  varchar2 default 'N' -- display the labels or stripes a version is associated with
, p_show_status        in  varchar2 default 'N' -- display the status (VALID or INVALID) of the version
, p_show_comments      in  varchar2 default 'N' -- display the Comments for each version
) return string_table
;
end ;
/

SHOW ERRORS;


