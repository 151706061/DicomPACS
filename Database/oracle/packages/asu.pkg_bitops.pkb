DROP PACKAGE BODY ASU.PKG_BITOPS
/

--
-- PKG_BITOPS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.PKG_BITOPS is

  function raw_ascii(p_dec number) return raw is
    v_result varchar2(1999);
    v_tmp1   number := p_dec;
  begin
    loop
      v_result := chr(mod(v_tmp1,256)) || v_result ;
      v_tmp1 := trunc(v_tmp1/256);
      exit when v_tmp1 = 0;
    end loop;
    return utl_raw.cast_to_raw(v_result);
  end;

  function ascii_raw(p_raw varchar2) return number is
    v_result number := 0;
  begin
    for i in 1 .. length(p_raw) loop
      v_result := v_result * 256 + ascii(substr(p_raw,i,1));
    end loop;
    return v_result;
  end;

  function bitand(p_dec1 number, p_dec2 number) return number is
    v_tmp_raw1 raw(1999);
    v_tmp_raw2 raw(1999);
    nr_diff_length number(4,0);
    nr_pos number(4,0);
    v_tmp_raw_zero raw(1999) := raw_ascii(0);
  begin
    v_tmp_raw1 := raw_ascii(p_dec1);
    v_tmp_raw2 := raw_ascii(p_dec2);
    nr_diff_length := greatest( utl_raw.length(v_tmp_raw1), utl_raw.length(v_tmp_raw2));
    for nr_pos in utl_raw.length(v_tmp_raw1) + 1.. nr_diff_length loop
      v_tmp_raw1 := utl_raw.concat( v_tmp_raw_zero,v_tmp_raw1 );
    end loop;
    for nr_pos in utl_raw.length(v_tmp_raw2) + 1 .. nr_diff_length loop
      v_tmp_raw2 := utl_raw.concat( v_tmp_raw_zero,v_tmp_raw2 );
    end loop;
    return ascii_raw( utl_raw.cast_to_varchar2( utl_raw.bit_and( v_tmp_raw1, v_tmp_raw2)));
  end;

  function bitor(p_dec1 number, p_dec2 number) return number is
    v_tmp_raw1 raw(1999);
    v_tmp_raw2 raw(1999);
    nr_diff_length number(4,0);
    nr_pos number(4,0);
    v_tmp_raw_zero raw(1999) := raw_ascii(0);
  begin
    v_tmp_raw1 := raw_ascii(p_dec1);
    v_tmp_raw2 := raw_ascii(p_dec2);
    nr_diff_length := greatest( utl_raw.length(v_tmp_raw1),utl_raw.length(v_tmp_raw2));

    for nr_pos in utl_raw.length(v_tmp_raw1) + 1.. nr_diff_length loop
      v_tmp_raw1 := utl_raw.concat( v_tmp_raw_zero,v_tmp_raw1 );
    end loop;

    for nr_pos in utl_raw.length(v_tmp_raw2) + 1 .. nr_diff_length loop
      v_tmp_raw2 := utl_raw.concat( v_tmp_raw_zero,v_tmp_raw2 );
    end loop;

    return ascii_raw( utl_raw.cast_to_varchar2( utl_raw.bit_or( v_tmp_raw1, v_tmp_raw2)));
  end;

  function bitxor(p_dec1 number, p_dec2 number) return number is
    v_tmp_raw1 raw(1999);
    v_tmp_raw2 raw(1999);
    nr_diff_length number(4,0);
    nr_pos number(4,0);
    v_tmp_raw_zero raw(1999) := raw_ascii(0);
  begin
    v_tmp_raw1 := raw_ascii(p_dec1);
    v_tmp_raw2 := raw_ascii(p_dec2);

    nr_diff_length := greatest( utl_raw.length(v_tmp_raw1),utl_raw.length(v_tmp_raw2));

    for nr_pos in utl_raw.length(v_tmp_raw1) + 1.. nr_diff_length loop
      v_tmp_raw1 := utl_raw.concat( v_tmp_raw_zero,v_tmp_raw1 );
    end loop;

    for nr_pos in utl_raw.length(v_tmp_raw2) + 1 .. nr_diff_length loop
      v_tmp_raw2 := utl_raw.concat( v_tmp_raw_zero,v_tmp_raw2 );
    end loop;

    return ascii_raw( utl_raw.cast_to_varchar2( utl_raw.bit_xor( v_tmp_raw1, v_tmp_raw2)));
  end;
end;
/

SHOW ERRORS;


