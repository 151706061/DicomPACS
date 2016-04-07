DROP PACKAGE BODY ASU.GET_SMID_VALUES
/

--
-- GET_SMID_VALUES  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."GET_SMID_VALUES" 
IS
    function get_Shab_count(SMID_ID in number, Shab_Id in number) return number
    is
        cursor Get is SELECT COUNT (tsmid1.fk_id) FROM (select fk_id, fk_owner from tsmid start with fk_id=SMID_ID
                        connect by prior fk_id=fk_owner)tsmid1, tibshablons WHERE tibshablons.fk_smeditid = tsmid1.fk_id and tibshablons.fk_shablonnamesid=Shab_id;
        ret_val number;
    BEGIN
        ret_val:=0;
        open get;
        fetch get into ret_val;
        close get;
        return ret_val;
    END;
    function get_count(SMID_ID in number, Pat_ID in number) return number
    is
        cursor Get is SELECT COUNT (tsmid1.fk_id) FROM (select fk_id, fk_owner from tsmid start with fk_id=SMID_ID
                        connect by prior fk_id=fk_owner)tsmid1, tib WHERE tib.fk_smeditid = tsmid1.fk_id and tib.fk_pacid=pat_id;
        ret_val number;
    BEGIN
        ret_val:=0;
        open get;
        fetch get into ret_val;
        close get;
        return ret_val;
    END;
    procedure SetDopVal(SMID_id in number, Pat_id in number, Doc_id in number, Str_val in varchar2)
    is
        cursor get_c is select count(fk_id) from tib where fk_smeditid=Smid_id and fk_vrachid=doc_id and fk_pacid=pat_id and
            fk_smid=fk_smeditid;
        cursor get_id is select fk_id from tib where fk_smeditid=Smid_id and fk_vrachid=doc_id and fk_pacid=pat_id and
            fk_smid=fk_smeditid;
        ID number;
    begin
        open get_c;
        fetch get_c into ID;
        close get_c;
        if ID=1 then
            open get_id;
            fetch get_id into ID;
            close get_id;
            update tib set fc_char=Str_val where fk_id=ID;
        else
            insert into tib(fc_char, fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
                values(Str_val, Pat_id, SMID_id, SMID_id, Doc_id);
        end if;
    end;
    procedure SetCheckBox(Smid_id in number, Smid_own in number, Pat_id in number, Doc_id in number, Num_val in number, Cnt_val in number, lastFl in boolean)
    is
        cursor get is select fk_id, fn_num, fk_smid from tib where fk_smeditid=Smid_Own and fk_vrachid=doc_id and fk_pacid=pat_id and
            fk_smid<>fk_smeditid order by fk_id;
        ID number;
        cnt number;
    begin
        cnt:=cnt_val;
        ID:=0;
        for c in get loop
            if cnt>0 then
                cnt:=cnt-1;
            elsif c.fk_smid=smid_id and c.fn_num<>num_val and num_val>0 then
                ID:=c.fk_id;
                update tib set fn_num=num_val where fk_id=ID;
            elsif c.fk_smid<>smid_id and not lastFl then
                ID:=c.fk_id;
                delete from tib where fk_id=ID;
                ID:=0;
            elsif lastFl and c.fk_smid<>smid_id then
                ID:=c.fk_id;
                delete from tib where fk_id=ID;
            elsif c.fk_smid=smid_id and not lastFl then
                ID:=1;
                exit;
            elsif c.fk_smid=smid_id and lastFl then
                ID:=1;
            end if;
        end loop;
        if ID=0 then
            if num_val>0 then
                insert into tib(fn_num, fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
                    values(num_val, pat_id, smid_id, smid_own, doc_id);
            else
                insert into tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
                    values(pat_id, smid_id, smid_own, doc_id);
            end if;
        end if;
    end;
    function get_ElStr(SMID_ID in number, pat_id in number) return varchar2
    is
        cursor get is select fk_smid, fn_num FROM tib WHERE fk_pacid = pat_id AND
         fk_smeditid = smid_id and fk_smid<>fk_smeditid order by fk_id;
        ret_val varchar2(200);
        SMID_val number;
    begin
        ret_val:='';
        SMID_val:=0;
        for c in get loop
            if SMID_val=c.fk_smid then
                ret_val:=ret_val||'='||replace(to_char(c.fn_num),',','.');
            else
                if(length(ret_val)>0) then
                    ret_val:=ret_val||'&';
                end if;
                ret_val:=ret_val||'el'||to_char(c.fk_smid);
                if c.fn_num>0 then
                    ret_val:=ret_val||'='||replace(to_char(c.fn_num),',','.');
                end if;
                SMID_val:=c.fk_smid;
            end if;
        end loop;
        return ret_val;
    end;
    function get_3pvalue(SMID_ID in number, SMID_Own in number, pat_id in number, count_id in number) return number
    is
        cursor get is select fn_num FROM tib WHERE fk_pacid = pat_id AND fk_smid = smid_id
         AND fk_smeditid = smid_own order by fk_id;
        ret_val number;
        cc number;
    begin
        cc:=0;
        for c in get loop
            ret_val:=c.fn_num;
            cc:=cc+1;
            if cc=count_id then
                exit;
            end if;
        end loop;
        return ret_val;
    end;
    procedure SetNewTechBol(Pat_id in number, Doc_id in number)
    is
        ID number;
    begin
        insert into ttechbolezni(fd_date, fk_vrachid, fk_pacid) values (sysdate, doc_id, pat_id) returning fk_id into ID;
        update ttechbolezni set fk_tibid=ID-1 where fk_id=ID;
    end;
    function Get_Child_SMID
        ( SMID_ID in number)
        return number
    is
        cursor get is select /*+index_asc (tsmid tsmid_by_owner_order)*/ count(fk_id) from tsmid where fk_owner=SMID_ID;
        ret_val number;
    begin
        open get;
        fetch get into ret_val;
        close get;
        return ret_val;
    end;
    FUNCTION Get_CheckBox
        ( SMID_ID IN number, Pat_ID IN number)
        return number
    is
        cursor Get is select /*+index_asc (tsmid tsmid_by_owner_order)*/ tsmid.fk_id from tib, tsmid where tib.fk_pacid=pat_id and tsmid.fk_id=smid_id and tib.fk_smid=tsmid.fk_id;
        ret_val number;
    BEGIN
        ret_val:=0;
        open get;
        fetch get into ret_val;
        close get;
        return ret_val;
    END;
    FUNCTION Get_Number
        ( SMID_ID IN number, Pat_ID IN number, Type_Val IN varchar2)
        RETURN number
    is
        ret_val number;
        cursor Get is select tib.fn_num from tib where tib.fk_pacid=pat_id and tib.fk_smeditid=smid_id order by fk_id;
    BEGIN
        if (type_val='NUMBER') then
        open Get;
        fetch get into ret_val;
        close get;
        else
        ret_val := null;
        end if;
        return ret_val;
    END;
    FUNCTION Get_Cbx
        ( SMID_ID IN number, Pat_ID IN number, Type_Val IN varchar2)
        RETURN number
    is
        ret_val number;
        cursor Get is select tib.fk_smid from tib where tib.fk_pacid=pat_id and tib.fk_smeditid=smid_id order by fk_id;
    BEGIN
        if (type_val='COMBOBOX') then
        open Get;
        fetch get into ret_val;
        close get;
        else
        ret_val := null;
        end if;
        return ret_val;
    END;
    FUNCTION Get_Fc_Char
        ( SMID_ID IN number, Pat_ID IN number, Type_Val IN varchar2)
        RETURN varchar2
    is
        cursor Get is select tib.fc_char from tib where tib.fk_pacid=pat_id and tib.fk_smeditid=smid_id order by fk_id;
        ret_val varchar2(32767);
    BEGIN
        if (type_val='EDIT')or(type_val='MEMO')or(type_val='BIGMEMO') then
        open Get;
        fetch get into ret_val;
        close get;
        else
        ret_val := null;
        end if;
        ret_val:=replace(ret_val,'"','&quot');
        return ret_val;
    END;
    FUNCTION Get_Date
        ( SMID_ID IN number, Pat_ID IN number, Type_Val IN varchar2)
        RETURN varchar2
    is
        cursor Get is select tib.fd_date from tib where tib.fk_pacid=pat_id and tib.fk_smeditid=smid_id order by fk_id;
        ret_val date;
    BEGIN
        if (type_val='DATA')then
        open Get;
        fetch get into ret_val;
        close get;
        else
        ret_val := null;
        end if;
        if (ret_val=null) then
        return ret_val;
        else
        return to_char(ret_val,'DD.MM.YYYY');
        end if;
    END;
    function get_parent(SMID_ID in number, SMID_Own in number) return varchar2
    is
        cursor Get is select /*+index_asc (tsmid tsmid_by_owner_order)*/ fc_name from tsmid where fk_id<>SMID_Own and level<3 start with fk_id=SMID_ID connect by fk_id=prior fk_owner;
        ret_val varchar2(32000);
    begin
        ret_val:='';
        for c in get loop
            if(length(ret_val)>0) then
                 ret_val:=' '||ret_val;
            end if;
            ret_val:=c.fc_name||ret_val;
        end loop;
        return ret_val;
    end;
    FUNCTION Get_Edit
        ( SMID_ID IN number, Pat_ID IN number, Type_Val IN varchar2)
        RETURN varchar2
    is
        cursor Get is SELECT /*+index_asc (tsmid tsmid_by_owner_order)*/ get_smid_values.get_parent(tib.fk_smid, SMID_ID) as fc_name,
            0 as ord, tib.fn_num as num, fk_id
            FROM tib WHERE tib.fk_smeditid = SMID_ID AND tib.fk_pacid = Pat_id and tib.fk_smid<>tib.fk_smeditid union
            select tib.fc_char as fc_name, 1 as ord, 0 as num, 0 as fk_id from tib where tib.fk_pacid = Pat_id
            and fk_SMID=SMid_id and fk_smeditid=smid_id order by ord, fk_id;
        ret_val varchar2(32000);
        temp_val varchar2(32000);
        rep_val number;
        pos_val number;
        len_val number;
    BEGIN
        ret_val:='';
        rep_val:=0;
        if (type_val='VARCHAR2')then
            for c in get loop
                if length(ret_val)>0 and rep_val=0 then
                    ret_val:=ret_val||', ';
                end if;
                if (c.ord=0)then
                    if rep_val=0 then
                        pos_val:=1;
                        len_val:=1;
                        while pos_val<>0 loop
                            pos_val:=instr(c.fc_name, '...', 1, rep_val+1);
                            if pos_val<>0 then rep_val:=rep_val+1; end if;
                            temp_val:='';
                        end loop;
                        pos_val:=0;
                    end if;
                    if rep_val>0 then
                        if instr(c.fc_name, '...', pos_val+1, 2)=0 then
                            len_val:=length(c.fc_name)-pos_val;
                        else
                            len_val:=instr(c.fc_name, '...', pos_val+1, 2)-pos_val-len_val;
                        end if;
                        pos_val:=instr(c.fc_name, '...', pos_val+1, 1);
                        if length(temp_val)>0 then
                            temp_val:=substr(c.fc_name, pos_val, len_val);
                        else
                            temp_val:=substr(c.fc_name, 0, len_val);
                        end if;
                        temp_val:=replace(temp_val, '...', replace(to_char(c.num),',','.'));
                        rep_val:=rep_val-1;
                    else
                        temp_val:=c.fc_name;
                    end if;
                else
                    temp_val:=c.fc_name;
                end if;
                ret_val:=ret_val||temp_val;
            end loop;
        else
            ret_val := null;
        end if;
        ret_val:=replace(ret_val,'"','&quot');
        return ret_val;
    END;
--------------------------------------------------------------------------------
    FUNCTION Get_Shab_Number
        ( SMID_ID IN number, Doc_ID IN number, Type_Val IN varchar2, ShabId in number)
        RETURN number
    is
        ret_val number;
        cursor Get is select fn_num from tibshablons where fk_vrachid=doc_id and fk_smeditid=smid_id and fk_shablonnamesid=ShabId;
    BEGIN
        if (type_val='NUMBER') then
        open Get;
        fetch get into ret_val;
        close get;
        else
        ret_val := null;
        end if;
        return ret_val;
    END;
    FUNCTION Get_Shab_Cbx
        ( SMID_ID IN number, Doc_ID IN number, Type_Val IN varchar2, ShabId in number)
        RETURN number
    is
        ret_val number;
        cursor Get is select fk_smid from tibshablons where fk_vrachid=Doc_ID and fk_smeditid=smid_id and fk_shablonnamesid=ShabId ;
    BEGIN
        if (type_val='COMBOBOX') then
        open Get;
        fetch get into ret_val;
        close get;
        else
        ret_val := null;
        end if;
        return ret_val;
    END;
    FUNCTION Get_Shab_Fc_Char
        ( SMID_ID IN number, Doc_ID IN number, Type_Val IN varchar2, ShabId in number)
        RETURN varchar2
    is
        cursor Get is select fc_char from tibshablons where fk_vrachid=Doc_ID and fk_smeditid=smid_id and fk_shablonnamesid=ShabId;
        ret_val varchar2(32767);
    BEGIN
        if (type_val='EDIT')or(type_val='MEMO')or(type_val='BIGMEMO') then
        open Get;
        fetch get into ret_val;
        close get;
        else
        ret_val := null;
        end if;
        ret_val:=replace(ret_val,'"','&quot');
        return ret_val;
    END;
    FUNCTION Get_Shab_Edit
        ( SMID_ID IN number, Doc_ID IN number, Type_Val IN varchar2, ShabId in number)
        RETURN varchar2
    is
        cursor Get is SELECT /*+index_asc (tsmid tsmid_by_owner_order)*/ get_smid_values.get_parent(fk_smid, SMID_ID) as fc_name,
            0 as ord, fn_num as num, fk_id
            FROM tibshablons WHERE fk_smeditid = SMID_ID AND fk_vrachid = Doc_ID and fk_smid<>fk_smeditid and fk_shablonnamesid=ShabId
            union
            select fc_char as fc_name, 1 as ord, 0 as num, 0 as fk_id from tibshablons where fk_vrachid = Doc_ID
            and fk_SMID=SMid_id and fk_smeditid=smid_id and fk_shablonnamesid=ShabId order by ord, fk_id;
        ret_val varchar2(500);
        temp_val varchar2(200);
        rep_val number;
        pos_val number;
        len_val number;
    BEGIN
        ret_val:='';
        rep_val:=0;
        if (type_val='VARCHAR2')then
            for c in get loop
                if length(ret_val)>0 and rep_val=0 then
                    ret_val:=ret_val||', ';
                end if;
                if (c.ord=0)then
                    if rep_val=0 then
                        pos_val:=1;
                        len_val:=1;
                        while pos_val<>0 loop
                            pos_val:=instr(c.fc_name, '...', 1, rep_val+1);
                            if pos_val<>0 then rep_val:=rep_val+1; end if;
                            temp_val:='';
                        end loop;
                        pos_val:=0;
                    end if;
                    if rep_val>0 then
                        if instr(c.fc_name, '...', pos_val+1, 2)=0 then
                            len_val:=length(c.fc_name)-pos_val;
                        else
                            len_val:=instr(c.fc_name, '...', pos_val+1, 2)-pos_val-len_val;
                        end if;
                        pos_val:=instr(c.fc_name, '...', pos_val+1, 1);
                        if length(temp_val)>0 then
                            temp_val:=substr(c.fc_name, pos_val, len_val);
                        else
                            temp_val:=substr(c.fc_name, 0, len_val);
                        end if;
                        temp_val:=replace(temp_val, '...', replace(to_char(c.num),',','.'));
                        rep_val:=rep_val-1;
                    else
                        temp_val:=c.fc_name;
                    end if;
                else
                    temp_val:=c.fc_name;
                end if;
                ret_val:=ret_val||temp_val;
            end loop;
        else
            ret_val := null;
        end if;
        ret_val:=replace(ret_val,'"','&quot');
        return ret_val;
    END;
    PROCEDURE loadShablon(SMID_ID IN NUMBER, Shab_ID IN NUMBER, Pat_ID IN NUMBER)
    IS
      cursor shab is select * from tibshablons where fk_shablonnamesid=shab_id order by fk_id;
    BEGIN
      	delete from tib where fk_smeditid in (select fk_id from tsmid
        		    where fc_type<>'DATA' start with fk_id=smid_id connect by prior fk_id=fk_owner);
        for cur in shab loop
        				insert into  tib(fc_char, fn_num, fk_bid, fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
				               values(cur.fc_char, cur.fn_num, cur.fk_bid, pat_id, cur.fk_smid, cur.fk_smeditid, cur.fk_vrachid);
				end loop;
    END;
    PROCEDURE saveShablon(Shab_name IN Varchar2, Doc_ID IN NUMBER, Pat_ID IN NUMBER, SMID_ID IN NUMBER)
    IS
			cursor shab is select * from tib where fk_pacid=pat_id and fk_smeditid in (select fk_id from tsmid
			       where fc_type<>'DATA' start with fk_id=smid_id connect by prior fk_id=fk_owner) order by fk_id;
      shab_id NUMBER;
    BEGIN
       insert into tibshablonnames(fc_name, fk_formid, fk_vrachid) values
              (shab_name, smid_id, doc_id) RETURNING fk_id INTO shab_id;
			 for cur in shab loop
           insert into  tibshablons(fc_char, fn_num, fk_bid, fk_formid, fk_smid, fk_smeditid, fk_vrachid, fk_shablonnamesid)
							values(cur.fc_char, cur.fn_num, cur.fk_bid, smid_id, cur.fk_smid, cur.fk_smeditid, cur.fk_vrachid, shab_id);
			 end loop;
		END;
END;
/

SHOW ERRORS;


