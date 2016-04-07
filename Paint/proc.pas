unit proc;

interface
uses// Graphics, Classes;
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ColorGrd, StdCtrls, Spin, ExtCtrls, Menus, Buttons, ExtDlgs;

procedure pencil(x,y:integer;col:tcolor);
procedure line(x1,y1,x2,y2:integer;col:tcolor);
procedure erase(x,y,t:integer;col:tcolor);
procedure spray(x,y:integer;col:tcolor);
procedure rectan(x1,y1,x2,y2:integer;col:tcolor);
procedure ellips(x1,y1,x2,y2:integer;col:tcolor);
procedure rrect(x1,y1,x2,y2:integer;col:tcolor);
procedure fill(x,y:integer;col:tcolor);
procedure getcol(x,y:integer;var col:tcolor);
procedure setstyle;
procedure panhide;
procedure clear;
procedure bezier(x,y:integer;col:tcolor);
procedure loadim;
procedure setprop;
procedure polygn(x,y:integer;col:tcolor);
procedure brushdo(x,y:integer;col:tcolor);

implementation

uses unit1;

procedure clear;
begin
with image do canvas.fillrect(rect(0,0,width,height));
end;


procedure pencil(x,y:integer;col:tcolor);
begin
with image.Canvas do
 begin
  Pen.Color:=col;
  lineto(x,y);
 end;
end;

procedure line(x1,y1,x2,y2:integer;col:tcolor);
begin
with image.Canvas do
 begin
  Pen.Color:=col;
  moveto(x1,y1);
  lineto(x2,y2);
 end;
end;

procedure erase(x,y,t:integer;col:tcolor);
begin
with image.Canvas do
 begin
  Brush.Color:=col;
  fillrect(rect(x-t,y-t,x+t,y+t));
 end;

end;

procedure spray(x,y:integer;col:tcolor);
var i:integer;
   tx,ty : integer;
begin
 for i:=1 to rad do
  begin
   tx:=random(2*rad)-rad;
   ty:=random(2*rad)-rad;
   if tx*tx+ty*ty<=rad*rad then image.Canvas.Pixels[x+tx,y+ty]:=col;
  end;
end;

procedure rectan(x1,y1,x2,y2:integer;col:tcolor);
begin
with image.Canvas do
 begin
  pen.Color:=col;
  rectangle(rect(x1,y1,x2,y2));
 end;
end;

procedure ellips(x1,y1,x2,y2:integer;col:tcolor);
begin
with image.Canvas do
 begin
  pen.Color:=col;
  ellipse(x1,y1,x2,y2);
 end;
end;

procedure rrect(x1,y1,x2,y2:integer;col:tcolor);
begin
with image.Canvas do
 begin
  pen.Color:=col;
  roundrect(x1,y1,x2,y2,(x1+x2) div 4,(y1+y2)div 4);
 end;
end;

procedure fill(x,y:integer;col:tcolor);
begin
with image.Canvas do
 begin
  brush.Color:=col;
  FloodFill(x,y,pixels[x,y],fsSurface);
 end;
end;

procedure getcol(x,y:integer;var col:tcolor);
begin
col:=image.Canvas.Pixels[x,y];
end;

procedure setstyle;
begin
with image.Canvas do
 case stil of
  1 : begin
       pen.Style:=psSolid;
       brush.Style:=bsClear;
      end;
  2 : begin
       pen.Style:=psSolid;
       brush.Style:=bsSolid;
      end;
  3 : begin
       pen.Style:=psClear;
       brush.Style:=bsSolid;
      end;
 end;

end;

procedure panhide;
begin
 form1.Panel4.Hide;
 form1.Panel5.Hide;
 form1.Panel6.Hide;
 form1.Panel7.Hide;
 form1.Panel8.Hide;
end;

procedure bezier(x,y:integer;col:tcolor);
begin
points[nump].X:=x;
points[nump].Y:=y;
image.Canvas.Pen.Color:=col;
image.Canvas.PolyBezier(points);
end;

procedure loadim;
begin
image.Width:=mastab*wid;
image.height:=mastab*het;
image.Picture.LoadFromFile(extractfilepath(paramstr(0))+'tmp.bmp');
end;

procedure setprop;
begin
image.Width:=wid;
image.Height:=het;
end;

procedure polygn(x,y:integer;col:tcolor);
begin
image.Canvas.Pen.Color:=col;
setlength(polyg,nump);
polyg[nump-1].X:=x;
polyg[nump-1].Y:=y;
image.Canvas.Polygon(polyg);
end;

procedure brushdo(x,y:integer;col:tcolor);
begin
with image.Canvas do
 begin
  pen.Color:=col;
  brush.Color:=col;
  case brkind of
   1 : ellipse(x-brsize,y-brsize,x+brsize,y+brsize);
   2 : rectangle(x-brsize,y-brsize,x+brsize,y+brsize);
   3 : begin
        moveto(x-brsize,y+2*brsize);
        lineto(x+brsize,y-2*brsize);
       end;
   4 : begin
        moveto(x-brsize,y-2*brsize);
        lineto(x+brsize,y+2*brsize);
       end;
  end;

 end;
end;

end.
