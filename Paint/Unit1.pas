unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ColorGrd, StdCtrls, Spin, ExtCtrls, Menus, Buttons, ExtDlgs;

type
  TForm1 = class(TForm)
    Image1: TImage;
    ColorGrid1: TColorGrid;
    MainMenu1: TMainMenu;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    Windows1: TMenuItem;
    Windows2: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    Panel4: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel5: TPanel;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    Panel6: TPanel;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    Memo1: TMemo;
    ColorDialog1: TColorDialog;
    ScrollBox1: TScrollBox;
    Panel7: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel8: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ColorGrid1Change(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N55Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure Label19Click(Sender: TObject);
    procedure Label20Click(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure Label22Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  funcpencil  = 1;
  funcfill    = 2;
  funcgetcol  = 3;
  funcline    = 4;
  funcerase   = 5;
  funcspray   = 6;
  funcrect    = 7;
  funcellip   = 8;
  funcrrect   = 9;
  funcwrite   = 10;
  funcbezier  = 11;
  funcpolygon = 12;
  funcbrush   = 13;
var
  Form1   : TForm1;
  func    : byte;
  fcol    : tcolor;
  bcol    : tcolor;
  Image   : TImage;
  fx,fy   : integer;
  stx,sty : integer;
  eraser  : integer;
  but     : TShiftState;
  rad     : byte;
  stil    : byte;
  points  : array [1..4] of TPoint;
  NumP    : byte;
  wid,het : LongInt;
  mastab  : byte;
  polyg   : array of TPoint;
  brkind,brsize : byte;
implementation

{$R *.dfm}
uses proc, AbPr;
procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if ssLeft in shift then
   case func of
    funcpencil : pencil(x,y,fcol);
    funcline   : begin
                  line(fx,fy,stx,sty,fcol{clwhite});
                  line(fx,fy,x,y,fcol);
                  stx:=x;sty:=y;
                 end;
    funcerase  : erase(x,y,eraser,bcol);
    funcspray  : spray(x,y,fcol);
    funcrect   : begin
                  rectan(fx,fy,stx,sty,fcol{clwhite});
                  rectan(fx,fy,x,y,fcol);
                  stx:=x;sty:=y;
                 end;
    funcellip  : begin
                  ellips(fx,fy,stx,sty,fcol{clwhite});
                  ellips(fx,fy,x,y,fcol);
                  stx:=x;sty:=y;
                 end;
    funcrrect  : begin
                  rrect(fx,fy,stx,sty,fcol{clwhite});
                  rrect(fx,fy,x,y,fcol);
                  stx:=x;sty:=y;
                 end;
    funcbezier : begin
                  if nump<>0 then
                   begin
                  //  image.Canvas.Pen.Mode:= pmnotXOR;
                    bezier(stx,sty,fcol);
                 //   image.Canvas.Pen.Mode:= pmcopy;
                   end;
                 // clear;
                //  if nump>4 then nump:=0;
                  bezier(x,y,fcol);
                  stx:=x;sty:=y;
                 end;
  //  funcpolygon : polygn(x,y,fcol);
    funcbrush   : brushdo(x,y,fcol);

   end;
 if ssright in shift then
   case func of
    funcpencil : pencil(x,y,bcol);
    funcline   : begin
                  line(fx,fy,stx,sty,bcol{clwhite});
                  line(fx,fy,x,y,bcol);
                  stx:=x;sty:=y;
                 end;
    funcerase  : erase(x,y,eraser,fcol);
    funcspray  : spray(x,y,bcol);
    funcrect   : begin
                  rectan(fx,fy,stx,sty,bcol{clwhite});
                  rectan(fx,fy,x,y,bcol);
                  stx:=x;sty:=y;
                 end;
    funcellip  : begin
                  ellips(fx,fy,stx,sty,bcol{clwhite});
                  ellips(fx,fy,x,y,bcol);
                  stx:=x;sty:=y;
                 end;
    funcrrect  : begin
                  rrect(fx,fy,stx,sty,bcol{clwhite});
                  rrect(fx,fy,x,y,bcol);
                  stx:=x;sty:=y;
                 end;
    funcbezier : begin
                  if nump<>0 then
                   begin
                //    image.Canvas.Pen.Mode:= pmnotXOR;
                    bezier(stx,sty,bcol);
                  //  image.Canvas.Pen.Mode:= pmcopy;
                   end;
                 // clear;
                //  if nump>4 then nump:=0;
                  bezier(x,y,bcol);
                  stx:=x;sty:=y;
                 end;
  //  funcpolygon : polygn(x,y,fcol);
    funcbrush   : brushdo(x,y,bcol);

   end;

 Image.Canvas.MoveTo(x,y);
end;



procedure TForm1.ColorGrid1Change(Sender: TObject);
begin
 fcol:=colorgrid1.ForegroundColor;
 bcol:=colorgrid1.BackgroundColor;
 form1.Label2.Color:=colorgrid1.ForegroundColor;
 form1.Label1.Color:=colorgrid1.BackgroundColor;
end;


procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i:integer;
    st:string;
    count:integer;
begin
 if ssLeft in shift then
   case func of
    funcfill   : fill(x,y,fcol);
    funcgetcol : begin
                  getcol(x,y,fcol);
                  label2.Color:=fcol;
                 end;
    funcline   : begin
                  image.Canvas.Pen.Mode:= pmnotXOR;
                  fx:=x;
                  fy:=y;
                  stx:=x;sty:=y;
                  but:=[ssleft];
                 end;
    funcspray  : spray(x,y,fcol);
    funcrect   : begin
                  image.Canvas.Pen.Mode:= pmnotXOR;
                  fx:=x;
                  fy:=y;
                  stx:=x;sty:=y;
                  but:=[ssleft];
                  setstyle;
                 end;
    funcellip  : begin
                  image.Canvas.Pen.Mode:= pmnotXOR;
                  fx:=x;
                  fy:=y;
                  stx:=x;sty:=y;
                  but:=[ssleft];
                  setstyle;
                 end;
    funcrrect  : begin
                  image.Canvas.Pen.Mode:= pmnotXOR;
                  fx:=x;
                  fy:=y;
                  stx:=x;sty:=y;
                  but:=[ssleft];
                  setstyle;
                 end;
    funcwrite  : begin
                  memo1.Font.Color:=fcol;
                  form1.memo1.Left:=x;
                  form1.memo1.Top:=y;
                  form1.memo1.Show;
                  func:=100;
                 end;
    100        : begin
                  Memo1.Hide;
                  image.Canvas.Font:=memo1.Font;
                  count:=form1.Memo1.Lines.Count;
                  for i:=0 to count do
                   image.canvas.TextOut(memo1.Left-image.Left,memo1.Top+i*memo1.Font.Size*2-image.Top,memo1.Lines[i]);
                 end;
    funcbezier : begin
                  but:=[ssleft];
                  if nump<>0 then
                   begin
                  //  image.Canvas.Pen.Mode:= pmnotXOR;
                    bezier(stx,sty,fcol);
                  //  image.Canvas.Pen.Mode:= pmcopy;
                   end;
                 // clear;
                  inc(nump);
                  if nump>4 then nump:=0;
                  bezier(x,y,fcol);
                  stx:=x;sty:=y;
                 end;
    funcpolygon : begin
              //     image.Canvas.Pen.Mode:= pmnotXOR;
                   inc(nump);
                   polygn(x,y,fcol);
                  end;
   end;
 if ssright in shift then
   case func of
    funcfill   : fill(x,y,bcol);
    funcgetcol : begin
                  getcol(x,y,bcol);
                  label1.Color:=bcol;
                 end;
    funcline   : begin
                  image.Canvas.Pen.Mode:= pmnotXOR;
                  fx:=x;
                  fy:=y;
                  stx:=x;sty:=y;
                  but:=[ssright];
                 end;
    funcspray  : spray(x,y,bcol);
    funcrect   : begin
                  image.Canvas.Pen.Mode:= pmnotXOR;
                  fx:=x;
                  fy:=y;
                  stx:=x;sty:=y;
                  but:=[ssright];
                  setstyle;
                 end;
    funcellip  : begin
                  image.Canvas.Pen.Mode:= pmnotXOR;
                  fx:=x;
                  fy:=y;
                  stx:=x;sty:=y;
                  but:=[ssright];
                  setstyle;
                 end;
    funcrrect  : begin
                  image.Canvas.Pen.Mode:= pmnotXOR;
                  fx:=x;
                  fy:=y;
                  stx:=x;sty:=y;
                  but:=[ssright];
                  setstyle;
                 end;
    funcwrite  : begin
                  memo1.Font.Color:=bcol;
                  form1.memo1.Left:=x;
                  form1.memo1.Top:=y;
                  form1.memo1.Show;
                  func:=100;
                 end;
    100        : begin
                  Memo1.Hide;
                  image.Canvas.Font:=memo1.Font;
                  count:=form1.Memo1.Lines.Count;
                  for i:=0 to count do
                   image.canvas.TextOut(memo1.Left-image.Left,memo1.Top+i*memo1.Font.Size*2-image.Top,memo1.Lines[i]);
                 end;
    funcbezier : begin
                  but:=[ssright];
                  if nump<>0 then
                   begin
                  //  image.Canvas.Pen.Mode:= pmnotXOR;
                    bezier(stx,sty,bcol);
                   // image.Canvas.Pen.Mode:= pmcopy;
                   end;
                 // clear;
                  inc(nump);
                  if nump>4 then nump:=0;
                  bezier(x,y,bcol);
                  stx:=x;sty:=y;
                 end;
    funcpolygon : begin
                  // image.Canvas.Pen.Mode:= pmnotXOR;
                   inc(nump);
                   polygn(x,y,bcol);
                  end;

   end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//form2.hide;

memo1.Hide;
eraser:=3;
openpicturedialog1.FilterIndex:=4;
openpicturedialog1.InitialDir:=extractfilepath(paramstr(0));
savepicturedialog1.InitialDir:=extractfilepath(paramstr(0));

 panhide;
 Image:=form1.image1;
 wid:=image.Width;
 het:=image.Height;
 image.Canvas.Pen.Mode:= pmcopy;
 form1.Label2.Color:=colorgrid1.ForegroundColor;
 form1.Label1.Color:=colorgrid1.BackgroundColor;
 bcol:=clwhite;
 Image.Canvas.FillRect(rect(0,0,image1.Width,image1.Height));
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
 func:=funcpencil;
panhide;
setprop;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
 func:=funcfill;
panhide;
setprop;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
func:=funcgetcol;
panhide;
setprop;
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
func:=funcline;
image.Canvas.Pen.Mode:= pmnotXOR;
panhide;
setprop;
end;

procedure TForm1.N21Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
image.Canvas.Brush.Color:=CLWHITE;
clear;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
if openpicturedialog1.Execute then
   begin
    image.AutoSize:=true;
    image.Picture.LoadFromFile(openpicturedialog1.FileName);
   end;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
if savepicturedialog1.Execute then
   begin
    image.Picture.SaveToFile(savepicturedialog1.FileName+'.bmp');
   end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
panhide;
setprop;
panel4.Show;
func:=funcerase;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
eraser:=label3.Width div 2;
end;

procedure TForm1.Label4Click(Sender: TObject);
begin
eraser:=label4.Width div 2;
end;

procedure TForm1.Label6Click(Sender: TObject);
begin
eraser:=label6.Width div 2;
end;

procedure TForm1.Label5Click(Sender: TObject);
begin
eraser:=label5.Width div 2;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
image.Canvas.Pen.Mode:= pmcopy;
 if ssleft in but then
   case func of
    funcline   : line(fx,fy,stx,sty,fcol);
    funcrect   : begin
                  rectan(fx,fy,stx,sty,fcol);
                  image.Canvas.Brush.Style:=bssolid;
                  image.Canvas.Pen.Style:=pssolid;
                 end;
    funcellip  : begin
                  ellips(fx,fy,stx,sty,fcol);
                  image.Canvas.Brush.Style:=bssolid;
                  image.Canvas.Pen.Style:=pssolid;
                 end;
    funcrrect  : begin
                  rrect(fx,fy,stx,sty,fcol);
                  image.Canvas.Brush.Style:=bssolid;
                  image.Canvas.Pen.Style:=pssolid;
                 end;
    funcbezier : if nump>=4 then bezier(stx,sty,fcol)
                            else image.Canvas.Pen.Mode:=pmnotXOR;
   end;
  if ssright in but then
   case func of
    funcline   : line(fx,fy,stx,sty,bcol);
    funcrect   : begin
                  rectan(fx,fy,stx,sty,bcol);
                  image.Canvas.Brush.Style:=bssolid;
                  image.Canvas.Pen.Style:=pssolid;
                 end;
    funcellip  : begin
                  ellips(fx,fy,stx,sty,bcol);
                  image.Canvas.Brush.Style:=bssolid;
                  image.Canvas.Pen.Style:=pssolid;
                 end;
    funcrrect  : begin
                  rrect(fx,fy,stx,sty,bcol);
                  image.Canvas.Brush.Style:=bssolid;
                  image.Canvas.Pen.Style:=pssolid;
                 end;
    funcbezier : if nump>=4 then bezier(stx,sty,bcol)
                            else image.Canvas.Pen.Mode:=pmnotXOR;

   end;

end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
func:=funcSpray;
panhide;
setprop;
 panel5.Show;
end;

procedure TForm1.SpeedButton16Click(Sender: TObject);
begin
panhide;
setprop;
end;

procedure TForm1.SpeedButton17Click(Sender: TObject);
begin
panhide;
setprop;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
//var bmp : TBitMap;
begin
//bmp.Create;
panhide;
setprop;
panel7.Show;
{bmp:=image.Picture.Bitmap;
image.Width:=image.Width*2;
image.Height:=image.Height*2;
//image1:=image;
image.Picture.Bitmap:=bmp;
image.Stretch:=false;
bmp.Free;}
image.Picture.SaveToFile(extractfilepath(paramstr(0))+'\tmp.bmp');
image.Stretch:=true;
wid:=image.Width;
het:=image.Height;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
panhide;
setprop;
panel8.Show;
func:=funcbrush;
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
panhide;
setprop;
func:=funcwrite;
end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
//var p : array [1..4] of TPoint;
begin
panhide;
setprop;
func:=funcbezier;
image.Canvas.Pen.Mode:= pmnotXOR;
end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
begin
panhide;
setprop;
panel6.show;
func:=funcrect;
end;

procedure TForm1.SpeedButton12Click(Sender: TObject);
begin
panhide;
setprop;
panel6.show;
func:=funcpolygon;
nump:=0;
//image.Canvas.Pen.Mode:= pmnotXOR;
end;

procedure TForm1.SpeedButton13Click(Sender: TObject);
begin
panhide;
setprop;
panel6.show;
func:=funcellip;
end;

procedure TForm1.SpeedButton14Click(Sender: TObject);
begin
panhide;
setprop;
panel6.show;
func:=funcrrect;
end;

procedure TForm1.SpeedButton18Click(Sender: TObject);
begin
rad:=speedbutton18.Width;// div 2;
end;

procedure TForm1.SpeedButton19Click(Sender: TObject);
begin
rad:=speedbutton19.Width;// div 2;
end;

procedure TForm1.SpeedButton20Click(Sender: TObject);
begin
rad:=speedbutton20.Width;// div 2;
end;

procedure TForm1.SpeedButton21Click(Sender: TObject);
begin
stil:=1;
image.Canvas.Brush.Color:=clwhite;
end;

procedure TForm1.SpeedButton22Click(Sender: TObject);
begin
stil:=2;
image.Canvas.Brush.Color:=bcol;
end;

procedure TForm1.SpeedButton23Click(Sender: TObject);
begin
stil:=3;
image.Canvas.Brush.Color:=bcol;
end;

procedure TForm1.N52Click(Sender: TObject);
begin
if colordialog1.Execute then
   begin
    fcol:=colordialog1.Color;
    label2.Color:=fcol;
   end;
end;

procedure TForm1.N55Click(Sender: TObject);
begin
form2.show;
end;

procedure TForm1.Label7Click(Sender: TObject);
begin
mastab:=1;
Loadim;
end;

procedure TForm1.Label8Click(Sender: TObject);
begin
mastab:=2;
Loadim;
end;

procedure TForm1.Label9Click(Sender: TObject);
begin
mastab:=6;
Loadim;
end;

procedure TForm1.Label10Click(Sender: TObject);
begin
mastab:=8;
Loadim;
end;

procedure TForm1.Label11Click(Sender: TObject);
begin
brkind:=1;
brsize:=5;
end;

procedure TForm1.Label12Click(Sender: TObject);
begin
brkind:=1;
brsize:=4;

end;

procedure TForm1.Label13Click(Sender: TObject);
begin
brkind:=1;
brsize:=3;

end;

procedure TForm1.Label14Click(Sender: TObject);
begin
brkind:=2;
brsize:=5;

end;

procedure TForm1.Label15Click(Sender: TObject);
begin
brkind:=2;
brsize:=4;

end;

procedure TForm1.Label16Click(Sender: TObject);
begin
brkind:=2;
brsize:=3;

end;

procedure TForm1.Label17Click(Sender: TObject);
begin
brkind:=3;
brsize:=3;

end;

procedure TForm1.Label18Click(Sender: TObject);
begin
brkind:=3;
brsize:=2;

end;

procedure TForm1.Label19Click(Sender: TObject);
begin
brkind:=3;
brsize:=1;

end;

procedure TForm1.Label20Click(Sender: TObject);
begin
brkind:=4;
brsize:=3;

end;

procedure TForm1.Label21Click(Sender: TObject);
begin
brkind:=4;
brsize:=2;

end;

procedure TForm1.Label22Click(Sender: TObject);
begin
brkind:=4;
brsize:=1;

end;

end.
