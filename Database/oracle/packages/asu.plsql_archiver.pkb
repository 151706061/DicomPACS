DROP PACKAGE BODY ASU.PLSQL_ARCHIVER
/

--
-- PLSQL_ARCHIVER  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PLSQL_ARCHIVER" 
as
/*
   PL/SQL Source Code Control inside the database Ц After Compile trigger for automatic archiving
   вз€то отсюда и немного модифицировано http://technology.amis.nl/blog/846/plsql-source-code-control-inside-the-database-after-compile-trigger-for-automatic-archiving
   %Author Zhukov
   %Version  1.2
*/
function get_code
( p_name in varchar2, p_object_owner in varchar2, p_object_type IN VARCHAR2
) return clob
;

/* ************************************************************************** */
procedure archive_version
( p_object_name   in  varchar2
, p_object_type   in  varchar2
, p_object_owner  in varchar2
, p_creation_time in date
) is
  l_code clob;
  l_object_type varchar2(32):= p_object_type;
  l_archive_rec plsql_archive%rowtype;
  l_rowid rowid;
  l_errors clob;
  procedure debug
  ( p_txt in varchar2
  ) is
  begin
    dbms_output.put_line(substr(p_txt,1,255));
  end;
  -- this function tries to locate the specified keyword in the current code block; if the keyword is found,
  -- the string following the keyword until the first newline character (chr(10)) is returned
  function get_annotation
  ( p_keyword in varchar2 -- values include: version, author, branch, comments, priority
  ) return varchar2
  is
    l_pos    number(5); -- position of the keyword, including the @ character
    l_pos2   number(5); -- position of the first chr(10) following the keyword
    l_return varchar2(4000);
  begin
    debug(p_keyword);
    l_pos:= instr( l_code, '%'||p_keyword);
    debug('pos of keyword in code '||l_pos);
    if l_pos > 0
    then
      l_pos2:= instr( l_code, chr(10), l_pos, 1); -- find the first instance of chr(10), starting from position l_pos in the l_code block
      debug( 'Position of chr(10) after keyword '||l_pos2);
      if l_pos2 > 0
      then
        l_return:= ltrim(substr( l_code, l_pos + length(p_keyword)+2, l_pos2 - (l_pos + length(p_keyword)+2)));
        debug('return value '||l_return);
      end if;
    end if;
    return l_return;
  end get_annotation;
begin
  l_archive_rec.object_name:= p_object_name;
  l_archive_rec.object_type:= p_object_type;
  l_archive_rec.object_owner:= p_object_owner;
  l_archive_rec.creation_time:= sysdate;
  if l_object_type = 'PACKAGE BODY'
  then
    l_object_type:= 'PACKAGE';
    -- make sure that dbms_metadata does return the package body
    DBMS_METADATA.SET_TRANSFORM_PARAM
    ( transform_handle  => dbms_metadata.SESSION_TRANSFORM
    , name              => 'BODY'
    , value             => true
    , object_type       => 'PACKAGE'
    );
    -- make sure that dbms_metadata does not return the package specification as well
    DBMS_METADATA.SET_TRANSFORM_PARAM
    ( transform_handle  => dbms_metadata.SESSION_TRANSFORM
    , name              => 'SPECIFICATION'
    , value             => false
    , object_type       => 'PACKAGE'
    );
  elsif l_object_type = 'PACKAGE'
  then
    -- make sure that dbms_metadata does return the package body
    DBMS_METADATA.SET_TRANSFORM_PARAM
    ( transform_handle  => dbms_metadata.SESSION_TRANSFORM
    , name              => 'BODY'
    , value             => false
    , object_type       => 'PACKAGE'
    );
    -- make sure that dbms_metadata does not return the package specification as well
    DBMS_METADATA.SET_TRANSFORM_PARAM
    ( transform_handle  => dbms_metadata.SESSION_TRANSFORM
    , name              => 'SPECIFICATION'
    , value             => true
    , object_type       => 'PACKAGE'
    );
  end if;
  l_code := EMPTY_CLOB();
  begin
    l_code:= dbms_metadata.get_ddl(l_object_type, p_object_name, p_object_owner);
  exception
    when others
    then
      l_archive_rec.comments:= sqlerrm;
      l_code:= get_code(p_object_name,p_object_owner,p_object_type );
  end;
  l_archive_rec.source_size:= length(l_code);
