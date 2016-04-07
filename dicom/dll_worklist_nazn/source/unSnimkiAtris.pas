unit unSnimkiAtris;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, MConnect, SConnect, OleCtrls, SHDocVw, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, StdCtrls, OleCtnrs, fUpdate;

type
  TfrmSnimkiAtris = class(TForm)
    WebBrowser1: TWebBrowser;
    procedure WebBrowser1DocumentComplete(ASender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
  private
    { Private declarations }
  public
    v_last_url,
    v_sessionID : string;
    procedure p_show_webpage;
    function p_WebBrowserWait: boolean;
    function p_WebBrowserWait2: boolean;
    procedure MyShow;
  end;

var
  frmSnimkiAtris: TfrmSnimkiAtris;

const c_session_str = '/?='; // 'SessionID'; // это в админке и еще кое-где
      c_weblogfile = 'webATRIS.log';

procedure MyIEShow;

implementation

Uses UndmMain, comobj, ActiveX, MSHTML, DateUtils;

{$R *.dfm}

// процедура записи в лог-файл
procedure MnLg_ev ( const p_strs : ansistring;
                  const p_filename : ansistring = c_weblogfile;
                  const p_is_delim : Boolean = False;
                  const p_is_DT : boolean = True );
var F : TextFile; v_is_ex : Boolean;
const c_delim = '-------------------------------------------------------------------------------';
  procedure wrt_err(p_str:ansistring);
  begin
    try
        AssignFile(F, p_filename+IntToStr(GetTickCount)+'_err');
        rewrite(F);
        writeln(F,DateTimeToStr(Now)+' '+p_str);
        Flush(F);
        CloseFile(F);
      except
      end;
  end;
begin
  try
    if Trim(p_filename)<>'' then begin
      v_is_ex:=FileExists(p_filename);
      AssignFile(F, p_filename);
      try
        try
          if v_is_ex then begin
            Append(F);
          end else begin
            rewrite(F);
          end;
          if p_is_delim then writeln(F,c_delim);
          if p_is_DT then
            writeln(F,DateTimeToStr(Now)+' '+p_strs)
          else
            writeln(F,p_strs);
          Flush(F);
        except
          on E:Exception do
            wrt_err(DateTimeToStr(Now)+' ERROR (append/rewrite): '+E.Message+#13+
                 ' original message : '+p_strs);
        end;
      finally
        try
          CloseFile(F);
        except
          on E:Exception do
            wrt_err(DateTimeToStr(Now)+' ERROR (CloseFile) : '+E.Message+#13+
                 ' original message : '+p_strs);
        end;
      end;
    end;
  except
    on E:Exception do
      wrt_err(DateTimeToStr(Now)+' ERROR (summary): '+E.Message+#13+
                 ' original message : '+p_strs);
  end;
end;

procedure TfrmSnimkiAtris.MyShow;
begin
  p_show_webpage;
end;

function TfrmSnimkiAtris.p_WebBrowserWait: boolean;
var v_curtick : Integer;
begin
  v_curtick:=GetTickCount;
  while WebBrowser1.ReadyState<>4 do //определ€ем загрузку..
  begin
    if (GetTickCount-v_curtick)>v_atris_web_timeout then  break;
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    Sleep(100);
  end;
  Result := (WebBrowser1.ReadyState=4);
end;

function TfrmSnimkiAtris.p_WebBrowserWait2: boolean;
var v_curtick : Integer;
begin
  v_curtick:=GetTickCount;
  while Pos(c_session_str,v_last_url)<=0 do //определ€ем загрузку..
  begin
    if (GetTickCount-v_curtick)>v_atris_web_timeout then  break;
    Sleep(100);
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
  end;
  Result := (WebBrowser1.ReadyState=4) and (Pos(c_session_str,v_last_url)<=0);
end;

procedure TfrmSnimkiAtris.WebBrowser1DocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  v_last_url:=URL;
end;

procedure MyIEShow;
var b, browser, input_text : OleVariant; i1, i : integer;
    v_str_text, v_name, v_type, v_script_str, c : string;
  procedure p_waits;
  var v_t : TDateTime;
  begin
    v_t:=Now;
    while browser.ReadyState <> READYSTATE_COMPLETE do
    begin
      Sleep(100);
      Application.ProcessMessages;
      if SecondsBetween(v_t,Now)>5 then break;
    end;
  end;
begin
  try
    Screen.Cursor := crHourGlass;
    try
      browser := CreateOleObject('InternetExplorer.Application');
      browser.Height := screen.height ; //	”правл€ет высотой окна обозревател€ (в пикселах). „тение и запись. 	InternetExplorer, WebBrowser
      browser.Width := screen.width ; //	”правл€ет шириной окна обозревател€ (в пикселах). „тение и запись. 	InternetExplorer, WebBrowser
      browser.Top := 0 ; //	”правл€ет положением верхнего кра€ окна обозревател€. „тение и запись. 	InternetExplorer, WebBrowser
      browser.Left := 0 ; // 	”правл€ет положением левого кра€ окна обозревател€. „тение и запись.
      browser.Navigate(v_atris_webpage);
      p_waits;
      // заполним им€ и пароль
      input_text:=browser.document.all.tags('INPUT');
      i1:=-1;
      for i:=0 to input_text.length-1 do
      begin
        v_name:=UpperCase(input_text.item(i).Name);
        v_type:=UpperCase(input_text.item(i).type);
        if ((v_name='LOGIN') and (v_type='TEXT')) then
        begin
          input_text.item(i).value:=v_atris_webuser;
        end else if ((v_name='PASSWORD') and (v_type='PASSWORD')) then
        begin
         input_text.item(i).value:=v_atris_webpassword;
        end else if ((v_name='BTNSUBMIT') and (v_type='SUBMIT')) then
          i1:=i;
      end;
      if (i1>=0) then begin
        MnLg_ev('authorize v_atris_webuser='+v_atris_webuser+' v_atris_webpassword='+v_atris_webpassword);
        input_text.item(i1).Click;
      end;
      p_waits;
      // страница со списком исследований загружена
      // теперь надо выполнить javascript с параметрами
      Sleep(500);
      v_script_str := 'LoadStudyImages(event,'''+v_studyUID+''',''jpegsmall'',''study'');';
      browser.Navigate('javascript: '+v_script_str);
      p_waits;
      Sleep(500);

      input_text:=browser.document.all.tags('DIV');
      i1:=-1;
      for i:=0 to input_text.length-1 do
      begin
       if UpperCase(input_text.item(i).id)='IMGLISTCONTENT' then
       begin
         input_text.item(i).setattribute('style','');
         Break;
       end;
      end;
      v_script_str := 'javascript: var MyDiv=document.getElementById(''IMGLISTCONTENT''); MyDiv.style.height=''''; ';
      browser.Navigate(v_script_str);
      // browser.FullScreen := true;
      browser.Visible := True;
    except
      on E:Exception do
      begin
        ShowMessage('ќшибка вызова Internet Explorer'+#10#13+
                    E.Message);
        browser.Quit;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSnimkiAtris.p_show_webpage;
var a1, a2, a3: variant;
    input_text:OleVariant;
    i, i1, j : integer; v_ok:Boolean;
    v_name, v_type : string;
    Document: IHTMLDocument2;
    FormItem: Variant;
  procedure frmUpdateWait;
  begin
    With TfrmUpdate.Create(nil) do
    begin
      try
        sm_progress_anim.Animate := True;
        ShowModal;
      finally
        Free;
      end;
    end;
  end;
begin
  WebBrowser1.Visible:=False;
  //frmSnimkiAtris.Height:=10000;
  MnLg_ev('begin show web page '+v_atris_webpage);
  WebBrowser1.Visible:=False;
  v_last_url:='';
  Application.ProcessMessages;
  Screen.Cursor := crSQLWait;   //    crHourGlass
  try
    WebBrowser1.navigate(v_atris_webpage);
    Screen.Cursor := crHourGlass;   //   crSQLWait
    frmUpdateWait;
    if p_WebBrowserWait then
    begin
      try
        input_text:=WebBrowser1.OleObject.document.all.tags('INPUT');
        i1:=-1;
        for i:=0 to input_text.length-1 do
        begin
          v_name:=UpperCase(input_text.item(i).Name);
          v_type:=UpperCase(input_text.item(i).type);
          if ((v_name='LOGIN') and (v_type='TEXT')) then
          begin
            input_text.item(i).value:=v_atris_webuser;
            Sleep(1000);
          end else if ((v_name='PASSWORD') and (v_type='PASSWORD')) then
          begin
           input_text.item(i).value:=v_atris_webpassword;
           Sleep(1000);
          end else if ((v_name='BTNSUBMIT') and (v_type='SUBMIT')) then
            i1:=i;
        end;
        if (i1>=0) then begin
          MnLg_ev('authorize v_atris_webuser='+v_atris_webuser+' v_atris_webpassword='+v_atris_webpassword);
          input_text.item(i1).Click;
        end;
      except
        on e:Exception do
        begin
          MessageDlg('ERROR : '+E.Message, mtError, [mbOK], 0);
          Exit;
        end;
      end;
      while WebBrowser1.ReadyState<READYSTATE_INTERACTIVE do
      begin
        Sleep(100);
        Application.ProcessMessages;
        Screen.Cursor := crSQLWait;   //    crHourGlass
      end;
        Screen.Cursor := crSQLWait;   //    crHourGlass
        // страница со списком исследований загружена
        // теперь надо выполнить javascript с параметрами
        Document := WebBrowser1.Document as IHtmlDocument2;
        if Document <> nil then
        begin
          if Document.parentWindow <> nil then
          begin
            MnLg_ev('execute script LoadStudyImages(event,'''+v_studyUID+''',''jpegsmall'',''study'')');
            frmUpdateWait;
            Document.parentWindow.ExecScript(
               'LoadStudyImages(event,'''+v_studyUID+''',''jpegsmall'',''study'')',
               Olevariant('JavaScript')) ;
          end;
        end;
        Document := WebBrowser1.Document as IHtmlDocument2;
        if Document <> nil then
        begin
          if Document.parentWindow <> nil then
          begin
            frmUpdateWait;
            // уберем высоту у div'a IMGLISTCONTENT
            Document.parentWindow.ExecScript(
               'var MyDiv=document.getElementById(''IMGLISTCONTENT''); MyDiv.style.height=''''; ',
               Olevariant('JavaScript')) ;
          end;
        end;
        //
        frmUpdateWait;
        Screen.Cursor := crDefault;
        frmSnimkiAtris.WindowState:=wsMaximized;
        WebBrowser1.Visible:=True;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.

