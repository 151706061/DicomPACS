unit DCM_log;

interface

Uses SysUtils, Windows, Forms;

procedure MnLg_ev ( const p_strs : ansistring;
                    const p_filename : ansistring = '';
                    const p_is_delim : Boolean = False;
                    const p_is_DT : boolean = True );
function BoolToStr (pVal:Boolean):string;
var vIsLog : Boolean;
    vLogDir : AnsiString;
    
const pLogFile = '\dcm_server.log';
      cDebug = True;

implementation

function BoolToStr (pVal:Boolean):string;
begin
  if pVal then
    Result:='True'
  else
    Result:='False';
end;

// процедура записи в лог-файл
procedure MnLg_ev ( const p_strs : ansistring;
                  const p_filename : ansistring = '';
                  const p_is_delim : Boolean = False;
                  const p_is_DT : boolean = True );
var F : TextFile; vEx, vTmp, vErr : Boolean; vNmb:Integer; vfilename : ansistring;
const c_delim = '-------------------------------------------------------------------------------';
label l1;
begin
  // Exit;
  if vIsLog then
    try
  //    if GetFreeDiskSize<c_free_space then Exit; // если места меньше 10 Gigabytes
      if Trim(p_filename)='' then begin
        vfilename:=ExtractFilePath(paramstr(0))+'DCM_log.log';
      end else begin
        vfilename:=p_filename;
      end;
        AssignFile(F, vfilename);
        vTmp:=False;
        try
          vEx := FileExists(vfilename) ;
          vNmb:=0;
          l1:
          Inc(vNmb);
          vErr:=False;
          try
            if vEx then
              Append(F)
            else
              rewrite(F);
          except
            on E:Exception do
              vErr:=True;
          end;
          if vErr and (vNmb<10) then goto l1;
          vTmp:=True;
          if p_is_delim then writeln(F,c_delim);
          if p_is_DT then
            writeln(F,DateTimeToStr(Now)+' '+trim(inttostr(gettickcount))+' : '+p_strs)
          else
            writeln(F,p_strs);
          Flush(F);
        finally
          try
            if vTmp then
              CloseFile(F);
          except
          end;
        end;
    except
      on E:Exception do
        try
          MnLg_ev ( 'ERROR :' +E.Message+#13+p_strs , p_filename+' '+trim(inttostr(gettickcount)) );
        except
        end;
    end;
end;

initialization
  vLogDir := ExtractFilePath(Application.ExeName);
end.
