unit TreeView;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, ExtCtrls, mbDrvLib, mbCDBC, mbISOLib, StdCtrls, Menus;

type
  TfrmTree = class(TForm)
    Msg: TPanel;
    Splitter1: TSplitter;
    fl: TStringGrid;
    tvDir: TTreeView;
    procedure FormShow(Sender: TObject);
    procedure tvdirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Extract1Click(Sender: TObject);
    procedure MsgClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DisplayDir(treenode: TTreeNode; Dir: PDirEntry);
  end;

var
  frmTree: TfrmTree;
  mcdb: TMCDBurner;
implementation

uses fCD;

{$R *.DFM}
procedure TfrmTree.DisplayDir(treenode: TTreeNode; Dir: PDirEntry);
var
  Node: TTreeNode;
  CurrentFile: PFileEntry;
begin
  if (Dir = nil) then exit;
  CurrentFile := Dir.Files;
  while CurrentFile <> nil do
  begin
    if ((CurrentFile.Attr and faDirectory) = faDirectory) then
    begin
      Node := tvDir.Items.AddChildObject(treenode, CurrentFile.LongName, CurrentFile.DirRec);
      DisplayDir(Node, CurrentFile.DirRec);
    end;
    CurrentFile := CurrentFile.Next;
  end;
end;

procedure TfrmTree.FormShow(Sender: TObject);
var
  RootNode: TTreeNode;
begin
  mcdb := frmCD.mcdb;
  mcdb.FindDir('\');
  RootNode := tvdir.Items.InsertObject(nil,'CDROOT', mcdb.RootDir);
  DisplayDir(RootNode, mcdb.RootDir);
  tvdir.Selected := RootNode;
  tvdirClick(Sender);
end;

procedure TfrmTree.tvdirClick(Sender: TObject);
var
  p: PDirEntry;
  f: PFileEntry;
  i: Integer;
begin
  p := tvDir.Selected.Data;
  f := p.Files;
  i := 1;
  fl.Cells[0, 0] := 'File Name';
  fl.Cells[1, 0] := 'File Size';
  fl.Cells[2, 0] := '   Date';
  fl.Cells[3, 0] := '  Time';
  while f <> nil do
  begin
    fl.Cells[0, i] := IntToDec(i, 2, ' ')+' '+f.LongName;
    if ((f.Attr and faDirectory) <> faDirectory) then
    begin
      fl.Objects[1, i] := TObject(f);
      fl.Cells[1, i] := IntToDec(f.FileSize, 9, ' ')
    end
    else
    begin
      fl.Cells[1, i] := ' < DIR > ';
      fl.Objects[1, i] := TObject(f);
    end;
    f := f.Next;
    Inc(i);
  end;
  if i = 1 then
  begin
   fl.Rows[1].Clear;
   i := 2;
  end;
  fl.RowCount := i;
end;

procedure TfrmTree.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then close;
end;

procedure TfrmTree.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmTree.Extract1Click(Sender: TObject);
var
  TargetName: String;
  SourceFile: PFileEntry;
begin
  SourceFile := PFileEntry(fl.Objects[1,fl.Row]);
  TargetName := SourceFile.LongName;
  if ((SourceFile.Attr and faDirectory) = faDirectory) then
  begin
    ShowMessage('You can not extract directory, '+TargetName+' is a directory');
    exit;
  end;
  if InputQuery('Extract File','Enter Filename and Path', TargetName) then
  begin
    frmCD.mcdb.ExtractFile(sourceFile, TargetName)
  end;
end;

procedure TfrmTree.MsgClick(Sender: TObject);
var
  TargetName: String;
  SourceFile: PFileEntry;
  i: Integer;
begin
  for i:=0 to fl.RowCount -1 do
  begin
    SourceFile := PFileEntry(fl.Objects[1,i]);
    if SourceFile <> nil then
    begin
      TargetName := SourceFile.LongName;

      if ((SourceFile.Attr and faDirectory) <> faDirectory) then
      begin
        Msg.Caption := 'Extracting '+TargetName;
        frmCD.mcdb.ExtractFile(sourceFile, 'c:\'+TargetName);
      end;
    end;
  end;
end;

end.
