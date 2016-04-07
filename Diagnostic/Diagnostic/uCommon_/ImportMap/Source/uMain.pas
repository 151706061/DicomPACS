unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DataGIS, StrUtils, Math, ExtCtrls, Oracle;

type
  TForm1 = class(TForm)
    DgMap1: TDgMap;
    btnOpen: TButton;
    tmrRefresh: TTimer;
    lbItems: TListBox;
    btnLoadToBd: TButton;
    os: TOracleSession;
    qInsertStreet: TOracleQuery;
    procedure btnOpenClick(Sender: TObject);
    procedure DgMap1AfterImportObject(Sender: TMapObject; AParams: String);
    procedure DgMap1BeforeImport(var ACooSystem: TCooSystem);
    procedure DgMap1AfterImportMap(Sender: TObject);
    procedure btnLoadToBdClick(Sender: TObject);
  private
    { Private declarations }
    FFileName:string;
    FNeedSaveToDB:Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
 const
  linescale = 10000;
implementation

{$R *.dfm}

procedure TForm1.btnLoadToBdClick(Sender: TObject);
begin
  os.LogOn;
  FNeedSaveToDB:=True;
  DgMap1.CleanMap;
  DgMap1.ImportFromPolishMap(FFileName);
  DgMap1.ViewAll;
  DgMap1.ReDraws;
  btnLoadToBd.Enabled := true;
end;

procedure TForm1.btnOpenClick(Sender: TObject);
begin
  with TOpenDialog.Create(Self) do
    if Execute then
    begin
      FNeedSaveToDB:=False;
      DgMap1.CleanMap;
      DgMap1.ImportFromPolishMap(FileName);
      FFileName:=FileName;
      DgMap1.ViewAll;
      DgMap1.ReDraws;
      btnLoadToBd.Enabled := true;
    end;
end;

procedure TForm1.DgMap1AfterImportMap(Sender: TObject);
begin
  ShowMessage(IntToStr(lbItems.Items.Count));
end;

procedure TForm1.DgMap1AfterImportObject(Sender: TMapObject;
  AParams: String);
var
  sname:string;
  sl:TStringList;
  I: Integer;
  prefix,bdname:string;
  ipos:Integer;
begin
    if AnsiContainsText(AParams, 'Label=') then
    begin
      sl := TStringList.Create;
      try
        sl.Text := Trim(AParams);
        begin
          for I := 0 to sl.Count - 1 do
          begin
            if (AnsiContainsText(sl[I], 'Label=')) then
            begin
              sname := AnsiReplaceText(sl[I], 'Label=','');
              if (AnsiContainsText(sname, '.')) then
              begin
                if (lbItems.Items.IndexOf(sname)=-1) then
                begin
                  lbItems.Items.Add(sname);
                  if (FNeedSaveToDB) then
                  begin
                    iPos := Pos('.',sname);
                    prefix:=AnsiLeftStr(sname,ipos);
                    bdname := AnsiReplaceStr(sname,prefix,'');
                    prefix := Trim(prefix);
                    prefix := AnsiReplaceStr(prefix,'.','');
                    bdname := Trim(bdname);
                    with qInsertStreet do
                    begin
                      ClearVariables;
                      //:PNAME, :PPREFFIX, :PMAPNAME
                      SetVariable('PNAME',bdname);
                      SetVariable('PPREFFIX',prefix);
                      SetVariable('PMAPNAME',sname);
                      Execute;
                      Session.Commit;
                    end;
                  end;
                end;
              end;
              Break;
            end;
          end;
        end;
      finally
        sl.Free;
      end;
    end;
end;

procedure TForm1.DgMap1BeforeImport(var ACooSystem: TCooSystem);
begin
  lbItems.Clear;
end;

end.
