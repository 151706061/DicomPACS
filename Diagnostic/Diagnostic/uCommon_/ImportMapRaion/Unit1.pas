unit Unit1;

/////////////////////////////////////////////////////////////////////////////////
//                                                                             //
//  Данный пример демонстрирует следующие моменты                              //
//    1. Подключение выпадающего списка выбора инструментов векторного поля    //
//    2. Динамическая работа с инструментами векторного поля                   //
//    3. Изменение параметров объекта, создаваемого инструментами              //
//    4. Работу с инструментом iZoom (Линза) в режиме выбора региона           //
//    5. Работу с инструментом iZoom (Линза) в режиме кликания                 //
//    6. Вывод на печать фрагмента карты с добавлением своего текста           //
//    7. Выбор и вывод на печать фрагмента карты                               //
//    8. Динамическая настройка режима редактирования векторного поля          //
//    9. Настройку отображения параметров инструмента iMeasure (Линейка)       //
//       (см. инспектор объектов DgMap.MeasureScaleFactor, DgMap.MeasureLabel) //
//   10. Настройку отображения кривой инструмента iMeasure (Линейка)           //                                                               //
//                                                                             //
/////////////////////////////////////////////////////////////////////////////////

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataGIS, StdCtrls, DataGIScombo, StrUtils, DB, OracleData, Oracle;