--  l_errors:=  get_errors( p_name => p_object_name, p_type => p_object_type);
  l_archive_rec.source:=  get_code( p_name => p_object_name,p_object_owner => p_object_owner, p_object_type => p_object_type);
  l_archive_rec.errors:=  l_errors;
  begin
    select status
    into   l_archive_rec.status
    from   all_objects
    where  object_name = p_object_name
    and    object_type = p_object_type
    ;
  exception
    when others
    then
      if l_errors is null or length(l_errors) <2
      then
         l_archive_rec.status:= 'VALID';
      else
         l_archive_rec.status:= 'INVALID';
      end if;
  end;
  l_archive_rec.version_label:=  get_annotation('Version');
  l_archive_rec.comments:=  get_annotation('comments');
  l_archive_rec.branch:=  get_annotation('branch');
  l_archive_rec.priority:=  get_annotation('priority');
  l_archive_rec.author:=  get_annotation('Author');
  -- find the max seq for objects on the same branch with the same version label
  -- this assumes that either no version labels are used at all or that every object has a version label
  -- and it is only changed once in a while when a new meaningful stage has been reached for a particular object
  select nvl(max(seq),0)+1
  into   l_archive_rec.seq
  from   plsql_archive
  where  object_name = l_archive_rec.object_name
  and    object_type = l_archive_rec.object_type
  and    object_owner = l_archive_rec.object_owner
  and    nvl(branch,'MAIN') = nvl(l_archive_rec.branch,'MAIN')
  and    nvl(version_label, 'x.y') = nvl(l_archive_rec.version_label, 'x.y')
  ;

  begin
   SELECT username, osuser, terminal, program
        INTO l_archive_rec.username, l_archive_rec.osuser, l_archive_rec.terminal,
             l_archive_rec.program
        FROM SYS.v_$session s
       WHERE s.audsid = USERENV ('sessionid') AND s.SID =
                                                         (SELECT /*+ FIRST_ROWS(1)*/
                                                                 SID
                                                            FROM SYS.v_$mystat
                                                           WHERE ROWNUM < 2);
  exception
    when others
    then
     null;
  end;
  insert into plsql_archive
  values l_archive_rec
  returning rowid into l_rowid;
end archive_version;

/*****************************************************************************/
procedure revert_to_previous_version -- undo last change; can be called repeatedly
( p_object_name   in  varchar2
, p_object_type   in  varchar2
, p_object_owner  in varchar2
, p_purge_latest  in varchar2 default 'Y'
) is
  l_source clob;
 procedure debug
  ( p_txt in varchar2
  ) is
  begin
    dbms_output.put_line(substr(p_txt,1,255));
  end;
 begin
  select source
  into   l_source
  from   ( select pae.source
           ,      row_number() over (partition by object_name, object_type, object_owner
                                     order by creation_time desc) rn
           from   plsql_archive pae
           where  object_name = p_object_name
           and    object_type = p_object_type
           and    object_owner = p_object_owner
         ) all_versions
  where rn = 2
  ;
  if p_purge_latest = 'Y'
  then
    -- delete last version from plsql_archive
    delete
    from  plsql_archive
    where rowid = ( select latest_version.rowid
                    from   ( select pae.rowid
                             ,      row_number() over (partition by object_name, object_type, object_owner
                                                       order by creation_time desc) rn
                             from   plsql_archive pae
                             where  object_name = p_object_name
                             and    object_type = p_object_type
                             and    object_owner = p_object_owner
                            ) latest_version
                    where rn = 1
                  )
  ;
  end if;
  debug(l_source);
  -- create plsql object based on current source
  /* //TODO Ensure that creation of a PL/SQL object as part of revert_to_version does not create a new version itself
  */
  execute immediate 'create or replace '||cast( l_source as varchar2);

end revert_to_previous_version;

/* ************************************************************************** */

/* TODO Cater for situations where the Source of an object is larger than 32769 bytes: in that case EXECUTE IMMEDIATE cannot be used, and dbms_sql is required instead
*/
procedure revert_to_version
( p_object_name   in varchar2
, p_object_type   in varchar2
, p_object_owner  in varchar2
, p_version_label in varchar2
, p_branch        in varchar2
, p_seq           in number
, p_purge_later   in varchar2 default 'N'
) is
  l_source clob;
  l_creation_time date;
 procedure debug
  ( p_txt in varchar2
  ) is
  begin
    dbms_output.put_line(substr(p_txt,1,255));
  end;
 begin
  select source
  ,      creation_time
  into   l_source
  ,      l_creation_time
  from   plsql_archive
  where  object_name = p_object_name
  and    object_type = p_object_type
  and    object_owner = p_object_owner
  and    nvl(version_label, 'X') = nvl(p_version_label,nvl(version_label, 'X'))
  and    nvl(branch, nvl(p_branch,'X')) = nvl(p_branch,nvl(branch,'X'))
  and    nvl(seq, 0) = nvl(p_seq,nvl(seq, 0))
    ;
  if p_purge_later = 'Y'
  then
    -- delete last version from plsql_archive
    delete
    from  plsql_archive
    where object_name = p_object_name
    and   object_type = p_object_type
    and   object_owner = p_object_owner
    and   nvl(branch, nvl(p_branch,'X')) = nvl(p_branch,nvl(branch,'X'))
    and   creation_time > l_creation_time
    ;
  end if;
  debug(l_source);
  -- create plsql object based on current source
  execute immediate 'create or replace '||cast( l_source as varchar2);
end revert_to_version;

/* ************************************************************************** */
procedure purge
( p_object_name   in varchar2
, p_object_type   in varchar2
, p_object_owner  in varchar2
, p_status        in varchar2 default null
, p_priority      in varchar2 default null
, p_from_datetime in date     default null
, p_to_datetime   in date     default null
, p_branch        in varchar2 default null
, p_seq_from      in number   default null
, p_seq_to        in number   default null
) is
begin
    delete
    from  plsql_archive
    where object_name like p_object_name
    and   object_type like p_object_type
    and   object_owner like p_object_owner
    and   nvl(branch, nvl(p_branch,'X')) like nvl(p_branch,nvl(branch,'X'))
    and   nvl(seq, 0) between nvl(p_seq_from,nvl(seq, 0)) and nvl(p_seq_to,nvl(seq, 0))
    and   creation_time between nvl(p_from_datetime,creation_time) and nvl(p_to_datetime,creation_time)
    and   nvl(priority, nvl(p_priority,'X')) like nvl(p_priority,nvl(priority,'X'))
    and   nvl(status, nvl(p_status,'X')) like nvl(p_status,nvl(status,'X'))
    ;
end purge;

/* ************************************************************************** */
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
is
  l_graph string_table:= string_table('Version Graph for '||p_object_type||' '||p_object_name||' (schema '||p_object_owner||')');
  l_line varchar2(32000);
/*
start with the MAIN branch, then the branch who entered the version history most recently
MAIN   SECU          PATCH2
1.0                  1.0PTHC2_1.0
1.1
        1.1SECU1.0
        1.1SECU1.1   1.0PTHC2_1.1
1.2
1.2(2)
1.2(3)
*/
  type branch_columns_type is table of string_table index by varchar2(32);
  type version_history_type is table of plsql_archive%rowtype;
  type branch_rec is record (branch varchar2(32), width number(4));
  type branches_tbl_type is table of branch_rec index by binary_integer;
  l_branches_tbl branches_tbl_type;
  l_branch_columns branch_columns_type;
  l_branch varchar2(32);
  l_vh version_history_type;
  idx number(5); -- index into l_vh collection
  ctr number(6):=1;
  l_next_branch varchar2(32);
  l_vh_done boolean:= false;
  l_more_on_branch boolean:= false;

  function get_vh_tbl
  ( p_version in plsql_archive%rowtype
  , p_column_width in number default 40
  )  return string_table
  is
    l_return string_table:= string_table();
    l_comments_length number(5):= length(p_version.comments);

    function ifThen
    ( p_test  in boolean
    , p_value in varchar2
    ) return varchar2
    is
    begin
      if p_test then return p_value; else return ''; end if;
    end ifThen;
  begin
    if p_show_version_label='Y' or p_show_seq='Y' or p_show_status='Y'
    then
      l_return.extend;
      l_return(l_return.last):= p_version.version_label||' ('||p_version.seq||')'||ifThen(p_show_status='Y' and p_version.status ='INVALID',' *');
    end if;
    if p_show_author='Y'
    then
      l_return.extend;
      l_return(l_return.last):= p_version.author;
    end if;
    if p_show_datetime='Y'
    then
      l_return.extend;
      l_return(l_return.last):= to_char(p_version.creation_time,'DD-MON HH24:MI:SS');
    end if;
    if p_show_labels='Y' and length(nvl(p_version.label,''))> 0
    then
      l_return.extend;
      l_return(l_return.last):= 'Labels: '||p_version.label;
    end if;
    if p_show_comments='Y' and l_comments_length>0
    then
      /* //TODO replace hardcoded value of 40 with the actual column width
      */
      for i in 1..trunc(l_comments_length/40)+1 loop
        l_return.extend;
        l_return(l_return.last):= substr(p_version.comments, 1 + (i-1)*p_column_width, least(p_column_width, l_comments_length - (1 + (i-1)*p_column_width)));
      end loop;
    end if;
    -- p_show_labels
    l_return.extend;
    l_return(l_return.last):= '    |';
    return l_return;
  end get_vh_tbl;
  procedure add
  ( p_string in varchar2)
  is
  begin
    l_graph.extend;
    l_graph( l_graph.last) := p_string;
  end add;