type
  TForm1 = class(TForm)
    DgInstrumentCombo1: TDgInstrumentCombo;
    DgMap1: TDgMap;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    CheckBox1: TCheckBox;
    Button9: TButton;
    DgLayer1: TDgLayer;
    DgEvent1: TDgEvent;
    Button10: TButton;
    Button11: TButton;
    teCaption: TEdit;
    Button12: TButton;
    cbVisible: TCheckBox;
    cbLabel: TCheckBox;
    Button5: TButton;
    qInsertStreet: TOracleQuery;
    os: TOracleSession;
    odsRaion: TOracleDataSet;
    lbItems: TListBox;
    qInsertHouse: TOracleQuery;
    cbHome: TCheckBox;
    lbPerekrestok: TListBox;
    qPerekrestok: TOracleQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure DgMap1AddInstrumentObject(Sender: TMapObject);
    procedure DgMap1ZoomMap(const AMapRect: TMRect);
    procedure DgMap1Print(Canva: TCanvas);
    procedure DgMap1PrintRectSelect(const AMapRect: TMRect);
    procedure CheckBox1Click(Sender: TObject);
    procedure DgMap1MeasureDraw(Canva: TCanvas; const kLine: TKnots;
      const tLine: TPoints; const kPt: TKnot; const tPt: TPoint);
    procedure DgMap1ZoomClick(Button: TMouseButton; tPt: TPoint;
      kPt: TKnot);
    procedure Button9Click(Sender: TObject);
    procedure DgMap1CreateObject(Sender: TMapObject);
    procedure DgMap1ChangeCurObject(OldMO, NewMO: TMapObject);
    procedure FormClick(Sender: TObject);
    procedure DgEvent1SelectRib(Sender: TMapObject; Prior, Next: Integer; X,
      Y: Double);
    procedure DgMap1DblClick(Sender: TObject);
    procedure DgMap1BeforeExportObject(Sender: TMapObject;
      var NeedTake: Boolean);
    procedure Button10Click(Sender: TObject);
    procedure DgMap1AfterImportObject(Sender: TMapObject; AParams: string);
    procedure DgMap1AfterLoadObject(Sender: TMapObject);
    procedure FormCreate(Sender: TObject);
    procedure DgMap1BeforeLoadObject(Sender: TMapObject; var NeedTake: Boolean);
    procedure DgMap1BeforeSaveObject(Sender: TMapObject; var NeedTake: Boolean);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure cbVisibleClick(Sender: TObject);
    procedure DgMap1BeforeImportObject(AClass: TClass; AParams: string;
      var NeedTake: Boolean);
    procedure cbLabelClick(Sender: TObject);
    procedure DgMap1ChangeScale(Sender: TObject);
  private
    { Private declarations }
    FX, FY:Double;
    FNext:Integer;
    FSender: TMapObject;
    FIsLoadNow:Boolean;
    function GetRaionIdByName(aName:string):Integer;
    procedure GetRaionStreet(mo:TMapObject);
    procedure DoMapObjectInRaion(Sender: TMapObject; araion:Integer; amoraion:TMapObject);
    function PtInRgn(TestPolygon : array of TPoint; const P : TPoint): boolean;
    procedure GetPerekrestok(araion:Integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
const
  MyObjects = 999;
  linescale = 10000;  

implementation

{$R *.dfm}

procedure TForm1.Button10Click(Sender: TObject);
var
  li: TLogImport;
begin
  FIsLoadNow := true;
  DgMap1.Edit := False;
  DgMap1.Instrument := iHand;

  try
    Screen.Cursor := crHourGlass;

    with li do
    begin
      Visible := True;
      Enabled := True;
      //Layer := 2;
      Process := True;
      Pseudo3D := False;
      UseGDIplus := False;
    end;
    //DgMap1.ImportFromMIF('c:\1.mif', DgMap1.logImport);
    DgLayer1.LoadFromFile('c:\1.mif');


  finally
    Screen.Cursor := crDefault;
    DgMap1.RePaints;
    DgMap1.ViewAll;
    DgMap1.ReDraws;
    FIsLoadNow := false;
    //DgPreview1.ReDraws;
  end;

end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  FIsLoadNow := true;
  with TOpenDialog.Create(Self) do
    if Execute then
    begin
      DgMap1.CleanMap;
      DgMap1.ImportFromPolishMap(FileName);
      DgMap1.ViewAll;
      DgMap1.ReDraws;
    end;
  FIsLoadNow := false;    
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  if DgMap1.CurObject.Code = MyObjects then
  begin
    DgMap1.CurObject.Caption := teCaption.Text;
    if DgMap1.CurObject.IsMapLabel then
      DgMap1.CurObject.DelLabel;
    DgMap1.CurObject.AddLabel(DgMap1.CurObject.Center, DgMap1.CurObject.Caption, clRed, 0);
    DgMap1.RePaints;
    DgMap1.ReDraws;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  DgMap1.Instrument := iCursor;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  DgMap1.Instrument := iHand;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  DgMap1.Instrument := iZoom;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  DgMap1.Instrument := iMeasure;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  mo:TMapObject;
begin
  mo := DgLayer1.GetFirst;
  while mo<>nil do
  begin
    lbItems.Items.Clear;
    GetRaionStreet(mo);
    mo := DgLayer1.GetNext(mo);
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  DgMap1.Instrument := iPolygon;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  DgMap1.Instrument := iEllipse;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  DgMap1.Instrument := iPrintRect;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
 // DgMap1.ExportToMIF(csLocal,'c:\1.mif');
  DgLayer1.SaveToFile('c:\1.mif');
end;

procedure TForm1.DgEvent1SelectRib(Sender: TMapObject; Prior, Next: Integer; X,
  Y: Double);
begin
  FNext:=Next;
  FX:=X;
  FY:=Y;
  FSender:=Sender;
end;

procedure TForm1.DgMap1AddInstrumentObject(Sender: TMapObject);
begin
  Sender.Pen.Color := clRed;
  DgMap1.ReDraws;
end;

procedure TForm1.DgMap1AfterImportObject(Sender: TMapObject; AParams: string);
var
  name:string;
  sl:TStringList;
begin
  Sender.AddParams(AParams);
  if (Sender is TMapPoint) then
  begin
    Sender.Visible := false;
   // Exit;
  end;

    if AnsiContainsText(AParams, 'Label=') then
    begin
      sl := TStringList.Create;
      try
        sl.Text := Trim(AParams);
        //if (sl.Count > 2) and (sl.Count < 5) then
        begin
         // if ((sl[0]='Type=0x6')or(sl[0]='Type=0x6100')or(sl[0]='Type=0x6a')) then
          begin
            name := sl[1];
            if (name<>'') then
            begin
              name := AnsiReplaceText(name, 'Label=','');

              Sender.AddLabel(Sender.Center, name, clRed, 0);
              Sender.MapLabel.Show;
            end;
          end;
        end;
      finally
        sl.Free;
      end;
    end;

end;

procedure TForm1.DgMap1AfterLoadObject(Sender: TMapObject);
begin
 Sender.AddLabel(Sender.Center, Sender.Caption, clRed, 0);
end;

procedure TForm1.DgMap1BeforeExportObject(Sender: TMapObject;
  var NeedTake: Boolean);
begin
  NeedTake := (Sender is TMapPolygon);
  
end;

procedure TForm1.DgMap1BeforeImportObject(AClass: TClass; AParams: string;
  var NeedTake: Boolean);
begin
  if not (AnsiContainsText(AParams, 'Data0')) then
  begin
    NeedTake := False;
    Exit;
  end;
end;

procedure TForm1.DgMap1BeforeLoadObject(Sender: TMapObject;
  var NeedTake: Boolean);
begin
 // NeedTake := (Sender is TMapPolygon);
end;

procedure TForm1.DgMap1BeforeSaveObject(Sender: TMapObject;
  var NeedTake: Boolean);
begin
  NeedTake := (Sender.Code = MyObjects);
end;

procedure TForm1.DgMap1ChangeCurObject(OldMO, NewMO: TMapObject);
begin
 // NewMO.DgLayer := DgLayer1;
 // NewMO.Brush.Color := clWhite;
 // NewMO.Brush.Style := bsSolid;
//  DgLayer1.ReDraws;
//  DgMap1.ViewAll;
//  DgMap1.ReDraws;
  DgLayer1.Edited := true;
  //ShowMessage(NewMO.Caption);
  if (NewMO.Code = MyObjects) then
    teCaption.Text := NewMO.Caption;

//  NewMO.DgEvent := DgEvent1;
end;

procedure TForm1.DgMap1ChangeScale(Sender: TObject);
var
  len: Double;
  mo:TMapObject;
begin
  mo := DgMap1.GetFirst;
  while mo<>nil do
  begin
    if (mo is TMapPoint) then
    begin
      mo.Visible := DgMap1.ScaleMap<linescale;
      mo := DgMap1.GetNext(mo);      
      Continue;
    end;

    if mo.IsMapLabel then
    begin
      len := ObjLen(mo.ObjPoint0, mo.ObjPoint3);
      if cbLabel.Checked then
        if mo is TMapPoint then
        begin
          mo.MapLabel.Visible := (DgMap1.GetDistance(len) > 80 ) and cbHome.Checked;
        end
        else begin
          mo.MapLabel.Visible := (DgMap1.GetDistance(len) > 80 );
        end;
    end;
    mo := DgMap1.GetNext(mo);
  end;
  DgMap1.RePaints;
  DgMap1.ReDraws;
end;

procedure TForm1.DgMap1CreateObject(Sender: TMapObject);
begin

  //ShowMessage('1');
  if (FIsLoadNow) then 
    Exit;

  Sender.DgLayer := DgLayer1;
  Sender.DgEvent := DgEvent1;  
  Sender.Brush.Color := clWhite;
  Sender.Brush.Style := bsSolid;
  Sender.Caption := 'test';
  Sender.Code := MyObjects;
 // Sender.AddParams('dddddd');
  Sender.AddLabel(Sender.Center, 'ddfffffdddd', clRed, 0);
  DgMap1.RePaints;
  DgMap1.ReDraws;
  //ShowMessage(Sender.ClassName);
end;

procedure TForm1.DgMap1DblClick(Sender: TObject);
begin
  if (DgMap1.MapPos.X = FX) and (DgMap1.MapPos.Y = FY) and (FSender<>nil) then
  begin
  (FSender as TMapCurve).InsertPoint(FNext, FX, FY);
  DgLayer1.ReDraws;
  FSender := nil;
 // DgMap1.ViewAll;
 // DgMap1.ReDraws;
  end;
end;

procedure TForm1.DgMap1ZoomMap(const AMapRect: TMRect);
begin
  DgMap1.ViewMapRect(AMapRect);
  DgMap1.ReDraws;
end;

procedure TForm1.FormClick(Sender: TObject);
begin
//TMapCurve класс абстрактный, пример приведен для полилинии 
//  if TMapLine(DgMap1.CurObject).PtInBorder() then
//    ShowMessage('Точка входит в линию')
//  else
//    ShowMessage('Точка не лежит в пределах линии')
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
FIsLoadNow := false;
end;

procedure TForm1.DgMap1Print(Canva: TCanvas);
begin
  with Canva do
    TextOut(100, 100, 'DataGIS - демо пример');
end;

procedure TForm1.DgMap1PrintRectSelect(const AMapRect: TMRect);
begin
  if MessageDlg('Инструмент печати векторного поля DgMap ГИС. Печатать выбранный регион?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DgMap1.PrintMRect(AMapRect);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  DgMap1.Edit := CheckBox1.Checked;
end;

procedure TForm1.cbLabelClick(Sender: TObject);
var
  mo:TMapObject;
begin
  mo := DgMap1.GetFirst;
  while mo<>nil do
  begin
    if mo.IsMapLabel then
    begin
      if (cbLabel.Checked) then
      begin
        if (mo is TMapPoint) then
        begin
          mo.MapLabel.Visible := cbLabel.Checked and cbHome.Checked;
        end
        else begin
          mo.MapLabel.Visible := cbLabel.Checked;
        end;
      end
      else begin
        mo.MapLabel.Visible := False;
      end;
    end;
    mo := DgMap1.GetNext(mo);
  end;
  DgMap1.RePaints;
  DgMap1.ReDraws;
end;

procedure TForm1.cbVisibleClick(Sender: TObject);
var
  mo:TMapObject;
begin
  mo := DgLayer1.GetFirst;
  while mo<>nil do
  begin
    mo.Visible := not cbVisible.Checked;
    mo := DgLayer1.GetNext(mo);
  end;
  DgMap1.RePaints;
  DgMap1.ReDraws;
end;

procedure TForm1.DgMap1MeasureDraw(Canva: TCanvas; const kLine: TKnots;
  const tLine: TPoints; const kPt: TKnot; const tPt: TPoint);
var
  i: integer;
begin
  for i := 0 to length(tLine) - 1 do
  begin
    Canva.Ellipse(tline[i].X - 5, tline[i].Y - 5, tline[i].X + 5, tline[i].Y + 5);
  end;
end;

procedure TForm1.DgMap1ZoomClick(Button: TMouseButton; tPt: TPoint;
  kPt: TKnot);
begin
  case Button of
    mbLeft: DgMap1.Scale := DgMap1.Scale * 1.1;
    mbRight: DgMap1.Scale := DgMap1.Scale * 0.9;
  end;
  DgMap1.ReDraws;
end;

function TForm1.GetRaionIdByName(aName:string):Integer;
begin
  with odsRaion do
  begin
    Session.LogOn;
    Close;
    SetVariable('pname',aName);
    Open;
    if recordcount > 0 then
      Result := FieldByName('fk_id').AsInteger
    else
      Result := -1;
  end;
end;

procedure TForm1.GetRaionStreet(mo:TMapObject);
var
  iRaion: Integer;
  moMap:TMapObject;
begin
  if (mo.Code = MyObjects) and (mo is TMapPolygon) then
  begin
    iRaion := GetRaionIdByName(mo.Caption);
    if (iRaion > 0) then
    begin
        moMap := DgMap1.GetFirst;
        while moMap<>nil do
        begin
          if (moMap.IsMapLabel) and (moMap.Code <> MyObjects) then
          begin
            DoMapObjectInRaion(moMap,iRaion, mo);
          end;
          moMap := DgMap1.GetNext(moMap);
        end;
    end;
    GetPerekrestok(iRaion);    
  end;
end;

procedure TForm1.DoMapObjectInRaion(Sender: TMapObject; araion:Integer; amoraion:TMapObject);
var
  sname, streetname:string;
  sl:TStringList;
  I: Integer;
  prefix,bdname:string;
  ipos:Integer;
  po: TPoints;
  Z:Integer;
  IsMapPoint:boolean;
begin
    if Sender.Params=nil then
      Exit;
    IsMapPoint := (Sender is TMapPoint);
    
    if AnsiContainsText(Sender.Params.Text, 'Label=') then
    begin
      sl := TStringList.Create;
      try
        sl.Text := Trim(Sender.Params.Text);
        begin
          for I := 0 to sl.Count - 1 do
          begin
            if (AnsiContainsText(sl[I], 'Label=')) then
            begin
              sname := AnsiReplaceText(sl[I], 'Label=','');
              bdname := Trim(sname);
              if (AnsiContainsText(sname, '.')) then
              begin
                    iPos := Pos('.',sname);
                    prefix:=AnsiLeftStr(sname,ipos);
                    bdname := AnsiReplaceStr(sname,prefix,'');
                    prefix := Trim(prefix);
                    prefix := AnsiReplaceStr(prefix,'.','');
                    bdname := Trim(bdname);

              end;
              if not IsMapPoint then
                 Break;
            end;
            if (AnsiContainsText(sl[I], 'StreetDesc=')) then
            begin
              streetname := AnsiReplaceText(sl[I], 'StreetDesc=','');
              if (AnsiContainsText(streetname, '.')) then
              begin
                    iPos := Pos('.',streetname);
                    prefix:=AnsiLeftStr(streetname,ipos);
                    streetname := AnsiReplaceStr(streetname,prefix,'');
              end;
            end;

          end;
          if (bdname<>'') then
          begin
             SetLength(po, Length(TMapPolygon(amoraion).Nodes));
             for Z := 0 to Length(TMapPolygon(amoraion).Nodes) - 1 do
             begin
               po[z] := Point(Round( TMapPolygon(amoraion).Nodes[z].X*1000),round(TMapPolygon(amoraion).Nodes[z].Y*1000));
             end;

             if (PtInRgn(po, Point(round(Sender.Center.X*1000),round(Sender.Center.Y*1000)))) then
             begin
               if IsMapPoint then
               begin
                { with qInsertHouse do
                 begin
                   ClearVariables;
                   //:PRAION, :STREET, :PHOUSE
                   SetVariable('PHOUSE',sname);
                   SetVariable('PRAION',araion);
                   SetVariable('STREET',streetname);
                   Execute;
                   Session.Commit;
                 end;   }
               end
               else begin
                 with qInsertStreet do
                 begin
                   ClearVariables;
                   //:PMAPNAME, :PRAION
                   SetVariable('PMAPNAME',sname);
                   SetVariable('PRAION',araion);
                   Execute;
                   Session.Commit;
                 end;
               end;
               lbItems.Items.AddObject(sname,Sender);
             end;
             SetLength(po, 0);
          end;
        end;
      finally
        sl.Free;
      end;
    end;
end;

function TForm1.PtInRgn(TestPolygon : array of TPoint; const P : TPoint): boolean;
 var
   ToTheLeftofPoint, ToTheRightofPoint : byte;
   np : integer;
   OpenPolygon : boolean;
   XIntersection : real;
 begin
   ToTheLeftofPoint := 0;
   ToTheRightofPoint := 0;
   OpenPolygon := False;

   {Prufen ob das Polygon geschlossen ist}
   {tests if the polygon is closed}

   if not ((TestPolygon[0].X = TestPolygon[High(TestPolygon)].X) and
     (TestPolygon[0].Y = TestPolygon[High(TestPolygon)].Y)) then
     OpenPolygon := True;

   {Tests fur jedes Paar der Punkte, um zu sehen wenn die Seite zwischen 
   ihnen, die horizontale Linie schneidet, die TestPoint durchlauft}
   {tests for each couple of points to see if the side between them 
   crosses the horizontal line going through TestPoint}

   for np := 1 to High(TestPolygon) do
     if ((TestPolygon[np - 1].Y <= P.Y) and
       (TestPolygon[np].Y > P.Y)) or
       ((TestPolygon[np - 1].Y > P.Y) and
       (TestPolygon[np].Y <= P.Y))
       {Wenn es so ist}    {if it does}
       then
     begin
       {berechnet die x Koordinate des Schnitts}
       {computes the x coordinate of the intersection}

       XIntersection := TestPolygon[np - 1].X +
         ((TestPolygon[np].X - TestPolygon[np - 1].X) /
         (TestPolygon[np].Y - TestPolygon[np - 1].Y)) * (P.Y - TestPolygon[np - 1].Y);

       {Zahler entsprechend verringern}
       {increments appropriate counter}
       if XIntersection < P.X then Inc(ToTheLeftofPoint);
       if XIntersection > P.X then Inc(ToTheRightofPoint);
     end;

   {Falls das Polygon offen ist, die letzte Seite testen}
   {if the polygon is open, test for the last side}

   if OpenPolygon then
   begin
     np := High(TestPolygon);  {Thanks to William Boyd - 03/06/2001}
     if ((TestPolygon[np].Y <= P.Y) and
       (TestPolygon[0].Y > P.Y)) or
       ((TestPolygon[np].Y > P.Y) and
       (TestPolygon[0].Y <= P.Y)) then
     begin
       XIntersection := TestPolygon[np].X +
         ((TestPolygon[0].X - TestPolygon[np].X) /
         (TestPolygon[0].Y - TestPolygon[np].Y)) * (P.Y - TestPolygon[np].Y);

       if XIntersection < P.X then Inc(ToTheLeftofPoint);
       if XIntersection > P.X then Inc(ToTheRightofPoint);
     end;
   end;

   if (ToTheLeftofPoint mod 2 = 1) and (ToTheRightofPoint mod 2 = 1) then Result := True
   else
     Result := False;
 end; {PtInRgn}

procedure TForm1.GetPerekrestok(araion:Integer);
var
  I,J: Integer;
  mo, mo1:TMapObject;
  OnLine1, OnLine2 :boolean;
  kPoint: TKnot;
begin
  for I := 0 to lbItems.Items.Count - 1 do
  begin
    mo := lbItems.Items.Objects[i] as TMapObject;
    if mo is TMapPoint then
      Continue;
    for J := 0 to lbItems.Items.Count - 1 do
    begin
      if (j=i) then
        Continue;
      mo1 :=  lbItems.Items.Objects[j] as TMapObject;
      if mo1 is TMapPoint then
        Continue;
      if (mo<>nil) and (mo1 <>nil) then
      begin
        if (ObjLineCrossLine(mo.ObjPoint1, mo.ObjPoint3, mo1.ObjPoint1, mo1.ObjPoint3, kPoint, OnLine1, OnLine2)) then
        begin
          if (OnLine1 or OnLine2) then
          begin
            lbPerekrestok.Items.Add(lbItems.Items[i]+' '+ lbItems.Items[j]);
            with qPerekrestok do
            begin
              //:PRAION, :PMAPNAME1, :PMAPNAME2
              SetVariable('PRAION', araion);
              SetVariable('PMAPNAME1', lbItems.Items[i]);
              SetVariable('PMAPNAME2', lbItems.Items[j]);
              Execute;
              Session.Commit;
            end;
          end;
        end;
      end;
    end;
  end;
  //lbPerekrestok
end;


end.