begin
  -- get branches
  for branch in (select distinct
                        nvl(branch, 'MAIN') branch
                 ,      first_value(creation_time) over (partition by branch order by creation_time) start_branch
                 ,      max(length(version_label)) over (partition by branch) longest_version_label
                 ,      max(length(to_char(seq))) over (partition by branch) longest_seq
                 from   plsql_archive
                 order
                 by     start_branch
                ) loop
     l_branches_tbl(ctr).branch:= branch.branch ;
     l_branches_tbl(ctr).width:= greatest( 40, branch.longest_version_label+branch.longest_seq+6, length(branch.branch)+3) ;
     l_line:= l_line||rpad(l_branches_tbl(ctr).branch, l_branches_tbl(ctr).width, ' ');
     ctr:= ctr+1;
  end loop; -- branch
  add(l_line);
  select *
  bulk collect into l_vh
  from   plsql_archive
  where  object_name = p_object_name
  and    object_type = p_object_type
  and    object_owner = p_object_owner
  order
  by     creation_time
  ;



  idx:= l_vh.first;
  l_branch_columns(nvl(l_vh(idx).branch,'MAIN')):= get_vh_tbl(l_vh(idx));
  loop
    l_line:='';
    -- loop over branches and for each branch column, if there is a line to write: write it!
        l_more_on_branch:= false;
    for i in 1..l_branches_tbl.count
    loop
--    add('outside'||l_branches_tbl(i).branch);
      if l_branch_columns.exists(l_branches_tbl(i).branch) and l_branch_columns(l_branches_tbl(i).branch).count > 0
      then
    -- add('inside'||l_branches_tbl(i).branch||' count '||l_branch_columns(l_branches_tbl(i).branch).count);
      l_line:=l_line|| rpad(l_branch_columns(l_branches_tbl(i).branch)(l_branch_columns(l_branches_tbl(i).branch).first),l_branches_tbl(i).width,' ');
      l_branch_columns(l_branches_tbl(i).branch).delete(l_branch_columns(l_branches_tbl(i).branch).first);
      else
        l_line:=l_line|| rpad('  ',l_branches_tbl(i).width,' ');

      end if;
      if l_branch_columns.exists(l_branches_tbl(i).branch) and l_branch_columns(l_branches_tbl(i).branch).count > 0
      then
        l_more_on_branch:= true;
      end if;
      --add('end of');
    end loop;
    add(l_line);
    -- if there are more versions left to process
    if l_vh.exists(l_vh.next(idx))
    then
      l_next_branch:= nvl(l_vh(l_vh.next(idx)).branch,'MAIN');
      -- if there is room for another branch
      if not l_branch_columns.exists(l_next_branch)
         or l_branch_columns(l_next_branch).count = 0
         or l_branch_columns( l_next_branch) is null
      then
        idx:= l_vh.next(idx);
        l_branch_columns(l_next_branch) := get_vh_tbl(l_vh(idx), 40); -- instead of 40 here we should indicate the width for column associated with branch l_next_branch
        l_more_on_branch:= true;
      end if;
    end if;
    ctr:=ctr+1; -- failsafe, to not run infinitely in this loop
    l_vh_done := l_vh.next(idx) is null;
    exit when l_vh_done and not l_more_on_branch;
    exit when ctr>20000;
  end loop;
  -- now we have to go through a couple of rounds to have all branch_columns completely wash out their stacks
  return l_graph;
exception
when others
then add(sqlerrm||'ctr = '||ctr);
return l_graph;

end version_graph;


/* ************************************************************************** */
FUNCTION get_code (p_name IN VARCHAR2, p_object_owner IN VARCHAR2, p_object_type IN VARCHAR2)
  RETURN CLOB
IS
  l_code   CLOB := '';
BEGIN

  FOR src IN (  SELECT   text
                  FROM   dba_source
                 WHERE   name = p_name AND owner = p_object_owner AND TYPE=p_object_type
              ORDER BY   line)
  LOOP
    l_code := l_code || src.text;
  END LOOP;

  RETURN l_code;
END get_code;

END;
/

SHOW ERRORS;


